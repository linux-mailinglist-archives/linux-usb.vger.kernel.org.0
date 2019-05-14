Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949681C487
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 10:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfENISz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 04:18:55 -0400
Received: from mga04.intel.com ([192.55.52.120]:63449 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbfENISy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 May 2019 04:18:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 May 2019 01:18:54 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga001.fm.intel.com with ESMTP; 14 May 2019 01:18:53 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     evan@gnarbox.com
Cc:     linux-usb@vger.kernel.org, rob@gnarbox.com
Subject: Re: [BUG REPORT] usb: dwc3: "failed to enable ep0out" when enabling mass storage mode
In-Reply-To: <20190513222517.LT4QsTQlr%evan@gnarbox.com>
References: <20190513222517.LT4QsTQlr%evan@gnarbox.com>
Date:   Tue, 14 May 2019 11:18:52 +0300
Message-ID: <87r291a1oz.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

evan@gnarbox.com writes:

> Hi Felipe,
>
> I'm picking up a bug my coworker Rob touched on in this thread:
> https://marc.info/?l=linux-usb&m=155349928622570&w=2
>
> We occasionally see the following dmesg when enabling mass storage mode:
>
> 	dwc3 dwc3.1.auto: failed to enable ep0out
>
> To reproduce after a clean boot:
>
> 	Enable mass storage mode
> 	Disable mass storage mode
> 	Enable mass storage mode
>
> I don't need to plug any devices, just switch modes.
>
> The error does not happen every boot.  If I don't get the error on that
> second enable, then as far as I can tell I won't get the error at all
> during that boot.
>
> I've attached the trace and regdump.  When capturing these I was running
> a 4.9.115 kernel and using the g_mass_storage driver for simplicity.
> Here is the shell session:
>
> 	root@gnarbox-2:~# echo device > /sys/class/usb_role/intel_xhci_usb_sw-role-switch/role && modprobe g_mass_storage file=/dev/nvme0n1p7 iSerialNumber=90405
> 	[  118.627628] Mass Storage Function, version: 2009/09/11
> 	[  118.633426] LUN: removable file: (no medium)
> 	[  118.638283] LUN: file: /dev/nvme0n1p7
> 	[  118.642397] Number of LUNs=1
> 	[  118.646080] g_mass_storage gadget: Mass Storage Gadget, version: 2009/09/11
> 	[  118.653902] g_mass_storage gadget: g_mass_storage ready
> 	root@gnarbox-2:~# modprobe -r g_mass_storage && echo host > /sys/class/usb_role/intel_xhci_usb_sw-role-switch/role 
> 	root@gnarbox-2:~# echo device > /sys/class/usb_role/intel_xhci_usb_sw-role-switch/role && modprobe g_mass_storage file=/dev/nvme0n1p7 iSerialNumber=90405
> 	[  123.416789] Mass Storage Function, version: 2009/09/11
> 	[  123.422546] LUN: removable file: (no medium)
> 	[  123.427386] LUN: file: /dev/nvme0n1p7
> 	[  123.431531] Number of LUNs=1
> 	[  123.435278] g_mass_storage gadget: Mass Storage Gadget, version: 2009/09/11
> 	[  123.443168] g_mass_storage gadget: g_mass_storage ready
> 	[  123.451998] dwc3 dwc3.1.auto: failed to enable ep0out

When this happens, I see this:

        modprobe-1046  [001] d..1   123.450054: dwc3_gadget_ep_cmd: ep0out: cmd 'Start New Configuration' [9] params 00000000 00000000 00000000 --> status: Successful
        modprobe-1046  [001] d..1   123.451990: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Transfer Resource' [2] params 00000001 00000000 00000000 --> status: Timed Out

Why is that waiting only 1ms? Maybe your platform takes longer,
sometimes, to complete xfer resource allocation?

Try this:

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index d67655384eb2..ad1069fe3b8f 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -270,7 +270,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
 {
 	const struct usb_endpoint_descriptor *desc = dep->endpoint.desc;
 	struct dwc3		*dwc = dep->dwc;
-	u32			timeout = 1000;
+	u32			timeout = 5000;
 	u32			saved_config = 0;
 	u32			reg;
 
Let me know if it helps or not. I guess it's also time to switch this
block of code to readl_poll_timeout_atomic().

-- 
balbi
