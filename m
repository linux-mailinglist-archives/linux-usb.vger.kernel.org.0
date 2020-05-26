Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 186011A19AE
	for <lists+linux-usb@lfdr.de>; Wed,  8 Apr 2020 03:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgDHBpB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Apr 2020 21:45:01 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41135 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgDHBpB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Apr 2020 21:45:01 -0400
Received: by mail-pg1-f196.google.com with SMTP id m13so2599155pgd.8
        for <linux-usb@vger.kernel.org>; Tue, 07 Apr 2020 18:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mCRX+u0EzkouFlVj2I8+tMZ9dUXOFhMUWExUwyGm5Rg=;
        b=p03uQJ7ud8vwzag3CvCsja1s50qF/SREZ9xucJouNwLDaRVbhNPRB0pXqqFbkUpqjx
         rT54kt2OIhSYy5DIj3LnCVl7qBw92oH9FJR1qqsnzSx/FPK9aoCVFoZOZk7nJPNhJ4WP
         W7AOMORt78aqK7s9YKYT8wjBChTKV6x8emy5JtV3XBRe1Us5StqL956d8667Gw4mfhdt
         lcNOw7RsLpHvVqrS9H3bCfQntZwMtOjF2Duiy1SntiynuTyIxM2UWeMQlCrJZ0W+vqsC
         jYVKofj38UNQrbWjz4vsfYFYL64TPTK/RzjctHu+DzkuZ5tUuxkL705uNY/NWJ0UycPT
         FdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mCRX+u0EzkouFlVj2I8+tMZ9dUXOFhMUWExUwyGm5Rg=;
        b=WIiaS6dTeSV56iBpWs8LNld1V1oKfR/fknD12EZh1YiBNPoMuGEpc/rKMFgK1d9TEM
         3ryn2V0WDDzUA+gnyq3ecmOyXJBGZNXIryYX06gHIV8PEnp8DHsFWTOTkVKq4/XbikqX
         SbPq9/wzQnOC5IrqC1hWYfomQml0BdwPYw7VlAV/OgkIQBTP9oOg42QGvpFZ6XkMV/Cv
         p2d01PdfzmHrtXRrS7DGPGnWYtyzLb4cZOLr1o/Z01U+NL+xuo2USVKBHNz/BgjE5Vc6
         Kc1bUAyIuyyEbQ7qMuqbe0dJtm9trgMUcS4qhNiDbtD/c7U4Lb6jKpdTl1G7/vsfZRpX
         XIsQ==
X-Gm-Message-State: AGi0PuZ1G/v1pHNgBGEyKu7TxA7jpuoVpe79WADIS23ViRX3QGVD16w8
        /zulZIe7w8vcnKvNg1q02wJabQ==
X-Google-Smtp-Source: APiQypJHbdsjUjdO3GZGBGPjNOIcwZNKSGxUxtc39Bq+YhExFx7WLZMfvsazzbjAusJ/x+6bnuZ29A==
X-Received: by 2002:a63:1716:: with SMTP id x22mr4646155pgl.89.1586310300198;
        Tue, 07 Apr 2020 18:45:00 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id iq23sm2735889pjb.18.2020.04.07.18.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 18:44:59 -0700 (PDT)
Date:   Tue, 7 Apr 2020 18:45:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, robh@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcs404-evb: Enable USB controllers
Message-ID: <20200408014505.GB576963@builder.lan>
References: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
 <20200311191517.8221-7-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311191517.8221-7-bryan.odonoghue@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed 11 Mar 12:15 PDT 2020, Bryan O'Donoghue wrote:

> This patch enables the primary and secondary USB controllers on the
> qcs404-evb.
> 
> Primary:
> The primary USB controller has
> 
> - One USB3 SS PHY using gpio-usb-conn
> - One USB2 HS PHY in device mode only and no connector driver
>   associated.
> 
> Secondary:
> The second DWC3 controller which has one USB Hi-Speed PHY attached to it.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Hi Bryan,

I dropped the role switching for now, did some testing and applied the
series for v5.8. Let's follow up with a patch adding the role switching
once the dwc3 discussion is sorted out.

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 40 ++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> index 44c7dda1e1fc..4dc3f45282fe 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> @@ -319,6 +319,46 @@ pinconf {
>  	};
>  };
>  
> +&usb2 {
> +	status = "okay";
> +};
> +
> +&usb2_phy_sec {
> +	vdd-supply = <&vreg_l4_1p2>;
> +	vdda1p8-supply = <&vreg_l5_1p8>;
> +	vdda3p3-supply = <&vreg_l12_3p3>;
> +	status = "okay";
> +};
> +
> +&usb3 {
> +	status = "okay";
> +	dwc3@7580000 {
> +		usb-role-switch;
> +		usb_con: connector {
> +			compatible = "gpio-usb-b-connector";
> +			label = "USB-C";
> +			id-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +			vbus-supply = <&usb3_vbus_reg>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&usb3_id_pin>, <&usb3_vbus_pin>;
> +			status = "okay";
> +		};
> +	};
> +};
> +
> +&usb2_phy_prim {
> +	vdd-supply = <&vreg_l4_1p2>;
> +	vdda1p8-supply = <&vreg_l5_1p8>;
> +	vdda3p3-supply = <&vreg_l12_3p3>;
> +	status = "okay";
> +};
> +
> +&usb3_phy {
> +	vdd-supply = <&vreg_l3_1p05>;
> +	vdda1p8-supply = <&vreg_l5_1p8>;
> +	status = "okay";
> +};
> +
>  &wifi {
>  	status = "okay";
>  	vdd-0.8-cx-mx-supply = <&vreg_l2_1p275>;
> -- 
> 2.25.1
> 
