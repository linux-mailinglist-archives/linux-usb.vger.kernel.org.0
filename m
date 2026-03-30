Return-Path: <linux-usb+bounces-35640-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GGAFMUiymmu5QUAu9opvQ
	(envelope-from <linux-usb+bounces-35640-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 09:14:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 489DC3564CD
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 09:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A35C3004400
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 07:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B3E39E176;
	Mon, 30 Mar 2026 07:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXm3lbeZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BD6361DA2;
	Mon, 30 Mar 2026 07:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774854846; cv=none; b=tiB8rA8TVvjHT8zgcJjJZeOJd2fyr7N56f8xfBIVFKC9TgHjhZ+wuFkC0wYmsFc9BCfLtl+2RZjVXPXJaEoe1KYWN4Qd9gc4Zcugco1JWrjBaL7LEouPRc5o/58tneZlwXBcdZquvcYVAcShcWKVG2Wd6i8Wiu1mjWsaMJjcMVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774854846; c=relaxed/simple;
	bh=4FXQCsqHMrZh0O3fV0syJyvRr5qovyuJXqcuOWxo5Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pxi0cIjPlF5AdJMcW/MbCxfbMd9+CKl8WEJHMnHfCp+ynHZdyOjkEza+6ulG/d3TJ9XXWH2ZOkdZXl/PBzVu6/ZOM9nZPJMjnoCjt6pXMyWAmtbAVjcnPfaQ3VgKDlHe5w9+/MxZRYvfUYCwARzfXTfsvBh9x9AfV5iQ2CaJ71I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXm3lbeZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341BDC4CEF7;
	Mon, 30 Mar 2026 07:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774854846;
	bh=4FXQCsqHMrZh0O3fV0syJyvRr5qovyuJXqcuOWxo5Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXm3lbeZjB5tSGISWtEYlmgVFJrRYWrVC7nmNetg+w+k1nHi6leVb+u7ThDv4Pmwd
	 FRVjan5cL/oKV46WU4gcxPyjTWkD9WM6r0Y+Dx6UuX8hrrIgiieK0ni/8oknT4re7y
	 eElypl+ZAMHN4j+nFxFessmpGv866wvWI/hY5htXvG02OGtdbeiuG6yp+L0Wiis2KU
	 BgLJSdscx00FesQp0E7B56I1lQ2VTTT+OxVQsxsGuNtneuutT1esuO+LjZtCY1TbVn
	 CYM8CGNLG1KnRgqUCmIIweqckZ4Mj1TT6cWYYEfQ9cS1gCj6dlHYcR4mFC+UlYezzG
	 7SsdUeFDGlQ+A==
Date: Mon, 30 Mar 2026 15:14:02 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] usb: chipidea: core: fix device mode not work in
 non-lpm
Message-ID: <acoiuow+HrDQTBKz@nchen-desktop>
References: <20260319095716.634568-1-xu.yang_2@nxp.com>
 <acOKAeNKWT86veM+@nchen-desktop>
 <7n6s3luk32sk36y47u6axedhysnrrin3radc7mgxh2pjzwdzv6@v3yu3tg4moiq>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7n6s3luk32sk36y47u6axedhysnrrin3radc7mgxh2pjzwdzv6@v3yu3tg4moiq>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35640-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 489DC3564CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-27 18:54:45, Xu Yang wrote:
> On Wed, Mar 25, 2026 at 03:08:49PM +0800, Peter Chen (CIX) wrote:
> > On 26-03-19 17:57:15, Xu Yang wrote:
> > > In current design, we expect 2 ci_irq() to handle ID and VBUS events in
> > > usb role switch, like what ci_extcon_wakeup_int() does. Now we only call
> > > ci_irq() once. However, this won't bring any issues in low power mode,
> > > because ci_irq() just take the device out of low power mode, and then
> > > ci_extcon_wakeup_int() will call ci_irq() twice. If the device is not in
> > > suspend state, the device mode will not work properly because VBUS event
> > > won'tbe handled (ID event has higher priority) at all.
> > 
> > %s/won'tbe/won't be
> 
> OK.
> 
> > 
> > Is it possible change ci_irq_handler and handle both events?
> 
> Yes, we can change ci_irq_handler() and let it set both ci->id_event and
> ci->b_sess_valid_event flags, then queue a ci_otg_work() to handle them
> later. 
> 
> I think this just unnecessarily call ci_irq_handler() to handle lpm/non-lpm
> case as the final path is ci_otg_work() and it will handle lpm/non-lpm case
> by naturally calling pm_runtime_get/put_sync(), otherwise it relies on
> ci_extcon_wakeup_int() to achieve the same purpose. 
> 
> Both methods work for me, may I know which one do you prefer? :)

My main concerns are below code, and it may confuse the reader.

ci->id_event = true;
ci->b_sess_valid_event = true;

I may prefer the first option, it is easy to understand.

Peter

> 
> > 
> > > 
> > > Although 2 consecutive ci_irq() can work around the issue, do not do it
> > > because ci_usb_role_switch_set() may or not be in low power context which
> > > make the ci_irq() purpose not unique here. Because the final processing
> > > is in ci_otg_work(), just directly queue an otg work. This also refine
> > > the logic for more clarity and not set changed flag.
> > > 
> > > Fixes: e1b5d2bed67c ("usb: chipidea: core: handle usb role switch in a common way")
> > > Cc: stable@vger.kernel.org
> > > Reviewed-by: Jun Li <jun.li@nxp.com>
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/chipidea/core.c | 30 +++++++++++-------------------
> > >  1 file changed, 11 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > > index fac11f20cf0a..1bd231a852a1 100644
> > > --- a/drivers/usb/chipidea/core.c
> > > +++ b/drivers/usb/chipidea/core.c
> > > @@ -618,30 +618,22 @@ static int ci_usb_role_switch_set(struct usb_role_switch *sw,
> > >  	struct ci_hdrc *ci = usb_role_switch_get_drvdata(sw);
> > >  	struct ci_hdrc_cable *cable;
> > >  
> > > -	if (role == USB_ROLE_HOST) {
> > > -		cable = &ci->platdata->id_extcon;
> > > -		cable->changed = true;
> > > +	cable = &ci->platdata->id_extcon;
> > > +	if (role == USB_ROLE_HOST)
> > >  		cable->connected = true;
> > > -		cable = &ci->platdata->vbus_extcon;
> > > -		cable->changed = true;
> > > -		cable->connected = false;
> > > -	} else if (role == USB_ROLE_DEVICE) {
> > > -		cable = &ci->platdata->id_extcon;
> > > -		cable->changed = true;
> > > +	else
> > >  		cable->connected = false;
> > > -		cable = &ci->platdata->vbus_extcon;
> > > -		cable->changed = true;
> > > +
> > > +	cable = &ci->platdata->vbus_extcon;
> > > +	if (role == USB_ROLE_DEVICE)
> > >  		cable->connected = true;
> > > -	} else {
> > > -		cable = &ci->platdata->id_extcon;
> > > -		cable->changed = true;
> > > -		cable->connected = false;
> > > -		cable = &ci->platdata->vbus_extcon;
> > > -		cable->changed = true;
> > > +	else
> > >  		cable->connected = false;
> > > -	}
> > >  
> > > -	ci_irq(ci);
> > > +	ci->id_event = true;
> > > +	ci->b_sess_valid_event = true;
> > 
> > Why both ID and VBUS event are set as true unconditionally?
> 
> The main purpose is to simplify the handling of the various situations.
> 
> The usb role include below types:
>  - host
>  - device
>  - none.
> 
>  1. host <--> none
>  Above change means ID change occur.
> 
>  2. device <--> none
>  Above change means VBUS change occur.
> 
>  3. host <--> device
>  Above change means ID and VBUS change occur.
> 
> By setting both of them as true, the logic can be simplified here and
> ID and VBUS otg work will check if a real state change happen by comparing
> old state and current OTGSC_ID/OTGSC_BSV bit.
> 

-- 

Best regards,
Peter

