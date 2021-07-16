Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF543CBCB8
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jul 2021 21:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbhGPTkU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Jul 2021 15:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbhGPTkT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Jul 2021 15:40:19 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04837C061760
        for <linux-usb@vger.kernel.org>; Fri, 16 Jul 2021 12:37:23 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 42-20020a9d012d0000b02904b98d90c82cso10999812otu.5
        for <linux-usb@vger.kernel.org>; Fri, 16 Jul 2021 12:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=B+qWxCxPzZUSJU5vf13De3C2NmLqgomQCz7PVp0POS0=;
        b=KYe2848AYVmvn/mTfUfL3BTVz86s6+UrlpqAEHaGpaPKMcb+usLn5dJwy0fk1i00JK
         xxv/wcSDryh3eyRV1QsHri6QURUr73J1yxhb0uAr5kF8wCaS1jgNE+bv0azLA5l0DS/Z
         99UqnsSh4fWiQrl2JLZlaJQkIJMjmjtNjawVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=B+qWxCxPzZUSJU5vf13De3C2NmLqgomQCz7PVp0POS0=;
        b=aCnKWxYFkUtf4FEY8XtIS6bkAfHQhuS4CoakD5yhMshlfkfKRXRhqgkSES0+R+UTbB
         M2DPemU+inWlxEb0RNvKtWLoUe5C/utF/xOwHgX+m3mp22XfLs7D3429UeOhBVt+Swa4
         YiT2adIIrskQM6KQbGjH5BlAibcFVeX9tpCH0YGwAEom5qToplG4ix+MyYGL0puLFa4z
         kBcEP0pMu2FqqE8LZh4Vx/F81OLZBmCUZN5+HPabdzxiRWZCcONSnyhxv9abPX2qw819
         WnlmLpCI5kEX9G9LBcjgzlQWq34OkmRSK7heKyDGhihqZeDAUPyfkKMlciQh7V9vEQIZ
         RbYw==
X-Gm-Message-State: AOAM531Jfx7UTWh6QvcnZWr8m3RsQ8IFGeg/cPuCTXzp7SYTD627K9BL
        d6zUskMo6lPGknL5U8iboAO70XWUxrb3J0alu1EMlQ==
X-Google-Smtp-Source: ABdhPJwuLPCar4yVR7ZYLIvtXKz39byM22uYRQpClpwM27nlec63C4YHO4rpFAoKeLHeTOdMOs4KfMRjNlO5a8+zUZQ=
X-Received: by 2002:a9d:2781:: with SMTP id c1mr9349710otb.34.1626464243318;
 Fri, 16 Jul 2021 12:37:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Jul 2021 21:37:22 +0200
MIME-Version: 1.0
In-Reply-To: <1626443927-32028-5-git-send-email-pmaliset@codeaurora.org>
References: <1626443927-32028-1-git-send-email-pmaliset@codeaurora.org> <1626443927-32028-5-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 16 Jul 2021 21:37:22 +0200
Message-ID: <CAE-0n538LKQpeY_NKQF-VM3nHVxEE0B_pN4aN=sQ8iQzK+Yyxw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] PCIe: qcom: Add support to control pipe clk src
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org, svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Prasad Malisetty (2021-07-16 06:58:47)
> This is a new requirement for sc7280 SoC.
> To enable gdsc gcc_pcie_1_pipe_clk_src should be TCXO.

Why? Can you add that detail here? Presumably it's something like the
GDSC needs a running clk to send a reset through the flops or something
like that.

> after PHY initialization gcc_pcie_1_pipe_clk_src needs
> to switch from TCXO to gcc_pcie_1_pipe_clk.
>
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 8a7a300..9e0e4ab 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1167,6 +1170,20 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>         if (ret < 0)
>                 return ret;
>
> +       if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {
> +               res->gcc_pcie_1_pipe_clk_src = devm_clk_get(dev, "pipe_mux");
> +               if (IS_ERR(res->gcc_pcie_1_pipe_clk_src))
> +                       return PTR_ERR(res->gcc_pcie_1_pipe_clk_src);
> +
> +               res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
> +               if (IS_ERR(res->phy_pipe_clk))
> +                       return PTR_ERR(res->phy_pipe_clk);
> +
> +               res->ref_clk_src = devm_clk_get(dev, "ref");
> +               if (IS_ERR(res->ref_clk_src))
> +                       return PTR_ERR(res->ref_clk_src);
> +       }
> +
>         res->pipe_clk = devm_clk_get(dev, "pipe");
>         return PTR_ERR_OR_ZERO(res->pipe_clk);
>  }
> @@ -1255,6 +1272,11 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
>  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>  {
>         struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> +       struct dw_pcie *pci = pcie->pci;
> +       struct device *dev = pci->dev;
> +
> +       if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280"))
> +               clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->phy_pipe_clk);

Is anything wrong if we call clk_set_parent() here when this driver is
running on previous SoCs where the parent is assigned via DT? Also,
shouldn't we make sure the parent is XO at driver probe time so that
powering on the GDSC works properly?

It all feels like a kludge though given that the GDSC is the one that
requires the clock to be running at XO and we're working around that in
the pcie driver instead of sticking that logic into the GDSC. What do we
do if the GDSC is already enabled out of boot instead of being the power
on reset (POR) configuration?

>
>         return clk_prepare_enable(res->pipe_clk);
>  }
