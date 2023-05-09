Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 485106FC786
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 15:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235396AbjEINJO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 May 2023 09:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235273AbjEINJN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 May 2023 09:09:13 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF6AE75
        for <linux-usb@vger.kernel.org>; Tue,  9 May 2023 06:09:11 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-ba5ebdc4156so850956276.3
        for <linux-usb@vger.kernel.org>; Tue, 09 May 2023 06:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683637750; x=1686229750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BCtzZTuG/ubCVd5eZD+aWJhOUl7gLSVq0SL8hnKaURM=;
        b=U1Oaci7XUseeGD+Wok1wXG4iauIkT+6aTGk/omu3Ysihz6DSba5SEDgNQ7DxClYlOl
         tbmiRVSNVBBk6T3jW0WO7CHHyOJNHUtRvOfjGnwrb7uaN0H8g4vBS7fVEyUtDQBP8n4A
         EB08hw8EK5daZRfYgPGIfLSFY9TzK2iwqF86Yc4BWXyz7ZPEnuIVFv33SeWb2RMKkLgP
         PuoPXbRv7v0rlUCs5V792tHKnk45TIErFyoIgqrp9rP/atpmwFx/QzNc9BWIOH4WkGzv
         PIxyQXxEZIBsRIR1SBOIqEG+nIBVyczHxEOMbslojwYZ8ze71HUfDzVHbnhJhcfO+AC/
         lCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683637750; x=1686229750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCtzZTuG/ubCVd5eZD+aWJhOUl7gLSVq0SL8hnKaURM=;
        b=c3kNnt/BSU7Yhwn9KxxIcWcduwUhFlLUOoJPrOoc0vRnG5rPxFTcfTM7aDF+3qeUPD
         JS1jCI2KnaIDioNkeOsufOU0cKTQley8ie0JxuEniylB+TtqGmz8IYqaPPWgNFKQlJEO
         P/Adhk52RArtGA6PBXocEu0A8nQO3HRCtqKMBrvindwHDOoZh5YsfUxXT6Hn8Rt+YEeY
         Fl+q4OyWLm1x+0eqPU/ubZL8QE1dz9ThPRyjcHNWytyfzgDcvgga3yfZh6yj43l34YTB
         TxWtW74AY8BtqGFd3lF0tGkfzMKzVsfjBQAgVW38QLJLW94Ts0iJpSv7XWxG8JE6z2/A
         tqZQ==
X-Gm-Message-State: AC+VfDw4aoMVot4Cl7NzDmI7Ag2JysXY5DJaHIh9QSehq6fxthrGfI9v
        K14jZYqcAON2yfmJv9ge6TVaZrwjZa9Cwl1dDkSzqA==
X-Google-Smtp-Source: ACHHUZ7/yu6cqvyEWbtDreV9v1hRaJB1cajmF/a1j4cDHrTbHxxkh+DVkek1PSbhqPTIfv3fdxjc+SZL0rScFLp/QkI=
X-Received: by 2002:a25:addf:0:b0:b99:6c12:74ff with SMTP id
 d31-20020a25addf000000b00b996c1274ffmr15248139ybe.15.1683637750625; Tue, 09
 May 2023 06:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683630932.git.quic_varada@quicinc.com> <42bf6244582d6208f51db1a9299fe1c8afab4e14.1683630932.git.quic_varada@quicinc.com>
In-Reply-To: <42bf6244582d6208f51db1a9299fe1c8afab4e14.1683630932.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 9 May 2023 16:08:59 +0300
Message-ID: <CAA8EJpqkSNzx=73JS1Csw+ivVovhrFeM0R5j2tpruEfNqvT48Q@mail.gmail.com>
Subject: Re: [PATCH v11 8/9] arm64: dts: qcom: ipq9574: Add LDO regulator node
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, mturquette@baylibre.com,
        sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 9 May 2023 at 14:56, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Add LDO regulator node
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Changes in v10:
>         - Add LDO regulator node
> ---
>  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor question below:

>
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> index bdc1434..1f5d14f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> @@ -60,6 +60,13 @@
>                         regulator-min-microvolt = <725000>;
>                         regulator-max-microvolt = <1075000>;
>                 };
> +
> +               mp5496_l2: l2 {
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <1800000>;
> +                       regulator-boot-on;
> +                       regulator-always-on;

This usually points out that there are other users which are not yet
enabled/properly specified. What users are there for this supply which
demand it to be always on?

> +               };
>         };
>  };
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
