Return-Path: <linux-usb+bounces-32655-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C1NFxSdc2nNxQAAu9opvQ
	(envelope-from <linux-usb+bounces-32655-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 17:08:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B44DE782A7
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 17:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2BED3039835
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 16:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9EBD2ED87C;
	Fri, 23 Jan 2026 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="c20TNpBW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46775184;
	Fri, 23 Jan 2026 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769184479; cv=none; b=GahP4O6Q2mA106+3bXVpxxKsonxP9IOvk1CZ/Lxg6stfl9MQ++kk10UCxCg8aV0SlQabTgJrLwhl7UAT+TqB9QDXrGuukCkW2un+P03g85AC43BfHi/iludK6OGiYz0uB40/7xHEG4PSPP5VJkQ7hvYvfXq1BWcOSOwHTpz5+UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769184479; c=relaxed/simple;
	bh=jANtvkvIzP+xKH1SCaNcy8oujz1Ah1SVWDfbHf388q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvPL2VGvWStUmbF4/I39rpqLEV+8YbEQRXFLrjp2JIzyCaqlQ8ja07LoA1hwRJa0/3FOUBR3b0Nz3HTQGi3Vm9Ju8N94oDEqm9vcxBBSELPLVB+LoAwGt1FDDobE6KpChfrar58ByTXlrzUJmNH8TEiH8LKjdt80dr7Tl3obr7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=c20TNpBW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34441C4CEF1;
	Fri, 23 Jan 2026 16:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769184478;
	bh=jANtvkvIzP+xKH1SCaNcy8oujz1Ah1SVWDfbHf388q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c20TNpBW+zLeuHG1B7CftROChisTnbGR/CVGoJYymp6Hr4q4bzynoJdxu+HqeWyhL
	 aR1YJaT8f/LkJhik/j8lWvfv7pfIE34ARqSTaKTtlSlrUT2lXiI6ZzwzRfUfTvLq+m
	 R+rVBm+YZg+JRtTqbKR0n09J2AmPK+djjP49VuJE=
Date: Fri, 23 Jan 2026 17:07:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 13/21] usb: typec: fusb302: Remove IRQF_ONESHOT
Message-ID: <2026012349-energetic-simplify-7a77@gregkh>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
 <20260123113708.416727-14-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123113708.416727-14-bigeasy@linutronix.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32655-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,linuxfoundation.org:email,linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: B44DE782A7
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 12:36:59PM +0100, Sebastian Andrzej Siewior wrote:
> Passing IRQF_ONESHOT ensures that the interrupt source is masked until
> the secondary (threaded) handler is done. If only a primary handler is
> used then the flag makes no sense because the interrupt can not fire
> (again) while its handler is running.
> The flag also disallows force-threading of the primary handler and the
> irq-core will warn about this.
> 
> Remove IRQF_ONESHOT from irqflags.
> 
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Fixes: 309b6341d5570 ("usb: typec: fusb302: Revert incorrect threaded irq fix")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/usb/typec/tcpm/fusb302.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 870a71f953f6c..19ff8217818e7 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1756,8 +1756,7 @@ static int fusb302_probe(struct i2c_client *client)
>  	}
>  
>  	ret = request_irq(chip->gpio_int_n_irq, fusb302_irq_intn,
> -			  IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> -			  "fsc_interrupt_int_n", chip);
> +			  IRQF_TRIGGER_LOW, "fsc_interrupt_int_n", chip);
>  	if (ret < 0) {
>  		dev_err(dev, "cannot request IRQ for GPIO Int_N, ret=%d", ret);
>  		goto tcpm_unregister_port;
> -- 
> 2.51.0
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

