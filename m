Return-Path: <linux-usb+bounces-34576-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INi9MHeAsWmjCwAAu9opvQ
	(envelope-from <linux-usb+bounces-34576-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:47:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C84C265A9D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0567430C5B63
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FDB3CCFB1;
	Wed, 11 Mar 2026 14:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gP1PXIM0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E21E40DFAC;
	Wed, 11 Mar 2026 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240223; cv=none; b=KTQytSJIlXHvLZ7wAaqs2yri0CzkL3PPA08bLOahD/RNc69kGmYjdjGhrcHZ1zRYYGrQrQxv0t/bPh8j58r+yRzpSZnhmimAeqgKw/WwfCtLIAby2+G67xIXvlKlGwDn06emeqIN2CRqIUhumeGja/2OSo2QLkkWRr4/pWnLXq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240223; c=relaxed/simple;
	bh=MSVUenRDXN15K2mal5/pndRJ5xNIncihXkLIyKsl4rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZcR7pH9w1KlVxmAj7vokN+fOAAYagUpAEaUpfTa2nCaS14ilnjSDZME3r187dN/0sPTDQS/5/OTIGUSusmxHc9EQ4eJO4Zbx2CzKD5GWXUJCeqvxk5VYvVgN8KkaWhbuRuRmeHg6y4tU5qSENQtQm2/HLrYrxfBXJrfL00Y1tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gP1PXIM0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2EEC19421;
	Wed, 11 Mar 2026 14:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773240222;
	bh=MSVUenRDXN15K2mal5/pndRJ5xNIncihXkLIyKsl4rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gP1PXIM014erjsn0JHLUGf4WhtMJuJoPsT8CFgqmvuPnWX6pkPMELpKVbtz+h6Y9N
	 59HXocKN2v5hgIv9Ey2NOAFJCXNOAALuTRQ1XE+DLGwnBHuFdrrNwQUByITOVNShpa
	 Bhl25ac2hkIAUh16lFhbTB2+Eu/Qqgf3OsUYffdM=
Date: Wed, 11 Mar 2026 15:43:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v5 1/4] usb: port: track the disabled state
Message-ID: <2026031105-uptake-glucose-5b61@gregkh>
References: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
 <20260223-v6-16-topic-usb-onboard-dev-v5-1-28d3018a8026@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-v6-16-topic-usb-onboard-dev-v5-1-28d3018a8026@pengutronix.de>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34576-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,chromium.org,vger.kernel.org,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email]
X-Rspamd-Queue-Id: 4C84C265A9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Feb 23, 2026 at 12:27:34PM +0100, Marco Felsch wrote:
> The disable state isn't tracked at the moment, instead the state is
> directly passed to the hub driver. Change this behavior to only trigger
> the hub if a state change happened. Exit early in case of no state
> changes but don't return an error.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/usb/core/hub.h  | 2 ++
>  drivers/usb/core/port.c | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index 9ebc5ef54a325d63e01b0deb59a1853d2b13c8d5..297adf2c6078809ca582104f228e5222c464f999 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -97,6 +97,7 @@ struct usb_hub {
>   * @usb3_lpm_u2_permit: whether USB3 U2 LPM is permitted.
>   * @early_stop: whether port initialization will be stopped earlier.
>   * @ignore_event: whether events of the port are ignored.
> + * @disabled: whether the port is disabled
>   */
>  struct usb_port {
>  	struct usb_device *child;
> @@ -118,6 +119,7 @@ struct usb_port {
>  	unsigned int is_superspeed:1;
>  	unsigned int usb3_lpm_u1_permit:1;
>  	unsigned int usb3_lpm_u2_permit:1;
> +	unsigned int disabled:1;
>  };
>  
>  #define to_usb_port(_dev) \
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index 44e38f922bc553adee64b35c536dfd4154a42d8a..86e9d6d0c0f505782569565fde8e4a46b06b8b4d 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -117,6 +117,10 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
>  	if (rc)
>  		return rc;
>  
> +	/* Early quit if no change was detected */
> +	if (port_dev->disabled == disabled)
> +		return count;
> +

This will change behavior where someone tells the port to be enabled
again, when it already is.  Is that ok?

thanks,

greg k-h

