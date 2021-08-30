Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7D43FBD45
	for <lists+linux-usb@lfdr.de>; Mon, 30 Aug 2021 22:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234632AbhH3UI7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Aug 2021 16:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234606AbhH3UI7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Aug 2021 16:08:59 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48276C06175F
        for <linux-usb@vger.kernel.org>; Mon, 30 Aug 2021 13:08:05 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id m11so13165124ioo.6
        for <linux-usb@vger.kernel.org>; Mon, 30 Aug 2021 13:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0RtSe3tPXjpOd0ru72YE33BChLV62/Ie8i3PXYdqo+I=;
        b=YN8ribrXpRm7FNv4ZI5E2n4zz36a4faIdX+Ua6lNeUTqzla9RlyJBG3EfB0uEdskEn
         BNNB7hsiTrDVB5euYOicZNKvhwFmChfyxLtoz8W3VfmuQom3evvkZbMwP/+DW3+985lE
         lPJGcJFB+PNRcH82klgyMod8NN8UM9GXgbJ+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0RtSe3tPXjpOd0ru72YE33BChLV62/Ie8i3PXYdqo+I=;
        b=SILgXM+lNr44M1/ZVr3JhBt5CuGy9Hixym54UeDy1FDSIHeYd9X1U9l7FOYOr8cLee
         +0X5s1Ac7/PHt/dRKhaM91TNS8mr3pi/R/hoW0rLleHHMcDBnqHjjWJ1s/SLK78ovWgz
         7SHMoO949WTyiVHVWI6BqiRmiwtVe/cdW9I6WJuQoRRHPfNbEhRjzM5twhHmdGP7/0XO
         3NWuQEKeGWKkLheicjCCULiAaEsJfHTSDhbQiI/a2BY+ZJtpTEBTMTLr5TyGCZWAZogP
         g5F6f2RMJOcvJlJsSh1SYPep3U80Xf/cKeZwQRurCA2Hl9gvIVKGGvNxtd4JMRB0C9SI
         4uwA==
X-Gm-Message-State: AOAM532do8VwV3Xotc2mLeowHm8v7PzIT+aWnilWIE8poQMY80CBQ2s/
        OQUlPnVz8zlmWfvjd8TvlM4WeJ5efcxtuQ==
X-Google-Smtp-Source: ABdhPJwMdZIE2IZHm3xmUMNiLBMYHj1Xwmye1ustgG2X1/bYqyzxkh/o9noc6hdgJYICQiAl7BUaKQ==
X-Received: by 2002:a6b:b4ce:: with SMTP id d197mr19495173iof.69.1630354084475;
        Mon, 30 Aug 2021 13:08:04 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id p16sm9151694ilg.32.2021.08.30.13.08.03
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 13:08:03 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id a15so21527194iot.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Aug 2021 13:08:03 -0700 (PDT)
X-Received: by 2002:a5d:8acf:: with SMTP id e15mr19403264iot.184.1630354083438;
 Mon, 30 Aug 2021 13:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <1630346073-7099-1-git-send-email-sanm@codeaurora.org> <1630346073-7099-2-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1630346073-7099-2-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 30 Aug 2021 13:07:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XjRMdB=iHDcMATWDq5CSRGdh1ZBCftjrZvTfMk_Nqgvg@mail.gmail.com>
Message-ID: <CAD=FV=XjRMdB=iHDcMATWDq5CSRGdh1ZBCftjrZvTfMk_Nqgvg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings
 for dwc3 qcom
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Pratham Pratap <prathampratap@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Aug 30, 2021 at 10:55 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> Add multi pd bindings to set performance state for cx domain
> to maintain minimum corner voltage for USB clocks.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index e70afc4..838d9c4 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -41,7 +41,18 @@ properties:
>
>    power-domains:
>      description: specifies a phandle to PM domain provider node
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: optional,cx power domain
> +      - description: USB gdsc power domain

You need to re-order the above. The optional one needs to be second, not first.


> +  power-domain-names:
> +     items:
> +      - const: cx
> +      - const: usb_gdsc

Why do you need the names at all? The ordering of power-domains is
well defined and there are no holes in it and there are no legacy
reasons for having the names (like there are for clocks), so you
should drop. This is much like reg-names and I always point people to
this message from Rob Herring about reg-names:

https://lore.kernel.org/r/CAL_Jsq+MMunmVWqeW9v2RyzsMKP+=kMzeTHNMG4JDHM7Fy0HBg@mail.gmail.com/

You'll have to change your driver to use dev_pm_domain_attach_by_id()
but that should be fine.

-Doug
