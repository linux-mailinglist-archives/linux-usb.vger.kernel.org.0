Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D07455F43B
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 10:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbfGDIEU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 04:04:20 -0400
Received: from gate.crashing.org ([63.228.1.57]:34406 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726601AbfGDIEU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Jul 2019 04:04:20 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6484C2W028966;
        Thu, 4 Jul 2019 03:04:13 -0500
Message-ID: <074323c563626a462ea5ce42309a04138f8c9b6e.camel@kernel.crashing.org>
Subject: [PATCH] usb: gadget: mass_storage: Fix races between fsg_disable
 and fsg_set_alt
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Date:   Thu, 04 Jul 2019 18:04:12 +1000
In-Reply-To: <f6d0ca0d258fa69fdcd46c04b908ff4ff9205181.camel@kernel.crashing.org>
References: <617c4ba96b9664377c24444e8b82ffa75a8a5357.camel@kernel.crashing.org>
         <f6d0ca0d258fa69fdcd46c04b908ff4ff9205181.camel@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If fsg_disable() and fsg_set_alt() are called too closely to each
other (for example due to a quick reset/reconnect), what can happen
is that fsg_set_alt sets common->new_fsg from an interrupt while
handle_exception is trying to process the config change caused by
fsg_disable():

	fsg_disable()
	...
	handle_exception()
		sets state back to FSG_STATE_NORMAL
		hasn't yet called do_set_interface()
		or is inside it.

 ---> interrupt
	fsg_set_alt
		sets common->new_fsg
		queues a new FSG_STATE_CONFIG_CHANGE
 <---

Now, the first handle_exception can "see" the updated
new_fsg, treats it as if it was a fsg_set_alt() response,
call usb_composite_setup_continue() etc...

But then, the thread sees the second FSG_STATE_CONFIG_CHANGE,
and goes back down the same path, wipes and reattaches a now
active fsg, and .. calls usb_composite_setup_continue() which
at this point is wrong.

Not only we get a backtrace, but I suspect the second set_interface
wrecks some state causing the host to get upset in my case.

This fixes it by using a separate state for "clearing" the fsg
so that new_fsg isn't clobbered, and FSG_STATE_CONFIG_CHANGE
is only ever called for the real thing.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/function/f_mass_storage.c | 13 +++++++------
 drivers/usb/gadget/function/storage_common.h |  1 +
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 043f97ad8f22..72f12bdd0dae 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -2293,8 +2293,7 @@ static int fsg_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 static void fsg_disable(struct usb_function *f)
 {
 	struct fsg_dev *fsg = fsg_from_func(f);
-	fsg->common->new_fsg = NULL;
-	raise_exception(fsg->common, FSG_STATE_CONFIG_CHANGE);
+	raise_exception(fsg->common, FSG_STATE_CONFIG_CLEAR);
 }
 
 
@@ -2412,10 +2411,13 @@ static void handle_exception(struct fsg_common *common)
 		/*			SS_RESET_OCCURRED;  */
 		break;
 
+	case FSG_STATE_CONFIG_CLEAR:
+		do_set_interface(common, NULL);
+		break;
+
 	case FSG_STATE_CONFIG_CHANGE:
 		do_set_interface(common, common->new_fsg);
-		if (common->new_fsg)
-			usb_composite_setup_continue(common->cdev);
+		usb_composite_setup_continue(common->cdev);
 		break;
 
 	case FSG_STATE_EXIT:
@@ -2989,8 +2991,7 @@ static void fsg_unbind(struct usb_configuration *c, struct usb_function *f)
 
 	DBG(fsg, "unbind\n");
 	if (fsg->common->fsg == fsg) {
-		fsg->common->new_fsg = NULL;
-		raise_exception(fsg->common, FSG_STATE_CONFIG_CHANGE);
+		raise_exception(fsg->common, FSG_STATE_CONFIG_CLEAR);
 		/* FIXME: make interruptible or killable somehow? */
 		wait_event(common->fsg_wait, common->fsg != fsg);
 	}
diff --git a/drivers/usb/gadget/function/storage_common.h b/drivers/usb/gadget/function/storage_common.h
index e5e3a2553aaa..5f8cdc08ad85 100644
--- a/drivers/usb/gadget/function/storage_common.h
+++ b/drivers/usb/gadget/function/storage_common.h
@@ -160,6 +160,7 @@ enum fsg_state {
 	FSG_STATE_NORMAL,
 	FSG_STATE_ABORT_BULK_OUT,
 	FSG_STATE_PROTOCOL_RESET,
+	FSG_STATE_CONFIG_CLEAR,
 	FSG_STATE_CONFIG_CHANGE,
 	FSG_STATE_EXIT,
 	FSG_STATE_TERMINATED


