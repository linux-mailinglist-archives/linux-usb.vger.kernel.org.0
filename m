Return-Path: <linux-usb+bounces-35622-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CRhHGMXEyGnBqQUAu9opvQ
	(envelope-from <linux-usb+bounces-35622-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 08:20:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2A2350EBA
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 08:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC08E3016C80
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 06:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2680B2BDC05;
	Sun, 29 Mar 2026 06:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TnArtNzk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA71F2853F3
	for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 06:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765248; cv=none; b=GB1DMuAZtP4ZV0PxgMHV5FmhabgLPz3kCr3sxWyRz0CN4PBPK/FuAeFqt2GUuMJ60K6T8IjvpO4/z9bg4yqlx1yzEwVtl+0q1WqTsWBjffffXpol9YuakNcnsxomqBO5D1k5qKfL27z9GxhDZvaI1GHPiyPlI1oE9z7C0gcbgzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765248; c=relaxed/simple;
	bh=+ZDIQ7toqSPOBywLh2EuLMWbCnXXYWC/quMQX0SSJhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew6d7xa1Zwp6xSQzvmseXRjp852H/LP8osxR5eW8Aa3OPr0GF5OD+fWV4bhqgbEn448eDciIaHyAM14jG8EvyBWr6PytkRr+p9derXkKJ0yYx7Ul3A+gs8oVxs0nIuAYSDaw2woLNKZjmArBBuRtH1lMKj0z2VPnta3cAkE9JGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TnArtNzk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E4FC19424;
	Sun, 29 Mar 2026 06:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774765248;
	bh=+ZDIQ7toqSPOBywLh2EuLMWbCnXXYWC/quMQX0SSJhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnArtNzkML5euVnvo+y4Sz0FTpbo9CJt52SYFcjdVVonlHdkuQ8rvM6iujUKFW1IK
	 5yfvgy+3h6qZ63WSJhikKuU0CbfT4ZIqN90SOlVOVj/Vt+gzuOLwZdP0gdtYb8hi8T
	 4wcL2xJZ1LW5hFI4KNGvwCbsWDWyN5OLuq5QCGi0=
Date: Sun, 29 Mar 2026 08:20:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?Q?Stanis=C5=82aw?= Maciej Molsa <stanislawmolsa@gmail.com>
Cc: peter.chen@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: common: fix all alignment warnings in usb-otg-fsm.c
Message-ID: <2026032944-relic-attach-0786@gregkh>
References: <acgQzzfSTX-5foU-@stanislaw-QEMU-Virtual-Machine>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acgQzzfSTX-5foU-@stanislaw-QEMU-Virtual-Machine>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35622-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: AA2A2350EBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 05:33:03PM +0000, Stanisław Maciej Molsa wrote:
> Hi Peter,
> 
> This is my first small contribution to the USB subsystem.

No need for this here.

> 
> Fixed all "Alignment should match open parenthesis" warnings in
> usb-otg-fsm.c, as
> reported by checkpatch.pl
> 
> Signed-off-by: Stanisław Maciej Molsa <stanislawmolsa@gmail.com>
> ---
>  drivers/usb/common/usb-otg-fsm.c | 42 ++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/usb/common/usb-otg-fsm.c b/drivers/usb/common/usb-otg-fsm.c
> index e11803225775..5dcaa6c2057f 100644
> --- a/drivers/usb/common/usb-otg-fsm.c
> +++ b/drivers/usb/common/usb-otg-fsm.c
> @@ -32,7 +32,7 @@ static int otg_set_protocol(struct otg_fsm *fsm, int protocol)
>  
>  	if (fsm->protocol != protocol) {
>  		VDBG("Changing role fsm->protocol= %d; new protocol= %d\n",
> -			fsm->protocol, protocol);
> +		     fsm->protocol, protocol);

Please do not do coding style changes EXCEPT in subsystems that
specifically ask for them to be done in (like drivers/staging/),
otherwise there will be nothing but constant churn in the kernel tree.

thanks,

greg k-h

