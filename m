Return-Path: <linux-usb+bounces-31571-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB76CCAD5B
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 09:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE4263063864
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 08:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D37336EE7;
	Thu, 18 Dec 2025 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqkD4ufu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F044335BC1;
	Thu, 18 Dec 2025 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045684; cv=none; b=KF51EeTGe3UBAaKyltf5Fx/HjX8E+6OBjRMSMYu29Nlv1yh8iaMr1fv08YCpGyPKCyqUbmGJO1prMidUTulE65znFlFhKy506DwTV7ZqitSbTtIpQsIAV64SsXRePUzyriAXRcNGzRBL2r8RphN2i159Q7I1psDQv7EfG2C5B44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045684; c=relaxed/simple;
	bh=y7TtX8+iLOnaZvRGv4vOgDBVzMPtjU08gAuozivb/eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwDm8BuHXKjlrMvy5QG4yOGBAr0HWoDP7udxW99rSBUcp0nkwiXnwVj6cTifFVnhijH4GUSbLzIB3GOT0mmIFy2HZVsGm6XlAF9uOkHphiiF+TUWA1rV82tjeDxiIXa8QvCuDZSXbrRCN+jEuLtKEQPzjRn7XxncSLMmpVbymxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqkD4ufu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F2CC4CEFB;
	Thu, 18 Dec 2025 08:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766045684;
	bh=y7TtX8+iLOnaZvRGv4vOgDBVzMPtjU08gAuozivb/eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YqkD4ufulbLCET4gYmTzcEh4Aj8WoamMUS19qmiC+KY5q84cOm9derASQRQSw3GEm
	 YPdPKXr2WNgsZi+jvgVconDppJLCIkxwTRVNak/B1svlD9WTOLcMv06A7x4/6Q0G+b
	 vPIYK5mQNfBkluTtf2ytyYoBWGAwtJrp7aevwAFr/Gc3IZCIqhqGUfwQG6vgI8KbqB
	 9gHVpPDeQXYUJLlHDwoPsZ8tUw/ACOotR4+Q7UDAJc0caCPbopDKp2Etckr08i5ZLa
	 dR/PrhFgVPMFm7egU5g2M1+NEVr8/vX8NTQkK2Itx3aUpkQtocU6A/nWk8RJoBRloa
	 Aj3immWtyNVnA==
Date: Thu, 18 Dec 2025 09:14:41 +0100
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: lemans-evk: Enable USB1
 controller for host mode
Message-ID: <20251218-winged-hypnotic-jellyfish-370cda@quoll>
References: <20251216120749.94007-1-swati.agarwal@oss.qualcomm.com>
 <20251216120749.94007-5-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251216120749.94007-5-swati.agarwal@oss.qualcomm.com>

On Tue, Dec 16, 2025 at 05:37:49PM +0530, Swati Agarwal wrote:
> Enable USB1 controller for host mode on EVK Platform.
> 
> For secondary USB Typec port, there is a genesys USB HUB GL3590 having 4
> ports sitting in between SOC and HD3SS3220 Type-C port controller and SS
> lines run from the SoC through the hub to the Port controller. Mark the
> second USB controller as host only capable.
> 
> Added HD3SS3220 Type-C port controller along with Type-c connector for


"Add". Write consistent messages.

> controlling vbus supply.

...

> +			port@1 {
> +				reg = <1>;
> +
> +				usb1_hs_in: endpoint {
> +					remote-endpoint = <&usb_hub_2_1>;
> +				};
> +
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				usb1_ss_in: endpoint {
> +					remote-endpoint = <&usb_hub_3_1>;
> +				};
> +
> +			};
> +		};
> +	};
> +
>  	edp0-connector {
>  		compatible = "dp-connector";
>  		label = "EDP0";
> @@ -140,6 +182,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
>  		enable-active-high;
>  	};
>  
> +	vbus_supply_regulator_1: vbus-supply-regulator-1 {

No, do not introduce your own style. Read the code here - how such
nodes are called?

Best regards,
Krzysztof


