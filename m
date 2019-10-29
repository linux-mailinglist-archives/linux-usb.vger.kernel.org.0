Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C20CE8EF1
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2019 19:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfJ2SGM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 14:06:12 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43304 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbfJ2SGM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Oct 2019 14:06:12 -0400
Received: by mail-ot1-f68.google.com with SMTP id b19so8226470otq.10
        for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2019 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ZM8b8P5vjBRG5CkLodYhOC8TCweRQM0qzTpoxN9u0U=;
        b=x2EU7r5Br0MF1JCHsI77zCy2zedlNT+l4iJofUX5n+L01xGEzh4m8fmznuqOmO56+q
         rOrscGIMjfMhlnBraN0m7qu2PgepmKG/8I9RxnAKdbYGXjCS/AbWNv6O7x8oiopG2r2Q
         AhQ/jUTnwPV/LDGubLHR5dkyVKKi96839QjCdjhTJqxzQNRQo+JknZLE875VW2N2sYoR
         Sgp4Wu+5W+ROonmbAlirQrvylF4DvQxB/K86kdH+tGZEKyZIdaheV6zT3GjCx6oXY+pm
         d41vB4X+cAGwMmduJZvfVwYFaTMokyDWOA9OBSA+g+DI9IGA7jc05FG5hHnsJRAMhWwZ
         7N1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ZM8b8P5vjBRG5CkLodYhOC8TCweRQM0qzTpoxN9u0U=;
        b=cK83TxTqcxHVkb4c7vZZH8Nvasit2eEMyRfnysOnhe9rjfn7+kCChHAwG6NI1r0JXs
         X4Ao77+8Jw4SrG6AkJQ/plI9lXhgM0P3S7CfQPzuRw8Z1htwBS82ahZCRIwfzVyfYuZq
         3Twv4rgk7BWml1pIT8KY6xlOt44iEaPVAlYyBaP1KU0sIn0HjTRCxZxc7Z8x9gT/Hs0f
         WUHcs+WYQB7QS5z/js5vlUyB66a9HRE4zaKtF7+sZ2uYqlMpyc3NkdxNsAAtgGaDZF1z
         cZkSYszNyGAwNIG667khPoAvuJfj1XmYIaUuKZT0cpoEUSBq4eIL6ffncKkw8MTpu5DZ
         zOfg==
X-Gm-Message-State: APjAAAXRmto8jdIzoGHW65OjaViNuL4AefcsBxMRdlgYT+e1OXQyaHx1
        XiiqDNNYcl8xux7nQl3MhlryoJkwI15co+rpzjobXQ==
X-Google-Smtp-Source: APXvYqyCbgeKJ2gPPdono1faBX2ScPsARbeE44f3H+kcetlHhwurbl3SHIfKcAZHqerS7OznYb8roY5f9wjnw+RQpLU=
X-Received: by 2002:a9d:6ad0:: with SMTP id m16mr1327974otq.352.1572372370800;
 Tue, 29 Oct 2019 11:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191028215919.83697-1-john.stultz@linaro.org>
 <20191028215919.83697-7-john.stultz@linaro.org> <87h83rj4ha.fsf@gmail.com>
In-Reply-To: <87h83rj4ha.fsf@gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 29 Oct 2019 11:05:59 -0700
Message-ID: <CALAqxLX47uELsGbdociUKdC6KgDba-1SBVALmgjD3=jxh=fd8g@mail.gmail.com>
Subject: Re: [PATCH v4 6/9] usb: dwc3: Rework resets initialization to be more flexible
To:     Felipe Balbi <balbi@kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 29, 2019 at 2:17 AM Felipe Balbi <balbi@kernel.org> wrote:
> John Stultz <john.stultz@linaro.org> writes:
> > The dwc3 core binding specifies one reset.
> >
> > However some variants of the hardware my not have more.
>                                         ^^
>                                         may
>
> According to synopsys databook, there's a single *input* reset signal on
> this IP. What is this extra reset you have?
>
> Is this, perhaps, specific to your glue layer around the synopsys ip?

Likely (again, I unfortunately don't have a ton of detail on the hardware).

> Should, perhaps, your extra reset be managed by the glue layer?

So yes the dwc3-of-simple does much of this already (it handles
multiple resets, and variable clocks), but unfortunately we seem to
need new bindings for each device added?  I think the suggestion from
Rob was due to the sprawl of bindings for the glue code, and the extra
complexity of the parent node.  So I believe Rob just thought it made
sense to collapse this down into the core?

I'm not really passionate about either approach, and am happy to
rework (as long as there is eventual progress :).
Just let me know what you'd prefer.

thanks
-john
