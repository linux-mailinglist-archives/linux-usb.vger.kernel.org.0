Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB45B58B0DB
	for <lists+linux-usb@lfdr.de>; Fri,  5 Aug 2022 22:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235839AbiHEUe7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Aug 2022 16:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbiHEUe6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Aug 2022 16:34:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0860FA9
        for <linux-usb@vger.kernel.org>; Fri,  5 Aug 2022 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659731696;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uKM+wW8lwiBI5lrbvhYvc3Xo/UJeC+U/brqFsws6/U0=;
        b=fACG1pCY/xhnj68Esny/W+ZM2f7QOvAc/3IM6Z0MxK/5qL9dz+kF+EsLfi/k7DsSYPEAOQ
        cdwWzhJisrwBtGpdsylKRzxAMCzDL56fTf2zApnHOJVovIuf2jJL3EJOEe4YUUpdF105n8
        t5k73Np52W6UmsUAu7XQ9spe3H0wURM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-wQEZ8JK0M1qcB1RP2-dbLw-1; Fri, 05 Aug 2022 16:34:54 -0400
X-MC-Unique: wQEZ8JK0M1qcB1RP2-dbLw-1
Received: by mail-qk1-f197.google.com with SMTP id u15-20020a05620a0c4f00b006b8b3f41303so2780810qki.8
        for <linux-usb@vger.kernel.org>; Fri, 05 Aug 2022 13:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uKM+wW8lwiBI5lrbvhYvc3Xo/UJeC+U/brqFsws6/U0=;
        b=RZjS4t41AQevFWGgPsl3/Ced7WVsO0XqqRe0nTD8ZUjlPUCic2ueJSJFahZ8vmoXOd
         ziI1ya2/ZBJiGu6pBva8ujLb9RWa6/5CBUFEoR5+K70hIBx1dMpCsRgLnNpkM59UxgIh
         OntVLFquTcbgHYk/BTmNAb+ko5qpJ1otXKANosmuQDNz76Hu3GKjtgVPH8N7UeaPsdLA
         au7+9ZVxZIp3lkXB8Bl9EHk47ze6DaJV7RJ5NeExhFzHVs/gaPBitbO2ajdWYj+q371y
         HktTAsoYPifKTjRQc9UysZKxTF8QleqpPpVi7JrXF1/NmmMMC8EfemwckJiJF6ZbCy9Q
         8Ceg==
X-Gm-Message-State: ACgBeo1wPqxY8nomXJo9rULxGWNcFQSfOg8Q9qWwBgsDwzBcL7esj5oH
        lF7ApEPugX+xMizIGGiAlKPMzuqyJ9x0pLjjxBvvACanv8e4hlN72ULAr3XVl5L8ggFHZo80iRw
        F+OxylFt/0YGJ3zssPTNf
X-Received: by 2002:ac8:5ac9:0:b0:31e:eee0:3abb with SMTP id d9-20020ac85ac9000000b0031eeee03abbmr7542033qtd.359.1659731694247;
        Fri, 05 Aug 2022 13:34:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR41nT7or3WH7eao2rcwikW4vn9zTHCmxKFs25GqOXhqzJGWKHNEd5C8Ceg8re5deC1Zz6riZw==
X-Received: by 2002:ac8:5ac9:0:b0:31e:eee0:3abb with SMTP id d9-20020ac85ac9000000b0031eeee03abbmr7542017qtd.359.1659731694025;
        Fri, 05 Aug 2022 13:34:54 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id c25-20020a05620a269900b006b55036fd3fsm3796781qkp.70.2022.08.05.13.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 13:34:53 -0700 (PDT)
Date:   Fri, 5 Aug 2022 15:34:51 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: dwc3: qcom: only parse 'maximum-speed' once
Message-ID: <20220805203451.phu6mpzyipzj6jmf@halaneylaptop>
References: <20220805074500.21469-1-johan+linaro@kernel.org>
 <20220805074500.21469-2-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805074500.21469-2-johan+linaro@kernel.org>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 05, 2022 at 09:44:59AM +0200, Johan Hovold wrote:
> Add a temporary variable to the interconnect-initialisation helper to
> avoid parsing and decoding the 'maximum-speed' devicetree property
> twice.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 6814861bed6c..196efa9f2545 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -243,6 +243,7 @@ static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
>   */
>  static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>  {
> +	enum usb_device_speed max_speed;
>  	struct device *dev = qcom->dev;
>  	int ret;
>  
> @@ -263,8 +264,8 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>  		return PTR_ERR(qcom->icc_path_apps);
>  	}
>  
> -	if (usb_get_maximum_speed(&qcom->dwc3->dev) >= USB_SPEED_SUPER ||
> -			usb_get_maximum_speed(&qcom->dwc3->dev) == USB_SPEED_UNKNOWN)
> +	max_speed = usb_get_maximum_speed(&qcom->dwc3->dev);
> +	if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN)
>  		ret = icc_set_bw(qcom->icc_path_ddr,
>  			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
>  	else
> -- 
> 2.35.1
> 

