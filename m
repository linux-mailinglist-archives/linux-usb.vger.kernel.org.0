Return-Path: <linux-usb+bounces-31570-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A04D9CCAD87
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 09:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9698300B301
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 08:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5878133122C;
	Thu, 18 Dec 2025 08:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/B1jtPM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E402F2913;
	Thu, 18 Dec 2025 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045604; cv=none; b=Snl+5E9itYbtpcjl6ffQQdXaMTZerFj512Q3TO4R4dgpRKYi8Equ//ifFkR2w1yDaU11Rj/HffV+TGlSmGKwENvfayweDd9U6dtTduWxgJOP7IjsAeX67wlwUIoyX6owV7S/daPZ+RGwtJ8PGHyLrMadrQj5ERAyFfdwmqEBPaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045604; c=relaxed/simple;
	bh=GuMVOmjC3D+gLDhC5c14ynNE2/7FKdRL6OvdYcv6+j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyJippGX2TS5zV9wZbpg/7nVjFfHugAppbaO2P2hMMZeU3QxvHsGYZ/8LqSXYSf1hB00BCJZ8Ei8Z71j88vpGCtQ0ocYz3VhSqNlFNEGZIHxPabqDUPLj95Dtt4wM7taVQs67zf5xZ+sGrxmvcjHBOhHb+lGJqx47iDC75Rola8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/B1jtPM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D127EC113D0;
	Thu, 18 Dec 2025 08:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766045603;
	bh=GuMVOmjC3D+gLDhC5c14ynNE2/7FKdRL6OvdYcv6+j4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D/B1jtPM25JPHwd9O54VUTxxepoHQbyOqTpRVL7ZGHDSHQaK8ex9JxaO91wu1JLOm
	 wP91JjC6I8WYZ8GGVlQwEgJkkyS/Nqi1na9UHQtwAZ0zd6AaNO28i05Ts0gzn/1YOK
	 v2zjj1us28co9IWgA9LILZIDvZorm7jNeP1NAVJ0BSwHB1/bkQLbR+SyiCEDoMmKoO
	 g2lHKkAacruEidy/oi9gXc4QQb2JPcunsNchjCK2bnJzB6zlXq/4EaHf37Zw6WW3ym
	 W9Ka8K/KEiquzAjkHoUuePaHfPVw5UWJvyWAcR8oUR5hC41Zdh3R+EsfaOwvGK1olx
	 23uBiRkhjJ03Q==
Date: Thu, 18 Dec 2025 09:13:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>, Mike Looijmans <mike.looijmans@topic.nl>, 
	Pin-yen Lin <treapking@chromium.org>, Catalin Popescu <catalin.popescu@leica-geosystems.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: Add binding for Genesys Logic
 GL3590 hub
Message-ID: <20251218-silky-daring-octopus-9a9c11@quoll>
References: <20251216120749.94007-1-swati.agarwal@oss.qualcomm.com>
 <20251216120749.94007-2-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251216120749.94007-2-swati.agarwal@oss.qualcomm.com>

On Tue, Dec 16, 2025 at 05:37:46PM +0530, Swati Agarwal wrote:
> Add the binding for the USB3.2 Genesys Logic GL3590 hub.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> index 9a94b2a74a1e..6665fc4baf61 100644
> --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> @@ -15,6 +15,7 @@ properties:
>        - usb5e3,608
>        - usb5e3,610
>        - usb5e3,620
> +      - usb5e3,625

Incomplete patch. Please read entire binding.

Best regards,
Krzysztof


