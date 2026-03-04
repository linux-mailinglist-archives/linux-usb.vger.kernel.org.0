Return-Path: <linux-usb+bounces-33955-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJZBMVT4p2mtmwAAu9opvQ
	(envelope-from <linux-usb+bounces-33955-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:16:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCEB1FD694
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B41EE300ADA0
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 09:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E9F394789;
	Wed,  4 Mar 2026 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jd5U/qLb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50E4386578;
	Wed,  4 Mar 2026 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615743; cv=none; b=F4kecS+uTZuj/RQJP6sRuXqdBAI07v7Rarw51yv9WbzWQNkfRMlPEaCI8ORQO+jYLoTe0TD73Ed30VL53ZouhqN8841xiQ4tr1bwPpKVKhXdOdtQGalW1Bvet7jykwRc7exd3CrqAuKGF9FeCN3x1AG/afGCONoUbCTgI1rKcMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615743; c=relaxed/simple;
	bh=WWNtgtdNdNhc+6m21fLPGumG/MYIxLI/PfXVCkc41/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUdb28Wgfc9AZctINqBSmo564zpEcPk4807y+nfDSo1p+Qn6E0ITZdW9A92gW3xapwBUOdW9Wg9JEaoyDxykd/WxK9YGDpXq5xBjhWWbFiOsM4On5/zwRZ95OgOZQmJATVhDZr2W8cbY3VzNv4Ev07FiX9HzIlkLBB+HbwiOciA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jd5U/qLb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89A5C2BC87;
	Wed,  4 Mar 2026 09:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772615743;
	bh=WWNtgtdNdNhc+6m21fLPGumG/MYIxLI/PfXVCkc41/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jd5U/qLbohn8Fqrmi+w8agysAb7RueB+VUIlFbxfkeI3FVF3m2e0iuh6FdrHJYOyR
	 vytdwUKgQB997YBc+4qMh4eofCYrxLSIkSacXu5CpdyrqeQh8xzewDlPu40yQKH+2o
	 cjJBf8fXb45K32wCXJpcZ5N/+rcefslyNX2TtBLs=
Date: Wed, 4 Mar 2026 10:15:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: oneukum@suse.com, robert.hodaszi@digi.com, kees@kernel.org,
	linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: Re: [BUG] usb: cdc-wdm: Missing barriers in ad-hoc lockless buffer
Message-ID: <2026030447-remake-bondless-d00c@gregkh>
References: <CALbr=LbrUZn_cfp7CfR-7Z5wDTHF96qeuM=3fO2m-q4cDrnC4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALbr=LbrUZn_cfp7CfR-7Z5wDTHF96qeuM=3fO2m-q4cDrnC4A@mail.gmail.com>
X-Rspamd-Queue-Id: CCCEB1FD694
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33955-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.com,digi.com,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 04:41:32PM +0800, Gui-Dong Han wrote:
> Hello maintainers,
> 
> I would like to report a potential concurrency bug in
> drivers/usb/class/cdc-wdm.c.
> 
> The driver implements an ad-hoc lockless buffer using desc->ubuf and
> desc->length. In wdm_read(), the read side checks
> READ_ONCE(desc->length) outside the spinlock. However, the write side
> in wdm_in_callback() updates the buffer and length without WRITE_ONCE
> and any memory barriers.
> 
> Due to compiler optimization or CPU out-of-order execution, the
> desc->length update can be reordered before the memmove. If this
> happens, wdm_read() can see the new length and call copy_to_user() on
> uninitialized memory. This also violates LKMM data race rules [1].
> 
> Additionally, the driver relies heavily on set_bit() and test_bit() on
> desc->flags for synchronization. These bit operations do not provide
> implicit barriers, which might lead to similar ordering issues.
> 
> Proposed solutions:
> 1. Short-term: Add WRITE_ONCE() and smp_wmb() on the write side, and
> smp_rmb() on the read side.
> 2. Long-term: Replace the ad-hoc buffer with kfifo. This is a classic
> single-reader (holding desc->rlock) and single-writer (holding
> desc->iuspin) scenario, making it a perfect fit for kfifo.
> 
> I discovered this issue while studying the driver's code. The presence
> of a READ_ONCE() on the read side without a matching WRITE_ONCE() on
> the write side caught my attention as a potential data race under the
> LKMM. In my opinion, implementing ad-hoc lockless algorithms directly
> within individual drivers is highly error-prone. To avoid these subtle
> memory ordering and barrier bugs, drivers should rely on established,
> well-tested kernel libraries like kfifo to handle this type of
> concurrency.
> 
> I am currently trying to reproduce the issue via stress testing on
> ARM64, though the race window is tight. I will also attempt a kfifo
> refactoring. However, since I am not familiar with this specific
> driver, I welcome anyone else to take over the kfifo conversion to
> eliminate these potential bugs and simplify the code.
> 
> Thank you for your attention to this matter.

Patches to help resolve this would be great, and yes, moving to kfifo
might make this work much better overall.

thanks,

greg k-h

