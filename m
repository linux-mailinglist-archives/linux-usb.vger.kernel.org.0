Return-Path: <linux-usb+bounces-33107-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JuCAstZg2mJlQMAu9opvQ
	(envelope-from <linux-usb+bounces-33107-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 15:38:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FDCE7347
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 15:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 204DB3003986
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 14:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4633C41B341;
	Wed,  4 Feb 2026 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k91DyFBv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5143296BDC;
	Wed,  4 Feb 2026 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215878; cv=none; b=fbX+y4VxMQp1jqDlmuq5yGZicqAM3IPBvrt8Vkc+UOljyf1Wegs/X6vtF62Cnjs8SQsn52k7KGYK+ZHgAn2ZZcnLnXTwfAzusA5deJuXyOSogZIp1tIk7t7lefIugp/g/X0eYl9PuDMphcEk/YJj2Vgo38XXdVgFGEcmFmsWwX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215878; c=relaxed/simple;
	bh=WXoGN7+t2NYyHhckED6tAKzT65xvz01/Ufe9ixhrkRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQfE83vPn76xoy9sdmd+rKnJTWZHbAuwQbtj7/mLXsasJ6FB3BQMBvHTkBK23+kclUlDm2cCvagamlYziIzTz3/sutLst6dXK7kepLvQKgqnNLYqTnSWWbLSTixPbaNuHybSiIXIW7HKOG8T8uEb5Dsa/lPQOt5jm9jO+kHjNnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=k91DyFBv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB99AC4CEF7;
	Wed,  4 Feb 2026 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770215878;
	bh=WXoGN7+t2NYyHhckED6tAKzT65xvz01/Ufe9ixhrkRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k91DyFBv/DH+7HXShlpenEc15VOx9IuiFPDj08aUgGn6Z6ZDRNcWLPa9ZgZBHyLLG
	 OmKUZBtAqzLJxXMFZPqzkMQ1JjC7v+TAVWWaLMLajwid9683dF26ir+VuV6xVdXJ3H
	 PFzq0qA6qHc3WNXCxklzz20K0Rfm5qoj+mFMQqAU=
Date: Wed, 4 Feb 2026 15:37:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: A1RM4X <A1RM4X@a1rm4x.com>
Cc: A1RM4X <dev@a1rm4x.com>, linux-usb@vger.kernel.org, limiao@kylinos.cn,
	oneukum@suse.com, huanglei@kylinos.cn, lijiayi@kylinos.cn,
	johannes.bruederl@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: add QUIRK_NO_BOS for several devices
Message-ID: <2026020419-drilling-area-0c1f@gregkh>
References: <20260204032938.61553-1-dev@a1rm4x.com>
 <2026020457-distrust-vision-e5de@gregkh>
 <CACy+XB-Z26Bx2Zb4omoRq00L4tTAQxe4QWSQ1f=eFMryqb8Ksw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACy+XB-Z26Bx2Zb4omoRq00L4tTAQxe4QWSQ1f=eFMryqb8Ksw@mail.gmail.com>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-33107-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[a1rm4x.com,vger.kernel.org,kylinos.cn,suse.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: A3FDCE7347
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 09:25:18AM -0500, A1RM4X wrote:
> Hi,
> 
> Please find attached the new patch which fixes the structure of the commit.

Also, you sent a patch on top of your previous patch which was not
accepted, and so this wouldn't even apply to our trees at all :(

Please always make a "clean" patch.

thanks,

greg k-h

