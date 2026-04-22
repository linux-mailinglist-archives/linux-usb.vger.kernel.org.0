Return-Path: <linux-usb+bounces-36405-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uATGNqwh6GmjFgIAu9opvQ
	(envelope-from <linux-usb+bounces-36405-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 03:17:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF5B4410C2
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 03:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F16B530201AC
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 01:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19ECF27E1A1;
	Wed, 22 Apr 2026 01:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJUD0Fyp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF831D63F0;
	Wed, 22 Apr 2026 01:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820646; cv=none; b=LECv+uHZ5QilGc3q6U3CbI8KblvwPx4sUfLhzP57BHNrBTJoTWlqmy0JzZIOmZaAaPrEHYDCUE4wneeru6usTbt/4ViBdBIf4IvtsqcyLZl+1+jXfFLwcyUm/thZ+5NthnbzGsrSPTxD1FsvoBwCuYqK1WE0MW1Q4brmu3BzBvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820646; c=relaxed/simple;
	bh=YL+ORQbFH9eZ/775xyQgg9X5HjyunGT/EtNkkjjDprg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbEVsiTUJpVv0mooU2K+AEhfxz1rrMwQ97dMJwp3NLog5l++u2kyiqbwOrc2VAmk0iiTA1vEmHl7p6ictxpZc9wqxbVdhSgED6Lg4x69/Zz3+A4qysOQHmib16V6jvNyDeJCXPSzrlyuosLq5IUNsK+YYKg4czKbeR3C/Fp4hcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJUD0Fyp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E06C2BCB0;
	Wed, 22 Apr 2026 01:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776820646;
	bh=YL+ORQbFH9eZ/775xyQgg9X5HjyunGT/EtNkkjjDprg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJUD0FyphzWuhQX7yceEgEEfJj4KugVomDw3InyA8jdutWZYN8wM225F3c19BmBv0
	 rwn5i20zYYvybAr0qpBE0OlW32VEUK/xrF3tyhuZJcPqH8Z3+HkwVEKhoETqw5w3ZF
	 NrkvLGpyr77MdSfJr2A9HWuKn0cFOh8mqO+W+uxZR7p8LepbvH5aIqCRUJYwyEqLTw
	 iEVq2TirjO9lowd5LuToGPhVBaZotIYnQsAfjc2ApjVjCusIsoAw+hnvGCVTMEEtU0
	 Pmt7NGDWvqDHBR5Rsbyr3VrsG+tDrGDEK0i6GV3pQXEyRYWCWNctqI+JkFZwp2YRyn
	 Xv3gVZceJqsZA==
Date: Wed, 22 Apr 2026 09:17:22 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/3] usb: chipidea: udc: add a helper
 ci_udc_enable_vbus_irq()
Message-ID: <aegholg3FV38sLts@nchen-desktop>
References: <20260421082436.1264442-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260421082436.1264442-1-xu.yang_2@nxp.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36405-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 7AF5B4410C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-21 16:24:34, Xu Yang wrote:
> The VBUS interrupt is configured in multiple places, add a helper function
> ci_udc_enable_vbus_irq() to simplify the code.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/udc.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index f2de86d0ce40..d4277d6611ee 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1835,6 +1835,20 @@ static const struct usb_ep_ops usb_ep_ops = {
>   * GADGET block
>   *****************************************************************************/
>  
> +static void ci_udc_enable_vbus_irq(struct ci_hdrc *ci, bool enable)
> +{
> +	u32 reg = OTGSC_BSVIS;
> +
> +	if (!ci->is_otg)
> +		return;
> +
> +	if (enable)
> +		reg |= OTGSC_BSVIE;
> +
> +	/* Clear pending BSVIS and enable/disable BSVIE */
> +	hw_write_otgsc(ci, OTGSC_BSVIE | OTGSC_BSVIS, reg);
> +}
> +
>  static int ci_udc_get_frame(struct usb_gadget *_gadget)
>  {
>  	struct ci_hdrc *ci = container_of(_gadget, struct ci_hdrc, gadget);
> @@ -2352,23 +2366,13 @@ static int udc_id_switch_for_device(struct ci_hdrc *ci)
>  		pinctrl_select_state(ci->platdata->pctl,
>  				     ci->platdata->pins_device);
>  
> -	if (ci->is_otg)
> -		/* Clear and enable BSV irq */
> -		hw_write_otgsc(ci, OTGSC_BSVIS | OTGSC_BSVIE,
> -					OTGSC_BSVIS | OTGSC_BSVIE);
> -
> +	ci_udc_enable_vbus_irq(ci, true);
>  	return 0;
>  }
>  
>  static void udc_id_switch_for_host(struct ci_hdrc *ci)
>  {
> -	/*
> -	 * host doesn't care B_SESSION_VALID event
> -	 * so clear and disable BSV irq
> -	 */
> -	if (ci->is_otg)
> -		hw_write_otgsc(ci, OTGSC_BSVIE | OTGSC_BSVIS, OTGSC_BSVIS);
> -
> +	ci_udc_enable_vbus_irq(ci, false);
>  	ci->vbus_active = 0;
>  
>  	if (ci->platdata->pins_device && ci->platdata->pins_default)
> @@ -2395,9 +2399,7 @@ static void udc_suspend(struct ci_hdrc *ci)
>  static void udc_resume(struct ci_hdrc *ci, bool power_lost)
>  {
>  	if (power_lost) {
> -		if (ci->is_otg)
> -			hw_write_otgsc(ci, OTGSC_BSVIS | OTGSC_BSVIE,
> -					OTGSC_BSVIS | OTGSC_BSVIE);
> +		ci_udc_enable_vbus_irq(ci, true);
>  		if (ci->vbus_active)
>  			usb_gadget_vbus_disconnect(&ci->gadget);
>  	} else if (ci->vbus_active && ci->driver &&
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

