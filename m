Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9241EDFDF6
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 09:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387884AbfJVHEh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 03:04:37 -0400
Received: from mga07.intel.com ([134.134.136.100]:51901 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387882AbfJVHEh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Oct 2019 03:04:37 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 00:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; 
   d="scan'208";a="209609526"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 22 Oct 2019 00:04:33 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 22 Oct 2019 10:04:33 +0300
Date:   Tue, 22 Oct 2019 10:04:33 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 14/18] usb: typec: ucsi: Remove the old API
Message-ID: <20191022070433.GC28049@kuha.fi.intel.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
 <20191021112524.79550-15-heikki.krogerus@linux.intel.com>
 <BYAPR12MB272730A5205C8F97AE3C37D2DC690@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR12MB272730A5205C8F97AE3C37D2DC690@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ajay,

On Mon, Oct 21, 2019 at 07:28:36PM +0000, Ajay Gupta wrote:
> Hi Heikki,
> 
> > -----Original Message-----
> > From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org>
> > On Behalf Of Heikki Krogerus
> > Sent: Monday, October 21, 2019 4:25 AM
> > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Guenter Roeck <linux@roeck-us.net>; Ajay Gupta <ajayg@nvidia.com>;
> > linux-usb@vger.kernel.org
> > Subject: [PATCH 14/18] usb: typec: ucsi: Remove the old API
> > 
> > The drivers now only use the new API, so removing the old one.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  drivers/usb/typec/ucsi/displayport.c |  24 +-
> >  drivers/usb/typec/ucsi/trace.h       |  17 --
> >  drivers/usb/typec/ucsi/ucsi.c        | 345 +++------------------------
> >  drivers/usb/typec/ucsi/ucsi.h        |  41 ----
> >  4 files changed, 43 insertions(+), 384 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/ucsi/displayport.c
> > b/drivers/usb/typec/ucsi/displayport.c
> > index d99700cb4dca..47424935bc81 100644
> > --- a/drivers/usb/typec/ucsi/displayport.c
> > +++ b/drivers/usb/typec/ucsi/displayport.c
> > @@ -48,6 +48,7 @@ struct ucsi_dp {
> >  static int ucsi_displayport_enter(struct typec_altmode *alt)  {
> >  	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
> > +	struct ucsi *ucsi = dp->con->ucsi;
> >  	struct ucsi_control ctrl;
> >  	u8 cur = 0;
> >  	int ret;
> Need to initialize "ret" otherwise we will return uninitialized value if first
> "if" condition in this function is true.

"ret" does get a value in the first "if" condition. See below.

> > @@ -59,25 +60,21 @@ static int ucsi_displayport_enter(struct typec_altmode
> > *alt)
> > 
> >  		dev_warn(&p->dev,
> >  			 "firmware doesn't support alternate mode
> > overriding\n");
> > -		mutex_unlock(&dp->con->lock);
> > -		return -EOPNOTSUPP;
> > +		ret = -EOPNOTSUPP;
                ^^^^^^^^^^^^^^^^^^
Note.

> > +		goto err_unlock;
> >  	}

thanks,

-- 
heikki
