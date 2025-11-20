Return-Path: <linux-usb+bounces-30772-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1FAC72C0F
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 09:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 0D4BB2937E
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 08:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55782EB87C;
	Thu, 20 Nov 2025 08:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kpW7Ue26"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192CD23D7EA;
	Thu, 20 Nov 2025 08:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763626673; cv=none; b=sVCoP6FdYn9D44kHj8mzEx3JhUO+IIThj/Qh1+n+gvQnbhug+ySjfwpqGsnAc5LmwYoz2m6S+VSWZZ/vNyZoGfECR3+p6MjNHyw9kE4QU8+tuthLaSu3kembDGxlIBmEP3+DRSgme3txRZD0iM0fBXCqA7magF9jWnq8gD0emfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763626673; c=relaxed/simple;
	bh=vCh0Nf9ol/SJ8LORneyZFWOq+kGqweHI+LiY7Sod7EY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyH8vpWaiGO+ifCDKpI7wRk3w5vnuXtFddHSF+FOmLjR/Wi+ZftIWMpYlv1p3X+MMJHk7RWlyT11Q84rXpHfvOpbngPfydtNMZIsoofk9K3FcB0HdJ3vmkqB81edEURVUVLh2CnJlKqNdZGpR+G9NhkuPqJxfbsCVqQ+onEClYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kpW7Ue26; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1C1C4CEF1;
	Thu, 20 Nov 2025 08:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763626671;
	bh=vCh0Nf9ol/SJ8LORneyZFWOq+kGqweHI+LiY7Sod7EY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpW7Ue26N0TujXycX/gjDfNHp8Uup9OzwpT01gMm2Ae9M94LKOK393piRsqZVieED
	 Ai2yZe2evN3jXQG4g5R9DD3dFp3Tk95SdGBB8zpau3tLuvsZF86ieQwxfWrpCvuHnl
	 Hy/vvTpE6d7VLJ5oyQ0AEieg148Qb69/T2/T3GfnF9yK+Mam8qEADjAxHQHuALTUw+
	 AYA8os2aXRWfVaQZJ/Obg45FEndp+3bgiyaty3W91Hm2xAKE/QklRqoM9YYeLtdwqi
	 bRWF8O1X3V39DLllsfceQ5sdmHTI16jae3zzF+1VRnLOFU40krHrTT7kgSWLB7vi0l
	 sK4WQOi/kxAmw==
Date: Thu, 20 Nov 2025 09:17:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, michal.simek@amd.com, Thinh.Nguyen@synopsys.com, 
	p.zabel@pengutronix.de, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3-xilinx: Add MMI USB support
 on Versal Gen2 platform
Message-ID: <20251120-affable-markhor-of-authority-a9e63c@kuoka>
References: <20251119193036.2666877-1-radhey.shyam.pandey@amd.com>
 <20251119193036.2666877-2-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251119193036.2666877-2-radhey.shyam.pandey@amd.com>

On Thu, Nov 20, 2025 at 01:00:34AM +0530, Radhey Shyam Pandey wrote:
> Versal Gen2 platform multimedia integrated (MMI) module has a USB3.2 Gen
> 2x1 Dual Role Device IP. Introduce a new compatibility string to support
> it and make reg optional as the register space for USB wrapper IP is moved
> to MMI System-Level Control registers.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> index d6823ef5f9a7..502294649a6b 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> @@ -15,6 +15,7 @@ properties:
>        - enum:
>            - xlnx,zynqmp-dwc3
>            - xlnx,versal-dwc3
> +          - xlnx,versal2-mmi-dwc3

All other cases were calling your SoC "versal2", not "versal2-mmi".

Add here missing blank line.

>    reg:
>      maxItems: 1
>  
> @@ -37,8 +38,9 @@ properties:
>        A list of phandle and clock-specifier pairs for the clocks
>        listed in clock-names.
>      items:
> -      - description: Master/Core clock, has to be >= 125 MHz
> -          for SS operation and >= 60MHz for HS operation.
> +      - description: Master/Core clock, has to be >= 156.25MHz in SSP
> +          mode, >= 125 MHz for SS operation and >= 60MHz for HS
> +          operation.
>        - description: Clock source to core during PHY power down.
>  
>    clock-names:
> @@ -87,7 +89,6 @@ patternProperties:
>  
>  required:
>    - compatible
> -  - reg

Hm? No. Block without address space makes little sense and is completely
different device.

Look at this binding - there is no way this device can be programmed
anywhow, because mentionned MMI sys registers are not there.

This is a messy, incomplete and confusing change. We ask always to post
complete bindings, for complete hardware, so put attention to this.

Best regards,
Krzysztof


