Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06350573829
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 16:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236435AbiGMOAO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 10:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbiGMOAL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 10:00:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E4D0D2C66A
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 07:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657720810;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LVM/9+bL0Plqw8a52QPl3k4n9Q1+GAafg2rUTujh0Gc=;
        b=C7MeA/4Cvzux7KlM9poxwLLOphu8PWeg/WjqbwGM9Gufr63eGbZBsoRhWvCslo6Z+EpLod
        2VRMFcy9MGUROEnhQrxLp2+sSev16rE5TS32z7p5kLa+9bnRHqe+H6/5jpCUoAa6O2y/WE
        ztIGCHspJ+JGWN8iOAQD0YOPaHvpvZc=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-yTTJTtgHM5uAikvwHowsFg-1; Wed, 13 Jul 2022 10:00:08 -0400
X-MC-Unique: yTTJTtgHM5uAikvwHowsFg-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1015d202b74so5946742fac.20
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 07:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LVM/9+bL0Plqw8a52QPl3k4n9Q1+GAafg2rUTujh0Gc=;
        b=e06804iMGqIxHiMVb1o5RQQHXz1Jl6hGiHTI82xlfhsPeVqw79uc68/wR4QCblGaCF
         Qn6dgY1Z3/bdYUYeDJoulRXozRqW5OOuVaNZ9aoRzsRy5mVWG9QcsbqMUdLyvXzsVS9h
         cihKN0b7znwIKIdtRqk/dhhdJ3faFZ3YXKoFbJVjPNudt3elL9o0Ch4po0SgazAOx2rh
         aFShCsohfbpLtOVtlrqrIW/ONEHbRqTmJmdKAeYI7PHe9a0NxtlpRy+iP8Z+AI1MP1Wt
         qfY1YloMLgLn9x9nWAEjcTuhMYhfChdAf2/vxllu6Svgi1d+H20QjmBIxwu4MoQHplQz
         0PxQ==
X-Gm-Message-State: AJIora/s7ZYhPs2/8Dlugm9LENi0XNOnFzNfMrTwg4+FjPwCb54hVHrL
        aXeW8bFO3X1cg4Jg0drs8ekpwWJ7OZ+T9JXc0TD9V0h31gV9kOdHGKuMSdt8uZPfsmhsF83j9T0
        AONDtW61UrPjHTcTETb1L
X-Received: by 2002:a05:6870:f149:b0:de:e873:4a46 with SMTP id l9-20020a056870f14900b000dee8734a46mr1710707oac.286.1657720807871;
        Wed, 13 Jul 2022 07:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tWU5P/M2v4yhf5rjgNK8fNjmlmpbF71huQvwUWO4e55Sg67LK3nJe2ebY/U445BU5Ynrdnxw==
X-Received: by 2002:a05:6870:f149:b0:de:e873:4a46 with SMTP id l9-20020a056870f14900b000dee8734a46mr1710691oac.286.1657720807684;
        Wed, 13 Jul 2022 07:00:07 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id h82-20020aca3a55000000b00339ff117f38sm3726085oia.53.2022.07.13.07.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 07:00:07 -0700 (PDT)
Date:   Wed, 13 Jul 2022 09:00:05 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] usb: dwc3: qcom: fix missing optional irq warnings
Message-ID: <20220713140005.qw3nhjlin4vobhvd@halaneylaptop>
References: <20220713131340.29401-1-johan+linaro@kernel.org>
 <20220713131340.29401-4-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713131340.29401-4-johan+linaro@kernel.org>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 13, 2022 at 03:13:36PM +0200, Johan Hovold wrote:
> Not all platforms have all of the four currently supported wakeup
> interrupts so use the optional irq helpers when looking up interrupts to
> avoid printing error messages when an optional interrupt is not found:
> 
> 	dwc3-qcom a6f8800.usb: error -ENXIO: IRQ hs_phy_irq not found
> 
> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 77036551987a..c5e482f53e9d 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -490,9 +490,9 @@ static int dwc3_qcom_get_irq(struct platform_device *pdev,
>  	int ret;
>  
>  	if (np)
> -		ret = platform_get_irq_byname(pdev_irq, name);
> +		ret = platform_get_irq_byname_optional(pdev_irq, name);
>  	else
> -		ret = platform_get_irq(pdev_irq, num);
> +		ret = platform_get_irq_optional(pdev_irq, num);
>  
>  	return ret;
>  }
> -- 
> 2.35.1
> 

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

