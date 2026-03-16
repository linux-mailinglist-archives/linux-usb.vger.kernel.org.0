Return-Path: <linux-usb+bounces-34839-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDNVFIagt2n9TgEAu9opvQ
	(envelope-from <linux-usb+bounces-34839-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:17:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D299D295074
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DA543013D6D
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 06:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36CC34AAF7;
	Mon, 16 Mar 2026 06:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jt39rHhK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDF11B808;
	Mon, 16 Mar 2026 06:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773641855; cv=none; b=PSCheHgozCoFO92sngwXFKAvgqmalFcxmbiCcoHtea9MGPlvm2puylmwrjH84i8ENnuBGGWNNb7vJ+MOlxxSFC2BHzTYWqD3pgwY9SmVve4QVEc6tBJaAzGFy2dT/gEsR2BWe7KvVblvB6dHoQjyh2SmR9lz66rWOqs3b5/C364=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773641855; c=relaxed/simple;
	bh=qrTjT1wkM98fZdpCNZSyI316XGcSZUYPfjTXQe2x4uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UU9bJBSrs++F9ATTW1qJ4UjC9EunsfVj9fHdSciASIdpsqcg9LV8f7Ay8+F81eoT1gH94qZl0P6+g+IYeyP8s2ULh/rklwLipnSqQh5+byEkdqq0UAzK19QDLqLg994SvExTGWAIKMYCoIjB0FxfyWKou6DzwcD2jGZ/p/8E0D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jt39rHhK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F27C19421;
	Mon, 16 Mar 2026 06:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773641854;
	bh=qrTjT1wkM98fZdpCNZSyI316XGcSZUYPfjTXQe2x4uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jt39rHhKvpufotJ6RqG1GKXiv+pazdXhgvBQ7TV+5RLFD84aJw91Qb0t+QSCyBmrs
	 pzWWw5P94bM5mcCS0kidDIifKoHtz0vw674UaQmfnYRXzd2P4ZIjEKeieTQFsJUBkb
	 x6Sdnm4njtD5Me/TG2iO1Ybh68svFZbMw62H7y+I=
Date: Mon, 16 Mar 2026 07:17:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kit Dallege <xaum.io@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] usb: typec: add kernel-doc for priority and
 mode_selection members
Message-ID: <2026031638-deviant-granddad-9ae8@gregkh>
References: <20260315145741.24128-1-xaum.io@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315145741.24128-1-xaum.io@gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34839-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D299D295074
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 03:57:41PM +0100, Kit Dallege wrote:
> Document the priority and mode_selection members of struct
> typec_altmode that were added without kernel-doc descriptions.
> 
> This fixes the following warnings when building with W=1:
> 
>   include/linux/usb/typec_altmode.h: struct member 'priority' not described in 'typec_altmode'
>   include/linux/usb/typec_altmode.h: struct member 'mode_selection' not described in 'typec_altmode'
> 
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>
> Signed-off-by: kovan <xaum.io@gmail.com>

Please use your name, not an alias, to sign off on a patch.  And no need
to list it twice.

Also, where are the other 5 patches here?

thanks,

greg k-h

