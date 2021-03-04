Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEE232D69D
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 16:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234807AbhCDP0s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 10:26:48 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:62167 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234338AbhCDP0Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Mar 2021 10:26:25 -0500
Received: from fsav302.sakura.ne.jp (fsav302.sakura.ne.jp [153.120.85.133])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 124FP2Ot030921;
        Fri, 5 Mar 2021 00:25:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav302.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp);
 Fri, 05 Mar 2021 00:25:02 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 124FOtn6030882
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Mar 2021 00:25:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH v4 06/12] usb: usbip: fix error handling of kthread_get_run()
Date:   Fri,  5 Mar 2021 00:24:49 +0900
Message-Id: <20210304152455.3685-7-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
References: <df337d16-2a6e-f671-7134-449d7da6a9cb@linuxfoundation.org>
 <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot is reporting an ERR_PTR(-EINTR) pointer dereference at
vhci_shutdown_connection() [1], for kthread_create() became killable due
to commit 786235eeba0e1e85 ("kthread: make kthread_create() killable").

When SIGKILLed while attach_store() is calling kthread_get_run(),
ERR_PTR(-EINTR) is stored into vdev->ud.tcp_{rx,tx}, and then
kthread_stop_put() is called on vdev->ud.tcp_{rx,tx} from
vhci_shutdown_connection() because vdev->ud.tcp_{rx,tx} != NULL.

Prior to commit 9720b4bc76a83807 ("staging/usbip: convert to kthread"),
"current" pointer is assigned to vdev->ud.tcp_{rx,tx} by usbip_thread()
kernel thread, and hence vdev->ud.tcp_{rx,tx} != NULL means a valid task
pointer.

Therefore, make kthread_get_run() return NULL when kthread_create()
failed. This patch only fixes error pointer dereference problem, for
the code prior to that commit was already providing manual recovery
interface.

[1] https://syzkaller.appspot.com/bug?extid=a93fba6d384346a761e3

Reported-by: syzbot <syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com>
Reported-by: syzbot <syzbot+bf1a360e305ee719e364@syzkaller.appspotmail.com>
Tested-by: syzbot <syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Fixes: 9720b4bc76a83807 ("staging/usbip: convert to kthread")
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/usb/usbip/usbip_common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
index f8e16c75b154..6e2a80b1633d 100644
--- a/drivers/usb/usbip/usbip_common.h
+++ b/drivers/usb/usbip/usbip_common.h
@@ -291,6 +291,8 @@ struct usbip_device {
 	if (!IS_ERR(__k)) {						   \
 		get_task_struct(__k);					   \
 		wake_up_process(__k);					   \
+	} else {							   \
+		__k = NULL;						   \
 	}								   \
 	__k;								   \
 })
-- 
2.18.4

