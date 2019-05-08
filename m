Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCA016F71
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 05:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfEHDZR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 23:25:17 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15869 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfEHDZQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 May 2019 23:25:16 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd24bf70000>; Tue, 07 May 2019 20:24:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 07 May 2019 20:25:14 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 07 May 2019 20:25:14 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 May
 2019 03:25:14 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 8 May 2019 03:25:14 +0000
Received: from ubuntu.nvidia.com (Not Verified[10.19.108.121]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cd24c190003>; Tue, 07 May 2019 20:25:14 -0700
From:   EJ Hsu <ejh@nvidia.com>
To:     <balbi@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <ejh@nvidia.com>
Subject: [PATCH] usb: gadget: storage: Remove warning message
Date:   Wed, 8 May 2019 11:24:00 +0800
Message-ID: <1557285840-16958-1-git-send-email-ejh@nvidia.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557285879; bh=PVwnz2XZ/R/P05bcpfdfMGzgw+3i2WNYf5Ewg0MwP1M=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:Content-Type;
        b=sM8S6Zj8ulsNJkfmXul9v5d4cxsGgRUnVc74KtLiEfDQ5Co2bU2UsMC9lBzv9Ya1h
         hz9iLR7nGUrSSczonTylQJfxR0B/XprZSpfV+qmfIqsjT7JWFMyN1E1G5WD2cLFi+/
         NO3siIt+SihVim9EnMrbgUHu2/uMKewysq2rTYGnZYs0az2gsusuBG4aXXu8mKLLWN
         PRsEFwQIaRKRKkvMpbE8qmhZtW/o9/2wo8KytX2Le+rPRRfirRg/5kik1gSUspAOw9
         WYtxQOEc5cAOv0n2wm6zHFBI4d4FgrpB7MlF+jv9nLJiwVOkBCzkFJn7VJmIxW8AD6
         DUpmoY82X4N8g==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This change is to fix below warning message in following scenario:
usb_composite_setup_continue: Unexpected call

When system tried to enter suspend, the fsg_disable() will be called to
disable fsg driver and send a signal to fsg_main_thread. However, at
this point, the fsg_main_thread has already been frozen and can not
respond to this signal. So, this signal will be pended until
fsg_main_thread wakes up.

Once system resumes from suspend, fsg_main_thread will detect a signal
pended and do some corresponding action (in handle_exception()). Then,
host will send some setup requests (get descriptor, set configuration...)
to UDC driver trying to enumerate this device. During the handling of "set
configuration" request, it will try to sync up with fsg_main_thread by
sending a signal (which is the same as the signal sent by fsg_disable)
to it. In a similar manner, once the fsg_main_thread receives this
signal, it will call handle_exception() to handle the request.

However, if the fsg_main_thread wakes up from suspend a little late and
"set configuration" request from Host arrives a little earlier,
fsg_main_thread might come across the request from "set configuration"
when it handles the signal from fsg_disable(). In this case, it will
handle this request as well. So, when fsg_main_thread tries to handle
the signal sent from "set configuration" later, there will nothing left
to do and warning message "Unexpected call" is printed.

Signed-off-by: EJ Hsu <ejh@nvidia.com>
---
 drivers/usb/gadget/function/f_mass_storage.c | 18 +++++++++++++++---
 drivers/usb/gadget/function/storage_common.h |  4 ++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 043f97a..813083f 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2003-2008 Alan Stern
  * Copyright (C) 2009 Samsung Electronics
+ * Copyright (c) 2019, NVIDIA CORPORATION.  All rights reserved.
  *                    Author: Michal Nazarewicz <mina86@mina86.com>
  * All rights reserved.
  *
@@ -2294,7 +2295,7 @@ static void fsg_disable(struct usb_function *f)
 {
 	struct fsg_dev *fsg = fsg_from_func(f);
 	fsg->common->new_fsg = NULL;
-	raise_exception(fsg->common, FSG_STATE_CONFIG_CHANGE);
+	raise_exception(fsg->common, FSG_STATE_DISCONNECT);
 }
 
 
@@ -2307,6 +2308,7 @@ static void handle_exception(struct fsg_common *common)
 	enum fsg_state		old_state;
 	struct fsg_lun		*curlun;
 	unsigned int		exception_req_tag;
+	struct fsg_dev		*fsg;
 
 	/*
 	 * Clear the existing signals.  Anything but SIGUSR1 is converted
@@ -2413,9 +2415,19 @@ static void handle_exception(struct fsg_common *common)
 		break;
 
 	case FSG_STATE_CONFIG_CHANGE:
-		do_set_interface(common, common->new_fsg);
-		if (common->new_fsg)
+		fsg = common->new_fsg;
+		/*
+		 * Add a check here to double confirm if a disconnect event
+		 * occurs and common->new_fsg has been cleared.
+		 */
+		if (fsg) {
+			do_set_interface(common, fsg);
 			usb_composite_setup_continue(common->cdev);
+		}
+		break;
+
+	case FSG_STATE_DISCONNECT:
+		do_set_interface(common, NULL);
 		break;
 
 	case FSG_STATE_EXIT:
diff --git a/drivers/usb/gadget/function/storage_common.h b/drivers/usb/gadget/function/storage_common.h
index e5e3a25..405bf34 100644
--- a/drivers/usb/gadget/function/storage_common.h
+++ b/drivers/usb/gadget/function/storage_common.h
@@ -1,4 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019, NVIDIA CORPORATION.  All rights reserved.
+ */
 #ifndef USB_STORAGE_COMMON_H
 #define USB_STORAGE_COMMON_H
 
@@ -161,6 +164,7 @@ enum fsg_state {
 	FSG_STATE_ABORT_BULK_OUT,
 	FSG_STATE_PROTOCOL_RESET,
 	FSG_STATE_CONFIG_CHANGE,
+	FSG_STATE_DISCONNECT,
 	FSG_STATE_EXIT,
 	FSG_STATE_TERMINATED
 };
-- 
2.1.4


-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
