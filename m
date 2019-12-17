Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A227812278C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 10:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfLQJVn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Dec 2019 04:21:43 -0500
Received: from mga03.intel.com ([134.134.136.65]:60201 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726612AbfLQJVn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Dec 2019 04:21:43 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Dec 2019 01:21:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; 
   d="scan'208";a="221709664"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 17 Dec 2019 01:21:40 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 17 Dec 2019 11:21:39 +0200
Date:   Tue, 17 Dec 2019 11:21:39 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Ajay Gupta <ajaykuee@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v6] usb: typec: ucsi: add support for separate DP altmode
 devices
Message-ID: <20191217092139.GA22923@kuha.fi.intel.com>
References: <20191123004347.5127-1-ajayg@nvidia.com>
 <20191212134412.GF31345@kuha.fi.intel.com>
 <BYAPR12MB27275226F3C815F96257F081DC550@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191213123753.GH31345@kuha.fi.intel.com>
 <BYAPR12MB2727CB6BDCD3E76DDB92BB55DC510@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR12MB2727CB6BDCD3E76DDB92BB55DC510@BYAPR12MB2727.namprd12.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 16, 2019 at 10:49:46PM +0000, Ajay Gupta wrote:
> Hi Heikki,
> 
> > -----Original Message-----
> > From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org>
> > On Behalf Of Heikki Krogerus
> > Sent: Friday, December 13, 2019 4:38 AM
> > To: Ajay Gupta <ajayg@nvidia.com>
> > Cc: Ajay Gupta <ajaykuee@gmail.com>; linux-usb@vger.kernel.org
> > Subject: Re: [PATCH v6] usb: typec: ucsi: add support for separate DP altmode
> > devices
> > 
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Thu, Dec 12, 2019 at 05:42:28PM +0000, Ajay Gupta wrote:
> > > Hi Heikki,
> > >
> > > > -----Original Message-----
> > > > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > Sent: Thursday, December 12, 2019 5:44 AM
> > > > To: Ajay Gupta <ajaykuee@gmail.com>
> > > > Cc: linux-usb@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> > > > Subject: Re: [PATCH v6] usb: typec: ucsi: add support for separate
> > > > DP altmode devices
> > > >
> > > >
> > > > Hi Ajay,
> > > >
> > > > On Fri, Nov 22, 2019 at 04:43:47PM -0800, Ajay Gupta wrote:
> > > > > From: Ajay Gupta <ajayg@nvidia.com>
> > > > >
> > > > > CCGx controller used on NVIDIA GPU card has two separate display
> > > > > altmode for two DP pin assignments. UCSI specification doesn't
> > > > > prohibits using separate display altmode.
> > > > >
> > > > > Current UCSI Type-C framework expects only one display altmode for
> > > > > all DP pin assignment. This patch squashes two separate display
> > > > > altmode into single altmode to support controllers with separate
> > > > > display altmode. We first read all the alternate modes of
> > > > > connector and then run through it to know if there are separate
> > > > > display altmodes. If so, it prepares a new port altmode set after
> > > > > squashing two or more separate altmodes into one.
> > > >
> > > > I didn't see any major issues with this. There were still few extra
> > > > spaces etc., but I can clean those. Maybe it would have been good to
> > > > mention in the commit message that the reason why we need those two
> > > > separate alt modes, for what is in reality two separate pin
> > > > configurations, is limitations in UCSI specification, but never mind.
> > > >
> > > > I still don't like the approach, but since I'm unable to explain my
> > > > idea, or have time to write something for this myself, I don't want
> > > > block this any longer. It does not add that much code, so once I
> > > > have time, I can always try to improve it myself, right?
> > > >
> > > > Otherwise it's OK by me. I'll queue it up.
> > > Thanks for reviewing. Please feel free to improve the patch or commit
> > message.
> > 
> > One thing that I do want to do is I want to isolate the changes done to ucsi.c.
> > Can you test the attached diff? It applies on top of this patch.
> Tested the diff and it looks good. Please add additional change at [A] on top of
> your diff..

Done.

> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -368,11 +368,8 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
>                 if (!len)
>                         break;
> 
> -               if (!alt.svid) {
> -                       /* break out of outer loop and register */
> -                       i = max_altmodes;
> +               if (!alt.svid)
>                         break;
> -               }
> 
>                 orig[k].mid = alt.mid;
>                 orig[k].svid = alt.svid;
> @@ -382,7 +379,7 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
>          * Update the original altmode table as some ppms may report
>          * multiple DP altmodes.
>          */
> -       if (recipient == UCSI_RECIPIENT_CON && ucsi->ops->update_altmodes)
> +       if (recipient == UCSI_RECIPIENT_CON)
>                 multi_dp = ucsi->ops->update_altmodes(ucsi, orig, updated);
> 
>         /* now register altmodes */

thanks,

-- 
heikki
