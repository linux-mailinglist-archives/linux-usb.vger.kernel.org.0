Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5740463375D
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 09:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbiKVIpQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 03:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiKVIpP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 03:45:15 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F4F15A20
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 00:45:13 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 50D58240006;
        Tue, 22 Nov 2022 08:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1669106712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=8KTZNpqsSlSOm0TQNFE89faSSTTRrpkzJZJeA8w6c+U=;
        b=m+3+48CGJowCG0cD8VhWsszCfX/ICaBYzq0kBit8pcYf051G/utj3+pRxKJ/T4W6HUBoj5
        lP+dcCdxM+C+iM1QuwKnf++IcyzX6DWhRxyICuEYmpSOLLEBMHYQe+pvb45Mtkshcb1bje
        1SwdOOTiGA3q1UuNznZPw/SSTrJlHWq7atz33sHerKHNsw2pnWwhhk7/j5QwhWrDi6r/Sr
        J/Cz5AQfvfP2D/e81yBh7TUdN1KLOoA45faOdeoL4+AOxr00wqOmUX1FTRheQDgHnX7TlD
        H4eT51ry+CeHx6RYhIBAcdO4R4MEya+HaaJVIBL88Pm1b2Rh9shOB5EOOSl43Q==
Date:   Tue, 22 Nov 2022 09:45:09 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org
Subject: RK3308: ACM serial over USB sporadically not started
Message-ID: <20221122094509.37f99121@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I have set up Serial over USB gadget (ACM CDC) on a RK3308, which works
fine most times but sporadically (10~20% of the times) does not work,
failing to set up ttyACM0 on the host side.

Target hardware: Rock Pi S (RK3308).
Software used on target: Linux v6.1-rc6 (eb7081409f94a9a8608).
Device tree: rk3308-rock-pi-s.dtb from mainline, unmodified.

Relevant Kconfig options:

CONFIG_USB=y
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PLATFORM=y
CONFIG_USB_DWC2=y
CONFIG_USB_DWC2_PERIPHERAL=y
CONFIG_USB_DWC2_DEBUG=y
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
CONFIG_USB_GADGET=y
CONFIG_USB_GADGET_DEBUG=y
CONFIG_USB_GADGET_DEBUG_FILES=y
CONFIG_USB_GADGET_DEBUG_FS=y
CONFIG_USB_G_SERIAL=y

CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_U_SERIAL=y
CONFIG_USB_F_SERIAL=y
CONFIG_USB_F_OBEX=y
# CONFIG_USB_CONFIGFS is not set

CONFIG_EXTCON=y
CONFIG_PHY_ROCKCHIP_INNO_USB2=y
CONFIG_PHY_ROCKCHIP_USB=y

Connections:
- USB-C to USB-C cable connecting PC and target for both USB
  gadget and target power
- Ethernet cable
- UART TX pin (GND not connected, adds booting troubles)

Symptoms
---------

Here is a snippet of a boot log taken on the target during a boot where
the ttyACM0 did not appear on the host side:

[    0.582781] udc ff400000.usb: binding gadget driver [g_serial]
[    0.583497] g_serial gadget.0: adding 'acm'/(____ptrval____) to config 'CDC ACM config'/(____ptrval____)
[    0.583576] g_serial gadget.0: acm ttyGS0: dual speed IN/ep1in OUT/ep2out NOTIFY/ep3in
[    0.583632] g_serial gadget.0: Gadget Serial v2.4
[    0.584086] g_serial gadget.0: g_serial ready
[    0.588785] dwc2 ff400000.usb: bound driver g_serial
[    0.589295] dwc2 ff400000.usb: dwc2_hsotg_pullup: is_on: 1 op_state: 3
[    0.589333] dwc2 ff400000.usb: HS UTMI+ PHY selected
[    0.589361] dwc2 ff400000.usb: FIFOs reset, timeout at 100
[    0.589389] dwc2 ff400000.usb: EP0: DIEPCTL0=0x00008000, DOEPCTL0=0x00008000
[    0.589414] dwc2 ff400000.usb: gsintmsk now 0xd88c3cc4
[    0.589452] dwc2 ff400000.usb: DCTL=0x00000002
[    0.589477] dwc2 ff400000.usb: GLPMCFG=0x10601483
[    0.592499] dwc2 ff400000.usb: dwc2_hsotg_enqueue_setup: queueing setup request
[    0.592523] dwc2 ff400000.usb: ep0: req (____ptrval____): 8@(____ptrval____), noi=0, zero=0, snok=0
[    0.592565] dwc2 ff400000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80008000, ep 0, dir out
[    0.592593] dwc2 ff400000.usb: ureq->length:8 ureq->actual:0
[    0.592618] dwc2 ff400000.usb: dwc2_hsotg_start_req: 1@8/8, 0x00080008 => 0x00000b10
[    0.592656] dwc2 ff400000.usb: dwc2_hsotg_start_req: 02101000 pad => 0x00000b14
[    0.592682] dwc2 ff400000.usb: ep0 state:0
[    0.592704] dwc2 ff400000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80008000
[    0.592728] dwc2 ff400000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[    0.592752] dwc2 ff400000.usb: EP0: DIEPCTL0=0x00008000, DOEPCTL0=0x80008000
...
[    0.595866] dwc2 ff400000.usb: dwc2_hsotg_irq: 04008420 00000400 (d88c3cc4) retry 8
[    0.595895] dwc2 ff400000.usb: GINTSTS_ErlySusp
[    0.598921] dwc2 ff400000.usb: gintsts=04008820  gintmsk=d88c3cc4
[    0.601050] dwc2 ff400000.usb: dwc2_handle_usb_suspend_intr: DSTS=0x400003
[    0.602415] dwc2 ff400000.usb: DSTS.Suspend Status=1 HWCFG4.Power Optimize=1 HWCFG4.Hibernation=0
[    0.602431] dwc2 ff400000.usb: ignore suspend request before enumeration
[    0.602445] dwc2 ff400000.usb: dwc2_hsotg_irq: 04008020 00000000 (d88c3cc4) retry 8

...lots of other messages from dwc2 ff400000.usb...

...I also have 4 lines like this one:
[    7.287006] dwc2 ff400000.usb: dwc2_hsotg_enqueue_setup already queued???

[    7.383932] g_serial gadget.0: suspend
[    7.383950] dwc2 ff400000.usb: dwc2_hsotg_irq: 04048428 00040400 (d88c3cc4) retry 8
[    7.383968] dwc2 ff400000.usb: dwc2_hsotg_irq: daint=00000009
[    7.383986] dwc2 ff400000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[    7.384001] dwc2 ff400000.usb: dwc2_hsotg_epint: XferCompl: DxEPCTL=0x00008000, DXEPTSIZ=0018004b
[    7.384017] dwc2 ff400000.usb: zlp packet sent
[    7.384031] dwc2 ff400000.usb: complete: ep (____ptrval____) ep0, req (____ptrval____), 0 => (____ptrval____)
[    7.384055] dwc2 ff400000.usb: dwc2_hsotg_enqueue_setup: queueing setup request
[    7.384072] dwc2 ff400000.usb: ep0: req (____ptrval____): 8@(____ptrval____), noi=0, zero=0, snok=0
[    7.384090] dwc2 ff400000.usb: dwc2_hsotg_ep_queue: submit request only in active state
[    7.384104] dwc2 ff400000.usb: dwc2_hsotg_enqueue_setup: failed queue (-11)
[    7.384735] dwc2 ff400000.usb: dwc2_hsotg_enqueue_setup: queueing setup request
[    7.384752] dwc2 ff400000.usb: ep0: req (____ptrval____): 8@(____ptrval____), noi=0, zero=0, snok=0
[    7.384771] dwc2 ff400000.usb: dwc2_hsotg_ep_queue: submit request only in active state
[    7.384782] dwc2 ff400000.usb: dwc2_hsotg_enqueue_setup: failed queue (-11)
[    7.385410] dwc2 ff400000.usb: dwc2_hsotg_epint: ep3(in) DxEPINT=0x00000001
[    7.385431] dwc2 ff400000.usb: dwc2_hsotg_epint: XferCompl: DxEPCTL=0x018c800a, DXEPTSIZ=0007fff6
[    7.385450] dwc2 ff400000.usb: dwc2_hsotg_complete_in: adjusting size done 0 => 10
[    7.385464] dwc2 ff400000.usb: req->length:10 req->actual:10 req->zero:0
[    7.385480] dwc2 ff400000.usb: complete: ep (____ptrval____) ep3in, req (____ptrval____), 0 => (____ptrval____)
[    7.385502] dwc2 ff400000.usb: GINTSTS_ErlySusp

After the "failed queue (-11)" message, a comment in the code [0] says
"Don't think there's much we can do other than watch the driver fail.".

On the host side (Ubuntu 22.04) these are the relevant dmesg lines:

[49258.596766] usb 3-2: new high-speed USB device number 18 using xhci_hcd
[49263.948940] usb 3-2: unable to read config index 0 descriptor/start: -110
[49263.948960] usb 3-2: can't read configurations, error -110
[49264.560806] usb 3-2: new high-speed USB device number 19 using xhci_hcd
[49264.714301] usb 3-2: New USB device found, idVendor=0525, idProduct=a4a7, bcdDevice= 6.01
[49264.714320] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[49264.714327] usb 3-2: Product: Gadget Serial v2.4
[49264.714332] usb 3-2: Manufacturer: Linux 6.1.0-rc6 with ff400000.usb
[49269.837931] usb 3-2: can't set config #2, error -110

I suspect a concurrency issue during initialization, but I don't know
where to investigate further.

Any clues or hints on how this could be addressed would be very
appreciated.

I am of course available to provide more info and full logs if that's
helpful.

[0]
https://elixir.bootlin.com/linux/v6.1-rc6/source/drivers/usb/dwc2/gadget.c#L2059

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
