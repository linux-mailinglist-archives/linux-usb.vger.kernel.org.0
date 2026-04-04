Return-Path: <linux-usb+bounces-35967-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOF8JHC40Gmu/QYAu9opvQ
	(envelope-from <linux-usb+bounces-35967-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 09:06:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 849C039A325
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 09:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78302300B2A8
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 07:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9F1378805;
	Sat,  4 Apr 2026 07:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEz/JoMA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC1F274B5C;
	Sat,  4 Apr 2026 07:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775286370; cv=none; b=JcP4WQDX3Mbku6K1+l5cDkIiAuJ6nD6On8ZU/Wz9b1ixnJvU0Ge97Pqnu46bIEIxbmqLEdxAcxfj1mbtY0w4j/6q/KtssCpWKSUOQv/ZD6xiR8K+BWq6OsZVBdmdFdSy1jdilO9SiyovMORknn0UUokBVtmtODyF9pTaGaC7kbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775286370; c=relaxed/simple;
	bh=UydkduQakN8IlobPbjOFqJ8kf+pF1zyaBtWMtlWtiO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoARch+a6u+yVXiaXSiVXf/G+ngwDY+zh5cwfN9Ooc0MPPMeiILa9mSG+arhueJ3f3M2FqRRr8e4B6w5yCCAkaBx1W4s4KzaEZNFsEnBlwSNHZXQR+M7rvGDRQMi6MYMqItPHea1TIYyTQh8JOjwQTjIxWq8y3+HkcXuUSXfmO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEz/JoMA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CAA7C19423;
	Sat,  4 Apr 2026 07:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775286369;
	bh=UydkduQakN8IlobPbjOFqJ8kf+pF1zyaBtWMtlWtiO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hEz/JoMAqsKTFJjhnEotmECzkt9Q5vzVSePC2lYIvAxqPy51A/d1U03OXrDgBgfup
	 +iX87pWlXYGZL4yp3jyYhDyXk2pwKLufPhsX2m4p9aoFrTG0bcjbzYyQT4yGgPvLTy
	 g0OQOkuAVi2PHN/neQKRgnhh7h/OtN6iwpH8XDXGgsURqZs01QFUzF+H0l6DGCdXGF
	 TIs7M1UcMfRLplpe+mrwwrZ5S+lioLp4RdoU3k88JAtZvA9Qp98cm8ELnYPCwC6ouh
	 GZ6MtM4Dbxw/YNJFxEuznD2Af4+m3pH97jjS0ydczbDHdcIMqWUizodh+qix1XDitm
	 w1XnrqTaQ0mjA==
Date: Sat, 4 Apr 2026 09:06:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Matthias Kaehlcke <mka@chromium.org>, Alexey Charkov <alchark@flipper.net>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mike Looijmans <mike.looijmans@topic.nl>, 
	Pin-yen Lin <treapking@chromium.org>, J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: Add Genesys Logic GL3590 hub
Message-ID: <20260404-tacky-fearless-mole-ade3ba@quoll>
References: <20260403100435.3477729-1-swati.agarwal@oss.qualcomm.com>
 <20260403100435.3477729-2-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403100435.3477729-2-swati.agarwal@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35967-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: 849C039A325
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:34:34PM +0530, Swati Agarwal wrote:
> Add the binding for the USB3.2 Genesys Logic GL3590 hub.
> GL3590 hub requires 1.2V and 3.3V supplies for operation.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  .../bindings/usb/genesys,gl850g.yaml           | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


