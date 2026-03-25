Return-Path: <linux-usb+bounces-35427-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDcKHiqLw2nJrQQAu9opvQ
	(envelope-from <linux-usb+bounces-35427-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 08:13:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D14FB3208A1
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 08:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3EEA3109C45
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 07:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF2A3659E1;
	Wed, 25 Mar 2026 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1J8NF0/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08FD364E89;
	Wed, 25 Mar 2026 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774422533; cv=none; b=tc4FfhU4cpYo6mt5o0N8fo1Le9C36Kg7wpmTUf3jLXmXACW4k9fcDmcI8ieMTArp+4LZSdFxP+0C42AwMuQfFQfe7Mugoh1MaQHIP4wKH/CE+2OV/M0JIJkrKDj8TDwh0yMmWBhVGNKvVSRzmUW9uus+cX6lBgizLLFdvcPxtXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774422533; c=relaxed/simple;
	bh=N0A5Pv4zjN4kf+oC/QGUSW/2UEiV0xHj8M380AAM4zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwqSQbQrUYwbhFpayp6iE18nPouMp8pCtjvkoz5Ljcsy63Wv4QZxUjXL+4oKIExQghtqumZvcEtsE+rUddfyLe4GDxkXPzQwo7ys09+8n9oRdS+JfUtWSsVayAWTEWqzvVB6ARwNnh50E1phXXWMjPkt9gy5qy67xQfAT5Mhk9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1J8NF0/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309E7C2BCB6;
	Wed, 25 Mar 2026 07:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774422533;
	bh=N0A5Pv4zjN4kf+oC/QGUSW/2UEiV0xHj8M380AAM4zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1J8NF0/hS2NE7dPMbVPbMr3eGo20+o4atWIpYC+CJ5j4/nFAX5twDCu5VnuGaaRf
	 a/jamaNQrDorCX5Ld288svMGN6U+xwYnz/3lW7VorbTF5EHAJYtIViiNMQki6Lziyk
	 JoHVqE9FERZ/lc0MKeUMl/Rbz/eKPTJZKvnptEX7H3S+otfJuRLVWxZb8inhMnjnP8
	 IQlAjVxlrSZR8zsnptxMcGQ33CRU2Yt2QaFpsijerBzK5AiVzpA7UjSN4VafO5SJr6
	 CPmOcngiGYLacAmbnkByefBFDkSjwyO9wAzEgP+hxYlYT3hR3n/va+AFTfcK6ufA+5
	 pf4B/feg07jig==
Date: Wed, 25 Mar 2026 15:08:49 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] usb: chipidea: core: fix device mode not work in
 non-lpm
Message-ID: <acOKAeNKWT86veM+@nchen-desktop>
References: <20260319095716.634568-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319095716.634568-1-xu.yang_2@nxp.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35427-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: D14FB3208A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-19 17:57:15, Xu Yang wrote:
> In current design, we expect 2 ci_irq() to handle ID and VBUS events in
> usb role switch, like what ci_extcon_wakeup_int() does. Now we only call
> ci_irq() once. However, this won't bring any issues in low power mode,
> because ci_irq() just take the device out of low power mode, and then
> ci_extcon_wakeup_int() will call ci_irq() twice. If the device is not in
> suspend state, the device mode will not work properly because VBUS event
> won'tbe handled (ID event has higher priority) at all.

%s/won'tbe/won't be

Is it possible change ci_irq_handler and handle both events?

> 
> Although 2 consecutive ci_irq() can work around the issue, do not do it
> because ci_usb_role_switch_set() may or not be in low power context which
> make the ci_irq() purpose not unique here. Because the final processing
> is in ci_otg_work(), just directly queue an otg work. This also refine
> the logic for more clarity and not set changed flag.
> 
> Fixes: e1b5d2bed67c ("usb: chipidea: core: handle usb role switch in a common way")
> Cc: stable@vger.kernel.org
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/core.c | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index fac11f20cf0a..1bd231a852a1 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -618,30 +618,22 @@ static int ci_usb_role_switch_set(struct usb_role_switch *sw,
>  	struct ci_hdrc *ci = usb_role_switch_get_drvdata(sw);
>  	struct ci_hdrc_cable *cable;
>  
> -	if (role == USB_ROLE_HOST) {
> -		cable = &ci->platdata->id_extcon;
> -		cable->changed = true;
> +	cable = &ci->platdata->id_extcon;
> +	if (role == USB_ROLE_HOST)
>  		cable->connected = true;
> -		cable = &ci->platdata->vbus_extcon;
> -		cable->changed = true;
> -		cable->connected = false;
> -	} else if (role == USB_ROLE_DEVICE) {
> -		cable = &ci->platdata->id_extcon;
> -		cable->changed = true;
> +	else
>  		cable->connected = false;
> -		cable = &ci->platdata->vbus_extcon;
> -		cable->changed = true;
> +
> +	cable = &ci->platdata->vbus_extcon;
> +	if (role == USB_ROLE_DEVICE)
>  		cable->connected = true;
> -	} else {
> -		cable = &ci->platdata->id_extcon;
> -		cable->changed = true;
> -		cable->connected = false;
> -		cable = &ci->platdata->vbus_extcon;
> -		cable->changed = true;
> +	else
>  		cable->connected = false;
> -	}
>  
> -	ci_irq(ci);
> +	ci->id_event = true;
> +	ci->b_sess_valid_event = true;

Why both ID and VBUS event are set as true unconditionally?

-- 

Best regards,
Peter

