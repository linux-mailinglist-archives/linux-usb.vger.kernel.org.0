Return-Path: <linux-usb+bounces-11431-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA25E90E917
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 13:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B89731C232DF
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 11:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D11139578;
	Wed, 19 Jun 2024 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3TtnQLm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5058A80BF0
	for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 11:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718795673; cv=none; b=Z++oS97AXvmkpDTPf0Vfb1eOGcng8KbB4d6YZn7FCFtFKGIACrLTj6EwALUw5EG/H8T5sUCCg9LucRm9o0P15tTPBX/fwJ5d1yFjNN0/8lSMcg4hQ/tPmVRtnOO8PVICpdgQYiRENbzyl0AMqxLhmORggAs51McKJqhIcDLOs5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718795673; c=relaxed/simple;
	bh=s9SeTYmoXTQdeOWluxrOTooNLDhsWcez8QncRNnMaSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMavgg5NpqKMLBuqwLf8NpW4s9nEtEk/n2NYbw3P771z3+qE6nHfv36O8PVrvTQNz+kuuLgloHetZYbnw6LNTAlpEwV+dCxQ8AV/nUCvw4NwH2ZxRrjDuMN0jGOxaTNOgbD95rJECvMalzw/UxsT01oRF1ICchYpIbzuEGAUwa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3TtnQLm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718795672; x=1750331672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s9SeTYmoXTQdeOWluxrOTooNLDhsWcez8QncRNnMaSQ=;
  b=C3TtnQLm5jzQdy+F2HtTi8iZn8irehmjrBdmqZmxKwjKrv5/OY3NEHCb
   u/mNo4gLs8cz0yjWWMaet0TauF1xQh6gidXJTzsBfsN0D/AEPqQHnSbaS
   CW6Ls/JpyL6Kdp9N3K4jhouOaUeIV38g95ueg54lx3EfKq4Z5q7Zxmn36
   6vTrkjSe1CS+nUd5lqDghyCRAIHInP1NjHF0+LCypOQI241SxUFWrm7HD
   4xy+z3yiiQJEaXGBBrpBu3QnkG1zIszlDnApAQEzvW9fXXZTU4N2Ng0pL
   kezH6si158rSXivehqx6e+XdTr6EiZQ5q3eAiy1owDrjBJCbIPlpsFBaa
   w==;
X-CSE-ConnectionGUID: PnqiBta7SNasY/Q2X/dYFA==
X-CSE-MsgGUID: QggaJ9GtRDCmEXG/QKL0EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33274669"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="33274669"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 04:14:32 -0700
X-CSE-ConnectionGUID: M2j2rQadR1ewgPRbGIlC8Q==
X-CSE-MsgGUID: U0gbNm2hSm671Sd8KdB73A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="46829731"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa005.jf.intel.com with SMTP; 19 Jun 2024 04:14:29 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 19 Jun 2024 14:14:28 +0300
Date: Wed, 19 Jun 2024 14:14:28 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: psy: Add support for the charge
 type property
Message-ID: <ZnK9lA16RRnB0qAL@kuha.fi.intel.com>
References: <20240618081510.2764297-1-heikki.krogerus@linux.intel.com>
 <bd44a37e-ca64-4ab0-81e9-b25d7185fe42@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd44a37e-ca64-4ab0-81e9-b25d7185fe42@amd.com>

On Tue, Jun 18, 2024 at 10:01:21AM -0500, Mario Limonciello wrote:
> On 6/18/2024 03:15, Heikki Krogerus wrote:
> > Adding support for the charge type Linux power supply class
> > property (POWER_SUPPLY_PROP_CHARGE_TYPE) to the UCSI driver.
> > That will make the charge type visible in the charge_type
> > power supply class sysfs attribute file.
> > 
> > UCSI has the charge type specified in the Battery Charging
> > Status field of the response to the GET_CONNECTOR_STATUS
> > command.
> > 
> > Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> > Changed since the last version:
> > The commit message is completely rewritten. The subject line was also changed.
> > 
> > The original patch:
> > https://lore.kernel.org/linux-usb/20240617105554.1677285-1-heikki.krogerus@linux.intel.com/
> > 
> > ---
> >   drivers/usb/typec/ucsi/psy.c  | 27 +++++++++++++++++++++++++++
> >   drivers/usb/typec/ucsi/ucsi.c |  3 +++
> >   2 files changed, 30 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> > index b35c6e07911e..b3910f37e171 100644
> > --- a/drivers/usb/typec/ucsi/psy.c
> > +++ b/drivers/usb/typec/ucsi/psy.c
> > @@ -20,6 +20,7 @@ enum ucsi_psy_online_states {
> >   };
> >   static enum power_supply_property ucsi_psy_props[] = {
> > +	POWER_SUPPLY_PROP_CHARGE_TYPE,
> >   	POWER_SUPPLY_PROP_USB_TYPE,
> >   	POWER_SUPPLY_PROP_ONLINE,
> >   	POWER_SUPPLY_PROP_VOLTAGE_MIN,
> > @@ -194,6 +195,30 @@ static int ucsi_psy_get_usb_type(struct ucsi_connector *con,
> >   	return 0;
> >   }
> > +static int ucsi_psy_get_charge_type(struct ucsi_connector *con, union power_supply_propval *val)
> > +{
> > +	if (!(con->status.flags & UCSI_CONSTAT_CONNECTED) ||
> > +	    (con->status.flags & UCSI_CONSTAT_PWR_DIR) != TYPEC_SINK) {
> > +		val->intval = POWER_SUPPLY_CHARGE_TYPE_NONE;
> 
> The not connected state obviously makes sense for
> POWER_SUPPLY_CHARGE_TYPE_NONE, but what exactly is the other situation? A
> UCSI state machine failure?
> 
> I'm mostly wondering if POWER_SUPPLY_CHARGE_TYPE_UNKNOWN makes sense for
> that or not.

That works for me. I'll change it to POWER_SUPPLY_CHARGE_TYPE_UNKNOWN
in that case.

> Besides this question the patch looks fine to me and you can add my tag with
> your decision.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

thanks,

-- 
heikki

