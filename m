Return-Path: <linux-usb+bounces-36333-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAhtOmnI5WlIoAEAu9opvQ
	(envelope-from <linux-usb+bounces-36333-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 08:32:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B314273BE
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 08:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47C08302D506
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 06:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A353E3822A7;
	Mon, 20 Apr 2026 06:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dGb/HEWy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A53015746F;
	Mon, 20 Apr 2026 06:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776666692; cv=none; b=qm4v4CB/CrvfLk+0mZhTKDFH+FdPZ2mX98KYm8viSeyq2AouzWlLRh67JdjsBG/aHn9R5gkF6WHaHoZnXP2BQGR4BGThkpJh6XVfxoHWHmcFY1efhYBW/XvlNZZFCWUpl+b43fEMU8P48hHhM080gfbQseOksjRRK3GSL2oCxKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776666692; c=relaxed/simple;
	bh=HGifKYmNGlQnwqWMHJVayWU1IeUZFFm61XjY/6N+lkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8duU+dWJrEcPgOYmmp/3iPdQQEXFyZ0UdpDOCWEtoyb2ff/0m95LfX4MMjso2D3IQq4FlfxVVgO6b/KKqQsWue5qAvX6T2wlWrByvmcddiwhCX+4zHCWN8zBOX2CUHH3wfbJveLJEARwgtU1lBuOEFttX35mUrSmjlb0JhKCT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dGb/HEWy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BF7C19425;
	Mon, 20 Apr 2026 06:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776666691;
	bh=HGifKYmNGlQnwqWMHJVayWU1IeUZFFm61XjY/6N+lkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dGb/HEWyct3eexHT97H45FSiNYth0dCZWsqW4Wa8wSgRS8uiEaikuCFGMDAd9dM5E
	 fTiA0nYC+Pjk4OaJY3COyBRISOsl6mZps7wqJDdjLtbrxf8qy92rUlEPPDpl87jwW7
	 ljqPqe4Mkr/qs4M2M2HPuwDsNTQEGgUD5Knlq2/E=
Date: Mon, 20 Apr 2026 08:30:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "lihuisong (C)" <lihuisong@huawei.com>
Cc: khtsai@google.com, hhhuuu@google.com, kees@kernel.org,
	kexinsun@smail.nju.edu.cn, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linuxarm@huawei.com,
	zhanjie9@hisilicon.com
Subject: Re: [PATCH v1 0/2] usb: gadget: udc: simplify lock holding using
 guards
Message-ID: <2026042024-mystify-mountable-a406@gregkh>
References: <20260420035722.1133418-1-lihuisong@huawei.com>
 <2026042034-grunt-freeware-8ce6@gregkh>
 <85cc1f7c-9d43-4dfb-8b05-d95ddd86a932@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85cc1f7c-9d43-4dfb-8b05-d95ddd86a932@huawei.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36333-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 64B314273BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 02:21:01PM +0800, lihuisong (C) wrote:
> 
> On 4/20/2026 1:40 PM, Greg KH wrote:
> > On Mon, Apr 20, 2026 at 11:57:20AM +0800, Huisong Li wrote:
> > > Simplify udc_lock and connect_lock holding using guards in
> > > gadget_bind_driver() and gadget_unbind_driver().
> > > 
> > > Huisong Li (2):
> > >    usb: gadget: udc: simplify udc_lock holding using guards
> > >    usb: gadget: udc: simplify connect_lock holding using guards
> > > 
> > >   drivers/usb/gadget/udc/core.c | 77 ++++++++++++++++-------------------
> > >   1 file changed, 35 insertions(+), 42 deletions(-)
> > Only do this for new drivers, don't convert existing code that works
> > just fine for no valid reason other than wanting to clean stuff up.
> > 
> > Does this fix a bug?
> Here not to fix a bug. But prepare for fixing a bug in link[1].
> I found that there are many unlock of udc_lock in error path after that
> patch.
> So use the guard to simpliy them by the way.
> 
> [1]https://patchwork.kernel.org/project/linux-usb/patch/20260420040223.1232745-1-lihuisong@huawei.com/

So those patches must be applied in order?  That was not obvious and I
would have gotten them wrong :(

The policy of these guard usages is not to add them just to "clean up"
the code, only use them to actually fix real bugs today, or in new code.
Otherwise the churn in the kernel tree would be huge for no valid
reason, and cause even more bugs with backports than this pattern causes
today.

thanks,

greg k-h

