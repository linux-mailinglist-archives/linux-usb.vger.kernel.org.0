Return-Path: <linux-usb+bounces-6745-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244F85A314
	for <lists+linux-usb@lfdr.de>; Mon, 19 Feb 2024 13:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A68931C230CC
	for <lists+linux-usb@lfdr.de>; Mon, 19 Feb 2024 12:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087952D611;
	Mon, 19 Feb 2024 12:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJ76bSpw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF492D046;
	Mon, 19 Feb 2024 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345317; cv=none; b=KfsaT4G3XJXvywNCuODVkkW6m8tVPkgg09FwYF/r68a1tKv12mWdukFuYJq2/jSz3LjLNNmvbWp6Ujc+5OHRSMR/takMKFofzXta0hDWGT1HkfRJNAOTQqxa27S/aRUga4Rm6NXsJa/GnFhCweS+VkEruLKXxQLOrfZIZ0yjWn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345317; c=relaxed/simple;
	bh=6flA8ZvRjaZ71CFJ3kj4db2BE67saNYipRMtxrzSZ5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t7r5I2gUMp+QXjXUY4mSAoUiXyjWMfxMI9QayPbBqb1Bc5LezwYj7WppNHi+zYi0OAAZteJ3xI9wRWYDfdC+9zGqnLkcD3OGJprFC3G1CSNxlqkxXCXvWcnnAHQDCBfEAPosqg2zYSyR18NkBwmLjE/pG7HSCnw7pkZ/wOyyu7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJ76bSpw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F10C433C7;
	Mon, 19 Feb 2024 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708345317;
	bh=6flA8ZvRjaZ71CFJ3kj4db2BE67saNYipRMtxrzSZ5I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iJ76bSpw1PvQfe+AEUTn1lRTMq6w7ce4Yq4mtOtjA/CffofGJptLjFvUlDjBi0/61
	 b1n1YEfu6tXRzOhZSCv8+r4etCooTj827qehitIjg8yGJUN+sacHlVbqP6MbcR/o2d
	 GHLOI/Xp0ZAlzb5q5DGg74lbG5m0uXKnNZdOYa+TLwnCZHpYtB11UEi0zENdJekvDl
	 IDRr8gJpX4e+NLKR52krXSwiosQG/CjUX/FGIpShsI9W+RpRcAsJjlXme+GmRLrl2Z
	 iEzHFoWiSFp++KrWDEyo++unNHHjm2XKMIJ3mfjEmyh4aXRgnJJ/0FQKKtZe5hlUmz
	 bOw+xPnta2t/w==
Message-ID: <0b4464eb-631e-4c9f-a7c8-3451be15d8b4@kernel.org>
Date: Mon, 19 Feb 2024 13:21:50 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: xhci: Add support for Google XHCI controller
Content-Language: en-US
To: Puma Hsu <pumahsu@google.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com
Cc: badhri@google.com, royluo@google.com, howardyen@google.com,
 albertccwang@google.com, raychi@google.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20240219061008.1761102-1-pumahsu@google.com>
 <20240219061008.1761102-3-pumahsu@google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240219061008.1761102-3-pumahsu@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/02/2024 07:10, Puma Hsu wrote:
> In our SoC platform, we support allocating dedicated memory spaces
> other than system memory for XHCI, which also requires IOMMU mapping.
> The rest of driver probing and executing will use the generic
> xhci-plat driver.
> 
> We support USB dual roles and switch roles by generic dwc3 driver,
> the dwc3 driver always probes xhci-plat driver now, so we introduce
> a device tree property to probe a XHCI glue driver.
> 
> Sample:
>   xhci_dma: xhci_dma@99C0000 {
>     compatible = "shared-dma-pool";
>     reg = <0x00000000 0x99C0000 0x00000000 0x40000>;
>     no-map;
>   };
> 
>   dwc3: dwc3@c400000 {
>     compatible = "snps,dwc3";
>     reg = <0 0x0c400000  0 0x10000>;
>     xhci-glue = "xhci-hcd-goog";

NAK, that's not DWC3 hardware in such case.

...

>  		return -ENOMEM;
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 4448d0ab06f0..1c1613c548d9 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -61,6 +61,12 @@ config USB_XHCI_PLATFORM
>  
>  	  If unsure, say N.
>  
> +config USB_XHCI_GOOG
> +	tristate "xHCI support for Google Tensor SoCs"
> +	help

Please always Cc Google Tensor SoC maintainers and Samsung SoC
maintainers on your contributions around Google Tensor SoC.

Anyway you just tried to push vendor code to upstream without aligning
it to usptream code style and to proper driver model. That's not good.
Please work with your colleagues in Google to explain how to upstream
vendor code. There were many, many trainings and presentations. One
coming from Dmitry will be in EOSS24 in two months.

Best regards,
Krzysztof


