Return-Path: <linux-usb+bounces-38088-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBluFf6lFmoOoAcAu9opvQ
	(envelope-from <linux-usb+bounces-38088-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 10:06:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFAD5E0D39
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 10:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C48EA3031321
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 08:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA403CDBA9;
	Wed, 27 May 2026 08:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NOgiJmWc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E739A2C11F9;
	Wed, 27 May 2026 08:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869058; cv=none; b=DK9UMEJANkjYhEhk/KyEbdJ6eb4HD3x5Fghfsb0dEQVsMDRcuXBl1Qn1rt83YZ7g3ogkuw2hauPQklZ082kaBu7kxY3zTMbqs6MdHlzZ+/U3uAzu8EqfGViJgGeFCIAUbmcaT9NLwSOoCjTgCpWzkPIHiWpYvie8TBQG1ZllaFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869058; c=relaxed/simple;
	bh=CEK0plCXA91yv8H4ANbOIxv1m5VgNFJPoZ/MatvIPu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMJn81E56zHaex8GnadbuYbJPNqCJteTC3LjMOEb1oc4yZrWJDqyyFip4JB7Bt+KF9NbX+qP/pUuUJ62iFaT+C7F0JXo+jZZXEUae6Tg69PHObOr2WOphLICsBnit3y9ZCKaaMT9ETZIwonNspqaGi2taO/8H0pVTPm3cLyxeN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NOgiJmWc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBCB1F000E9;
	Wed, 27 May 2026 08:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779869057;
	bh=mL5wpWyCBu/4Ut5vtPyH7R/tK4LwW/MfE1On0kmJn3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NOgiJmWcwhkISUu2cEXlK76J0b3knq6f0vw8Hn49hiW0JI1SSD4E5P+WahzS0vqi/
	 wfaABVVTvza04IiwhUW8aUCpksk0SpdEUt5nL8695J6R1pgfyrjNmnV6PWE4mrRata
	 gPJrI3NhtCYiaK+UBYeefWvbqpAhF9BtSqWAp3nE=
Date: Wed, 27 May 2026 10:03:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: khtsai@google.com, sashal@kernel.org,
	Merlijn Wajer <merlijn@wizzup.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] usb: gadget: u_ether NULL deref in eth_stop after
 gether_detach_gadget
Message-ID: <2026052726-vagrancy-lilac-bf72@gregkh>
References: <89e19e6e-7ee7-4bb0-abd6-60971b7fd601@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89e19e6e-7ee7-4bb0-abd6-60971b7fd601@gmail.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38088-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.503];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DDFAD5E0D39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 08:56:15AM +0300, Ivaylo Dimitrov wrote:
> on linux 6.18.31 I am seeing a NULL pointer dereference during RNDIS gadget
> teardown.

Does this also happen on the latest 7.1-rc release?

> I suspect the reason is commit:
> 
>   usb: gadget: f_ncm: Fix net_device lifecycle with device_move

Do you have a proposed fix for this issue?

thanks,

greg k-h

