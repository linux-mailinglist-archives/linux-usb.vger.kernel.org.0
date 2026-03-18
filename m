Return-Path: <linux-usb+bounces-35024-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BdvMNpfumnFUgIAu9opvQ
	(envelope-from <linux-usb+bounces-35024-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:18:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A462E2B7BFC
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E900E3047C55
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 08:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4B03793C5;
	Wed, 18 Mar 2026 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXHw3aKU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9044E36CE16;
	Wed, 18 Mar 2026 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821838; cv=none; b=uRk2QBUOAuRTXwszrKVQ495DoCDQzIV95+VrSgX0MebtY1GYRYHxYvC9iEae1+EWXFR9H2QMDkygl6Sm9r1HG+AgukPTblrV/FmT5ZetPusWjB1NyxwKxO+hLFGV/eMIVqAgHWHFrdfY+tQDQhzEQNWkWUrhUeyLjchMKWRyapc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821838; c=relaxed/simple;
	bh=+abhc8EHvLWzaaYvpz3TrPh7cY1194PGz+g1MgZc+zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U56OpiZQlsVq9WqJdeLK7mycOCt1F6ZIjBCuIsQbbrRhlwXy6y08l8nX77F2HIsoSX3qYaz6Jwy3Nnrz+XLX1jWh6LKX9tY0kkVwLd3Vc98qPO7Wpjyaol+Q8Hcj1jTq9WfuLycXSEGaSzwgByMNOz95jT/bB9a6hel9yhY5KDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXHw3aKU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA473C19421;
	Wed, 18 Mar 2026 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773821838;
	bh=+abhc8EHvLWzaaYvpz3TrPh7cY1194PGz+g1MgZc+zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dXHw3aKUkgy7I9GXTS/O1allwuhL9lmxu6GeDUEH8VuRGkqS46RBOQAZHbrlbQtI2
	 pDB7vpJyO3GnC3efuFuwyBqd85rA/qJqci1auam+enTqKrp1oS7CgdYJm7MLLE8Gnw
	 Uncdfw9pSZXO1+gKdFOdWvN6qaUPqU3IHFvCXqpgC0qkovu01wYlioPMiWxqLoy1vP
	 UXpToFqXYHc6ajNjLjJEspfcG3CDMcJlvUUFaTfG7D30Wxbp4D7MTCyyF+0YnNGJlC
	 LxSVSf31TiLzXlK+zfRB4quWMyHY51M8glSxQqsYjdj9mFqo9vQn7M0T7/n/sQS6Zi
	 sRXK6mJL3/BsA==
Date: Wed, 18 Mar 2026 09:17:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>, 
	Yuanshen Cao <alex.caoys@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: Add HUSB311 Type-C
 controller on RK3576 EVB1
Message-ID: <20260318-able-goose-of-downpour-db3bbd@quoll>
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
 <20260317-husb311-v2-5-03c17c986abe@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317-husb311-v2-5-03c17c986abe@flipper.net>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35024-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,sntech.de,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,flipper.net:email]
X-Rspamd-Queue-Id: A462E2B7BFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 10:08:02PM +0400, Alexey Charkov wrote:
> Rockchip RK3576 EVB1 board has a Hynetek HUSB311 USB Type-C controller on
> its Type-C OTG port, which also supports DisplayPort Alternate Mode.
> 
> Add the required DT nodes to enable basic HUSB311 operation.
> 
> Note that for full support of mode and orientation switching, the USBDP
> PHY schema may need to be expanded, such as in [1]. This is left out for
> now until the respective schema is finalized and merged.
> 
> [1] https://lore.kernel.org/linux-rockchip/20260313-rockchip-usbdp-cleanup-v3-1-3e8fe89a35b5@collabora.com/
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

DTS patch must not be in this patchset. Don't mix it.

Best regards,
Krzysztof


