Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3F517372
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 10:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbfEHIQk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 May 2019 04:16:40 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:10845 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfEHIQj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 May 2019 04:16:39 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd290420000>; Wed, 08 May 2019 01:16:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 08 May 2019 01:16:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 08 May 2019 01:16:37 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 May
 2019 08:16:37 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 8 May 2019 08:16:37 +0000
Received: from ubuntu.nvidia.com (Not Verified[10.19.108.121]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cd290640003>; Wed, 08 May 2019 01:16:37 -0700
From:   EJ Hsu <ejh@nvidia.com>
To:     <balbi@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <ejh@nvidia.com>
Subject: [V2] usb: gadget: storage: Remove warning message
Date:   Wed, 8 May 2019 16:16:24 +0800
Message-ID: <1557303384-69873-1-git-send-email-ejh@nvidia.com>
X-Mailer: git-send-email 2.1.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557303362; bh=FNdqLM/ewfjWxA8v8p2DwRO8eHQjiwkCg498erUlxWo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=JPBAgZ5RLY36heJ9as7v+TufA2P8X/1CU0MnNLgCpntu7kkQYW2IEhxKAmAKN+S/J
         QSpa+FKKOrm20XrjADtdR6UiiATYuhKFzf+YR9HBIr4CVsS777cZtiFKJl9K/Zt67e
         YbCL6qD0qxPgAxNjd9Bx96rCKbkEeWmhihmV92XVTtHzrv2myusyDqQuv2B+nsFAju
         LCp1bb4jkbl0/McgLCgs9YOcsXXlq3eond2Sr5MZ4OC3Mh+XEkD/LvjRA1CQ4mcCYQ
         1ZW98vXwng06fbIBAH7igiSp6zoGydr4AQ8PBxUDcFa7TigDnMzbUUaL6xAf+ZQort
         dyQMLKHYgyVoA==
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
v2: remove the copyright info
---
 drivers/usb/gadget/function/f_mass_storage.c | 17 ++++++++++++++---
 drivers/usb/gadget/function/storage_common.h |  1 +
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 043f97a..ba1d827 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -2294,7 +2294,7 @@ static void fsg_disable(struct usb_function *f)
 {
 	struct fsg_dev *fsg = fsg_from_func(f);
 	fsg->common->new_fsg = NULL;
-	raise_exception(fsg->common, FSG_STATE_CONFIG_CHANGE);
+	raise_exception(fsg->common, FSG_STATE_DISCONNECT);
 }
 
 
@@ -2307,6 +2307,7 @@ static void handle_exception(struct fsg_common *common)
 	enum fsg_state		old_state;
 	struct fsg_lun		*curlun;
 	unsigned int		exception_req_tag;
+	struct fsg_dev		*fsg;
 
 	/*
 	 * Clear the existing signals.  Anything but SIGUSR1 is converted
@@ -2413,9 +2414,19 @@ static void handle_exception(struct fsg_common *common)
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
index e5e3a25..12687f7 100644
--- a/drivers/usb/gadget/function/storage_common.h
+++ b/drivers/usb/gadget/function/storage_common.h
@@ -161,6 +161,7 @@ enum fsg_state {
 	FSG_STATE_ABORT_BULK_OUT,
 	FSG_STATE_PROTOCOL_RESET,
 	FSG_STATE_CONFIG_CHANGE,
+	FSG_STATE_DISCONNECT,
 	FSG_STATE_EXIT,
 	FSG_STATE_TERMINATED
 };
-- 
2.1.4

