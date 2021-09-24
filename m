Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 852F8417651
	for <lists+linux-usb@lfdr.de>; Fri, 24 Sep 2021 15:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346371AbhIXN5C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Sep 2021 09:57:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:13419 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233156AbhIXN5C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Sep 2021 09:57:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="224105805"
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; 
   d="scan'208";a="224105805"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2021 06:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; 
   d="scan'208";a="614507067"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 24 Sep 2021 06:55:18 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 24 Sep 2021 16:55:17 +0300
Date:   Fri, 24 Sep 2021 16:55:17 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ulrich Huber <ulrich@huberulrich.de>
Cc:     Benjamin Berg <bberg@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/7] usb: typec: ucsi: Driver improvements
Message-ID: <YU3YxXkjYNQx2Mlh@kuha.fi.intel.com>
References: <20210920142419.54493-1-heikki.krogerus@linux.intel.com>
 <52591c12693733a3caf11d2bb5999acdfe177054.camel@redhat.com>
 <401db7b6-1ee2-d585-f76f-bdd4577224c2@huberulrich.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <401db7b6-1ee2-d585-f76f-bdd4577224c2@huberulrich.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 23, 2021 at 06:06:21PM +0200, Ulrich Huber wrote:
> Hi,
> 
> Am 23.09.21 um 16:38 schrieb Benjamin Berg:
> > Hi,
> > 
> > On Mon, 2021-09-20 at 17:24 +0300, Heikki Krogerus wrote:
> > > The goal of this series was to improve the alt mode handling in the
> > > driver, but now it seems that we can use the "poll worker" that was
> > > introduced for that to handle other tasks better as well.
> > > 
> > > Ulrich reported some problems that are caused by the second
> > > GET_CONNECTOR_STATUS right after the first one that was introduced in
> > > 217504a05532 ("usb: typec: ucsi: Work around PPM losing change
> > > information"). In the last patch I try to improve that workaround by
> > > extracting it out of the generic event handler into its own task and
> > > executing it only when it's really needed. That seems to improve the
> > > situation.
> > > 
> > > These patches definitely improve the quality of the driver by making
> > > it a bit more readable, but they also appear to make the behaviour a
> > > bit more predictably and uniform on different platforms.
> > > 
> > > Benjamin, can you test these?
> > I just gave this a spin on a X1 Carbon Gen 8 with a Lenovo TB 3 Dock.
> > Unfortunately, I can still reproduce the issue occasionally. My take is
> > that the rate is much lower than it was before my patch was introduced.
> > However, unfortunately the patchset does appear to cause a regression
> > on the machine I tested.
> > 
> > As before. The "online" status of the UCSI power supply is reported as
> > "1" occasionally even after the cable was unplugged. And the issue
> > seems to only happens with a dock, not if I use a USB-C charger.
> > 
> > Benjamin
> 
> From my point of view the patch set is still a huge improvement to the
> current state of the driver. Before it, the status of the UCSI power supply
> was unpredictable when using an USB-C charger with my Lenovo Yoga 9i.

This is the problem with these workarounds that attempt to fix
firmware issues. It's difficult to find a solution that works on every
board. That's why it's important to attempt to isolate them, and use
them only when needed.

Right now the driver does behave quite unpredictable on several boards
because of commit 217504a05532. The way that it solves a single issue
is not isolated enough like it should be, which means every single
connector change event is affected by it even when there is no need
for that, but the solution itself - duplicated command execution - is
also simply too heavy for many EC firmwares.

I do admit that my series still leaves problems, it does not solve
everything, and I'm not claiming that it's actually fixing anything
(it's not tagged as a fix), but it does improve the behaviour of the
driver so much that I still think that we should use it as the new
"baseline" for future improvements.

> I do still get error messages in the kernel log right after waking from
> suspend occasionally, but I have not yet found reproducible steps. Most
> likely it has something to do with the controller being in an invalid state
> after waking from suspension. Though even then the status of the UCSI power
> supply is correct when this happens.

This is most likely separate issue that needs its own fix.


thanks,

-- 
heikki
