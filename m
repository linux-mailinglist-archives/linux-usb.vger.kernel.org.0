Return-Path: <linux-usb+bounces-38274-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKC9NmB7HmrejQkAu9opvQ
	(envelope-from <linux-usb+bounces-38274-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 08:42:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB016291F2
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 08:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 357483030755
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2026 06:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A96E3A6F00;
	Tue,  2 Jun 2026 06:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QH7folVn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525222D5412;
	Tue,  2 Jun 2026 06:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780382531; cv=none; b=WOc6mmFkRwCEQZDQyMeDuZDUmRu6D1IWiDG+B8YwnzAKqZtW43a0bdrNzp4DVZSyRtyLBYlXufYZw1Wof7AtyAMpcwJ9s2C7fcjFXaaaDBRxtP4JXwPsJnoGLJq4naGQKXhMWdu9ceCO6TdTWB84BEqFrX3iQnns1BUQN/iiZDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780382531; c=relaxed/simple;
	bh=/BvtIuJaqaod6Smnrww2cwqnIZLc0N+F7oQyJ0IUlMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkSt+krSEDzEtbAM1g4qATuN7AiyzISgdzYfcRWJxTcqSsMA5VtiKuT7odYhp9higPXNQ4ocsqj5IkanW7K3v58eupT1iFNTuRTTA9RmPuL7qDMuSswAWVFDhbalyxJwC7bD50y4IUXjBANtQ3ykxiGcqOGns+N6Uw7IYtzcnw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QH7folVn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2067C1F00893;
	Tue,  2 Jun 2026 06:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780382530;
	bh=DqbZJTPPL4+f97UZ7puF0NIKCaJWCDaBOpewRU4sP+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QH7folVnpOcVYglvXiQr+uKa68di16nbg6lAuCAavvNJ7gJkd9GX6vniu3gjzNnfx
	 kxVe/NYNojmwWxjUYkX+6pHIEG0pS59xh2ewvp13ip4O0AYyu3r2sXSPghFPFEeYAu
	 nSU6sVKcMtASXUYV0ge9YC8gOBkAbyXfEcW5shYo=
Date: Tue, 2 Jun 2026 08:41:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Rao <raoxu@uniontech.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: switch HIDBP devices to boot protocol
Message-ID: <2026060216-freezable-donated-99e5@gregkh>
References: <A49C63267F00CDA8+20260602014835.2624940-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A49C63267F00CDA8+20260602014835.2624940-1-raoxu@uniontech.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38274-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8CB016291F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jun 02, 2026 at 09:48:35AM +0800, Xu Rao wrote:
> usbkbd and usbmouse are HID Boot Protocol drivers. They do not
> parse report descriptors before decoding interrupt reports; instead,
> they interpret input data as the fixed boot keyboard and boot mouse
> formats.
> 
> The HID specification defines SET_PROTOCOL as the class request
> to select report or boot protocol. Boot subclass devices may power
> up or return from reset in report protocol, and hosts are expected
> to select the protocol they intend to use.
> 
> Do not depend on firmware or a previous driver to leave the
> interface in boot protocol. Send SET_PROTOCOL(BOOT) during probe
> before the interrupt URB can be opened.
> 
> Keep failures non-fatal. Some devices may reject the request while
> still sending boot-compatible reports. For those devices, the
> existing driver behavior is preferable.

Do you really use these drivers for devices?  If so, why?

And shouldn't the failure be fatal?  If not, why even attempt to send
it?

How was this tested?  On what devices?

thanks,

greg k-h

