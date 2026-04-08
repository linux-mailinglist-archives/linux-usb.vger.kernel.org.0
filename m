Return-Path: <linux-usb+bounces-36066-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CbxKTDq1Wkd/QcAu9opvQ
	(envelope-from <linux-usb+bounces-36066-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 07:40:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AB03B7437
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 07:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D86E7302CD3E
	for <lists+linux-usb@lfdr.de>; Wed,  8 Apr 2026 05:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F9335B14B;
	Wed,  8 Apr 2026 05:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1vhyp2o"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4B33BB4A;
	Wed,  8 Apr 2026 05:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775626797; cv=none; b=l7VMW+hmvmc3Q+dCl+XzUHbm1kfBn2vwFSoNKHLJUFP0ZwfvnAIgROC7p0h3j07N4HusSjxQFD1f9glY3oVFPBQOBY8HKndayLmihdggf+pEcK42QqqU6IH89dDYwavJF7cPbGfE8sZS2z0rfHfbHTt60Ez3Lod5Bok1RnW71cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775626797; c=relaxed/simple;
	bh=rgJFHOxEGo4+U2jXU9aKdwhcY6XIbrorwAM1xHnqhcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iD6Nqoi+FqMWA5rfDhnnLVakoGmOf2p5Cnb1X23aya5n+hqYstpPEEKYmAcRILnzJCYc7dVKuX0oQG1/vDbt8YMVEfoIRdyeHUw8eFGvXbGAtKp37CR5Gfx1RWTH4s3PB96L4ZWikKYJQQpacszx7f1rF3Y4J95khfYOCgqHwWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1vhyp2o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AED1C19424;
	Wed,  8 Apr 2026 05:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775626796;
	bh=rgJFHOxEGo4+U2jXU9aKdwhcY6XIbrorwAM1xHnqhcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1vhyp2oS6tiZVzRfDg2ry+TtZ3zeEuvokHY+NaJj4VArKbBWzLo5w64Bmk6ZKAl8
	 Ad36A9lAvU/K4eEXCE4WOpNcrZ878qkyYPCFl42BkW2vgrLAS2E1k/5ePEFmQUmtvq
	 PSrS5vsNNZwnRQJ0krftyce9bLFKFov+njTFq6zXBu3X+h9MhKL1VRt5NmeleFFH1e
	 ctpR4i6jBgP3XDFFN215rxuapuToqYs6qkpdsL2eNYoV24ciZTsVdASX0fkE19emDc
	 NAzIVdXJdXBcOwij/JUlnkjXu+r1FqTTK+0rtNx+GDHXDLfcwvNT1Xz6wDJubHveUm
	 /6kAzvzN0LyaQ==
Date: Wed, 8 Apr 2026 13:39:52 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 2/3] usb: chipidea: core: allow ci_irq_handler()
 handle both ID and VBUS change
Message-ID: <adXqKIri+bFwIbwt@nchen-desktop>
References: <20260402071457.2516021-1-xu.yang_2@nxp.com>
 <20260402071457.2516021-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402071457.2516021-2-xu.yang_2@nxp.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36066-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 29AB03B7437
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-02 15:14:56, Xu Yang wrote:
> For USB role switch-triggered IRQ, ID and VBUS change come together, for
> example when switching from host to device mode. ID indicate a role switch
> and VBUS is required to determine whether the device controller can start
> operating. Currently, ci_irq_handler() handles only a single event per
> invocation. This can cause an issue where switching to device mode results
> in the device controller not working at all. Allowing ci_irq_handler() to
> handle both ID and VBUS change in one call resolves this issue.
> 
> Meanwhile, this change also affects the VBUS event handling logic.
> Previously, if an ID event indicated host mode the VBUS IRQ will be
> ignored as the device disable BSE when stop() is called. With the new
> behavior, if ID and VBUS IRQ occur together and the target mode is host,
> the VBUS event is queued and ci_handle_vbus_change() will call
> usb_gadget_vbus_connect(), after which USBMODE is switched to device mode,
> causing host mode to stop working. To prevent this, an additional check is
> added to skip handling VBUS event when current role is not device mode.
> 
> Suggested-by: Peter Chen <peter.chen@kernel.org>
> Fixes: e1b5d2bed67c ("usb: chipidea: core: handle usb role switch in a common way")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - change ci_irq_handler() instead of assign id_event/b_sess_valid_event
>    as true and queue otg work directly
> ---
>  drivers/usb/chipidea/core.c | 45 +++++++++++++++++++------------------
>  drivers/usb/chipidea/otg.c  |  3 +++
>  2 files changed, 26 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 87be716dff3e..7cfabb04a4fb 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -544,30 +544,31 @@ static irqreturn_t ci_irq_handler(int irq, void *data)
>  			if (ret == IRQ_HANDLED)
>  				return ret;
>  		}
> -	}
>  
> -	/*
> -	 * Handle id change interrupt, it indicates device/host function
> -	 * switch.
> -	 */
> -	if (ci->is_otg && (otgsc & OTGSC_IDIE) && (otgsc & OTGSC_IDIS)) {
> -		ci->id_event = true;
> -		/* Clear ID change irq status */
> -		hw_write_otgsc(ci, OTGSC_IDIS, OTGSC_IDIS);
> -		ci_otg_queue_work(ci);
> -		return IRQ_HANDLED;
> -	}
> +		/*
> +		 * Handle id change interrupt, it indicates device/host function
> +		 * switch.
> +		 */
> +		if ((otgsc & OTGSC_IDIE) && (otgsc & OTGSC_IDIS)) {
> +			ci->id_event = true;
> +			/* Clear ID change irq status */
> +			hw_write_otgsc(ci, OTGSC_IDIS, OTGSC_IDIS);
> +		}
>  
> -	/*
> -	 * Handle vbus change interrupt, it indicates device connection
> -	 * and disconnection events.
> -	 */
> -	if (ci->is_otg && (otgsc & OTGSC_BSVIE) && (otgsc & OTGSC_BSVIS)) {
> -		ci->b_sess_valid_event = true;
> -		/* Clear BSV irq */
> -		hw_write_otgsc(ci, OTGSC_BSVIS, OTGSC_BSVIS);
> -		ci_otg_queue_work(ci);
> -		return IRQ_HANDLED;
> +		/*
> +		 * Handle vbus change interrupt, it indicates device connection
> +		 * and disconnection events.
> +		 */
> +		if ((otgsc & OTGSC_BSVIE) && (otgsc & OTGSC_BSVIS)) {
> +			ci->b_sess_valid_event = true;
> +			/* Clear BSV irq */
> +			hw_write_otgsc(ci, OTGSC_BSVIS, OTGSC_BSVIS);
> +		}
> +
> +		if (ci->id_event || ci->b_sess_valid_event) {
> +			ci_otg_queue_work(ci);
> +			return IRQ_HANDLED;
> +		}
>  	}
>  
>  	/* Handle device/host interrupt */
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index 647e98f4e351..def933b73a90 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -130,6 +130,9 @@ enum ci_role ci_otg_role(struct ci_hdrc *ci)
>  
>  void ci_handle_vbus_change(struct ci_hdrc *ci)
>  {
> +	if (ci->role != CI_ROLE_GADGET)
> +		return;
> +

Are there the situations that the ci->role is not CI_ROLE_GADGET, but
it needs to handle VBUS? Eg, ci->role is CI_ROLE_NONE, and VBUS event
occurs?

-- 

Best regards,
Peter

