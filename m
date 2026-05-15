Return-Path: <linux-usb+bounces-37471-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO0ZGz/RBmqKoAIAu9opvQ
	(envelope-from <linux-usb+bounces-37471-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:54:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F55F54AD82
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69421300C9A1
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 07:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFA93F7A97;
	Fri, 15 May 2026 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnLa8UZU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A50C3F7877;
	Fri, 15 May 2026 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831672; cv=none; b=eLueVUz40R2VDX8Dy8u/mlfWkqayqDGwDXIO634npD6GiouPU9eY8dJmQAodfSgfTnnjB0VSCA8eJzoQqaHlN/EnEQOmzHsVKM4twixt+GRYFyz9ns4w3OwhiVf1gjNhtTfPipp73rpiFfZjYlREFFWTo5NOrQpg1s8bKprtpLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831672; c=relaxed/simple;
	bh=6C+cQGLy0rdE2XnSkobZ4ut7/daRJW7apsXEcNGcyK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROqqaMMzCqpkCxG9N513zvItDUSCsNJTQXZVK1AzY9h53mfIysstvE2M/yKtWdI3cEJiHW9L7PUTYegHbbHjWaCrLXpF8nRBC/srbjv1lrgwR4RY+68Ae+8/dqr6tpgXkAguFxbRg6RsphjZiYtVKMf3CbWTOvCF33BHoP1S3tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnLa8UZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D4BC2BCB8;
	Fri, 15 May 2026 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778831672;
	bh=6C+cQGLy0rdE2XnSkobZ4ut7/daRJW7apsXEcNGcyK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XnLa8UZU+O3beqJ4GcvQoUyaGmaAA/+lNlNiQBj/NmRbHexRd0RT/bh7RGzH/Uc6w
	 hX8k21ur+Y8Nj4wuo/SnLXa5+XAP0pL9TQmFYJidzIfAWaWHnYAx+xfCcwzkDj1W+l
	 rxYEPYZOI+NXLzJE+Tiyy6QRaLlLXVN50f1uEjah6l8lMX4Nj5rodxiwkiDkqJIG5Z
	 HDVIV+laOn2QlgEyYwFWaDbsKTEqlcOMlNSGMmYGB00ojXMGEO2XxNVWD4G2pc7hbN
	 IndhGex7XIrqkQuO84zAG5CHUtbds3WDwjcVWb9fbmSB8dYIsVZqRBa46OmuxEUPKC
	 9shF+rG0EDchg==
Date: Fri, 15 May 2026 09:54:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, pawell@cadence.com, rogerq@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, linux-arm-kernel@lists.infradead.org, arnd@arndb.de
Subject: Re: [PATCH 4/4] arm64: dts: cix: add Sky1 USB4 and USB5 controllers
Message-ID: <20260515-stirring-venomous-alpaca-715ffd@quoll>
References: <20260511024244.981941-1-peter.chen@cixtech.com>
 <20260511024244.981941-5-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511024244.981941-5-peter.chen@cixtech.com>
X-Rspamd-Queue-Id: 0F55F54AD82
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37471-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cixtech.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 10:42:44AM +0800, Peter Chen wrote:
> Add the Sky1 USB4 and USB5 Cadence USB3 controller nodes with their
> registers, interrupts, clocks, resets and S5 syscon control. Enable both
> ports on the Orion O6 board in host mode with the required VBUS pinctrl.
> 
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
>  arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 30 ++++++++++
>  arch/arm64/boot/dts/cix/sky1.dtsi         | 68 +++++++++++++++++++++++

DTS cannot be part of USB patchset.

Best regards,
Krzysztof


