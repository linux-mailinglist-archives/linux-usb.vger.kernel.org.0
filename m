Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8B641520E4
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2020 20:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727550AbgBDTOY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Feb 2020 14:14:24 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42725 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbgBDTOY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Feb 2020 14:14:24 -0500
Received: by mail-lf1-f67.google.com with SMTP id y19so12986676lfl.9
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2020 11:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xr0ABtZ2DkqqEMCgDeVZ+5kKZ+ttSxGzoRZ9d91wwmc=;
        b=Scz3T627yE0T1ugx7bHnYWhVoRntUUtHlMZ/6w7/ZnS8GhxiZFF98xPek3uyw3TGq3
         kK+omwOTaa3adO6c11xb5lChggWabb0seE/qgnlBnRzWlpCBd2xLvh8aI7Dbfp4ezdnI
         6NIq57R7SHS96cvsv+KfLnyuIRReuLWMvFcKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xr0ABtZ2DkqqEMCgDeVZ+5kKZ+ttSxGzoRZ9d91wwmc=;
        b=DaxJbzcmKPmohMvrD9Gfsfox8BAZvPKg9CQFXNq+aLrZziCvfCoVityVG+AkupUheh
         3VClx00ZSyy6wTGCUxnVjEXln4sIl8e9oFVvxxU4XGsyoJ3fmeCsQPh5aWDj2ZnAoSUj
         sIdgxV9/OPpyK8gHNgS4FB9LmwYnFpZzUcVcIeX/jbVOWh+xisdzyNDGomYlCFmqOIen
         cUhJk+8FEnJNgMUWQXqICuafjxTp5papn53me8n7sgNxlljikzsaO30E8MtvJvnl6Aou
         3i+2MzSDK6LacXpVN5ThpS00b+i1slu1qifIf2s4E09CK4jGw30pnV02in00jgZkIj+y
         C2Xw==
X-Gm-Message-State: APjAAAW/6oydO8R6SsJyk9TxkCOy5k3035q1iHFVQS/D+yC71N1ZXLMs
        hU96CkAQaj2RGIhFSw8Ry5zHEoQD4E4=
X-Google-Smtp-Source: APXvYqyAWu2cmZffbUTaSEEpsRCu/hRYkqPDGK/LwWjyFQsZeXR2y9juYKbd3Q92NgzkB0THH0zK5w==
X-Received: by 2002:ac2:4849:: with SMTP id 9mr15520510lfy.11.1580843661148;
        Tue, 04 Feb 2020 11:14:21 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id s17sm14136870ljo.18.2020.02.04.11.14.20
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 11:14:20 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id o15so14272244ljg.6
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2020 11:14:20 -0800 (PST)
X-Received: by 2002:a2e:3e10:: with SMTP id l16mr17840298lja.286.1580843659748;
 Tue, 04 Feb 2020 11:14:19 -0800 (PST)
MIME-Version: 1.0
References: <1568718649-20124-1-git-send-email-cchiluve@codeaurora.org> <1568718649-20124-4-git-send-email-cchiluve@codeaurora.org>
In-Reply-To: <1568718649-20124-4-git-send-email-cchiluve@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 4 Feb 2020 11:13:43 -0800
X-Gmail-Original-Message-ID: <CAE=gft4DAe_ck+j88O274-2MgeES9aA1qi8C4ruk0Mdf-FsMog@mail.gmail.com>
Message-ID: <CAE=gft4DAe_ck+j88O274-2MgeES9aA1qi8C4ruk0Mdf-FsMog@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] arm64: dts: sdm845: Add interconnect properties
 for USB
To:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Cc:     balbi@kernel.org, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-usb@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Chandana,

On Tue, Sep 17, 2019 at 4:11 AM Chandana Kishori Chiluveru
<cchiluve@codeaurora.org> wrote:
>
> Populate USB DT nodes with interconnect properties.
>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
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
>                         resets = <&gcc GCC_USB30_PRIM_BCR>;
>
> +                       interconnects = <&rsc_hlos MASTER_USB3_0
> +                                        &rsc_hlos SLAVE_EBI1>,
> +                                       <&rsc_hlos MASTER_APPSS_PROC
> +                                        &rsc_hlos SLAVE_USB3_0>;

You'll be racing with David's series here to split rsc_hlos out into more nodes:
https://patchwork.kernel.org/patch/11326603/

Do you want to just base yours on top of his and list it as a dependency?
