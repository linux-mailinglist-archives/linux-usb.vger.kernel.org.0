Return-Path: <linux-usb+bounces-38120-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBPAAT/uF2p8VwgAu9opvQ
	(envelope-from <linux-usb+bounces-38120-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 09:26:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A18EC5EDA54
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 09:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CA023186E40
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 07:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEEF32D0CF;
	Thu, 28 May 2026 07:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLeGCz2a"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17602302165;
	Thu, 28 May 2026 07:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953026; cv=none; b=K3iAskE0zxikRx1Jwv+tgsha2y6mI8xrmRTDtFlU0pG9Z5cMi7rp5Iy3erIJ6izmN9WXc0UPlsaA0Dq1NecRzDoWy7YejczkHm1eXf8JF1UE3/6oxSTl1i/4Q3qqvVEMjcV4C7JHrDEuR4UDJ55fSqSUuBJmm6eV4GJURMIgcSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953026; c=relaxed/simple;
	bh=Zy5v+QiVqPaiWY6X6etBKWrLzURWCG9Oa3/2r6VHqGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvFXGZfbKCxw+txcvM5CVi/z8ZjpG82p8YMufNuW10o4yhU7e/SaTPvfJsmerkSvBbjsG8drBB793srLHkS4uR+PW1KbF21HRBk3Vjr58VGjpZu6S+qJTZuXqLaXJnL7+JJYIfoQnN/dSrIC2VJyBVRnNse0NWFtiry+dyZ5IPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLeGCz2a; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6955A1F000E9;
	Thu, 28 May 2026 07:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779953024;
	bh=geJsUxa2oXdzbMeenZeNEivegTBsADtrNWwGH2tR0dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cLeGCz2aaMXcd769PORmRrjGRS4DeiTKAZven9bOCaW52bbBf85xPxbUDCC7TQETM
	 p7R2w5KQwvCjZq71l4Kp/3zQj/8zHgjDS2eWnEzmCV82WQPtXFRH64k8UXgnDvIlNP
	 ydjCgJ3cbf3dYFP3mg4ozvflzMdPOKVXOQd0fp2/Sci//4BU59oK5o5pXanxe8VjnI
	 Xu8wGwFxKj3P+9qhB7sCdB0TcwqfA9aMmn9TC2P3x8keJt320uCsN4KGb5SlQv9kZt
	 Liudc5QcUE+9SNYKJVMk5QGiZn+rOUtyJHXmnT+jkIJfymKkJkEOYl7PWONd6V9egN
	 dseUkrDQ1rcqg==
Date: Thu, 28 May 2026 15:23:39 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] usb: chipidea: tegra: Avoid controller/PHY init
 if bus is externally controlled
Message-ID: <ahfte9D4TsbgzFQx@nchen-desktop>
References: <20260523083013.46372-1-clamor95@gmail.com>
 <20260523083013.46372-4-clamor95@gmail.com>
 <CAPVz0n0jpnPFh0f=CWHufzZ+e24xsem5DFTKdFu6sczCLk08Fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0jpnPFh0f=CWHufzZ+e24xsem5DFTKdFu6sczCLk08Fg@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38120-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A18EC5EDA54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-05-25 17:43:42, Svyatoslav Ryhel wrote:
> сб, 23 трав. 2026 р. о 11:30 Svyatoslav Ryhel <clamor95@gmail.com> пише:
> >
> > If the USB controller and PHY are externally controlled, then the
> > registration of the controller and the PHY initialization should be
> > skipped, since these configurations must be done by the device that
> > controls the bus to work correctly.
> >
> > Since USB PHY in Tegra controls clock gates required by the controller
> > itself, Chipidea core PHY management is not suitable for Tegra.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_tegra.c | 32 ++++++++++++++++++----------
> >  1 file changed, 21 insertions(+), 11 deletions(-)
> >
> 
> Hello there!
> 
> This patch is required because I could not find an acceptable way to
> manually remove and add a platform device. I will explain the details
> below and hope that someone can give me some suggestions on how to
> handle this situation.
> 
> The Tegra USB controller is the root node, and it is bound and probed
> automatically. This is perfectly fine for ordinary use cases. On the
> other hand, the modem used in Tegra 3 devices requires the USB
> controller to be registered at the exact moment when the modem is
> ready to handle USB. If this window is not respected, the modem will
> not expose the USB device, and all you get is a cascade of enumeration
> failures.

Could you add USB controller device node as the child node for modem,
and dynamic creating USB controller device during modem probe?

Peter

> 
> The solution as I see it right now: The modem has a power sequencing
> driver, and the USB controller can either be autoprobed and
> unregistered in the pseq probe and then registered/unregistered in the
> on/off sequences, or it can have a status = "reserved" set in the USB
> node and manually register/unregister it during the pseq on/off
> sequences. This would eliminate the need for this patch.
> 
> The problem I have faced is that I cannot properly and manually
> control the USB controller driver to bind -> probe it and remove ->
> unbind it from within powerseq.
> 
> Help is appreciated. Thanks!
> 
> Best regards,
> Svyatoslav R.

-- 

Best regards,
Peter

