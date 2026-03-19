Return-Path: <linux-usb+bounces-35106-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGtBGuK5u2mtmwIAu9opvQ
	(envelope-from <linux-usb+bounces-35106-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:54:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A51C2C821C
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4EC30302DE79
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 08:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4324F3AD524;
	Thu, 19 Mar 2026 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sPHwLOEx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36583AE6F7;
	Thu, 19 Mar 2026 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910421; cv=none; b=Gt1gtN5sxsTuZzActtRuqCIoP6NvlP0vGNqiLzIE/ivwjqozoBjr1l4TIXTKWvmddatt8Ft2VZq7kmFRHh7LsiVINvtd3xCbXCzEH3cIpi4HVqKMKFhsjclDsMotoB52vVUE82+yhPhVjjRqykqf90fteveK7LXSjc2phYvc6vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910421; c=relaxed/simple;
	bh=xYHImYfHrAusksE/SpjZQ+in7j8UXG5KBq/tmynCpQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0+U0/iIjvi5Igiu8hCLwFnpHTCFmRc9FbIYC3Bz3TS79NUMrv5vgFCiYluz8PCtwwg74P1/3/pMlRzlVKDn4g4k+vwuBdY0L/BBn7BE156OlPwj6a+u7Boe0MMQVLSe8IUPRRFlVbhSGjEAxqLY9xFV4ziDtkI8FSfeLPH5WGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sPHwLOEx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2140C2BCB0;
	Thu, 19 Mar 2026 08:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773910421;
	bh=xYHImYfHrAusksE/SpjZQ+in7j8UXG5KBq/tmynCpQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sPHwLOExhZnduMELsY52wbb1vCMSrz4QNIozsTSmgQoxf1YJv82jpqqxBHV+iXtmO
	 S3Y/2pIDsKQi3st3Qtx6bCACq2TR1j/W+859DUktnqELWILNrrURCGxNxiATp0XlVd
	 9ML5f2wyRAAQstl95uienRCa3YM9ElbTHPMy2Gbe8K58iIei6LvjbfuRCcFexJarOF
	 Xf87C/YfM3HDeECWLvDXGsSbgOC3R9jSmWPezsfq1LpESFqGOABnd+MLIA7ynJEk1f
	 UtFaSJtUrIhdh7SrwzSuoJt/Soe5l1n4njpiV4U1bLkx4HnUS/flpTSNOxtdgRg/uY
	 MV1OwC//1fbtQ==
Date: Thu, 19 Mar 2026 09:53:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Gene Chen <gene_chen@richtek.com>, Yuanshen Cao <alex.caoys@gmail.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: usb: richtek,rt1711h: Switch ETEK
 ET7304 to use a fallback compatible
Message-ID: <20260319-hopping-translucent-dugong-dfd4e7@quoll>
References: <20260318-husb311-v4-0-69e029255430@flipper.net>
 <20260318-husb311-v4-2-69e029255430@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318-husb311-v4-2-69e029255430@flipper.net>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35106-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,gmail.com,collabora.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.958];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flipper.net:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 7A51C2C821C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 06:32:54PM +0400, Alexey Charkov wrote:
> As stated in [1], ETEK ET7304 is identical to Richtek RT1715, except for
> the VID value in its registers, so reflect it in the bindings via a
> fallback compatible.
> 
> As there are various TCPCI chips by different vendors reimplementing the
> registers and behavior of the RT1711H/RT1715, fallback compatibles will
> scale better.
> 
> Link: https://lore.kernel.org/all/20260220-et7304-v3-2-ede2d9634957@gmail.com/ [1]
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


