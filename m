Return-Path: <linux-usb+bounces-2078-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 547307D3C49
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 18:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43FF01C20A1E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 16:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C5B1D550;
	Mon, 23 Oct 2023 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKj3FUNA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E551CA96;
	Mon, 23 Oct 2023 16:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9513C433CA;
	Mon, 23 Oct 2023 16:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698078188;
	bh=zHfAntJF659ZXEdU01P0pwRPRHt3P7xAjAvUFOn2ic0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IKj3FUNAb3E0vctM7jf/Nljaub340tKF75OnwYllA5P7bXYezvK+kefFeBlaQzTY/
	 5Vw1thzKtTQyMvfEyi+5yRFJxGJXFFfljrJ3qx1avcduYqA88caJd2syK9g5b4AgV0
	 VURltqu5n9TksXk0rXvBhgiAFJXRpMLRFIS0kPOlTJR1+5B2dYoDI7i7waRvom4+BN
	 F3OP1GhMaCpXnokqTrzTR6t5TffswY2NkOPNhzEpao8rbKtxJUsfw+wgnjG1QlkpX5
	 Sf2IxsmEYih3V4jQ4QoOWUgByopxFMvRpHaO/SSu92LE+XCg7TP1bOA88Ju0ilt6P/
	 ijSOEk/PgfKHQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1quxi7-0002AB-1c;
	Mon, 23 Oct 2023 18:23:23 +0200
Date: Mon, 23 Oct 2023 18:23:23 +0200
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_pkondeti@quicinc.com,
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com,
	ahalaney@redhat.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH v13 09/10] arm64: dts: qcom: sa8295p: Enable tertiary
 controller and its 4 USB ports
Message-ID: <ZTad-_toGkumYx6O@hovoldconsulting.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-10-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007154806.605-10-quic_kriskura@quicinc.com>

On Sat, Oct 07, 2023 at 09:18:05PM +0530, Krishna Kurapati wrote:
> Enable tertiary controller for SA8295P (based on SC8280XP).
> Add pinctrl support for usb ports to provide VBUS to connected peripherals.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 49 ++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> index fd253942e5e5..271000163823 100644
> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>

Sort order ('p' < 'r').

> +&usb_2 {
> +	pinctrl-0 = <&usb2_en_state>,
> +		    <&usb3_en_state>,
> +		    <&usb4_en_state>,
> +		    <&usb5_en_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
>  &usb_2_hsphy0 {
>  	vdda-pll-supply = <&vreg_l5a>;
>  	vdda18-supply = <&vreg_l7g>;
> @@ -729,3 +740,41 @@ wake-n-pins {
>  		};
>  	};
>  };
> +
> +&pmm8540c_gpios {

Sort order here too ('p' < 't' in "&tlmm").

> +	usb2_en_state: usb2-en-state {

No need to include '_state' in the labels.

Johan

