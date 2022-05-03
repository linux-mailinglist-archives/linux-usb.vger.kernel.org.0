Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F048517B3A
	for <lists+linux-usb@lfdr.de>; Tue,  3 May 2022 02:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbiECAZo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 20:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiECAZn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 20:25:43 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF9237A12;
        Mon,  2 May 2022 17:22:09 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id z8so16824713oix.3;
        Mon, 02 May 2022 17:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PKxuSyP6aAZ5UKADiJVd9CZqptgrT3l/21BfOHSNCtQ=;
        b=Ik5iPVaBN+Uu2NIVdQYRP1PYlmdnHaEJqgvL9vyd0oc8+U7HeShUV+HXwSo9f14Gdm
         kmZ2tqSIOIw+4alwdhOpYRnzhEMNZyDjQlNNae4VniFlS5NvVzyeoz6O/5hJu4pKajnl
         o5uCeCBp2tAFes6KuDo2FyCe/I3YSo8+1Vsdi4Ts/XGMih+jlgQfHxlezdSDJAhB/rfv
         vwgRgWuibWyHtjz0QgSPVBo3jbqIDn2USDTV65voZen0kPeufeXsjjj3wt62EfL1yVid
         Cyrv9NPkHheaX6GDY0bc0ZSqHj7QPEyb3DXPev1HLlmgJhzd0fJoVCK48Xo1IJqIY/Nc
         icyQ==
X-Gm-Message-State: AOAM530n55C8RBoYn0P/NUcR96KPkox0Cr+V/7f9gjaIUwlnHQde3CoP
        hIYYJRUA4G/g1p0qH70aiLWwlcToQg==
X-Google-Smtp-Source: ABdhPJyUirzEkqEwSTX/2vlnZ6E45LPS9/E1ehXdgu4A903pyiY9tgt/pFt0zVjCrc3TjnXcX10V0A==
X-Received: by 2002:a05:6808:14cd:b0:326:c1a:7a76 with SMTP id f13-20020a05680814cd00b003260c1a7a76mr823639oiw.44.1651537254615;
        Mon, 02 May 2022 17:20:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p124-20020acad882000000b00325cda1ff86sm2863678oig.5.2022.05.02.17.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 17:20:54 -0700 (PDT)
Received: (nullmailer pid 2093840 invoked by uid 1000);
        Tue, 03 May 2022 00:20:53 -0000
Date:   Mon, 2 May 2022 19:20:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Daniels Umanovskis <du@axentia.se>
Cc:     richard.leitner@skidata.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: usb251xb: add documentation for
 reset-delay-us
Message-ID: <YnB1ZQwpOBcT4zct@robh.at.kernel.org>
References: <20220426123329.775-1-du@axentia.se>
 <20220426123329.775-2-du@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426123329.775-2-du@axentia.se>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 26, 2022 at 12:33:47PM +0000, Daniels Umanovskis wrote:
> Next patch implements support for this property

Not a great reason why you need this. This patch should stand on its 
own.

My first question is whether this is board specific? If the default or 
what the reference manual says is 500us, but you have a case needing 
600us, why not just change the driver. I don't think this really needs 
tuning to each board unless the delay becomes noticeable.

> 
> Signed-off-by: Daniels Umanovskis <du@axentia.se>
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> index 1a934eab175e..d95c8ae518e7 100644
> --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> @@ -12,6 +12,8 @@ Required properties :
>  
>  Optional properties :
>   - reset-gpios : Should specify the gpio for hub reset
> + - reset-delay-us: Specifies delay in microseconds after reset deassert
> +        on hub power-up. (32 bit, default is 500us)
>   - vdd-supply : Should specify the phandle to the regulator supplying vdd
>   - skip-config : Skip Hub configuration, but only send the USB-Attach command
>   - vendor-id : Set USB Vendor ID of the hub (16 bit, default is 0x0424)
> -- 
> 2.30.2
> 
> 
