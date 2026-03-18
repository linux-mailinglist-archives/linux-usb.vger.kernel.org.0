Return-Path: <linux-usb+bounces-35052-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIhnN6O1umlWawIAu9opvQ
	(envelope-from <linux-usb+bounces-35052-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:24:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6992D2BD04B
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F08A83268E3F
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 14:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C742222A9;
	Wed, 18 Mar 2026 14:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WHkwsmN5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5233D8108
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 14:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843235; cv=none; b=Y8QEtBK4abVEDET9pfYtFAiPEqXTnbtlnen5r64Lt6R+/PUDrkSSzAuytkHHL3sR6R+m4KJGDwBaE+S02PpFIgl3zivw7LaC6Ww1qsa1Oov/lPSiUNc9yDYYvADgCO4JoZbKENiYSjHMdZOpESCnVvJKJzMnBS62dSVjmrGiyAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843235; c=relaxed/simple;
	bh=T3YFrtCmPcyzBYKr/rwj7VCqX3IIGcIdJIqkDUIPdXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKY9aJKkPSvd4FyAJlaZ3j/CmtBHOiObRbksnVDSj8G6wQ+7CyFNrWiCiu/LAz2bx8I8GeGQdht2UfIX6HXrqJr5VwmTRWOYkaR+dP8HKufyaN9AkcopBk+InkXZD4yw+5fhHB7Dk8rVxPZlsOHqv3xXlE5ythnY13fkWgfvUsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WHkwsmN5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4EEDC19421;
	Wed, 18 Mar 2026 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773843235;
	bh=T3YFrtCmPcyzBYKr/rwj7VCqX3IIGcIdJIqkDUIPdXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WHkwsmN5uPP1p2dTMy5I82Qr4zWndEyXCAkEExLwV08UCshnJiHY/tiw1wbsl1ayE
	 XMHPBvM9q2ZDnQPUQ77hlJxhuX/Y5Uiy5JqaxukV8XrJYLoAY+NYil0wJwuj1MeZ6s
	 BYG5CAX7OK7VhN3h7sA2UJW5aV9EZVX5WBVyUed0=
Date: Wed, 18 Mar 2026 15:13:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: justin.chen@broadcom.com
Cc: linux-usb@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	alcooperx@gmail.com, stern@rowland.harvard.edu
Subject: Re: [PATCH] usb: ehci-brcm: fix sleep during atomic
Message-ID: <2026031819-awoke-overdrawn-4287@gregkh>
References: <20260312190825.3596757-1-justin.chen@broadcom.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312190825.3596757-1-justin.chen@broadcom.net>
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
	FREEMAIL_CC(0.00)[vger.kernel.org,broadcom.com,gmail.com,rowland.harvard.edu];
	TAGGED_FROM(0.00)[bounces-35052-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.919];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,broadcom.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6992D2BD04B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 12:08:25PM -0700, justin.chen@broadcom.com wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> echi_brcm_wait_for_sof() gets called after disabling interrupts
> in ehci_brcm_hub_control(). Use the atomic version of poll_timeout
> to fix the warning.
> 
> Fixes: ("9df231511bd6 usb: ehci: Add new EHCI driver for Broadcom STB SoC's")

Can you resend this with the proper format for how Fixes: lines should
be?  It's in the documentation, otherwise our scripts will reject this.

thanks,

greg k-h

