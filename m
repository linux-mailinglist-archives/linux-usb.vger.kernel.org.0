Return-Path: <linux-usb+bounces-12848-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 023D6944A9F
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 13:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D740B22544
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 11:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438FB194AC7;
	Thu,  1 Aug 2024 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lFS7pW2O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1402C190045
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 11:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722513071; cv=none; b=VQ2BmWfdxUrcObsWDtvnMTFEy+QjpmeLsMcduQeDcGKa6tSwi1a9gfyqBXiEpMwrjT/XlH8iQ9FNp/b/QtGcqDJ6/II6z32Mf+X9ruTl/URGhowObB9qUeZIBhlUD0sNBv0CnBjt4/zwpqa7nyXah344iEhlpkohHDhgPYpHuBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722513071; c=relaxed/simple;
	bh=YeNBD14C3kwHi1DP0R7xBeAKHNR2XSujM9HljvW/uwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMBZt8S5188QvJYzn7/9TogiCa7OP31k6Ym0i60iXPQWJIKN2KcqPOoLHozug7ewlZI1uXxILREmrmVhIoUZxdGZ5L6J/ewvpuLYYLSROiVTlZRHwpNwWps7xQy3eG8fudMia1IQLX3HQ6GcsqtwhJsrQWSO73ktq5xAjL5hZ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lFS7pW2O; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52efa16aad9so9954643e87.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Aug 2024 04:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722513068; x=1723117868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2uXxeexbnbDyJine/jy5b1tL6NFREtgJyBYIBURgb5k=;
        b=lFS7pW2O23wsWo/IM8rXvEOiN0T1OShlMR6317rZXpxUcofKmvlokFzOBOSq7DgCpr
         De/GOJyvtl8UYQKKVWt9S00cMNzipCK3kkhXnHySSluAb4W4xAeZsUYntPzzLbAgwlaL
         ++nN3qa8wmAq319o3ykfSjGADHKmLF+7MvZ1YidwF6Esgo+/eiJGBsmc5UrN5FWjWX7z
         eV0XX1sAgGb+CyLwL1SvxEW++IqUM0ws0zoaje57p78lOi2rEpjS96NXmZMg48ae0QXe
         O+8pYB/GEqLegdo15H8DXuuyj+99x7r26cRBuBHE1Du4+/G73r/lPVYwEscjwW9Ud/9q
         j5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722513068; x=1723117868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uXxeexbnbDyJine/jy5b1tL6NFREtgJyBYIBURgb5k=;
        b=L3XnLdUfknf6ZmQmY17gj7SZwma8N8AXRSb2Oxh6UUQOhuv1xPA6xKHzBZm/+O8v0R
         5nkcjXkDeWbhY2tzzM50Ja5iFX4329/xCGKbd02VaUe2pDKrZBVdACuydxLR6lb9JdNf
         RQ0s0H0zQwDpWVNmWvyn6zWa0Jne76IeS241E8lf79qZSgDg3ah9xXWTrdYQMkoU4LWZ
         VgY0hbz6ks+u9GsK29NARgKQirQkUMOfkkSzmqkVhvyy3+LZvR+Xhx/2kZaoSRi2121a
         4l0+CHjjDIrsLTm/LBVmT/2Vkwpnttkj6KY+c8uwV7tl1LXGBPZ65lDGLZHEXZ0xxaT4
         OVvA==
X-Forwarded-Encrypted: i=1; AJvYcCVyRHddHi/c7GHnIzqlO7Qr9K+Nm/NgV/7A8azV+q+nBkqdYrMqBr6RU82IX0OO14doEqr+D3jBhdfKsW5ulw47UinTzMfIz7bO
X-Gm-Message-State: AOJu0Yw+0oLe/WYW9v6y894tlsebFp44t7DRY8nlLtaCSYCNceqm08be
	317Q7lIEMEPmqF4pSePt3d3vvqdgi6wvMoZAtFhRm7tFY+iWdE26q1VF1byrpRU=
X-Google-Smtp-Source: AGHT+IGJGjlx9/PKhDj+PJ1AwCgR417PmZxBQW0jkbaFa4QxIlt3UdC8J0GtKy6GtFr21lnA33oGIQ==
X-Received: by 2002:ac2:568b:0:b0:530:aa82:a50a with SMTP id 2adb3069b0e04-530b61ece1fmr1735537e87.45.1722513067914;
        Thu, 01 Aug 2024 04:51:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc4262sm2601897e87.58.2024.08.01.04.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 04:51:07 -0700 (PDT)
Date: Thu, 1 Aug 2024 14:51:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH v2 2/3] arm64: dts: imx8mp-evk: add typec node
Message-ID: <lzbqvgpla2souin67crolhwyun4rxy5r6ax424xnd7ypuottjf@hyvhzywqu4u6>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
 <20240801064907.3818939-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801064907.3818939-2-xu.yang_2@nxp.com>

On Thu, Aug 01, 2024 at 02:49:06PM GMT, Xu Yang wrote:
> The first port of USB with type-C connector, which has dual data
> role and dual power role.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - modify endpoint label
>  - fix usb phy tunning property dtbinding warning
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 104 +++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index 938347704136..ef9b821a0ae2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/phy/phy-imx8-pcie.h>
> +#include <dt-bindings/usb/pd.h>
>  #include "imx8mp.dtsi"
>  
>  / {
> @@ -26,6 +27,20 @@ backlight_lvds: backlight-lvds {
>  		status = "disabled";
>  	};
>  
> +	cbdtu02043: typec-mux {
> +		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_typec_mux>;
> +		select-gpios =<&gpio4 20 GPIO_ACTIVE_HIGH>;
> +		orientation-switch;
> +
> +		port {
> +			usb3_data_ss: endpoint {
> +				remote-endpoint = <&typec_con_ss>;

Where do SS lines go after the cbdtu02043?
Also could you please point out the datasheet for the chip.

> +			};
> +		};
> +	};
> +
>  	hdmi-connector {
>  		compatible = "hdmi-connector";
>  		label = "hdmi";
> @@ -535,6 +550,49 @@ adv7535_out: endpoint {
>  
>  		};
>  	};
> +
> +	ptn5110: tcpc@50 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x50>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_typec>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> +
> +		usb_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 20000, 3000)>;
> +			op-sink-microwatt = <15000000>;
> +			self-powered;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					typec_con_hs: endpoint {
> +						remote-endpoint = <&usb3_data_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					typec_con_ss: endpoint {
> +						remote-endpoint = <&usb3_data_ss>;
> +					};
> +				};

SBU lines are not connected?

> +			};
> +		};
> +	};
>  };
>  
>  &i2c3 {
> @@ -704,7 +762,41 @@ &uart2 {
>  	status = "okay";
>  };
>  

-- 
With best wishes
Dmitry

