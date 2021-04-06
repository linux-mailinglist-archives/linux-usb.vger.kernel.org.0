Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 071AC3556E0
	for <lists+linux-usb@lfdr.de>; Tue,  6 Apr 2021 16:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345278AbhDFOnO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Apr 2021 10:43:14 -0400
Received: from vps.xff.cz ([195.181.215.36]:47206 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345263AbhDFOnO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Apr 2021 10:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1617720185; bh=yfn/2Ls2uZcier/kQtma6DwvPfmcADTWwB6MXMslfV8=;
        h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
        b=mVp0tVUUyb64KaQajTBwe8gR/Fkxq1TKrg5TXyaXPVxRpMInsYEeoS/orGGE7utkh
         Zz4WmqjDNDzSv2XGqzRTZbf0ohqSKODpJwhsd7xhYeHY/q6JPu5Cv4gGgfL2nfrUbJ
         FwmQDMj6wTQMPLrA9YVmfb0Jc6oWA99Rp8eNLryI=
Date:   Tue, 6 Apr 2021 16:43:04 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
        narmstrong@baylibre.com, jonas@kwiboo.se, jernej.skrabec@siol.net,
        airlied@linux.ie, daniel@ffwll.ch, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, enric.balletbo@collabora.com,
        drinkcat@chromium.org, hsinyi@chromium.org, kernel@collabora.com,
        dafna3@gmail.com, robh+dt@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: add analogix,anx7688.yaml
Message-ID: <20210406144304.u2flatne2bxn5t3g@core>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20210305124351.15079-1-dafna.hirschfeld@collabora.com>
 <20210305124351.15079-2-dafna.hirschfeld@collabora.com>
 <YEJBgEPO4J5+/HhD@pendragon.ideasonboard.com>
 <35f505ee-d939-4b42-490b-321b961bdec3@collabora.com>
 <20210305172437.meu45ol7d4c3w2lr@core.my.home>
 <f90401b1-471b-c936-6661-d3d9c52abb2e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f90401b1-471b-c936-6661-d3d9c52abb2e@collabora.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 31, 2021 at 07:16:40PM +0200, Dafna Hirschfeld wrote:
> Hi,
> 
> On 05.03.21 18:24, Ondřej Jirman wrote:
> > Hello Dafna,
> > 

[...]

> > > > > +  vconn-en1-gpios:
> > > > > +    description: Controls the VCONN switch on the CC1 pin.
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  vconn-en2-gpios:
> > > > > +    description: Controls the VCONN switch on the CC2 pin.
> > > > > +    maxItems: 1
> > 
> > VCONN is a voltage regulator that can be enabled either on CC1 or CC2
> > pin, or disabled completely. This control is *partially* performed in reference
> > design directly by the OCM. OCM only decides which CC pin to switch
> > the VCONN regulator to, and informs the SoC when the base VCONN regulator
> > for the switches needs to be enabled.
> > 
> > So vconn-en1/2 gpios are irrelevant to the driver, but the driver needs
> > to control VCONN power supply somehow and defer control over it to the OCM.
> > 
> > I don't know how to express it in the bindings. Maybe a vconn-supply here
> > on the anx7688 node?
> > 
> > It may also be part of the usb-connector binding, but this is really when it
> > comes to anx7688 a parent regulator for the switches, and switches are not
> > controlled by this driver, just their parent regulator is.
> > 
> > Any ideas?
> 
> Looking at the diagram in the schematics, I see that both vbus-supply and vconn-supply
> come directly from the PMIC so similarly to the vbus-supply, the vconn-supply
> can be part of the usb-connector. Then a driver can access the vconn-supply from the remote usb
> connector. Is there a problem with that?

No problem with that. usb-c-connector binding would just have to be extended.

I just don't see any need for these `vconn-en*-gpios`, because the control
is performed directly by the OCM firmware via GPIOs in the ANX7688 chip,
outside of the control of the Linux driver, and the driver doesn't even care
about the status of these pins. And if it will ever care, the status can be
read via I2C from the ANX7688 chip directly.

kind regards,
	o.

> Thanks a lot for the review, I am not very familiar with usb and type-c, so your review helps a lot.
> I will send v6 soon.
> 
> Thanks,
> Dafna

