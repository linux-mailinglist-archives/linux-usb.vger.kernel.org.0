Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA88E3E83D4
	for <lists+linux-usb@lfdr.de>; Tue, 10 Aug 2021 21:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhHJThr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 15:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbhHJThr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Aug 2021 15:37:47 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72C8C0613D3
        for <linux-usb@vger.kernel.org>; Tue, 10 Aug 2021 12:37:24 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id u10so735623oiw.4
        for <linux-usb@vger.kernel.org>; Tue, 10 Aug 2021 12:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=9Fxu/Ysfn0gqVmhD1gd5P8cBO5tv38bfpeBMPA6T+64=;
        b=GCDls4YJQW1Lz3IMv4mdjtIDR4+DSbiXvOp2eVyyB2Na/tEGUPrG343jTR+dvrxax1
         mD7TMQGMbI7bx65Tkis5yPhJBr0clMpcsOGAuIfOuPaHgUAeW3IYs+3JUZnJum+vaOvU
         +pJD8t57bNeJidPHRJm/vyE5f5KRQ04xvuSng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=9Fxu/Ysfn0gqVmhD1gd5P8cBO5tv38bfpeBMPA6T+64=;
        b=B/I5B4Qk0AugH1b+dvQGwuyV1bkjGl/xriw8hB5DJHJ+7+vBwmsubuBqC4Y0HBHEMZ
         0gY6HIJOGb1sh2ubYULdi59S+0BwBsq9/vRk9kpthWBL3FaURJi9Y4PiziuunvSebOe4
         qaRMa+OCJzp0mXF0hIjteaTSYVppTIYj+qDtBdMyM4tFyyRR9rS0rjxdqk6MH3VmCALZ
         1DjHVX7j4/rOai2AMhdnYkICeNHLH9ksyxytLN3Iw7biY61FTSEuzJBSlXC9is+1ix0o
         m5z+nqn4ARAy5gGK1niPvxz3+F1R18doARFMQsOlWjFT1GguuIHJMKqix8EjohI1HKUZ
         jExQ==
X-Gm-Message-State: AOAM5312AKhJK0eKYdw4bqP2uSxW54Lbp62C3AU2u8ku4XMah5lYEwD0
        QH/znm8VDo8BTV9d4rfh0aja1b3rtE2TMiw2eZkvUw==
X-Google-Smtp-Source: ABdhPJxU0FT5mFZ1LfcK03VImsB6LDN/ygUzUlf0I6T/TxHXwb2bTppAzk8rLFzG/A7E13jLiMYR8RBrgzpG/w2wY6A=
X-Received: by 2002:a05:6808:984:: with SMTP id a4mr4982195oic.166.1628624244330;
 Tue, 10 Aug 2021 12:37:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 12:37:23 -0700
MIME-Version: 1.0
In-Reply-To: <1628568516-24155-5-git-send-email-pmaliset@codeaurora.org>
References: <1628568516-24155-1-git-send-email-pmaliset@codeaurora.org> <1628568516-24155-5-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 10 Aug 2021 12:37:23 -0700
Message-ID: <CAE-0n50nYEAhpBADVWutm-SvUMpe+4Qte69iucJvXax=d_59=w@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] PCI: qcom: Switch pcie_1_pipe_clk_src after PHY
 init in SC7280
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org, svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Prasad Malisetty (2021-08-09 21:08:36)
> On the SC7280, By default the clock source for pcie_1_pipe is
> TCXO for gdsc enable. But after the PHY is initialized, the clock
> source must be switched to gcc_pcie_1_pipe_clk from TCXO.
>
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 8a7a300..39e3b21 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1167,6 +1169,16 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
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
> +       }
> +
>         res->pipe_clk = devm_clk_get(dev, "pipe");
>         return PTR_ERR_OR_ZERO(res->pipe_clk);
>  }
> @@ -1255,6 +1267,12 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
>  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>  {
>         struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> +       struct dw_pcie *pci = pcie->pci;
> +       struct device *dev = pci->dev;
> +       struct device_node *node = dev->of_node;
> +
> +       if (of_property_read_bool(node, "pipe-clk-source-switch"))

This can be straightline code. If gcc_pcie_1_pipe_clk_src is NULL,
calling clk_set_parent() on it is a nop, return 0, so drop the property
check and only assign the clk pointer if it needs to be done.

> +               clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->phy_pipe_clk);

Please check the return value and fail if it fails to set the parent.
I'd also prefer a comment indicating that we have to set the parent
because the GDSC must be enabled with the clk at XO speed. The DT should
probably also have an assigned clock parent of XO so when the driver
probes it is set to XO parent for gdsc enable and then this driver code
can change the parent to the phy pipe clk.

>
>         return clk_prepare_enable(res->pipe_clk);
>  }
