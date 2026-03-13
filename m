Return-Path: <linux-usb+bounces-34771-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFQBIOOitGnmrQAAu9opvQ
	(envelope-from <linux-usb+bounces-34771-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 00:50:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8FD28AC2F
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 00:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39C97312558A
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 23:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4658C3DA5D6;
	Fri, 13 Mar 2026 23:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MK3WGhcD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BC53845AE;
	Fri, 13 Mar 2026 23:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773445849; cv=none; b=bEf/q5maztH4wxM6gYDASjAIQ+Xenf8MPFs4I8ZE5Em4zCOWKCdoWLo0044Fh8/niS7ZM3K+MSvOYAMpCXKSwC5hJlxe6+1tLxQjGGwZ2dkX4B5JQw89yE0e7z8QYNiKyVFLzBnJVP+SLHxzDzjAKRTQEKpWOeWGfJE3mQMii7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773445849; c=relaxed/simple;
	bh=2W2eAAvqDfjn4vkXd55VPZ/oDYTLuAHkqhP7DBcAh1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPqxY4TKDy0LSaYRIfw+ovG+Gc4xtjRw8zk+umxtbGxDxKmoIgYwTmkDdWA6f1rYEBB0MQbbTmhPE5WxUrZlJtoOv/H4xeaKidth3b/+voes2ONqLVEIIllx49C5FWH+eU+M8RoFYnROJNTSxgooAUqo4j1z61eTbXdMFpXuEZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MK3WGhcD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B69DC19421;
	Fri, 13 Mar 2026 23:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773445849;
	bh=2W2eAAvqDfjn4vkXd55VPZ/oDYTLuAHkqhP7DBcAh1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MK3WGhcDvyCUmTShVBIHsO/UpBGWJa/g4T8FHEEautHQ6Kh4d7RoMsVWSnu11GDHc
	 Vtm3KYz5Hjh5dZGpcvuvTaihHlXmuoVEyoNOXNoagoVKnEE8BkATseH4Rr2tZPHFMh
	 CbCH9QE57OOM6eGqBu0t0VNdfPlasRQPBo03Pf72MrJ5mzI8B0oQzOm8t/yYNLx4zN
	 lEHmUsGSGmQ1D3p1NYpNfU3Y+YcPWF6OchUh2IpKhlmjaYJmPsL6L4HpBd5ggISrGC
	 oGe+QzVfP+IfZINpetUjPquoTo0aFRjikUGgv096CpUo7dtqABwVfMz5ECotyMDykO
	 RKgdtFPj/xduA==
Date: Fri, 13 Mar 2026 18:50:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: usb: Add Corechips SL6341 USB2.0/3.0
 hub controller
Message-ID: <177344584744.3674369.9608283807361315345.robh@kernel.org>
References: <20260311-sl6341-v1-0-0a890056f054@flipper.net>
 <20260311-sl6341-v1-2-0a890056f054@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-sl6341-v1-2-0a890056f054@flipper.net>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34771-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,flipper.net:email]
X-Rspamd-Queue-Id: 0C8FD28AC2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 11 Mar 2026 19:20:22 +0400, Alexey Charkov wrote:
> Corechips SL6341 is a 4-port low-power USB 3.2 Gen 1x1 hub controller
> supporting SS, HS, FS and LS connections and integrating a 5V to 3.3V
> built-in LDO to enable its IO to be powered directly from the 5V USB VBUS.
> 
> External 1v1 VDD supply is still required for its core power.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  .../devicetree/bindings/usb/corechips,sl6341.yaml  | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


