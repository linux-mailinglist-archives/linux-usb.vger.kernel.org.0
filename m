Return-Path: <linux-usb+bounces-19688-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B549A1AC7A
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 23:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64810188CE39
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 22:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDF21CDFD3;
	Thu, 23 Jan 2025 22:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZwJwS82"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CFB47A7E;
	Thu, 23 Jan 2025 22:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737670188; cv=none; b=m5R3Ce2m6e+tDdcnk7gTmZzEvDWcLJPQyAnNt6upWx0WjUnsZ8CiMYU3eQQjenakI5PtbL7/ut5583RroLjclscbmq1Ik3HqIWZmmlGV0d4LVTaAdPGLcEFqQbeFKMVXw5OGH9rvBS1ETqtIuSEtYyvVF/jW25kB7b9FJusF68M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737670188; c=relaxed/simple;
	bh=GnyZQ++mmddfCUBYwNZ3f5Vqkm3s2uA02jx7DMrwiCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwLZJQSDz3NY1NF0+XhdmGlBVrsKiwY3fA3NSeYQL2zhya20uZZe0VOb065KRouLDw4OF0WHVxzdTVAS+oXdT9GklTS4TwRcastzxKCy6TzUFvrtX0uvGJMIENWCeWF5SvQ9cy9r/tEq8riHNPWl6RHzs7IgRDmGlBvxq+0xI4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZwJwS82; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03EDC4CED3;
	Thu, 23 Jan 2025 22:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737670187;
	bh=GnyZQ++mmddfCUBYwNZ3f5Vqkm3s2uA02jx7DMrwiCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZwJwS82OuxHjBF5AJ6GC6Xi/lYX1aBwTXGxQbisfkf0cqlugv4s6fFfeWjY2x7im
	 if//OEZkGSp/WwEghHn8qcvJQuQPGWFsP6W1qHJKIU6fhWT2ulVO1dzFSAi5ZWxbBP
	 lomwVySojpwvAH7Vd6HIYr8b32vwNFegqbuzItcCpBz//Of8AwKb8QhlQRudhUIShu
	 9yC+Mica9DTZD/wdA+l6zcvKjmw9PTY5DZa3f9IIn0uxn1gVfz3jvqDG5sCXHUCquG
	 g36ZFL27at0tnyZC/hEG9dh2humKhyUbsVEmGrdwb2JLbzRd/gmo4WicoXaCcR1oHt
	 AviIOrQt623LA==
Date: Thu, 23 Jan 2025 16:09:46 -0600
From: Rob Herring <robh@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: usb: dwc3: Add a property to reserve
 endpoints
Message-ID: <20250123220946.GA407034-robh@kernel.org>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116154117.148915-2-andriy.shevchenko@linux.intel.com>

On Thu, Jan 16, 2025 at 05:40:46PM +0200, Andy Shevchenko wrote:
> Some of the endpoints may be reserved by hardware for different purposes,
> e.g., tracing control and output. This is the case, for instance, on
> Intel Merrifield and Moorefield platforms that reserve a few and USB driver
> may not use them for the regular transfers. Add the respective bindings.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 1cd0ca90127d..2ae8e5e85f78 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -109,6 +109,16 @@ properties:
>    resets:
>      minItems: 1
>  
> +  snps,reserved-endpoints:
> +    description:
> +      Reserve endpoints for other needs, e.g, for tracing control and output.
> +      When set, the driver will avoid using them for the regular USB transfers.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 30

Please make minItems explicit.

> +    items:
> +      minimum: 2
> +      maximum: 31
> +
>    snps,usb2-lpm-disable:
>      description: Indicate if we don't want to enable USB2 HW LPM for host
>        mode.
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

