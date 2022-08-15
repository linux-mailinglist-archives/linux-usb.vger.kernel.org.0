Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A48E7593153
	for <lists+linux-usb@lfdr.de>; Mon, 15 Aug 2022 17:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiHOPKx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Aug 2022 11:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241804AbiHOPKg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Aug 2022 11:10:36 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id ECF2B13D6E
        for <linux-usb@vger.kernel.org>; Mon, 15 Aug 2022 08:10:34 -0700 (PDT)
Received: (qmail 103944 invoked by uid 1000); 15 Aug 2022 11:10:33 -0400
Date:   Mon, 15 Aug 2022 11:10:33 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Rondreis <linhaoguo86@gmail.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: possible recursive locking detected in kernel v5.18
Message-ID: <Yvph6XfdLXN/6XCQ@rowland.harvard.edu>
References: <CAB7eexKUpvX-JNiLzhXBDWgfg2T9e9_0Tw4HQ6keN==voRbP0g@mail.gmail.com>
 <YvU1HSa6ipoWc4BA@rowland.harvard.edu>
 <CAB7eexK5EcNsSUJVwE0hfZ4bM6qMnsKAZSnz6QGdyFZGwVK3VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB7eexK5EcNsSUJVwE0hfZ4bM6qMnsKAZSnz6QGdyFZGwVK3VQ@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 12, 2022 at 10:56:08AM +0800, Rondreis wrote:
> Hi, after adding the patch, this bug seems unfixed, with the following
> console output: https://pastebin.com/pUUitSJ8
> 
> Alan Stern <stern@rowland.harvard.edu> 于2022年8月12日周五 00:58写道：
> >
> > On Thu, Aug 11, 2022 at 10:06:37AM +0800, Rondreis wrote:
> > > Hello,
> > >
> > > When fuzzing the Linux kernel driver v5.18.0, the following crash was triggered.

> > > It seems that there is a deadlock happened in function usb_stor_post_reset
> > >
> > > The crash report is as follow:
> > >
> > > ```
> > > usb 7-1: r8712u: Loading firmware from "rtlwifi/rtl8712u.bin"
> > > ============================================
> > > WARNING: possible recursive locking detected
> > > 5.18.0 #3 Not tainted
> > > --------------------------------------------
> > > kworker/1:3/1205 is trying to acquire lock:
> > > ffff888018638db8 (&us_interface_key[i]){+.+.}-{3:3}, at:
> > > usb_stor_pre_reset+0x35/0x40 drivers/usb/storage/usb.c:230
> > >
> > > but task is already holding lock:
> > > ffff888018638db8 (&us_interface_key[i]){+.+.}-{3:3}, at:
> > > usb_stor_pre_reset+0x35/0x40 drivers/usb/storage/usb.c:230

Rondreis, can you please try testing the patch below instead of the one 
I sent you last week?

Alan Stern



Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -6048,6 +6048,11 @@ re_enumerate:
  * the reset is over (using their post_reset method).
  *
  * Return: The same as for usb_reset_and_verify_device().
+ * However, if a reset is already in progress (for instance, if a
+ * driver doesn't have pre_ or post_reset() callbacks, and while
+ * being unbound or re-bound during the ongoing reset its disconnect()
+ * or probe() routine tries to perform a second, nested reset), the
+ * routine returns -EINPROGRESS.
  *
  * Note:
  * The caller must own the device lock.  For example, it's safe to use
@@ -6081,6 +6086,10 @@ int usb_reset_device(struct usb_device *
 		return -EISDIR;
 	}
 
+	if (udev->reset_in_progress)
+		return -EINPROGRESS;
+	udev->reset_in_progress = 1;
+
 	port_dev = hub->ports[udev->portnum - 1];
 
 	/*
@@ -6145,6 +6154,7 @@ int usb_reset_device(struct usb_device *
 
 	usb_autosuspend_device(udev);
 	memalloc_noio_restore(noio_flag);
+	udev->reset_in_progress = 0;
 	return ret;
 }
 EXPORT_SYMBOL_GPL(usb_reset_device);
Index: usb-devel/include/linux/usb.h
===================================================================
--- usb-devel.orig/include/linux/usb.h
+++ usb-devel/include/linux/usb.h
@@ -575,6 +575,7 @@ struct usb3_lpm_parameters {
  * @devaddr: device address, XHCI: assigned by HW, others: same as devnum
  * @can_submit: URBs may be submitted
  * @persist_enabled:  USB_PERSIST enabled for this device
+ * @reset_in_progress: the device is being reset
  * @have_langid: whether string_langid is valid
  * @authorized: policy has said we can use it;
  *	(user space) policy determines if we authorize this device to be
@@ -661,6 +662,7 @@ struct usb_device {
 
 	unsigned can_submit:1;
 	unsigned persist_enabled:1;
+	unsigned reset_in_progress:1;
 	unsigned have_langid:1;
 	unsigned authorized:1;
 	unsigned authenticated:1;

