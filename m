Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBEC121FD
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2019 20:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbfEBSgW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 May 2019 14:36:22 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38125 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbfEBSgV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 May 2019 14:36:21 -0400
Received: by mail-vs1-f65.google.com with SMTP id v141so1997716vsc.5
        for <linux-usb@vger.kernel.org>; Thu, 02 May 2019 11:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rep+RFn3BdJQf0oo+RGjYfMB+zeAYnLgZKuY9nUKCQA=;
        b=k4niFnqgC6uT+WkOQ6wgsJcYaNgMLnTL7lVhPfpNfF/fWu3Z/FxIjhBpaj3wtHigDP
         oknx0uZtfuzo6ralUpJB0Vr5FJRCJ1w1O59dD+RG6do4ZDLCDZyWqsCtlvlAScWcCJFJ
         NlsBZybNdO639hEBLlKY4YqWfytlkksQKfBpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rep+RFn3BdJQf0oo+RGjYfMB+zeAYnLgZKuY9nUKCQA=;
        b=rHQtUYi/LA59qgWhtriMbmGzYu71ccz9lGr9lvabiO66cAsbP8rxJo285LOdeMb5yy
         IvMKCg8/p3NGelsZBdR0uFj7+A0PjJs/QMWtCwhDFPV0yYzZRpGPpmXoXnyj4EhGLDfo
         4r73L9pCaCg5OLBwMcQQAMyi1/g+EXNUuhOE/hUfU8BiAdVgUheKX+5X/Irr3YkS6SoJ
         W7Nk6rYKjMczRabchUuIdc07uIMuauLAq4Y7QLC8pxVVVRytBJ4LmFFVCF0QBXbspuyO
         6IlZxt5deQ+/n9dnZ92mKdxmf4IUmzmckcjtruWvoMuk/iWKhNOYHJ/jr/0zkhMDVpMn
         qccw==
X-Gm-Message-State: APjAAAVkf/YJrOYOYM3UTP5p5gU7srW6WSeEOEC1YI7ShEjgcWnhSSxS
        XxmbaSwLZh+dg8Du7qUwYt+rCmWiwQI=
X-Google-Smtp-Source: APXvYqw0GZf2tWMFyqODfFcCwjsbNyx/RRlCN0ERGT3v/vhPzvKfwV5xY9mR4V0gkPazLxezKu/Vqw==
X-Received: by 2002:a67:bd01:: with SMTP id y1mr2775597vsq.167.1556822180776;
        Thu, 02 May 2019 11:36:20 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id r21sm7836177uao.12.2019.05.02.11.36.15
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 11:36:16 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id e2so1985428vsc.13
        for <linux-usb@vger.kernel.org>; Thu, 02 May 2019 11:36:15 -0700 (PDT)
X-Received: by 2002:a67:7cd1:: with SMTP id x200mr3103185vsc.144.1556822175074;
 Thu, 02 May 2019 11:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190418001356.124334-1-dianders@chromium.org>
 <20190418001356.124334-4-dianders@chromium.org> <87pnpas1fx.fsf@linux.intel.com>
In-Reply-To: <87pnpas1fx.fsf@linux.intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 May 2019 11:36:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTBgKnnswhfoQH3qWjpbp831e1L1+j+QCjxx2h=aQoog@mail.gmail.com>
Message-ID: <CAD=FV=XTBgKnnswhfoQH3qWjpbp831e1L1+j+QCjxx2h=aQoog@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] Documentation: dt-bindings: Add
 snps,need-phy-for-wake for dwc2 USB
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Alexandru M Stan <amstan@chromium.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        William Wu <william.wu@rock-chips.com>,
        linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
        Randy Li <ayaka@soulik.info>, Chris <zyw@rock-chips.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Ryan Case <ryandcase@chromium.org>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Julius Werner <jwerner@chromium.org>,
        Dinh Nguyen <dinguyen@opensource.altera.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Apr 25, 2019 at 5:40 AM Felipe Balbi
<felipe.balbi@linux.intel.com> wrote:
>
> Douglas Anderson <dianders@chromium.org> writes:
>
> > Some SoCs with a dwc2 USB controller may need to keep the PHY on to
> > support remote wakeup.  Allow specifying this as a device tree
> > property.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > For relevant prior discussion on this patch, see:
> >
> > https://lkml.kernel.org/r/1435017144-2971-3-git-send-email-dianders@chromium.org
> >
> > I didn't make any changes from the prior version since I never found
> > out what Rob thought of my previous arguments.  If folks want a
> > change, perhaps they could choose from these options:
> >
> > 1. Assume that all dwc2 hosts would like to keep their PHY on for
> >    suspend if there's a USB wakeup enabled, thus we totally drop this
> >    binding.  This doesn't seem super great to me since I'd bet that
> >    many devices that use dwc2 weren't designed for USB wakeup (they
> >    may not keep enough clocks or rails on) so we might be wasting
> >    power for nothing.
> > 2. Rename this property to "snps,wakeup-from-suspend-with-phy" to make
> >    it more obvious that this property is intended both to document
> >    that wakeup from suspend is possible and that we need the PHY for
> >    said wakeup.
> > 3. Rename this property to "snps,can-wakeup-from-suspend" and assume
> >    it's implicit that if we can wakeup from suspend that we need to
> >    keep the PHY on.  If/when someone shows that a device exists using
> >    dwc2 where we can wakeup from suspend without the PHY they can add
> >    a new property.
> >
> > Changes in v2: None
> >
> >  Documentation/devicetree/bindings/usb/dwc2.txt | 3 +++
> >  1 file changed, 3 insertions(+)
>
> checking file Documentation/devicetree/bindings/usb/dwc2.txt
> Hunk #1 FAILED at 37.
> Hunk #2 succeeded at 52 (offset -1 lines).
> 1 out of 2 hunks FAILED

Can you try applying this and the next two patches again?  ...or let
me know that you'd like me to repost?

Thanks!

-Doug
