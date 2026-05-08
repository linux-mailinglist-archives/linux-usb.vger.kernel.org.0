Return-Path: <linux-usb+bounces-37124-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK4XAMXD/WkpigAAu9opvQ
	(envelope-from <linux-usb+bounces-37124-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 13:06:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ECD4F57AB
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 13:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A6DD30600BB
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 11:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D01361667;
	Fri,  8 May 2026 11:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j/lE3CMz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F26B315D43;
	Fri,  8 May 2026 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238205; cv=none; b=k1+QigL3H3YoqlNYHRAwMgSMxsJ4lRe/rdRttcTb6DRoXMV+BFtrOu5Jy2pnUi5z63YClEp/T1Qm3MSlVGQcsnVWyoD+z5XkECqgO79MCL2iF89WmMFVqymFB8w3VdirZ/sOJwc1ahkhGt5gHssR8RvR2gN4vuySS4a4wauRzoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238205; c=relaxed/simple;
	bh=31cQHqr+1Ta+/dG3y37QuyVmyjYQZuitsLQaTlFhE5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbmDVJBVXM+eOzUUeSaBLWoZcQ2fxb1ByRt06sEOQWX5kjIdDeavk/+UEQEIbgHzkNlefnmAR+w1dMAAF5/wg+t4RPaVjgystCXKjEIWU5y6oWu2d8oN9vGT7aQsiNR2uVM3QaVrnCWo/gD3yqkrp8fpO0CC4XO4CnMQW8K4owk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j/lE3CMz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CD6C2BCB8;
	Fri,  8 May 2026 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778238205;
	bh=31cQHqr+1Ta+/dG3y37QuyVmyjYQZuitsLQaTlFhE5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/lE3CMzW3si/mHd/E5NQH3ijceYjZuqfm8TJ4aN2XWlCXy9xMz/XmXTtjw/ejyYT
	 FFUKwS3ey/mYJerfY2Se73YIJfpNFyRZeLuVB4aNB0P86OLrq65wJLqZ9BgjAEbMDR
	 NJlfSaj0xLwBrU21trWQIah2csX4qL9mII2+HrpY=
Date: Fri, 8 May 2026 13:03:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: heikki.krogerus@linux.intel.com, nathan.c.rebello@gmail.com,
	kyungtae.kim@dartmouth.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.6 & 5.10] usb: typec: ucsi: validate connector number
 in ucsi_connector_change
Message-ID: <2026050843-denatured-bonfire-6337@gregkh>
References: <20260508092026.1364820-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508092026.1364820-1-lihongbo22@huawei.com>
X-Rspamd-Queue-Id: 75ECD4F57AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37124-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,dartmouth.edu,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 05:20:26PM +0800, Hongbo Li wrote:
> Commit d2d8c17ac01a ("usb: typec: ucsi: validate connector
> number in ucsi_notify_common()") and commit 5a1140404cbf ("usb:
> typec: ucsi: skip connector validation before init") add the bounds
> check when do the connector change both in pre-init notification and
> the forward notifications. But they are difficult to backport to
> early stable branch such as LTS 6.6, LTS 5.10 due to many dependencies.
> Instead, we choose to validate connector number in ucsi_connector_change
> directly to avoid out-of-range issue.

Why just these 2 branches?

And what specific commits are needed exactly?  Why not just backport
them all?  that will make future changes apply properly as well, making
the overall work much less over time.

thanks,

greg k-h

