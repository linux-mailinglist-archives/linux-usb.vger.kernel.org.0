Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800BC23CE0A
	for <lists+linux-usb@lfdr.de>; Wed,  5 Aug 2020 20:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbgHESHp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Aug 2020 14:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbgHESEx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Aug 2020 14:04:53 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37ACEC06174A
        for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2020 11:04:53 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id c16so27003774ejx.12
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2020 11:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nc9vJA6myb62unlGN7UoK88nXP6N8C+u+l4m/0lQXFY=;
        b=L1YCFtyVpWMtxXJU/OHjYrajL6eajmDKzphedMTEX8wyLUFMLiUYMieujArxssOHM8
         y/fgX7egt54vpb3PejZYUILdPq/mkG92wOaF+X4++VWT0Xm57eQk1QX4eS40xtzA2p40
         7/aU71kGsWh+yxMrV4kfbXOR/DT+zrEUe+JExmUvkNURVjPDvTqeSn0BEQd0SLYRTA0W
         uMEkAcdmyXlR9qolZ45L1YqAFX7JrlrIEhUOppSSTYMgNKHDDn0fFrpIEgqwsNe8Dys9
         /aqCeaMwqUBEBwdyowygi7rpGWS7eO2OOjX1/DHLClPUHqZ0PD9rcYNthkQaX9L4XCCe
         ThpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nc9vJA6myb62unlGN7UoK88nXP6N8C+u+l4m/0lQXFY=;
        b=mDQFHXeWextNZed9xUUXaq2CV5SCChD6yBHPU9yj6nVKtBoT9y/opeHOfEpnQ9/Ofl
         PaWechBVCSuHlsNLNsbnmxowekGvQBXAx49NH5IvZJ/NCrYJO5ftH69fQI9G3HIHwwmV
         gJfXY0MmP+kcmghNlm63jAHePP2d5UfcDbZMut6536qUOVmQWspgMiFTu3GC871kWZvr
         PT+/1lv1aIj8wQWQET0PAi2vJyc+xw5DxKBG8e4nJLDDWVjR1g1Gf0irpw/B2TI73aA9
         CyxJ4SwYk04tzyKbKBhPsLUWTC4RxfviRBH/4WnYErEAsXp4IdLZtSCuZUXoTPd5ypcU
         Qupg==
X-Gm-Message-State: AOAM530dMiwy7xGQn/mH1d9CkkUn5pikrK6qYvsOAXEbQ4DbRemq0IdA
        PYqkqf3WDYvIS9Z6VJ3Zzzj5mHfjL5taaVt+res2eI8uE/g=
X-Google-Smtp-Source: ABdhPJwZf/G7ozuHuoJuO2NExLDigMdAgWfEysJRdzuycHApA+JOsD/Y/Lv1WP5ezdb6lPoaKW8ZqFskXA5l71un+ew=
X-Received: by 2002:a17:906:6408:: with SMTP id d8mr425103ejm.345.1596650691848;
 Wed, 05 Aug 2020 11:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200805075810.604063-1-lorenzo@google.com> <87mu39tmu6.fsf@kernel.org>
 <CAKD1Yr17hFju=xvDHWWcLjwj=nuSBBVJn9xQ5ocHHXQm6PAw_A@mail.gmail.com>
In-Reply-To: <CAKD1Yr17hFju=xvDHWWcLjwj=nuSBBVJn9xQ5ocHHXQm6PAw_A@mail.gmail.com>
From:   =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Date:   Wed, 5 Aug 2020 11:04:40 -0700
Message-ID: <CAHo-Ooyk_uqciWJ=2L+OwM+DBfPCRKLQz6-5SCxKSRTV8-FCHA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: allow using NCM in SuperSpeed Plus gadgets.
To:     Lorenzo Colitti <lorenzo@google.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB3.0 / USB3.1 gen1 / USB3.2 gen 1x1 / 5gbps overhead is upwards of
20% (8b10b coding is 80% efficient).

USB3.1 gen2 / USB3.2 gen 2x1 / 10gbps overhead is upwards of 3%
(128b132b coding is nearly 97% efficient).

however:
USB3.2 gen 1x2 / 10gbps overhead is again 20% (since this is 8b10b on
two 5gbps links on one cable)

USB3.2 gen 2x2 / 20gbps overhead is again 3% (since this is 128b132b
on two 10gbps links on one cable)

On top of that you need to layer usb protocol overhead (the above is
just link layer overhead).

AFAICT for optimal xfer you need to transfer in 16KiB chunks, which
get split into 16 1KiB pieces,
each piece has overhead, plus there's a begin packet and final ack
packet (ie. 18 packets total).
I'm not entirely sure what the overhead is here, but my estimate:
16384 / (32 + 16*(32 + 1024) + 32)
puts it at another 3.5% loss on top of the previous L1 overhead (ie.
multiplicative).

[Note: I'm not entirely sure if the first and final 32 are correct,
but I'm pretty sure it's at least this much,
if anything stuff is worse due to some unavoidable delays between data
reception and ack, the upstream direction to host is even worse, since
host asks for data, device provides it, host acks it, thus there's 2
data direction flip delays]

This means:
  5 gbps -> 5*8/10*0.965 = 3.86 gbps (USB 3.0 / USB3.1 gen1 / USB3.2 gen 1x1)
  10 gbps -> 10*128/132*0.965 = 9.35 gbps (this is USB3.1 gen2 / USB3.2 gen 2x1)
  10 gbps -> 10*8/10*0.965 = 7.72 gbps (this is dual link USB3.2 gen 1x2)
  20 gbps -> 20*128/132*0.965 = 18.72 gbps (this is dual link USB3.2 gen 2x2)

At least I'm pretty sure you physically can't go faster, though there
might still be extra overhead I missed (which would make it even
slower).
(in particular the dual link cases seem to duplicate some control
stuff across both cables, so overhead is probably a tad higher)


> > > +     /* the following 2 values can be tweaked if necessary */
> > > +     /* .bMaxBurst =         0, */
> >
> > should you add bMaxBurst = 15 here?
>
> I'm not sure. On my setup, it provides a fair performance boost (goes
> from ~1.7Gbps to ~2.3Gbps in, and ~620Mbps to ~720Mbps out). But I
> don't know whether there might be any compatibility constraints or
> hardware dependencies. I do see that the f_mass_storage driver sets it
> to 15:
>
>          /* Calculate bMaxBurst, we know packet size is 1024 */
>         max_burst = min_t(unsigned, FSG_BUFLEN / 1024, 15);
>
> so perhaps this is fine to do in NCM too? If we want to set bMaxBurst
> to 15, should that be in this patch, or in a separate patch?

I think we should.  I would imagine this is the 16*1024 I reference up above.
Though it should probably be bumped in a different commit.
