Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5C9D3D85
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 12:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfJKKhi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 06:37:38 -0400
Received: from mga09.intel.com ([134.134.136.24]:9824 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726290AbfJKKhi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Oct 2019 06:37:38 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Oct 2019 03:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,283,1566889200"; 
   d="scan'208";a="207403019"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 11 Oct 2019 03:37:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 11 Oct 2019 13:37:34 +0300
Date:   Fri, 11 Oct 2019 13:37:34 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 00/14] usb: typec: UCSI driver overhaul
Message-ID: <20191011103734.GA32191@kuha.fi.intel.com>
References: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
 <BYAPR12MB2727E1FE3CDFC5D6DD87CF73DC9D0@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191003142443.GC1048@kuha.fi.intel.com>
 <BYAPR12MB2727465972DCB1E7ECBE41CCDC9F0@BYAPR12MB2727.namprd12.prod.outlook.com>
 <BYAPR12MB272782B958FE929E9DE2EBAADC940@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR12MB272782B958FE929E9DE2EBAADC940@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Oct 10, 2019 at 05:51:23PM +0000, Ajay Gupta wrote:
> Hi Heikki,
> 
> > > > > Hi Ajay,
> > > > >
> > > > > Here's the pretty much complete rewrite of the I/O handling that I
> > > > > was talking about. The first seven patches are not actually
> > > > > related to this stuff, but I'm including them here because the
> > > > > rest of the series is made on top of them. I'm including also that
> > > > > fix patch I send you earlier.
> > > > >
> > > > > After this it should be easier to handle quirks. My idea how to
> > > > > handle the multi-instance connector alt modes is that we "emulate"
> > > > > the PPM in ucsi_ccg.c in order to handle them, so ucsi.c is not
> > > > > touched at
> > > all.
> > > > >
> > > > > We can now get the connector alternate modes that the actual
> > > > > controller supplies during probe - before registering the ucsi
> > > > > interface
> > > > How can ucsi_ccg.c get the connector alternate modes before
> > > > registering ucsi interface? PPM reset, notification enable, etc.
> > > > is done during ucsi registration. UCSI spec says:
> > > > " The only commands the PPM is required to process in the "PPM Idle
> > > > (Notifications Disabled)" state are SET_NOTIFICATION_ENABLE and
> > > > PPM_RESE"
> > > >
> > > > Also, it doesn't look correct if ucsi_ccg.c has to replicate most of
> > > > the stuff done in ucsi_init() of ucsi.c.
> > >
> > > How about if we split ucsi_init() into a function that first simply
> > > constructs the struct ucsi and struct ucsi_connector instances without
> > > registering anything, and into separate functions that then register
> > > the ports, altmodes and what have you. I don't think that should be a
> > > huge problem. It will make ucsi.c even more like a library, which is probable
> > a good thing.
> > Do you mean the solution to follow steps (a->b->c->d1) or (a->b->c->d2) ?
> > a) ucsi_ccg.c calls first part of split ucsi_init()
> > b) ucsi_ccg.c uses ucsi_send_command() to collect actual alternate modes.
> > c) ucsi_ccg.c looks into actual alternate modes and squashes if duplicate
> > altmode found.
> > d1) ucsi_ccg.c calls new method to register connector alternate modes.
> > This method issues GET_ALTERNATE_MODES command again and ucsi_ccg.c is
> > expected to send squashed alternate mode.  This will require changes in
> > .read(), .sync_write() and
> > .async_write() to make it appear as if the squashed data coming from the ppm.
> > OR
> > d2) ucsi_ccg.c calls new method to register squashed connector alternate
> > modes.
> > This method doesn't issue GET_ALTERNATE_MODES commands to PPM but
> > simply registers the alternate mode values passed to this function.
> > 
> > If you mean the (a->b->c->d2) solution then it looks fine to me and would wait
> > for patches from you. This solution would mean that GET_ALTERNATE_MODES
> > for connector is done only by each ucsi_xxx.c and not by ucsi.c
> 
> I am waiting for your comments on this.

Sorry Ajay. I lost track of this thread.

The above is not exactly what I had in mind, but something like that.
But in any case, I'll start wringing the patches then.


thanks,

-- 
heikki
