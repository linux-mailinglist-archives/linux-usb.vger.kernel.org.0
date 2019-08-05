Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA2F181666
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 12:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbfHEKHK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 06:07:10 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:47021 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728058AbfHEKHK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 06:07:10 -0400
Received: by mail-lf1-f67.google.com with SMTP id z15so53181021lfh.13
        for <linux-usb@vger.kernel.org>; Mon, 05 Aug 2019 03:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nVUZMecSchHo3ov4XgyeqBe+ricOQYDOHuC+qKYyro0=;
        b=bhdM2UlaB2K8iOROiArDFJXYmMBmI0NM6/LKx7/XPm3GqnbIb/bPPiA9Pz8k6nIBF1
         a9wtyCtkgQ0ZgwGYPUfVAbL+577Jz5tF8GafZQB9sMfUv4Nlj4rYl3Er6wl9+QH8Nxhy
         FtkwAUSMAAQBSGeGVlWgZpDNyLCvoPBhP0pcgK2/BjumMbrw+T0pnm5VkmBeHWZ3nO4I
         GPuHg6bPKKt6ASXdwolYWYyjGdwR+7o06PTxLel00izXGOs6Vp7hj8S46bBF1UOQ3xx7
         4WFYidUocdAHqGiNAXEwabc3LLabLm4K7NaBqzO0dTJ+pDE/gdAlCjuDbCMU7TKWXxNK
         QsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nVUZMecSchHo3ov4XgyeqBe+ricOQYDOHuC+qKYyro0=;
        b=R89f4G88xeNkOtVF+shagDqluZSod/8k3/4hdmVx+PnzLOU6Z6HP9gwJD1U2cEpQc6
         r7FZfPJrBqBD8qPFEeEbDxdkmQDFOkSXzKRxH/j5ZkNaRx2EHh6eXeyE4ebnHTAvY+0q
         MwMYO1EDbP8PswuYWhXB2ChgbyK7ANRVvWEuQjzv4fJ8yv0j+QaEfi0+LPc5jwFZKygl
         WMrc839CSbmCzoO0NRu0KXqZtuKb9a9YBwrMqEGu4gV2za+Z9YaKgwRecExSO/HWjsxn
         W4KUi7vlCXIhWqXew/Rva2Sthi77xIkJty4ddVqg3Ih7a5mDMz5QXAx9DT1SoRcAruMV
         DaRg==
X-Gm-Message-State: APjAAAX8JumGOxzcqRJJPu/yGrt6MHlWF5xoBLbQ39JiOfPm+RyLojie
        3WaM8d5ZLFsgfevXY5ANnht2fRY0GEH20SmprA/SJw==
X-Google-Smtp-Source: APXvYqzbr3N8Sty4/n+PKBjjuxasyEkPZbJo4c/cdLdH2JC6OzKmDCkMaV5/W8Fpx4+sg/pPghnAd39wNmbfOj5KmtU=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr1356862lfi.115.1564999628161;
 Mon, 05 Aug 2019 03:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <1563958245-6321-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1563958245-6321-1-git-send-email-chunfeng.yun@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:06:56 +0200
Message-ID: <CACRpkdaBT24JPH_VsKtgp6fjWtVuqM50rXkDVYKmLHgR5hdJzA@mail.gmail.com>
Subject: Re: [PATCH v8 00/11] add USB GPIO based connection detection driver
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Li Jun <jun.li@nxp.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Min Guo <min.guo@mediatek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 24, 2019 at 10:51 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:

> Because the USB Connector is introduced and the requirement of
> usb-connector.txt binding, the old way using extcon to support
> USB Dual-Role switch is now deprecated, meanwhile there is no
> available common driver when use Type-B connector, typically
> using an input GPIO to detect USB ID pin.

However while this was going on,
drivers/extcon/extcon-fsa9480.c was merged and that detects
not only GPIO on the USB port but multiplexed usecases such
as UART over the USB micro PHY (and no that UART is not
a USB UART, but an actual RX/TX over D-/D+).

That driver also measure a whole slew of funny resistance
values on the ID pin, that is how it does its job.

But for just "hey I'm plugged in" we can surely keep this
ID on GPIO detection in the USB subsystem.

I just get a bit insecure about how we should ideally
handle these "funny-PHY's".

Yours,
Linus Walleij
