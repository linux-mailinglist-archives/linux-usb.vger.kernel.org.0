Return-Path: <linux-usb+bounces-35063-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABHbHRzKumkLcAIAu9opvQ
	(envelope-from <linux-usb+bounces-35063-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 16:51:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB52BEA84
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 16:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3AD8330B059D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02FA3E9585;
	Wed, 18 Mar 2026 15:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YaWLjWa1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6C53E9296;
	Wed, 18 Mar 2026 15:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846496; cv=none; b=m0W7DFedo8j1h34fAYoi6xOnohBy41Cp9YI1cWENJPngGV8vvKFUmnqNMqQGsbhJY1DQoKFSbs8GKD2QMdPF9GJX2YzPSSAwg0wEC64V3rCs4to126dShyg6vPWuN/kA1iAZs8dasSs8deVIt8zMTpMzi/bw8FmxRxJngIbGnko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846496; c=relaxed/simple;
	bh=2tucgeWMCtY78ys7RtZSUy0aTkak8RNLzU9BjQ2kAZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUq+S4VlWSPRoUVf7kolFYbg+sBXvsrNKAjovOv8J9VJd3jB9XyidA5wUtg4OyNFicPnvHMJw0B1K07kdjXe328W71ScUTM47SPP/6dlIufiPMHqlnSnzxPk+x4IvTveDki6+s8qXXesjSqgESSRu6ZHNow/Qv46pjzSWVdgeps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YaWLjWa1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFAFC19421;
	Wed, 18 Mar 2026 15:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773846496;
	bh=2tucgeWMCtY78ys7RtZSUy0aTkak8RNLzU9BjQ2kAZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YaWLjWa1S0COel64YrcrXifhUIdIsUii+7D6Bu62LHVAGe9FY16uzcv4JbaCe/No0
	 eRC/11Q/254agEwzcHAK54EkH8+aHMi52Nf4x+Ow4HhuLu20ANOm3U27IyVjp/ae0c
	 5M2eORV25N0GoY+uq4UFvGObgn/UzXkwRqg9KTcw=
Date: Wed, 18 Mar 2026 16:08:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kit Dallege <xaum.io@gmail.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: add kernel-doc for priority and
 mode_selection members
Message-ID: <2026031803-irregular-overheat-f7e0@gregkh>
References: <CAAZVx99U8a4w7cZihEyysaKD4R=pgXs4fKEegmvHv0Q3avJg7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZVx99U8a4w7cZihEyysaKD4R=pgXs4fKEegmvHv0Q3avJg7w@mail.gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35063-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.977];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 76EB52BEA84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:29:56PM +0100, Kit Dallege wrote:
> Document the priority and mode_selection members of struct
> typec_altmode that were added without kernel-doc descriptions.
> 
> This fixes the following warnings when building with W=1:
> 
>   include/linux/usb/typec_altmode.h: struct member 'priority' not
> described in 'typec_altmode'
>   include/linux/usb/typec_altmode.h: struct member 'mode_selection'
> not described in 'typec_altmode'
> 
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>
> ---
> v2: resend so From matches Signed-off-by (Greg KH)
> 
>  include/linux/usb/typec_altmode.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/usb/typec_altmode.h
> b/include/linux/usb/typec_altmode.h
> index 0513d333b797..c7cfc4629484 100644
> --- a/include/linux/usb/typec_altmode.h
> +++ b/include/linux/usb/typec_altmode.h
> @@ -26,6 +26,8 @@ struct typec_altmode_ops;
>   * @mode: Index of the Mode
>   * @vdo: VDO returned by Discover Modes USB PD command
>   * @active: Tells has the mode been entered or not
> + * @priority: Numeric priority for alternate mode selection ordering
> + * @mode_selection: Indicates support for the mode selection feature
>   * @desc: Optional human readable description of the mode
>   * @ops: Operations vector from the driver
>   * @cable_ops: Cable operations vector from the driver.
> --
> 2.53.0

Sent by someone else before you:
	https://lore.kernel.org/r/20260311163320.61534-1-aldocontelk@gmail.com


