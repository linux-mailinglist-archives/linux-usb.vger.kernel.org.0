Return-Path: <linux-usb+bounces-31280-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 268D9CACE07
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 11:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2079C300D657
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 10:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150832F6915;
	Mon,  8 Dec 2025 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="I2dttRsi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B543D25A2A5
	for <linux-usb@vger.kernel.org>; Mon,  8 Dec 2025 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765189843; cv=none; b=FlPjGu8efkbKu1sF1WXc5wNsrry6PCWwOed7f/nTrIBt74/wnW5bfI5jQX0+hsBPAIhkRMVT/tI4m1985qgQKbzLlns/0vEdZlLeZQr6FFcXZtLwsqkEtU/A5TmXg+u9PTmAssgNGRXFDDe17YLArN1W6ABKAe1FjZ01W3pOblA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765189843; c=relaxed/simple;
	bh=RLw9fFUPT6gJ5CGBMzrOruJpNjzbWJE4s01IusHbk/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t8Rw4xXUNU8DOUbW60VO8bWZ9ei6Ug70ONPWurDwVvWIzeQzw/WMd45w7GTEMFPmyu7N23+3PFlIgsFH276pxG/Huojz8DhASSH8ernnlK9p0zouYGlACXIHZvYG71Wl8WafTpYp9DMreVhHdq0NSPoNVu4Qq7Z0UwBrgDyhgqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=I2dttRsi; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b79b9113651so687194766b.3
        for <linux-usb@vger.kernel.org>; Mon, 08 Dec 2025 02:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765189840; x=1765794640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNvqYgBG7iSIMiizE0aJ/ECmeySIS6td2ZjzM3JB2Vg=;
        b=I2dttRsi9UI2sQb6l32Ht5UL7WYQLHqercIt6GSNW/9uFw4hk+pRVltkpZwSTHyKgV
         YZIF8PtFUwXKToEm/Fr4kbw2yoH5tbAdVGfV+PU+j0Sgr7tcpT0K3EluUNw6K32T29Ci
         G4FrUfu7WJrRPyLFw+DpJ2ACoXVefpUhTvB8rHJ4TtUQl2Z/IRZPzcal3gZvV++iGQ0s
         KkRFS6qCxmZqcF0mRwFVwmFxg76CbytQDNUDv3EsRrw5ssHgOllFF9MTdMCljiVeEECA
         uRxnQZDxMRv9EbqSlAY0VQ0YfJTJjrd5DGpa1Yb7qblufgbp6h4ln4sMil9/MY8ZJqo6
         /yUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765189840; x=1765794640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNvqYgBG7iSIMiizE0aJ/ECmeySIS6td2ZjzM3JB2Vg=;
        b=C2uEKRv4k+ONzYEQhtDLrqUiXfm7/wpdGlLBY8HJ9HUVrW6CEkyAaUZeCOmJki+tsX
         UUp+KQ4BNpnBwBywZWYJGD3NNiQFlISdWASpHTrNTyyQJhECC3uMLQkBEfiwXBLtXfeQ
         0Vsnvgbr5yj3ntbhX+KZQPKUbI6qizLc1NDRZNd7BIcN96sNmNFNv6lThBvLaSEXhqsL
         2VF7Talyak6YE3/k4Jp7leoTr4E8/YQ3YZre7ehzwPfs6o810KOyk49lfeXB+mtrqRPV
         B59iXkfhmX3VagGPDinUzG3jUHGlrPEcnn6jZDOGswHuN4Z+IAhtl4HI8zBvsFnV/+8M
         7RMA==
X-Forwarded-Encrypted: i=1; AJvYcCVUwS1IfPaGMy3oVmMqlPxyzAec50b2kq/q4xx2SrX26+w286AvdPdC9A1n7pdBBo5PDZLa4LyRDXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBhS/mZDP0xgrXp0GdOv0sG75HlS2X/lSsnpZS3+KpIlri+4Zo
	P97tjftqdwd0OYyKcruSiQ5olNud4ruSI5i8UsgPtB8yUbEJbDsHkvRGrFdOySxv7tU18lT/AU9
	6p41/E0SKl/8lTb5tcz020CK4MybCrbHzyImwPo6XWg==
X-Gm-Gg: ASbGncvIfvdzDIHdImAaalUGAYoeTfDSiOgjzwKusI0RF4ZcaA+HA0xyURtybNhI+2H
	ptm55M0L2Zim9gup4og0QywbOYjwhqWLwZQJQQfMQHimLOrVtSjTtxKAOW6VFj8ANQRfG/1w+8i
	fV6qRLfqqbMv+I+LK3C7IjkchS6zV9JevQrTL/4iTRBeNAWqTAoogYu0JEbgUua+1YFysZIUfNZ
	fA9l+KS5KlP4qr0v4IT4UJRBHTKyLuJx7a5qDC4y7gO+fi5BPMRZpnNXlEtUuYxH51fJdk=
X-Google-Smtp-Source: AGHT+IGTGfVyoL064tKoONxhclX3UfjDWBItbzH79CNnYw055wrJS+DIVrLMSFgzEDdDe4VqLWZokTX1m+LMd5COg2g=
X-Received: by 2002:a17:907:2d9f:b0:b6f:9db1:f831 with SMTP id
 a640c23a62f3a-b7a2432665emr675738166b.23.1765189839808; Mon, 08 Dec 2025
 02:30:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-2-robert.marko@sartura.hr> <20251203-duly-leotard-86b83bd840c6@spud>
In-Reply-To: <20251203-duly-leotard-86b83bd840c6@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 8 Dec 2025 11:30:28 +0100
X-Gm-Features: AQt7F2rM1STFm1xLFXO9y7ZB3gww-XKs-PW-e-F3Xq1nOQlYXGXTztJZMADERPo
Message-ID: <CA+HBbNH6wO2VWOp1Dn52ArrYg6z89FgYnT3x-jsHsTVJ5xSBSA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: arm: Document Microchip LAN969x
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 8:19=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Dec 03, 2025 at 01:21:30PM +0100, Robert Marko wrote:
> > Microchip LAN969x is a series of multi-port, multi-gigabit switches bas=
ed
> > on ARMv8 Cortex-A53 CPU.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/arm/microchip,lan969x.yaml       | 32 +++++++++++++++++++
>
> This should not be in a unique file, put it in with the other microchip
> arm devices please. Also, the wildcard in the compatible is not
> permitted, only way it'd make sense is if these are different binnings
> of the same silicon. If that's the case, you need to explain why,
> because compatibles are meant to be soc-specific.

Hi Conor,
The issue is that there is no unique place for Microchip SoC-s,
LAN966x series is in the AT91 bindings
while SparX-5 has its own bindings file.

What would you suggest in this case?

As for the wildcard, I understand, will get rid of it in v2.

Regards,
Robert

>
> pw-bot: changes-requested
>
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/microchip,lan=
969x.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/microchip,lan969x.ya=
ml b/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml
> > new file mode 100644
> > index 000000000000..3fa1d4ed40d1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml
> > @@ -0,0 +1,32 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/microchip,lan969x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip LAN969x Boards
> > +
> > +maintainers:
> > +  - Robert Marko <robert.marko@sartura.hr>
> > +
> > +description: |+
> > +   The Microchip LAN969x SoC is a ARMv8-based used in a family of
> > +   multi-port, multi-gigabit switches.
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - description: The LAN969x EVB (EV23X71A) is a 24x 1G + 4x 10G
> > +          Ethernet development system board.
> > +        items:
> > +          - const: microchip,ev23x71a
> > +          - const: microchip,lan969x
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: true
> > +
> > +...
> > --
> > 2.52.0
> >



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

