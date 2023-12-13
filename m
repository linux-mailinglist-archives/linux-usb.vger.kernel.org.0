Return-Path: <linux-usb+bounces-4099-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CCB810A36
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 07:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54E8528203F
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 06:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212DCF9FA;
	Wed, 13 Dec 2023 06:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWdgsnsa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0855AD;
	Tue, 12 Dec 2023 22:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702448590; x=1733984590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wv/18E5p3sNl8d3AG1X8KZ8Wa0o3+44iLInD7qAokHU=;
  b=aWdgsnsaLyiBCeiQNCW74zgdXsRm+6K49/SWpgiclG6pqnWC1SJpv6Tr
   GvkWeAkT5W697ROSF+r847SyfrESbSXypkoetL4uDqemtNJimYzKsezvK
   huTjfZBv+/FNmcdAxtngUfO+BNdZGS+OZbO2xqN24Ii0Z4E0vDEKh8mOF
   vBPcryHEGAWVTZMfj52z1pgOw06pfUEaAjdAJlYgwH/PB+RzjvxVGgiOx
   Q6AvkQM3E1U2Fxs5Xuoljd1IMqjAiGAd7ICWXs9T4D1sjovqBAdhD7z3I
   KyYfOBkFQkiJf5EzcAsSqCp+JsJ+i8EMjKxcGntFR1ZqSPkL/VamgFpF8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="16471901"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="16471901"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 22:23:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="777380515"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="777380515"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 12 Dec 2023 22:23:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5D2C81A7; Wed, 13 Dec 2023 08:23:06 +0200 (EET)
Date: Wed, 13 Dec 2023 08:23:06 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sanath S <Sanath.S@amd.com>
Cc: mario.limonciello@amd.com, andreas.noever@gmail.com,
	michael.jamet@intel.com, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v2 2/2] thunderbolt: Teardown tunnels and reset
 downstream ports created by boot firmware
Message-ID: <20231213062306.GL1074920@black.fi.intel.com>
References: <20231212191635.2022520-1-Sanath.S@amd.com>
 <20231212191635.2022520-3-Sanath.S@amd.com>
 <20231213054914.GI1074920@black.fi.intel.com>
 <20231213061805.GK1074920@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231213061805.GK1074920@black.fi.intel.com>

On Wed, Dec 13, 2023 at 08:18:06AM +0200, Mika Westerberg wrote:
> On Wed, Dec 13, 2023 at 07:49:14AM +0200, Mika Westerberg wrote:
> > On Wed, Dec 13, 2023 at 12:46:35AM +0530, Sanath S wrote:
> > > Boot firmware might have created tunnels of its own. Since we cannot
> > > be sure they are usable for us. Tear them down and reset the ports
> > > to handle it as a new hotplug for USB3 routers.
> > > 
> > > Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> > > Signed-off-by: Sanath S <Sanath.S@amd.com>
> > > ---
> > >  drivers/thunderbolt/tb.c | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > > index fd49f86e0353..febd0b6972e3 100644
> > > --- a/drivers/thunderbolt/tb.c
> > > +++ b/drivers/thunderbolt/tb.c
> > > @@ -2598,6 +2598,17 @@ static int tb_start(struct tb *tb)
> > >  	tb_switch_tmu_enable(tb->root_switch);
> > >  	/* Full scan to discover devices added before the driver was loaded. */
> > >  	tb_scan_switch(tb->root_switch);
> > > +	/*
> > > +	 * Boot firmware might have created tunnels of its own. Since we cannot
> > > +	 * be sure they are usable for us, Tear them down and reset the ports
> > > +	 * to handle it as new hotplug for USB4 routers.
> > > +	 */
> > > +	if (tb_switch_is_usb4(tb->root_switch)) {
> > > +		tb_switch_discover_tunnels(tb->root_switch,
> > > +					   &tcm->tunnel_list, false);
> > 
> > Why this is needed?
> > 
> > It should be enough, to do simply something like this:
> > 
> > 	if (tb_switch_is_usb4(tb->root_switch))
> > 		tb_switch_reset(tb->root_switch);
> 
> Actually this needs to be done only for USB4 v1 routers since we already
> reset USB4 v2 hosts so something like:
> 
> 	/*
> 	 * Reset USB4 v1 host router to get rid of possible tunnels the
> 	 * boot firmware created. This makes sure all the tunnels are
> 	 * created by us and thus have known configuration.
> 	 *
> 	 * For USB4 v2 and beyond we do this in nhi_reset() using the
> 	 * host router reset interface.
> 	 */
> 	if (usb4_switch_version(tb->root_switch) == 1)
> 		tb_switch_reset(tb->root_switch);
> 
> (possibly add similar comment to the nhi_reset() to refer this one).

Oh, and would it be possible to tie this with the "host_reset" parameter
too somehow? I guess it could be moved to "tb.c" and "tb.h" and then
check it from nhi.c as already done and then here so this would become:

 	if (host_reset && usb4_switch_version(tb->root_switch) == 1)
 		tb_switch_reset(tb->root_switch);

With the idea that the user has a "chicken bit" to disable this
behaviour (and consistent one with USB4 v2). Feel free to make it look
nicer though.

