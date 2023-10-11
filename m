Return-Path: <linux-usb+bounces-1456-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 873727C5098
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 12:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B80B31C20ED7
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 10:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA0C17999;
	Wed, 11 Oct 2023 10:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGppeCdu"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B213D1078D
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 10:52:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E33298
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 03:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697021561; x=1728557561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I0J2YW7Jsd8yS6tYLeiE3gPI7G3j3yZ/5kuyIga9sT8=;
  b=VGppeCdue271y2F252wPn+lL08+830ZSNfuD+/GjkvmI8EAg8cp3n3sn
   T9VY8jWmdk4LxQ5F/XelaQs+XEFUMViI9T/xGE7Jkhb3xqTyFHbghU9e/
   yC2Lo6Q92sUAhh7W0MyNQhEA6vBzuK5RJLESpwsIAqfQHhrsijPEG/7KV
   xsbZvRR38TUtgaQ0OWENAYsTyEyrF9daxGNUn0LXm3vwgWVWmPAWhFRJp
   1Rnsl0lLVLAEOpXMqyTc7KuNfGgLmepDsi1vGmciFmp9ArXSGqpr2jogO
   Zo/Y4jYQUACt3hnYVwH3c24Lj8fUfIjVB0DpRSsndSLhh5Y5cHHsee7md
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="448831858"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="448831858"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 03:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="753774041"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="753774041"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga002.jf.intel.com with SMTP; 11 Oct 2023 03:52:37 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 11 Oct 2023 13:52:37 +0300
Date: Wed, 11 Oct 2023 13:52:37 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Douglas Gilbert <dgilbert@interlog.com>
Subject: Re: [PATCH] usb: typec: ucsi: Fix missing link removal
Message-ID: <ZSZ+dRUvyzCJr9Y8@kuha.fi.intel.com>
References: <20231010141749.3912016-1-heikki.krogerus@linux.intel.com>
 <2023101134-division-sift-c471@gregkh>
 <2023101107-enrich-sudoku-c0ea@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023101107-enrich-sudoku-c0ea@gregkh>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 11, 2023 at 11:39:20AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Oct 11, 2023 at 11:38:49AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Oct 10, 2023 at 05:17:49PM +0300, Heikki Krogerus wrote:
> > > The link between the partner device and its USB Power
> > > Delivery instance was never removed which prevented the
> > > device from being released. Removing the link always when
> > > the partner is unregistered.
> > > 
> > > Fixes: b04e1747fbcc ("usb: typec: ucsi: Register USB Power Delivery Capabilities")
> > > Reported-by: Douglas Gilbert <dgilbert@interlog.com>
> > > Closes: https://lore.kernel.org/linux-usb/ZSUMXdw9nanHtnw2@kuha.fi.intel.com/
> > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > ---
> > >  drivers/usb/typec/ucsi/ucsi.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > > index f3ba2997004a..c9a032a5dbd0 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > @@ -787,6 +787,7 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
> > >  
> > >  	typec_set_mode(con->port, TYPEC_STATE_SAFE);
> > >  
> > > +	typec_partner_set_usb_power_delivery(con->partner, NULL);
> > >  	ucsi_unregister_partner_pdos(con);
> > >  	ucsi_unregister_altmodes(con, UCSI_RECIPIENT_SOP);
> > >  	typec_unregister_partner(con->partner);
> > > -- 
> > > 2.40.1
> > > 
> > > 
> > 
> > Hi,
> > 
> > This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> > a patch that has triggered this response.  He used to manually respond
> > to these common problems, but in order to save his sanity (he kept
> > writing the same thing over and over, yet to different people), I was
> > created.  Hopefully you will not take offence and will fix the problem
> > in your patch and resubmit it so that it can be accepted into the Linux
> > kernel tree.
> > 
> > You are receiving this message because of the following common error(s)
> > as indicated below:
> > 
> > - You have marked a patch with a "Fixes:" tag for a commit that is in an
> >   older released kernel, yet you do not have a cc: stable line in the
> >   signed-off-by area at all, which means that the patch will not be
> >   applied to any older kernel releases.  To properly fix this, please
> >   follow the documented rules in the
> >   Documentation/process/stable-kernel-rules.rst file for how to resolve
> >   this.
> > 
> > If you wish to discuss this problem further, or you have questions about
> > how to resolve this issue, please feel free to respond to this email and
> > Greg will reply once he has dug out from the pending patches received
> > from other developers.
> 
> Note, I've fixed this up by hand, but in the future, please be aware of
> it.

Thank you Greg. I'll try to be more careful in the future.

-- 
heikki

