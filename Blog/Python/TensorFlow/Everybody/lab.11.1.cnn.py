import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt


image = np.array([[ [ [1], [2], [3] ],
                    [ [4], [5], [6] ],
                    [ [7], [8], [9] ] ]], dtype=np.float32)
# weight = tf.constant([ [ [[1.]], [[1.]] ],
#                        [ [[1.]], [[1.]] ] ])
weight = tf.constant([ [ [[1., 10., -1.]], [[1., 10., -1.]] ],
                       [ [[1., 10., -1.]], [[1., 10., -1.]] ] ])
conv2d = tf.nn.conv2d(image, weight, strides=[1,1,1,1], padding='SAME')

pool = tf.nn.max_pool(image, ksize=[1, 2, 2, 1], strides=[1, 1, 1, 1], padding='SAME')

conv2d_img = np.swapaxes(conv2d)

#
# num_input = 784
# nb_classes = 10 # 0 ~ 9 digits
# l1 = 512
# l2 = 512
# l3 = 512
# l4 = 512
#
#
# X = tf.placeholder(tf.float32, [None, num_input]) # 28 * 28 = 784
# Y = tf.placeholder(tf.float32, [None, nb_classes])
# keep_prob = tf.placeholder(tf.float32)
#
# W1 = tf.get_variable("W1", shape=[num_input, l1], initializer=tf.contrib.layers.xavier_initializer())
# b1 = tf.Variable(tf.random_normal([l1]), name="bias1")
# L1 = tf.nn.relu(tf.matmul(X, W1) + b1)
# L1 = tf.nn.dropout(L1, keep_prob=keep_prob)
#
# W2 = tf.get_variable("W2", shape=[l1, l2], initializer=tf.contrib.layers.xavier_initializer())
# b2 = tf.Variable(tf.random_normal([l2]), name="bias2")
# L2 = tf.nn.relu(tf.matmul(L1, W2) + b2)
# L2 = tf.nn.dropout(L2, keep_prob=keep_prob)
#
# W3 = tf.get_variable("W3", shape=[l2, l3], initializer=tf.contrib.layers.xavier_initializer())
# b3 = tf.Variable(tf.random_normal([l3]), name="bias3")
# L3 = tf.nn.relu(tf.matmul(L2, W3) + b3)
# L3 = tf.nn.dropout(L3, keep_prob=keep_prob)
#
# W4 = tf.get_variable("W4", shape=[l3, l4], initializer=tf.contrib.layers.xavier_initializer())
# b4 = tf.Variable(tf.random_normal([l4]), name="bias4")
# L4 = tf.nn.relu(tf.matmul(L3, W4) + b4)
# L4 = tf.nn.dropout(L4, keep_prob=keep_prob)
#
# W5 = tf.get_variable("W5", shape=[l4, nb_classes], initializer=tf.contrib.layers.xavier_initializer())
# b5 = tf.Variable(tf.random_normal([nb_classes]), name="bias5")
# hypothesis = tf.matmul(L4, W5) + b5
#
# # Softmax
# #hypothesis = tf.nn.softmax(tf.matmul(X, W) + b)ç
# cost = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(logits=hypothesis, labels=Y))
# optimizer = tf.train.AdamOptimizer(learning_rate=0.001).minimize(cost)
#
# # Test model
# is_correct = tf.equal(tf.argmax(hypothesis, 1), tf.argmax(Y, 1))
# accuracy = tf.reduce_mean(tf.cast(is_correct, tf.float32))
#
# # training parameters
# training_epochs = 20
# batch_size = 100
#
# with tf.Session() as sess:
#     sess.run(tf.global_variables_initializer())
#
#     for epoch in range(training_epochs):
#         avg_cost = 0
#         total_batch = int(mnist.train.num_examples / batch_size)
#
#         for i in range(total_batch):
#             batch_xs, batch_ys = mnist.train.next_batch(batch_size)
#             c, _ = sess.run([cost, optimizer], feed_dict={X: batch_xs, Y: batch_ys, keep_prob: 0.7})
#             avg_cost += c / total_batch
#
#         print("Epoch: ", epoch + 1, 'cost = ', avg_cost)
#
#     print("Accuracy: ", accuracy.eval(session=sess, feed_dict={X: mnist.test.images, Y: mnist.test.labels, keep_prob: 1}))
