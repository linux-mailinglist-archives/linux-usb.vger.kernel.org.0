Return-Path: <linux-usb+bounces-35623-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePFmBwTFyGnBqQUAu9opvQ
	(envelope-from <linux-usb+bounces-35623-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 08:21:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AC197350EC2
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 08:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3638030078AB
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 06:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AE0299959;
	Sun, 29 Mar 2026 06:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VkEpQT4c"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE144481B1
	for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 06:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765312; cv=none; b=h6hhxYlZW+AVW4whIKQs/JctQSqREUirl+rZyM8j8huWP3aBDVTfeo3xBkVwUlAnw8KB2Zyt5Rf6bSKu6u8u0mLmfX+AiMRVswuqlhZmOjEtVfTAurxiHioMQ/JB2CdR1yNIZ4XrDA3ymbQJWIIM+KDb0MvvlpXfIizxptAoRyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765312; c=relaxed/simple;
	bh=nWkR0Y6LyVvfHuw9dNJtt9jDJB8tHJGTUtxIr+ytpJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHZHqZFZacjWiwGGjW+oQ5BVM8a1mjpUPn6xOYvHefwQjisIrABr9UJMYyq+lnBgT+zgyTFQj4cP7SJucL48887C/QvMnlAXTMErcLLhH3MVa2/+t1B/l8PqRz3tFTbOm1KD7rPd+CkNrY0MXwNq6bi07024hEaqPyC8JPEa4SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VkEpQT4c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F649C116C6;
	Sun, 29 Mar 2026 06:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774765312;
	bh=nWkR0Y6LyVvfHuw9dNJtt9jDJB8tHJGTUtxIr+ytpJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VkEpQT4cQMA/TuI9CqRxuP82P0dS7NRKnjreFYOwqdS9j6U5NrkIHt2yfhgvlbn3U
	 QTd4XYxwLpQRRpjwVdXOyeE8WzlRVZf88b0/vIgeoZjtGSTTygsaZFIq789HLzTvkk
	 2vwgBnmLSwqtVUDkpEQGLZufGM5QU/dwnxJsGT1w=
Date: Sun, 29 Mar 2026 08:21:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Johan Gill <johan.gill@bahnhof.se>
Cc: linux-usb@vger.kernel.org
Subject: Re: UAS peripheral with unrecognized TRIM support
Message-ID: <2026032920-enforcer-saxophone-7707@gregkh>
References: <1717beab-848b-4927-8fa5-26fb5ae05495@bahnhof.se>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1717beab-848b-4927-8fa5-26fb5ae05495@bahnhof.se>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-35623-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC197350EC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 05:23:48PM +0100, Johan Gill wrote:
> Hi, I have tested running Linux on the StarTech USB312SAT3CB USB 3.1 -> SATA
> adapter. It's a more stable UAS implementation than my previous adapter but
> the device is not recognized as supporting TRIM out of the box (kernel
> 6.19.9). The technical specifications at
> https://www.startech.com/en-se/hdd/usb312sat3cb indicate that TRIM is
> supported, so I enabled it by setting ATTR{provisioning_mode}="unmap" in a
> udev rule and then fstrim indeed seems to work when I run it. The
> specification claims that it uses ASMedia ASM235CM, but the device uses the
> StarTech vendor id and identifies as 14b0:0207.
> 
> It would be nice to have the adapter recognized as more capable out of the
> box. Should I aim at patching drivers/usb/storage/unusual_uas.h?

Isn't that a scsi issue, not a USB/UAS issue to be reporting that value
properly?  That sysfs attribute comes from the storage portion of the
kernel, not the USB portion.

thanks,

greg k-h

