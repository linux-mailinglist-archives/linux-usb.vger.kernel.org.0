Return-Path: <linux-usb+bounces-32968-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK4yMX0Af2ktiAIAu9opvQ
	(envelope-from <linux-usb+bounces-32968-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 08:27:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBDFC5218
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 08:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 314863014856
	for <lists+linux-usb@lfdr.de>; Sun,  1 Feb 2026 07:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DC72E1EE5;
	Sun,  1 Feb 2026 07:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D9vgnuS9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634281AE877
	for <linux-usb@vger.kernel.org>; Sun,  1 Feb 2026 07:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769930871; cv=none; b=oy1QBhyphDSwX4GR+qnnsLtw78x1+IUNAA9e/e2RsNWjve1wOXr3qGMDczsh19KYns+/aFSCuXwSgCi5ziVJv3MdSyHv79c7dsR+lY7W31HWaLA1uPFIVicDk9J30NqCjKaNcbt73UTctuzPOOOXpB199bvude1ONh/9Pd2Fvvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769930871; c=relaxed/simple;
	bh=gn5F+juu3TW5Q8qKzhgmAFmMoPHjvIIK7F8/0ZSydTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2XlL0h1e/BiHPeavTuizXQxUurZM5fIIGF6I4AKo2SmVcSy7IQubcqkFqkjx3MpMo/7mNey4AyGE/LM3NyyL4T5D3By10V7OZkN1S4iRnAvnX0el61YZYhHYU/5trS/6hODwcFNxWkJ24KYkWF7MRUQuguFmV2qfHJbCbHkOos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D9vgnuS9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B84C4CEF7;
	Sun,  1 Feb 2026 07:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769930870;
	bh=gn5F+juu3TW5Q8qKzhgmAFmMoPHjvIIK7F8/0ZSydTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D9vgnuS9YJKO96TvRuRkIZoHrqzJV2lezlkF3xXqqAxZbNcNcmcEcKYltik88+wWQ
	 bPw9UPKs7URzwYU4qXKX7KCIQSaxkJ8+wqj4x5BOXb2qM7qQgqwRgx/Nt4alvpAx9/
	 8bSHNt3zbsBa2LD/69Jo2OgvG+rOKzFUqiVwc/eQ=
Date: Sun, 1 Feb 2026 08:27:48 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: HackNOW Team <hacknow@ikmail.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"marco.crivellari@suse.com" <marco.crivellari@suse.com>,
	"khtsai@google.com" <khtsai@google.com>
Subject: Re: Fw: Re: [PATCH] USB: hub: add early rejection for corrupted or
 high-risk devices
Message-ID: <2026020104-underpass-gallows-2305@gregkh>
References: <9fcf5b72-7d3c-4677-aad1-6b7c4adf6a23@mail.infomaniak.com>
 <a8faa1ea-991a-48b1-909f-208cb2f17d2d@rowland.harvard.edu>
 <afa209d3-e3ce-4f58-8746-8aac6699adb7@mail.infomaniak.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afa209d3-e3ce-4f58-8746-8aac6699adb7@mail.infomaniak.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32968-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 2EBDFC5218
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 06:57:12PM +0100, HackNOW Team wrote:
> Hi Alan,
> 
> I must respectfully disagree with your characterization. This patch is
> a serious defensive security improvement for the USB subsystem, not a
> joke. Its purpose is to prevent devices with malformed descriptors or
> high-risk classes from being fully initialized, thereby reducing the
> kernel attack surface.
> 
> I would appreciate feedback focused on the technical merits of the
> patch.

Sorry, but no, I agree with Alan, this is a funny post.  Next time you
might wish to wait for April 1 to send it to get the proper chuckle out
of us.

thanks,

greg k-h

