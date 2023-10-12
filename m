Return-Path: <linux-usb+bounces-1530-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A57887C766A
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 21:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB3E21C2101F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 19:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D61D38BC2;
	Thu, 12 Oct 2023 19:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9753A63B4
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 19:10:15 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 23F8EB7
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 12:10:12 -0700 (PDT)
Received: (qmail 12438 invoked by uid 1000); 12 Oct 2023 15:10:11 -0400
Date: Thu, 12 Oct 2023 15:10:11 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Douglas Gilbert <dgilbert@interlog.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: device present in lsusb, disappears in lsusb -t
Message-ID: <30288fa6-105a-4c4b-84c4-750fe083ee85@rowland.harvard.edu>
References: <70c563f1-847c-32a1-cf4d-6bf9802017ab@interlog.com>
 <2023091638-duration-barcode-73a3@gregkh>
 <11b1687f-3419-4037-845e-ef33d4e3871f@interlog.com>
 <2023101139-puma-fanfare-8a0e@gregkh>
 <299d927f-7044-4d48-b6cd-c05bdb0e7fcc@rowland.harvard.edu>
 <0c2a2a23-28dd-4c83-b7af-d5421501e411@interlog.com>
 <2023101203-marine-chatter-692e@gregkh>
 <723ee63c-1eb6-490d-9327-2856601573f7@interlog.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <723ee63c-1eb6-490d-9327-2856601573f7@interlog.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 12, 2023 at 10:38:31AM -0400, Douglas Gilbert wrote:
> On 2023-10-12 08:50, Greg KH wrote:
> > I've pushed all of the remaining pending changes for usbutils to the
> > repo, and added a few of my own that makes the 'lsusb -t' output a bit
> > more sane (sorted order, proper digit field width, etc.)
> > 
> > Can you try the latest version in github (or on kernel.org, they are
> > mirrors) and show the output there?
> 
> Removed the Lenovo dock [40AN] to lessen the clutter.
> 
> 
>   ~/usbutils$ ./lsusb
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 003 Device 002: ID 06cb:00f9 Synaptics, Inc.
> Bus 003 Device 003: ID 5986:1177 Acer, Inc Integrated Camera
> Bus 003 Device 004: ID 046d:c52b Logitech, Inc. Unifying Receiver
> Bus 003 Device 005: ID 8087:0033 Intel Corp.
> Bus 003 Device 012: ID 0483:572b STMicroelectronics STEVAL-USBC2DP Type-C to
> DisplayPort adapter
> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> 
>   ~/usbutils$ ./lsusb -tv
> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/1p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/3p, 20000M/x2
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
> /:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/12p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
>     |__ Port 003: Dev 002, If 0, Class=Vendor Specific Class, Driver=, 12M
>         ID 06cb:00f9 Synaptics, Inc.
>     |__ Port 004: Dev 003, If 0, Class=Video, Driver=uvcvideo, 480M
>         ID 5986:1177 Acer, Inc
>     |__ Port 004: Dev 003, If 1, Class=Video, Driver=uvcvideo, 480M
>         ID 5986:1177 Acer, Inc
>     |__ Port 004: Dev 003, If 2, Class=Application Specific Interface,
> Driver=, 480M
>         ID 5986:1177 Acer, Inc
>     |__ Port 007: Dev 004, If 0, Class=Human Interface Device, Driver=usbhid, 12M
>         ID 046d:c52b Logitech, Inc. Unifying Receiver
>     |__ Port 007: Dev 004, If 1, Class=Human Interface Device, Driver=usbhid, 12M
>         ID 046d:c52b Logitech, Inc. Unifying Receiver
>     |__ Port 007: Dev 004, If 2, Class=Human Interface Device, Driver=usbhid, 12M
>         ID 046d:c52b Logitech, Inc. Unifying Receiver
>     |__ Port 010: Dev 005, If 0, Class=Wireless, Driver=btusb, 12M
>         ID 8087:0033 Intel Corp.
>     |__ Port 010: Dev 005, If 1, Class=Wireless, Driver=btusb, 12M
>         ID 8087:0033 Intel Corp.
> /:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 10000M
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
> 
> 
> So ID 0483:572b (ST Micro DP dongle) still missing in the 'lsusb -t' output.

Your dongle is an unusual USB device, in that it has no interfaces.  
That's why nothing shows up in the lsusb -t output.

Try applying the patch below.

Alan Stern



 lsusb-t.c |   14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

Index: usbutils-master/lsusb-t.c
===================================================================
--- usbutils-master.orig/lsusb-t.c
+++ usbutils-master/lsusb-t.c
@@ -183,9 +183,12 @@ static void print_usbdevice(struct usbde
 	char lanes[32];
 
 	lanes_to_str(lanes, d->tx_lanes, d->rx_lanes);
-	get_class_string(subcls, sizeof(subcls), i->bInterfaceClass);
+	if (i)
+		get_class_string(subcls, sizeof(subcls), i->bInterfaceClass);
 
-	if (i->bInterfaceClass == 9)
+	if (!i)
+		printf("Port %03u: Dev %03u, %sM%s\n", d->portnum, d->devnum, d->speed, lanes);
+	else if (i->bInterfaceClass == 9)
 		printf("Port %03u: Dev %03u, If %u, Class=%s, Driver=%s/%up, %sM%s\n", d->portnum, d->devnum, i->ifnum, subcls,
 		       i->driver, d->maxchild, d->speed, lanes);
 	else
@@ -690,11 +693,12 @@ static void sort_busses(void)
 static void print_tree_dev_interface(struct usbdevice *d, struct usbinterface *i)
 {
 	indent += 3;
-	while (i) {
+	do {
 		printf(" %*s", indent, "|__ ");
 		print_usbdevice(d, i);
-		i = i->next;
-	}
+		if (i)
+			i = i->next;
+	} while (i);
 	indent -= 3;
 }
 static void print_tree_dev_children(struct usbdevice *d)


