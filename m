Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56ECA32D69A
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 16:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbhCDP0q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 10:26:46 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:62159 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234323AbhCDP0Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Mar 2021 10:26:24 -0500
Received: from fsav302.sakura.ne.jp (fsav302.sakura.ne.jp [153.120.85.133])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 124FP2gu030903;
        Fri, 5 Mar 2021 00:25:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav302.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp);
 Fri, 05 Mar 2021 00:25:02 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 124FOtn1030882
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Mar 2021 00:25:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH v4 01/12] usb: usbip: introduce usbip_event_mutex for serialization
Date:   Fri,  5 Mar 2021 00:24:44 +0900
Message-Id: <20210304152455.3685-2-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
References: <df337d16-2a6e-f671-7134-449d7da6a9cb@linuxfoundation.org>
 <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot is reporting a NULL pointer dereference [1] because usbip modules
do not use serialization when attaching/detaching. As a preparation for
serializing attach/detach operations, introduce a global mutex, export
it via usbip_event_lock_killable()/usbip_event_unlock(), and use it in
event_handler().

We don't need to use per a device mutex because event_handler() is
processed by a singlethreaded workqueue and ud->tcp_{tx,rx} must not
wait for event_handler() to flush.

[1] https://syzkaller.appspot.com/bug?extid=95ce4b142579611ef0a9

Reported-by: syzbot <syzbot+95ce4b142579611ef0a9@syzkaller.appspotmail.com>
Tested-by: syzbot <syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/usb/usbip/usbip_common.h |  2 ++
 drivers/usb/usbip/usbip_event.c  | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
index a7dd6c66aee5..f8e16c75b154 100644
--- a/drivers/usb/usbip/usbip_common.h
+++ b/drivers/usb/usbip/usbip_common.h
@@ -327,6 +327,8 @@ void usbip_stop_eh(struct usbip_device *ud);
 void usbip_event_add(struct usbip_device *ud, unsigned long event);
 int usbip_event_happened(struct usbip_device *ud);
 int usbip_in_eh(struct task_struct *task);
+int usbip_event_lock_killable(void);
+void usbip_event_unlock(void);
 
 static inline int interface_to_busnum(struct usb_interface *interface)
 {
diff --git a/drivers/usb/usbip/usbip_event.c b/drivers/usb/usbip/usbip_event.c
index 5d88917c9631..e05b858f346d 100644
--- a/drivers/usb/usbip/usbip_event.c
+++ b/drivers/usb/usbip/usbip_event.c
@@ -58,6 +58,19 @@ static struct usbip_device *get_event(void)
 }
 
 static struct task_struct *worker_context;
+static DEFINE_MUTEX(usbip_event_mutex);
+
+int usbip_event_lock_killable(void)
+{
+	return mutex_lock_killable(&usbip_event_mutex);
+}
+EXPORT_SYMBOL_GPL(usbip_event_lock_killable);
+
+void usbip_event_unlock(void)
+{
+	mutex_unlock(&usbip_event_mutex);
+}
+EXPORT_SYMBOL_GPL(usbip_event_unlock);
 
 static void event_handler(struct work_struct *work)
 {
@@ -68,6 +81,7 @@ static void event_handler(struct work_struct *work)
 	}
 
 	while ((ud = get_event()) != NULL) {
+		mutex_lock(&usbip_event_mutex);
 		usbip_dbg_eh("pending event %lx\n", ud->event);
 
 		/*
@@ -91,6 +105,7 @@ static void event_handler(struct work_struct *work)
 			unset_event(ud, USBIP_EH_UNUSABLE);
 		}
 
+		mutex_unlock(&usbip_event_mutex);
 		wake_up(&ud->eh_waitq);
 	}
 }
-- 
2.18.4

