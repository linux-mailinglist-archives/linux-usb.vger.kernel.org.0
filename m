Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E814743298D
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 00:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbhJRWHm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 18:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232139AbhJRWHl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Oct 2021 18:07:41 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF86C061745
        for <linux-usb@vger.kernel.org>; Mon, 18 Oct 2021 15:05:29 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id a13so7024629qkg.11
        for <linux-usb@vger.kernel.org>; Mon, 18 Oct 2021 15:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VNpqRRdnPDIUGCc3uEFG9REMCz+uQZwgGwBrpVs1X7k=;
        b=PzH1/3QFJDCAo6+yfE9yZp3FhN5bdJblxdwmrYJXz4W0YDV5QgMDwXPS+9oDzaYsmR
         1hy1VBsrs0g+cboLAmAYffm5C4OKJ9PZknz0zqdbSlWGpa8IqJfWmggmKLf9VGSQPSoq
         bF2fHToJMjgOwuWZ6BDY28QPn+sUaZRuPFe0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VNpqRRdnPDIUGCc3uEFG9REMCz+uQZwgGwBrpVs1X7k=;
        b=jbUPBCtWEy+bsRM6Q+a6i8INo1Nius9Vv39wuP/rlcQL/AAmkUABXPghZGyMD0jWV9
         mL7ZyJoZlk8O4YzxeRdSe7fgKGTVDmX8gmRbyaU5SG9UGpwGRJt/yDc57AEKGzkbEdHX
         SVH6smjpKbswuLkGkMoBogp7m75ab7gCcwuyH6XU9SmIiZXh0PJABEqTOjNSYc6gS9M2
         EEgjQZNm38yrTBqhv/evsk9mOcv17g2rWVtjS6W7G3gIvsDP2YQmaTrIISRBduyzWbwc
         ibCvnHuG+XbAUHwWcWKadQkfO36aEDbSUIFxRmsGeF9zRlMKM+zJ9PXCPCZIKKuRyxeP
         kmOQ==
X-Gm-Message-State: AOAM531O7d8cOECieXhNMuDq5D2GqpsVdmAW61UzMs0Zt4ngG88UCZ+O
        j/ZF71Emu3KPBtn5XG+VX958tPqcf3C9fA==
X-Google-Smtp-Source: ABdhPJxgYjUyH0Q251jOZsOWEQ+UIOqPIjhVTG8zxqDyI6ymObyK9GhrElt8oohDuuXI2j4/nN2ovA==
X-Received: by 2002:a37:a50a:: with SMTP id o10mr25659134qke.419.1634594728317;
        Mon, 18 Oct 2021 15:05:28 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id t11sm7024335qkm.92.2021.10.18.15.05.28
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 15:05:28 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id t127so5549850ybf.13
        for <linux-usb@vger.kernel.org>; Mon, 18 Oct 2021 15:05:28 -0700 (PDT)
X-Received: by 2002:a5b:102:: with SMTP id 2mr31008124ybx.101.1634594288583;
 Mon, 18 Oct 2021 14:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <1633628923-25047-1-git-send-email-pmaliset@codeaurora.org>
 <20211013100005.GB9901@lpieralisi> <CAE-0n52fZZkWt5KxF8gq0D55f_joq0v2sBBp81Gts8cBt6fJgg@mail.gmail.com>
In-Reply-To: <CAE-0n52fZZkWt5KxF8gq0D55f_joq0v2sBBp81Gts8cBt6fJgg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 18 Oct 2021 14:57:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WYvV+=uyEOYq7LjtBgpSGV6KovvoS1e88fgc1kpt_c7Q@mail.gmail.com>
Message-ID: <CAD=FV=WYvV+=uyEOYq7LjtBgpSGV6KovvoS1e88fgc1kpt_c7Q@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Add DT bindings and DT nodes for PCIe and PHY in SC7280
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>, svarbanov@mm-sol.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        sallenki@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, Oct 15, 2021 at 12:43 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Lorenzo Pieralisi (2021-10-13 03:00:05)
> > On Thu, Oct 07, 2021 at 11:18:38PM +0530, Prasad Malisetty wrote:
> > > Prasad Malisetty (5):
> > >   dt-bindings: pci: qcom: Document PCIe bindings for SC7280
> > >   arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes
> > >   arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board
> > >   PCI: qcom: Add a flag in match data along with ops
> > >   PCI: qcom: Switch pcie_1_pipe_clk_src after PHY init in SC7280
> > >
> > >  .../devicetree/bindings/pci/qcom,pcie.txt          |  17 +++
> > >  arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   8 ++
> > >  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  50 +++++++++
> > >  arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |   8 ++
> > >  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 118 +++++++++++++++++++++
> > >  drivers/pci/controller/dwc/pcie-qcom.c             |  95 +++++++++++++++--
> > >  6 files changed, 285 insertions(+), 11 deletions(-)
> >
> > I applied patches [4-5] to pci/qcom for v5.16, thanks I expect other
> > patches to go via the relevant trees.
> >
>
> Lorenzo, can you pick up patch 1 too? It's the binding update for the
> compatible string used in patch 4-5.

I think that means that patches 2-3 are ready to land in the Qualcomm
tree assuming Bjorn Andersson is still accepting patches there for
5.16, right?

-Doug
