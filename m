Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC4944EC3C
	for <lists+linux-usb@lfdr.de>; Fri, 12 Nov 2021 18:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235546AbhKLRyn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 12:54:43 -0500
Received: from netrider.rowland.org ([192.131.102.5]:55143 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235558AbhKLRym (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Nov 2021 12:54:42 -0500
Received: (qmail 37610 invoked by uid 1000); 12 Nov 2021 12:51:50 -0500
Date:   Fri, 12 Nov 2021 12:51:50 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     DocMAX <mail@vacharakis.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Message-ID: <20211112175150.GA37212@rowland.harvard.edu>
References: <139f5577-4a0c-a073-6320-a2697eddadc6@vacharakis.de>
 <20211112154052.GB32928@rowland.harvard.edu>
 <c9c65f98-b766-f110-26c0-a4187fe7bb8d@vacharakis.de>
 <20211112162316.GC32928@rowland.harvard.edu>
 <bfc48a4a-9648-dee8-20b0-dadfafa508e7@vacharakis.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfc48a4a-9648-dee8-20b0-dadfafa508e7@vacharakis.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 12, 2021 at 05:26:17PM +0100, DocMAX wrote:
> Sure:
> 
> Bus 006 Device 006: ID 2109:0715 VIA Labs, Inc. VL817 SATA Adaptor
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               3.10
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0         9
>   idVendor           0x2109 VIA Labs, Inc.
>   idProduct          0x0715 VL817 SATA Adaptor
>   bcdDevice            6.14
>   iManufacturer           1 VIA Labs,Inc.
>   iProduct                2 USB3.1 SATA Bridge
>   iSerial                 3 0000000000000004

Wow.  Judging by the serial number values, you got the first four
devices of this sort ever made.  (That is, unless they use the same
serial numbers on all of their devices!)

Anyway, the patch below should accomplish the same effect as the
module parameter override you've been using.  Let us know if it works
properly.

Alan Stern



Index: usb-devel/drivers/usb/storage/unusual_devs.h
===================================================================
--- usb-devel.orig/drivers/usb/storage/unusual_devs.h
+++ usb-devel/drivers/usb/storage/unusual_devs.h
@@ -2291,6 +2291,13 @@ UNUSUAL_DEV(  0x2027, 0xa001, 0x0000, 0x
 		USB_SC_DEVICE, USB_PR_DEVICE, usb_stor_euscsi_init,
 		US_FL_SCM_MULT_TARG ),
 
+/* Reported by DocMAX <mail@vacharakis.de> */
+UNUSUAL_DEV( 0x2109, 0x0715, 0x0614, 0x0614,
+		"VIA Labs, Inc.",
+		"VL817 USB3.1 SATA Bridge",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 UNUSUAL_DEV( 0x2116, 0x0320, 0x0001, 0x0001,
 		"ST",
 		"2A",
