Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5665CA041
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 16:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbfJCOYq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 10:24:46 -0400
Received: from mga09.intel.com ([134.134.136.24]:63563 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725957AbfJCOYq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Oct 2019 10:24:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Oct 2019 07:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,252,1566889200"; 
   d="scan'208";a="205630037"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 03 Oct 2019 07:24:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 03 Oct 2019 17:24:43 +0300
Date:   Thu, 3 Oct 2019 17:24:43 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 00/14] usb: typec: UCSI driver overhaul
Message-ID: <20191003142443.GC1048@kuha.fi.intel.com>
References: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
 <BYAPR12MB2727E1FE3CDFC5D6DD87CF73DC9D0@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR12MB2727E1FE3CDFC5D6DD87CF73DC9D0@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ajay,

On Tue, Oct 01, 2019 at 06:36:25PM +0000, Ajay Gupta wrote:
> Hi Heikki
> 
> > -----Original Message-----
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Thursday, September 26, 2019 3:07 AM
> > To: Ajay Gupta <ajayg@nvidia.com>
> > Cc: linux-usb@vger.kernel.org
> > Subject: [PATCH 00/14] usb: typec: UCSI driver overhaul
> > 
> > Hi Ajay,
> > 
> > Here's the pretty much complete rewrite of the I/O handling that I was
> > talking about. The first seven patches are not actually related to
> > this stuff, but I'm including them here because the rest of the series
> > is made on top of them. I'm including also that fix patch I send you
> > earlier.
> > 
> > After this it should be easier to handle quirks. My idea how to handle
> > the multi-instance connector alt modes is that we "emulate" the PPM in
> > ucsi_ccg.c in order to handle them, so ucsi.c is not touched at all.
> > 
> > We can now get the connector alternate modes that the actual
> > controller supplies during probe - before registering the ucsi
> > interface 
> How can ucsi_ccg.c get the connector alternate modes before
> registering ucsi interface? PPM reset, notification enable, etc. 
> is done during ucsi registration. UCSI spec says:
> " The only commands the PPM is required to process in the 
> "PPM Idle (Notifications Disabled)" state are 
> SET_NOTIFICATION_ENABLE and PPM_RESE"
> 
> Also, it doesn't look correct if ucsi_ccg.c has to replicate most 
> of the stuff done in ucsi_init() of ucsi.c.

How about if we split ucsi_init() into a function that first simply
constructs the struct ucsi and struct ucsi_connector instances without
registering anything, and into separate functions that then register
the ports, altmodes and what have you. I don't think that should be a
huge problem. It will make ucsi.c even more like a library, which is
probable a good thing. I can prepare patches for that too if you like?

After that you should be able to get the struct ucsi instance that
represents the "real" PPM without registering anything by calling
a single function, most likely ucsi_init(). And after getting that you
can construct the connector alternate modes that we actually register.
Finally you register the final interface which does not use
ucsi_ccg_ops, but instead something like ucsi_nvidia_ops.

How would this sound to you?

Br,

-- 
heikki
