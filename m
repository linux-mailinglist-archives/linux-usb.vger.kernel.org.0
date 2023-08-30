Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCE878E061
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 22:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240196AbjH3UOk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Aug 2023 16:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234112AbjH3UOV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Aug 2023 16:14:21 -0400
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8F272B3
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 13:12:05 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d78328bc2abso5570088276.2
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 13:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693426180; x=1694030980; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aJIb62bEI+abOZ0+u4aCxcyg1D1ywbkZPjZNGK2GZY0=;
        b=s524SJwWA4n133CxXLM274hx1QfewKmwGHicSWMZC/IdyhQ2snswBTExxFx3pakbYV
         aX/6aQMQH3SXs3vDDpMoU2H4GMYm9LtdhndC3348zj6jI4ovCrS6Y7wEcJxnLpcRCuFo
         8OhyEx+olXPOp6TYkSVIT0GtjUqfyrv7xROa62zkyixTvIju91A8dX0qGu4+u1k3nSKd
         iJKuNoSkRRGqiRDbg0YYYBM7WtQ51TwhUozg2iw7NG7zJF73UUFW8pqmzEvoypsUwtSI
         djg0M9PD2QLFFaQNH3TcN/BoNF+jOc2KcL7FN2d8D8w2Osg0dSvtnrf4pyPdRekSoosb
         BbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693426180; x=1694030980;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJIb62bEI+abOZ0+u4aCxcyg1D1ywbkZPjZNGK2GZY0=;
        b=G9bTx1ZhweE8PDDfl0jaT8s8flArJ/V/qBJxVyrnK4hi+BSznfb1++Ti1OASa0xipd
         0ILDS4J4ze3g02FttIxkjtwiE6/1cnOQxdjaDhBc5oAhyo6HtpFq3EwtqCCX1WoWyhtE
         4LYYF9qsQZycSSjDNww5RrpWtMiXyOLkddNrA5lgoWtagB+j3YayztikcW9kq2UT2VCo
         5NUrVZj7PxBd9/bGNWy6Js5JC9WnoESZylC98EsKY/moaf2uIROAIZ0G9Y63pwbUwCz6
         Ws5Z8z4BWo+wH7wW1PCaXkkdW8N/7P4FiiwUjZ2BCKQQC2MOg4D/jCSx/kviJUDAqlCb
         tcBQ==
X-Gm-Message-State: AOJu0YyHbWDZe+cTjhHXSATRYLOon44WJDD0Rjd9/6Fztr0w1ITQ7BgQ
        ssXppO6YIxCs0ANnumcqn55So45o+o3bOJ1za/APuw==
X-Google-Smtp-Source: AGHT+IGZVwnuEqzyqkBgaq+ePEab/gUlpPuMtKnej5Gso+diHBC4efLmP1AVk+hUUq9mcyqV6DF3d9cFfKSKASs5OEo=
X-Received: by 2002:a25:b06:0:b0:d78:26a0:ab8b with SMTP id
 6-20020a250b06000000b00d7826a0ab8bmr3151567ybl.55.1693426180516; Wed, 30 Aug
 2023 13:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230830111722.19380-1-quic_nsekar@quicinc.com> <20230830111722.19380-3-quic_nsekar@quicinc.com>
In-Reply-To: <20230830111722.19380-3-quic_nsekar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Aug 2023 23:09:29 +0300
Message-ID: <CAA8EJpohi35ic7Lwb29cz17n2gLqxWQ2WUAQfkBSvX3wkOHaEA@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] phy: qcom-m31: Add compatible, phy init sequence
 for IPQ5018
To:     Nitheesh Sekar <quic_nsekar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 30 Aug 2023 at 21:32, Nitheesh Sekar <quic_nsekar@quicinc.com> wrote:
>
> Add phy init sequence and compatible string for IPQ5018
> chipset.
>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> ---
> V2:
>         Updated the commit message.
> ---
>  drivers/phy/qualcomm/phy-qcom-m31.c | 60 +++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
> index ed08072ca032..81b72ebde305 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31.c
> @@ -82,6 +82,59 @@ struct m31_priv_data {
>         unsigned int                    nregs;
>  };
>
> +struct m31_phy_regs m31_ipq5018_regs[] = {
> +       {
> +               USB_PHY_CFG0,
> +               UTMI_PHY_OVERRIDE_EN,
> +               0
> +       },

c99 initialisers? And maybe drop the 0 delay inits.

> +       {
> +               USB_PHY_UTMI_CTRL5,
> +               POR_EN,
> +               15
> +       },
> +       {
> +               USB_PHY_FSEL_SEL,
> +               FREQ_SEL,
> +               0
> +       },
> +       {
> +               USB_PHY_HS_PHY_CTRL_COMMON0,
> +               COMMONONN | FSEL | RETENABLEN,
> +               0
> +       },
> +       {
> +               USB_PHY_REFCLK_CTRL,
> +               CLKCORE,
> +               0
> +       },
> +       {
> +               USB_PHY_UTMI_CTRL5,
> +               POR_EN,
> +               0
> +       },
> +       {
> +               USB_PHY_HS_PHY_CTRL2,
> +               USB2_SUSPEND_N_SEL | USB2_SUSPEND_N | USB2_UTMI_CLK_EN,
> +               0
> +       },
> +       {
> +               USB_PHY_UTMI_CTRL5,
> +               0x0,
> +               0
> +       },
> +       {
> +               USB_PHY_HS_PHY_CTRL2,
> +               USB2_SUSPEND_N | USB2_UTMI_CLK_EN,
> +               0
> +       },
> +       {
> +               USB_PHY_CFG0,
> +               0x0,
> +               0
> +       },
> +};
> +
>  struct m31_phy_regs m31_ipq5332_regs[] = {
>         {
>                 USB_PHY_CFG0,
> @@ -268,6 +321,12 @@ static int m31usb_phy_probe(struct platform_device *pdev)
>         return PTR_ERR_OR_ZERO(phy_provider);
>  }
>
> +static const struct m31_priv_data m31_ipq5018_data = {
> +       .ulpi_mode = false,
> +       .regs = m31_ipq5018_regs,
> +       .nregs = ARRAY_SIZE(m31_ipq5018_regs),
> +};
> +
>  static const struct m31_priv_data m31_ipq5332_data = {
>         .ulpi_mode = false,
>         .regs = m31_ipq5332_regs,
> @@ -275,6 +334,7 @@ static const struct m31_priv_data m31_ipq5332_data = {
>  };
>
>  static const struct of_device_id m31usb_phy_id_table[] = {
> +       { .compatible = "qcom,ipq5018-usb-hsphy", .data = &m31_ipq5018_data },
>         { .compatible = "qcom,ipq5332-usb-hsphy", .data = &m31_ipq5332_data },
>         { },
>  };
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
