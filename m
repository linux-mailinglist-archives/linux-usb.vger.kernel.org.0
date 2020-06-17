Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E3E1FD4B5
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jun 2020 20:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgFQSls (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jun 2020 14:41:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40205 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726835AbgFQSls (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Jun 2020 14:41:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592419307; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=P8b5JOxhRUXeY99+Bs74zgYrVahy5f7jYS7XTHseLgo=; b=R4fqqVAuCkmqdco3YQsRhWEF+qGDp4UAHfRfEDIr6E7iWinYgVgEfh8hRGIHOBwePvTOVWyk
 cskoWrAEWJheAGDCu+AUfA5Jsn51sp/s6pUVPGP3nbgIZvVz8z77P3/m+4Cs/QXyxktigUe6
 sksXTU1ZrJdW9Tux0K+ZUMnT9CU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5eea63dcc76a4e7a2aadc599 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Jun 2020 18:41:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0555CC433A0; Wed, 17 Jun 2020 18:41:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9342EC433C8;
        Wed, 17 Jun 2020 18:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9342EC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
Date:   Wed, 17 Jun 2020 11:41:23 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     heikki.krogerus@linux.intel.com, mark.rutland@arm.com,
        broonie@kernel.org, bjorn.andersson@linaro.org,
        gregkh@linuxfoundation.org, lgirdwood@gmail.com, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org,
        bryan.odonoghue@linaro.org, lijun.kernel@gmail.com
Subject: Re: [PATCH v3 6/6] arm64: boot: dts: qcom: pm8150b: Add DTS node for
 PMIC VBUS booster
Message-ID: <20200617184123.GA24052@jackp-linux.qualcomm.com>
References: <20200617180209.5636-1-wcheng@codeaurora.org>
 <20200617180209.5636-7-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617180209.5636-7-wcheng@codeaurora.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey Wesley,

On Wed, Jun 17, 2020 at 11:02:09AM -0700, Wesley Cheng wrote:
> Add the required DTS node for the USB VBUS output regulator, which is
> available on PM8150B.  This will provide the VBUS source to connected
> peripherals.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi   | 6 ++++++
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> index ec44a8bc2f84..b7274d9d7341 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> @@ -22,6 +22,12 @@ power-on@800 {
>  			status = "disabled";
>  		};
>  
> +		qcom,dcdc@1100 {
> +			compatible = "qcom,pm8150b-vbus-reg";
> +			status = "disabled";
> +			reg = <0x1100>;
> +		};
> +
>  		qcom,typec@1500 {
>  			compatible = "qcom,pm8150b-usb-typec";
>  			status = "disabled";

Don't you also need a "usb_vbus-supply" property here under the Type-C
node pointing to the phandle of the vbus reg?

Jack

> diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> index 6c6325c3af59..3845d19893eb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> @@ -426,6 +426,13 @@ &usb_1 {
>  	status = "okay";
>  };
>  
> +&spmi_bus {
> +	pmic@2 {
> +		qcom,dcdc@1100 {
> +			status = "okay";
> +		};
> +};
> +
>  &usb_1_dwc3 {
>  	dr_mode = "peripheral";
>  };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
