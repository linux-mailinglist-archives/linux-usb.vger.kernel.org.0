Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567BC42FC5A
	for <lists+linux-usb@lfdr.de>; Fri, 15 Oct 2021 21:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242797AbhJOTpa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Oct 2021 15:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242785AbhJOTp3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Oct 2021 15:45:29 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5817C061765
        for <linux-usb@vger.kernel.org>; Fri, 15 Oct 2021 12:43:22 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id o204so14515087oih.13
        for <linux-usb@vger.kernel.org>; Fri, 15 Oct 2021 12:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=l0+h2/ZRa+qjLW8dxix8MACMEy37KEPKQH8VyQ2MSVw=;
        b=BFOiMCYGbYe6Lz8Dmjn78QbsW3EnVgyQwxdhrh9g06c8Fm/3Uzdq10bJB/vGqLKGSw
         2Y8LCxnh/xTkroly7cz9pd0Z7iu+QjKCEbBCybRRyq/TPnPgZ9Z6iX0Ek//rNDgN9m4p
         dVEPXp+WGgn2BicFuy26ULhGsRF0wpHquSO8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=l0+h2/ZRa+qjLW8dxix8MACMEy37KEPKQH8VyQ2MSVw=;
        b=ShckayRSmR/Qi8le5yX4q+k/U77j1Dj1CpJHTgeFnEh3cP1ZQCYTf+EV0nxN/SiAut
         1ofx4R2tXvtQ+D6YclZlmUzhlWdtYDHBC9xw3FInq7cAXo6X4Bl3ePYpRTB7zZm4/hKl
         DR6hLTnYizE4NkPBwDNU16Y+7k45a8TwdxiJ3d57jdeRicgmm60hFH1ueMZmzFnrvJVY
         70jjPSwCepQm2WIbZLMpxsysH2BD+xJbVI284GzHGhvIuYBS2tFjGJTF2E6Ps8wHxekz
         GBPiCYeBZW1j2YN7ZYve/ulTHCqYpIvKrMWFctjmf/nD7SxJhlbYq58yr4XwRY8IdxE4
         WmxQ==
X-Gm-Message-State: AOAM530qnEsSuj8/CUOOZD76nhNiLbNMenNrkNNudYN6+B21ObgZEcQV
        YE+zIvdSK7J+os+DgbhSaWgVzwQfwL3a6cPsBTNLT9//47I=
X-Google-Smtp-Source: ABdhPJyVIq562JmyFECfhrNyOu7gwPgWE/JD6BOexAsIMAqD22SVUUOfEtvXgMTFtpWJlfzpaXksP++FfDyV5v8Fu/U=
X-Received: by 2002:a05:6808:23c2:: with SMTP id bq2mr3750281oib.32.1634327000551;
 Fri, 15 Oct 2021 12:43:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 15 Oct 2021 14:43:20 -0500
MIME-Version: 1.0
In-Reply-To: <20211013100005.GB9901@lpieralisi>
References: <1633628923-25047-1-git-send-email-pmaliset@codeaurora.org> <20211013100005.GB9901@lpieralisi>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 15 Oct 2021 14:43:20 -0500
Message-ID: <CAE-0n52fZZkWt5KxF8gq0D55f_joq0v2sBBp81Gts8cBt6fJgg@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Add DT bindings and DT nodes for PCIe and PHY in SC7280
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Prasad Malisetty <pmaliset@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, svarbanov@mm-sol.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org,
        linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Lorenzo Pieralisi (2021-10-13 03:00:05)
> On Thu, Oct 07, 2021 at 11:18:38PM +0530, Prasad Malisetty wrote:
> > Prasad Malisetty (5):
> >   dt-bindings: pci: qcom: Document PCIe bindings for SC7280
> >   arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes
> >   arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board
> >   PCI: qcom: Add a flag in match data along with ops
> >   PCI: qcom: Switch pcie_1_pipe_clk_src after PHY init in SC7280
> >
> >  .../devicetree/bindings/pci/qcom,pcie.txt          |  17 +++
> >  arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   8 ++
> >  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  50 +++++++++
> >  arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |   8 ++
> >  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 118 +++++++++++++++++++++
> >  drivers/pci/controller/dwc/pcie-qcom.c             |  95 +++++++++++++++--
> >  6 files changed, 285 insertions(+), 11 deletions(-)
>
> I applied patches [4-5] to pci/qcom for v5.16, thanks I expect other
> patches to go via the relevant trees.
>

Lorenzo, can you pick up patch 1 too? It's the binding update for the
compatible string used in patch 4-5.
