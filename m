Return-Path: <linux-usb+bounces-35928-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /mCCJ6Zgz2kVvwYAu9opvQ
	(envelope-from <linux-usb+bounces-35928-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 08:39:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE54391745
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 08:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BA5030180B1
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 06:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734F33009E2;
	Fri,  3 Apr 2026 06:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mHfefxwL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042B21A294
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 06:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775198299; cv=none; b=pYMR4j89DTn+6wJQPVyBvDE1mN4ZJUW1RVh7FVZebCKEQ5f7CXgYO3hMD82EMS/Tj9N0t8RaE6YL7FSQRwsweBMqb8UKtXMvCqC+2UAyjuNJjTVABu9nz2Eo4+BoSJ9/Bea+PfmGVFioXTidMICI4Jsg1+tokKQuy9jlmj19wlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775198299; c=relaxed/simple;
	bh=5OVq/IdFI9V/D93LbYYatxZeTE7xlGqaJRoluzNMdOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rr0wv6AvjIxDYryn9i3nkMfVUNunkBYQ28PPc7ZxC+SKUP6CLzQRcA1Bb/h/wCk0THdttQUrkgVhVQbSKTcVay5R3MQFA0nicEQOkHnS9VnMEXNc57SrqCGCdpHHL5V1UIbjIMMQ+E4htJ9QM7LnaAcwmKaHjcLBt4uO50KNATc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mHfefxwL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FAFC4CEF7;
	Fri,  3 Apr 2026 06:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775198298;
	bh=5OVq/IdFI9V/D93LbYYatxZeTE7xlGqaJRoluzNMdOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mHfefxwLsFqdGRHlyXpSNKbQukiTjqN6/FJnCv5/lyzvgbzXpN+Vfn6maBdToT72x
	 qOg+Shb3y0xCTW5LPF4KaeQ+h1rGHAB30yBUaUE3tIeewrrev7WkJrfc+XICTkwHQa
	 DbgcF7IXtc1yI2b3+gnp2WFbWg2Xa64AjGTj+nYI=
Date: Fri, 3 Apr 2026 08:37:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing] BUILD SUCCESS WITH UNVERIFIED WARNING
 25e531b422dc2ac90cdae3b6e74b5cdeb081440d
Message-ID: <2026040343-gnat-aqueduct-753c@gregkh>
References: <202604031342.WrjEctjz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202604031342.WrjEctjz-lkp@intel.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35928-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0EE54391745
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 01:18:52PM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> branch HEAD: 25e531b422dc2ac90cdae3b6e74b5cdeb081440d  usb: xhci: Make usb_host_endpoint.hcpriv survive endpoint_disable()
> 
> Unverified Warning (likely false positive, kindly check if interested):
> 
>     drivers/usb/typec/tcpm/fusb302.c:1790 fusb302_probe() warn: 'chip->gpio_int_n_irq' from request_threaded_irq() not released on lines: 1779.

Nice, this is an older issue, good catch!  But not directly related to
the change that is currently in this tree at the moment.

thanks,

greg k-h

