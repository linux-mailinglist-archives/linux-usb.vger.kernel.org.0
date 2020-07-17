Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47115223E15
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 16:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgGQOdm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 10:33:42 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38181 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726079AbgGQOdm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jul 2020 10:33:42 -0400
Received: (qmail 1149545 invoked by uid 1000); 17 Jul 2020 10:33:41 -0400
Date:   Fri, 17 Jul 2020 10:33:41 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 2/2 v2] usb: ohci-omap: Convert to use GPIO descriptors
Message-ID: <20200717143341.GB1147780@rowland.harvard.edu>
References: <20200716123433.155854-1-linus.walleij@linaro.org>
 <20200716123433.155854-2-linus.walleij@linaro.org>
 <20200716154113.GD1112537@rowland.harvard.edu>
 <CACRpkdZmDUH6QEoykD2mnf6689BVf4VMA4tzpb_xzS3zU6BLuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZmDUH6QEoykD2mnf6689BVf4VMA4tzpb_xzS3zU6BLuw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 17, 2020 at 03:49:19PM +0200, Linus Walleij wrote:
> On Thu, Jul 16, 2020 at 5:41 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > On Thu, Jul 16, 2020 at 02:34:33PM +0200, Linus Walleij wrote:
> > > The OMAP1 OHCI driver is using the legacy GPIO API to grab some
> > > random GPIO lines. One is from the TPS65010 chip and used for
> > > power, another one is for overcurrent and while the driver picks
> > > this line it doesn't watch it at all.
> >
> > If the driver doesn't use this GPIO, why keep the code to grab it?
> 
> I think it gives a hint to someone who later tries to debug
> problems with the hardware that they should maybe go and
> complete this overcurrent feature.

Okay, but in that case a nice comment would better serve the purpose.

> Keeping with the paradigm that a patch should be one technological
> step (converting to GPIO descriptors) that should be a
> third patch (retireing dead code). But I can certainly add a
> patch like that if required.

For example, you could insert a patch before this one to remove the 
unused references and replace them with a comment.

> > > Convert the driver and the OMAP1 OSK board file to pass these
> > > two GPIOs as machine descrived GPIO descriptors.
> > -----------------------------^
> 
> Oooups.
> 
> > > Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > > Cc: Tony Lindgren <tony@atomide.com>
> > > Cc: Alan Stern <stern@rowland.harvard.edu>
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > ---
> >
> > Aside from this I don't have any objections.
> 
> Does that qualify as an ACK or do you still want me to remove
> the overcurrent template code?

A little dead code with no explanation doesn't bother me very much, 
although it will seem rather odd to anyone who reads the driver 
carefully.  Mainly I wanted to bring this matter to your attention and 
leave it up to your own taste as to how you should proceed.

If you want to resubmit this patch as is (with just the typo fixed), you 
can add my Acked-by.

Alan Stern
