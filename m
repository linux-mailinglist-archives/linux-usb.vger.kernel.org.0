Return-Path: <linux-usb+bounces-36069-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFxeLgMJ1mnbAQgAu9opvQ
	(envelope-from <linux-usb+bounces-36069-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 09:51:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2823B890E
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 09:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43DB4300E25E
	for <lists+linux-usb@lfdr.de>; Wed,  8 Apr 2026 07:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181B83947A5;
	Wed,  8 Apr 2026 07:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8JHY1ma"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D682032D;
	Wed,  8 Apr 2026 07:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775634526; cv=none; b=XE8YAEPCWrURP6yIOaXZbSv3EOlNm/twCutU/yH0J5opu++ZgayM2XMToKwQXFd84v+9aDHBdVAgiD9gA9U1ysBAObQ2Rw9NYt0HXfjDaQ6PtvOJq48BnehJ0LVTW/Y4cPq5Nx89pR8bcQ0rgdoUsAL+RIs3drqMi2ZUPob2zfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775634526; c=relaxed/simple;
	bh=UK124arbckdlKPeTd0froWZFIhKk+tscGO/UsnqrIcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ow8hQikUWA3MAJDgGH+mX9r14yUHT26aZWku0/PWV6AjJd+TG+WgoJWDNbTDBKyGqi5F+8haiDBCvlvxg/pVWdkIbrDzeK4fBs+sQSibNLLtTHooevom+rSWpNBmosj/2XH8ddIEH6lW+OTBP1k+vKPP3agc36lw/3vvS3bREMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8JHY1ma; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8416C19424;
	Wed,  8 Apr 2026 07:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775634526;
	bh=UK124arbckdlKPeTd0froWZFIhKk+tscGO/UsnqrIcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8JHY1ma9jBYtlFf1X4k22nQVGEBCBR6VxRPVYze5Rsxv/5PMR2S+dnmE5byx8u8S
	 2DmBtlfxcdLVL/8J0mNMSyaLIFUL0Chl07uL+Iw+XcHcWTfESkm8KH1y9gH0C5Haji
	 jtUf+z4xLLX19ax3fpDqJUSioLMBI/tNNTFi8nFqyFlXDfP8md9ju0WPc+PibSL2lF
	 CIRu1A/E6zgtEtfoeN/xYi8/PFqY5/s1xiuIlvXu7UzAhR/WxtB9H9cG34/lHmHSiF
	 nR00TaXABlH7Pc5EYBvCpFqJhb2Qvvhnf3+bYdJ8L1XXukatrMJ/xWLJS5qpmfub8I
	 sMLRPKogsbICg==
Date: Wed, 8 Apr 2026 09:48:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: caohang@eswincomputing.com
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	ningyu@eswincomputing.com, linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v1] dt-bindings: usb: Fix EIC7700 USB reset's issue
Message-ID: <20260408-ginger-grouse-of-virtuosity-b3ee92@quoll>
References: <20260407061703.1564-1-caohang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407061703.1564-1-caohang@eswincomputing.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36069-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D2823B890E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 02:17:02PM +0800, caohang@eswincomputing.com wrote:
> From: Hang Cao <caohang@eswincomputing.com>
> 
> The EIC7700 USB controller requires a USB PHY RESET operation.PHY RESET

Missing space after full stop.

> operation was missed in the verification version, as it was performed in
> ESWIN's U-Boot.
> 
> If a non-ESWIN provided loader is used, this issue will occur, resulting
> in USB not work.This patch does not introduce any backward incompatibility
> since the dts is not upstream yet.

So U-Boot will be affected, no?

And even if DTS is not upstreamed, what about all out of tree DTS?
This is an already released ABI, so at least explain that driver does
not care about resets here and grabs them all.

> 
> Fixes: c640a4239db5 ("dt-bindings: usb: Add ESWIN EIC7700 USB controller")


Best regards,
Krzysztof


