Return-Path: <linux-usb+bounces-37127-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPvmOeXf/Wn0jwAAu9opvQ
	(envelope-from <linux-usb+bounces-37127-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 15:06:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 560004F6C57
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 15:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B50E305958F
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 13:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903F53E0238;
	Fri,  8 May 2026 13:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RtmtUSXl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A31830FF21;
	Fri,  8 May 2026 13:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245476; cv=none; b=O6pCLaCrN8bS2+H7BLtv0o+MyMTmeISmyOEdYQ9wf6fR2geHUIB2hkLUIaK9oYVkmyIoV8rja9w/+5A7jYeZiomZ6XJlk1BQw5mMYJS1PRtADJ2MSxa6mP2JwKu/aUSiNzOmes7dEAbugOKpKHirTn6zIHf1mG+wVA4HX/FKZRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245476; c=relaxed/simple;
	bh=2fuNx3MG3A38hDN0Jaqrg3k3SMINqn9YDZolzMJpTpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aq1H0mgtf2pV2X2p5H5DMmBo88lN3itu05srRIo6I7do+Ha302V3OJrgh2lNYDAWYmVqRT1Q73dJgKecWnBE3Ee/YoKVQI5Df9WbfotsJGsMfEIcMQzGNmaGtsldDqxnOC7T2PLN68KHt5PPaDSr2c+FaWRGSXA+93Rjh/5lBwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RtmtUSXl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8DFC2BCB0;
	Fri,  8 May 2026 13:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778245475;
	bh=2fuNx3MG3A38hDN0Jaqrg3k3SMINqn9YDZolzMJpTpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RtmtUSXlr81wxrfK6oZfEPcAj7e40WRlskBj1kiqqpz6FwddrrY0+XjyQgDuvDbc7
	 QqQRDUWmQ6a/467kadc0pJ8n6OeOzXivh1NIcJ2qTTN3trzkW0A6IxEHmpSRPRQVFq
	 40zZNLVA6RO2VTOo+U8faaqx6U7d04doEXiN5Yxc=
Date: Fri, 8 May 2026 15:04:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: heikki.krogerus@linux.intel.com, nathan.c.rebello@gmail.com,
	kyungtae.kim@dartmouth.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.6 & 5.10] usb: typec: ucsi: validate connector number
 in ucsi_connector_change
Message-ID: <2026050857-blanching-clapping-db2c@gregkh>
References: <20260508092026.1364820-1-lihongbo22@huawei.com>
 <2026050843-denatured-bonfire-6337@gregkh>
 <1886be01-2dcf-4aa7-9aac-067634db4ce7@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1886be01-2dcf-4aa7-9aac-067634db4ce7@huawei.com>
X-Rspamd-Queue-Id: 560004F6C57
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37127-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 08:59:06PM +0800, Hongbo Li wrote:
> Hi Greg,
> 
> On 2026/5/8 19:03, Greg KH wrote:
> > On Fri, May 08, 2026 at 05:20:26PM +0800, Hongbo Li wrote:
> > > Commit d2d8c17ac01a ("usb: typec: ucsi: validate connector
> > > number in ucsi_notify_common()") and commit 5a1140404cbf ("usb:
> > > typec: ucsi: skip connector validation before init") add the bounds
> > > check when do the connector change both in pre-init notification and
> > > the forward notifications. But they are difficult to backport to
> > > early stable branch such as LTS 6.6, LTS 5.10 due to many dependencies.
> > > Instead, we choose to validate connector number in ucsi_connector_change
> > > directly to avoid out-of-range issue.
> > 
> > Why just these 2 branches?
> 
> I only noticed these two branches, but in fact, there are more.
> 
> > 
> > And what specific commits are needed exactly?  Why not just backport
> > them all?  that will make future changes apply properly as well, making
> 
> Commit d2d8c17ac01a ("usb: typec: ucsi: validate connector number in
> ucsi_notify_common()") use the ucsi_notify_common helper which is introduced
> in 584e8df58942 ("usb: typec: ucsi: extract common code for command
> handling"). This commit refactored part of the code and involves many
> modifications to USB ucsi controllers (such as stm32g0...), which were
> introduced after 6.6.

So just 2 commits?  that's nothing, we have taken hundreds of commits of
backports in the past.  Please try to stick to what is exactly upstream,
it is easier for everyone overall.

thanks,

greg k-h

