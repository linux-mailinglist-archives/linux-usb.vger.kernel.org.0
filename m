Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B93D56CFFEE
	for <lists+linux-usb@lfdr.de>; Thu, 30 Mar 2023 11:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjC3Jjt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Mar 2023 05:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbjC3Jjn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Mar 2023 05:39:43 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C78A6E93
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 02:39:41 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5419d4c340aso343400987b3.11
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680169181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+KF3Ej0zA5vUsAy03E3uvbCGHCj2rR2h+cgAo56vcSY=;
        b=XMzC2GHrO/8LfQ2aF3jdBJuAoAavxiNQuWfxljRs8SSZB223Vy6gKXq8lIxlvbo5Rh
         61k6tYXlbAGXehWTjVPqLri1D03gVJoGcUXUOH3PsPIHJc/noOjuYYqooeFFg70dSNjo
         J8X8pl4w2xqanq7XlhVxGBqwbB39cp4zM3CYYGZ3A6180YwGKiXfkRrFVRSEeEMxllvf
         BH83sjDB5BmtIX7D/eKKrPxH3sAEqcldv4ha47iuHa7Z3Tf3JV7WlJnqKJ42NY0SShVq
         bO4jsOO7inoRCS2pNoUY+O3iSCI+0NqnrtUaX3tZobzpuU/fM2EXaflsdDLgvfQkpeRp
         b18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680169181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KF3Ej0zA5vUsAy03E3uvbCGHCj2rR2h+cgAo56vcSY=;
        b=oWC5rkJqImzd74ngxTDlfGLjHnmSh0CfnuNiij8sELdQL57pe1VZStrBm5qaluKG+I
         ny1T2BbVNTYq9UPzyQx4KRJKtLBmDIKLnw5J5SC9gpcdh2WWwSvKu/jN0KvEzA/ainFV
         OXHW3pfgSZmm9ABz4vvriem0gncnEak9lOxyK0rjHCxr0YNJz9M8quzu2Wk7A9zUtdK/
         1ZyeigVXaceh6vN8YZWP1QFuQXAoDUeQuAzU8iKvSLUOuSuhCHio6HlpBojuNIi3A76V
         V0BLjybT4K/gQX76ulVTaGRSFK9+F7XK0t2lAAnMZwv8OBMQ8teH/5qEtDcImX+Tb+Yx
         Pj0Q==
X-Gm-Message-State: AAQBX9dHwkAViyepuIevrrHQOccl2qF4hXjLZmrVcomYQbojDFJACTTC
        IHQx+6nX4IK/XOMM5jQq0ZEv5IpcoFiDuVNe82ZMUw==
X-Google-Smtp-Source: AKy350Y9NxPb3viIr2gzUpn3/4183c/Hd9fNIbqB/+mt9JjjNP5tyVonZiZsUTV2u+aJtwZ2ZC3uPbmUCiAJfBuAGXU=
X-Received: by 2002:a81:ae4f:0:b0:545:ed8e:f4f6 with SMTP id
 g15-20020a81ae4f000000b00545ed8ef4f6mr7051275ywk.5.1680169180845; Thu, 30 Mar
 2023 02:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680162377.git.quic_varada@quicinc.com> <cb8f2ba0ff39951aeada479ed3895d19c9f72617.1680162377.git.quic_varada@quicinc.com>
In-Reply-To: <cb8f2ba0ff39951aeada479ed3895d19c9f72617.1680162377.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 30 Mar 2023 12:39:30 +0300
Message-ID: <CAA8EJprQhrqWo5s8hNq=z4DL=hw9wde4ZHHwb+JoKCMQk3rU7w@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] dt-bindings: usb: dwc3: Add IPQ9574 compatible
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 30 Mar 2023 at 11:42, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Document the IPQ9574 dwc3 compatible.
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Changes in v5:
>         - Restore removed constraints
>
>  Changes in v4:
>         - Update other relevant sections
>         - Remove constraints not applicable to IPQ9574
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index a2aabda..8def6a3 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -17,6 +17,7 @@ properties:
>            - qcom,ipq6018-dwc3
>            - qcom,ipq8064-dwc3
>            - qcom,ipq8074-dwc3
> +          - qcom,ipq9574-dwc3
>            - qcom,msm8953-dwc3
>            - qcom,msm8994-dwc3
>            - qcom,msm8996-dwc3
> @@ -242,6 +243,24 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,ipq9574-dwc3
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 5
> +        clock-names:
> +          items:
> +            - const: sys_noc_axi
> +            - const: anoc_axi
> +            - const: master
> +            - const: sleep
> +            - const: mock_utmi

Is there any chance of using clock names that are close to the names
used by existing platforms?

I think this fits into the third 'if' bucket:

cfg_noc = sys_noc_axi
core = master
iface = anoc_axi
sleep = sleep
mock_utmi = mock_utmi

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
>                - qcom,msm8994-dwc3
>                - qcom,qcs404-dwc3
>      then:
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
