Return-Path: <linux-usb+bounces-17922-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F48B9DB3C1
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 09:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D9F5B215FE
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 08:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6906C14EC5B;
	Thu, 28 Nov 2024 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u0Hlmanu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622B614A609
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 08:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732782522; cv=none; b=mUhazMoS/IKsIKcWPtekwEqd8G7rOmiOlMcuF0TgM+EVrzNOUCcd3ldn/ziyp0MbAW+XSUR+eYbZKsUxUTQ+9HGhSM5I7ieLngCq51zWUj52XIV80sBqWhPNo1HRwLhdmmCXxSc//OqX90pE16YfA9h+G1CKmhXfJa0MpcgyyFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732782522; c=relaxed/simple;
	bh=iBgmMatgfTncbI6Xxv9fv7699qHKcsEyga04yyzHrVw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oj1lUTJTSExeOQvWDjc7Ic3R8WmRFDFCUhHQpc4ws4FNTdF+hG2Zxeflq97z82Ttgvuw9VS2jtSAXlBTj2r5qBbyxQfxmsETTeFT8D1pZMmUX0WIlPXdTvrRTH7tLF19E49EKHjOM6uF0D+lTN3Aj40YW+IwrfPsb7LXIMXCyNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u0Hlmanu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a044dce2so5783735e9.2
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 00:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732782518; x=1733387318; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8ce1Yw0qnP/hYgtuVuhHQzLquqkZiusD0COEs+h5WKU=;
        b=u0HlmanuNzHOesnJQlDV/gVXgrXAn5OQZ7OcYvIFLKkmRVEd2tmn/zBUruPeKBPkNz
         iJn4FWWx+N9uxFICCdS9azuW5uF8WBv6Kit9dclVvt0IoduESaPh7OJ16LPhvK8UeM8z
         9Mq86MX+emhI4d+HbcoT/MpNw2Q/U+hTJ75SGZf3RB58aGWetDvrAS5wGhu9iF4Rfu4Y
         Jm0Z7sApaUoJjdwhE4LUr2l8y6+fhdHwpldMgEhUqYQfrTpi8QNAwRHSCsDcZD2TeWCL
         MKZhmnov7M1xFh1G0x2dOofK1Kbtd68SUXTPZJy2OAslDFs7xNFP14503MfwsR4jWf7G
         Ch6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732782518; x=1733387318;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ce1Yw0qnP/hYgtuVuhHQzLquqkZiusD0COEs+h5WKU=;
        b=GCrneJZl/Lr1T/EoAhpwGZZmT2iInu7HSDoS2/ZX38/QRICBX1IYGPAgw17B5SBr8j
         oM3pO+uth7OHfsNhGCC70eC8SU3Dw2iYFNl+lh+1AJ85c2426MxNP8MR5MTjejWUxJhX
         BIF05HIISAokoXZbJ8FA9ewZ/R4gsW9il9b6cFY7UTPI3QRFYWvS0+MqTLWN4YTrQ7xX
         oKZ5lRCwewPdgy1YjtOReajX+sykYqsmkrLhCxnCBacfavXHaF5N3ZGNDUX6u3kFsbfz
         b5/js0kU1BEmFevCp5xfB8N+f3JUrwT7/ecI5FZ3X77tBUcNcjNuXLoPn1TaVkRAzOMl
         eO8g==
X-Forwarded-Encrypted: i=1; AJvYcCWVgfDbCD/s1g713QEdZvspCjdekV6NWWmzC7WVgxcEg4l0SkaH9KSYFlrNMtk/RnJFFd/sxzaMdho=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRKV5l55zBkdrUft65d3/GTKld2r9FSwC2q5JV7UnIXGyEcd8Z
	6AR7lIlDxEHQecO6DWKWCrFGMRi5x1HvVocEV2g36s9DRMNwhXFkeUqLnx5BAHM=
X-Gm-Gg: ASbGncs4Rb9BamSF8jP9KK7LQXY21OAIzbeygaMM8Os1tVgx+5XeiLsmGJ6L7Bg1N0E
	ZmdCIuSB7hvgJW7/mgxF8yQPBSeJxSbhFe0hQqVhtX5Oxkdg7hgv5oqXLHlldpajytIGHO3xT4s
	LSftK/OElGbK0nEhe95vOLE+axyVMWH0MJ/TLUi+ClSau5KpcXBpj6wlZaPl8d7JCL5I+/Yr8T0
	b8zuOnw+UNuKjaAOI7R0qJSa+jzZaWsLY/8i9zJI5pyFcRLeEqJ0c4=
X-Google-Smtp-Source: AGHT+IGTu0qgLLjoHLlWHxSoBIFSoj8XfsMG9AhcjE3+CF/PWBajZkgTxHHhlbUBKXo2AHNhIEwVew==
X-Received: by 2002:a5d:6dad:0:b0:382:3959:f429 with SMTP id ffacd0b85a97d-385c6ccaeafmr6070314f8f.5.1732782517632;
        Thu, 28 Nov 2024 00:28:37 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd3a54asm996072f8f.50.2024.11.28.00.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:28:37 -0800 (PST)
Message-ID: <663f534cd88332ecf64e575ea0cfa1f40e303373.camel@linaro.org>
Subject: Re: [PATCH 5/6] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 TCPCi
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>,  Alim Akhtar
 <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-samsung-soc@vger.kernel.org
Date: Thu, 28 Nov 2024 08:28:35 +0000
In-Reply-To: <b0c5e443-79e2-4e53-8813-57044a627dea@kernel.org>
References: 
	<20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-dts-v1-5-5222d8508b71@linaro.org>
	 <b0c5e443-79e2-4e53-8813-57044a627dea@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Thu, 2024-11-28 at 09:19 +0100, Krzysztof Kozlowski wrote:
> On 27/11/2024 12:01, Andr=C3=A9 Draszik wrote:
> > ---
> > =C2=A0arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 99
> > ++++++++++++++++++++++
> > =C2=A01 file changed, 99 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > index 387fb779bd29..5f7be0cb7418 100644
> > --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > @@ -10,6 +10,7 @@
> > =C2=A0
> > =C2=A0#include <dt-bindings/gpio/gpio.h>
> > =C2=A0#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/usb/pd.h>
> > =C2=A0#include "gs101-pinctrl.h"
> > =C2=A0#include "gs101.dtsi"
> > =C2=A0
> > @@ -90,6 +91,84 @@ eeprom: eeprom@50 {
> > =C2=A0&hsi2c_12 {
> > =C2=A0	status =3D "okay";
> > =C2=A0	/* TODO: add the devices once drivers exist */
>=20
>=20
> Is the TODO still valid?

Yes, there are more devices on that bus.

Cheers,
Andre'


