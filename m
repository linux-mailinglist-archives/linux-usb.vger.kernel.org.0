Return-Path: <linux-usb+bounces-14406-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 485E1966C1A
	for <lists+linux-usb@lfdr.de>; Sat, 31 Aug 2024 00:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E4671C20C43
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 22:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD472176FA0;
	Fri, 30 Aug 2024 22:09:41 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630762AE84
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 22:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725055781; cv=none; b=Fo0YiDZGoUliZbgAjuaiYDHXW69Y/2v3SsLKlQ252clY4T5w7c52dfizcat6EgDUs1TafFKgH9IrEhtyfcT1usj8TZ6Y9K7pk2F1QDX7TDVrs4oiQj3oIKDCR1a//O8o97hP0SW7M8ZUCtUTM0Mf9BjDcpNV+dlilxdSRW1PVKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725055781; c=relaxed/simple;
	bh=UfDXWS1ZSVzVFrazOgFTi72oBjxv5UDMj291of3tDbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrkXEgwvM5oLMGlChIRIhlPxV50x0+sZn7AJ94SRCJbKa2ew0bWCmdXtmLjJHiJQ5asYE3JvGLshP2/ITu1EHclwHxzhqFF+gmYt7k2Meiv9GXituX0c8KOevQwVx6zUcqIJ+tLc3miq0xeUSynwIcrsJDNvnyjrLef5H83+ApE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id D31D8140028; Sat, 31 Aug 2024 00:09:35 +0200 (CEST)
Date: Sat, 31 Aug 2024 00:09:35 +0200
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Saranya Gopal <saranya.gopal@intel.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, rajaram.regupathy@intel.com
Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method for UCSI
 read operations
Message-ID: <ZtJDH4UCJMQbOWBY@cae.in-ulm.de>
References: <20240830084342.460109-1-saranya.gopal@intel.com>
 <ZtGGcRpavSITFai7@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtGGcRpavSITFai7@kuha.fi.intel.com>


Hi Heikki, Hi Saranya, 

On Fri, Aug 30, 2024 at 11:44:33AM +0300, Heikki Krogerus wrote:
> On Fri, Aug 30, 2024 at 02:13:42PM +0530, Saranya Gopal wrote:
> > ACPI _DSM methods are needed only for UCSI write operations and for reading
> > CCI during RESET_PPM operation. So, remove _DSM calls from other places.
> > While there, remove the Zenbook quirk also since the default behavior
> > now aligns with the Zenbook quirk. With this change, GET_CONNECTOR_STATUS
> > returns at least 6 seconds faster than before in Arrowlake-S platforms.
> > 
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> 
> Maybe this should be marked as a fix. I think this covers:
> https://lore.kernel.org/linux-usb/20240829100109.562429-2-lk@c--e.de/
> 
> Christian, can you check this?

The change certainly looks like the correct thing to do and would
remove the need for the zenbook quirk. I'll try to get that combination
tested by the original reporter of
	https://bugzilla.kernel.org/show_bug.cgi?id=219108


> > ---
> >  drivers/usb/typec/ucsi/ucsi_acpi.c | 56 +++---------------------------
> >  1 file changed, 5 insertions(+), 51 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > index 7a5dff8d9cc6..accf15ff1306 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > @@ -61,9 +61,11 @@ static int ucsi_acpi_read_cci(struct ucsi *ucsi, u32 *cci)
> >  	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> >  	int ret;
> >  
> > -	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > -	if (ret)
> > -		return ret;
> > +	if (UCSI_COMMAND(ua->cmd) == UCSI_PPM_RESET) {
> > +		ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > +		if (ret)
> > +			return ret;
> > +	}


This is slightly incorrect because we wait for the completion of at
least one other command (UCSI_SET_NOTIFICATION_ENABLE) by polling cci. 
However, this is a very minor corner case. It could be fixed by adding
an optional ->poll() method or similar that is NULL on other
implementations and does the DSM READ on ACPI. We could then call this
before read_cci when polling for completion. If this is done ->read_cci() 
would never call the DSM method.

However, the change in its current state is a definitive improvement,
and looks good to me. Thus feel free to add
	Reviewed-by: Christian A. Ehrhardt <lk@c--e.de>

> >  
> >  	memcpy(cci, ua->base + UCSI_CCI, sizeof(*cci));
> >  
> > @@ -73,11 +75,6 @@ static int ucsi_acpi_read_cci(struct ucsi *ucsi, u32 *cci)
> >  static int ucsi_acpi_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
> >  {
> >  	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> > -	int ret;
> > -
> > -	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > -	if (ret)
> > -		return ret;
> >  
> >  	memcpy(val, ua->base + UCSI_MESSAGE_IN, val_len);
> >  
> > @@ -102,42 +99,6 @@ static const struct ucsi_operations ucsi_acpi_ops = {
> >  	.async_control = ucsi_acpi_async_control
> >  };
> >  
> > -static int
> > -ucsi_zenbook_read_cci(struct ucsi *ucsi, u32 *cci)
> > -{
> > -	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> > -	int ret;
> > -
> > -	if (UCSI_COMMAND(ua->cmd) == UCSI_PPM_RESET) {
> > -		ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > -		if (ret)
> > -			return ret;
> > -	}
> > -
> > -	memcpy(cci, ua->base + UCSI_CCI, sizeof(*cci));
> > -
> > -	return 0;
> > -}
> > -
> > -static int
> > -ucsi_zenbook_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
> > -{
> > -	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> > -
> > -	/* UCSI_MESSAGE_IN is never read for PPM_RESET, return stored data */
> > -	memcpy(val, ua->base + UCSI_MESSAGE_IN, val_len);
> > -
> > -	return 0;
> > -}
> > -
> > -static const struct ucsi_operations ucsi_zenbook_ops = {
> > -	.read_version = ucsi_acpi_read_version,
> > -	.read_cci = ucsi_zenbook_read_cci,
> > -	.read_message_in = ucsi_zenbook_read_message_in,
> > -	.sync_control = ucsi_sync_control_common,
> > -	.async_control = ucsi_acpi_async_control
> > -};
> > -
> >  static int ucsi_gram_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
> >  {
> >  	u16 bogus_change = UCSI_CONSTAT_POWER_LEVEL_CHANGE |
> > @@ -190,13 +151,6 @@ static const struct ucsi_operations ucsi_gram_ops = {
> >  };
> >  
> >  static const struct dmi_system_id ucsi_acpi_quirks[] = {
> > -	{
> > -		.matches = {
> > -			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX325UA_UM325UA"),
> > -		},
> > -		.driver_data = (void *)&ucsi_zenbook_ops,
> > -	},
> >  	{
> >  		.matches = {
> >  			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
> > -- 
> > 2.34.1

Best regards,
Christian


