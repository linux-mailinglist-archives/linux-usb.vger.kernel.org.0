Return-Path: <linux-usb+bounces-14260-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC511963BCC
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 08:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFE2BB21D7B
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 06:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98EB158208;
	Thu, 29 Aug 2024 06:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5v9wHjy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ADA647
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 06:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724913817; cv=none; b=oSN9yyY0bYQ676+oGPfHF9LlnFA/YVwL9fdx71U2nTTxgxQ4/Dez7DC4F/kgdjhoiIO8hg34kOYTgI+v6WgfxeFYBkb5MTV4TCAKC1anQzPAdZgBc6floz8KM2ef/8NMSp6uSUKt0QS/gzurXM5PTg4BbEkPH4WrGSC1cVrNLD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724913817; c=relaxed/simple;
	bh=D0UBh8lmD25BhzNxrLT0GAOBpJjLsmm0MDr9A6SNbCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDU7TxfdRPLItxoygpnXeLbcodifaCzDsNsYHWKkIaF44o97cYim0zlZC4dFnv7YPjXcBGzNJV33sXXjNuvjTiYwoAKQlfrOlDnWkCn7fkk0g+Plj70CHQXEJuqcowoBc1JeoUELtHZwcfghsDxcZCED5me4rxSG2aimJWeZWQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5v9wHjy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724913816; x=1756449816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D0UBh8lmD25BhzNxrLT0GAOBpJjLsmm0MDr9A6SNbCo=;
  b=K5v9wHjytQKTrLBAqVwd+EdVI8lHbMFv22rYkvSxkc6gKAbxrUW7S5Hj
   myCRZseX1EDjp38tvVgaIUEUCy6Rpj1jLbu3YS3IobXGrqkMmvJZJ1CIi
   NOEBZ0od7ugaGWxIBY6pWUSrGZSFu84gKlELI2VXgMPsWRTME5dv0Z+QE
   gA8Mr4fdkraPUa7pRA9wNlLaxiIbDFoFyXnZF5t9/+2ZQmZ2q2Kmp3t3t
   nGATKTPQhwBz52MHAKLc/WRsFDBCatcRgjBkz6Hj6Rjra8xmMvh0qEk4s
   sbY/FS3VU7a4r6ssIYFkdKYBySorrUIn2kofWmUcHLZy9fUHDRAas2JWx
   w==;
X-CSE-ConnectionGUID: vBVTePn4SO6FG2Jr9LfTNA==
X-CSE-MsgGUID: UUdunZn8S/OUE+bfRDjFHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23650780"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="23650780"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 23:43:35 -0700
X-CSE-ConnectionGUID: /zgs5dO8QluVkwavck2e+A==
X-CSE-MsgGUID: 1v82r66uS2WSaaokYbo1fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63111240"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa006.fm.intel.com with SMTP; 28 Aug 2024 23:43:32 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 29 Aug 2024 09:43:31 +0300
Date: Thu, 29 Aug 2024 09:43:31 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Bartosz Szpila <bszpila@google.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH 3/3] usb: typec: ucsi: Helpers for new
 GET_CONNECTOR_STATUS fields
Message-ID: <ZtAYk27n/zt9EH+1@kuha.fi.intel.com>
References: <20240828161502.2774996-1-heikki.krogerus@linux.intel.com>
 <20240828161502.2774996-4-heikki.krogerus@linux.intel.com>
 <SJ0PR11MB5770FF121048EC303BCE37BA8F952@SJ0PR11MB5770.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR11MB5770FF121048EC303BCE37BA8F952@SJ0PR11MB5770.namprd11.prod.outlook.com>

On Wed, Aug 28, 2024 at 11:54:32PM +0000, Pilla, Siva sai kumar wrote:
> > 
> > UCSI v2 introduced new fields to GET_CONNECTOR_STATUS.
> > Adding a helper for each field. The helpers check that the
> > UCSI version is v2 or above.
> 
> I believe this approach helps us from ensuring new fields are only used in supported versions.
> 
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.h | 66 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> > index dfbc0f6c1b9b..adcbfc96dfcf 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.h
> > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > @@ -524,4 +524,70 @@ static inline void ucsi_debugfs_unregister(struct ucsi *ucsi) { }
> >  #define USB_TYPEC_NVIDIA_VLINK_DP_VDO	0x1
> >  #define USB_TYPEC_NVIDIA_VLINK_DBG_VDO	0x3
> > 
> > +/* -------------------------------------------------------------------------- */
> > +
> > +static inline enum typec_orientation ucsi_orientation(struct ucsi_connector *con)
> > +{
> > +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +		return TYPEC_ORIENTATION_NONE;
> > +	return UCSI_FIELD(con->status, 86, 1) ? TYPEC_ORIENTATION_REVERSE :
> > +						TYPEC_ORIENTATION_NORMAL;
> > +}
> > +
> > +static inline int ucsi_sink_path_status(struct ucsi_connector *con)
> > +{
> > +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +		return -EINVAL;
> > +	return UCSI_FIELD(con->status, 87, 1);
> > +}
> > +
> > +static inline int ucsi_reverse_current_protection_status(struct ucsi_connector *con)
> > +{
> > +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +		return -EINVAL;
> > +	return UCSI_FIELD(con->status, 88, 1);
> > +}
> > +
> 
> I think the below fields are supported from UCSI v2.1 onwards. Can you please perform version check accordingly.

Good catch!

thanks,

> > +static inline int ucsi_power_reading_ready(struct ucsi_connector *con)
> > +{
> > +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +		return -EINVAL;
> > +	return UCSI_FIELD(con->status, 89, 1);
> > +}
> > +
> > +static inline int ucsi_current_scale(struct ucsi_connector *con)
> > +{
> > +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +		return -EINVAL;
> > +	return UCSI_FIELD(con->status, 90, 3) * 5; /* mA */
> > +}
> > +
> > +static inline int ucsi_peak_current(struct ucsi_connector *con)
> > +{
> > +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +		return -EINVAL;
> > +	return UCSI_FIELD(con->status, 93, 16);
> > +}
> > +
> > +static inline int ucsi_average_current(struct ucsi_connector *con)
> > +{
> > +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +		return -EINVAL;
> > +	return UCSI_FIELD(con->status, 109, 16);
> > +}
> > +
> > +static inline int ucsi_voltage_scale(struct ucsi_connector *con)
> > +{
> > +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +		return -EINVAL;
> > +	return UCSI_FIELD(con->status, 125, 4) * 5; /* mV */
> > +}
> > +
> > +static inline int ucsi_voltage_reading(struct ucsi_connector *con)
> > +{
> > +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +		return -EINVAL;
> > +	return UCSI_FIELD(con->status, 129, 16);
> > +}
> > +
> >  #endif /* __DRIVER_USB_TYPEC_UCSI_H */

-- 
heikki

