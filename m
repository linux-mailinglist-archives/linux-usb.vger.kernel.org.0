Return-Path: <linux-usb+bounces-9248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0256C8A0A09
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 09:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 833E51F21438
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 07:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C42D13F45C;
	Thu, 11 Apr 2024 07:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NyK6FcWt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E66713E896
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 07:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712820938; cv=none; b=o8g/9IsSx/Nc7zob5iaeDXtq6OVEwfDzwjGTzOZ/SkFbFLKfX2vv/qHqRRI1kck5gP+6ni4UjyG+fFxvA+ql3uK9tHOc1sHs23vnfh6bGrE0zX74Nd+r7DLT3J4x5NtAGkycHJ16yWm2WbYixTPizfIVnCZaYYtsvUYKApZ4urY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712820938; c=relaxed/simple;
	bh=DY/4DerGRBb0QqlGFg3p8xcWt1msP7cUgXqVJUnYvXc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=vGM6/RCRbBPSPMJsxDv41sygEG9ULZ2ouc23PCbImkATxyYfFFCNF2PMlC+BTTXdu6NsY5oB1myG64/xa1GeIAaGUuR3gJ2hSWT+ntnGxgYxXrxzEjYgi/G45mcfQJAYL61Q+W76vvIBjlWb8Wbof74QHxOAQ9nCn01OPL11hRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NyK6FcWt; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a521fd786beso40358166b.3
        for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 00:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1712820933; x=1713425733; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6le4foaS4XgBxBuhSj2wdSogbCI/OVt2IshAL3V9iQ=;
        b=NyK6FcWt0EzWRAequ4sa63Pg2xVrqW4O0obtT4qkxjrr6fvyfEiYYFA2+4EwMFym6E
         xTufs3pUbiLhYgf6FySExnRoqTu62tcZBwsnnHl2hcYz8tsEQ6N1ja8CrsUpskASrmpb
         wWrLpvSfPoIC8T6EK6EmZuQr13VKsVcO+88NlSyozf0mVDSTgIi6fNAFMUtqkn50mVAU
         isHAaYeWcSJZbClWOMGGOZFMP0WHJL5u1cnOW3QhsF089T3voDd5Q1fkvwv+HUJWnsoZ
         r5aDM6oH6U9NbH+slc8EizWZdfTW0xLCP27JdrjA61/JtJ4Qd2pELQIf65gU2sY6KI9Q
         5gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712820933; x=1713425733;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T6le4foaS4XgBxBuhSj2wdSogbCI/OVt2IshAL3V9iQ=;
        b=bC0kfdfHQrBTqp8xKDKxGYqMchv8NMj8noVJ+vz+oAt0lPKPcLn0ym12PcEUPlgd71
         FR2Z/xW5/ogKyyLsBDVuedDCOd6XPzNCsFvU6Hd5q4T1utLvUzgK8CQ3ZywBWIuvKX6h
         nLmoPq3EMwt5d3DeenjHXtGbmWPneyQoKcMngEdViEQKGcqA1ZWI/F9y0UQtGHcGd41S
         oQesTSxEh4whzmfFmbbRQepuIQN84HLAmSNru2uGx6chYDYk501+DCKAlRbX//F4osKL
         wiDqc7oD9D72961t+YEz4SW0tfIT5+HUxqFtaZEUnXo40k06bpA+Pr8eApJFP/8Rpunj
         D7zA==
X-Forwarded-Encrypted: i=1; AJvYcCVDGqD5P05u3cZ+SzGKkb3qJNvx13cxxEalVTV1OQlfEuClAPOWVaEMcUe9OQi52uKnUjySjJBZuPFhzTB5mhiwWidT9uMYFWY4
X-Gm-Message-State: AOJu0Yw8Nh23ksStK6dNc+H21ZPHjfigtbpvRDFT5oW2fTc3skdl2jy9
	80S4PL5mDGF7wNy/HP+Hf6QMjcWgzMOzt9S9DyDFVhVBRsVbw039z4BRmruzOQY=
X-Google-Smtp-Source: AGHT+IEVtEqpCy5E3AYRD1SF9Km0TxRNvi4IhzO3AHxvY8mwuLDPLS8kdDC3zgHw+qXSvVoFbdptWw==
X-Received: by 2002:a17:906:b1d7:b0:a4e:5c23:f776 with SMTP id bv23-20020a170906b1d700b00a4e5c23f776mr3208301ejb.37.1712820932974;
        Thu, 11 Apr 2024 00:35:32 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id bm15-20020a170906c04f00b00a46d9966ff8sm488113ejb.147.2024.04.11.00.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 00:35:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Apr 2024 09:35:32 +0200
Message-Id: <D0H4CHG4KSRF.10Z6DOI8PORI8@fairphone.com>
Subject: Re: [PATCH v2] dt-bindings: usb: add common Type-C USB Switch
 schema
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <20240122094406.32198-1-krzysztof.kozlowski@linaro.org>
 <D0H3VE6RLM2I.MK2NT1P9N02O@fairphone.com>
 <051c6e44-4844-48b9-846d-cf9b81611415@linaro.org>
In-Reply-To: <051c6e44-4844-48b9-846d-cf9b81611415@linaro.org>

On Thu Apr 11, 2024 at 9:25 AM CEST, Krzysztof Kozlowski wrote:
> On 11/04/2024 09:13, Luca Weiss wrote:
> > On Mon Jan 22, 2024 at 10:44 AM CET, Krzysztof Kozlowski wrote:
> >> Several bindings implement parts of Type-C USB orientation and mode
> >> switching, and retiming.  Keep definition of such properties in one
> >> place, new usb-switch schema, to avoid duplicate defines.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> 1. Fix language typos handle->handler (Luca)
> >> 2. Drop debugging left-over (Luca)
> >> ---
> >>  .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 12 ++--
> >>  .../devicetree/bindings/usb/gpio-sbu-mux.yaml | 12 ++--
> >>  .../devicetree/bindings/usb/nxp,ptn36502.yaml | 12 ++--
> >>  .../bindings/usb/onnn,nb7vpq904m.yaml         | 13 ++--
> >>  .../bindings/usb/qcom,wcd939x-usbss.yaml      | 12 ++--
> >>  .../devicetree/bindings/usb/usb-switch.yaml   | 67 ++++++++++++++++++=
+
> >>  6 files changed, 92 insertions(+), 36 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/usb/usb-switch.y=
aml
> >>
> >> diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/=
Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> >> index f9410eb76a62..8b25b9a01ced 100644
> >> --- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> >> +++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> >> @@ -27,13 +27,8 @@ properties:
> >>    vcc-supply:
> >>      description: power supply (2.7V-5.5V)
> >> =20
> >> -  mode-switch:
> >> -    description: Flag the port as possible handle of altmode switchin=
g
> >> -    type: boolean
> >> -
> >> -  orientation-switch:
> >> -    description: Flag the port as possible handler of orientation swi=
tching
> >> -    type: boolean
> >> +  mode-switch: true
> >> +  orientation-switch: true
> >> =20
> >>    port:
> >>      $ref: /schemas/graph.yaml#/$defs/port-base
> >> @@ -79,6 +74,9 @@ required:
> >>    - reg
> >>    - port
> >> =20
> >> +allOf:
> >> +  - $ref: usb-switch.yaml#
> >> +
> >>  additionalProperties: false
> >> =20
> >>  examples:
> >=20
> > Hi Krzysztof,
> >=20
> > This patch seems to break validation for fsa4480 if data-lanes is set i=
n
> > the endpoint like the following
> >=20
> > diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/D=
ocumentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> > index f9410eb76a62..3aa03fd65556 100644
> > --- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> > +++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> > @@ -102,6 +102,7 @@ examples:
> >            port {
> >              fsa4480_ept: endpoint {
> >                remote-endpoint =3D <&typec_controller>;
> > +              data-lanes =3D <0 1>;
> >              };
> >            };
> >          };
> >=20
> > Similar to how it's already used on qcom/qcm6490-fairphone-fp5.dts
> >=20
> > I'm guessing the 'port' definition in the common schema somehow
> > disallows the fsa4480 schema from describing it further?
>
> There is no such code in qcm6490-fairphone-fp5.dts. There was no such
> code in the example of fsa4480 when I was testing my changes (and
> examples should be complete), so this did not pop up.

Right, I'm sorry this is just out-of-tree for now, I've forgotten this.
There's some dependency chain with some unsupported DSC configuration in
DPU for now that blocks upstreaming this.

My tree with these patches is here if you want to take a look:
https://github.com/sc7280-mainline/linux/blob/sc7280-6.8.y/arch/arm64/boot/=
dts/qcom/qcm6490-fairphone-fp5.dts#L628

>
> You right, new schema does not allow extending the port. However the
> true question is, why muxing happens on the port to the SoC controller?
> The graph in commit msg fad89aa14 shows it happens on the side of the
> connector.
>
> Looks like fsa4480 mixes connector with the controller.

Could be honestly.. I trust you with knowing better how the ports are
supposed to work.

The property is for telling the fsa4480 driver that essentially the
hardware is wired up the reverse way. So with this info the driver can
handle the orientation switching correctly.

There's another layer to this as explained in the patches there that the
OCP96011 essentially works reversed compared to FSA4480, that's why it's
all a bit of a mess.

Regards
Luca

>
> Best regards,
> Krzysztof


