Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7EF3F7CBB
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 21:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242067AbhHYTa6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 15:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241632AbhHYTa4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Aug 2021 15:30:56 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB389C0613CF
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 12:30:10 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id n27so1261176oij.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=JLcefyKSKqjrSJBjDwRPhSlprne7V+zJmYbnypztomQ=;
        b=H0Ernshf//ofwPK9XKjTZSg/dMtEYnrdSaZ+jw/BmPdPeTLAS9z5nLjtKaxufq8vS5
         6HOhqHwXWnQz/p9BxLauB9gVo9Usz+VMM99fOO5Xi2EeTqjgJgIN3F/o/EvmsqfpFevu
         +drnbaTMTdKMLtbyJ0J40Ulep22EhtrAza9fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=JLcefyKSKqjrSJBjDwRPhSlprne7V+zJmYbnypztomQ=;
        b=jmK9BUgtEiEASWD9qdSs4ZyZKZOz0FC6sx5vff6YHdov72jeRrhmNVTs8JX1ylqI2G
         R+40Hdwwjojw8WKOaMCcRy0TnfrbHP88hwKav5AcgwR7uyeLt1b0X0/+1q8fZtlfwxw1
         RpkHL+Pbi3lyoo/JXzGbpoc41l2d4eu5LjiHafUnG34zBWtldOz8ge3CMZm+1w3pygi9
         I3eXWvJgkbCvLHrTAyeGR24J9xAxgTEWzM70reTOHpgkqbOrwwodXpHZHycE48rAldzQ
         1sHHL1ngSRAjcstAI0YY2cp8AU44wadEius1uoAdYEt2xdqZ5gAKDLuJy96lX2XHa/T+
         I5Vg==
X-Gm-Message-State: AOAM530aug1B45HsLwuwInhtTu6RLeeBI3GWYIOfEkU47cxGySXjOfvw
        9+jhnvmJBsmzoQNRJGnr8+iMvd7QIo8ikxa2eoWMdQ==
X-Google-Smtp-Source: ABdhPJz5kKrkvonN2F69o4kqTbjRO+SWZp3mHOvfJVqkOn6Guyq9jgCetnKtG3j0rp8HaNWPw8iPPt7s22TDjDpBZPA=
X-Received: by 2002:a54:468d:: with SMTP id k13mr8278136oic.125.1629919810210;
 Wed, 25 Aug 2021 12:30:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Aug 2021 19:30:09 +0000
MIME-Version: 1.0
In-Reply-To: <e54b4f62dbcd670a0e0658598e045051@codeaurora.org>
References: <1628568516-24155-1-git-send-email-pmaliset@codeaurora.org>
 <1628568516-24155-5-git-send-email-pmaliset@codeaurora.org>
 <349b1178f071407dfad8ba3050482772@codeaurora.org> <e54b4f62dbcd670a0e0658598e045051@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 25 Aug 2021 19:30:09 +0000
Message-ID: <CAE-0n50cnWf_3LQ6P9KMaT4dnryWW9JemP95JDZt5WE1G4mZuQ@mail.gmail.com>
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

Quoting Prasad Malisetty (2021-08-24 01:10:48)
> On 2021-08-17 22:56, Prasad Malisetty wrote:
> > On 2021-08-10 09:38, Prasad Malisetty wrote:
> >> On the SC7280, By default the clock source for pcie_1_pipe is
> >> TCXO for gdsc enable. But after the PHY is initialized, the clock
> >> source must be switched to gcc_pcie_1_pipe_clk from TCXO.
> >>
> >> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> >> ---
> >>  drivers/pci/controller/dwc/pcie-qcom.c | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >>
> >> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c
> >> b/drivers/pci/controller/dwc/pcie-qcom.c
> >> index 8a7a300..39e3b21 100644
> >> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> >> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> >> @@ -166,6 +166,8 @@ struct qcom_pcie_resources_2_7_0 {
> >>      struct regulator_bulk_data supplies[2];
> >>      struct reset_control *pci_reset;
> >>      struct clk *pipe_clk;
> >> +    struct clk *gcc_pcie_1_pipe_clk_src;
> >> +    struct clk *phy_pipe_clk;
> >>  };
> >>
> >>  union qcom_pcie_resources {
> >> @@ -1167,6 +1169,16 @@ static int qcom_pcie_get_resources_2_7_0(struct
> >> qcom_pcie *pcie)
> >>      if (ret < 0)
> >>              return ret;
> >>
> >> +    if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {
> >> +            res->gcc_pcie_1_pipe_clk_src = devm_clk_get(dev, "pipe_mux");
> >> +            if (IS_ERR(res->gcc_pcie_1_pipe_clk_src))
> >> +                    return PTR_ERR(res->gcc_pcie_1_pipe_clk_src);
> >> +
> >> +            res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
> >> +            if (IS_ERR(res->phy_pipe_clk))
> >> +                    return PTR_ERR(res->phy_pipe_clk);
> >> +    }
> >> +
> >
> > Hi All,
> >
> > Greetings!
> >
> > I would like to check is there any other better approach instead of
> > compatible method here as well or is it fine to use compatible method.
> >

I'd prefer the compatible method. If nobody is responding then it's best
to just resend the patches with the approach you prefer instead of
waiting for someone to respond to a review comment.
