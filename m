Return-Path: <linux-usb+bounces-35033-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C4yJhpqumnnWAIAu9opvQ
	(envelope-from <linux-usb+bounces-35033-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 10:02:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F22B62B89E5
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 10:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B4CB302F714
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5367739D6C5;
	Wed, 18 Mar 2026 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNYnbJhJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3672330D54;
	Wed, 18 Mar 2026 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773824468; cv=none; b=fYewY9kD9HdtBy+wiRy2Co5NSCkqNGxn+GZKRS+XZEnfBl4exccv11i4+qEwWYqkTo6p9nZdM9/TK/aINLTiOkBPPQpG4goMTsrpNleaWORuHpwqnwWs8FTWV3prT6U4i27kfdtnOMWbAhoreMYJP9VG70oPvVreWK1xHgSkwTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773824468; c=relaxed/simple;
	bh=Y7NA/QDIalWo3D2nRcGD3UiRiGnKtgUyJPIS23k/YlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gM5FRhncQRgkIX36DibsxJ5jpbQXUlY1nGINNZYJ70bl0+mex5NwrRYMa1anLSyE/tS+J2KFsROKFBwBEU5GzCGuWGnkL95Yl1dvvetO8rWR1HzgZde3/qLQsSHZ5zK/o+o6uXMUB22lVEJOvAXfzIs4E4fG88e8Dgrl4NjeL7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNYnbJhJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E842EC19421;
	Wed, 18 Mar 2026 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773824468;
	bh=Y7NA/QDIalWo3D2nRcGD3UiRiGnKtgUyJPIS23k/YlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNYnbJhJQKFMBTOaoOaL8B3vntvOGTJkSyS/fiTuXvhdF4d5UlKf03QNdWwm6N8N+
	 xjbBULijEY1lvlNOH023Kplgl+ZhyRFTN3KA7jzoingqBX3gHGgOqGE7SQMroxZRrR
	 UHytpJQlqFMRtaYh71y5QfcKcbh0mXpmbDBUyKMw5nDLst6AY8qZLaq6ONVvd6z5K/
	 WR5ytD4+hI8JcG9hAjUodVBrcE53o9X/WUS8VeKiaaR/PTpKeeY+jxNMD+/4bYHS25
	 EFyGlO9Ui/E6U1G8a850TbCwzg/cdM1X09u/MKXtq1pjYN1usq319IIJLZnqUm87z/
	 mzVhOiUfKgyNA==
Date: Wed, 18 Mar 2026 10:01:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, 
	Junzhong Pan <junzhong.pan@spacemit.com>, Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3: Add USB2.0 support
Message-ID: <20260318-belligerent-boa-of-resistance-4b98a0@quoll>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
 <20260317-02-k3-usb20-support-v1-3-d89f59062ad4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317-02-k3-usb20-support-v1-3-d89f59062ad4@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35033-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linux.dev,synopsys.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,esmil.dk,spacemit.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_TWELVE(0.00)[19];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F22B62B89E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 11:53:04AM +0000, Yixun Lan wrote:
> The USB2.0 controller on Pico-ITX board connnects to a Terminus FE1.1 Hub
> which fully USB2.0 protocol compliant and provides 4 ports.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 24 +++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 31 ++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 

DTS cannot be combined in this patchset and must be split. Don't mix
patches from independent subsystems when you send something explicitly
targeting only one subsystem.
See also: Documentation/devicetree/bindings/submitting-patches.rst

Best regards,
Krzysztof


