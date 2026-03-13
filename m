Return-Path: <linux-usb+bounces-34721-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFNCAS+us2n1ZgAAu9opvQ
	(envelope-from <linux-usb+bounces-34721-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 07:26:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BCA27E116
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 07:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7108E307FE61
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 06:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F35236A026;
	Fri, 13 Mar 2026 06:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="otb74X7o"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F238E368947;
	Fri, 13 Mar 2026 06:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773382511; cv=none; b=Ib3O5lUEotmS01+G/HtOwguAZfjRJkSs7fHsV2c9eN0rrDj9S2EBp1/knvLy9XB3Fs1xCOgLA3+3CUl8e9Y1xzFmYUyKTDCJLkp8eqxHMB+RFu3yt9B0bgtJM6GnjXfVwVy9GbaLVVnSJuRy1DP4wBtaLNQGvxNtRcE+w4AIGiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773382511; c=relaxed/simple;
	bh=iQZ2fCOZki0BvKe3mK+PN3iJVB6hrPV5ZJNR8yJUO6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3KR/XNkmGUynf6rKnG54l1jBbCVxL4Z3zWWS+b8jYJx5eHP4lnJoqgiMrXD7r/oGb+bLnME/wnozQ7rWsdkjxN6RitrZrm+c8ReaK5eB32+tvASNG8Y4TpXJYshEHmw/I8DwqqIArYZhcX7lEsq9z0greOt9WcLRxuPPPBP4SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=otb74X7o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD32C19421;
	Fri, 13 Mar 2026 06:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773382510;
	bh=iQZ2fCOZki0BvKe3mK+PN3iJVB6hrPV5ZJNR8yJUO6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otb74X7o93JsQZcqOKVC9gnAUaIgxH5CYyH3rXAqqi4vdovrpANtOcK7ERg8j2h75
	 MDPw6YM7s4zyYnPINBfIx5tEJFZJsU5fgpvxo+QNrFiJs0Q5J19+hIwHP7ptMO56JE
	 /7s8REjfqTGwP5AV76f1HgBXIbepLQ0wPdummJ6E=
Date: Fri, 13 Mar 2026 07:15:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: John S <xaum.io@gmail.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: add kernel-doc for priority and
 mode_selection members
Message-ID: <2026031348-playroom-chasing-7d8a@gregkh>
References: <CAAZVx98RyzO+Pdqt+w-4QWyefbgmAKzzSYkVHZV9x=GiTW-GfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZVx98RyzO+Pdqt+w-4QWyefbgmAKzzSYkVHZV9x=GiTW-GfQ@mail.gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34721-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: A0BCA27E116
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 10:42:35PM +0100, John S wrote:
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

Does not match your "From:" line :(

Didn't checkpatch complain about this?

thanks,

greg k-h

