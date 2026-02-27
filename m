Return-Path: <linux-usb+bounces-33787-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFRCFzi5oWkYwAQAu9opvQ
	(envelope-from <linux-usb+bounces-33787-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 16:33:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8195D1B9DAA
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 16:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E58AF305B041
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 15:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C683243635C;
	Fri, 27 Feb 2026 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdVCf4FF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5318843C07C;
	Fri, 27 Feb 2026 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206157; cv=none; b=BTGDLGSp8MK46oOrmOm79Jk08C7aoZPOUW5AFeVHs+iW+Gt0oAhfPh07F4ZajwSm+8c0PB6bDxe3stz1ZGO8nRUod3AI41qOkOsB2a1gLFrb7u3mpy71mwj2mbCF8MNZ+yD0x2MEth/ALOf/n+Flq6jNHS25ie7EfBo4U6lVcYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206157; c=relaxed/simple;
	bh=De7bn/n8BhoSPhSHTVWvjQ3gSzdmOOwqj1HR6u32gyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cnN+W9MwMi/svfq469rqX/tZ7UslMgzUInoFeuy7r+Tv0bhS1sviTCU3QJ9VHI5ZOtSkikrvti6//RTP7H/1OtNDBRKZJhZNFsR+7FlrHz82RTtT50MPOtk355V6r/9NRQjLjF29M6bB76P+IDNjMHpMZpxUXtzVKjgIkFh2Kbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdVCf4FF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EAB8C2BC9E;
	Fri, 27 Feb 2026 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206157;
	bh=De7bn/n8BhoSPhSHTVWvjQ3gSzdmOOwqj1HR6u32gyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YdVCf4FF07nzKBY1Lm1XDnYJp3Zfeq6d1C57FvUX0RDDzQTd6AESAd9y3aA3dBqMb
	 2Ug6nxcJMhE5ISeCuIVLrDrg2eWRW51S0A9F0UA0n6a7a8B3MGp0Nks3pENJN0AHFZ
	 VOf3rxTVamIla2N8KwlTFd+3Z9tlnBTi9nuNcyswhLSI8gTvaMsa0R9+CJB9Z5pJCk
	 tHQ7nZnMwIzYvNRw4OycN1IiOx2cxrKdV1EfOgQWEzf0N43NifX48T0LW5SFRC3WD0
	 Y55Pwz+yXwykk4cTUJmG2VorAtndh0OMxtj0H7oUohmZConR+aLbHi1JwfErFc1ViF
	 gWZ0bU48qigfw==
From: Vinod Koul <vkoul@kernel.org>
To: gregkh@linuxfoundation.org, conor@kernel.org, 
 Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn>
Subject: Re: (subset) [PATCH v5 0/4] Add USB support for Canaan K230
Message-Id: <177220615264.330302.188095105582835535.b4-ty@kernel.org>
Date: Fri, 27 Feb 2026 20:59:12 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33787-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8195D1B9DAA
X-Rspamd-Action: no action


On Wed, 21 Jan 2026 22:55:21 +0800, Jiayu Du wrote:
> Add support for the USB PHY and DWC2 IP which is used by Canaan K230,
> and made relevant changes to the DTS.
> 
> This series is based on the initial 100ask K230 DshanPi series [1] which
> is based on the clock and pinctrl series. Check the details in the link.
> 
> Link: https://lore.kernel.org/all/20260115060801.16819-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: Add Canaan K230 USB PHY
      commit: 50357e7d7992ba8f02c87ff7a5c4db17918635da
[3/4] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
      commit: 8787fa1da603e9e51efff11841e97b5d374aef34

Best regards,
-- 
~Vinod



