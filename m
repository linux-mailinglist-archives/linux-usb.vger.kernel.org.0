Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088F3225AAF
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 11:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbgGTJCi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 05:02:38 -0400
Received: from mga04.intel.com ([192.55.52.120]:45631 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726030AbgGTJCh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jul 2020 05:02:37 -0400
IronPort-SDR: 0YVz9tK/dlwGYQnOvcCfgs9LY3AIPj3cRPCKxMiNDxkwkG9z7PhdBV4hbr9qcwXO4iK1zNmZSv
 QKYU8R0dsHkQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="147375333"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; 
   d="scan'208";a="147375333"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2020 02:02:37 -0700
IronPort-SDR: Y8OvluY9FctEdlDCt6y6frmwIjPJlAAkGi08P+b1ZV5upRwW3rBupeaEkYwM2SP+yNcbpD2JS7
 f+3BgXBn924w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; 
   d="scan'208";a="391980812"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 20 Jul 2020 02:02:34 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 20 Jul 2020 12:02:33 +0300
Date:   Mon, 20 Jul 2020 12:02:33 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Prashant Malani <pmalani@chromium.org>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 09/17] thunderbolt: Do not tunnel USB3 if link is not USB4
Message-ID: <20200720090233.GT5180@lahna.fi.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
 <20200615142645.56209-10-mika.westerberg@linux.intel.com>
 <20200717061600.GC68629@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717061600.GC68629@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 16, 2020 at 11:16:00PM -0700, Prashant Malani wrote:
> Hi Mika,
> 
> Sorry for the late comment..

Sorry for the late reply, was on vacation ;-)

> On Mon, Jun 15, 2020 at 05:26:37PM +0300, Mika Westerberg wrote:
> > USB3 tunneling is possible only over USB4 link so don't create USB3
> > tunnels if that's not the case.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/thunderbolt/tb.c      |  3 +++
> >  drivers/thunderbolt/tb.h      |  2 ++
> >  drivers/thunderbolt/tb_regs.h |  1 +
> >  drivers/thunderbolt/usb4.c    | 24 +++++++++++++++++++++---
> >  4 files changed, 27 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > index 55daa7f1a87d..2da82259e77c 100644
> > --- a/drivers/thunderbolt/tb.c
> > +++ b/drivers/thunderbolt/tb.c
> > @@ -235,6 +235,9 @@ static int tb_tunnel_usb3(struct tb *tb, struct tb_switch *sw)
> >  	if (!up)
> >  		return 0;
> >  
> > +	if (!sw->link_usb4)
> > +		return 0;
> On both here and the previous "up" check; should we be returning 0?
> Wouldn't it be better to return an appropriate error code? It sounds
> like 0 is considered a success....

The idea here is that you can call this function for every type of
router (can be one without USB3 adapters so TBT 3,1,2) and it creates
the tunnel if conditions for USB3 tunneling are met. It is not
considered an error.

However, if the operations fail for some reason we return appropriate
error code.
