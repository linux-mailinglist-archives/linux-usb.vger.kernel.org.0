Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64D33119F21
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 00:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfLJXOM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 18:14:12 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34481 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfLJXOM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 18:14:12 -0500
Received: by mail-lf1-f68.google.com with SMTP id l18so15153697lfc.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 15:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y5an3uiCjiV6aBec5mJqVa6m+5HL+owl0rpw015ZHfA=;
        b=hzjb1Oz0AtzDCvW5qERw8MVMMnLibZJXse6EPTaHJ0Wau59lgzmAYrKFNYXyXtZQsQ
         au0JvCMJprf93j96pKv/cC3r90VJ8x2snYOqYHjeRY8X2yrCmdERVmR3bQN0Kbx2zGc9
         TmIPzAyzkhin2IOwu/vkLtZjCQklziqVfAA5SX7UKAaj4BZe97LfBoWZmghZNL+8in5V
         lxcTg89A8NuxwqRCwseesKL7DspdeXShGTrnlPaMFPxTGh9ZMjYsUBQ5GCyZ4HWXZzd6
         iASO5Gtq96X5Cd472ViaoQM6BXXsK8Nmj0IaYItnrdqo3ODO//dkTqET456pyFMsUZHh
         THvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y5an3uiCjiV6aBec5mJqVa6m+5HL+owl0rpw015ZHfA=;
        b=pD3omo46TM0E1DxPgRmhK5Xl2WG4icaJps6LC1RbECNvpOIL81kG26r3l5MOho7eZL
         B/thUEwgrPDQvMeF+ws0by+keB00l2abdtiZGOo42qhp2qeyVZ2/5GPN9X8tu2HSLOu3
         FMCyEiBy492R1oR1Y4/Mm0xhpLvtD1Au2t8SKjR4VE5wf8dVheppjxU/mbF4V8A/FtT7
         D8NhlllLZMM7o+C6rvVn7UbMfCW/g1q4Cz1XdLonlUj2dpmMsjog3DFsB5621cW98JR3
         k8aCiQyzrp8jAY/F3V2fp5lYbj8Kiz4OdxBcIQWN9LSS70wsFnGSXLcUYpkqcRPq0lbs
         pTTg==
X-Gm-Message-State: APjAAAW5T/2D5DTnfvecDfMq3t4hjY59yxtZPH9nVCF0G/HH860YM7b/
        Hce9puVz89CMf3hQiI0bqLLqPc22LC73/+/jAw2xyEpZ3Co=
X-Google-Smtp-Source: APXvYqxUWR4LFsaDQ+gNcyuSyBeEU+H1QqKIJozS4it8NsollBoDp1T3SH1r3kAZ+wHIG37+HuSFWHfxBxENG8ljbyo=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr219870lfi.93.1576019650100;
 Tue, 10 Dec 2019 15:14:10 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb@eucas1p1.samsung.com>
 <20191205145633.187511-1-linus.walleij@linaro.org> <39902b1d-656c-2dc9-34bc-3bfe715db22f@samsung.com>
 <e4ba86d5-3c25-8b2c-981c-efaad4ebc60c@samsung.com> <CACRpkdaV9zoVzpZ3SW-Nvjo6ytUCEjA6fWuW1FSBciQ24j5SZg@mail.gmail.com>
 <402598f1-3230-c48f-c1c0-feda19cb2261@samsung.com> <CACRpkdZBOFXxm_n+A+Oz=MubkSTKG7aUX+9jonB5vm+_XPK_DA@mail.gmail.com>
 <bb1432d3-1fee-9c3d-0ae1-af305deed636@samsung.com>
In-Reply-To: <bb1432d3-1fee-9c3d-0ae1-af305deed636@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Dec 2019 00:13:58 +0100
Message-ID: <CACRpkdbPpxY2s8fqNuoYcrQUY1TJXmy__qbJ6nbw4XYrqtNHNQ@mail.gmail.com>
Subject: Re: [PATCH] usb: usb3503: Convert to use GPIO descriptors
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Stefan Agner <stefan@agner.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 9, 2019 at 5:33 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> On 06.12.2019 14:43, Linus Walleij wrote:
> > On Fri, Dec 6, 2019 at 12:43 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >
> >> arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts: invert RESET
> >> gpio polarity (to ACTIVE_LOW), not sure about INTN gpio
> > AFAICT INTN should be set to ACTIVE_HIGH if it is working with the
> > current code in the kernel.
> >
> > However it is pretty confusing with the "N" at the end of INTN,
> > indicating negative polarity. Maybe it means something else,
> > I haven't checked the datasheet. Maybe all boards have inverters
> > on these lines so they come out active high.
>
> Well, this line is indeed active low. The datasheet names it 'int_n'.
> However I think it makes sense to keep it as ACTIVE_HIGH, because the
> 'n' is already in the gpio name (and dt binding). In contrary, the reset
> gpio pin/binding is named without the 'n', thus I want to clarify it as
> active low. The datasheet names it 'reset_n'.

Agreed.

> If you are okay with this approach, I will send a patchset fixing
> polarity in DTS together with your patch converting the driver to gpio
> descriptors with the fixup for the reset gpio polarity.

Yes this approach should work, will you fold in fixes to my
patch (like asserting reset high) as well or do you want me
to send a v2?

Yours,
Linus Walleij
