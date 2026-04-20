Return-Path: <linux-usb+bounces-36331-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHPxMHC85Wk8ngEAu9opvQ
	(envelope-from <linux-usb+bounces-36331-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 07:41:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5624D426E47
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 07:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD8573017F8A
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 05:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FA33803E3;
	Mon, 20 Apr 2026 05:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S3UAcwl1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B343013B7AE;
	Mon, 20 Apr 2026 05:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776663642; cv=none; b=F/+1aiZtvTnPLK0aUUi6nA3EP236npoBERWTFNuWoW2n+4bZc/zYrxcb+lcLkcF9RB9pblNQcMFQfoCkvKjSZTcCytZUzNeIdrLU5KAUrjWas9pDKlXXI4zQjk55P9mKKvhAvtkixCr8AK8tg6ZrWpoHp9VOVH+eJqmPH+VZRo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776663642; c=relaxed/simple;
	bh=GzwCi5BcX2RA421ePA0GJp/Tpqu585IovDCncg+JswE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRuVkDCOZ5TDDdEjFNfBBm646Ia+gY0bXjxsGGHv2DLdoJGPD+q1p68a1Sq1A3O8T0hXZnwmdA3Ij2eW29OKYUiBVIk2PMg5F6Wl4sfA0ft6u9nNZS9Bb8F/XpWoDyqrTYWy0F8tdJrZMhrihduPByMfoOxWRwkyDrArW6usU8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S3UAcwl1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDB1C19425;
	Mon, 20 Apr 2026 05:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776663642;
	bh=GzwCi5BcX2RA421ePA0GJp/Tpqu585IovDCncg+JswE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3UAcwl1vbn6Qox6Roa9QPC9NLUDx6Co5GF5TuZYYVIo4thXGFgqQRMC/mIfYJAuX
	 Bqp+Dr0FQ3dviz1atNgwxyXm8NkJ4FxAouvEcK7xooi5n8JK5sAHSXeDXh/Rs8pkwA
	 qQb7ivgylS4QwGOf+3krWE5hz1I4CsSdZSc7djnw=
Date: Mon, 20 Apr 2026 07:40:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Huisong Li <lihuisong@huawei.com>
Cc: khtsai@google.com, hhhuuu@google.com, kees@kernel.org,
	kexinsun@smail.nju.edu.cn, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linuxarm@huawei.com,
	zhanjie9@hisilicon.com
Subject: Re: [PATCH v1 0/2] usb: gadget: udc: simplify lock holding using
 guards
Message-ID: <2026042034-grunt-freeware-8ce6@gregkh>
References: <20260420035722.1133418-1-lihuisong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420035722.1133418-1-lihuisong@huawei.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36331-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5624D426E47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 11:57:20AM +0800, Huisong Li wrote:
> Simplify udc_lock and connect_lock holding using guards in
> gadget_bind_driver() and gadget_unbind_driver().
> 
> Huisong Li (2):
>   usb: gadget: udc: simplify udc_lock holding using guards
>   usb: gadget: udc: simplify connect_lock holding using guards
> 
>  drivers/usb/gadget/udc/core.c | 77 ++++++++++++++++-------------------
>  1 file changed, 35 insertions(+), 42 deletions(-)

Only do this for new drivers, don't convert existing code that works
just fine for no valid reason other than wanting to clean stuff up.

Does this fix a bug?

thanks,

greg k-h

