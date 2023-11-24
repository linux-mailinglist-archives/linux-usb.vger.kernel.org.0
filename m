Return-Path: <linux-usb+bounces-3308-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 348C37F79B6
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 17:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E524B211A5
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 16:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C286935F16;
	Fri, 24 Nov 2023 16:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJ78VOfT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591421725;
	Fri, 24 Nov 2023 08:52:43 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-581ed744114so969824eaf.0;
        Fri, 24 Nov 2023 08:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700844762; x=1701449562; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HwvURCD8JO2RIWqByNKqPi8KtIAW+ntHwZp3ixqrauc=;
        b=QJ78VOfTLzEj4Y2G1Pm+ZZkJKXtysva91UHS5m7H6ECPO+UAhnkHEwyPyET2AoXffc
         aXo2s4ptuU38qHrlMYQFA9QYqt7pH5Uj6CrJ4PPIdzn2u1d/PTyO09VBW+hy/yYhXjEu
         nw3WpILIsMmnqnIZaOs3UFKz69yRvy/fthZjVRg7Z7q+QlRwInEZgi2loYd4khyGWeym
         mkxFpnQJ2K6IkyUp+VjScvPdM2KF0+wpkN1IvWmpO7tj2J1VnymIiNwWGUNtE4euxLNA
         VWQ4jA9MtkDbdROqC5J2nPO4KUXsOhvs27oFWXPqwbmfGf3qePOb3bXQyw0HUldsJKm8
         pTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700844762; x=1701449562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwvURCD8JO2RIWqByNKqPi8KtIAW+ntHwZp3ixqrauc=;
        b=CX+kaqqlYSuMBGe9tmQYksfyW99F2CKgceXDIQGl0atIxB+Q8kpxxQ1HrTASQdA2JF
         0osdPh7d44vmIH9mY/qV3qbYYNnttalL2gvitJjUz2mHMPPRg73jPVp+ly9x/CVMSyjd
         fO/w45GOD4vymLtWFy9Th0OTYcDIic5gWr2boyk8fPCikLIrRBi6ZJmESXdvYoVPuT3g
         XGv9KFd9TVUlZCoA//vgqxIrGTGVc/e0oznhieqr03VdH8m2UNwsKWEkFancEmua/DTm
         Zp9gLiphsSttuhgl2cy7He71EMBK17lMYE4IrCEvVo9JzZ/SaJaAUQpfArXjMqDlOA49
         YrZQ==
X-Gm-Message-State: AOJu0YwB7ruiiEPGEOECEPuTVUkqoViB/TLEFVqR+jnfrxGUXVtlmRAz
	bQhLOcxwzDdDX/i1Qazvtix5Yzups1l7mFDtYa4=
X-Google-Smtp-Source: AGHT+IHyDITij++0oWIIfEE6LF/3Kb0JdsJVaCPpRgfdvGx+E5uurlL7PB8lD4NVooz9LQlIxdVmY5ODHj1CXNhlbnY=
X-Received: by 2002:a05:6820:513:b0:581:d5a6:da4a with SMTP id
 m19-20020a056820051300b00581d5a6da4amr4341978ooj.1.1700844762520; Fri, 24 Nov
 2023 08:52:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122182351.63214-1-linux.amoon@gmail.com> <20231122182351.63214-2-linux.amoon@gmail.com>
 <20231123-skeletal-smirk-390543e2d6ab@spud> <CANAwSgQCOw_CY_Yy7zYHdme92O=O35Ev=MqHcznYnR=ycaxdPg@mail.gmail.com>
 <20231124-clear-aids-2fd63e1dcbcf@spud>
In-Reply-To: <20231124-clear-aids-2fd63e1dcbcf@spud>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 24 Nov 2023 22:22:26 +0530
Message-ID: <CANAwSgSRp96fjGfHw2rRNW8S3iKSzL7QTBV4N8_+vPxDoos1gA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Fri, 24 Nov 2023 at 17:55, Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Nov 24, 2023 at 04:18:23PM +0530, Anand Moon wrote:
> > Hi Conor
> >
> > On Thu, 23 Nov 2023 at 23:26, Conor Dooley <conor@kernel.org> wrote:
> > >
> > > On Wed, Nov 22, 2023 at 11:53:46PM +0530, Anand Moon wrote:
> > > > Add the binding example for the USB3.1 Genesys Logic GL3523
> > > > integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> > > > hub.
> > > >
> > > > Onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
> > > > which has a common reset pin and power supply.
> > > > peer-hub phandle each peer controller with proper gpio reset
> > > > and help each peer power on during initialization
> > > > and power off during suspend.
> > > >
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > > > v4: Fix the description of peer-hub and update the commit message.
> > > > Schematics of the Odroid N2+
> > > > https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
> > > > V3: fix the dt_binding_check error, added new example for Genesys GL3523
> > > > v2: added Genesys GL3523 binding
> > > > v1: none
> > > > ---
> > > >  .../bindings/usb/genesys,gl850g.yaml          | 67 +++++++++++++++++--
> > > >  1 file changed, 63 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > > index ee08b9c3721f..bc3b3f4c8473 100644
> > > > --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > > +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > > @@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
> > > >  maintainers:
> > > >    - Icenowy Zheng <uwu@icenowy.me>
> > > >
> > > > -allOf:
> > > > -  - $ref: usb-device.yaml#
> > > > -
> > > >  properties:
> > > >    compatible:
> > > >      enum:
> > > > @@ -27,12 +24,48 @@ properties:
> > > >
> > > >    vdd-supply:
> > > >      description:
> > > > -      the regulator that provides 3.3V core power to the hub.
> > > > +      phandle to the regulator that provides power to the hub.
> > > > +
> > > > +  peer-hub:
> > >
> > > Should the property not be "peer-controller"? Your description refers to
> > > them as such.
> >
> > No, as per my understanding, peer-hub represents a complete USB hub.
> > See the lock diagram in the below link.
> >
> > >
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +    description:
> > > > +      onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
> > >
> > >
> > > > +      which has a common reset pin and power supply.
> > > > +      peer-hub phandle each peer controller with proper gpio reset
>
> This is what I don't get. You say "peer-hub phandle each peer
> controller..". It is hard for me to understand that portion of the
> sentence, but the interchanging of "hub" and "controller" is
> confusing. The title of the binding says "hub controller", so maybe it
> is better to use that here.
>
> > > > +      and help each peer power on during initialization
> > > > +      and power off during suspend.
> > >
> > > I generally hate to talk about non-native speakers grammar etc, but what
> > > you have here is in need of a lot of improvement. The below is my
> > > attempt to understand what you are trying to say:
> > >
> > > "For onboard hubs that support USB 3.x and USB 2.0 controllers with
> > > shared resets and power supplies, this property is used to identify
> > > the controllers with which these are shared."
>
> "For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> with shared resets and power supplies, this property is used to identify
> the hubs with which these are shared."
>
Thanks for your review comments.
Ok will update this in the next version.

> I re-worded this again to try and remove the use of "controller".
> Do you think that this still makes sense?
>
> > Sorry for the poor grammar, I will update this in the next v5.
> >
> > > Also - this is one particular system, what prevents there being a hub
> > > that has more than 2 controllers? Also, as you insist that this is
> > > generic, and not just for genesys, should this not be defined in a
> > > common location?
> >
> > Here is the block diagram of the Genesys GL3523 hub.
> > [0] https://www.genesyslogic.com.tw/en/product_view.php?show=67 [Block Diagram]
> >
> > It has two USB 2.0 and USB 3.1 controllers, so using peer-hub node
> > the onboard hub module will bring up this hub.
> >
> > There are many examples that use similar properties hence it is generic.
> >
> > # Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > # Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
> > # Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> > # Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> > # Documentation/devicetree/bindings/usb/vialab,vl817.yaml
>
> Which brings me back to the unanswered question, should this not be
> defined in a common location given there are several devices using it?
> I assume because it only applies to hub controllers and not other types
> of devices.
>
> Also, the descriptions that I saw when looking at some of those other
> bindings are similarly poor. I can't bring myself to care any more,
> just clean up the ambiguous wording here and I'll ack the next version,
> I don't expect you to sort out the wording in other bindings.
>
Ok
> Cheers,
> Conor.

Thanks
-Anand

