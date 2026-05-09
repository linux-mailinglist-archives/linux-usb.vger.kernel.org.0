Return-Path: <linux-usb+bounces-37172-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLg0IN6v/mkqvAAAu9opvQ
	(envelope-from <linux-usb+bounces-37172-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 05:54:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4C44FDF8D
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 05:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DB9D301CFA2
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 03:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3824C381AEF;
	Sat,  9 May 2026 03:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CRd5Vfyl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEE723D2A4;
	Sat,  9 May 2026 03:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778298820; cv=none; b=uA/TG9FVf8hLjhlyGrtUrlGGAV0H26m4vxk4l75/O4FBbT4Q/HR7znIfusQ00enYSuJbiDRQ+B8Bauya99mjXkB5kOsUk4csPBVADcARSzDm9muJ9PHdu3ALkPnbLLaPirUts0qzrS6GmPaLTbWfJLbEcNaBKaGMOt5uonVIbUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778298820; c=relaxed/simple;
	bh=rTH7mme/q0mPgqjdeQpIIQ0e+KurTSQvbSqZywy0urw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtSBB6+LFPpZmHp3XwgBC+fRIVIofpTtO2ZwP7CBw3iHz7Br8VmXbiGQRT0S87NMJfDjj2NtO4O+n0G0xrYvoWkWpR51LV6iqmq31zUxN8sY7DUoLR7y4jT7XPmxTaKirnzxOIQD5++c+IfCpNneDZx+En1yy1urUm4gvXHFDjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CRd5Vfyl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3292C2BCB2;
	Sat,  9 May 2026 03:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778298820;
	bh=rTH7mme/q0mPgqjdeQpIIQ0e+KurTSQvbSqZywy0urw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRd5Vfyl2E0/H9daX10o6AwcTilR8dOYsrta+0xLX502jGoHZComwQCj0rcg5bze0
	 9wWl4yqdSnIAg25SGApD+uMDhgwDSb8CeNIORt7wbAdCKXaDzHfq6peM0JJK9WlWNj
	 0eREpeve9UFdEHjF1qKSrex1ezOTRMT6A7VmovB8=
Date: Sat, 9 May 2026 05:52:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: heikki.krogerus@linux.intel.com, nathan.c.rebello@gmail.com,
	kyungtae.kim@dartmouth.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH 6.6 & 5.10] usb: typec: ucsi: validate connector number
 in ucsi_connector_change
Message-ID: <2026050900-canning-gaming-5de4@gregkh>
References: <20260508092026.1364820-1-lihongbo22@huawei.com>
 <2026050843-denatured-bonfire-6337@gregkh>
 <1886be01-2dcf-4aa7-9aac-067634db4ce7@huawei.com>
 <2026050857-blanching-clapping-db2c@gregkh>
 <d6cd0a90-526c-4dfb-8677-3b0d4e48e210@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6cd0a90-526c-4dfb-8677-3b0d4e48e210@huawei.com>
X-Rspamd-Queue-Id: ED4C44FDF8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37172-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,dartmouth.edu,vger.kernel.org,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 11:32:08AM +0800, Hongbo Li wrote:
> Hi Greg,
> 
> On 2026/5/8 21:04, Greg KH wrote:
> > On Fri, May 08, 2026 at 08:59:06PM +0800, Hongbo Li wrote:
> > > Hi Greg,
> > > 
> > > On 2026/5/8 19:03, Greg KH wrote:
> > > > On Fri, May 08, 2026 at 05:20:26PM +0800, Hongbo Li wrote:
> > > > > Commit d2d8c17ac01a ("usb: typec: ucsi: validate connector
> > > > > number in ucsi_notify_common()") and commit 5a1140404cbf ("usb:
> > > > > typec: ucsi: skip connector validation before init") add the bounds
> > > > > check when do the connector change both in pre-init notification and
> > > > > the forward notifications. But they are difficult to backport to
> > > > > early stable branch such as LTS 6.6, LTS 5.10 due to many dependencies.
> > > > > Instead, we choose to validate connector number in ucsi_connector_change
> > > > > directly to avoid out-of-range issue.
> > > > 
> > > > Why just these 2 branches?
> > > 
> > > I only noticed these two branches, but in fact, there are more.
> > > 
> > > > 
> > > > And what specific commits are needed exactly?  Why not just backport
> > > > them all?  that will make future changes apply properly as well, making
> > > 
> > > Commit d2d8c17ac01a ("usb: typec: ucsi: validate connector number in
> > > ucsi_notify_common()") use the ucsi_notify_common helper which is introduced
> > > in 584e8df58942 ("usb: typec: ucsi: extract common code for command
> > > handling"). This commit refactored part of the code and involves many
> > > modifications to USB ucsi controllers (such as stm32g0...), which were
> > > introduced after 6.6.
> > 
> > So just 2 commits?  that's nothing, we have taken hundreds of commits of
> 
> No. This is not an issue of the number of backport patches.
> 
> For commit 584e8df58942, it refractored the logic based on a higher version
> (higher than 6.6) which introduced new ucsi controllers (yoga_c630 for 6.6,
> yoga_c630, glink and stm32g0 for 5.10). So we should remove some extra code
> and resolve conflicts if we backport this patch to the target branch like
> the first way I mentioned.
> 
> But I looked at the modification logic of the commit d2d8c17ac01a and commit
> 5a1140404cbf, and I think it can be made simpler (like the patch I post), of
> course, this requires the maintainer to help review it.
> 
> And we need Krogerus and Rebello to take a look.

There is no requirement for any maintainers to deal with stable
backports if they do not want to.  As you feel you are stuck with these
old kernel versions, I suggest you make up the patch series and post
them for review, as you can test them the best.

thanks,

greg k-h

