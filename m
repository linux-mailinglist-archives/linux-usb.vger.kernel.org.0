Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8ECE421B83
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 03:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhJEBPS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 21:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbhJEBPS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Oct 2021 21:15:18 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B6DC061745
        for <linux-usb@vger.kernel.org>; Mon,  4 Oct 2021 18:13:28 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id b5-20020a4ac285000000b0029038344c3dso5939772ooq.8
        for <linux-usb@vger.kernel.org>; Mon, 04 Oct 2021 18:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=/QiyAF8stN6WXJkebMYhEKCk+J6tjZCzO5t5KsxkaW8=;
        b=Pwmy9PVWT3pIfz5Si5cRGpSEO6knwSKfjSbmckUtWqpjCvAj4Ewq+zy34wQipF5NOP
         BzEsmNRu/QOV7C0QgcTfv6H/wBxKyfTo/o3vhNXrXI6nZ777vdXbSqjwvkx0raD5xYVS
         ZbieAVrbTEAhJ40hDVqGATk6csUZ14pz0VIQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=/QiyAF8stN6WXJkebMYhEKCk+J6tjZCzO5t5KsxkaW8=;
        b=tp9XbO0SSsUEC6zBDvl1ex/iI2zNTf+OYlmZ4iPt5cI4nxKkVOrNu9VPAwFgcjwZcs
         S14w5dt3n4xnU00OVz5WNfszQgMxZX5ExcMY+cy55xPquhjg6RwHPoocWqriFkKEm/x3
         f6kye86N3zVc6WYMHHlPFWl5t2REVjzU6mOwLYU7QK8MITgTkZqqKpqHlutlAmyFEMDG
         VWXNTVwfB/k+2/V2CI3y1e7v37gAskEsDi+MVTg+38R4MIezlycERU379aiG5ohYsMj3
         Rl/51E32UH570YX49C71RXoVbTNhbNymtg1lEIR2qCNcvg0S9xX85XISgVA5cZgcHUUB
         Ecfg==
X-Gm-Message-State: AOAM5317Pk+3MgD7zZ93cmqk6evQrv+oj5tYT3Lsv/r+Ahl/GM0zZmpT
        JEsH/Nl9GWedv2qZwiNCcwdy71AiA/qMuuu3UUg1KA==
X-Google-Smtp-Source: ABdhPJzGa90ACbuF6mgv6oFURLXi+3lJ8M+6w5Brhzs0n9UVBZGhvuUbVVBefiJt5y9Yi2qiXsK00OBN15wA9+TjFYc=
X-Received: by 2002:a4a:8508:: with SMTP id k8mr5453028ooh.25.1633396407883;
 Mon, 04 Oct 2021 18:13:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 Oct 2021 21:13:27 -0400
MIME-Version: 1.0
In-Reply-To: <1633376488-545-5-git-send-email-pmaliset@codeaurora.org>
References: <1633376488-545-1-git-send-email-pmaliset@codeaurora.org> <1633376488-545-5-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 4 Oct 2021 21:13:27 -0400
Message-ID: <CAE-0n51S8VV5b5SEuh041dUvgd2_nqQ3JTXAjMzJfcok0xhi8w@mail.gmail.com>
Subject: Re: [PATCH v10 4/5] PCI: qcom: Add a flag in match data along with ops
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org, svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org,
        linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Prasad Malisetty (2021-10-04 12:41:27)
> @@ -1488,7 +1528,13 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>
>         pcie->pci = pci;
>
> -       pcie->ops = of_device_get_match_data(dev);
> +       pcie_cfg = of_device_get_match_data(dev);
> +       pcie->ops = pcie_cfg->ops;
> +       if (!pcie->ops) {

Sorry I meant check for pcie_cfg being NULL too.
of_device_get_match_data() can return NULL if the match doesn't work for
some reason.

> +               dev_err(dev, "Invalid platform data\n");
> +               return -EINVAL;
> +       }
> +       pcie->pipe_clk_need_muxing = pcie_cfg->pipe_clk_need_muxing;
>
>         pcie->reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
>         if (IS_ERR(pcie->reset)) {
