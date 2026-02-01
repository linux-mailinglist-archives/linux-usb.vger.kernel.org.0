Return-Path: <linux-usb+bounces-32969-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHosL8AAf2ktiAIAu9opvQ
	(envelope-from <linux-usb+bounces-32969-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 08:29:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F10CC5220
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 08:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D62A13012CC7
	for <lists+linux-usb@lfdr.de>; Sun,  1 Feb 2026 07:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210DE2E54A3;
	Sun,  1 Feb 2026 07:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jPTZvZ6e"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EB03EBF37;
	Sun,  1 Feb 2026 07:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769930938; cv=none; b=Rcig8LThVADTQZTX6ansFsSVYav+7ojgATXLLSXkTejNsLwgz5vuK4ZSnSBUYaxlrtUmVaqrR+6IT11vDMjdZpTt8QJ87IB5MPzGrtMdXuc4I7XHHw0tL/5yRkjxCfH/qVlwnQoqJ9xZsEQ+QB8frgjACHzwGJIokoPonygFNlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769930938; c=relaxed/simple;
	bh=EfDBxwED/eB3RlzpH7XLchId32hrv+fTHrCROCF+bq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjZJMjbMW4srpFSF78KziUBaMpDOhxG5wpx4kmEn3VCyOIvBuAJ5Jzd9BcepFWmIJMO6Zkb1dKcJPKsdkVJt8lr44DfOs4Ugdyh22gFtKG6wddpKeBH5BfWpKm4t2ozsKCLMBHhyXCFiyry2/xHpQKFJyfLMggmBYrfiuMWcufQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jPTZvZ6e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1010C4CEF7;
	Sun,  1 Feb 2026 07:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769930938;
	bh=EfDBxwED/eB3RlzpH7XLchId32hrv+fTHrCROCF+bq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPTZvZ6essDh/aD+dbd+tnh7A0TyOvUnkB3C0JqgFKprluT6yT4Ow251wSBtSAdbo
	 Z8rhAKCFuCF6rRCcBSimbH+A6uxTIIUI1N59XTA6MP/6/L5vgkJRuGGWTO3sFyGRVY
	 7Mxywijfs4rwLbC8nvy4FDtk+OnweDD+m01CBzvc=
Date: Sun, 1 Feb 2026 08:28:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Sam Day <me@samcday.com>,
	Christian Brauner <brauner@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>, Mateusz Guzik <mjguzik@gmail.com>,
	Liang Jie <liangjie@lixiang.com>,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>,
	Owen Gu <guhuinan@xiaomi.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] usb: gadget: Use sysfs_emit instead of sprintf
Message-ID: <2026020129-given-grapple-d4ee@gregkh>
References: <20260131160111.3161630-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131160111.3161630-1-krishna.kurapati@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32969-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[zeniv.linux.org.uk,samcday.com,kernel.org,iscas.ac.cn,gmail.com,lixiang.com,lauterbach.com,xiaomi.com,wanadoo.fr,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 4F10CC5220
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 09:31:09PM +0530, Krishna Kurapati wrote:
> Use sysfs_emit() instead of sprintf() in configfs attribute show functions.
> sysfs_emit() is the recommended API for sysfs output as it provides buffer
> overflow protection and proper formatting.

But this isn't sysfs, as you say, it's configfs, so why switch?  If
there is no need, the churn is not required.

thanks,

greg k-h

