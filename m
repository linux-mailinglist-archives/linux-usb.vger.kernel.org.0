Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 568C71A0ED6
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2020 16:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728812AbgDGOEt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Apr 2020 10:04:49 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:62653 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728482AbgDGOEt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Apr 2020 10:04:49 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 60F3824000E;
        Tue,  7 Apr 2020 14:04:47 +0000 (UTC)
Date:   Tue, 7 Apr 2020 16:04:47 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Cristian.Birsan@microchip.com
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        Nicolas.Ferre@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ludovic.Desroches@microchip.com
Subject: Re: [PATCH 3/7] usb: gadget: at91_udc: Update DT binding
 documentation
Message-ID: <20200407140447.GK3628@piout.net>
References: <20200407122852.19422-1-cristian.birsan@microchip.com>
 <20200407122852.19422-4-cristian.birsan@microchip.com>
 <20200407134548.GJ3628@piout.net>
 <9490277e-9513-b198-1980-e8822abf67ff@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9490277e-9513-b198-1980-e8822abf67ff@microchip.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07/04/2020 13:59:52+0000, Cristian.Birsan@microchip.com wrote:
> On 4/7/20 4:45 PM, Alexandre Belloni wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hi,
> > 
> > The prefix for this patch should be dt-bindings: usb:
> > 
> 
> Yes, thanks. I'll send this patch together with the device tree node separately.
> 

No, it has to be in the same series that adds the compatible to the
driver.

> > On 07/04/2020 15:28:48+0300, cristian.birsan@microchip.com wrote:
> >> From: Cristian Birsan <cristian.birsan@microchip.com>
> >>
> >> Add sam9x60 binding.
> >>
> >> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
> >> ---
> >>  Documentation/devicetree/bindings/usb/atmel-usb.txt | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> >> index 44e80153b148..bae2b928a014 100644
> >> --- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
> >> +++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> >> @@ -82,6 +82,7 @@ Required properties:
> >>              "atmel,at91sam9rl-udc"
> >>              "atmel,at91sam9g45-udc"
> >>              "atmel,sama5d3-udc"
> >> +            "microchip,sam9x60-udc"
> >>   - reg: Address and length of the register set for the device
> >>   - interrupts: Should contain usba interrupt
> >>   - clocks: Should reference the peripheral and host clocks
> >> --
> >> 2.17.1
> >>
> > 
> > --
> > Alexandre Belloni, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> > 
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
