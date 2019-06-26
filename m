Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D0656D08
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2019 17:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfFZPB5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jun 2019 11:01:57 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53155 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfFZPB5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jun 2019 11:01:57 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hg9Qm-0006pq-2o; Wed, 26 Jun 2019 17:01:52 +0200
Message-ID: <1561561310.4870.7.camel@pengutronix.de>
Subject: Re: Not enough bandwidth with Magewell XI100DUSB-HDMI
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Curt Meyers <cmeyers@fb.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-usb <linux-usb@vger.kernel.org>, kernel@pengutronix.de,
        Philipp Zabel <philipp.zabel@gmail.com>,
        "Xing, Zhengjun" <zhengjun.xing@linux.intel.com>
Date:   Wed, 26 Jun 2019 17:01:50 +0200
In-Reply-To: <1561387203.6134.6.camel@pengutronix.de>
References: <20180117174638.7e1b375d@litschi.hi.pengutronix.de>
         <0cb1a3e6-7a34-0357-95f6-f0615defbe1b@linux.intel.com>
         <20180119141022.2f18a677@litschi.hi.pengutronix.de>
         <CA+gwMce-h9LPCv1hhfEcRz_2w9mEQLOjy42dcjvPxTeawSU5kQ@mail.gmail.com>
         <6abe2cfe-8752-ca4a-e5a7-6da4fd787c0b@linux.intel.com>
         <20180216142835.2bcb30b5@litschi.hi.pengutronix.de>
         <89c974c8-8baf-8cbd-ab26-df8ae0d4066f@linux.intel.com>
         <20180409102129.6be79e46@litschi.hi.pengutronix.de>
         <31257288-a0eb-3893-8ef9-325d68663f9b@linux.intel.com>
         <20180515112251.51392d42@litschi.hi.pengutronix.de>
         <87b24b29-c3a2-05e6-c2d6-2c3b5e70b950@linux.intel.com>
         <d3fe8187-6806-90b4-582b-49087b72aad5@fb.com>
         <1561387203.6134.6.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2019-06-24 at 16:40 +0200, Philipp Zabel wrote:
> Hi,
> 
> On Mon, 2018-05-21 at 15:03 -0700, Curt Meyers wrote:
> > On 05/16/2018 04:55 AM, Mathias Nyman wrote:
> > > On 15.05.2018 12:22, Michael Tretter wrote:
> > > > Hi Mathias,
> > > > 
> > > > On Tue, 10 Apr 2018 18:22:03 +0300, Mathias Nyman wrote:
> > > > > On 09.04.2018 11:21, Michael Tretter wrote:
> > > > > > On Tue, 20 Feb 2018 15:29:28 +0200, Mathias Nyman wrote:
> > > > > > > On 16.02.2018 15:28, Michael Tretter wrote:
> > > > > > > > On Mon, 29 Jan 2018 14:02:57 +0200, Mathias Nyman wrote:
> > > > > > > > > On 19.01.2018 22:12, Philipp Zabel wrote:
> > > > > > > > > > On Fri, Jan 19, 2018 at 2:10 PM, Michael Tretter
> > > > > > > > > > <m.tretter@pengutronix.de> wrote:
> > > > > > > > > > > I found the old thread and it sounds exactly like my issue. 
> > > > > > > > > > > Different
> > > > > > > > > > > camera, but same xHCI controller.
> > > > > > > > > > 
> > > > > > > > > > I have exactly the same issue with the xHCI controller of my 
> > > > > > > > > > laptop and
> > > > > > > > > > "Oculus Sensor" USB3 isochronous mostly-UVC cameras:
> > > > > > > > > > 
> > > > > > > > > > 00:14.0 USB controller: Intel Corporation Wildcat Point-LP USB 
> > > > > > > > > > xHCI
> > > > > > > > > > Controller (rev 03) (prog-if 30 [XHCI])
> > > > > > > > > >         Subsystem: Lenovo Wildcat Point-LP USB xHCI Controller
> > > > > > > > > >         Flags: bus master, medium devsel, latency 0, IRQ 44
> > > > > > > > > >         Memory at f2220000 (64-bit, non-prefetchable) [size=64K]
> > > > > > > > > >         Capabilities: [70] Power Management version 2
> > > > > > > > > >         Capabilities: [80] MSI: Enable+ Count=1/8 Maskable- 64bit+
> > > > > > > > > >         Kernel driver in use: xhci_hcd
> > > > > > > > > >         Kernel modules: xhci_pci
> > > > > > > > > > 
> > > > > > > > > > T:  Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  4 Spd=5000 MxCh= 0
> > > > > > > > > > D:  Ver= 3.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS= 9 #Cfgs=  1
> > > > > > > > > > P:  Vendor=2833 ProdID=0211 Rev= 0.00
> > > > > > > > > > S:  Manufacturer=Oculus VR
> > > > > > > > > > S:  Product=Rift Sensor
> > > > > > > > > > S:  SerialNumber=WMTD3034300BCT
> > > > > > > > > > C:* #Ifs= 2 Cfg#= 1 Atr=80 MxPwr=800mA
> > > > > > > > > > A:  FirstIf#= 0 IfCount= 2 Cls=ff(vend.) Sub=03 Prot=00
> > > > > > > > > > I:* If#= 0 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=01 Prot=00 
> > > > > > > > > > Driver=uvcvideo
> > > > > > > > > > E:  Ad=83(I) Atr=03(Int.) MxPS=  32 Ivl=128ms
> > > > > > > > > > I:* If#= 1 Alt= 0 #EPs= 0 Cls=ff(vend.) Sub=02 Prot=00 
> > > > > > > > > > Driver=uvcvideo
> > > > > > > > > > I:  If#= 1 Alt= 1 #EPs= 1 Cls=ff(vend.) Sub=02 Prot=00 
> > > > > > > > > > Driver=uvcvideo
> > > > > > > > > > E:  Ad=81(I) Atr=05(Isoc) MxPS=1024 Ivl=125us
> > > > > > > > > > I:  If#= 1 Alt= 2 #EPs= 1 Cls=ff(vend.) Sub=02 Prot=00 
> > > > > > > > > > Driver=uvcvideo
> > > > > > > > > > E:  Ad=81(I) Atr=05(Isoc) MxPS=1024 Ivl=125us
> > > > > > > > > > 
> > > > > > > > > > Any USB2 or USB3 device that I plug in while the first camera 
> > > > > > > > > > is streaming in
> > > > > > > > > > altsetting 1 or 2 causes the bandwidth error. The same happens 
> > > > > > > > > > when I try to
> > > > > > > > > > change the altsetting on an isochronous endpoint of an already 
> > > > > > > > > > plugged device.
> > > > > > > > > > While the camera is in altsetting 0, other devices can be 
> > > > > > > > > > probed and work.
> > > > > > > > > > > For some tests, I changed the xhci_change_max_exit_latency() 
> > > > > > > > > > > function
> > > > > > > > > > > to ignore the requested MEL and set the MEL to 0. Now the USB 
> > > > > > > > > > > devices
> > > > > > > > > > > are detected correctly.
> > > > > > > > > > 
> > > > > > > > > > Exactly the same thing helps here, as well. With this hack, 
> > > > > > > > > > streaming from two
> > > > > > > > > > of those cameras at the same time works without any apparent 
> > > > > > > > > > problem:
> > > > > > > > > > 
> > > > > > > > > > ----------8<----------
> > > > > > > > > > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > > > > > > > > > index 297536c9fd00..3cb4a60d8822 100644
> > > > > > > > > > --- a/drivers/usb/host/xhci.c
> > > > > > > > > > +++ b/drivers/usb/host/xhci.c
> > > > > > > > > > @@ -4025,7 +4025,7 @@ static int __maybe_unused
> > > > > > > > > > xhci_change_max_exit_latency(struct xhci_hcd *xhci,
> > > > > > > > > >             ctrl_ctx->add_flags |= cpu_to_le32(SLOT_FLAG);
> > > > > > > > > >             slot_ctx = xhci_get_slot_ctx(xhci, command->in_ctx);
> > > > > > > > > >             slot_ctx->dev_info2 &= cpu_to_le32(~((u32) MAX_EXIT));
> > > > > > > > > > -       slot_ctx->dev_info2 |= cpu_to_le32(max_exit_latency);
> > > > > > > > > > +       slot_ctx->dev_info2 |= cpu_to_le32(0);
> > > > > > > > > >             slot_ctx->dev_state = 0;
> > > > > > > > > > 
> > > > > > > > > >             xhci_dbg_trace(xhci, trace_xhci_dbg_context_change,
> > > > > > > > > > ---------->8----------
> > > > > > > > > 
> > > > > > > > > Ok, back after a week on sickleave.
> > > > > > > > > I'm getting the magewell capture device and try to reproduce 
> > > > > > > > > this myself.
> > > > > > > > 
> > > > > > > > I don't think that the issue is specific to the magewell capture
> > > > > > > > device, but rather should be reproducible with any USB3 device with
> > > > > > > > isochronous endpoints.
> > > > > > > > 
> > > > > > > > Anyway, please tell me, if I can somehow help you to get this 
> > > > > > > > properly
> > > > > > > > fixed.
> > > > > > > 
> > > > > > > I'm currently looking at device reset issues after suspend, but 
> > > > > > > this is on the
> > > > > > > todo list.
> > > > > > > 
> > > > > > > I got a magewell device, (haven't unboxed it yet)
> > > > > > > Maybe step by step instructions to reproduce it could speed things 
> > > > > > > up.
> > > > > > 
> > > > > > Did you have time to unbox and test the Magewell device?
> > > > > 
> > > > > This seems to always get postponed due to other work,
> > > > > 
> > > > > I just tried it out once today on a nearby laptop, gst-launch seems 
> > > > > to work
> > > > > but couldn't reproduce the bandwidth issue when connecting a second 
> > > > > usb device.
> > > > > 
> > > > > But I haven't really tested it out properly yet.
> > > > 
> > > > I just tested with 4.17-rc5 and the behavior remains the same. Is there
> > > > anything else I could do to get this fixed?
> > > > 
> > > 
> > > Briefed Zhengjun about this issue, one more brain on it.
> > > Adding him to the thread.
> > > 
> > 
> > Isochronous has been a problem for me for 2 years. I am using a rare 3D 
> > stereo camera from Etron and had Isochronous problems and recently I 
> > have discovered that the Logitech Brio also has what appears to be the 
> > same issue. The Logitech Brio is the first Logitech USB3 camera that 
> > uses Isochronous mode and you can do a search and find that linux users 
> > are having problems with it.
> 
> The Oculus Sensor devices contain Etron controllers as well (eSP770).
> 
> > My suggestion would be for the USB3 team to order several Logitech Brio 
> > cameras and debug the Isochronous problems. My company paid for someone 
> > to try and debug the problem and we came up with a patch that we sent to 
> > Mathias but it was not accepted because the change was not well 
> > understood. I can probably buy cameras for Mathias if he is interested, 
> > you only need 2 to get started, would like to see 5 or more running 
> > simultaneously.
> > 
> > The people at Etron also discovered that if you plug Isochronous cameras 
> > into a hub with a Genesys Logic - GL3520 controller then it for some 
> > reason masks the problem and allows multiple cameras to work. 
> > Unfortunately this USB hub is extremely rare and I only found it in this 
> > StarTech ST7300USBME hub. Also it doesn't work flawlessly but I have 
> > tested it with 5 cameras.
> > 
> > My all Intel motherboard and chipset machines work perfect with MS 
> > Windows but not with Linux so it is hard to blame the hardware.
> 
> Does anybody have new information about this issue? I tested last week
> on v5.2-rc5, and the issue still persists unchanged (and forcing MEL=0
> still helps).
> 
> regards
> Philipp

FTR, Michael pointed out that 0472bf06c6fd ("xhci: Prevent U1/U2 link pm
states if exit latency is too long") solves the problem for him, but in
my case the ESIT < MEL checks do not trigger:

----------8<----------
From: Philipp Zabel <philipp.zabel@gmail.com>
Subject: [PATCH] HACK: usb: xhci: always set MEL to 0

This allows to stream from multiple Oculus Sensors simultaneously on a
Lenovo T450s.

Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
---
Jun 26 08:24:25 ped kernel: usb 2-2: new SuperSpeed Gen 1 USB device number 3 using xhci_hcd
Jun 26 08:24:26 ped kernel: usb 2-2: New USB device found, idVendor=2833, idProduct=0211, bcdDevice= 0.00
Jun 26 08:24:26 ped kernel: usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
Jun 26 08:24:26 ped kernel: usb 2-2: Product: Rift Sensor
Jun 26 08:24:26 ped kernel: usb 2-2: Manufacturer: Oculus VR
Jun 26 08:24:26 ped kernel: usb 2-2: SerialNumber: WMTD3034300BCT
Jun 26 08:24:26 ped kernel: uvcvideo: Found UVC 1.00 device Rift Sensor (2833:0211)
Jun 26 08:24:26 ped kernel: xhci_hcd 0000:00:14.0: add ep 0x83, slot id 5, new drop flags = 0x0, new add flags = 0x80
Jun 26 08:24:26 ped kernel: xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev 00000000919e8856
Jun 26 08:24:26 ped kernel: usb 2-2: xhci_calculate_u1_timeout: service interval = 128000000
Jun 26 08:24:26 ped kernel: usb 2-2: xhci_calculate_u1_timeout: max exit latency = 10000
Jun 26 08:24:26 ped kernel: usb 2-2: Hub-initiated U1 disabled due to long timeout 134400 ms
Jun 26 08:24:26 ped kernel: usb 2-2: xhci_change_max_exit_latency: MEL = 10 µs, but using 0
Jun 26 08:24:26 ped kernel: usb 2-2: xhci_calculate_u2_timeout: service interval = 128000000
Jun 26 08:24:26 ped kernel: usb 2-2: xhci_calculate_u2_timeout: max exit latency = 512000
Jun 26 08:24:26 ped kernel: usb 2-2: Hub-initiated U2 disabled due to long timeout 500 ms
Jun 26 08:24:26 ped kernel: usb 2-2: xhci_change_max_exit_latency: MEL = 512 µs, but using 0
---
 drivers/usb/host/xhci.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 3f79f35d0b19..ef26285eb7a6 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4212,7 +4212,9 @@ static int __maybe_unused xhci_change_max_exit_latency(struct xhci_hcd *xhci,
 	ctrl_ctx->add_flags |= cpu_to_le32(SLOT_FLAG);
 	slot_ctx = xhci_get_slot_ctx(xhci, command->in_ctx);
 	slot_ctx->dev_info2 &= cpu_to_le32(~((u32) MAX_EXIT));
-	slot_ctx->dev_info2 |= cpu_to_le32(max_exit_latency);
+	dev_dbg(&udev->dev, "%s: MEL = %u µs, but using 0\n", __func__,
+		max_exit_latency);
+	slot_ctx->dev_info2 |= cpu_to_le32(0);
 	slot_ctx->dev_state = 0;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_context_change,
@@ -4549,6 +4551,10 @@ static u16 xhci_calculate_u1_timeout(struct xhci_hcd *xhci,
 
 	/* Prevent U1 if service interval is shorter than U1 exit latency */
 	if (usb_endpoint_xfer_int(desc) || usb_endpoint_xfer_isoc(desc)) {
+		dev_dbg(&udev->dev, "%s: service interval = %lu\n", __func__,
+			(unsigned long)xhci_service_interval_to_ns(desc));
+		dev_dbg(&udev->dev, "%s: max exit latency = %lu\n", __func__,
+			(unsigned long)udev->u1_params.mel);
 		if (xhci_service_interval_to_ns(desc) <= udev->u1_params.mel) {
 			dev_dbg(&udev->dev, "Disable U1, ESIT shorter than exit latency\n");
 			return USB3_LPM_DISABLED;
@@ -4613,6 +4619,10 @@ static u16 xhci_calculate_u2_timeout(struct xhci_hcd *xhci,
 
 	/* Prevent U2 if service interval is shorter than U2 exit latency */
 	if (usb_endpoint_xfer_int(desc) || usb_endpoint_xfer_isoc(desc)) {
+		dev_dbg(&udev->dev, "%s: service interval = %lu\n", __func__,
+			(unsigned long)xhci_service_interval_to_ns(desc));
+		dev_dbg(&udev->dev, "%s: max exit latency = %lu\n", __func__,
+			(unsigned long)udev->u2_params.mel);
 		if (xhci_service_interval_to_ns(desc) <= udev->u2_params.mel) {
 			dev_dbg(&udev->dev, "Disable U2, ESIT shorter than exit latency\n");
 			return USB3_LPM_DISABLED;
-- 
2.20.1
---------->8----------

regards
Philipp
