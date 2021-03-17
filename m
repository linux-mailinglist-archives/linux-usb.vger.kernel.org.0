Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF1733F966
	for <lists+linux-usb@lfdr.de>; Wed, 17 Mar 2021 20:35:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbhCQTev (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 15:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbhCQTek (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Mar 2021 15:34:40 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EFA8C06175F
        for <linux-usb@vger.kernel.org>; Wed, 17 Mar 2021 12:34:40 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id l1so72888plg.12
        for <linux-usb@vger.kernel.org>; Wed, 17 Mar 2021 12:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aC9XfsPEhWKeOkyFve3gS/y0ZK6Rzz537p4VTrc/pes=;
        b=J7R0WNva4AWUE8efmdEYqtl6XZlVUBn+CBlU6HWx77oRXvMjetKAsiD/YUYQchl7iR
         2dUWIMmTGRS552IhNuMHn1MRe2X8gDQzUE6Lt7q3D1P1kUmDH9CicIblf5m/yUbpIH7+
         9RvzBuZs+pQx9RJHQGgaGMxoUQJYjDIi9qVR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aC9XfsPEhWKeOkyFve3gS/y0ZK6Rzz537p4VTrc/pes=;
        b=PnnOFhcflah+71mdJ0pL8vuXjBi+D5Gti+39yyDU9revut8CBjamIvG8Dy58Xk3fQq
         ozXD/+HuyBREmIH/N1JuxMEbILnDCBujkFtrwILMMv9hXubkIOVQD53NVjNLekuEKA0B
         BXwlljMmVvw4AWNuzOx65D/lPa9cVsGeZsRa7fxiE/ViTv8VI/Ryo49TqExqycFE5Kru
         bVO+7LdORkg/+uv4Eh9jA0PFcsdb7VMtMybtNZuNmMW/qzfYupv6YAjuCmH7KQh/T0V9
         yHSTJ6VSfSiVvfQJQV+tkIZJMcwdEHaIchKu7Z6PfFEjoe21I5hiUFET+54JjG34Yawm
         TpzQ==
X-Gm-Message-State: AOAM533YSgFrlSOMwfgWLUjfBjVhHviqF4CtiCw3W6yatV4+dsJ+OnsE
        dFyHKaqEiWu8EdLNMEBVb8bhkA==
X-Google-Smtp-Source: ABdhPJzvuzh0GDbQL02R1z72e58lYtYzY2DOXtCGDAWJ1P7tMT0SK4OSOelL6P3kE8/PqHxea2fa1w==
X-Received: by 2002:a17:902:ee06:b029:e4:ba18:3726 with SMTP id z6-20020a170902ee06b02900e4ba183726mr5991813plb.17.1616009679874;
        Wed, 17 Mar 2021 12:34:39 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3cf8:6a09:780b:f65d])
        by smtp.gmail.com with UTF8SMTPSA id v134sm20517485pfc.182.2021.03.17.12.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 12:34:39 -0700 (PDT)
Date:   Wed, 17 Mar 2021 12:34:36 -0700
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
Subject: Re: [PATCH 1/3] dt-bindings: usb: qcom,dwc3: Add bindings for SC7280
Message-ID: <YFJZzAPo4Rh8I5lX@google.com>
References: <1615978901-4202-1-git-send-email-sanm@codeaurora.org>
 <1615978901-4202-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1615978901-4202-2-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 17, 2021 at 04:31:39PM +0530, Sandeep Maheswaram wrote:
> Add the compatible string for sc7280 SoC from Qualcomm.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index c3cbd1f..413299b 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -16,6 +16,7 @@ properties:
>            - qcom,msm8996-dwc3
>            - qcom,msm8998-dwc3
>            - qcom,sc7180-dwc3
> +          - qcom,sc7280-dwc3
>            - qcom,sdm845-dwc3
>            - qcom,sdx55-dwc3
>            - qcom,sm8150-dwc3

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
