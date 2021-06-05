Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA06839CB36
	for <lists+linux-usb@lfdr.de>; Sat,  5 Jun 2021 23:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhFEV2o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Jun 2021 17:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhFEV2n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Jun 2021 17:28:43 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22C0C061767
        for <linux-usb@vger.kernel.org>; Sat,  5 Jun 2021 14:26:43 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id w23-20020a9d5a970000b02903d0ef989477so8359833oth.9
        for <linux-usb@vger.kernel.org>; Sat, 05 Jun 2021 14:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=wbRcecU45cLUtko5l0vUWvikuJy/8dZZ0AGcQ3rr3es=;
        b=UoBqNLGKh9eFlgRAyWcaQXXrcUO/JGHp4ImoGOWDp2u8U8JPDUi3WPHa6nTk3jdsI2
         G3/Dz/+UGzNqnz+oe+rSGfys4A6B6r872WzC186U6+Sj26AdxRpvIk/qkbofF2UBRfyG
         grfr/bqRrWq+wZucknVEwBceHUqFYDFAtGdII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=wbRcecU45cLUtko5l0vUWvikuJy/8dZZ0AGcQ3rr3es=;
        b=D5QxvrpZxqC91uR3p/XeJMfsAk/8zk5fX90R3J+GCnysi6bAbg6NzVldSwAdktBTcu
         sxRGezXaX9pAfWDybJvHbCQPPBHzyCjOLBxsAr69ejfxGKOp4dBQ9bFZc9dmlZTgd4pK
         wFjgjfwzHBf5kJFXVBr8jHPeXh8ewhPLz14090Y+TLNj5yziU9Lmnoathtz3nvGsa8em
         IM5Bu0TqsMX+qxzgXoCuumdbvmK4u/biAN/DberDlc6Gm1+V/xcxpOaN+644iXmwPnGo
         wHEZ2x01XSpyvuTe1j0/VWATtURVZbsgSBS7zXSxxJlO8Px7NhbtsvBRAP1o79Sdq9pS
         +XYA==
X-Gm-Message-State: AOAM531Zl1ztu3jNmy5sV/Ce5LVlg0X4q2BhmbWroFSWzAniXQGlXXtp
        xTEYM+lbao4IB6FeBoP4IQ80Z5Drf/54VdMx+Sbbig==
X-Google-Smtp-Source: ABdhPJxL0IQBlYqAopVPWGoQr+Wunl/OGnFJbW6XZIRmsGDmfL5sEyFrjL+dywLo7p6VD7PYzN5XHnfazFDhL5mJbcI=
X-Received: by 2002:a9d:18e:: with SMTP id e14mr8456562ote.34.1622928403106;
 Sat, 05 Jun 2021 14:26:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 5 Jun 2021 21:26:42 +0000
MIME-Version: 1.0
In-Reply-To: <1622904059-21244-4-git-send-email-pmaliset@codeaurora.org>
References: <1622904059-21244-1-git-send-email-pmaliset@codeaurora.org> <1622904059-21244-4-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Sat, 5 Jun 2021 21:26:42 +0000
Message-ID: <CAE-0n50WxF_S7Zo4MhFqppjSELTFo7nOEtmCXJ4DoqvhF7kMQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] PCIe: qcom: Add support to control pipe clk mux
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org, svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, dianders@chromium.org, mka@chromium.org,
        sanm@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Prasad Malisetty (2021-06-05 07:40:58)
> In PCIe driver pipe-clk mux needs to switch between pipe_clk
> and XO for GDSC enable. This is done by setting pipe_clk mux
> as parent of pipe_clk after phy init.

Just to confirm, we can't set this parent via assigned-clock-parents
property in DT?

>
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 8a7a300..5cbbea4 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -166,6 +166,9 @@ struct qcom_pcie_resources_2_7_0 {
>         struct regulator_bulk_data supplies[2];
>         struct reset_control *pci_reset;
>         struct clk *pipe_clk;
> +       struct clk *pipe_clk_mux;
> +       struct clk *pipe_ext_src;
> +       struct clk *ref_clk_src;
>  };
>
>  union qcom_pcie_resources {
> @@ -1167,6 +1170,20 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>         if (ret < 0)
>                 return ret;
>
> +       if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {
> +               res->pipe_clk_mux = devm_clk_get(dev, "pipe_src");
> +               if (IS_ERR(res->pipe_clk_mux))
> +                       return PTR_ERR(res->pipe_clk_mux);
> +
> +               res->pipe_ext_src = devm_clk_get(dev, "pipe_ext");
> +               if (IS_ERR(res->pipe_ext_src))
> +                       return PTR_ERR(res->pipe_ext_src);
> +
> +               res->ref_clk_src = devm_clk_get(dev, "ref");

Is this going to be used by any code?

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
> +               clk_set_parent(res->pipe_clk_mux, res->pipe_ext_src);
>
>         return clk_prepare_enable(res->pipe_clk);
>  }
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
