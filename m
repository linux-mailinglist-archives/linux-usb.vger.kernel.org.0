Return-Path: <linux-usb+bounces-32820-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPBqH6rYeGmftgEAu9opvQ
	(envelope-from <linux-usb+bounces-32820-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 16:24:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5027396A02
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 16:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A56D930BE12A
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 15:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95C0361DA9;
	Tue, 27 Jan 2026 15:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XtcdDFpD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C51361DA4;
	Tue, 27 Jan 2026 15:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526643; cv=none; b=AOj1TZvx6qM+e2y4ImZkBjIaxP7C9azFqGsgOFhQIUXLPpY9UtGgrtH5wofUIjqGj7alUpwd/JNEnUC52FTMYiebSZYvQ8VM5PvXlWhiEfBzCu0z/Fn5u69DMEvZuPWrgYmtFyCD6MiOCHna2I82IzRwnfcGcVP3LtL9lbzYqwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526643; c=relaxed/simple;
	bh=SsFI/hLnZqLEvbA3Igkqv/4iI25dkTn8ytkXfTeXiKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHm6vyMRmvFCZ96CKqGVc8EZYqJ/RU4bdOsmEfHZH8b/BiKiqCmgs5tv5pRRG5F6mEv7EYoOu3QzBLYtkyyQjuNAPcduk/CSp/mQARSZlJE4hoymhDCKzFenJP10rZfyhY1yMimptxx+ZejuYAycv0lVbFUOWE1L6ePBaKjFdww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XtcdDFpD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C11FC116D0;
	Tue, 27 Jan 2026 15:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769526643;
	bh=SsFI/hLnZqLEvbA3Igkqv/4iI25dkTn8ytkXfTeXiKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XtcdDFpDHNky+G4CEvk2jsPHbnfW7khme5CwLFHMseEv6FKFZvTMUmt2h1abhbfR0
	 InXslxCT4geBOv1gfHtWxwGCxgUsc5KQaG2qLDhGQ+1MI05SmVI5OeuhSA4Gb/rtE6
	 LkLSJ5Cjn9+dY0bRqZ6NLMb28M7IBP7QrkQp9KWs=
Date: Tue, 27 Jan 2026 16:10:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jan Remmet <j.remmet@phytec.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v2] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Message-ID: <2026012728-figurine-cheesy-5e9e@gregkh>
References: <20260127-wip-jremmet-hd3ss3220_vbus_split-v2-1-f615d4e88634@phytec.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-wip-jremmet-hd3ss3220_vbus_split-v2-1-f615d4e88634@phytec.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32820-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5027396A02
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 03:42:15PM +0100, Jan Remmet wrote:
> Check regulator state as peripheral and detach can disable vbus.
> Without this check we will try to disable the regulator twice if
> we disconnect host and then connect as device.
> 
> Fixes: 7e7025811579 ("usb: typec: hd3ss3220: Check if regulator needs to be switched")

I don't see a commit with that id and name in my tree anywhere, nor in
linux-next.  Are you sure it is correct?

confused,

greg k-h

