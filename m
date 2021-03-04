Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D25232D694
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 16:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234510AbhCDP0p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 10:26:45 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:61856 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233113AbhCDP0Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Mar 2021 10:26:16 -0500
Received: from fsav302.sakura.ne.jp (fsav302.sakura.ne.jp [153.120.85.133])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 124FP2pi030926;
        Fri, 5 Mar 2021 00:25:03 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav302.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp);
 Fri, 05 Mar 2021 00:25:02 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 124FOtn7030882
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Mar 2021 00:25:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH v4 07/12] usb: usbip: preallocate kernel threads for consistent attach operation
Date:   Fri,  5 Mar 2021 00:24:50 +0900
Message-Id: <20210304152455.3685-8-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
References: <df337d16-2a6e-f671-7134-449d7da6a9cb@linuxfoundation.org>
 <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

All usbip modules are doing

  (1) socket lookup for ud->tcp_socket
  (2) kthread_create() for ud->tcp_{tx,rx}
  (3) get_task_struct() on ud->tcp_{tx,rx} if kthread_create() succeeded
  (4) wake_up_process() on ud->tcp_{tx,rx} if kthread_create() succeeded

where (1) (2) (3) can be grouped as a common function.

Since we can't overwrite ud->tcp_socket and ud->tcp_{tx,rx} without
checking ud->status, define usbip_thread_info for holding temporary
resources and introduce usbip_prepare_threads()/usbip_unprepare_threads()
which respectively allocates/frees these temporary resources.
(4) is done by usbip_prepare_threads() callers after checking ud->status.

Tested-by: syzbot <syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/usb/usbip/usbip_common.c | 50 ++++++++++++++++++++++++++++++++
 drivers/usb/usbip/usbip_common.h | 12 ++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index 2ab99244bc31..9f677c5a74e8 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -748,6 +748,56 @@ int usbip_recv_xbuff(struct usbip_device *ud, struct urb *urb)
 }
 EXPORT_SYMBOL_GPL(usbip_recv_xbuff);
 
+int usbip_prepare_threads(struct usbip_thread_info *uti,
+			  struct usbip_device *ud, int sockfd,
+			  int (*tx_fn)(void *data), const char *tx_name,
+			  int (*rx_fn)(void *data), const char *rx_name)
+{
+	int err;
+	struct socket *socket;
+	struct task_struct *tx;
+	struct task_struct *rx;
+
+	/* Extract socket from fd. */
+	socket = sockfd_lookup(sockfd, &err);
+	if (!socket)
+		return -EINVAL;
+	/* Create threads for this socket. */
+	rx = kthread_create(rx_fn, ud, rx_name);
+	if (IS_ERR(rx)) {
+		err = PTR_ERR(rx);
+		goto out_socket;
+	}
+	tx = kthread_create(tx_fn, ud, tx_name);
+	if (IS_ERR(tx)) {
+		err = PTR_ERR(tx);
+		goto out_rx;
+	}
+	uti->tcp_socket = socket;
+	get_task_struct(rx);
+	uti->tcp_rx = rx;
+	get_task_struct(tx);
+	uti->tcp_tx = tx;
+	return 0;
+ out_rx:
+	kthread_stop(rx);
+ out_socket:
+	sockfd_put(socket);
+	return err;
+}
+EXPORT_SYMBOL_GPL(usbip_prepare_threads);
+
+void usbip_unprepare_threads(struct usbip_thread_info *uti)
+{
+	kthread_stop_put(uti->tcp_tx);
+	uti->tcp_tx = NULL;
+	kthread_stop_put(uti->tcp_rx);
+	uti->tcp_rx = NULL;
+	sockfd_put(uti->tcp_socket);
+	uti->tcp_socket = NULL;
+}
+EXPORT_SYMBOL_GPL(usbip_unprepare_threads);
+
 static int __init usbip_core_init(void)
 {
 	return usbip_init_eh();
diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
index 6e2a80b1633d..6e5394dba2ec 100644
--- a/drivers/usb/usbip/usbip_common.h
+++ b/drivers/usb/usbip/usbip_common.h
@@ -316,6 +316,18 @@ void usbip_header_correct_endian(struct usbip_header *pdu, int send);
 struct usbip_iso_packet_descriptor*
 usbip_alloc_iso_desc_pdu(struct urb *urb, ssize_t *bufflen);
 
+struct usbip_thread_info {
+	struct socket *tcp_socket;
+	struct task_struct *tcp_tx;
+	struct task_struct *tcp_rx;
+};
+
+int usbip_prepare_threads(struct usbip_thread_info *uti,
+			  struct usbip_device *ud, int sockfd,
+			  int (*tx_fn)(void *data), const char *tx_name,
+			  int (*rx_fn)(void *data), const char *rx_name);
+void usbip_unprepare_threads(struct usbip_thread_info *uti);
+
 /* some members of urb must be substituted before. */
 int usbip_recv_iso(struct usbip_device *ud, struct urb *urb);
 void usbip_pad_iso(struct usbip_device *ud, struct urb *urb);
-- 
2.18.4

