Return-Path: <linux-usb+bounces-24411-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA49ACA919
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 07:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 236C6189BE34
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 05:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0998190497;
	Mon,  2 Jun 2025 05:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w7lCvrTU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC21DDCD
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 05:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748843361; cv=none; b=hZ+tayfrNaQrBx/gZY2E+e3Yxy9dp0eKqcHKcQF0YqZQIiQZy03GS2qASAzCPD/E7af06ZFgp8Pns9GjuzjtiLRFbAIXT3p8n6OiEr/SE1Jn0WAbgXRNM3dOVyhtFZOkdpMAp1C1gMDVDZTHKhZXSOwUnyY96zDFqiUSRX0+XdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748843361; c=relaxed/simple;
	bh=TTcp0RH5goWWaDtNOyQbRWioZ+PFqTZ1mEjZoQQ13zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgYKomRKAwATZX1f1M3YQY7Ig6hWI9PALHj8j/ga5YRmpTtqWrFVErTWBoCASJFHxs7QaLMLXUnmbrOaup/RbGDW4NgfKiUH7kM/qJaNpjk7XnfekxV1CqizrGMjqhZWACaS7hPL188Qxsr0jyk68lP79P+zANZrlD+xLd9IfrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w7lCvrTU; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a36748920cso4572307f8f.2
        for <linux-usb@vger.kernel.org>; Sun, 01 Jun 2025 22:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748843356; x=1749448156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eyhHth04KPeox09Lk8fzATKM5wNicRHQ47sc7G5TLEA=;
        b=w7lCvrTUgP4PvPNpssNtUzdi/4jEQDtVOh2hc1CyZwWG8Aj+a0++8n5F9hgqipH2Hk
         reUlahuvA1MoaRJI3kVZwx9qGJ1T6WU5FnWlRADi1+nFH+6ZBEMumqGQysi4fn/96XdN
         +jC+PwOv4rnOuLd2jkJjjiLti+L4olyzKavOJ9YBfM+GhdnGODMjnQ+cDnvcRnfsov8P
         9lGhqViSAlSu159tKzT8jg/eEgOQMF+MUplQoZ+ZcSu5587ZGwfzZ+XEjTSJZDTZSL3c
         AO0QnmRpoUcwzzQiMQv3RDuoRftzI8fbsxtb9xwzTP6wO9MbvWEbn6dx2/cbX+skKkwS
         T/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748843356; x=1749448156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyhHth04KPeox09Lk8fzATKM5wNicRHQ47sc7G5TLEA=;
        b=oee+OQf+6L4dgwD8YImC9+o9M71qWpWvMSTPviuzMAE44zvLLZZOQ583y3asWNhLWs
         MiGIReVGdbLYqWXQdfs11+mZe27L3fCLKq/jlMMfr8X9nZOl65jeorvWZkwGrOQNMLlI
         6eSkWTl48HqGYBdAH1WXiQQ5nv8uGNjvIXuqYCPXL18sdmtFm7OOsWE6yrBe3GahiSDW
         bpwWGCyt2fH9uDEI1kzXX+p20Ygla7pONChpwaQ+Sqm3LvHya/6IEk6IDJdvn9kbM57t
         fwzW/qDd0HZcw8AWkSrbGwygtia5tYldlVINOr2jPIVOBIkBUuspQGXhwjv8MJWIqCQF
         ZGFw==
X-Forwarded-Encrypted: i=1; AJvYcCXv4vsOZgpQ+pzfA/f6092otccfi6wbCbit13uJirTYscP4NY0cr9lAnT1KemTlbf47+gZ1GsrNWg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDPcS2I7qNsmk5ruwseZxn/Ry5UQEalDC/hCbzWFrM+whjTvjd
	J3hu7pHraBS/aZQrgRPcj6krNTXTL45GK7AkZCAbJErWWR1VP+SzwK9JBNVTzCP0pno=
X-Gm-Gg: ASbGncvuguZmyzRX25EBb/K0n9Y/SPuCw6PFJCa4jJy2VILW8Qc3vc04sD9N63p+dmV
	hXv5ln5K9LovMlFliyw6N1mDHJfDEbhgAoSd+OOHvg4XuCQ9E+W9blQ5uzI3jIeBcbGHDTaiDAx
	ZUZ2P9lWyyLbr/zLFWgcsS+R6KnHFPDjK6hXfBhi6dHnQIlhBfTmtjKhg9kxCFVfyUcSam+mjai
	FmODZlKuiZC7zUbCPiYrNgCu3QD7dM1ibvj41CSJB0ymdNV3dxsawJ+xvtVOVShg3UsX+gOIY0v
	IXmcbHI/JvN/NxBYTfBoGkbRta1GX4fSDL/IJMWQFfvNvjLpVi/EMUk=
X-Google-Smtp-Source: AGHT+IGEywdUX0aydO7qeLoFT3cz6r5kcLRXivHxspZpsWx9ZaJ8+GE/6DPG8HaQObUmlr8SGOikgA==
X-Received: by 2002:a5d:64e8:0:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a4f89dab95mr8160871f8f.49.1748843355821;
        Sun, 01 Jun 2025 22:49:15 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-451d30a227csm43512715e9.0.2025.06.01.22.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 22:49:15 -0700 (PDT)
Date: Mon, 2 Jun 2025 08:49:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: Add compatible strings for
 s32g2/s32g3
Message-ID: <aD07VqXXTEVst79-@stanley.mountain>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <2a4317353557e4fac2a7bfa4261a75886eebe41b.1748453565.git.dan.carpenter@linaro.org>
 <aDd+nOo2KV2QmgXr@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDd+nOo2KV2QmgXr@lizhi-Precision-Tower-5810>

On Wed, May 28, 2025 at 05:22:36PM -0400, Frank Li wrote:
> On Wed, May 28, 2025 at 10:57:10PM +0300, Dan Carpenter wrote:
> > From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> >
> > Add the compatible strings for the NXP s32g2 and s32g3.
> >
> > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 2 ++
> >  Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml  | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > index cc5787a8cfa3..400d885fea96 100644
> > --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > @@ -24,6 +24,8 @@ properties:
> >            - nvidia,tegra114-udc
> >            - nvidia,tegra124-udc
> >            - qcom,ci-hdrc
> > +          - nxp,s32g2-usb
> > +          - nxp,s32g3-usb
> 
> keep alphabet order!

Ah, sure.

> Can you use b4 to send patch, look like cc list missed
> imx@lists.linux.dev

It's MAINTAINERS file which is wrong here.

$ ./scripts/get_maintainer.pl -f Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (maintainer:USB SUBSYSTEM)
Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Xu Yang <xu.yang_2@nxp.com> (in file)
Peng Fan <peng.fan@nxp.com> (in file)
linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
linux-kernel@vger.kernel.org (open list)
USB SUBSYSTEM status: Supported

regards,
dan carpenter


