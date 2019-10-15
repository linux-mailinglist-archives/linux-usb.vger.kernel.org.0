Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0F0D6DF6
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2019 05:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbfJOD5i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Oct 2019 23:57:38 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36467 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727399AbfJOD5h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Oct 2019 23:57:37 -0400
Received: by mail-wm1-f66.google.com with SMTP id m18so18639379wmc.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2019 20:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6zpjnd/oSYf7dWxIXsHsLG6VqXEmTIzLuPNZft47eNI=;
        b=uyr8Mi4OzKIo/JSKBj9IwTqrgR+SAtZcNjnmIWpJhDdPpzZ+CBdwSRG5hF/iBoP+vC
         3V1p42ka/zlVvcHK7gAfTWVdZ10ABNL7rt9tT/QXnS0dBp/Xv9udy/XRKb2wYutlR1Qm
         chtkT3g3yB7yKRsM9AB2IeUJXSk9/31UakOteKzMYEXdV6sG0vtKlmYBzR+esBiRvhCm
         CzrwYws317sfMtQDeUEFrJLZZy5ysi6Ika2dr8ladP30ZqOPi9kLkN/GvZuN2lA4hjPF
         DjxcdsEx5BeQW+KPvzvlGOtlQhbj4L80XhqqyiBEqnTtlqLxuMsAHO1mrdKD4F7OMXd4
         n8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6zpjnd/oSYf7dWxIXsHsLG6VqXEmTIzLuPNZft47eNI=;
        b=MShqD6/cFjq8nzdB0lowXoc7Hn+OapxDoaepypmyn+Wo517z2WU7hPBZyeuSDz82SN
         rGEf09hmudkAkEz599kgF792JyPkWN8gCecEIl7CsFe1ONVON9UYjPU0OxTHKe75rams
         YWZgW14A27oWwdh2p9w+g2QWzq8d6EDtlmCbgFUDkXt08T10rC8qaUf+XwbloZ6zsJVS
         GOudCO9G612AbYc/Zdt5pSkl5frQpPTkV7F9INm5hvhO8pOyg6V10a994joZjf+jmGqe
         NQPgt8an+La0w10UumrKeCmcCJ2M89ga+3BCfhdewjONZbq9FEcxleu9UmsECG91+G9k
         JkkQ==
X-Gm-Message-State: APjAAAWui9JTPqv8BFLivTWaWSacEflWSUHnp4Oe4Fbl7lPTJFIgAg9g
        CZuWieRdxTubpSONkB1hpROUbz6YTZj9IWOByg2HFw==
X-Google-Smtp-Source: APXvYqziwH+l1PzjeKFBJxaNQUADsd7MvlFhOwKn9RTiY1k61t5RWbz6E8GAqsS8lo+1yp6NhispyRmFPAf5mCv7gPw=
X-Received: by 2002:a1c:a8c9:: with SMTP id r192mr17425885wme.152.1571111855030;
 Mon, 14 Oct 2019 20:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191007175553.66940-1-john.stultz@linaro.org>
 <20191007175553.66940-5-john.stultz@linaro.org> <CAL_JsqJLY2n7hfneNptAGswVZtGm3vJbSR6W2wUG+ZTzMN8wZA@mail.gmail.com>
 <CALAqxLWB7Vd-H70LLLSW0Fv=_4-saQ9CE2k3-L_43E+F8mLj2w@mail.gmail.com>
 <CAL_JsqJ9uUtqTDEkLi86-BCvW+wM6Pgz_K+JuTsuOqHfFOHStA@mail.gmail.com>
 <CALAqxLVpPvHf2RpwjHh5v9cnQm9CLtj0HHaqVH=EFQJk-GhaPQ@mail.gmail.com> <20191011155123.GA14272@bogus>
In-Reply-To: <20191011155123.GA14272@bogus>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 14 Oct 2019 20:57:22 -0700
Message-ID: <CALAqxLUbh7_PkOwh9NrS_+sgLDZMHndbp44jVQkB=WqOhKUotA@mail.gmail.com>
Subject: Re: [RFC][PATCH v2 4/5] dt-bindings: usb: dwc3: of-simple: add
 compatible for HiSi
To:     Rob Herring <robh@kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Yu Chen <chenyu56@huawei.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 11, 2019 at 8:51 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Oct 07, 2019 at 04:00:24PM -0700, John Stultz wrote:
> > On Mon, Oct 7, 2019 at 2:11 PM Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > On Mon, Oct 7, 2019 at 2:07 PM John Stultz <john.stultz@linaro.org> wrote:
> > > >
> > > > On Mon, Oct 7, 2019 at 11:38 AM Rob Herring <robh+dt@kernel.org> wrote:
> > > > >
> > > > > On Mon, Oct 7, 2019 at 12:56 PM John Stultz <john.stultz@linaro.org> wrote:
> > > > > >
> > > > > > Add necessary compatible flag for HiSi's DWC3 so
> > > > > > dwc3-of-simple will probe.
> > > > > >
> > > > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > > Cc: Felipe Balbi <balbi@kernel.org>
> > > > > > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > > > Cc: Rob Herring <robh+dt@kernel.org>
> > > > > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > > > > Cc: Yu Chen <chenyu56@huawei.com>
> > > > > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > > > > Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > > > Cc: linux-usb@vger.kernel.org
> > > > > > Cc: devicetree@vger.kernel.org
> > > > > > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > > > > > ---
> > > > > > v2: Tweaked clock names as clk_usb3phy_ref didn't seem right.
> > > > > > ---
> > > > > >  .../devicetree/bindings/usb/hisi,dwc3.txt     | 52 +++++++++++++++++++
> > > > > >  1 file changed, 52 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/usb/hisi,dwc3.txt
> > > > >
> > > > > Can you make this a schema.
> > > >
> > > > Sorry, I'm not sure exactly what you're asking. I'm guessing from
> > > > grepping around you want the bindings in yaml instead (I see a few
> > > > examples)?
> > >
> > > Yes.
> > >
> > > > Is there some pointer to documentation? The
> > > > Documentation/devicetree/bindings/writing-bindings.txt file doesn't
> > > > seem to say much on it.
> > >
> > > You mean Documentation/devicetree/writing-schemas.rst? There's that
> > > and Documentation/devicetree/bindings/example-schema.yaml which has a
> > > bunch of annotations on what each part means.
> >
> > Ah! Sorry for missing that. Thanks for the pointer, though I may get
> > away with dropping this one.
> >
> > > > > If it's only clocks and resets for the wrapper node, just make this
> > > > > all one node.
> > > >
> > > > Just to make sure I'm following, you're suggesting I put all the
> > > > clocks/resets in the dwc3 node (renamed to usb for the node name) and
> > > > not add the wrapper?
> > >
> > > Yes.
> > >
> > > > I'll have to see if that's possible. The generic dwc3 binding wants 3
> > > > clocks, but I only have two in the code I've worked with (similarly it
> > > > seems to only want two resets, not 4) so I'll have to see if I can
> > > > figure out how to adapt that.
> > >
> > > Possible since commit fe8abf332b8f ("usb: dwc3: support clocks and
> > > resets for DWC3 core").
> >
> > Ok. It *seems* like I can get it working with the existing binding
> > then. There's a little funkiness with the core expecting three clocks
> > while I only have two (currently I'm duplicating the "bus_early" clk
> > for "suspend". Is there a preferred way to do this sort of hack?), and
> > I'm a little worried that only the first reset is being used (instead
> > of the 4 specified), but it seems to work so far.
>
> I would assume that you simply don't know how the 'suspend' clock is
> connected rather than you don't have one. But that's maybe not a
> problem you can fix.
>
> I would make dwc3 use devm_clk_bulk_get_all and allow for less than 3
> clocks. And do a similar change for resets.

So got a chance to start implementing this and it seems like it will
work. That said, it feels like I'm duplicating logic already in the
dwc-of-simple.c implementation (which already handles arbitrary clks
and resets), particularly if I try to implement the device specific
need_reset quirk used by HiKey960 (and rk3399).

Do you feel having that logic copied is worth avoiding the extra
bindings? Or is it too duplicative?

thanks
-john
