Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFF027F0F8
	for <lists+linux-usb@lfdr.de>; Wed, 30 Sep 2020 20:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729395AbgI3SA5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Sep 2020 14:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728031AbgI3SA4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Sep 2020 14:00:56 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30896C0613D1
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2020 11:00:55 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id n26so716172uao.8
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2020 11:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ION+wzhBe/H3HfVhVn+aQX6OzRaoZpbpam2ANPg8S4M=;
        b=WlaLzAfIf8gOrN61qUpliyZBNgObrr8xUTvxW9ednPw5sEUmkOlDoTRsT+tZIJiEk+
         us0nNAvOS0At26rSTh8xkL+17Pg+KGnqWPys/tJv23e2ngAd5AyuMaDSTJvI2/Vj8E1d
         52d5VerCqA/Zzxk3XPVyGQoWIzXc6R5108cCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ION+wzhBe/H3HfVhVn+aQX6OzRaoZpbpam2ANPg8S4M=;
        b=ZF7v/A5bUW8k8NaiVnoacZSpgpSTEl7z5qW3k2QgjdRc1JPNtn1vGySNIZFqmwWXHN
         DLR1QbFMJ9+2Zrvv7RNZdXJ6W3oTBeXws2SKPZSz+6WVqcUYqUqZ6tM/jXcoxs1EEW8A
         njQMFpRgwbpHLsMDRzc+/jzIVlw7SvdzPpA2/X3DUltx827Cytpgd91ShLYbOhEi9A54
         WOGYHXUuTeosXtyVRTBJDIMJeChnKOmkOo1JFFySzcCi6fRX6XhSN57vKar+nwlYpGCC
         0SPViMzBVUQAgEZ4Zn7C+iDaFKHVfaiW/iIlmGjNXRUrggW4Cez+dsF0ZBW35wHN4izz
         gi/g==
X-Gm-Message-State: AOAM531F4USpQthPRHpTfjRVc3gYqPp6OQvUBl8NDBsMrfFTxCxDJVym
        bZ871O/YZnim8qLpdqAm7FXnkRWZgG4vAQ==
X-Google-Smtp-Source: ABdhPJz17RFpmKg2OQ+6mWg8vj5aevYxqs83ITpDTIWU+h3k8bOPn7BLcDnd/eoMVJ6IY024BMEvfg==
X-Received: by 2002:ab0:130a:: with SMTP id g10mr2629586uae.100.1601488853809;
        Wed, 30 Sep 2020 11:00:53 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id f3sm351027vkk.32.2020.09.30.11.00.51
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 11:00:52 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id 7so1384996vsp.6
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2020 11:00:51 -0700 (PDT)
X-Received: by 2002:a05:6102:2f7:: with SMTP id j23mr2430596vsj.37.1601488851471;
 Wed, 30 Sep 2020 11:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200928101326.v4.1.I248292623d3d0f6a4f0c5bc58478ca3c0062b49a@changeid>
 <20200929201701.GA1080459@bogus> <20200929220912.GF1621304@google.com>
 <20200930013229.GB194665@rowland.harvard.edu> <20200930124915.GA1826870@google.com>
 <CAL_JsqLq9ZJm_CMiqWwbQhgGeu_ac_j43pvk4+xCFueSbyL4wA@mail.gmail.com> <CAD=FV=WcDzgcHNn1+gH+gq_WEwpD0XXdJGm2fBVpAB=3fVbzZA@mail.gmail.com>
In-Reply-To: <CAD=FV=WcDzgcHNn1+gH+gq_WEwpD0XXdJGm2fBVpAB=3fVbzZA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 30 Sep 2020 11:00:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WhowcppEhmd=QG7YFk5iSVaCKsfGJkGBQJTwMs=bwekA@mail.gmail.com>
Message-ID: <CAD=FV=WhowcppEhmd=QG7YFk5iSVaCKsfGJkGBQJTwMs=bwekA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add binding for discrete onboard
 USB hubs
To:     Rob Herring <robh@kernel.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

> On Wed, Sep 30, 2020 at 7:44 AM Rob Herring <robh@kernel.org> wrote:
> >
> > We already have hubs in DT. See [1][2][3][4]. What's new here?

After I sent my response I kept thinking about this and I realized
that I have prior art I can point out too!  :-)  Check out
"smsc,usb3503a".  That is describing a USB hub too and, at least on
"exynos5250-spring.dts" is is a top level node.  Since "smsc,usb3503a"
can be optionally connected to an i2c bus too, it could be listed
under an i2c controller as well (I believe it wasn't hooked up to i2c
on spring).

Interestingly enough, the USB Hub that Matthias is trying to add
support for can _also_ be hooked up to i2c.  We don't actually have
i2c hooked up on our board, but conceivably it could be.  Presumably,
if i2c was hooked up, we would have no other choice but to represent
this chip as several device tree nodes: at least one under the i2c
controller and one (or two) under the USB controller.  Just because
(on this board) i2c isn't hooked up doesn't change the fact that there
is some extra control logic that could be represented in its own
device tree node.  To me, this seems to give extra evidence that the
correct way to model this device in device tree is with several nodes.

I'll point out that on "exynos5250-spring.dts" we didn't have to solve
the problem that Matthias is trying to solve here because we never
actually supported waking up from USB devices there.  Thus the
regulator for the hub on spring can be unconditionally powered off in
suspend.  On newer boards we'd like to support waking up from USB
devices but also to save power if no wakeup devices are plugged into
USB.  In order to achieve this we need some type of link from the
top-level hub device to the actual USB devices that were enumerated.

-Doug
