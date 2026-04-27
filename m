Return-Path: <linux-usb+bounces-36537-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHX9D3RI72lO/wAAu9opvQ
	(envelope-from <linux-usb+bounces-36537-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 13:28:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1D1471B37
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 13:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E67D73062450
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3780F3B7B91;
	Mon, 27 Apr 2026 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ciajyPQE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82E33B777B;
	Mon, 27 Apr 2026 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289122; cv=none; b=UzDSMpm5JvJuC+5C3X1A7ifviGt2F+5stbvQVBhmU/XCi8KKHxivTBsrhwVV6jMJzdmIpd4lahnGdPL5g5n4ulr2ackWIKaHMOxQvc2ks/5B1K5dlgG/5wJOIay1owljmY3/YDj9cX39cGyApkfefDKwsbgNkBVoJJcLD0BBsl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289122; c=relaxed/simple;
	bh=wPzSkRMSsVcEy7HOkbjaWc/TajsqhjRiNVihr5XsgCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUpV5laL34xW95kfJxZ86ZHHsjiKHAd3J/8hdKSitZVLw2feT85P1OtkX7moUvKeuyBGSCn4Dsw1wPo3KqkHM79eBWCJfcQIfG4MgCocbJOaThYK21jPpZDZ8ZwUkVq0a8b7HfBQwCyxxhKqWz2jvovQBaDGM4HyBM1o8uVOTr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ciajyPQE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263E3C19425;
	Mon, 27 Apr 2026 11:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777289122;
	bh=wPzSkRMSsVcEy7HOkbjaWc/TajsqhjRiNVihr5XsgCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciajyPQEyDbLwmhMAf/NavwHNrnCamLLnPyoR3N6t52AqDeA4O9HuuI/Ur5anv7Lf
	 WiU8L7X54rvg4luZPDqiynGwHse3DIw+qEhEJ6dcaoWDZq+ZJUzLuHEMSFJNRsBD4T
	 G5CINji22AWi6qea3kfcBp5yXxUDurbGyirt+zAs=
Date: Mon, 27 Apr 2026 05:24:47 -0600
From: Greg KH <gregkh@linuxfoundation.org>
To: Ginger <ginger.jzllee@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [bug report] Potential order bug in 'drivers/usb/misc/yurex.c',
 mainly in 'yurex_disconnect()'
Message-ID: <2026042718-unwieldy-dicing-626f@gregkh>
References: <CAGp+u1atc_x1o18+Jk+0N+rWnN_RzmWYDAXT=H+oq8jwNdqLEg@mail.gmail.com>
 <2026042444-freeing-consumer-468b@gregkh>
 <CAGp+u1ZZBxLDV3LN0vWH5Smvdm3oosZLT7xyeLy4=ebkv8ZcWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGp+u1ZZBxLDV3LN0vWH5Smvdm3oosZLT7xyeLy4=ebkv8ZcWg@mail.gmail.com>
X-Rspamd-Queue-Id: EB1D1471B37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-36537-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]

On Mon, Apr 27, 2026 at 11:36:39AM +0800, Ginger wrote:
> Thank you for the prompt response. The patch draft is attached below.
> Would it be enough to send the patch to you, or should I draft it into
> a different email?

Please just follow the normally documented process for submitting a
patch and we can take it from there.

thanks,

greg k-h

