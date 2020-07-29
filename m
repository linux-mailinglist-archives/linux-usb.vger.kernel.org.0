Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A80232356
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 19:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgG2R2b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 13:28:31 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:51575 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgG2R2b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jul 2020 13:28:31 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 4A5CC1BF20A;
        Wed, 29 Jul 2020 17:28:29 +0000 (UTC)
Date:   Wed, 29 Jul 2020 19:28:29 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Trevor Woerner <twoerner@gmail.com>
Cc:     jamesg@zaltys.org, linux-usb@vger.kernel.org
Subject: Re: lpc32xx and stotg04
Message-ID: <20200729172829.GA3679@piout.net>
References: <20200723212743.GA11107@linux-uys3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723212743.GA11107@linux-uys3>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 23/07/2020 17:27:43-0400, Trevor Woerner wrote:
> I too am working with a board that uses the lpc32xx SoC (the lpc3240, to be
> specific) and has a stotg04 for the USB transceiver instead of the isp1301.
> 
> I can't get the USB to work.
> 
> My guess is that I don't have the device tree correct.
> 
> I could embarrass myself by showing you what combinations I've tried but I
> thought maybe I'd ask and see if either of you could provide a DT snippet
> describing how to hook up the stotg04 to the i2cusb. Admittedly I'm quite
> fuzzy when it comes to device trees.
> 

This is what I had that is relevant:

&i2cusb {
	clock-frequency = <100000>;

	isp1301: usb-transceiver@2d {
		compatible = "nxp,isp1301";
		reg = <0x2d>;
	};
};

/* Here, choose exactly one from: ohci, usbd */
&usbd {
// &ohci {
	transceiver = <&isp1301>;
	status = "okay";
};

> I'm also a bit fuzzy on USB. I want to plug usb sticks into my device (which,
> by my understanding, is the opposite of OTG). So additionally I want to enable
> ohci and not usbd?
> 

Indeed, you want ohci (as you can see this is commented out in my device
tree)

> In one DT incantation (the one showing the most promise so far) on startup
> 'lsusb' shows two usb devices. The moment I plug a USB drive into my device I
> get:
> 
> 	[  433.268009] usb-ohci 31020000.ohci: controller won't resume
> 	[  433.273603] usb-ohci 31020000.ohci: HC died; cleaning up
> 	[  433.280566] usb 1-1: USB disconnect, device number 2
> 
> And afterwards only one device is listed by 'lsusb'.
> 
> Currently I'm using a 5.0 kernel and a 5.4 kernel, but I could use any kernel
> (upstream, ideally). In either case, it doesn't seem possible to deselect the
> isp1301 from the kernel config? It gets selected automatically. If I'm using
> the stotg04 instead of the isp1301, do I need a way to turn off the isp1301?
> 

The platform I was working on is on v5.1 and has an stotg04. Honnestly,
the whole thing is a mess and you have to use the isp1301 driver. Then
the difference between isp1301 and stotg04 is handled in lpc32xx_udc.c.

So I would say you are missing something similar to what I did in
2a60f5eafa74 ("usb: gadget: udc: lpc32xx: add support for stotg04 phy")
but in drivers/usb/host/ohci-nxp.c:isp1301_configure_lpc32xx()

I guess your issue is MC2_SPD_SUSP_CTRL line 75 ;) You can try to
remove it.

Regards,

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
