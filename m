Return-Path: <linux-usb+bounces-14346-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF8965B05
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 10:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5E12284477
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 08:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07D616DED8;
	Fri, 30 Aug 2024 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOh77aJh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B6816F0DB
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007546; cv=none; b=k7mx5uHMCZMmCZFW8HowLuyOkdj3S+GbxUgJdcowUZyiWzhLX3qVdKDDHRZtFhw349bmyh9kpW6JiHN4tsNk9frAP0CbnZzmBWxLdI+9+QjDn3PcVXUMkxq0lNIir1S02zAxiS11rIz3TbDy1KmnUA8EA68UC58JXdt1LI+Jfmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007546; c=relaxed/simple;
	bh=xTYrRpNPdqXbZHwHfi0vj/wL8/ingS47xsDc142HZhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oX261qh68FR6HwGvOFaMWjEd3HBbeez+bsHedbzshJGHiGV1rUsWrUYfWc4OKdeBm9WZQ32rfL2rkDR0t6uafQctFtH63KxeFNb8gT07FeCAbNlRn8BlG3sQGQCc04shfkRyVwr3FutKP5VawuTxr9uJ8n3c7AZmnxwbWXGOl6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOh77aJh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725007545; x=1756543545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xTYrRpNPdqXbZHwHfi0vj/wL8/ingS47xsDc142HZhQ=;
  b=WOh77aJheADVSPudvzdjZDtb84x7YA4WDqT9jv9mrjogkBeGDUrOSwR0
   HtmOKgIVeUX5eR9W1YKkxKSshycEEY5t6yHcQUUbM7X2HYBYv5RvXRBpo
   91UlvQsUMbY6phEjcGn0HVQCqu3dMOUiS+5fGtbv8A+VhwBhCYIJVgeHG
   nfms4AgfN8VFLouO70aBlSUaqaAZLsYweSn8cbQvA7/g46lxjtr3hubVF
   51fuEuII6V083XmuJbm51/DcBaG4i4+MnNMe2ZWODbknW1JTSDIO2qjHX
   6cle14NK3ahQFCvtrbOcS0dmH4F+d02+ih5Kui87P4ThcpQw3ru5j8UF/
   g==;
X-CSE-ConnectionGUID: ZX4fNZvFTg2ScfcV+F/ijQ==
X-CSE-MsgGUID: n59v0w0YQ2ebq/WDGHoamw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34210660"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34210660"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:44:37 -0700
X-CSE-ConnectionGUID: nJCl+4TWTYmqHTe0gqUxJA==
X-CSE-MsgGUID: UT4E8C8EQ2u9riABCpLifg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="64577610"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa008.jf.intel.com with SMTP; 30 Aug 2024 01:44:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 30 Aug 2024 11:44:33 +0300
Date: Fri, 30 Aug 2024 11:44:33 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Saranya Gopal <saranya.gopal@intel.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	rajaram.regupathy@intel.com
Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method for UCSI
 read operations
Message-ID: <ZtGGcRpavSITFai7@kuha.fi.intel.com>
References: <20240830084342.460109-1-saranya.gopal@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830084342.460109-1-saranya.gopal@intel.com>

On Fri, Aug 30, 2024 at 02:13:42PM +0530, Saranya Gopal wrote:
> ACPI _DSM methods are needed only for UCSI write operations and for reading
> CCI during RESET_PPM operation. So, remove _DSM calls from other places.
> While there, remove the Zenbook quirk also since the default behavior
> now aligns with the Zenbook quirk. With this change, GET_CONNECTOR_STATUS
> returns at least 6 seconds faster than before in Arrowlake-S platforms.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>

Maybe this should be marked as a fix. I think this covers:
https://lore.kernel.org/linux-usb/20240829100109.562429-2-lk@c--e.de/

Christian, can you check this?

thanks,

> ---
>  drivers/usb/typec/ucsi/ucsi_acpi.c | 56 +++---------------------------
>  1 file changed, 5 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 7a5dff8d9cc6..accf15ff1306 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -61,9 +61,11 @@ static int ucsi_acpi_read_cci(struct ucsi *ucsi, u32 *cci)
>  	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
>  	int ret;
>  
> -	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> -	if (ret)
> -		return ret;
> +	if (UCSI_COMMAND(ua->cmd) == UCSI_PPM_RESET) {
> +		ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	memcpy(cci, ua->base + UCSI_CCI, sizeof(*cci));
>  
> @@ -73,11 +75,6 @@ static int ucsi_acpi_read_cci(struct ucsi *ucsi, u32 *cci)
>  static int ucsi_acpi_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
>  {
>  	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> -	int ret;
> -
> -	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> -	if (ret)
> -		return ret;
>  
>  	memcpy(val, ua->base + UCSI_MESSAGE_IN, val_len);
>  
> @@ -102,42 +99,6 @@ static const struct ucsi_operations ucsi_acpi_ops = {
>  	.async_control = ucsi_acpi_async_control
>  };
>  
> -static int
> -ucsi_zenbook_read_cci(struct ucsi *ucsi, u32 *cci)
> -{
> -	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> -	int ret;
> -
> -	if (UCSI_COMMAND(ua->cmd) == UCSI_PPM_RESET) {
> -		ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	memcpy(cci, ua->base + UCSI_CCI, sizeof(*cci));
> -
> -	return 0;
> -}
> -
> -static int
> -ucsi_zenbook_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
> -{
> -	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> -
> -	/* UCSI_MESSAGE_IN is never read for PPM_RESET, return stored data */
> -	memcpy(val, ua->base + UCSI_MESSAGE_IN, val_len);
> -
> -	return 0;
> -}
> -
> -static const struct ucsi_operations ucsi_zenbook_ops = {
> -	.read_version = ucsi_acpi_read_version,
> -	.read_cci = ucsi_zenbook_read_cci,
> -	.read_message_in = ucsi_zenbook_read_message_in,
> -	.sync_control = ucsi_sync_control_common,
> -	.async_control = ucsi_acpi_async_control
> -};
> -
>  static int ucsi_gram_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
>  {
>  	u16 bogus_change = UCSI_CONSTAT_POWER_LEVEL_CHANGE |
> @@ -190,13 +151,6 @@ static const struct ucsi_operations ucsi_gram_ops = {
>  };
>  
>  static const struct dmi_system_id ucsi_acpi_quirks[] = {
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX325UA_UM325UA"),
> -		},
> -		.driver_data = (void *)&ucsi_zenbook_ops,
> -	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
> -- 
> 2.34.1

-- 
heikki

