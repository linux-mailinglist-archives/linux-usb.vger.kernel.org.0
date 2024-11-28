Return-Path: <linux-usb+bounces-17926-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6AD9DB3EB
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 09:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4F191666EE
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 08:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6050814B945;
	Thu, 28 Nov 2024 08:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a/S6bdZg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EDD84A5E
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732783207; cv=none; b=O//UxSx5/KuOkJEE9Dor7wbtWVJishRTzTR4ZaaFG3kVsHxb/uHlZhVPRlyB3MdWVmhXXPev2+j1gr7BMxXrrLlSL9nimIrVKolZQoR9+JCEo+UxaXvmiG2+bkJzGASBuB+5f3F0lo+LGl7Z8hspsQlqGppuHR6Z6LUZ8eAxNI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732783207; c=relaxed/simple;
	bh=l8r4E+fAxvn95ykDQ3t+Nmyf8EYUz2dFT+lg2PPw2HI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RAkYx1A3cMt2sGv0Bh/iNM1RZikVQhBOWenRjMnDpjUSmRV3Qk7j6X2d4ihwMjGKY7pPnWReLfWLROZM15SFLxbFw1BIBq5LKnj1OjKba2kjr5t/XqGFJkaDeAP3zNcXvryppL6fGNTjgRAWFKEmpww0jnBm40PMmFJ879hGBiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a/S6bdZg; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-382442b7d9aso427875f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 00:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732783204; x=1733388004; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l8r4E+fAxvn95ykDQ3t+Nmyf8EYUz2dFT+lg2PPw2HI=;
        b=a/S6bdZgISDO9ZAz2kcR92XlvcoculYKlo91vd/zFSU/Sw2kFgYepEZSJAfhGb0apL
         UX5CgaJblqb9vJPKkyMxX3mqTari/FvD9vZoA9q8qYfICycwNN3QAzUioKRw4xgMlvKC
         xWSZMA0ZcdymKsrVsJ5KcrIZxP6dZBfXxQM/3EXvNFlVM2cjbTChgBV6TMeFP+zVDOdj
         NAi9nHvlE8mbue0940anXfAK4DBdYn5byMbJUEFqhAVeZciSQHpE6u8n3TpGJK9l0+GO
         /UtjV6wkKU9nR9h5kZZPNSJn5eRKz9OhrhnqVY6NwM/e38j79n6QSq33k4yftpGgrFXx
         GbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732783204; x=1733388004;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l8r4E+fAxvn95ykDQ3t+Nmyf8EYUz2dFT+lg2PPw2HI=;
        b=iEMcKm/DYRvRoFmJ4RmcketpKMVlhq/6pOt8RZaIiJATKcgOoHEHAhmiIvqoqA0Xs+
         kz4vxbzziCDDmJJ/3FUsP41NM6+Vn3Fody26ubxgKlVpzJmxRSdzUvYs3v0mJwYxgNlF
         95xInVnOieCgsX2nNaXQkrO9xOeqiCYovTLtNfIvG9uNdiyrpp1K363pG0WmCvQDSiht
         frmKuzXFytBIK7p21UAwI1AbdIbwWPh4dPMm/t85ZWFTVU6k7nXl/c76ZrGNsWKn4KET
         HFV4Tvcj7oH3bj1xbwwX/C6XWpxVc4jqA1hAsdqBWvLD26zQ6YI8VInL3lHQ1zM5vnr9
         iWoA==
X-Forwarded-Encrypted: i=1; AJvYcCWQuKYI+oegjAt4CcANuNxM1oKnyu72aWy5Y4iGkpAsNGCFfiw755FjCT2G0TairGDb/Ve1FnbW8Fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcSPi7rRqLoQkX8bFRqqYPqZ4sjXLrCrX+sAj0B1hbWGAM7zjf
	gF1kM3WyVzGhBjYWn7yUogwK1ntlzWoI0GupPXvDnKa5N7PDG6E4A/RYJl1UwmU=
X-Gm-Gg: ASbGnctW3je657UvyZ+v8/jGz/N7W8QpSEWx/4N9iL3hvXDvqjnbyzfCtvK6IFl0ELk
	aynCBqym7va80/dTvG7TBYWZLvBB7YNIJVMxWIb2ke+lLXVltZBQlzJlGgMelunMFRkx2BYbv0W
	Oa00hN04B2VMu4rA22pJFmn8PBGBuZaIfJlz4MrWipYRtLGZqWGql+2qzdCsITzEp/92F9+kWfu
	1VmKnDbid9juRDKmfkSOB1cI2AHIMpkNp21+Z7MGiP4Halgn80dyJE=
X-Google-Smtp-Source: AGHT+IHLCVGEBiGpNB3pr06gJDHBvejAWzRugYtAncqUTz6NJIMOpbiyuWDq3lH6CC8FDjfooG1oIw==
X-Received: by 2002:a05:6000:2d8a:b0:382:2f62:bd45 with SMTP id ffacd0b85a97d-385c6ec0980mr3638454f8f.29.1732783204673;
        Thu, 28 Nov 2024 00:40:04 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccce7859sm1096280f8f.0.2024.11.28.00.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:40:04 -0800 (PST)
Message-ID: <5d2a32a9bcc38f31beef56c04d07f6d53aa49e06.camel@linaro.org>
Subject: Re: [PATCH 2/6] dt-bindings: usb: max33359: add max77759 flavor
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
Date: Thu, 28 Nov 2024 08:40:03 +0000
In-Reply-To: <8325415b-4af9-4bef-8310-39410b10aa84@kernel.org>
References: 
	<20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-dts-v1-2-5222d8508b71@linaro.org>
	 <8325415b-4af9-4bef-8310-39410b10aa84@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-11-28 at 09:17 +0100, Krzysztof Kozlowski wrote:
> On 27/11/2024 12:01, Andr=C3=A9 Draszik wrote:
> > On the surface, Maxim's max77759 appears identical to max33359. It
> > should still have a dedicated compatible, though, as it is a different
> > IC. This will allow for handling differences in case they are
> > discovered in the future.
> >=20
> > max77759 is used on Google Pixel 6 and Pixel 6 Pro.
> >=20
> > Add a dedicated compatible to allow for potential differences in the
> > future.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> This should be sent separately to USB.

Sorry, it slipped through into this series somehow. Will do.

Thanks
Andre


