Return-Path: <linux-usb+bounces-35107-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EFwON25u2mtmwIAu9opvQ
	(envelope-from <linux-usb+bounces-35107-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:54:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDC92C8214
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C938F3020512
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 08:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EA22E8E16;
	Thu, 19 Mar 2026 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIYqBcWe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B583A256A;
	Thu, 19 Mar 2026 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910483; cv=none; b=p1A+7mvaTbzWeWXcl75hRpeeXQ7p3TJEuEztwGVTO+goCA9ydMavz6yXSx9Vpu9c+TqWHy+AJTr79QO4o8hVsyuiVCwduinihJIeMgdXeNpPGyUpQ6mPKyK6WdgJFxGBBJXtuZhOod/Ziml6QmVRFDrInneFkNwqgi0D4F5SxbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910483; c=relaxed/simple;
	bh=XTkHwGEfCpXAF03EyV/Ud0ljL2MbfYxd4BkX/IHGkko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zr51u5QSaUjWaT0SjcMn7jer9+NuxGpKMBEbU0bCEpCb2za/yDI0L3zVpIWsIWDmi4ioTmdox+hgDLwiT3voKHXCWl+AQqNJ1oNOiR75NQWbPJaod1pAqi+GHRAj/svnNU4dOn5fm92iAivNQ2lL6ZNyaogOXNJ45LKThee4SsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIYqBcWe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DF0C2BC87;
	Thu, 19 Mar 2026 08:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773910482;
	bh=XTkHwGEfCpXAF03EyV/Ud0ljL2MbfYxd4BkX/IHGkko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIYqBcWeA4aVv/pgrykjtfdnrr+1WA4th2In56cNZsINdRctFBESj/q5mlIOra9Fs
	 JfzZu5WgnIDyy+L0y44G0Kx/p6PB73+Bt19PueW3/HCAd4xPQbOI2WeriJIM9kW+RB
	 YNV4G7xPSbNnMqM+DBglAtcZHQbc9lc1y7ODxOmTQR7kt+A78z5DVCLF2bEFDN2yqy
	 5Q2GVx7vOdwUtuRavIChDYQVa9+MnM5WYurSVzu6vAibwMZ5jqitdG4sgKg5PMFBTY
	 UYxn3pZsCVNitL2Bxr59UPMeLY1Q45BGYAxYQg1BgLX4iluDS1ApC/KnrQa8juL86O
	 Mmw3iH/bEVVGA==
Date: Thu, 19 Mar 2026 09:54:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Gene Chen <gene_chen@richtek.com>, Yuanshen Cao <alex.caoys@gmail.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: usb: richtek,rt1711h: Add Hynetek
 HUSB311
Message-ID: <20260319-fearless-flawless-bustard-c8e8aa@quoll>
References: <20260318-husb311-v4-0-69e029255430@flipper.net>
 <20260318-husb311-v4-3-69e029255430@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318-husb311-v4-3-69e029255430@flipper.net>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35107-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,gmail.com,collabora.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flipper.net:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,richtek.com:url,qualcomm.com:email]
X-Rspamd-Queue-Id: CCDC92C8214
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 06:32:55PM +0400, Alexey Charkov wrote:
> HUSB311 is a pin-compatible and register-compatible drop-in replacement
> for RT1711H, so add its compatible string to the existing binding.
> 
> Link: https://www.hynetek.com/uploadfiles/site/219/news/0863c0c7-f535-4f09-bacd-0440d2c21088.pdf
> Link: https://dl.xkwy2018.com/downloads/RK3588S/03_Product%20Line%20Branch_Tablet/02_Key%20Device%20Specifications/HUSB311%20introduction%2020210526.pdf
> Link: https://www.richtek.com/assets/product_file/RT1711H/DS1711H-04.pdf
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


