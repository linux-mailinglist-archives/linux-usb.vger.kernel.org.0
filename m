Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3949A421B7D
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 03:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhJEBNj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 21:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhJEBNi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Oct 2021 21:13:38 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C01C061753
        for <linux-usb@vger.kernel.org>; Mon,  4 Oct 2021 18:11:48 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so23949208otb.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Oct 2021 18:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=JF6vyOXESxtfPHWab3e07TTjv7Vg3ZVZyUb4GlwIoFs=;
        b=cXaB7P7U3MKxhY/Xzb3aCV3IQ1p/c/QFk7Fteow2gs0Zy+03BHtIgOGazJV5pmbDuL
         lDxZg/K+5T/PAT50O1qBp4EC4R46wrcpzlhiX6dC4siXKprLmNfWLB0uPBQyFd7Xv5/W
         Q/dD20j+haqagqa05pclC8RFHt7CeFFwwf5Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=JF6vyOXESxtfPHWab3e07TTjv7Vg3ZVZyUb4GlwIoFs=;
        b=4coZdxxKD5VU8lvgSfAnj6wdXSyDggx5Zq3BOR0jtModLqEf/tgU0ZZa9sUNjCnxr/
         HNUwHNKmjSvONni1Jdq3Ynqqv7nWdTCMrIYQUhc1M7h+EIGOF34E2FdGKSnwsMabjpux
         yHoR3Lxag2ybSy+dlzm/u9dWd6lajbJrYRAtXL4Tm+9ViGEhVcx+YnjYZ9mNZrxWlfHl
         z1P7ljlwIj30W7mG/ByjLIXVA4aZOAN43h0SP+dWUI4I7GlXKFNadTo20MAJXtHxiVUp
         b7qi/Al5desg3ogjO6LH7OYIbFXqf8HfgMM5myywgha0l8SlBeputViubUhODzdnP6/1
         2czQ==
X-Gm-Message-State: AOAM531bh43MnJP7FKXkHA045qZoAIC+P+xGeg8a8VHeUpg/leRTM6kO
        /K35oaVKQ4SIE7+9Ym7hahY+TKfYT0EV+t68CYd82w==
X-Google-Smtp-Source: ABdhPJy6i+fPzH6N8khmOKxP7d2oPe0DSUpWQzfCTqacbniPOVIFqVrcjgwadOtNRRoIUW5BOUwS3sA0fBv8QXKRtQs=
X-Received: by 2002:a05:6830:358:: with SMTP id h24mr11416616ote.159.1633396308016;
 Mon, 04 Oct 2021 18:11:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 Oct 2021 21:11:47 -0400
MIME-Version: 1.0
In-Reply-To: <1633376488-545-3-git-send-email-pmaliset@codeaurora.org>
References: <1633376488-545-1-git-send-email-pmaliset@codeaurora.org> <1633376488-545-3-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 4 Oct 2021 21:11:47 -0400
Message-ID: <CAE-0n50CBhdq3fbtygfzb0m8+bz3244-mYwCtVPjs_CfNaK_NQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] arm64: dts: qcom: sc7280: Add PCIe and PHY
 related nodes
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

Quoting Prasad Malisetty (2021-10-04 12:41:25)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 39635da..e4bbf48 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2676,6 +2787,12 @@
>                         gpio-ranges = <&tlmm 0 0 175>;
>                         wakeup-parent = <&pdc>;
>
> +                       pcie1_default_state: pcie1-default-state {

Maybe call the node pcie1_clkreq_n: pcie1-clkreq-n as it's now only for
the clkreq function.

> +                               pins = "gpio79";
> +                               function = "pcie1_clkreqn";
> +                               bias-pull-up;
> +                       };
> +
