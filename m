Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAC4D78E092
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 22:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236947AbjH3U0Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Aug 2023 16:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237627AbjH3U0E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Aug 2023 16:26:04 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C772E6EA8
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 13:13:17 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d7485d37283so5795371276.1
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 13:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693426317; x=1694031117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zgGcuZzmr94KnU1bouNuOO19+UEQyecBFbXFTDXATYI=;
        b=rRLySP68/6Bpymtix+irGvSI82og16K8dTJJ3ZKWJy9QUjAVtNVSzXZneyBS5fe/OM
         54YOf43rCZicY3EO4h0qe9mXpgjJIyaWaey4q06LqNehI2bpHaP6+RTTC4enTgTfw50Z
         gWmnayucaWmFIgHZEpWmU9xzxvmDiABlKsQiaQ8oeb+/yJOCTVUEwAAyUNekJ1c2UAJM
         7yrxVIGMQqMz8RyrmyTwmBGHpvcwI3QLcU5XQA3FH8oDfJEqf0ScQe/EXZAK+ESfmve0
         1wKy+9wWb0Y9JNg7PZieI3hX0nzFo4oZvDxyUTbGs1TUqIFlUNP4EiIGfkJzr+i3GH2L
         Bukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693426317; x=1694031117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgGcuZzmr94KnU1bouNuOO19+UEQyecBFbXFTDXATYI=;
        b=JhhhrUu2mq4ZWKMHR0k1ok2hNDmNac+5LMvAOkpCpHZbYqHpIhSy+2OR1yKIRNmrdi
         n2gXFz/qyzVkzkuAzfas0TdKr4Ex42z5/AL2K/De8/zladCdM15hw4vvkZcy1soaqf/Y
         UEg1FRXehTYYQ+KudCNRYn9u3hgAlYRLVUtsazSkcV047AP2aANctM74vQSwNWDC67za
         HPh00ysCclrccDmPmS5R7wii72tgRWNhqkzDlIBdg9oDrB1SN++FOLlF55Mzv/crOey9
         7kz5OOJIQQ07bJmsl42MW9Im/37rE63auZ03YHG188fXjz3lZrMx5H+feCOeH0DlI1Cl
         jDrw==
X-Gm-Message-State: AOJu0Yyq4UX8W657yjTyr7FuK4E5FSsswsgFD635KI4Y0I9tqyhNB/aY
        zhQLxQGFNQXE/PC1PDvaxjo4Rau2EMETpNAm2CxolA==
X-Google-Smtp-Source: AGHT+IHQgtmM/qEVU0UPeKqjFQmhQ59kgaPGxMwjXFavmatbWZ/rYVEWaDpXKACaogW7azdD4O9hjOLZ+ECSgh1rHzs=
X-Received: by 2002:a25:8481:0:b0:d7b:986e:9999 with SMTP id
 v1-20020a258481000000b00d7b986e9999mr3320097ybk.42.1693426316786; Wed, 30 Aug
 2023 13:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230825093531.7399-1-quic_nsekar@quicinc.com> <20230825093531.7399-6-quic_nsekar@quicinc.com>
In-Reply-To: <20230825093531.7399-6-quic_nsekar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Aug 2023 23:11:45 +0300
Message-ID: <CAA8EJppvNS_hy=L+zgk5HAB5iDEZE_j5LvEmQgAfcnwfy_7wNA@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq5018: Enable USB
To:     Nitheesh Sekar <quic_nsekar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Amandeep Singh <quic_amansing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 25 Aug 2023 at 12:37, Nitheesh Sekar <quic_nsekar@quicinc.com> wrote:
>
> Enable USB2 in host mode.
>
> Co-developed-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> index e636a1cb9b77..cdf5e22ec54e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> @@ -70,3 +70,15 @@
>  &xo_board_clk {
>         clock-frequency = <24000000>;
>  };
> +
> +&usbphy0 {
> +       status = "okay";
> +};
> +
> +&usb {
> +       status = "okay";
> +};
> +
> +&usb2_0_dwc {
> +       dr_mode = "host";
> +};

Let me sort these for you:

- usb
- usb2_0_dwc
- usbphy0

Like in a dictionary.

-- 
With best wishes
Dmitry
