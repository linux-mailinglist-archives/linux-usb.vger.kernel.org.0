Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D932F98F4
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 06:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731135AbhARFGc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 00:06:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729822AbhARFGZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jan 2021 00:06:25 -0500
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A65C0613CF
        for <linux-usb@vger.kernel.org>; Sun, 17 Jan 2021 21:05:18 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id x203so3822584ooa.9
        for <linux-usb@vger.kernel.org>; Sun, 17 Jan 2021 21:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1cA8KQOVzAZi1qthCDCnnRXj/Fv2EJ3SpZpVbcIQrlI=;
        b=iwybqSthJFoyWkVGMOhvVQJbpQdH+N3CwYI4L0pp/wKChuQhNJua1QIuJAgiEuJwbb
         lSCNJV+CSiB5LFHR3F1+WKBdFJ4l3GSsB3uA6DknRxUoalRyFjMyl0/96fOZ3wCC6kIB
         OA6GeOqIi6TfYSoxyIiaifhRnNDmcwHbcBYPiwHN0hFg5gdZxiEaQUyxHjuCAfBoXbj8
         2uT3sTRAvPCQgJpJhNtNNjENdTPWaaTBHvHhPukahxdJgaSXOmBTAKovBrvKQxU/MiKb
         x2int3iIkZaiuw5hYXdCDaoAXl8XCNKVDq5qOxWLggT3LD+979IPH+TPhcWseyG7esad
         4HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1cA8KQOVzAZi1qthCDCnnRXj/Fv2EJ3SpZpVbcIQrlI=;
        b=pYI+8pLlFkLbIJADw+B0KI8nydUNAzV5w8zxMRuFdnGwYWFFIBWwgk1gGYDI/isPoh
         xAPhTbDHuMsEDeUmDw7ivkiAfY5CeLu9DCUOvYCx7SSCjDcyXRZDvNuwoENqVngj1808
         9h8qIUlSCwqa0yQ/1mvCld1wVgN24xDQtR02nsVvmMVYU+2DKMCl+qMl4MR9k2bWHO+V
         qHaO6FZ+bmElxoTYtY52TvuWk01LF6gfxepy5K1VY/HKM4cMgs/1yk/DNoh9mF+a3UhG
         UMlGjg09zZsycyJ+Ia9LCH2N7QhpjpceSEx2KE7M7zKWeTXG3UFFwVH4CUAs0QzBBRpq
         zVAQ==
X-Gm-Message-State: AOAM531pri5c6Y6EgG5SlD510l8N7x25w7RVlRBpPjzFaZ0j2t01wWEN
        zWKZBoBUB9dgafXOTJzSCUkgmyKBekulhg==
X-Google-Smtp-Source: ABdhPJzQW+rHISa9y9+fn/1pREshRpEry/PTHq3JBUQqeyNAK11p/H6DXGulx8qGnue1rTF25F336w==
X-Received: by 2002:a4a:364a:: with SMTP id p10mr16140161ooe.48.1610946317656;
        Sun, 17 Jan 2021 21:05:17 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w11sm2034729otl.13.2021.01.17.21.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:05:17 -0800 (PST)
Date:   Sun, 17 Jan 2021 23:05:15 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 SM8250 and SM8350 bindings
Message-ID: <YAUXC/90mUt6R9zz@builder.lan>
References: <20210115174723.7424-1-jackp@codeaurora.org>
 <20210115174723.7424-4-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115174723.7424-4-jackp@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri 15 Jan 11:47 CST 2021, Jack Pham wrote:

> Add the compatible strings for the USB2 PHYs found on QCOM
> SM8250 & SM8350 SoCs.
> 
> Note that the SM8250 compatible is already in use in the dts and
> driver implementation but was missing from the documentation.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> index 4949a2851532..ee77c6458326 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> @@ -17,6 +17,8 @@ properties:
>      enum:
>        - qcom,usb-snps-hs-7nm-phy
>        - qcom,sm8150-usb-hs-phy
> +      - qcom,sm8250-usb-hs-phy
> +      - qcom,sm8350-usb-hs-phy
>        - qcom,usb-snps-femto-v2-phy
>  
>    reg:
> -- 
> 2.24.0
> 
