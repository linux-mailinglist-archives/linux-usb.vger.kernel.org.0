Return-Path: <linux-usb+bounces-14848-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4927971356
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2024 11:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73231B231A7
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2024 09:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98AD1B3B07;
	Mon,  9 Sep 2024 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrFr0xvl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8041B375C
	for <linux-usb@vger.kernel.org>; Mon,  9 Sep 2024 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725873653; cv=none; b=ONrUUck5GgXBQFugeoWIYQ17pqIWQ3NmsxPGjVP/uieK0ObPAEnHVB/A4BV1BGTfb4S9WlTVPafofM1RZUILgVRYwA3UeMbo0IC9IjrqwMfUJVYgBDcFxzsq6wKBKjbkskIkDG3EWLXlZp3EE/VnTHtiJzjICh6v8Kq+ogpvWK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725873653; c=relaxed/simple;
	bh=yIAAedIpGx605/0B/HRH3Spvvs+tPpn7q/VthPrcngs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0/M6HXtefncrRaJjPl3mZARboXF+B1Iae1i0lXdoGoqSud13lL5v+KJ4tydDmEJaA+96n7X+P9pvpv2oHyuP/nk3PjgxZnBDINEfO111JjEQKP2ushGxQ8K6P4c9XKplnEUMAnjFsSGmAmpr12Hkmcov5h6JPKrZ12Z4XKbVwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrFr0xvl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725873652; x=1757409652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yIAAedIpGx605/0B/HRH3Spvvs+tPpn7q/VthPrcngs=;
  b=NrFr0xvlqqT9KNctr6rXD9OylCyQ/M3EbZvYfgjvJOvpRowQhRR1xBJR
   QJFo/BS+9qkDiU/mMeUC64wmlEtoVn778jCcGiJ3x12D6gB9hmBR9KZkd
   EhmDZd31llf68rsr8IDeNpYOl+fKeW1smwRl5por+Wq7xJJHdUzIEDj38
   v1g9oxRl7k5t9r9rwUrlSy96kGU4DHYZ6vZYyKm70XGyrLaLCBrlCnh7f
   FEn8z340M9i05HNFOF/ZG10Dx5y437iZYK2gw4plb/GbzeeoLmZ9pR5/u
   bSRpTGMHn3Dlp3kCACQvN/j+5k7weDfFwIduR1sox5I2/ya9WulBjUOCk
   w==;
X-CSE-ConnectionGUID: cJOK2qMvTBO3PesPLCudNA==
X-CSE-MsgGUID: dTsx5tbZRDSQ6IL3HFjFoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24422435"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24422435"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 02:20:51 -0700
X-CSE-ConnectionGUID: i43raAmdR96QALoPxtW2Vw==
X-CSE-MsgGUID: j6QUmduaS6awlm52ANA5eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="104077717"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa001.jf.intel.com with SMTP; 09 Sep 2024 02:20:48 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 09 Sep 2024 12:20:47 +0300
Date: Mon, 9 Sep 2024 12:20:47 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Gopal, Saranya" <saranya.gopal@intel.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"Regupathy, Rajaram" <rajaram.regupathy@intel.com>
Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method for UCSI
 read operations
Message-ID: <Zt6979hVhtzGBeq6@kuha.fi.intel.com>
References: <20240830084342.460109-1-saranya.gopal@intel.com>
 <ZtGGcRpavSITFai7@kuha.fi.intel.com>
 <ZtJDH4UCJMQbOWBY@cae.in-ulm.de>
 <DS0PR11MB74574A426FAA3322F4FFC017E39E2@DS0PR11MB7457.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB74574A426FAA3322F4FFC017E39E2@DS0PR11MB7457.namprd11.prod.outlook.com>

Hi Saranya, Christian,

On Fri, Sep 06, 2024 at 11:47:42AM +0000, Gopal, Saranya wrote:
> Hi Heikki, Christian,
> 
> > -----Original Message-----
> > From: Christian A. Ehrhardt <lk@c--e.de>
> > Sent: Saturday, August 31, 2024 3:40 AM
> > To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: Gopal, Saranya <saranya.gopal@intel.com>; linux-
> > usb@vger.kernel.org; gregkh@linuxfoundation.org; Regupathy,
> > Rajaram <rajaram.regupathy@intel.com>
> > Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method
> > for UCSI read operations
> > 
> > 
> > Hi Heikki, Hi Saranya,
> > 
> > On Fri, Aug 30, 2024 at 11:44:33AM +0300, Heikki Krogerus wrote:
> > > On Fri, Aug 30, 2024 at 02:13:42PM +0530, Saranya Gopal wrote:
> > > > ACPI _DSM methods are needed only for UCSI write operations
> > and for reading
> > > > CCI during RESET_PPM operation. So, remove _DSM calls from
> > other places.
> > > > While there, remove the Zenbook quirk also since the default
> > behavior
> > > > now aligns with the Zenbook quirk. With this change,
> > GET_CONNECTOR_STATUS
> > > > returns at least 6 seconds faster than before in Arrowlake-S
> > platforms.
> > > >
> > > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> > >
> > > Maybe this should be marked as a fix. I think this covers:
> > > https://lore.kernel.org/linux-usb/20240829100109.562429-2-
> > lk@c--e.de/
> > >
> 
> Heikki,
> I see that Christian's other patch is marked as a fix already (https://lore.kernel.org/linux-usb/20240906065853.637205-1-lk@c--e.de/T/#u). 

The other part still needs a fix.

> So, can this patch go in as it is?
> Please let me know if I need to resubmit with any changes.

If you prefer that we go with Christian's patch to fix the issue
- which is fine by me - you need to rebase this on top of his patch in
any case. So you will need to resend this either way.

Christian would you mind resending that second patch after all where
you take the Zenbook quirk into use on that ASUS system?

Let's make that as the actual fix for the issue. Maybe it's more clear
that way.

thanks,

> > > Christian, can you check this?
> > 
> > The change certainly looks like the correct thing to do and would
> > remove the need for the zenbook quirk. I'll try to get that combination
> > tested by the original reporter of
> > 	https://bugzilla.kernel.org/show_bug.cgi?id=219108
> > 
> > 
> > > > ---
> > > >  drivers/usb/typec/ucsi/ucsi_acpi.c | 56 +++-------------------------
> > --
> > > >  1 file changed, 5 insertions(+), 51 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c
> > b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > > > index 7a5dff8d9cc6..accf15ff1306 100644
> > > > --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> > > > +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > > > @@ -61,9 +61,11 @@ static int ucsi_acpi_read_cci(struct ucsi
> > *ucsi, u32 *cci)
> > > >  	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> > > >  	int ret;
> > > >
> > > > -	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > > > -	if (ret)
> > > > -		return ret;
> > > > +	if (UCSI_COMMAND(ua->cmd) == UCSI_PPM_RESET) {
> > > > +		ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}
> > 
> > 
> > This is slightly incorrect because we wait for the completion of at
> > least one other command (UCSI_SET_NOTIFICATION_ENABLE) by
> > polling cci.
> > However, this is a very minor corner case. It could be fixed by adding
> > an optional ->poll() method or similar that is NULL on other
> > implementations and does the DSM READ on ACPI. We could then call
> > this
> > before read_cci when polling for completion. If this is done -
> > >read_cci()
> > would never call the DSM method.
> > 
> > However, the change in its current state is a definitive improvement,
> > and looks good to me. Thus feel free to add
> > 	Reviewed-by: Christian A. Ehrhardt <lk@c--e.de>
> 
> Thanks for the review, Christian.
> 
> Thanks,
> Saranya
> > 
> > > >
> > > >  	memcpy(cci, ua->base + UCSI_CCI, sizeof(*cci));
> > > >
> > > > @@ -73,11 +75,6 @@ static int ucsi_acpi_read_cci(struct ucsi
> > *ucsi, u32 *cci)
> > > >  static int ucsi_acpi_read_message_in(struct ucsi *ucsi, void *val,
> > size_t val_len)
> > > >  {
> > > >  	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> > > > -	int ret;
> > > > -
> > > > -	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > > > -	if (ret)
> > > > -		return ret;
> > > >
> > > >  	memcpy(val, ua->base + UCSI_MESSAGE_IN, val_len);
> > > >
> > > > @@ -102,42 +99,6 @@ static const struct ucsi_operations
> > ucsi_acpi_ops = {
> > > >  	.async_control = ucsi_acpi_async_control
> > > >  };
> > > >
> > > > -static int
> > > > -ucsi_zenbook_read_cci(struct ucsi *ucsi, u32 *cci)
> > > > -{
> > > > -	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> > > > -	int ret;
> > > > -
> > > > -	if (UCSI_COMMAND(ua->cmd) == UCSI_PPM_RESET) {
> > > > -		ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > > > -		if (ret)
> > > > -			return ret;
> > > > -	}
> > > > -
> > > > -	memcpy(cci, ua->base + UCSI_CCI, sizeof(*cci));
> > > > -
> > > > -	return 0;
> > > > -}
> > > > -
> > > > -static int
> > > > -ucsi_zenbook_read_message_in(struct ucsi *ucsi, void *val,
> > size_t val_len)
> > > > -{
> > > > -	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> > > > -
> > > > -	/* UCSI_MESSAGE_IN is never read for PPM_RESET, return
> > stored data */
> > > > -	memcpy(val, ua->base + UCSI_MESSAGE_IN, val_len);
> > > > -
> > > > -	return 0;
> > > > -}
> > > > -
> > > > -static const struct ucsi_operations ucsi_zenbook_ops = {
> > > > -	.read_version = ucsi_acpi_read_version,
> > > > -	.read_cci = ucsi_zenbook_read_cci,
> > > > -	.read_message_in = ucsi_zenbook_read_message_in,
> > > > -	.sync_control = ucsi_sync_control_common,
> > > > -	.async_control = ucsi_acpi_async_control
> > > > -};
> > > > -
> > > >  static int ucsi_gram_read_message_in(struct ucsi *ucsi, void
> > *val, size_t val_len)
> > > >  {
> > > >  	u16 bogus_change =
> > UCSI_CONSTAT_POWER_LEVEL_CHANGE |
> > > > @@ -190,13 +151,6 @@ static const struct ucsi_operations
> > ucsi_gram_ops = {
> > > >  };
> > > >
> > > >  static const struct dmi_system_id ucsi_acpi_quirks[] = {
> > > > -	{
> > > > -		.matches = {
> > > > -			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK
> > COMPUTER INC."),
> > > > -			DMI_MATCH(DMI_PRODUCT_NAME,
> > "ZenBook UX325UA_UM325UA"),
> > > > -		},
> > > > -		.driver_data = (void *)&ucsi_zenbook_ops,
> > > > -	},
> > > >  	{
> > > >  		.matches = {
> > > >  			DMI_MATCH(DMI_SYS_VENDOR, "LG
> > Electronics"),
> > > > --
> > > > 2.34.1

-- 
heikki

