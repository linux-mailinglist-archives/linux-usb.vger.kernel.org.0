Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F07310C59
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 15:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhBEOAA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 09:00:00 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:64979 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbhBEN6M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Feb 2021 08:58:12 -0500
Received: from fsav302.sakura.ne.jp (fsav302.sakura.ne.jp [153.120.85.133])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 115Dv9b4037786;
        Fri, 5 Feb 2021 22:57:09 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav302.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp);
 Fri, 05 Feb 2021 22:57:09 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 115Dv4gV037676
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Feb 2021 22:57:09 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>, linux-usb@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] usb: usbip: fix error handling of kthread_get_run()
Date:   Fri,  5 Feb 2021 22:57:06 +0900
Message-Id: <20210205135707.4574-1-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <000000000000414db905b6e9bae8@google.com>
References: <000000000000414db905b6e9bae8@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot is reporting a crash at vhci_shutdown_connection() [1]. It turned
out that it was not a NULL pointer dereference but an ERR_PTR(-EINTR)
pointer dereference, for kthread_create() became killable due to
commit 786235eeba0e1e85 ("kthread: make kthread_create() killable").

When SIGKILLed while attach_store() is calling kthread_get_run(),
ERR_PTR(-EINTR) is stored into vdev->ud.tcp_{rx,tx}, and then
kthread_stop_put() is called on vdev->ud.tcp_{rx,tx} from
vhci_shutdown_connection() because vdev->ud.tcp_{rx,tx} != NULL.

Prior to commit 9720b4bc76a83807 ("staging/usbip: convert to kthread"),
"current" pointer is assigned to vdev->ud.tcp_{rx,tx} by usbip_thread()
kernel thread, and hence vdev->ud.tcp_{rx,tx} != NULL meant a valid task
pointer. Therefore, we should make kthread_get_run() return NULL when
kthread_create() failed.

[1] https://syzkaller.appspot.com/bug?id=c21c07f3d51769405e8efc027bdb927515dcc7d6

Reported-by: syzbot <syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com>
Reported-by: syzbot <syzbot+bf1a360e305ee719e364@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Fixes: 9720b4bc76a83807 ("staging/usbip: convert to kthread")
Cc: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/usbip/usbip_common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
index 8be857a4fa13..a7c68097aa1d 100644
--- a/drivers/usb/usbip/usbip_common.h
+++ b/drivers/usb/usbip/usbip_common.h
@@ -286,6 +286,8 @@ struct usbip_device {
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

