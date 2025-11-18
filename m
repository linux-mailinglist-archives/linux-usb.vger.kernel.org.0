Return-Path: <linux-usb+bounces-30667-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7A0C6AE1E
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 18:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 9F22028F17
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 17:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111D23A1D18;
	Tue, 18 Nov 2025 17:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="uZlfDsTz"
X-Original-To: linux-usb@vger.kernel.org
Received: from l2mail1.panix.com (l2mail1.panix.com [166.84.1.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B8E29ACC0;
	Tue, 18 Nov 2025 17:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485951; cv=none; b=XNTXV/wxVLfCZe2OBTJc7/03dlrF6WfgdtL2DW80Q6X+dNqL9C0n1F8f9cX+Gyje5cINN/Hq3AeVuI6BMAqgNsYyjJN5J+5HW90BivTaAegJRwfLVHWLC/PGf0lOy+T6oWO5wYIU/Zotjo1uRo/2ThmtzILWZH71+jV9NNrez/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485951; c=relaxed/simple;
	bh=Givkw6potYODlMESZS+LtF7ohwR9V3bUu4LAoFvzjx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8Vw0pTRvTlIL7JRyiWFnBCPt5tYh6rYOI97769abgQn47FR59gYCXsG3vpqYyDP8KDLKWgDc1mT3a3OPw+8l4vHZoj/GYdcki1hq/4kpJwl9MmiGkQnnwO0NBEB1/EtJccPRF3jbV8xFkiGszFKjTaPUMddx9G2eSb2Qiz5cfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=uZlfDsTz; arc=none smtp.client-ip=166.84.1.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (1024 bits) server-digest SHA256)
	(No client certificate requested)
	by l2mail1.panix.com (Postfix) with ESMTPS id 4d9rM60XcbzDRB;
	Tue, 18 Nov 2025 11:54:58 -0500 (EST)
Received: from [10.50.4.39] (45-31-46-51.lightspeed.sndgca.sbcglobal.net [45.31.46.51])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4d9rLy3zR4z129J;
	Tue, 18 Nov 2025 11:54:50 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1763484891; bh=Givkw6potYODlMESZS+LtF7ohwR9V3bUu4LAoFvzjx0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=uZlfDsTzz5iYF7oJ44rkwnoNYMprwJzNx2sbjv7dXETAov/dmCkG3koPo8+LmQdau
	 4OR0x5QUpwA8D7JYJm/7t1ErSLE8dcm8MchQJNPfHojcqBkeRK6lE1zyruhjlZjF2Y
	 Eu0e/8eyPVPQFewlQhTUtRfIfgNsMuY0twtmCW70=
Message-ID: <d2fb89c1-a4cb-4d59-93ef-3c462ae0964f@panix.com>
Date: Tue, 18 Nov 2025 08:54:49 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: ucsi: Monitor connector change before getting
 connector status
To: Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kenneth C <kenny@panix.com>, "Mario Limonciello (AMD)" <superm1@kernel.org>
References: <20251117-ucsi-v1-1-1dcbc5ea642b@chromium.org>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20251117-ucsi-v1-1-1dcbc5ea642b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


This patch seems to fix an issue I've had for a while now on my Dell 
XPS-9320 where if I suspend with one Thunderbolt Dock connected and 
resume with another, the machine thinks the previous dock is still 
connected (which means mostly that the new monitor configuration isn't set).

I'm still testing it to see if it does indeed fix my issue, but to at 
least confirm it does what it says on the tin:

Tested-By: Kenneth R. Crudup <kenny@panix.com>

On 11/17/25 01:31, Hsin-Te Yuan wrote:
> Originally, the notification for connector change will be enabled after
> the first read of the connector status. Therefore, if the event happens
> during this window, it will be missing and make the status unsynced.
> 
> Enable the notification for connector change before getting the
> connector status to ensure the status is synced.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
>   drivers/usb/typec/ucsi/ucsi.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 3f568f790f39b0271667e80816270274b8dd3008..07290cd85b618b22cb989151079707dbe9f578a7 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1565,7 +1565,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>   	struct typec_capability *cap = &con->typec_cap;
>   	enum typec_accessory *accessory = cap->accessory;
>   	enum usb_role u_role = USB_ROLE_NONE;
> -	u64 command;
> +	u64 command, ntfy;
>   	char *name;
>   	int ret;
>   
> @@ -1659,6 +1659,15 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>   		goto out;
>   	}
>   
> +	/* Enable the notification for connector change before getting the connector status */
> +	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR | UCSI_ENABLE_NTFY_CONNECTOR_CHANGE;
> +	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
> +	ret = ucsi_send_command(ucsi, command, NULL, 0);
> +	if (ret < 0) {
> +		dev_warn(ucsi->dev, "con%d: failed to enable the notification for connector change\n",
> +			 con->num);
> +	}
> +
>   	/* Get the status */
>   	ret = ucsi_get_connector_status(con, false);
>   	if (ret) {
> 
> ---
> base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
> change-id: 20251117-ucsi-c2dfe8c006d7
> 
> Best regards,

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


