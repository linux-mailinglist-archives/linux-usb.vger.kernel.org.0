Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8D1DB793E
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 14:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390211AbfISMXH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 08:23:07 -0400
Received: from mga04.intel.com ([192.55.52.120]:49831 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390189AbfISMXH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Sep 2019 08:23:07 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Sep 2019 05:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,523,1559545200"; 
   d="scan'208";a="202274389"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 19 Sep 2019 05:23:04 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 19 Sep 2019 15:23:03 +0300
Date:   Thu, 19 Sep 2019 15:23:03 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Ajay Gupta <ajaykuee@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5] usb: typec: ucsi: add support for separate DP altmode
 devices
Message-ID: <20190919122303.GC16243@kuha.fi.intel.com>
References: <20190906165516.24006-1-ajayg@nvidia.com>
 <20190913152009.GA26700@kuha.fi.intel.com>
 <BYAPR12MB27272A58997E4D9BC030C9C3DC8F0@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR12MB27272A58997E4D9BC030C9C3DC8F0@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 17, 2019 at 09:41:49PM +0000, Ajay Gupta wrote:
> Hi Heikki,
> 
> > -----Original Message-----
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Friday, September 13, 2019 8:20 AM
> > To: Ajay Gupta <ajaykuee@gmail.com>
> > Cc: linux-usb@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> > Subject: Re: [PATCH v5] usb: typec: ucsi: add support for separate DP altmode
> > devices
> > 
> > Hi Ajay,
> > 
> > On Fri, Sep 06, 2019 at 09:55:16AM -0700, Ajay Gupta wrote:
> > > From: Ajay Gupta <ajayg@nvidia.com>
> > >
> > > CCGx controller used on NVIDIA GPU card has two separate display
> > > altmode for two DP pin assignments. UCSI specification doesn't
> > > prohibits using separate display altmode.
> > >
> > > Current UCSI Type-C framework expects only one display altmode for all
> > > DP pin assignment. This patch squashes two separate display altmode
> > > into single altmode to support controllers with separate display
> > > altmode. We first read all the alternate modes of connector and then
> > > run through it to know if there are separate display altmodes. If so,
> > > it prepares a new port altmode set after squashing two or more
> > > separate altmodes into one.
> > 
> > I'm going to go over this one more time during the merge window. I have an
> > idea how to improve this. Please bear with me. I have to make sure all options
> > were considered.
> > 
> > I'm really sorry to block this for so long, but I'm just really really afraid of
> > mixing special case solutions like this into otherwise generic code.
> 
> I can update the patch to make sure generic code flow remains as-is and special
> case is executed only for UCSI controllers which needs squashing of duplicate
> DP altmodes.
> We can use the new function pointer update_altmode() added in "struct ucsi_ppm" in v5
> of my patch for this purpose.
> 
> if (recipient == UCSI_RECIPIENT_CON && ucsi->ppm && ucsi->ppm->update_altmodes)
> 	Get all the altmodes first, pass it to update_altmodes() for squashing if needed,
> 	and then register each altmodes.
> else
> 	Use the current method where we get and register one altmode at a time.
> 
> Please let me know if this looks fine to you.

No. Please wait. I'm refactoring ucsi.c. I'm going to redo the I/O
completely, and also do some long waited cleanups. Those changes
should make handling this case also much easier.

thanks,

-- 
heikki
