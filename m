Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47CA3CB066
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 22:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730342AbfJCUqN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 16:46:13 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33003 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfJCUqN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Oct 2019 16:46:13 -0400
Received: by mail-wr1-f68.google.com with SMTP id b9so4301533wrs.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Oct 2019 13:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MLz52SXLm9tFNj7zfoyYuJlYYM4Yei855wkH/p9Zakw=;
        b=OI7KpgqTLJVOEWIraY+nfkO4ojeYBzUUEKSTH0kqkcpDLaXbhCsQsSoVcPVwkDtmpU
         nB2+/ZZmv9rvHsErgXDAlNcVkMb2ooESS+UmOT2X18o0r9PNmu5kvsDTBhmDOfQSIwol
         edy2cmcHt0XTNRUWcLCceoxqi+myrjQnnUN2SGogHFCUspjHFN0/lxD1Y+FjmMzh2gEJ
         UkY1C5gSxsqd7RzCIujmFF/eQhTif5fiFwq9YvpZczsEjBVsG+wRYp+yreQYR92ZkDNL
         bE0zfHiOFBsyS1chtZiRP4Hg79Bm01RfQs+kKZ7zgd5ia4ISeCnu/sQUR1tJOHp0F2xn
         gU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MLz52SXLm9tFNj7zfoyYuJlYYM4Yei855wkH/p9Zakw=;
        b=TzxcyBmDpNBo9h1RpN8brrRKZQC0vPIvKIK9fyNSiETqrd4PMZ7q0spA4Zfz9UwlV4
         Y97RfC2gf/5H0C1eHp6zNPkUMea936pv75DMaEYgDguGciRF0sWShKAe2FeYelmeofBp
         vHRst3+Dx6lzmNhXU3KAvRZHkvsb+Duktng1lWIdIx3/k8pVktZ0IDKNAp4E6XHvvgnD
         PbuPsxMTgDVhg9TdHsoAifI++tTXBwi3t6iSkR1xHdTAcDZ3XvUQgLbf3GoYwN7P67OR
         SaaBj8v2hThozUbsrWf0ot9Z1/aPkJP0RlSbv26J+HICgLxsdiVS6Yr+Zrh8FYlRJalC
         mneg==
X-Gm-Message-State: APjAAAWLYvPJvq1hi3eyV0R4R9nAQ6RLDfUYGRL1nejJc3ObPtcZYjkI
        IrI28FCpA1oZcTIH4B42J59tUrhJ0x8SY+GthEYO7j26
X-Google-Smtp-Source: APXvYqyxKVh9z28GFY7FV59xDlRJaJrO7fjRrA9KhCUrEN79DqqukGpApLp9fiWohyYRkWNA856Kq3W60N6EgVMi+d0=
X-Received: by 2002:a5d:638f:: with SMTP id p15mr8481403wru.169.1570135570974;
 Thu, 03 Oct 2019 13:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191002231617.3670-1-john.stultz@linaro.org> <20191002231617.3670-3-john.stultz@linaro.org>
 <20191003112618.GA2420393@kroah.com>
In-Reply-To: <20191003112618.GA2420393@kroah.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 3 Oct 2019 13:45:59 -0700
Message-ID: <CALAqxLWm_u3KsXHn4a6PdBCOKM1vs5k0xS3G5jY+M-=HBqUJag@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 3, 2019 at 4:26 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 02, 2019 at 11:16:16PM +0000, John Stultz wrote:
> > From: Yu Chen <chenyu56@huawei.com>
> >
> > This patch adds notifier for drivers want to be informed of the usb role
> > switch.
>
> Ick, I hate notifiers, they always come back to cause problems.
>
> What's just wrong with a "real" call to who ever needs to know this?
> And who does need to know this anyway?  Like Hans said, if we don't have
> a user for it, we should not add it.

So in this case, its used for interactions between the dwc3 driver and
the hikey960 integrated USB hub, which is controlled via gpio (which I
didn't submit here as I was trying to keep things short and
reviewable, but likely misjudged).

The HiKey960 has only one USB controller, but in order to support both
USB-C gadget/OTG and USB-A (host only) ports. When the USB-C
connection is attached, it powers down and disconnects the hub. When
the USB-C connection is detached, it powers the hub on and connects
the controller to the hub.

This is pretty HiKey960 specific, so I think the notifier is useful to
let the gpio hub logic tie into the role switching events.

Suggestions for alternative approaches?

thanks
-john
