Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFFB81689
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 12:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbfHEKKy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 06:10:54 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46413 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHEKKy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 06:10:54 -0400
Received: by mail-lf1-f68.google.com with SMTP id z15so53190340lfh.13
        for <linux-usb@vger.kernel.org>; Mon, 05 Aug 2019 03:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=38PNBCxR8E/gwN5SobPXrhNr+MV57GD7N/MEMGkZI8M=;
        b=i+KWdtoyatpzpphFY2WaJrES1l5iH+km4ZzYvw9Pj8U6cQ9EV8MJo50y2rFheh0sQf
         If1EUHTnLQYMu1Ufh+wue461SW1p3twp+YJYSThodXvheiQUsdX1L8q7rXNN2TVo0+3B
         AKc9XtG1SJ9qwu3cUsAOEB0/PEAlpEV0pI3GTyAtzv0nfOLW4nFFD7clhV75F/w+aNzw
         5Au5ijk2hYONfmLVa0NPleuXW4f9ejdIYsinAsw4Q3fUPuxVvWzGPkZjRvrNsqnWdOJV
         NxZUss8V+kueLKH5812GcCc8+NKYiY0vtDZRGWS4hLJ3JfWGkDXuNt2TcdfZM9DVT3R7
         j+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=38PNBCxR8E/gwN5SobPXrhNr+MV57GD7N/MEMGkZI8M=;
        b=WE2s2Kq8k68ASo38AluFKaGYyq0McRm/7xABzXvD0Wm2RtDKmJzeYxdrZ58bMiLr/5
         ixCIMfwzh5b8AnkOOrN9aMB+p227RcIJJFwJezrkkD/dDpF1kFk0gsI1hX62suci9Bez
         IERXVrlkeHMcgZSB7WVWZHSJjypnGxdwg6Sr55bPjxlC5DS9xyfUhR0NKZ60f87oaHYG
         AOADqf9RbJalT02B5aO1aKEcWvf8Ie8kOsVWZvXeCTjH370P1AyxJFNgup8mQ/ACp/dX
         w2pzQoMxZnmwghRlbehTRibyhybjDzJ9QcNWEVCLyzqFC+gDdC44ZNktoP3HlsbRRnnf
         uSGA==
X-Gm-Message-State: APjAAAX3Woikqct2iGNkR/u45G55RBZcwaDcLJhu42zLxtSAZPzr7wZb
        DpJVlBYD4MRdjRXZ7F/YmSoDShPqSUD1KV5kSKBJQQ==
X-Google-Smtp-Source: APXvYqxusHjcjpDv1JZyVr5ijdjJU9V1dMWbb6Wlipx267US9qZGpWDr37CqWIealFc9Ew2Cd3rGlJafBijXpEfIUBo=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr68758068lfh.92.1564999852084;
 Mon, 05 Aug 2019 03:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <1563958245-6321-1-git-send-email-chunfeng.yun@mediatek.com> <1563958245-6321-11-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1563958245-6321-11-git-send-email-chunfeng.yun@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:10:40 +0200
Message-ID: <CACRpkdbq1rEpTm3Lqqb11WrKumV7bjUancuu-u2Ow0PQsCoLsg@mail.gmail.com>
Subject: Re: [PATCH v8 10/11] usb: common: add USB GPIO based connection
 detection driver
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

> Due to the requirement of usb-connector.txt binding, the old way
> using extcon to support USB Dual-Role switch is now deprecated
> when use Type-B connector.
> This patch introduces a driver of Type-B connector which typically
> uses an input GPIO to detect USB ID pin, and try to replace the
> function provided by extcon-usb-gpio driver
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Tested-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> v8 changes:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
