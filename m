Return-Path: <linux-usb+bounces-33864-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBysHmlgpWmx+wUAu9opvQ
	(envelope-from <linux-usb+bounces-33864-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 11:03:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D934C1D5F86
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 11:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BE6F3043D34
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 09:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0E939448A;
	Mon,  2 Mar 2026 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hiq+kzVp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EFB39281B;
	Mon,  2 Mar 2026 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445577; cv=none; b=pTjFSAAbIiq/gHRHbwosJJkcTBmZQam6kfE2Ru0SOY/cx6QMTR8M48h/7+LX4w7JKzAK0onLrEKvvUkgxyaGikQ3GXYfLNsKcEpcjlqXNX3ypYae4pjLU9sYikUHht3G8Qr3a9cP/iGf8Cw35N7bDpiTDTbrffwB81wPlJf6j8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445577; c=relaxed/simple;
	bh=JW4wtcwWSZaAh0Eew+adPH7eqv23BxKf/1lj6ik4sTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDLvI5nX8+2PAGSsGpy0lLF94RJIternhZQ+c41MGtIVfhHU/NdGKKGJLg8W9ks4uxdeJonOWTWS1ZjZpHFxcT2fg5tPS9/mMeArD3tHSNTqgXy/TgI52+imC51WrJi9io7QADoMs0jQwj8RqcS5bi89WRmBpnE1fNPwJj8qolg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hiq+kzVp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BA9C19423;
	Mon,  2 Mar 2026 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772445576;
	bh=JW4wtcwWSZaAh0Eew+adPH7eqv23BxKf/1lj6ik4sTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hiq+kzVp93oaS6b2l2zDiik3ghkSOKcBm1+R63qsJ/z9Ds6V/BkrXDYyyrRcCER3e
	 ES27r1RFJ2IqyLpQiS6I4UDiKB8rMFrM46AggFSgm9XCBmDLwb9BYufeQTC8U5nOUH
	 S+iFxQ3zGapm+gaNZzsVe2EFqUQ96MHuq9kgOiLh0pK49rZxyrkuxgynR9BrsBVQgu
	 sSkf5WO4gJB+M1qu5X1K+WLXNU8Yov1+hAfKgqTRoa4FDBb4OlhMokPrnxxT8AE7wr
	 DGtUUEkZKuvjJMy8Tp/WYFllqdu6owx8W1R3o/3SQ87m/y/R56GlD2oBBk6T7KHY8L
	 S7h0Fzc90wBVg==
Date: Mon, 2 Mar 2026 15:29:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	JC Kuo <jckuo@nvidia.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Fixes to Tegra USB role switching and phy handling
Message-ID: <aaVfhN_pVLebf0MI@vaman>
References: <20260127-diogo-tegra_phy-v2-0-787b9eed3ed5@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-diogo-tegra_phy-v2-0-787b9eed3ed5@tecnico.ulisboa.pt>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33864-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[tecnico.ulisboa.pt,gmail.com,nvidia.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D934C1D5F86
X-Rspamd-Action: no action

On 27-01-26, 15:11, Diogo Ivo wrote:
> Hello,
> 
> This patch series contains fixes/improvements for USB role switching on the
> Tegra210 and Tegra186 SoCs.

Thierry, Jonathan

can you folks check this and r-b/t-b please

-- 
~Vinod

