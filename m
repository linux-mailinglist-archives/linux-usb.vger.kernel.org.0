Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA127340904
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 16:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhCRPhf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 11:37:35 -0400
Received: from mga02.intel.com ([134.134.136.20]:30516 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231640AbhCRPhZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Mar 2021 11:37:25 -0400
IronPort-SDR: 918ZO6AvSIjAlcF3S4Wv6nuYIkfuZdUbFJSnYonsumBqOTVAXsGVqXO/4pFctK2dcMp6vw0hht
 jjJib7Rv0RSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="176839080"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; 
   d="scan'208";a="176839080"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 08:37:24 -0700
IronPort-SDR: 6GkJt5tkWkuOQFbYJB2XQHucH9MhOyLF3oNAeHdzD3j61nnR8jyz0hHRmQOJHaj7aDramTnm3a
 zSeNKq/PJEMA==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; 
   d="scan'208";a="413127580"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 08:37:21 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 18 Mar 2021 17:37:19 +0200
Date:   Thu, 18 Mar 2021 17:37:19 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Prashant Malani <pmalani@chromium.org>
Cc:     Gil Fine <gil.fine@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] thunderbolt: debugfs: Show all accessible dwords
Message-ID: <20210318153719.GJ2542@lahna.fi.intel.com>
References: <20210309092330.5813-1-gil.fine@intel.com>
 <CACeCKadX+ugHZTup5O7YXCtYpALg7rn7gAqCe4SBLa_nyU3hLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKadX+ugHZTup5O7YXCtYpALg7rn7gAqCe4SBLa_nyU3hLA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Mar 17, 2021 at 05:49:33PM -0700, Prashant Malani wrote:
> Hi Gil,
> 
> 
> On Tue, Mar 9, 2021 at 1:23 AM Gil Fine <gil.fine@intel.com> wrote:
> >
> > Currently, when first failure occurs while reading of the block,
> > we stop reading the block and jump to the next capability.
> > This doesn't cover the case of block with "holes" of inaccessible
> > dwords, followed by accessible dwords.
> > This patch address this problem.
> > In case of failure while reading the complete block in one transaction,
> > (because of one or more dwords is inaccessible), we read the remaining
> > dwords of the block dword-by-dword, one dword per transaction,
> > till the end of the block.
> > By doing this, we handle the case of block with "holes" of inaccessible
> > dwords, followed by accessible dwords. The accessible dwords are shown
> > with the fields: <offset> <relative_offset> <cap_id> <vs_cap_id> <value>
> > E.g.:
> > 0x01eb  236 0x05 0x06 0x0000d166
> > While the inaccesible dwords are shown as: <offset> <not accessible>
> > E.g.:
> > 0x01ed <not accessible>
> >
> > Signed-off-by: Gil Fine <gil.fine@intel.com>
> > ---
> >  drivers/thunderbolt/debugfs.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
> > index 201036507cb8..c850b0ac098c 100644
> > --- a/drivers/thunderbolt/debugfs.c
> > +++ b/drivers/thunderbolt/debugfs.c
> > @@ -265,10 +265,8 @@ static void cap_show_by_dw(struct seq_file *s, struct tb_switch *sw,
> >                 else
> >                         ret = tb_sw_read(sw, &data, TB_CFG_SWITCH, cap + offset + i, 1);
> >                 if (ret) {
> > -                       seq_printf(s, "0x%04x <not accessible>\n", cap + offset);
> > -                       if (dwords - i > 1)
> > -                               seq_printf(s, "0x%04x ...\n", cap + offset + 1);
> > -                       return;
> > +                       seq_printf(s, "0x%04x <not accessible>\n", cap + offset + i);
> > +                       continue;
> >                 }
> >
> >                 seq_printf(s, "0x%04x %4d 0x%02x 0x%02x 0x%08x\n", cap + offset + i,
> > @@ -292,7 +290,7 @@ static void cap_show(struct seq_file *s, struct tb_switch *sw,
> >                 else
> >                         ret = tb_sw_read(sw, data, TB_CFG_SWITCH, cap + offset, dwords);
> >                 if (ret) {
> > -                       cap_show_by_dw(s, sw, port, cap, offset, cap_id, vsec_id, dwords);
> 
> Sorry for being late here:
> Can we call cap_show_by_dw(..., dwords) directly here, instead of
> having the logic of doing the block read and then resorting to this if
> the block read fails?
> Since it's debugfs, I doubt efficiency gains are paramount here, and
> we have a simpler invocation at the callsite.

I don't think that complicates too much, and in most cases we don't
expect the cap read to fail so doing block read saves us sending
multiple messages over the fabric (even if we don't care about the
performance here).

In any case the patch is already applied so if you want to change this
please send an incremental patch.
