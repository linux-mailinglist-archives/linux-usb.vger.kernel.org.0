Return-Path: <linux-usb+bounces-31199-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BC7CA6361
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 07:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2EEE33020A8D
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 06:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACBF2D24B6;
	Fri,  5 Dec 2025 06:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ACjtNkSR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080FF2561AE;
	Fri,  5 Dec 2025 06:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764915363; cv=none; b=IpqTOyCFI/rtqP7eZzhoMA9LA/F75p79Am/OESbZdFUzXIUbV8FGamSvjTQYFtOmWawUIu2dStPd1XWWUSbpP8RBFuMZ1Z0rkw1p24W2ZtLL/+SrZqBjDcI8pzoGw2Ay0GJU+iVQkHE9I608UoKuNETgKrCG7XBp5wp4QY/p2Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764915363; c=relaxed/simple;
	bh=BQo/sTOSjpqeuo5+UW7owNjnBN05STiydPECk1ZwfPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4F9/csarGS6lXDGOPpYlZwupNxFeCSm/pltVdjMgfLH/DCXHcJG0OAYau27yw6F1nlG1RigA3q8DGHa2ymtEK6ZDvgmcg+n4eebWG+d5MgW0KObqoa1dagd63zvsFu+fiO3JBDVI1QTc8nYbVJEdKc5siV358tlxfPQAOQsn/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ACjtNkSR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E76FC4CEF1;
	Fri,  5 Dec 2025 06:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764915362;
	bh=BQo/sTOSjpqeuo5+UW7owNjnBN05STiydPECk1ZwfPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ACjtNkSRo2CkYF6DbclLzwp6YVKSnezn2GH/YA3TezdtezbVe7XAnk9XWMYx7mcZs
	 L14UqH7/n68MHbQEGwweg9jAFCzGpofhb6Odt9atd+SS3S5dLfgled4QXynMsEqHB9
	 LrqAzBChJXcdF4ug8i9bvjaNjA+Icll6fTVP7vk4=
Date: Fri, 5 Dec 2025 07:15:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] usb: typec: ucsi: Get connector status after enable
 notifications
Message-ID: <2025120549-squealing-starry-4609@gregkh>
References: <20251205-ucsi-v5-1-488eb89bc9b8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-ucsi-v5-1-488eb89bc9b8@chromium.org>

On Fri, Dec 05, 2025 at 01:50:10PM +0800, Hsin-Te Yuan wrote:
> Originally, the notification for connector change will be enabled after
> the first read of the connector status. Therefore, if the event happens
> during this window, it will be missing and make the status unsynced.
> 
> Get the connector status only after enabling the notification for
> connector change to ensure the status is synced.
> 
> Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
> Changes in v5:
> - Hold the lock of each connector during the initialization to avoid
>   race condition between initialization and other event handler
> - Add Fixes tag
> - Link to v4: https://lore.kernel.org/r/20251125-ucsi-v4-1-8c94568ddaa5@chromium.org
> 
> Changes in v4:
> - Handle a single connector in ucsi_init_port() and call it in a loop
> - Link to v3: https://lore.kernel.org/r/20251121-ucsi-v3-1-b1047ca371b8@chromium.org
> 
> Changes in v3:
> - Seperate the status checking part into a new function called
>   ucsi_init_port() and call it after enabling the notifications
> - Link to v2: https://lore.kernel.org/r/20251118-ucsi-v2-1-d314d50333e2@chromium.org
> 
> Changes in v2:
> - Remove unnecessary braces.
> - Link to v1: https://lore.kernel.org/r/20251117-ucsi-v1-1-1dcbc5ea642b@chromium.org
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 126 +++++++++++++++++++++++-------------------
>  1 file changed, 69 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 3f568f790f39b0271667e80816270274b8dd3008..9073b005c5ba92fcb6ed1fdf7dd65090832c7058 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1560,11 +1560,70 @@ static struct fwnode_handle *ucsi_find_fwnode(struct ucsi_connector *con)
>  	return NULL;
>  }
>  
> +static void ucsi_init_port(struct ucsi *ucsi, struct ucsi_connector *con)
> +{
> +	enum usb_role u_role = USB_ROLE_NONE;
> +	int ret;
> +
> +	/* Get the status */
> +	ret = ucsi_get_connector_status(con, false);
> +	if (ret) {
> +		dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
> +		return;
> +	}
> +
> +	if (ucsi->ops->connector_status)
> +		ucsi->ops->connector_status(con);
> +
> +	switch (UCSI_CONSTAT(con, PARTNER_TYPE)) {
> +	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
> +	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
> +		u_role = USB_ROLE_HOST;
> +		fallthrough;
> +	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
> +		typec_set_data_role(con->port, TYPEC_HOST);
> +		break;
> +	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
> +		u_role = USB_ROLE_DEVICE;
> +		typec_set_data_role(con->port, TYPEC_DEVICE);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	/* Check if there is already something connected */
> +	if (UCSI_CONSTAT(con, CONNECTED)) {
> +		typec_set_pwr_role(con->port, UCSI_CONSTAT(con, PWR_DIR));
> +		ucsi_register_partner(con);
> +		ucsi_pwr_opmode_change(con);
> +		ucsi_port_psy_changed(con);
> +		if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> +			ucsi_get_partner_identity(con);
> +		if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETAILS)
> +			ucsi_check_cable(con);
> +	}
> +
> +	/* Only notify USB controller if partner supports USB data */
> +	if (!(UCSI_CONSTAT(con, PARTNER_FLAG_USB)))
> +		u_role = USB_ROLE_NONE;
> +
> +	ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
> +	if (ret)
> +		dev_err(ucsi->dev, "con:%d: failed to set usb role:%d\n",
> +			con->num, u_role);
> +
> +	if (con->partner && UCSI_CONSTAT(con, PWR_OPMODE) == UCSI_CONSTAT_PWR_OPMODE_PD) {
> +		ucsi_register_device_pdos(con);
> +		ucsi_get_src_pdos(con);
> +		ucsi_check_altmodes(con);
> +		ucsi_check_connector_capability(con);
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
> @@ -1659,62 +1718,6 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
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
> @@ -1823,6 +1826,10 @@ static int ucsi_init(struct ucsi *ucsi)
>  			goto err_unregister;
>  	}
>  
> +	/* Delay other interactions with each connector until ucsi_init_port is done */
> +	for (i = 0; i < ucsi->cap.num_connectors; i++)
> +		mutex_lock(&connector[i].lock);
> +
>  	/* Enable all supported notifications */
>  	ntfy = ucsi_get_supported_notifications(ucsi);
>  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
> @@ -1833,6 +1840,11 @@ static int ucsi_init(struct ucsi *ucsi)
>  	ucsi->connector = connector;
>  	ucsi->ntfy = ntfy;
>  
> +	for (i = 0; i < ucsi->cap.num_connectors; i++) {
> +		ucsi_init_port(ucsi, &connector[i]);
> +		mutex_unlock(&connector[i].lock);
> +	}
> +
>  	mutex_lock(&ucsi->ppm_lock);
>  	ret = ucsi->ops->read_cci(ucsi, &cci);
>  	mutex_unlock(&ucsi->ppm_lock);
> 
> ---
> base-commit: 2061f18ad76ecaddf8ed17df81b8611ea88dbddd
> change-id: 20251117-ucsi-c2dfe8c006d7
> 
> Best regards,
> -- 
> Hsin-Te Yuan <yuanhsinte@chromium.org>
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

