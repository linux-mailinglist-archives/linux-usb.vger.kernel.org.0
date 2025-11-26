Return-Path: <linux-usb+bounces-30976-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FC5C8AE96
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 17:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 75A0F4E6403
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 16:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E27335560;
	Wed, 26 Nov 2025 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qgGElSiy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D2630BB96
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 16:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764173929; cv=none; b=OA+aeVpGkuixxDP0Nt1RO/VPhFCqqLARe7hJJQ+Vtz4SH7CLoeIBKnbrvY8Ux3TBnhrG2piHGpJyDww9UEYU1fvfi/fi8JpMUg64pJBBO3L9Mle/XGl7cjOp5sT96d99UpQ4k5boxV/uJOdZWmrn19CgRFDigMUg8QZXDL1jtow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764173929; c=relaxed/simple;
	bh=A8a/vfmrnuuCKlhPtRmNUE7pjBPlzlE2qXTzeU2dArw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OWHSJV+Jhmem+LigUdWbo/xHbafYjc3yfn2JciBGEBSmGGsSTg3I3aRbOtN37A+e2XLREOLNuBS96LCh1s8yHII3k+a6/wkGU9Y9OseAstQl64jPc9SPHyLdwnVSH+2TqVTV9k1ffyo5TnFtLj+8p5UTnGL9mgkm2ScAqq4l0sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qgGElSiy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477b91680f8so54452265e9.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 08:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764173924; x=1764778724; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A8a/vfmrnuuCKlhPtRmNUE7pjBPlzlE2qXTzeU2dArw=;
        b=qgGElSiyIIO8yHhW8+S/qQGLCjkjk9IxhK+nnnSm2NDKHJ7AUSU6NxdxT/i/Z7sD4g
         heltZSG8f/ZewycFWjjl8RO8FY5puX5L9eLhWhjf6ZGBa2Cyrk7GoqVnecvSrgCUj+PG
         LIqE2eipL6xW4SN1x4Y9dB2Y75L6zliNi2oWdP1bEsZ+Za5BupMBnulyNBPn9wC+td3Q
         heYgBWbLHyKpq3m4WxchKXS5WeQE+fgzCyWMhq4PiOPJtwNtfn8U4W/XxCABFXCBr8Wv
         tt3hW7iIQO1S6X2cobmtuttLVCTXmvzRMJQqNjcjHxXS0gF+MM22XjHSg2A6n0dpXewv
         Hz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764173924; x=1764778724;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8a/vfmrnuuCKlhPtRmNUE7pjBPlzlE2qXTzeU2dArw=;
        b=gbmfvZHMM75hEpWl01J/WT0uzsvxXmYsJRgPuyGr4gPnnfz3oRoKuvDpQS3JjjKPyi
         pjx6IOJ4X9yzikmoemA4BiejadzJHXxzWQdNvmjHghg5jgji9rTNzpqxWAVruD8skJn6
         fZl3zlkVClihAnL6d4kOaiSszU8NWQJUFhmJhM9uEqT2x+J29ixBrEDQrM1XNcmqag6U
         10KRDuGuarAQqsxX/IfjQfffZ2Iv3O/lAVJW0Xfjea9Gz+1M7LNc6YXr8QFZY/2337z/
         VGGDBTXJ5xMECsHEf7RIqOqIUxqbEjLE4CB0/z8OncBCuqmuGRR+QJPtaoXA+6fwwEm+
         wksA==
X-Forwarded-Encrypted: i=1; AJvYcCVA6o00dMzne6zkXon629Zgh3E2xash+3+12p4ebOKldN0MO4KlXsadBJ9Zw/JimOGgKhcq9VBDKsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTyIwrF4OdpVxD2i694mGawBSG43tyfzMGJ2k15WJBePzxsBZE
	qxzf8Ej++8lkoQ97Ht2827KW5zMPlMSuWahNuE85Dig8f/06e1WZSr142+8BywdG3IQ=
X-Gm-Gg: ASbGncvY6A/FL2lSu74PWMKKazD8RubO8AEXqsVYUrH/WSQT2muf1SoM/hdeqn+Pd0q
	GQTqvt0wuAmIZaCKTUsWpX41VxhmBfd5YcakrUmGFBvN3v9QQDMhFLehhfu8VZPTJb32httZvhj
	bKg4bxegEFI4DX7vvVE3RVWuaneTHUrk9dhvPQ9i0BqleXXWKuA/eSh7pPc+8J9r9N2EP2V3Hz7
	fBYeSi+a8wWPMluaAKnC7BVt//jeTdbMWnJLOc75f/xRfePnk+2jQ8AmTDxMDrMtTN9O25LkYiR
	gRlmLS5UhmZtstu7cAU7Am688KxjQIb5XMzhhBCcY1GhpWi1l0/h5XxYPzAbjNwVsWfJ5IdmiD7
	D3OLPPI+JVA/gFRfQXyRe3LLRsxTMoDqP1N2mITODZR2VrM5U3xITfegmrdMUyTvfAWQs76BoNf
	XbeRDMlx71ixgT2+7U
X-Google-Smtp-Source: AGHT+IHPbIx23EDNZaUTAJ6Psvz/ev1Z/O51tl6vv+BcSPNYJjiwrPTdLBSRYd1ljvmAqn0aCxUGmw==
X-Received: by 2002:a05:600c:4f89:b0:477:9bfc:dcb6 with SMTP id 5b1f17b1804b1-477c10e2bb4mr209401045e9.14.1764173924510;
        Wed, 26 Nov 2025 08:18:44 -0800 (PST)
Received: from draszik.lan ([212.129.87.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2c98sm49691755e9.5.2025.11.26.08.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:18:44 -0800 (PST)
Message-ID: <8d8201de13b4694b26812722356a3a55637406c4.camel@linaro.org>
Subject: Re: [PATCH 3/6] dt-bindings: usb: maxim,max33359: Add supply
 property for VBUS in OTG mode
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones	 <lee@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>, Kyle
 Tso <kyletso@google.com>
Date: Wed, 26 Nov 2025 16:18:59 +0000
In-Reply-To: <adc2d6ec-e666-4dd0-aaad-7ef014efafb6@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
	 <20251123-max77759-charger-v1-3-6b2e4b8f7f54@google.com>
	 <20251124-rook-of-exotic-innovation-fedcc5@kuoka>
	 <adc2d6ec-e666-4dd0-aaad-7ef014efafb6@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-11-25 at 12:13 -0800, Amit Sunil Dhamne wrote:
> Hi Krzysztof,
>=20
> On 11/23/25 11:53 PM, Krzysztof Kozlowski wrote:
> > On Sun, Nov 23, 2025 at 08:35:50AM +0000, Amit Sunil Dhamne wrote:
> > > Add a regulator supply property for VBUS when usb is in OTG mode.
> > >=20
> > > Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> > > Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> > > ---
> > > =C2=A0 Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 =
++++
> > > =C2=A0 1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yam=
l
> > > b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> > > index 3de4dc40b791..a529f18c4918 100644
> > > --- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> > > @@ -32,6 +32,9 @@ properties:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Properties for usb c conne=
ctor.
> > > =C2=A0=20
> > > +=C2=A0 otg-vbus-supply:
> > How is the pin or supply called in the datasheet?
>=20
> The pin that supplies the VBUS power in OTG is referred to as Vchgin in=
=20

I think that should be chgin (without V prefix)

> the datasheet.

Cheers,
Andre'

