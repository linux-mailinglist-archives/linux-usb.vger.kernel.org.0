Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 298553338DE
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 10:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbhCJJe5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 04:34:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:60354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232621AbhCJJem (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Mar 2021 04:34:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 052A764FCE;
        Wed, 10 Mar 2021 09:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615368881;
        bh=mpbTB48CIQXfjTumhHcvTm4imCdeUjZNWJafn+g+h2M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jCBwQc5cmNrMC26mhp+PvWElrpXZzxGkOvJ0dX4I6bMz9vT8HSUoGrkQlbmKnGX41
         j3TbgKooI4xl0ACrvobYPfOnN5I1qyP7I6fBA5FuYIQkgcB5jG9ssku4W1ZZmymVRU
         7vlzZexIdGe6nfJbV07k+gnZdDFVQnVtkO5gsTHU=
Date:   Wed, 10 Mar 2021 10:34:38 +0100
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
Message-ID: <YEiSrgziexV4SNdf@kroah.com>
References: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
 <20210309134818.63118-4-mika.westerberg@linux.intel.com>
 <YEeBt+fHt1MdyEBz@kroah.com>
 <20210310075444.GB2542@lahna.fi.intel.com>
 <YEiJC/oZ2ZasVtvf@kroah.com>
 <20210310092155.GC2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310092155.GC2542@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 10, 2021 at 11:21:55AM +0200, Mika Westerberg wrote:
> Hi,
> 
> On Wed, Mar 10, 2021 at 09:53:31AM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Mar 10, 2021 at 09:54:44AM +0200, Mika Westerberg wrote:
> > > > > +static void tb_add_tunnel(struct tb *tb, struct tb_tunnel *tunnel)
> > > > > +{
> > > > > +	struct tb_switch *sw = tunnel->dst_port->sw;
> > > > > +	struct tb_cm *tcm = tb_priv(tb);
> > > > > +
> > > > > +	if (tb_tunnel_is_usb3(tunnel)) {
> > > > > +		sw->usb3++;
> > > > > +	} else if (tb_tunnel_is_dp(tunnel)) {
> > > > > +		sw->dp++;
> > > > > +		/* Inform userspace about DP tunneling change */
> > > > > +		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
> > > > 
> > > > What really "changed" here about this device that userspace now needs to
> > > > know about it?
> > > 
> > > DisplayPort tunnel came up, so the "dp" attribute value changed.
> > > 
> > > I'm not entirely sure we need to notify the userspace from changes like
> > > these, though. We do this when PCIe tunnel comes up already so this kind
> > > of follows that (and USB 3.x tunnel is always created at the same time
> > > the device itself is announced so does not require any change event).
> > > 
> > > > > +	}
> > > > > +
> > > > > +	list_add_tail(&tunnel->list, &tcm->tunnel_list);
> > > > > +}
> > > > > +
> > > > > +static void tb_remove_tunnel(struct tb_tunnel *tunnel)
> > > > > +{
> > > > > +	struct tb_switch *sw = tunnel->dst_port->sw;
> > > > > +
> > > > > +	if (tb_tunnel_is_usb3(tunnel) && sw->usb3) {
> > > > > +		sw->usb3--;
> > > > > +	} else if (tb_tunnel_is_dp(tunnel) && sw->dp) {
> > > > > +		sw->dp--;
> > > > > +		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
> > > > 
> > > > Same here, what causes tunnels to be added or removed?
> > > 
> > > Here the opposite, a DisplayPort tunnel was torn down so the "dp"
> > > attribute changed.
> > 
> > Did just the value in the attribute change, or did the visability of
> > attributes change?
> 
> The value changes.
> 
> > And if it is just the value, who is going to care about this value?  Is
> > userspace going to want to know this type of change?  What causes this
> > to change in the first place (physical event?  Virtual event?  Something
> > else?)
> 
> It is physical event. Typically this happens when user plugs a monitor
> to a Thunderbolt dock, or plugs it out. This value changes accordingly.

So are there other events that show up to userspace when this happens?
Like devices added/removed?  If so, then sending a kobject change event
here doesn't make much sense as userspace can go re-read this based on
the fact that other things changed.

> The caring part is the userspace application, I think bolt in case of
> non-ChromeOS distro and the ChromeOS equivalent but I'm not sure if this
> is something they find useful or not. That's why I have Cc'd (hopefully
> all) the people who work with the userspace side :)

What userspace apps read this file today in any Linux distro?

thanks,

greg k-h
