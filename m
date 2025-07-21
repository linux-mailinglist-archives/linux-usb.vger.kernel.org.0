Return-Path: <linux-usb+bounces-26047-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C06B0C671
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 16:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9828E3A1FC2
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 14:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987CF1DF754;
	Mon, 21 Jul 2025 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="XNhoD/VS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IFVBi3u5"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778D11C07D9
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 14:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753108445; cv=none; b=TNoXIVCuHAQJlAEwr8pt7RcJKPRvNxbyPtLzlSv+Qr3GHnIX6PzWGSXB8wKyvovlXWu2VxKwyjuMfCH7JbI3ZkXfcYjaSDpXmoIaFgordwXLe1j/g6JQRrVppWAQFDVouyIAxdxPOc/xzJFKVMoh26uqD7V3tBqsQGPyv+IJhYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753108445; c=relaxed/simple;
	bh=py/nL53CHYV2+0DTWsCHkhhKxOskZAdFnfwEnvnJ5ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qxm3IcUnwoWJDdw8AcWHsHq1qnzQejcgIITdsIKXWgksEVN5nm+HgKg0rSHmtZBvZ4nkBvWh/ZDkr/kOODrEednhnTv85FZNHIRYW7OLTyoeZGHKW8VCgB22iega6Te0N1bTmNI8bZxAZTLm3iDkznfB+c2E0XS26gkgRwiWdB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=XNhoD/VS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IFVBi3u5; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3C0F97A0133;
	Mon, 21 Jul 2025 10:34:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 21 Jul 2025 10:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1753108442; x=1753194842; bh=c+7MBvYRCp
	GmWPrXtclzg8OrqNUKV+Xb6UPpqFnt59s=; b=XNhoD/VSbmeBIO3CTANwaE97yq
	FEhqyMVJ0lTZswMN4vA1bGbZtFIjKEufDJDc3p4g37QG+zJI//3MZTIlkahPdSqf
	XiyqPVkfXMs1uCM5YYG8jVeBD9ySMg2soLh+RIAXCeWSAiyleX2fMnDTj39s9FJO
	EkeRM8a+ekpwW0fQLLmRAxE/HHtJkl96MMokI87aG8X7oVmCYZvEfBv5iZKYXUhi
	EbRZp+wgDaUH9OcAWGpbvYdgsRKw6GVpkj5qO1b3FjKrgWJVlMzM1vuBGlo8KiHZ
	WieD66qAqhzC9i8hRwfc4YBvWSCZNk/e6+3sMXfOdrSRuFhnD30kGSfzVC2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1753108442; x=1753194842; bh=c+7MBvYRCpGmWPrXtclzg8OrqNUKV+Xb6UP
	pqFnt59s=; b=IFVBi3u5aM2O4G1wEpHXsBkcnppjEciDmOJ0S+J5UlGnAzMhQvg
	8+Pw1tBfdCK/d1BFLb5B2hWwnIwfR1kJ4Ulsm/v2kJ76przNi5Nm+vKoQwXFRzQ6
	2AtxYiP1AVcCmOXFEe67BSrozh0m556jSrx8OTRxLDCGLES2kDCFlL2P608c15q2
	IHWyHNbJzK605qqgxfX3gL2ktzunB3L75NMwwyMEvhHfph12xEHl+Opd1wQ4+b5l
	vLYSiLtTIqXUj4S92ISN9FqFUkjtBmikSY1SYFp1+RIOhvYZmiQojhZc9vaymsRi
	q6RBh6Ro6slUjy/TfyAWeq2HY5A+8W9RMwg==
X-ME-Sender: <xms:2U9-aD7trlDdgfUEOPNKs-LKuFWXPNd2x9dC3eYV9t3wDhCcnX0K4A>
    <xme:2U9-aOZNU0Na4i7Qgv-KCCy_6lKE1r20i0bmuSFXGKv1ow1-rlstrOuMWDHrjGEVY
    QoKfr0HyT5JPQ>
X-ME-Received: <xmr:2U9-aJige_EtNc2H8uqQU_6pkE1Wgei5UJJ6J0TSZN1IL-oqieQCUkCD74Ik2aEB67v4YsSW6mn0EZKzbQ7ixnEdmGOUdTD-AumSeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejvdeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvggrsh
    drnhhovghvvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhitghhrggvlhdrjhgr
    mhgvthesihhnthgvlhdrtghomhdprhgtphhtthhopeifvghsthgvrhhisehkvghrnhgvlh
    drohhrghdprhgtphhtthhopeihvghhvgiikhgvlhhshhgssehgmhgrihhlrdgtohhmpdhr
    tghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:2U9-aIf-pImN4fH1khVt9kgoo-AMNa5810OdlIK-tSjw8LvA_q3l-A>
    <xmx:2U9-aAkozOCga3E6ZZnG4YcvAqvr1103LS61lNspbXI3MsCBi--oJQ>
    <xmx:2U9-aFxDIVZ-Oty0ByS9HTqhde-MOxods0l3il9B0ZJZSqv6bSSbXg>
    <xmx:2U9-aLz169QKxKXHGsWie-79RPf2zQ7uNF8Dp-4MjNPW74S-B71juA>
    <xmx:2k9-aPVfpErZAd8qj7vRxf5aseIpzwMTyOpWZH8P6Vhln8kJ59-fOJZ->
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Jul 2025 10:34:00 -0400 (EDT)
Date: Mon, 21 Jul 2025 16:33:59 +0200
From: Greg KH <greg@kroah.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix copy+paste error in match_service_id()
Message-ID: <2025072152-childlike-valuables-c2b7@gregkh>
References: <20250721050136.30004-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721050136.30004-1-ebiggers@kernel.org>

On Sun, Jul 20, 2025 at 10:01:36PM -0700, Eric Biggers wrote:
> The second instance of TBSVC_MATCH_PROTOCOL_VERSION seems to have been
> intended to be TBSVC_MATCH_PROTOCOL_REVISION.
> 
> Fixes: d1ff70241a27 ("thunderbolt: Add support for XDomain discovery protocol")
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  drivers/thunderbolt/domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index a3a7c8059eeeb..45239703745e5 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -34,11 +34,11 @@ static bool match_service_id(const struct tb_service_id *id,
>  	if (id->match_flags & TBSVC_MATCH_PROTOCOL_VERSION) {
>  		if (id->protocol_version != svc->prtcvers)
>  			return false;
>  	}
>  
> -	if (id->match_flags & TBSVC_MATCH_PROTOCOL_VERSION) {
> +	if (id->match_flags & TBSVC_MATCH_PROTOCOL_REVISION) {
>  		if (id->protocol_revision != svc->prtcrevs)
>  			return false;
>  	}
>  
>  	return true;
> 
> base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
> -- 
> 2.50.1
> 
> 

Thanks, I'll just queue this up now.

greg k-h

