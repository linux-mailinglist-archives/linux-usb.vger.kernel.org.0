Return-Path: <linux-usb+bounces-9312-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0598A30F1
	for <lists+linux-usb@lfdr.de>; Fri, 12 Apr 2024 16:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D025E1F24A5E
	for <lists+linux-usb@lfdr.de>; Fri, 12 Apr 2024 14:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0001422BB;
	Fri, 12 Apr 2024 14:40:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 53F0114198A
	for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2024 14:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712932839; cv=none; b=Hyn3iQ97UtUWok1pl2o20j+bC29fD82sUITkC+j9Su68dyMioT8bgBVRsEJ9NBlGzjNWOsk/LgyZug7aGHzz2igJrGLprkUSROmie8o5qybGn2gsIeWRU2pTlKd2GXyxoji/l+7WNDEi3sty1wCdlqoH6HKnd3bB9xRi8ixnQD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712932839; c=relaxed/simple;
	bh=ShGPl1cFxs2KT93wGPWsQ+fVDhsk7CoQz0Ic6PzBBEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXDbw18awErRf9RnwtExIXqsYXU9aJB/48nvT3E1FIFYqCks2UHayLHX3hlLmVsWWO7aRuVNNbsTfmluRe/Em2PtY4i1gD/7Gm4aZ78N4lRx1AeklCsOMOXIHuVrl/Ix1CEV3mJ2oEggO6NP+GdikYD8pi5QmgjiZeIg0KgmI34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 36157 invoked by uid 1000); 12 Apr 2024 10:40:35 -0400
Date: Fri, 12 Apr 2024 10:40:35 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sam Sun <samsun1006219@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
  Greg KH <gregkh@linuxfoundation.org>, swboyd@chromium.org,
  ricardo@marliere.net, hkallweit1@gmail.com, heikki.krogerus@linux.intel.com,
  mathias.nyman@linux.intel.com, royluo@google.com,
  syzkaller-bugs@googlegroups.com, xrivendell7@gmail.com
Subject: Re: [Linux kernel bug] general protection fault in disable_store
Message-ID: <45e246ab-01e8-40b7-8ede-b47957df0d7b@rowland.harvard.edu>
References: <CAEkJfYON+ry7xPx=AiLR9jzUNT+i_Va68ACajOC3HoacOfL1ig@mail.gmail.com>
 <92fe8e95-bc01-4d7d-9678-8cfc55cc4a7b@rowland.harvard.edu>
 <CAEkJfYORHKO16xT3DCS04JFzkquz6oZ5CdC2USJ5-c0WihAMXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEkJfYORHKO16xT3DCS04JFzkquz6oZ5CdC2USJ5-c0WihAMXg@mail.gmail.com>

On Fri, Apr 12, 2024 at 09:08:12PM +0800, Sam Sun wrote:
> Sorry for the mistake I made when debugging this bug. Now I have more
> information about it. Disassembly of function disable_store() in the
> latest upstream kernel is listed below.
> ```
> Dump of assembler code for function disable_store:
>    ...
>    0xffffffff86e907eb <+187>:   lea    -0x8(%r14),%r12
>    0xffffffff86e907ef <+191>:   mov    (%rbx),%rax
>    0xffffffff86e907f2 <+194>:   mov    %rax,0x20(%rsp)
>    0xffffffff86e907f7 <+199>:   lea    -0xa8(%rax),%rdi
>    0xffffffff86e907fe <+206>:   mov    %rdi,0x18(%rsp)
>    0xffffffff86e90803 <+211>:   call   0xffffffff86e20220
> <usb_hub_to_struct_hub>
>    0xffffffff86e90808 <+216>:   mov    %rax,%rbx
>    0xffffffff86e9080b <+219>:   shr    $0x3,%rax
>    0xffffffff86e9080f <+223>:   movabs $0xdffffc0000000000,%rcx
>    0xffffffff86e90819 <+233>:   cmpb   $0x0,(%rax,%rcx,1)
>    0xffffffff86e9081d <+237>:   je     0xffffffff86e90827 <disable_store+247>
>    0xffffffff86e9081f <+239>:   mov    %rbx,%rdi
>    0xffffffff86e90822 <+242>:   call   0xffffffff81eeb0b0
> <__asan_report_load8_noabort>
>    0xffffffff86e90827 <+247>:   lea    0x60(%rsp),%rsi
>    ...
> ```
> The cmpb in disable_store()<+233> is generated by KASAN to check the
> shadow memory status. If equals 0, which means the load 8 is valid,
> pass the KASAN check. However, this time rax is 0, so it first
> triggers general protection fault, since 0xdffffc0000000000 is not a
> valid address. rax contains the return address of function
> usb_hub_to_struct_hub(), in this case is a NULL.
> 
> In function usb_hub_to_struct_hub(), I checked hdev and its sub
> domains, and they are not NULL. Is it possible that
> usb_deauthorized_device() set
> hdev->actconfig->interface[0]->dev.driver_data to NULL? I cannot
> confirm that since every time I try to breakpoint the code it crashes
> differently.

I suspect the usb_hub_to_struct_hub() call is racing with the 
spinlock-protected region in hub_disconnect() (in hub.c).

> If there is any other thing I could help, please let me know.

Try the patch below.  It should eliminate that race, which hopefully 
will fix the problem.

Alan Stern



Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -72,6 +72,9 @@
  * change to USB_STATE_NOTATTACHED even when the semaphore isn't held. */
 static DEFINE_SPINLOCK(device_state_lock);
 
+/* Protect hdev->maxchild and hub's intfdata */
+static DEFINE_SPINLOCK(hub_state_lock);
+
 /* workqueue to process hub events */
 static struct workqueue_struct *hub_wq;
 static void hub_event(struct work_struct *work);
@@ -152,9 +155,13 @@ static inline char *portspeed(struct usb
 /* Note that hdev or one of its children must be locked! */
 struct usb_hub *usb_hub_to_struct_hub(struct usb_device *hdev)
 {
-	if (!hdev || !hdev->actconfig || !hdev->maxchild)
-		return NULL;
-	return usb_get_intfdata(hdev->actconfig->interface[0]);
+	struct usb_hub *hub = NULL;
+
+	spin_lock_irq(&hub_state_lock);
+	if (hdev && hdev->actconfig && hdev->maxchild)
+		hub = usb_get_intfdata(hdev->actconfig->interface[0]);
+	spin_unlock_irq(&hub_state_lock);
+	return hub;
 }
 
 int usb_device_supports_lpm(struct usb_device *udev)
@@ -1714,7 +1721,9 @@ static int hub_configure(struct usb_hub
 			break;
 		}
 	}
+	spin_lock_irq(&hub_state_lock);
 	hdev->maxchild = i;
+	spin_unlock_irq(&hub_state_lock);
 	for (i = 0; i < hdev->maxchild; i++) {
 		struct usb_port *port_dev = hub->ports[i];
 
@@ -1790,9 +1799,11 @@ static void hub_disconnect(struct usb_in
 
 	/* Avoid races with recursively_mark_NOTATTACHED() */
 	spin_lock_irq(&device_state_lock);
+	spin_lock(&hub_state_lock);
 	port1 = hdev->maxchild;
 	hdev->maxchild = 0;
 	usb_set_intfdata(intf, NULL);
+	spin_unlock(&hub_state_lock);
 	spin_unlock_irq(&device_state_lock);
 
 	for (; port1 > 0; --port1)


