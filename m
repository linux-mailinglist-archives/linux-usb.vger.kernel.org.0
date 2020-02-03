Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCC3151385
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2020 00:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgBCXwg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Feb 2020 18:52:36 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41127 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgBCXwg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Feb 2020 18:52:36 -0500
Received: by mail-pg1-f193.google.com with SMTP id l3so4603000pgi.8
        for <linux-usb@vger.kernel.org>; Mon, 03 Feb 2020 15:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hQXKHSBB+TimIjf+dRcAsluwvmDBaENSwvXm/Er2QAA=;
        b=ecYZP72ajzWw1Ok7N3tvfXDA3yuLJZ7tWR3DpHu5I6m1sJZHw8suDVga/0dKTXMCcG
         ohSl8kcu0uZe1aooQ3LVSpJ5Q2WHABdl2PDEudY3UmOrreStoFqc7WLILjjQXAkxT3Kf
         sQweRPGdb5taqT0dH+oBZ8mMdTD1rIrTGf/Ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hQXKHSBB+TimIjf+dRcAsluwvmDBaENSwvXm/Er2QAA=;
        b=G/T4onzm+Bd3MoW5fH9VQPZlzuHbwUD+lIQ2ZhU7J/k0d59IMiuGrtvYR/EjuMdiK7
         e8tvvrakZqt0B7H1lGxi3yh8o2uXafxE/BerSGV1XEOam3qJ+m95Vj9zLLiDPve7Ln4F
         ktFuthAPvN5wxV3uiJ5kT0Hx3fj0FM0YA1xSSvH7LAA3GBRhd/O4ugc/hO6VY5DPC6WZ
         Xdb5gxEH80W1M/ebCH9bV4mjK8fm8wCxYNRTLAso1h2/ohlM7nLkkVs+0Q7TEqu36bxy
         MeG3WFFn23Loa4qS8wpoaR60CceCq4NnLW3/PjtT8BHko5du6tQrfJOqOkSAKEd55BGi
         9FBQ==
X-Gm-Message-State: APjAAAX+1p3q7pKOH5b81EhqV0DTqtwSga7Wq+Q97xQK9Lq4QAhCQK43
        vyZxnOhZbeKNCnnXoNUP31yeaVRR7Fo=
X-Google-Smtp-Source: APXvYqx6VGCy9bmBIK1YHswdYi2TUJ3aRxGYv2qBXer5sufSWpW517z9F576g7+gDrwfAHcG0JwJbA==
X-Received: by 2002:a63:bc01:: with SMTP id q1mr29662648pge.442.1580773955522;
        Mon, 03 Feb 2020 15:52:35 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id m12sm564274pjf.25.2020.02.03.15.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 15:52:34 -0800 (PST)
Date:   Mon, 3 Feb 2020 15:52:33 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     cchiluve <cchiluve@codeaurora.org>
Cc:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH V4 3/3] arm64: dts: sdm845: Add interconnect properties
 for USB
Message-ID: <20200203235233.GA16993@google.com>
References: <1568983997-20004-1-git-send-email-cchiluve@codeaurora.org>
 <1568983997-20004-4-git-send-email-cchiluve@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1568983997-20004-4-git-send-email-cchiluve@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Chandana,

On Fri, Sep 20, 2019 at 06:23:17PM +0530, cchiluve wrote:
> From: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> 
> Populate USB DT nodes with interconnect properties.
> 
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fcb9330..e4885f3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1837,6 +1837,12 @@
>  
>  			resets = <&gcc GCC_USB30_PRIM_BCR>;
>  
> +			interconnects = <&rsc_hlos MASTER_USB3_0
> +					 &rsc_hlos SLAVE_EBI1>,
> +					<&rsc_hlos MASTER_APPSS_PROC
> +					 &rsc_hlos SLAVE_USB3_0>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
>  			usb_1_dwc3: dwc3@a600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a600000 0 0xcd00>;
> @@ -1881,6 +1887,12 @@
>  
>  			resets = <&gcc GCC_USB30_SEC_BCR>;
>  
> +			interconnects = <&rsc_hlos MASTER_USB3_1
> +					 &rsc_hlos SLAVE_EBI1>,
> +					<&rsc_hlos MASTER_APPSS_PROC
> +					 &rsc_hlos SLAVE_USB3_1>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
>  			usb_2_dwc3: dwc3@a800000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a800000 0 0xcd00>;

The patch "arm64: dts: sdm845: Redefine interconnect provider DT nodes"
(https://patchwork.kernel.org/patch/11326603/) reorganizes the SDM845
interconnect nodes and the node 'rsc_hlos' ceases to exist.
