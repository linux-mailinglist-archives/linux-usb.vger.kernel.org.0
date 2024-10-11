Return-Path: <linux-usb+bounces-16090-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA7599A49B
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 15:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D73DB235D2
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 13:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D81421730A;
	Fri, 11 Oct 2024 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ynIPtN6N"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D407820C473
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 13:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652264; cv=none; b=ZGqB0oh4AA0R2YmyGaDq/gaLs0RxXd4BI7IG+lUZk3AMF1UCPHeYQO515kWsBMQ30Up70wuSlWeycpJ9+b+FrpwHxTRMxy2GhXtUqCRxi2vhu6+J5ZAyKBTY0o0sc2i+kNpeSWnVph05DMaZiFJJ//iGqmT4b2/YYkN5qMUsRKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652264; c=relaxed/simple;
	bh=PvM8gAps0rWDIIUHRryECh6RgcLZmUfk1zu00k8nIZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFkdUyZSDDX2u5YU//hsuFKDHo//+QWStuTDvhAT8ziVLDwD9K8/CT4JosLZyXKCP+TS7AwSGr7N3pD1jDjbr/z2MY1H4EIT6d9RF4gU/JDnF7I3EVZ+ed4219Cql41Z0xp4IV2rozMzg3y7PtPRxWAe6yctv5/F8zLXJPeO8bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ynIPtN6N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10044C4CEC3;
	Fri, 11 Oct 2024 13:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728652264;
	bh=PvM8gAps0rWDIIUHRryECh6RgcLZmUfk1zu00k8nIZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ynIPtN6Not3cb3jJwPHVM0XQI8Y207fbJi1Xv01NraKuRT5zoSKQcGnYH0lQSWeXc
	 y50gbI4g+xtmN5JoCx7b3ZMZlWWbSFVp+mXCulzUprTZHxPUudlzRFpHNuZhrIAa8i
	 ZjCcGgGg24OmHMXdqoXmCwuNITMLu5FR28xlxntk=
Date: Fri, 11 Oct 2024 15:11:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/4] usb: typec: ucsi: Add support for the partner USB
 Modes
Message-ID: <2024101142-pastrami-sedan-7dbd@gregkh>
References: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
 <20241011124402.3306994-5-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011124402.3306994-5-heikki.krogerus@linux.intel.com>

On Fri, Oct 11, 2024 at 03:44:02PM +0300, Heikki Krogerus wrote:
> UCSI does not share the contents of the Enter_USB Message
> that was used, so the active mode still has to be always
> determined from the enumerated USB device. However, after
> UCSI v2.0 it is possible to check separately is USB4 the
> active mode.
> 
> So with USB2 and USB3 the mode is always determined from the
> result of the USB enumeration, and when USB4 USB Mode is
> active, UCSI driver can assign the mode directly.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 8 ++++++++
>  drivers/usb/typec/ucsi/ucsi.h | 2 ++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 13c739d334c4..804f7f9b35ea 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1057,6 +1057,14 @@ static int ucsi_register_partner(struct ucsi_connector *con)
>  
>  	con->partner = partner;
>  
> +	if (con->ucsi->version >= UCSI_VERSION_3_0)
> +		if (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
> +		    UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN4)
> +			typec_partner_set_usb_mode(partner, USB_MODE_USB4);
> +	if (con->ucsi->version >= UCSI_VERSION_2_0)
> +		if (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
> +		    UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN3)
> +			typec_partner_set_usb_mode(partner, USB_MODE_USB4);

Will this cause multiple set mode uevents to go out if both of these are
true?

thanks,

greg k-h

