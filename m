Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C776C9300
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 22:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbfJBUpb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 16:45:31 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41465 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728074AbfJBUpb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 16:45:31 -0400
Received: by mail-wr1-f66.google.com with SMTP id q9so492082wrm.8
        for <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 13:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jIRr3vuyuHhrBwVmAhx40vU7nfIocHRyk3SvX/TxJC4=;
        b=lv4yJe494FP24e+BxkKzcTuskkg8FrNyh9qdqcSg1Dcv3YTx+dhl1QGHDCgV45qcWp
         ZNxzSzgnJql+p8K7F/qHe7DvnikBq2EAL6deWohmcmE3Dj4an0zi7HZZWN4d4KleAWHa
         5B2L54OLRlITlgizMY4oi/giR85rWAuBn8BtcqRdE4qAwtGHlX1AB2jG9lQKvYR/v9XG
         0/eBFQYRZtUvWtTCaV/fcGYg9WsYWSWFigtWx8zQdWoOa/r8/okmQQrR6DCQdWZFteKt
         h4B4l8//QXMkN4rcXtV8xBx2veLPPNQ+WOSeMF2/QnBw1rAxLy7BLvMtGMSWk6C1fJmU
         Wbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jIRr3vuyuHhrBwVmAhx40vU7nfIocHRyk3SvX/TxJC4=;
        b=Gi4czWXBso32vGZ5oKC2uoXNkqicUHEMvvcXDqneyFL3ZapMpQtWsftw9cBiuMpleF
         D3uOZht3Ej0GeRHIvwIWgIZszQLQ1W5qU9g1DCxw6NrPCoyi7CSdAShT5k8QWQe60nbC
         o+44Ilj03ylSvG7X85WxHcRybQzhRV+JHpYdc4jUGj/lpKSKGY5bAsCDWLqjI1Iv/k6h
         4OOfqnsJdwCjRt8sn6y/+nRqfCNT/B3ckYafK/RG46BNp8RM8f3ymTrfxFd5T2LvlPya
         iidLbxnkak8ojRB8dg/8IoOuw7tO9ReietjRE6apgzWmQiPWrWqLeg1HbufxigeZygSp
         MaWQ==
X-Gm-Message-State: APjAAAWzlOa6tYKsHIfsYONGKJxuCGyq2H7iDzGxepGsl50pWlW0XJyq
        dIVNPTEXpsMtLaQWojVhswf3Kc1yr6XQq89PZ2umzQ==
X-Google-Smtp-Source: APXvYqy+TnevZ77P69zWyJBKS6NLgVRkGaL2594mjSL4rzRv021kXGI1tgDYK/GUZKWeJltREM0md2yRhQO0pJ/k90w=
X-Received: by 2002:a5d:40cf:: with SMTP id b15mr3499059wrq.141.1570049128814;
 Wed, 02 Oct 2019 13:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190925234224.95216-1-john.stultz@linaro.org>
 <20190925234224.95216-5-john.stultz@linaro.org> <1569461658.32135.12.camel@mhfsdcap03>
 <CALAqxLX=csTtnqr2Hc9v_R8ex8zPj_P1JvSyjZXUKEqSaF=gPA@mail.gmail.com> <1569480152.32135.16.camel@mhfsdcap03>
In-Reply-To: <1569480152.32135.16.camel@mhfsdcap03>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 2 Oct 2019 13:45:17 -0700
Message-ID: <CALAqxLUo59DDn=XhofOTHHkpuQPPTxx_jiTTA_o8sedCsxEkiw@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: usb: dwc3: of-simple: add compatible for HiSi
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yu Chen <chenyu56@huawei.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 25, 2019 at 11:42 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> On Wed, 2019-09-25 at 21:06 -0700, John Stultz wrote:
> > On Wed, Sep 25, 2019 at 6:34 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > > On Wed, 2019-09-25 at 23:42 +0000, John Stultz wrote:
> > > > +++ b/Documentation/devicetree/bindings/usb/hisi,dwc3.txt
> > > > @@ -0,0 +1,52 @@
> > > > +HiSi SuperSpeed DWC3 USB SoC controller
> > > > +
> > > > +Required properties:
> > > > +- compatible:                should contain "hisilicon,hi3660-dwc3" for HiSi SoC
> > > > +- clocks:            A list of phandle + clock-specifier pairs for the
> > > > +                     clocks listed in clock-names
> > > > +- clock-names:               Should contain the following:
> > > > +  "clk_usb3phy_ref"  Phy reference clk
> > > It's not good idea to apply phy's clock in dwc3's node
...
> > Given the name clk_usb3phy_ref I'm assuming its a phy reference clock,
> > but I honestly don't know if I'm getting that wrong.  It all seems to
> > be leveraging the fact that the dwc-of-simple driver batch enables and
> > disables all the clocks w/o really looking at the names.
> >
...
> If it's phy clock, we should enable/disable it in phy driver, maybe we'd
> better ask for help from Yu Chen

So I've been looking around the existing code and I'm not sure how we
got to clk_usb3phy_ref here.

Really it is the HI3660_CLK_ABB_USB, who's name is "clk_abb_usb" and
who's parent is "clk_gate_usb_tcxo_en"

So I'm thinking just specifying clk_abb_usb is more accurate here?

Does that sound reasonable?

thanks
-john
