Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F753077F8
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 15:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbhA1OZb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 09:25:31 -0500
Received: from mga09.intel.com ([134.134.136.24]:59896 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231690AbhA1OYn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 Jan 2021 09:24:43 -0500
IronPort-SDR: QVXVOzIbTnF/IZBDfvHMe5OLtt4UZr1UJCGL4sqIcaGkLos82xcLRHVHwy1mqj8t78nPm3ubiJ
 tbRwS3JJ4YOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="180383417"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="180383417"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 06:22:57 -0800
IronPort-SDR: oJv2egTL7QXFrTJIpFuZyCgQkbMp0KutFXZOHN8ADdqGKNOJuSZUaKcrhUbLDWuNKY0TSpTWUJ
 pRJCC2QfIcLQ==
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="388830374"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 06:22:54 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 28 Jan 2021 16:22:51 +0200
Date:   Thu, 28 Jan 2021 16:22:51 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 2/5] thunderbolt: eeprom: Fix kernel-doc descriptions of
 non-static functions
Message-ID: <20210128142251.GU2542@lahna.fi.intel.com>
References: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
 <20210128122934.36897-3-mika.westerberg@linux.intel.com>
 <20210128131111.GH4774@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210128131111.GH4774@dell>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 28, 2021 at 01:11:11PM +0000, Lee Jones wrote:
> On Thu, 28 Jan 2021, Mika Westerberg wrote:
> 
> > Fix kernel-doc descriptions of the two non-static functions. This also
> > gets rid of the rest of the warnings on W=1 build.
> > 
> > Reported-by: Lee Jones <lee.jones@linaro.org>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/thunderbolt/eeprom.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
> > index 63c64f503faa..dd03d3096653 100644
> > --- a/drivers/thunderbolt/eeprom.c
> > +++ b/drivers/thunderbolt/eeprom.c
> > @@ -279,7 +279,9 @@ struct tb_drom_entry_port {
> >  
> >  
> >  /**
> > - * tb_drom_read_uid_only - read uid directly from drom
> > + * tb_drom_read_uid_only() - Read UID directly from DROM
> 
> Just an FYI: the '()' aren't required per say.

Right. I have been using them in this driver so I thought it is good
idea to add them here too while at it.

> > + * @sw: Router whose UID to read
> > + * @uid: UID is placed here
> >   *
> >   * Does not use the cached copy in sw->drom. Used during resume to check switch
> >   * identity.
> > @@ -520,7 +522,14 @@ static int tb_drom_read_n(struct tb_switch *sw, u16 offset, u8 *val,
> >  }
> >  
> >  /**
> > - * tb_drom_read - copy drom to sw->drom and parse it
> > + * tb_drom_read() - Copy DROM to sw->drom and parse it
> > + * @sw: Router whose DROM to read and parse
> > + *
> > + * This function reads router DROM and if successful parses the entries and
> > + * populates the fields in @sw accordingly. Can be called for any router
> > + * generation.
> > + *
> > + * Returns %0 in case of success and negative errno otherwise.
> 
> What's %0?

It is 0 but marked as "constant" in the output.

> 
> >   */
> >  int tb_drom_read(struct tb_switch *sw)
> >  {
> 
> -- 
> Lee Jones [李琼斯]
> Senior Technical Lead - Developer Services
> Linaro.org │ Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
