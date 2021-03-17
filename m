Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05DD533F9B1
	for <lists+linux-usb@lfdr.de>; Wed, 17 Mar 2021 21:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233372AbhCQUED (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 16:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233295AbhCQUDp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Mar 2021 16:03:45 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6307CC06175F
        for <linux-usb@vger.kernel.org>; Wed, 17 Mar 2021 13:03:45 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id o10so278754pgg.4
        for <linux-usb@vger.kernel.org>; Wed, 17 Mar 2021 13:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PMZcSuGazFdtOb5qvPexbIVWGQzVKNMJ7ZZH0Yf8cCs=;
        b=Da5G1yif8DdX+8w8KJ4dBsTTgesPOgdGFV0u/nK8pyzOMYg0odPKBeOlgKoMOsygW7
         qVSetOn7sBkEyflrN/a9gL/N0QuUrqlTUCAp8EdYTeab0g8HXgQcb/S59tsABZn3zSkD
         W9LwL8oqfKGiHN+4ts8NEL9k/OwvdJPSWioqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PMZcSuGazFdtOb5qvPexbIVWGQzVKNMJ7ZZH0Yf8cCs=;
        b=H8tbINW+RN0g7wWZPku5ZZkQUD2CTb3Ft/2ZyB8EPOLH112gbFlQ+cuWg1lEeo4x/H
         4/ib36YYqPRPvDQgoHbjsJhWj65WimgsHDgbTMZEqo8y5V7Z6ZgBHNHAPWr/XZE373Pb
         4D9Vo6GSK0iitSPBjewGNa/lPR7ubv/rfrxeMDdG1LvVmaXoEK9qVG2qG/Dt8KcwHh6m
         cDQ9ImS2vv99kdlrVKFdxDzAZ4Q3quo3aIspZfsYtuX6SiVXKcoHWBlv+4APnETKoqHI
         DBQkIRMIaKOZKy6hDh0dDE/0f9x5Waz4LhCEq8c/jtY/Pex4qacGMPwdlb5m0/wkSJ4O
         kl4A==
X-Gm-Message-State: AOAM531CUWPC8A/H1txbBJCTlgRFCjzzT1P8zciv7I11D9rU4blCKpft
        IZ07/hhzsbT/0VFXbe6DSI4KAQ==
X-Google-Smtp-Source: ABdhPJxhKXf2juJqtE1bn8z/X2ECPS65c7/sTPzGQLSiMoHGnctCifHOfFffOrE0CYg/TSWJVVotJA==
X-Received: by 2002:a63:4c4e:: with SMTP id m14mr4065710pgl.35.1616011424752;
        Wed, 17 Mar 2021 13:03:44 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3cf8:6a09:780b:f65d])
        by smtp.gmail.com with UTF8SMTPSA id q15sm3870178pje.28.2021.03.17.13.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 13:03:44 -0700 (PDT)
Date:   Wed, 17 Mar 2021 13:03:42 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH 2/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 bindings for SC7280
Message-ID: <YFJgnnoOxI7n0HPL@google.com>
References: <1615978901-4202-1-git-send-email-sanm@codeaurora.org>
 <1615978901-4202-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1615978901-4202-3-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 17, 2021 at 04:31:40PM +0530, Sandeep Maheswaram wrote:
> Add the compatible string for sc7280 SoC from Qualcomm
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> index ee77c64..20203a8 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> @@ -16,6 +16,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,usb-snps-hs-7nm-phy
> +      - qcom,sc7280-usb-hs-phy
>        - qcom,sm8150-usb-hs-phy
>        - qcom,sm8250-usb-hs-phy
>        - qcom,sm8350-usb-hs-phy

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
