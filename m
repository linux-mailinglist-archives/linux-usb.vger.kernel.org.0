Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71D291B462D
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 15:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgDVNZk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 09:25:40 -0400
Received: from mga06.intel.com ([134.134.136.31]:52936 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbgDVNZj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Apr 2020 09:25:39 -0400
IronPort-SDR: BZTOr5yHO6xFxIvmyoUUamZUma9RjicwZw1uqHK5s6cWYRiMRZYIPIKBMGJ+lshTxr2/3fTzTg
 l3zfF4De3vcQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 06:25:36 -0700
IronPort-SDR: 5XwFaHAwWBlz44Bg71dCR324era1xaQ63FmncVqiRy/B1JLy4DqD237M6Cg9uQyMN7gPhZAemr
 6UCEAIgP+AnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; 
   d="scan'208";a="365675280"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 22 Apr 2020 06:25:34 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 22 Apr 2020 16:25:33 +0300
Date:   Wed, 22 Apr 2020 16:25:33 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Adding tps65986 to your tps6598x driver
Message-ID: <20200422132533.GC618654@kuha.fi.intel.com>
References: <d4a9214a-7a55-72ea-75b9-8388bc39d0dd@linaro.org>
 <20200414151505.GK2828150@kuha.fi.intel.com>
 <d64d7b21-4f03-05e8-e0db-aa8c75ba847e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d64d7b21-4f03-05e8-e0db-aa8c75ba847e@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+linux-usb ml

On Wed, Apr 22, 2020 at 12:17:14PM +0100, Bryan O'Donoghue wrote:
> On 14/04/2020 16:15, Heikki Krogerus wrote:
> > Hi Bryan,
> > 
> > On Tue, Apr 14, 2020 at 03:42:24PM +0100, Bryan O'Donoghue wrote:
> > > Hi Heikki.
> > > 
> > > I'm Bryan working with Linaro on a Qualcomm project.
> > > 
> > > We have a tps65986, which needs some upstreaming work.
> > > 
> > > http://www.ti.com/lit/gpn/tps65982
> > > http://www.ti.com/lit/gpn/tps65986
> > > 
> > > As you can see the two parts are very similar except the 65986 does data
> > > role switching but unlike the 65982 doesn't support 20v 5a power.
> > > 
> > > I was going to add
> > > 
> > > - OF probe support
> > > - USB role switching support
> > 
> > By USB role switching you mean the USB role switch class, right?
> > 
> > > to your existing driver. Do you know of anybody who has done any work for
> > > the tps65986 already ? Also does the above extension seem right/sensible to
> > > you ?
> > 
> > There isn't anybody adding support for tps65986 to the driver that I
> > know of, so please go for it. Both tasks make sense to me.
> > 
> > thanks,
> > 
> 
> What about tcpm ?

What about it?

> As I understand it for your platform, you just want the power controller
> stuff in the chip, without the data role.

Role swapping is actually the only thing that we need the driver for
on our platforms.

> In my case - we have a point-of-sale terminal, which basically looks like a
> phone - we want to be able to do data role switching.
> 
> What's your feeling. Add role switch into the driver you have here, or try
> to get that driver working with tcpm ?

So what you are proposing here is that you want to use tps65986 as
just a port controller (so PHY), right? I don't think that's possible.

TCPM (port manager) is the software that implements the USB Type-C and
PD state machines. The USB PD controllers are running their own state
machines, and the thing is that you can't turn off that part of them.
So basically the USB PD controllers are supplying the TCPM
functionality internally.

> Something else ? It's important we get the changes upstream, so I'd
> appreciate any thoughts you have on the right way to go about this.

So what exactly is the problem here?

Which USB controller are you using? Is it dual-role capable, or do you
have separate xHCI controller and separate USB device controller plus
a mux between them?

Is it clear to you that the Type-C driver, so tps6598x.c in this case,
is the consumer of the USB role switch? If you have a dual-role
capable USB controller, then that will be the supplier of the switch.
If you have separate USB host and devices IPs on your board, then the
mux between them is the switch supplier.

I'm attaching a diff that has all the changes that you should need to
do to the tps6598x.c in order to get the role swapping working on your
board.

The next step is to figure out how to describe the connection between
your USB role switch (which I'm guessing is the USB controller on your
board) and the USB PD controller. You are using devicetree, right?

> Could you recommend an Intel platform I could pick up to validate my changes
> don't break existing code ?

All -S variants of our SOCs can be used for testing the tps6598x.c,
for example Coffee Lake -S, but unfortunately I don't know which
products on the market actually use those SOCs. I do my development
with the reference boards.


thanks,

-- 
heikki
