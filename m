Return-Path: <linux-usb+bounces-34131-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGyUKaQkqmkPMAEAu9opvQ
	(envelope-from <linux-usb+bounces-34131-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 01:49:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EF1219FD1
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 01:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D9EF302D084
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 00:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EE62ED860;
	Fri,  6 Mar 2026 00:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmSIkcp9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3773729AB1D;
	Fri,  6 Mar 2026 00:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772758172; cv=none; b=C/+1I2ZJZW9Z/04VdJLiKwZ12uLXV71kZKnFLJiCLRxpWLA+4jti9TjTiHX9XmqETlqX2LvVLBAL9dQjtlxy5Zx74F1D8EV9ny9MTpBmAgLh0YhnQcaKKXPXM6TkxAI4gfIhUG2GrJKm80O1VMAz+PSQrdSNDvgsKQiIjAYvSxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772758172; c=relaxed/simple;
	bh=5A5Yia5OYLhpJCA/C/eC/7f0iO9+TomhzVwGDZoNhvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDVcqm7v45/HFrqlIyksc8XC+Rd7kkxYfLZMx8lp7kprXCAmQOAvPQpC5HNnEaBquPz1Wy3FPxVY8Lxyk8TuG3CAiBT/Ev2ZAlixVS4XlWe2Bi1zBBU7F+gDEEKdRdOvN7wZAT7bhqxyybCE02RSaLDUoeAoN9tlZ6GLMiMh10c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmSIkcp9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AC6C116C6;
	Fri,  6 Mar 2026 00:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772758171;
	bh=5A5Yia5OYLhpJCA/C/eC/7f0iO9+TomhzVwGDZoNhvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmSIkcp9pf7hAh8fBXfNRO7uexpwCS64qEGv0cm98HL9jgdIhv9xNJWjQfrd4ETP+
	 oKLDoHF048TPDfPcbo8Xqo9iswfY0FoShoZwkckBGrvGFbJ4bRUNHqsGl4d7xr3Wtg
	 qzm8i9uDBrGuZJuK7jxrO5z+lVsjzDi5wI1V7K1cv3MIVuwp062t8JSdldb8Xv1tSN
	 tbp8THxPkjm0RX/0yhSA5wRsBVFN/M0/m8G79RwMSRYbwVS19yd5kCmSqttwb3l5PP
	 H+bVoWHhppHRQbvrsqp6PWhJh3PdDhogL9qX481F0M7yMvUuV1o3EDuu6BP3v1dg5J
	 boZ2MPVR9FYBA==
Date: Thu, 5 Mar 2026 18:49:31 -0600
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Herve Codina <herve.codina@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] dt-bindings: usb: atmel,at91sam9rl-udc: convert
 to DT schema
Message-ID: <20260306004931.GA875708-robh@kernel.org>
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
 <20260224-atmel-usb-v2-4-6d6a615c9c47@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-atmel-usb-v2-4-6d6a615c9c47@gmail.com>
X-Rspamd-Queue-Id: 68EF1219FD1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34131-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 01:13:01PM +0000, Charan Pedumuru wrote:
> Convert Atmel High-Speed USB Device Controller (USBA) binding to DT schema.
> Changes during conversion:
> - Include "#address-cells" and "#size-cells" in the properties since they
>   are required by existing in-tree DTS definitions.

The DTS files are wrong unless there are child nodes and there aren't. 
Drop those.

