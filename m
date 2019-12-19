Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 778B9126BD3
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2019 19:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729532AbfLSSxC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Dec 2019 13:53:02 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.220]:23141 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730306AbfLSSxA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Dec 2019 13:53:00 -0500
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Dec 2019 13:52:58 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576781574;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=qNAGL12LBurpc/6ajNVhidk7Du6R/qYWEVmpq8HhjYE=;
        b=OmJelXdaEVV1I/uUFtv1GD8VEFHJuOx3AqkQrey8hWoXMQ/4l4hyAbFH0AVgwSRfgP
        OmvGcspL1Qwux3KVckpf+v0NntjFVqgUntA+Cv7fxIUUMLQM/7ofxLcH9FludpeMy5Qy
        WYge0z7VQ903VNGbGHxHTxSMF0Kfa5MzOFAIaI0+TD301QzzrB0lU1lBVMpIe+DmqnT6
        IPkqWVC8BHM6cQiRnSekH+D5KOJqZsm/hsTllYCgss6F+WAl/LZzlP/XGU3YV9GgcgIZ
        SbWzmYzGjW5pJbidEH3WkBlhMXGVN3AFPvpSHsnRzfpTlQaFur8qCnl93B8G+YfsQGEe
        IZfQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJFB3zpdWI="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.1.1 AUTH)
        with ESMTPSA id f021e2vBJIkr3Lf
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 19 Dec 2019 19:46:53 +0100 (CET)
Date:   Thu, 19 Dec 2019 19:46:38 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: phy: ab8500-usb: Keep PHY turned on in UART mode
Message-ID: <20191219184638.GA908@gerhold.net>
References: <20191218203450.71037-1-stephan@gerhold.net>
 <CACRpkdZ_ECjsq+Ux0798gRxiTMgyPwiU0GC+rNSysms9tu98og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ_ECjsq+Ux0798gRxiTMgyPwiU0GC+rNSysms9tu98og@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 18, 2019 at 10:30:59PM +0100, Linus Walleij wrote:
> Hi Stephan,
> 
> On Wed, Dec 18, 2019 at 9:37 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> 
> > AB8505 supports an "UART carkit mode" which makes UART accessible
> > through the USB connector. Upon detection of the UART cable,
> > this mode has to be manually enabled by:
> >
> >   1. Turning on the PHY in peripheral mode
> >   2. Reconfiguring PHY/pins to route UART signals to USB pins
> >
> > At the moment, we do not handle the UART link statuses at all,
> > which means that UART stops working as soon as phy-ab8500-usb is loaded
> > (since we disable the PHY after initialization).
> >
> > Keeping UART working if the cable is inserted before turning on the device
> > is quite simple: In this case, early boot firmware has already set up
> > the necessary PHY/pin configuration. The presence of the UART cable
> > is reported by a special value in the USB link status register.
> >
> > We can check for that value in ab8505_usb_link_status_update()
> > and set the PHY back to peripheral mode to restore UART.
> > (Note: This will result in some minor garbage since we still
> >  temporarily disable the PHY during initialization...)
> >
> > Fully implementing this feature is more complicated:
> > For some reason, AB8505 does not update UART link status after bootup.
> > Regular USB cables work fine, but the link status register does not change
> > its state if an UART cable is inserted/removed.
> >
> > It seems likely that the hardware is not actually capable of detecting
> > UART cables autonomously. In addition to the USB link status register,
> > implementations in the vendor kernel also manually measure
> > the ID resistance to detect additional cable types. For UART cables,
> > the USB link status register might simply reflect the PHY configuration
> > instead of the actual link status.
> >
> > Implementing that functionality requires significant additions,
> > so for now just implement the simple case. This allows using UART
> > when inserting the cable before turning on the device.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> 
> This is my understanding of how it works as well:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I am a bit allergic to using the word "manually" describing
> anything a computer does (no man involved) but many people
> use this way of describing things so who am I to tell.
> I tend to try to write "directly", "iteratively", "imperatively" or
> something, which is arguably harder to understand for some.

I never really thought about it that way. :)

Maybe it makes slightly more sense if you consider it from the
perspective of the person writing the code.

For example, the "UART over USB" functionality is often implemented
using an extra IC, usually called MUIC (Micro-USB Interface Controller).
The ones I have worked it all measure the ID resistance automatically,
and route UART to USB when needed without any software interaction.

AB8505 does not do that, so in this case we need to *manually* write
code to [let the computer] instruct AB8505 to route UART to the USB pins.
Ideally, once the code is working there will be no more manual work
needed. But currently manual work is still needed for writing code :)
