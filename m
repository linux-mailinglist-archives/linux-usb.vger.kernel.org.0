Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF9D3337DD
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 09:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhCJIxf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 03:53:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:57472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230046AbhCJIxe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Mar 2021 03:53:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EF8764FEE;
        Wed, 10 Mar 2021 08:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615366413;
        bh=XSIP0JBxrEy8EpYGJ2qrv3DgLidlR++YIRRybjiF1T4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lNxlva5OwoG23E9y6AD85yPeU9310a8gMbqNzar/yeh4a+7szd/9m6NabGmUUYgDH
         xEsfqY9VhzRkoGd+YBXs+I5L/WWmUQDe6EC2/we8oVPfh9uBhw8McttBi2DF8t2VDp
         f7aVW3bqac0KJXVg/Hz0n0DIsxjYQz/LJ35zE3xk=
Date:   Wed, 10 Mar 2021 09:53:31 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Christian Kellner <christian@kellner.me>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@google.com>,
        Diego Rivas <diegorivas@google.com>
Subject: Re: [PATCH 3/3] thunderbolt: Expose more details about USB 3.x and
 DisplayPort tunnels
Message-ID: <YEiJC/oZ2ZasVtvf@kroah.com>
References: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
 <20210309134818.63118-4-mika.westerberg@linux.intel.com>
 <YEeBt+fHt1MdyEBz@kroah.com>
 <20210310075444.GB2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310075444.GB2542@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 10, 2021 at 09:54:44AM +0200, Mika Westerberg wrote:
> > > +static void tb_add_tunnel(struct tb *tb, struct tb_tunnel *tunnel)
> > > +{
> > > +	struct tb_switch *sw = tunnel->dst_port->sw;
> > > +	struct tb_cm *tcm = tb_priv(tb);
> > > +
> > > +	if (tb_tunnel_is_usb3(tunnel)) {
> > > +		sw->usb3++;
> > > +	} else if (tb_tunnel_is_dp(tunnel)) {
> > > +		sw->dp++;
> > > +		/* Inform userspace about DP tunneling change */
> > > +		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
> > 
> > What really "changed" here about this device that userspace now needs to
> > know about it?
> 
> DisplayPort tunnel came up, so the "dp" attribute value changed.
> 
> I'm not entirely sure we need to notify the userspace from changes like
> these, though. We do this when PCIe tunnel comes up already so this kind
> of follows that (and USB 3.x tunnel is always created at the same time
> the device itself is announced so does not require any change event).
> 
> > > +	}
> > > +
> > > +	list_add_tail(&tunnel->list, &tcm->tunnel_list);
> > > +}
> > > +
> > > +static void tb_remove_tunnel(struct tb_tunnel *tunnel)
> > > +{
> > > +	struct tb_switch *sw = tunnel->dst_port->sw;
> > > +
> > > +	if (tb_tunnel_is_usb3(tunnel) && sw->usb3) {
> > > +		sw->usb3--;
> > > +	} else if (tb_tunnel_is_dp(tunnel) && sw->dp) {
> > > +		sw->dp--;
> > > +		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
> > 
> > Same here, what causes tunnels to be added or removed?
> 
> Here the opposite, a DisplayPort tunnel was torn down so the "dp"
> attribute changed.

Did just the value in the attribute change, or did the visability of
attributes change?

And if it is just the value, who is going to care about this value?  Is
userspace going to want to know this type of change?  What causes this
to change in the first place (physical event?  Virtual event?  Something
else?)

thanks,

greg k-h
