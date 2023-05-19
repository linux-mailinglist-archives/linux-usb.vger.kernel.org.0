Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC29B708D27
	for <lists+linux-usb@lfdr.de>; Fri, 19 May 2023 03:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjESBFB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 21:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbjESBE4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 21:04:56 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106D2E72
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 18:04:55 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-64354231003so231775b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 18:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684458294; x=1687050294;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EsNDDZQjyzubiHU2Q7sD4xTr6yEqcb3i+2OtW32tUIA=;
        b=X6uQC7pdumVDsP6/p/jLlNgz50whdbuiGiZJuyYqHxFCEi/T20HxrE1mTYohso3UQf
         xshMYpebu0bRgH2HIz3cezFC/VhGDs+UKsabPrn/kmwu3DhwF2L5lh4/7oYi288GKWPH
         6qDaC/Lz2RNXWuuYfgf/kBOt0REIJMSxnHbLYCVv5PLZdCvwEo8W2/RYRdh9Y1+Fg0Dh
         qTVM6BMVxIz++trHo6eiMj5frqcdcK79XnNhEDais5QmMvnG2nE4cha775JXwqhifGWZ
         2KuWNcBwOVSOnJhoWd8I48r6VGG5EmcQkrd2PcP3tHAbuSCuR6ZyS0THYq8H5YqimL5Q
         E4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684458294; x=1687050294;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsNDDZQjyzubiHU2Q7sD4xTr6yEqcb3i+2OtW32tUIA=;
        b=gaTD8m/o/CgbfThC4FMXSW23SnVNTyAIycjbuvDJOG7sJdLcMLi4WxZKBSjtNAdkuU
         b0B/hvgtM3D1Yi3/vzUJWxoGf1DZcUQND4KsJ0fGHKbADFwA/tzuBZbGa0iRHZ5K/LdM
         5We4a2UKf4b04EjS1MCIXvNJTYtcLLykyDoj0QDgjYC73mQQh9reDRoYgAae0OOGdTX2
         Miwwk+Z3yOpX32bjuHB9Pwl1voDhhpyki5syuDay6bGnn4hzZhW03BLxlGLpVi2QmcQZ
         PckqKp3MInB5aziRtWcxZBCQ9afxaUorU+iciaUb5JmYB0urDbLySQoIneruPavIPms9
         Orjg==
X-Gm-Message-State: AC+VfDzXwJrgqTypRzqomhBetTlyM/i/9fJTXIcyr4PCn/tSOukB/hEU
        seYLtNNs41XpADFH5ZtKbuU=
X-Google-Smtp-Source: ACHHUZ5sVtxi4SgZx675TCNgqWHJ5NDYupCcdfW9s1hPaxcai08xNJKj8KHBcgvy8w07+Ehmzpqygg==
X-Received: by 2002:a05:6a00:a0e:b0:63f:2959:a271 with SMTP id p14-20020a056a000a0e00b0063f2959a271mr6509411pfh.6.1684458294289;
        Thu, 18 May 2023 18:04:54 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:36bb:8bd6:552:c349])
        by smtp.gmail.com with ESMTPSA id m15-20020aa7900f000000b006466f0af9b2sm1951907pfo.179.2023.05.18.18.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 18:04:53 -0700 (PDT)
Date:   Thu, 18 May 2023 18:04:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: host: fhci-hcd: Convert to platform remove callback
 returning void
Message-ID: <ZGbLMpPSZaKt7dEq@google.com>
References: <20230518202636.273407-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230518202636.273407-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 18, 2023 at 10:26:36PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code.  However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero to the void
> returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/usb/host/fhci-hcd.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
> index 92794ffc25c8..66a045e01dad 100644
> --- a/drivers/usb/host/fhci-hcd.c
> +++ b/drivers/usb/host/fhci-hcd.c
> @@ -757,7 +757,7 @@ static int of_fhci_probe(struct platform_device *ofdev)
>  	return ret;
>  }
>  
> -static int fhci_remove(struct device *dev)
> +static void fhci_remove(struct device *dev)
>  {
>  	struct usb_hcd *hcd = dev_get_drvdata(dev);
>  	struct fhci_hcd *fhci = hcd_to_fhci(hcd);
> @@ -771,12 +771,11 @@ static int fhci_remove(struct device *dev)
>  		qe_pin_free(fhci->pins[j]);
>  	fhci_dfs_destroy(fhci);
>  	usb_put_hcd(hcd);
> -	return 0;
>  }
>  
> -static int of_fhci_remove(struct platform_device *ofdev)
> +static void of_fhci_remove(struct platform_device *ofdev)
>  {
> -	return fhci_remove(&ofdev->dev);
> +	fhci_remove(&ofdev->dev);
>  }
>  
>  static const struct of_device_id of_fhci_match[] = {
> @@ -791,7 +790,7 @@ static struct platform_driver of_fhci_driver = {
>  		.of_match_table = of_fhci_match,
>  	},
>  	.probe		= of_fhci_probe,
> -	.remove		= of_fhci_remove,
> +	.remove_new	= of_fhci_remove,
>  };
>  
>  module_platform_driver(of_fhci_driver);
> 
> base-commit: ac9a78681b921877518763ba0e89202254349d1b
> -- 
> 2.39.2
> 

-- 
Dmitry
