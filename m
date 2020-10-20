Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A42C2934B3
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 08:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392067AbgJTGRI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 02:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392062AbgJTGRF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 02:17:05 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F7CC0613D1
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2020 23:17:04 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id j15so344119uaa.8
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2020 23:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/PMZL8djp6BBIIISqMw1ZBVOjv5yfHjbUvy/rFeeBRc=;
        b=bxV0ZtEO2MH8NVX5uSyoFAHrBbQj0EXphUTf/KlhlEGrWa5HVyiCoOjNBomq7GX28Q
         cJxAQiV6kBooan6p+afmfGKDZDdFCW8MJuZEDWgn4hM4LGfHcoFZ9conhev3u8zAqovu
         bg96lp4ap7IY2ZhDqKsNIq7Ex7xhkxq8d5Q90e2T7a0Dc0bS9dwg+5dVGjuKD3xR3r8s
         WuriK+KPMZM3In88jiy6GFSSu+n2rVOk8jWWJv1Np4BMg5sQIvAnLtbEoSRlnRnT1Mjg
         hq2xXnTu9DEuUiRMc5uxRK5G2C1yjE4zIIW4xYSFGVlSq0zCwau/EOPlySuuN+HqzpmD
         EZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/PMZL8djp6BBIIISqMw1ZBVOjv5yfHjbUvy/rFeeBRc=;
        b=t8hMnDgHSBJKTIpHQgfC+VKq4glLYTI3agkCREMcjl281+3X7wENGcJ3WIjgl0rcW8
         DfOkpE7KmAy0MZVZ/0S+3aVlUbS5Fuvm2bBGyZFEk461+Zbr4ns+vx2bcAl2Du/xr4pt
         IqyL1OhiLajryH7vWflT2l8I1dR5eInTV2LIdRtst/FQxdLpzRQiwhyT/iIfCwY2ERyO
         P3rCZFTLWIat2RCc9M2tLepQeQi8iJVXg0YKGzLiXWumvsd3fEwpjzI/pSkZTN1TeKL3
         /SsyRJOwGbDC7lSF0lWdAalQldEa0b/K7PRhdx7UEFcS/h+XyYNaBmTBNZxBz9IHd+CK
         kbZQ==
X-Gm-Message-State: AOAM532n2mCt2mq9C7LPc6lu97LBr0AX9CgwZnOAy6Vmq+D8Da08o4OV
        w2wdd4a40sPI+LwmVd4c2KbGZmdKXREk9bPQ8BXT0w==
X-Google-Smtp-Source: ABdhPJyUkvyqyCT6r760zl8Vb4IKJCfnU8P6FAbX8PUXsUqwUbSl6iaWnMWihJgPvl8adkp6fCiORbXFoNtmOLmeKZA=
X-Received: by 2002:ab0:2345:: with SMTP id h5mr491919uao.1.1603174623423;
 Mon, 19 Oct 2020 23:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200929024004.244992-1-badhri@google.com> <20200929024004.244992-4-badhri@google.com>
 <20201005144618.GA154206@bogus> <CAPTae5+e74k22Vcf-cnFLFGnR-mBdb9qvN6i-E-31VexhpUSeA@mail.gmail.com>
 <CAL_JsqLqs2qZqwmCOMgCeiGsw4Hj2xMAbRYqWCphH92+8T6qUg@mail.gmail.com> <CAL_Jsq+bhEKGXoObGWbWw=1KQAovyJgvvfJe+=n7829HhKmmSw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+bhEKGXoObGWbWw=1KQAovyJgvvfJe+=n7829HhKmmSw@mail.gmail.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Mon, 19 Oct 2020 23:16:27 -0700
Message-ID: <CAPTae5L9EkFEAgEbDY-MEvCRe1_ij5gKRXHtmVee-1VjcQsE+w@mail.gmail.com>
Subject: Re: [PATCH v9 03/15] dt-bindings: usb: Maxim type-c controller device
 tree binding document
To:     Rob Herring <robh@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rob,

Apologies for the delay. Was coordinating care for my parents who
caught the COVID bug.

Thanks,
Badhri

On Tue, Oct 13, 2020 at 6:50 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Oct 13, 2020 at 8:43 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Oct 7, 2020 at 7:43 PM Badhri Jagan Sridharan <badhri@google.com> wrote:
> > >
> > > Hi Robb,
> > >
> > > Thanks for the reviews ! Responses inline.
> > >
> > > Regards,
> > > Badhri
> > >
> > > On Mon, Oct 5, 2020 at 7:46 AM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Mon, Sep 28, 2020 at 07:39:52PM -0700, Badhri Jagan Sridharan wrote:
> > > > > Add device tree binding document for Maxim TCPCI based Type-C chip driver
> > > > >
> > > > > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > > > > ---
> > > > > Changes since v1:
> > > > > - Changing patch version to v6 to fix version number confusion.
> > > > >
> > > > > Changes since v6:
> > > > > - Migrated to yaml format.
> > > > >
> > > > > Changes since v7:
> > > > > - Rebase on usb-next
> > > > >
> > > > > Changes since v8:
> > > > > - Fix errors from make dt_binding_check as suggested by
> > > > >   Rob Herring.
> > > > > ---
> > > > >  .../devicetree/bindings/usb/maxim,tcpci.yaml  | 68 +++++++++++++++++++
> > > > >  1 file changed, 68 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/usb/maxim,tcpci.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/usb/maxim,tcpci.yaml b/Documentation/devicetree/bindings/usb/maxim,tcpci.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..f4b5f1a09b98
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/usb/maxim,tcpci.yaml
> > > > > @@ -0,0 +1,68 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: "http://devicetree.org/schemas/usb/maxim,tcpci.yaml#"
> > > > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > > > +
> > > > > +title: Maxim TCPCI Type-C PD controller DT bindings
> > > > > +
> > > > > +maintainers:
> > > > > +  - Badhri Jagan Sridharan <badhri@google.com>
> > > > > +
> > > > > +description: Maxim TCPCI Type-C PD controller
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - maxim,tcpci
> > > >
> > > > Is there a datasheet for this? Searching for 'tcpci' doesn't really come
> > > > up with anything other than this patch. Only chip I found is MAX77958.
> > > > Bindings are for specific h/w devices.
> > >
> > > Unfortunately the datasheet cannot be made public yet. Has the datasheet
> > > have to be made public before sending the bindings ?
> >
> > No, but we need a part number or some assurance that 'tcpci' is a specific part.
Sure. Added the part number to the binding and changed the compatible string.
Sending this as part of v11


>
> I guess TCPCI is USB Type-C Port Controller Interface Specification.
>
> That's just a protocol definition, not a chip. DT describes h/w which
> is more than just the protocol.
>
> Rob
