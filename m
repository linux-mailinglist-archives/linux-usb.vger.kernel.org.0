Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3086E2E97F0
	for <lists+linux-usb@lfdr.de>; Mon,  4 Jan 2021 16:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbhADPBC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Jan 2021 10:01:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:52106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727042AbhADPBC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Jan 2021 10:01:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BF672242A;
        Mon,  4 Jan 2021 15:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609772421;
        bh=76McoPLoNXJ7zHHaiw/iwsZGfjPtMnTd4fHkz6RlLy8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hW3TIYlm5O2iQLM7GL7kuNEE+bfaGGMCrl/joYLmQoLp+GvMfX5+jbAcZlEXo+7s2
         TDIwPmdczlyq67q6DKqSjrXAp50fN4u4heeDYwO+xIk9ZaFXp6m2NeuL2RLdBnpgv/
         +41Di+IGZkc+36/YJbXYposq4uLlt9hHjtezqr3yDY4ziaegiysqAqOE48JnwVjkUc
         b/QZzOu6Uxj3QXyX1EbO7oIf0FLlbyVmt5Ipt1cGK9NWA06sr4Y3HMrQ9Kc7u38eE+
         vLLbsEgb5iObFMTURFJJQI8NQvqrTmOOEvlxQQAsU0D66jURCYMfL2GkCfhoz1Khk/
         GVbmFhfBRE+xg==
Received: by mail-ed1-f47.google.com with SMTP id y24so27601477edt.10;
        Mon, 04 Jan 2021 07:00:21 -0800 (PST)
X-Gm-Message-State: AOAM533WCV+oOMLAK7WzsEcP+vpx+nqE/I+PrJ0Oz0xgxT1NFSDKr6+a
        lKG8kJL3XStV+/rjMhcu5tPW/EMA8IVBNk7+sw==
X-Google-Smtp-Source: ABdhPJwP6EYjbmYykf88vjoK9iRw2jfL9KsS5MI6owjDaO1gbRR6sIbACzP27r40L+/JSgw7vJj4YjDeZpqVPcLQJ+g=
X-Received: by 2002:a05:6402:ca2:: with SMTP id cn2mr71082828edb.137.1609772419839;
 Mon, 04 Jan 2021 07:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20201210134215.20424-1-peter.chen@kernel.org> <CAL_JsqKxcWjdxVHSSHKKRtshwOXeodjQWCYt6G7asJYjjuoWQQ@mail.gmail.com>
 <20201211020155.GA490@b29397-desktop>
In-Reply-To: <20201211020155.GA490@b29397-desktop>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 4 Jan 2021 08:00:07 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKk1KBCnWp40XyLGAPMJP-R-qAdo9FRax+DgrowKhp1=g@mail.gmail.com>
Message-ID: <CAL_JsqKk1KBCnWp40XyLGAPMJP-R-qAdo9FRax+DgrowKhp1=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] of: platform: introduce platform data length for auxdata
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@ti.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Frank Li <frank.li@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 10, 2020 at 7:02 PM Peter Chen <peter.chen@nxp.com> wrote:
>
> On 20-12-10 09:38:49, Rob Herring wrote:
> > On Thu, Dec 10, 2020 at 7:42 AM Peter Chen <peter.chen@kernel.org> wrote:
> > >
> > > From: Peter Chen <peter.chen@nxp.com>
> > >
> > > When a platform device is released, it frees the device platform_data
> > > memory region using kfree, if the memory is not allocated by kmalloc,
> > > it may run into trouble. See the below comments from kfree API.
> > >
> > >          * Don't free memory not originally allocated by kmalloc()
> > >          * or you will run into trouble.
> > >
> > > For the device which is created dynamically using of_platform_populate,
> > > if the platform_data is existed at of_dev_auxdata structure, the OF code
> > > simply assigns the platform_data pointer to newly created device, but
> > > not using platform_device_add_data to allocate one. For most of platform
> > > data region at device driver, which may not be allocated by kmalloc, they
> > > are at global data region or at stack region at some situations.
> >
> > auxdata is a "temporary" thing for transitioning to DT which I want to
> > remove. So I don't really want to see it expanded nor new users. We've
> > got about a dozen arm32 platforms and 5 cases under drivers/.
> >
>
> How to handle the below user case:
> Parent device creates child device through device tree node (eg, usb/dwc3,
> usb/cdns3), there are some platform quirks at parent device(vendor glue
> layer) need child device (core IP device) driver to handle. The quirks
> are not limited to the hardware quirk, may include the callbacks, software
> flag (eg: XHCI_DEFAULT_PM_RUNTIME_ALLOW/XHCI_SKIP_PHY_INIT, at
> drivers/usb/host/xhci.h)

The split of these between a platform specific driver and the core IP
driver was just wrong to begin with. There should only be 1 driver
with common 'library' functions like we do for every other case of
common, licensed IP. Perhaps the core driver should stop pretending it
is generic and figure out the quirks for itself by looking at the
parent node.

Rob
