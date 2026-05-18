Return-Path: <linux-usb+bounces-37602-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPoLKngBC2oH/QQAu9opvQ
	(envelope-from <linux-usb+bounces-37602-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 14:09:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F62F56C490
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 14:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDE483123818
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7393FB7E4;
	Mon, 18 May 2026 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZffnVxkk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1630E3F6609;
	Mon, 18 May 2026 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105640; cv=none; b=iqqaak17VJZscIykqbqFXDqQWqPhS224B0Qvutshqwje/wmA3FbsTIdTbky1/OhJBUY+NQPGDmapexl2bAG8hX97LTbk71FWZIkrRqY7ezKJ5CG2T3nUaOTAd5fUs2FzT6gjWFy3HO2nor0AiNhDDmuGSvS+S3shrE1y2iAE6LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105640; c=relaxed/simple;
	bh=9Fc58uUMjaSHMbxwgnLdGwYzmLlHJTGQ+EfCIzddzro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQQzkxhj1jCXORbWlNH5DvurOJhHWZKkoeGhPfSwMYU+2h7ffAJLBwO+TW+vd5H6SLTsqrUfX4llSkOspUXfxnzv7Vy1WUY0F2Zm8+JoyRfJKEi7Rj07iVgpdJZuCE9XzJc2w7QbEvHuQHfhqgPMm+4R2exhe0wW6Jn3jyGpY9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZffnVxkk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0E6C2BCB7;
	Mon, 18 May 2026 12:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779105640;
	bh=9Fc58uUMjaSHMbxwgnLdGwYzmLlHJTGQ+EfCIzddzro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZffnVxkkT9nAFK8V8mD+8EX36l6KseXIgwbxzG5vsgI3ZY94GXdOy9MpurYsIyqYn
	 FfWsjxhNgVzunOM13uByE2ZzGxroKC7dWMDjwtXpgdWSu7EX8XZ+9eUgA1c3oGp1lg
	 R21b5yqABJbs9TiwS15yagByHYhPecqUvrS3PlFHiqSK8tOnlh1vUYBL/2DVqI9xhP
	 eFgupbupyyHI6jECkJaxtlCDdFxqYWcq2pSdrCyEQOmzVbzyJLagTDoGsD0w4GBQzx
	 PTrV5SUT54LOECeLdLs0RJRTjuq+1IfqG6oe5xagGsUO1bE0foJV/PpVkfYc/7UeXd
	 J/T2snFI9irpA==
Date: Mon, 18 May 2026 14:00:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	MINETTE Alexandre <contact@alex-min.fr>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: ci-hdrc-usb2: allow up to 3 clocks
 for qcom,ci-hdrc
Message-ID: <20260518-energetic-gabby-groundhog-6a9ad7@quoll>
References: <20260516-qcom-ci-hdrc-clock-fix-v2-1-aaec8d33d0aa@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260516-qcom-ci-hdrc-clock-fix-v2-1-aaec8d33d0aa@smankusors.com>
X-Rspamd-Queue-Id: 4F62F56C490
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37602-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 10:53:14AM +0000, Antony Kurniawan Soemardi wrote:
> Some Qualcomm SoCs such as apq8064 and msm8960 require a third "fs"
> clock in addition to "iface" and "core", needed to propagate resets
> through the controller and wrapper logic. Later SoCs such as msm8974
> dropped this requirement and only use two clocks.
> 
> Note that the existing apq8064 and msm8960 DTS files currently specify
> the "iface" and "core" clocks in reverse order compared to most newer
> SoCs DTS, which causes dtbs_check warnings for these older SoCs. The
> dependent patch series will fix that clock ordering.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
> This patch updates the ci-hdrc-usb2 binding to allow up to 3 clocks for
> qcom,ci-hdrc, to accommodate Qualcomm SoCs that require an additional
> "fs" clock for reset propagation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


