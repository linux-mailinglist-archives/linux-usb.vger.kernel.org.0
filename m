Return-Path: <linux-usb+bounces-37723-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDPAJXCNDGokjAUAu9opvQ
	(envelope-from <linux-usb+bounces-37723-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:18:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D127582241
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95F41302F56B
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 16:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07845407CF0;
	Tue, 19 May 2026 16:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjPzu264"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8832F407CDB;
	Tue, 19 May 2026 16:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207527; cv=none; b=pSCqx6t85lx4COJ/9mPSd3YEX1f0OH3MT1WXhnBSTdOVLEMlkqbzt80FBZcIg2LJNMUgukLTkyDQJhY69cmUbU3Q4lvJst/4Xd5Uyk2yVr8g/6Y9G6n2Jy2zEKiYY9QIF8gebIrQj6lehdZ5Q1EP4ooMBTSudpIe2teUD0AfOsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207527; c=relaxed/simple;
	bh=ks5da4KzQJ0bgxliGY23gzeXLlwMCRSywmHeDmqsHWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0iQoArbJN90Xt3NyIZEH4vHwVRJlTynAgyUnySoGPvMHx/dly0P2ptP27X5Q5vCxK3CX2fBUnirMIP56pBDZOVtZP12z374bd8aK32RPkrz1pa1EXoImsKs97osdd7y2kgKnfSvq4pIch5l9wuPi7ARTj5koj0DzSbIcO5Ytv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjPzu264; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CAAC2BCB8;
	Tue, 19 May 2026 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779207527;
	bh=ks5da4KzQJ0bgxliGY23gzeXLlwMCRSywmHeDmqsHWE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EjPzu264dLagGvzIq6XAK3pAg97hebUWlRnTpv+1zBj0/MYBgAiFnZJ5tci/oUDfk
	 KfAzKwQiiY03078cLuQP9r+EI2fy8o+2TYxFuu6KExwFuEgQJMbz4lHo7lYseTgP7y
	 SxPoW+m5OVln/y/Y/PtfMMwZ1GAqSIFKMcqFJQX84lT4WiPZjuTjBwL3n1w8Df8Wqq
	 qdQnOSL4vkXFk48Uw5ouhEQ7MHyGRnV2VYWVP2N4hhgZMDmQzBqFj9sigs1a8Li3TE
	 8QvdBiRpdCOSDjmAKSYDs+7h1KxrpGbZYzRaa1JhAVlqSfVT08P+sb/AIkrNc3dBga
	 fiONlpvHYM/Zg==
Message-ID: <8539728e-b2d2-4baf-87d3-b2772d6aa11a@kernel.org>
Date: Tue, 19 May 2026 19:18:44 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] usb: phy: isp1301: Use named initializers for struct
 i2c_device_id
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260519161300.1598095-2-u.kleine-koenig@baylibre.com>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <20260519161300.1598095-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37723-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vz@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,baylibre.com:email]
X-Rspamd-Queue-Id: 5D127582241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 19:13, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> This patch doesn't modify the compiled array, only its representation in
> source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Vladimir Zapolskiy <vz@kernel.org>

-- 
Best wishes,
Vladimir

