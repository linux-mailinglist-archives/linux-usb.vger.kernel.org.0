Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94252509A28
	for <lists+linux-usb@lfdr.de>; Thu, 21 Apr 2022 10:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386316AbiDUIDN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 04:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbiDUIDL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 04:03:11 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5C0711C10
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650528022; x=1682064022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VJYSm9WWfvh7Ek9yEyB3/A47vNPELIRS5c3GwiQy5wA=;
  b=S7nMAGmfMSoo/LDCutaun2kdGQorgVWN0BaGcMmLgs/FJVXico49MuZk
   kFkdfDIlvwyfPKYfA3xh5RYjWRPPAJ9iCsbZx+65lVMZ7m8PU3xlN8GVb
   LDW4D5Km1mkNc7HIcogBh4fdKYUB8gVrL3+vdntlLs4UUeOWvvJQstF96
   QDdt4IeHtOuoqB+EzCS4M/kOE1HFh52X64xlE4Th+7GhgBySaPs8BJmaY
   EgR3+G8odE18idMW7wvYwVYwUcQ779c9gNiXb/OzrtlLqC8uEhmIT2GCw
   B/fD75u47Ax0iy2Kdj5I/ybJHe4BRhTdYYJdmSHeSQ50J0hk+K4uNALKX
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="263740126"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="263740126"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 01:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="702985224"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Apr 2022 01:00:18 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 21 Apr 2022 11:00:17 +0300
Date:   Thu, 21 Apr 2022 11:00:17 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: Re: [PATCH v3 2/4] usb: typec: ucsi: add a common function
 ucsi_unregister_connectors()
Message-ID: <YmEPEUwb9GYJqzJD@kuha.fi.intel.com>
References: <1649843891-15554-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649843891-15554-3-git-send-email-quic_linyyuan@quicinc.com>
 <Yla9VGMpcDcpJR0f@kuha.fi.intel.com>
 <DM8PR02MB81985719835CC9DC2AAF1E6EE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR02MB81985719835CC9DC2AAF1E6EE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 13, 2022 at 01:27:52PM +0000, Linyu Yuan (QUIC) wrote:
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Wednesday, April 13, 2022 8:09 PM
> > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> > usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> > Subject: Re: [PATCH v3 2/4] usb: typec: ucsi: add a common function
> > ucsi_unregister_connectors()
> > 
> > On Wed, Apr 13, 2022 at 05:58:09PM +0800, Linyu Yuan wrote:
> > > In error path of ucsi_init(), it will unregister all valid ucsi connector,
> > > and samiliar operation also happen in ucsi_unregister(),
> > 
> > Sorry but I have to confirm this: with "samiliar" you mean "the same",
> > right?
> 
> Only one small difference for original code which is no cancel_work_sync() of each connector in ucsi _init(),
> But in ucsi_register_port(), we get role switch after connector work initialized,
> So I think it is safe to call cancel_work_sync() to connector work if role switch return -EPROBE_DEFER.
> 
> > 
> > > add a common function for two places.
> > >
> > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > ---
> > > v2: improve ucsi_connector_clean(), check total number of connector.
> > > v3: rename to ucsi_unregister_connectors(), suggest by maintainer
> > >
> > >  drivers/usb/typec/ucsi/ucsi.c | 51 ++++++++++++++++++++++++-----------
> > --------
> > >  1 file changed, 28 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > > index 77ac0b7..af9a2a1 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > @@ -1187,6 +1187,32 @@ static int ucsi_register_port(struct ucsi *ucsi, int
> > index)
> > >  	return ret;
> > >  }
> > >
> > > +static void ucsi_unregister_connectors(struct ucsi *ucsi)
> > > +{
> > > +	struct ucsi_connector *con;
> > > +	int i;
> > > +
> > > +	if (!ucsi->connector)
> > > +		return;
> > 
> > Can that actually ever happen?
> 
> Consider a case, ucsi_init() failed, we will call ucsi_unregister_connectors() to free all connectors,
> After that the UCSI implementation like ucsi_acpi call ucsi_unregister() again,
> It should not unregister connectors again.

I'm sorry but I don't understand your answer. I'm trying to ask what
are you trying to say with the word "samiliar"?

I do not believe there is a word "samiliar" in English language.

thanks,

-- 
heikki
