Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04FD92ECF94
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jan 2021 13:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728026AbhAGM0r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jan 2021 07:26:47 -0500
Received: from mga03.intel.com ([134.134.136.65]:42181 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727994AbhAGM0r (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Jan 2021 07:26:47 -0500
IronPort-SDR: rWdGBtJRNe9V1B+/FFdDdsuuKFeRzo56yZ1DsIQBNQTQoebweZBlLqEzHaQkeU51DLW6/Mvptw
 n7X60GcoVCxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9856"; a="177515289"
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="177515289"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 04:25:01 -0800
IronPort-SDR: iMNYwLg+Zf9qEsrxJidXqFBVlDnHWTrFgAEjGZxJA026D2dSWzxVysZKz9852zqyTLWR5YW0L8
 9eeOyULsz8tA==
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="422557561"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 04:24:58 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 07 Jan 2021 14:24:56 +0200
Date:   Thu, 7 Jan 2021 14:24:56 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] thunderbolt: Drop duplicated 0x prefix from format string
Message-ID: <20210107122456.GP968855@lahna.fi.intel.com>
References: <20210105091908.15290-1-mika.westerberg@linux.intel.com>
 <CA+CmpXuV_rEMqoLL=fTQr=Qk-2bZWq2HezhA3m=mY=rE6ow3BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CmpXuV_rEMqoLL=fTQr=Qk-2bZWq2HezhA3m=mY=rE6ow3BQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 05, 2021 at 12:08:32PM +0200, Yehezkel Bernat wrote:
> On Tue, Jan 5, 2021 at 11:19 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > The tb_dbg() call is using %#x that already adds the 0x prefix so don't
> > duplicate it.
> >
> > Fixes: 9039387e166e ("thunderbolt: Add USB4 router operation proxy for firmware connection manager")
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/thunderbolt/icm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
> > index 8b7f941a9bb7..b8c4159bc32d 100644
> > --- a/drivers/thunderbolt/icm.c
> > +++ b/drivers/thunderbolt/icm.c
> > @@ -2316,7 +2316,7 @@ static int icm_usb4_switch_nvm_authenticate_status(struct tb_switch *sw,
> >
> >         if (auth && auth->reply.route_hi == sw->config.route_hi &&
> >             auth->reply.route_lo == sw->config.route_lo) {
> > -               tb_dbg(tb, "NVM_AUTH found for %llx flags 0x%#x status %#x\n",
> > +               tb_dbg(tb, "NVM_AUTH found for %llx flags %#x status %#x\n",
> >                        tb_route(sw), auth->reply.hdr.flags, auth->reply.status);
> >                 if (auth->reply.hdr.flags & ICM_FLAGS_ERROR)
> >                         ret = -EIO;
> > --
> > 2.29.2
> >
> 
> Reviewed-by: Yehezkel Bernat <YehezkelShB@gmail.com>

Thanks! Applied now.
