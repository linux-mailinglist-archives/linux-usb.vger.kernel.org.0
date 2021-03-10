Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493BA33389F
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 10:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbhCJJW0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 04:22:26 -0500
Received: from mga07.intel.com ([134.134.136.100]:42964 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232548AbhCJJWC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Mar 2021 04:22:02 -0500
IronPort-SDR: 265sXXWQAwZJ49el62XGdVAUufUkRg68btO+b0uMHoLAG/qIBxgXDy2HfOcVmO4gi8u5MOnV2O
 PpLG5G0x4HSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="252442512"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="252442512"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 01:22:02 -0800
IronPort-SDR: tCUi+SQbtddxJ7xwPsP4AZKfXyVWuCfc//BVZy+ohnBfdi70JpmGSxJ2mC8lnvVEo9EHx/SYWi
 oIylEdM8Trew==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="410115992"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 01:21:58 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 10 Mar 2021 11:21:55 +0200
Date:   Wed, 10 Mar 2021 11:21:55 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Message-ID: <20210310092155.GC2542@lahna.fi.intel.com>
References: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
 <20210309134818.63118-4-mika.westerberg@linux.intel.com>
 <YEeBt+fHt1MdyEBz@kroah.com>
 <20210310075444.GB2542@lahna.fi.intel.com>
 <YEiJC/oZ2ZasVtvf@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEiJC/oZ2ZasVtvf@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Mar 10, 2021 at 09:53:31AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Mar 10, 2021 at 09:54:44AM +0200, Mika Westerberg wrote:
> > > > +static void tb_add_tunnel(struct tb *tb, struct tb_tunnel *tunnel)
> > > > +{
> > > > +	struct tb_switch *sw = tunnel->dst_port->sw;
> > > > +	struct tb_cm *tcm = tb_priv(tb);
> > > > +
> > > > +	if (tb_tunnel_is_usb3(tunnel)) {
> > > > +		sw->usb3++;
> > > > +	} else if (tb_tunnel_is_dp(tunnel)) {
> > > > +		sw->dp++;
> > > > +		/* Inform userspace about DP tunneling change */
> > > > +		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
> > > 
> > > What really "changed" here about this device that userspace now needs to
> > > know about it?
> > 
> > DisplayPort tunnel came up, so the "dp" attribute value changed.
> > 
> > I'm not entirely sure we need to notify the userspace from changes like
> > these, though. We do this when PCIe tunnel comes up already so this kind
> > of follows that (and USB 3.x tunnel is always created at the same time
> > the device itself is announced so does not require any change event).
> > 
> > > > +	}
> > > > +
> > > > +	list_add_tail(&tunnel->list, &tcm->tunnel_list);
> > > > +}
> > > > +
> > > > +static void tb_remove_tunnel(struct tb_tunnel *tunnel)
> > > > +{
> > > > +	struct tb_switch *sw = tunnel->dst_port->sw;
> > > > +
> > > > +	if (tb_tunnel_is_usb3(tunnel) && sw->usb3) {
> > > > +		sw->usb3--;
> > > > +	} else if (tb_tunnel_is_dp(tunnel) && sw->dp) {
> > > > +		sw->dp--;
> > > > +		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
> > > 
> > > Same here, what causes tunnels to be added or removed?
> > 
> > Here the opposite, a DisplayPort tunnel was torn down so the "dp"
> > attribute changed.
> 
> Did just the value in the attribute change, or did the visability of
> attributes change?

The value changes.

> And if it is just the value, who is going to care about this value?  Is
> userspace going to want to know this type of change?  What causes this
> to change in the first place (physical event?  Virtual event?  Something
> else?)

It is physical event. Typically this happens when user plugs a monitor
to a Thunderbolt dock, or plugs it out. This value changes accordingly.

The caring part is the userspace application, I think bolt in case of
non-ChromeOS distro and the ChromeOS equivalent but I'm not sure if this
is something they find useful or not. That's why I have Cc'd (hopefully
all) the people who work with the userspace side :)
