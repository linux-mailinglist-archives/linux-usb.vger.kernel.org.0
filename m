Return-Path: <linux-usb+bounces-38194-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIVIBgzpG2o0HQkAu9opvQ
	(envelope-from <linux-usb+bounces-38194-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 09:53:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4A4614DB4
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 09:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9949F30074AC
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 07:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0115E379C37;
	Sun, 31 May 2026 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="or5SJjzj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iv+V83wS"
X-Original-To: linux-usb@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63712204F8B;
	Sun, 31 May 2026 07:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780213913; cv=none; b=EUs7kT2iIt/OppPI2qZs2x/NcorGRGD+gEohubmTUiOwCiE09PAyEn+FELxHIK9N5dGLYZflpo2XnY61pBsRjxThManvZ41eCCfbTA/mSlQ230MX61G6tEp9tcXiK2ZsYoyEQtnVK+YrepmwB2VKDyPNyT8MzevXBD1oO6orx28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780213913; c=relaxed/simple;
	bh=8GZ3/hUNGwLe77dinBdk9xjuAutvaOVEUxlzK/aq/LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FudJBIW9eezIvzf876d06hWZq+Bm1gF/1nv3cSvFYtad6D/bczOubJQb6bcMveJ7VjRS8vU1xJKhglErcuqLC2ss3O3GQZZywCOPXn6cSfsGwUPZ46Y+f9XMlGksABfiTTHAUJTmfg7GlIU3+RHyRX2ueM+K9jcmAX8aOaNy998=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=or5SJjzj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iv+V83wS; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 6F457EC068C;
	Sun, 31 May 2026 03:51:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 31 May 2026 03:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1780213910; x=1780300310; bh=BKD+ARYfvg
	j3NQJNA5QDhOX+I9jgne18DYk3JkYQwJI=; b=or5SJjzjwtIycplJwxtyvKbS8j
	V1t9f3CYtTl7pQGquZ8Wvvv0w8OB5hgr7c6BtmS/Xs2jQCW8Jvu20sQmrDljHvO6
	iCzByt7ug5fPqrTG8i8IWj+eTKs5Poxa0GQWSUfIdtS8LCyagfJhgzHFTubi2ZhO
	fq9itky0rQbpreP0RGEwjko5QvSmwEkSfRqlMBjJsXzRVmR9fAH/K2+WG8ffmVv+
	+xhr6jRI7hrQAjTuSdC8jsYaiaucXQ3c54crP9vFtH5pnL94pwlIp/Sw7udNbjU1
	tLU2UenXXm2/HnemQtzCV6PsPHoRXt+oUUtP2tVXxsQkKrbryCMhph6Sivaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1780213910; x=1780300310; bh=BKD+ARYfvgj3NQJNA5QDhOX+I9jgne18DYk
	3JkYQwJI=; b=iv+V83wS19Q5yyOF9ir6YtNYjJurJYmLQyRU15pxaGNVzSjvq6M
	wRpKT3EXF+cupa1/ITlN6EYJJIGnsGcJoFkTvh3V6ao1hWzdIC1TbU4Umuo5QjBp
	+B/YBKZb6C9LBZnwvI+7FbDoQTjC0cElU40WKqWRAEVMrqupoJQ3wxpkPqK7DSvf
	VwBsZFNjhTmrnuqaqL0rTeELhKILw22EaJ2jFCb2gNQtiOgAss2KvH6S/ELKQnDP
	ab4fMKVIZ7QIOfa1x3tshFNxwV7lav8FME6NjnLRi9QnQAfnw7Ooxlwrt9gH4+t+
	Vv2+hPo9ZQ3Tu7QAn4FzuDw/RvvqEmvgyDg==
X-ME-Sender: <xms:lugbajla2NR5Hh4Q86xkt_ELAf1omzboCzqZZXpogDKr_EjycmuzRQ>
    <xme:lugbanRWW61kP6DDkF0UPkYvrBov6rwmJ5Q0-WTf6mOwrHiR5XaxBjcoyWDKih4U0
    T5TTGBTeggKB9lZIfnfKyfwLQCwDPn_53kxVFr4S9dax8_2VJo>
X-ME-Received: <xmr:lugbaqUDh_Ot-xPTh9glJ0WSXEySchgZSBeNC-j2nciPZITJDDYv0j3MiTI>
X-ME-Proxy-Cause: dmFkZTEt2lzqlOMNu2CPDmlJS1jCIQs8e6x5Ff9TbMoFbj+5ctHZk8wRjhh86lBnVYaWvI
    XWOgPk3QsnDD3FpOX8XOYoop95/JrQXB8WMSVcnIKiV3NjH/BtpbLzawxc5UOCFzCL/tVD
    qHgMeLEePm9nv3Zg9nMQxdRwzIPQblstbeaxHSbzD2Thwh5CO9oc4HUiS4mGOj321ke9jH
    tYb4IIK9wfIcWwt/Msq8r9bl3U/Q2RJKjWcuXKIsBV2SLULZc/bEfzoRs82ghQd9lI2e+A
    GJbp2jU5qnTSWz/UOT8m2sDlEHRURabrWTCAW5+0zhJ7ne6hW2JUK7VDVhNQ3kE/vCQ6Vv
    XvBjGygGTmOtA46Kc5jkNmxqkK7BErlMbp3FOihfp4ykHLHR89M324e8xvQ87YWUYuJpyW
    HPDQYdvKXREqOrHIT5cFN2j+qVc6UdV0gR6dhSrFW645EbLu+4rIJcNbzGxf56kzlABFpU
    2BJo8Xaf6Cj0t9RqnGmS8rdMY+MlPDg0sK4rD8ID82uX6ga3LDPCm5hyDFD7G4/UODUUNY
    F9PHIeQQEnssHHCq4A2trydvwAYj1WAtzRZ+hsDFOOgyUIb8V3Rsu5zpTHCYwX1IqI1SIk
    hMoFdiGcyQO1yb+1ynIJ/wr3lZPC+bme9r8eR+sEGtYcLSwipBnJz/SLlYZA
X-ME-Proxy: <xmx:lugbajKyqudQP-FQXesY50AM1vPGKNzrvuDdwTKHYfhXt3zHrBwpKw>
    <xmx:lugbai0EhRW8_fqEisqNHHZFUCS16WjiyiGmEZ-sc6beZaP0f-mxaA>
    <xmx:lugbaoI2VLtCSnS1TDcUB6mEO0bKV_hytaVCGz-B9cahbRMObXgZcA>
    <xmx:lugbaljZycOnEV1o8b6vnPkm7aj4hHR5b9mPA3bRQKLsoNPaXPSLzQ>
    <xmx:lugbasw5lNlTiJa0iSuDe0tIyTjnnXeqFVjxw3VY3-5eSBHddo9n7hb0>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 31 May 2026 03:51:49 -0400 (EDT)
Date: Sun, 31 May 2026 09:50:55 +0200
From: Greg KH <greg@kroah.com>
To: Sardaruddin Syed <ssardaruddin2002@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: ABI: remove outdated USB power/level
 removal notice
Message-ID: <2026053140-approve-enroll-5681@gregkh>
References: <20260530233410.1718-1-ssardaruddin2002@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530233410.1718-1-ssardaruddin2002@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kroah.com,none];
	R_DKIM_ALLOW(-0.20)[kroah.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38194-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kroah.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,messagingengine.com:dkim,kroah.com:dkim]
X-Rspamd-Queue-Id: AE4A4614DB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 11:34:07PM +0000, Sardaruddin Syed wrote:
> The sysfs power/level interface is still implemented and documented
> despite the removal notice stating it would be removed after 2010.
> 
> Remove the outdated removal timeline while keeping the deprecation
> notice and recommendation to use power/control instead.
> 
> Signed-off-by: Sardaruddin Syed <ssardaruddin2002@gmail.com>
> ---
>  Documentation/ABI/obsolete/sysfs-bus-usb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/obsolete/sysfs-bus-usb b/Documentation/ABI/obsolete/sysfs-bus-usb
> index bd096d33fbc7..067016e62e11 100644
> --- a/Documentation/ABI/obsolete/sysfs-bus-usb
> +++ b/Documentation/ABI/obsolete/sysfs-bus-usb
> @@ -26,6 +26,6 @@ Description:
>  		initializes all non-hub devices in the "on" level.  Some
>  		drivers may change this setting when they are bound.
>  
> -		This file is deprecated and will be removed after 2010.
> +		This file is deprecated.
>  		Use the power/control file instead; it does exactly the
>  		same thing.

Why not just remove it instead?

thanks,

greg k-h

