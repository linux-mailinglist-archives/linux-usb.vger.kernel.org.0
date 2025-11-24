Return-Path: <linux-usb+bounces-30857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E7CC7FCBD
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 11:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05A723A152E
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 10:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D940126F445;
	Mon, 24 Nov 2025 10:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lhzm1Emb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7704626A0D5;
	Mon, 24 Nov 2025 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763978512; cv=none; b=Yiy2QFMDjAsgD/3aBkJzp3bBfjLDs7ATXThmW9CkKDooRMTfGP+mIOlXqmw/CeSJmLj1mTLIZyqr3FAdlxAkGi4fIQ1qg0f0wxuysAcWRYA2bIHgUazxqCQ7LSWwb5VrSmkOO+OiAs5R/dbOhOx+02qmcmxe46PxZHHvmz4JHyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763978512; c=relaxed/simple;
	bh=Dwck+xGAVw0BrxsyYJqn4Ur+wm+JqZ0kFldEVQeTNXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QM/Iw1rgfvmLUe6iM11hY5yZctyyOtQKEm0JFaYA2UigQ04De6Go7oPTqdp+HmXoi7nzii2frNrme4Zse8Hna0dAmIeSNY7Cxl+dKyIcCGd+/adIVK/sEnziC05CO/kdl3qMFWym9/F1OBwgj1szXQEWjgOdWTnWCzAkXE2My8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lhzm1Emb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763978511; x=1795514511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dwck+xGAVw0BrxsyYJqn4Ur+wm+JqZ0kFldEVQeTNXw=;
  b=Lhzm1Embvz+8qjnPwer4/Gv88Ets5muoUCDD3r/DromWED5r8uIsZxF/
   Yaa1fKHlOR9TRvzVwh+Bf1STaXZ3xQ6GgO49SVPmVmHaeexb6O9Y7O0nQ
   09/zKAT/1/8FW0d90cz0hJGT2KTTH5rP+ndIX2ijwjH9DtwTQHd+aFO0E
   u5QWepn1EC4aLFvXlU0womADwcOsXayij7U3qrtoR9+PlA8zuIXQjgTeN
   dtBdo+aso54a021bK5c16xc5CPYqUiY5gvgD/nus5ENfkjNBU6uVyU0u/
   e1y52J7C4K7zqbQhhjnIsBwqm4nMz2KG3wL/OvE4yaFXXgR2ONQa/sPH5
   w==;
X-CSE-ConnectionGUID: e2HLyGwgQ7GJ+DsrjvPUiQ==
X-CSE-MsgGUID: ByUh48DrTCyKC5sZ8vm+Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="66051473"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="66051473"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 02:01:50 -0800
X-CSE-ConnectionGUID: eRbPRPU9QGC48JAavhzLiA==
X-CSE-MsgGUID: /v1twgNySkKcEpoHVBOE7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192757754"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha) ([10.124.222.127])
  by fmviesa009.fm.intel.com with SMTP; 24 Nov 2025 02:01:47 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 24 Nov 2025 12:01:42 +0200
Date: Mon, 24 Nov 2025 12:01:42 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: typec: ucsi: Get connector status after enable
 notifications
Message-ID: <aSQtBhxw5KjR-ySZ@kuha>
References: <20251121-ucsi-v3-1-b1047ca371b8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-ucsi-v3-1-b1047ca371b8@chromium.org>

Fri, Nov 21, 2025 at 08:33:48PM +0800, Hsin-Te Yuan kirjoitti:
> Originally, the notification for connector change will be enabled after
> the first read of the connector status. Therefore, if the event happens
> during this window, it will be missing and make the status unsynced.
> 
> Get the connector status only after enabling the notification for
> conenctor change to ensure the status is synced.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
> Changes in v3:
> - Seperate the status checking part into a new function called
>   ucsi_init_port() and call it after enabling the notifications
> - Link to v2: https://lore.kernel.org/r/20251118-ucsi-v2-1-d314d50333e2@chromium.org
> 
> Changes in v2:
> - Remove unnecessary braces.
> - Link to v1: https://lore.kernel.org/r/20251117-ucsi-v1-1-1dcbc5ea642b@chromium.org
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 124 +++++++++++++++++++++++-------------------
>  1 file changed, 67 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 3f568f790f39b0271667e80816270274b8dd3008..fbda94bfd5ed12ad8cfaedceb47ad15fee271378 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1560,11 +1560,75 @@ static struct fwnode_handle *ucsi_find_fwnode(struct ucsi_connector *con)
>  	return NULL;
>  }
>  
> +static void ucsi_init_port(struct ucsi *ucsi)
> +{
> +	enum usb_role u_role;
> +	int ret, i;
> +	struct ucsi_connector *con;
> +
> +	for (i = 0; i < ucsi->cap.num_connectors; i++) {

I would prefer that we handle a single connector in this function.
Just call it in a loop. That way we may be able to reuse this if
needed.

But if you still prefer it like this, then at least rename it to
ucsi_init_ports (so plural).

thanks,

> +		u_role = USB_ROLE_NONE;
> +		con = &ucsi->connector[i];
> +		/* Get the status */
> +		ret = ucsi_get_connector_status(con, false);
> +		if (ret) {
> +			dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
> +			continue;
> +		}
> +
> +		if (ucsi->ops->connector_status)
> +			ucsi->ops->connector_status(con);
> +
> +		switch (UCSI_CONSTAT(con, PARTNER_TYPE)) {
> +		case UCSI_CONSTAT_PARTNER_TYPE_UFP:
> +		case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
> +			u_role = USB_ROLE_HOST;
> +			fallthrough;
> +		case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
> +			typec_set_data_role(con->port, TYPEC_HOST);
> +			break;
> +		case UCSI_CONSTAT_PARTNER_TYPE_DFP:
> +			u_role = USB_ROLE_DEVICE;
> +			typec_set_data_role(con->port, TYPEC_DEVICE);
> +			break;
> +		default:
> +			break;
> +		}
> +
> +		/* Check if there is already something connected */
> +		if (UCSI_CONSTAT(con, CONNECTED)) {
> +			typec_set_pwr_role(con->port, UCSI_CONSTAT(con, PWR_DIR));
> +			ucsi_register_partner(con);
> +			ucsi_pwr_opmode_change(con);
> +			ucsi_port_psy_changed(con);
> +			if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> +				ucsi_get_partner_identity(con);
> +			if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETAILS)
> +				ucsi_check_cable(con);
> +		}
> +
> +		/* Only notify USB controller if partner supports USB data */
> +		if (!(UCSI_CONSTAT(con, PARTNER_FLAG_USB)))
> +			u_role = USB_ROLE_NONE;
> +
> +		ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
> +		if (ret)
> +			dev_err(ucsi->dev, "con:%d: failed to set usb role:%d\n",
> +				con->num, u_role);
> +
> +		if (con->partner && UCSI_CONSTAT(con, PWR_OPMODE) == UCSI_CONSTAT_PWR_OPMODE_PD) {
> +			ucsi_register_device_pdos(con);
> +			ucsi_get_src_pdos(con);
> +			ucsi_check_altmodes(con);
> +			ucsi_check_connector_capability(con);
> +		}
> +	}
> +}
> +
>  static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  {
>  	struct typec_capability *cap = &con->typec_cap;
>  	enum typec_accessory *accessory = cap->accessory;
> -	enum usb_role u_role = USB_ROLE_NONE;
>  	u64 command;
>  	char *name;
>  	int ret;
> @@ -1659,62 +1723,6 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  		goto out;
>  	}
>  
> -	/* Get the status */
> -	ret = ucsi_get_connector_status(con, false);
> -	if (ret) {
> -		dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
> -		goto out;
> -	}
> -
> -	if (ucsi->ops->connector_status)
> -		ucsi->ops->connector_status(con);
> -
> -	switch (UCSI_CONSTAT(con, PARTNER_TYPE)) {
> -	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
> -	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
> -		u_role = USB_ROLE_HOST;
> -		fallthrough;
> -	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
> -		typec_set_data_role(con->port, TYPEC_HOST);
> -		break;
> -	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
> -		u_role = USB_ROLE_DEVICE;
> -		typec_set_data_role(con->port, TYPEC_DEVICE);
> -		break;
> -	default:
> -		break;
> -	}
> -
> -	/* Check if there is already something connected */
> -	if (UCSI_CONSTAT(con, CONNECTED)) {
> -		typec_set_pwr_role(con->port, UCSI_CONSTAT(con, PWR_DIR));
> -		ucsi_register_partner(con);
> -		ucsi_pwr_opmode_change(con);
> -		ucsi_port_psy_changed(con);
> -		if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> -			ucsi_get_partner_identity(con);
> -		if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETAILS)
> -			ucsi_check_cable(con);
> -	}
> -
> -	/* Only notify USB controller if partner supports USB data */
> -	if (!(UCSI_CONSTAT(con, PARTNER_FLAG_USB)))
> -		u_role = USB_ROLE_NONE;
> -
> -	ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
> -	if (ret) {
> -		dev_err(ucsi->dev, "con:%d: failed to set usb role:%d\n",
> -			con->num, u_role);
> -		ret = 0;
> -	}
> -
> -	if (con->partner && UCSI_CONSTAT(con, PWR_OPMODE) == UCSI_CONSTAT_PWR_OPMODE_PD) {
> -		ucsi_register_device_pdos(con);
> -		ucsi_get_src_pdos(con);
> -		ucsi_check_altmodes(con);
> -		ucsi_check_connector_capability(con);
> -	}
> -
>  	trace_ucsi_register_port(con->num, con);
>  
>  out:
> @@ -1833,6 +1841,8 @@ static int ucsi_init(struct ucsi *ucsi)
>  	ucsi->connector = connector;
>  	ucsi->ntfy = ntfy;
>  
> +	ucsi_init_port(ucsi);
> +
>  	mutex_lock(&ucsi->ppm_lock);
>  	ret = ucsi->ops->read_cci(ucsi, &cci);
>  	mutex_unlock(&ucsi->ppm_lock);
> 
> ---
> base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
> change-id: 20251117-ucsi-c2dfe8c006d7
> 
> Best regards,
> -- 
> Hsin-Te Yuan <yuanhsinte@chromium.org>

-- 
heikki

