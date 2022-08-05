Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D53358AF30
	for <lists+linux-usb@lfdr.de>; Fri,  5 Aug 2022 19:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241434AbiHERwb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Aug 2022 13:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241385AbiHERw1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Aug 2022 13:52:27 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B01929830
        for <linux-usb@vger.kernel.org>; Fri,  5 Aug 2022 10:52:25 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 15-20020a17090a098f00b001f305b453feso8958461pjo.1
        for <linux-usb@vger.kernel.org>; Fri, 05 Aug 2022 10:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/cE83btomUIgrJts3c8glJP2T2vlJUmo9Trmde0fIKk=;
        b=hWRya6Fw+uO87JaMtvVrVKsIlLQb3d1uRscshzlFi55Qc1Pc6eJ3cs50gxc9XE/ukg
         AhjXvMuapsexgCTpj2RGn/w3NP1iQvH0PnlOicGEDu3EA2vhV2eS7orqNCSeuD/pU4l8
         eQz5cgKfVfODCu8H7IGtF1uwcYON2Gonw8854=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/cE83btomUIgrJts3c8glJP2T2vlJUmo9Trmde0fIKk=;
        b=FiTxObKY00wSi024R0yMdg/MKT05uxUZvPO1ubkAWOs2ZNnlLz/EBAgl8KbBJju9Xz
         YP0j/kYfvzyyWZxLQct4VVO8+S2mpc99cog6w1lbQGAuppJJhPOIHD8MEeFwrQG8iuN6
         a1ICu6aqhnsLrc+gHvR4FxyByu2p+dS6kqjnU0YOh2k+XX694gq5vk0g5kZFGXOBj5vW
         LSVp+XYm2d3T3kxFxYWAsuQRdwAd/T57uG7YCgO9h5+r5+/KPcianlK3O8jdb4sgE5s8
         sOftckda6VWZP8jmXMKofGls0hSPhaHEMaLlgmHUbbjpPn3FLbuzAIHQR/y5IKX5qjiO
         J6Aw==
X-Gm-Message-State: ACgBeo0n7LhWpD46wawNxfJzvYqo++ZngYGCwWEHjtnYMadh/FfBQxU9
        d7HpWvMBqg2/55hxVanoDNpqBA==
X-Google-Smtp-Source: AA6agR5wOtE/eyx8fZWxoKNB3EaPPhF8anZ8wEWmDQ6MJ8W+jOFx/0dxkqy/RkV1ikTTlhD0C+I9mQ==
X-Received: by 2002:a17:902:848e:b0:16c:f6c7:bc3c with SMTP id c14-20020a170902848e00b0016cf6c7bc3cmr7801896plo.159.1659721944743;
        Fri, 05 Aug 2022 10:52:24 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:c59c:1680:614c:3338])
        by smtp.gmail.com with UTF8SMTPSA id h13-20020a170902f70d00b0016f0c2ea158sm3286656plo.157.2022.08.05.10.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 10:52:24 -0700 (PDT)
Date:   Fri, 5 Aug 2022 10:52:22 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: dwc3: qcom: clean up icc init
Message-ID: <Yu1Y1nDCyzKhJUAI@google.com>
References: <20220805074500.21469-1-johan+linaro@kernel.org>
 <20220805074500.21469-3-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220805074500.21469-3-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 05, 2022 at 09:45:00AM +0200, Johan Hovold wrote:
> Clean up the interconnect-initialisation helper by increasing
> indentation of (or merging) continuation lines and adding brackets
> around multi-line blocks in order to improve readability.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 196efa9f2545..f2ff4fe1490a 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -253,7 +253,7 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>  	qcom->icc_path_ddr = of_icc_get(dev, "usb-ddr");
>  	if (IS_ERR(qcom->icc_path_ddr)) {
>  		dev_err(dev, "failed to get usb-ddr path: %ld\n",
> -			PTR_ERR(qcom->icc_path_ddr));
> +				PTR_ERR(qcom->icc_path_ddr));

What's wrong with the existing indentation? It looks similar to the indentation
changes you do below for icc_set_bw().

Maybe your preference is double indentation for continuation lines rather than
aligning them roughly with the opening parenthesis of the calling function?

>  		return PTR_ERR(qcom->icc_path_ddr);
>  	}
>  
> @@ -265,20 +265,19 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>  	}
>  
>  	max_speed = usb_get_maximum_speed(&qcom->dwc3->dev);
> -	if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN)
> +	if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN) {
>  		ret = icc_set_bw(qcom->icc_path_ddr,
> -			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
> -	else
> +				USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
> +	} else {
>  		ret = icc_set_bw(qcom->icc_path_ddr,
> -			USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
> -
> +				USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
> +	}
>  	if (ret) {
>  		dev_err(dev, "failed to set bandwidth for usb-ddr path: %d\n", ret);
>  		return ret;
>  	}
>  
> -	ret = icc_set_bw(qcom->icc_path_apps,
> -		APPS_USB_AVG_BW, APPS_USB_PEAK_BW);
> +	ret = icc_set_bw(qcom->icc_path_apps, APPS_USB_AVG_BW, APPS_USB_PEAK_BW);
>  	if (ret) {
>  		dev_err(dev, "failed to set bandwidth for apps-usb path: %d\n", ret);
>  		return ret;

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
