Return-Path: <linux-usb+bounces-38143-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLcWGAjMGGrrnQgAu9opvQ
	(envelope-from <linux-usb+bounces-38143-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 01:13:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6611C5FB3F5
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 01:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B497300F625
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 23:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C6D367F45;
	Thu, 28 May 2026 23:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdQ10bn6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ED432E6BC
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 23:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780009978; cv=none; b=lIyDGmNS7agORWsWNY3jlkDhNICUiffqx5LSFtchjvOYXS/A+fxCVnqjVgERVMToJWGtm7e8Nx5ATzwJkz7lKbo+6uNDy/yxg9taiK8OiexJFvjcSQ+9WF3d2R5QkIux93idOf5siIRnwoWVcryjaM1EAJPh3GcB7hl8DDp+baY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780009978; c=relaxed/simple;
	bh=wKVQWiKhf7oxyxU2MWssq2zqgjdBrZYxuGFIuIVbwRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2QMHaRPzsHIlNUsvyjYwSNpK4oFm6RZMAZaYonCJ3yutYtqnWg9KDDUjZKcQ8VwCXkSiF3nLq0YFf4t5v6EciZjUvPeSgy7wiKHXZY8gG/1j9BKL82eErye9EcyD0VkSGPfHaruWixs51Vtcud8vpq/jCuVKvB58Uq3b7huBd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdQ10bn6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934671F000E9;
	Thu, 28 May 2026 23:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780009976;
	bh=8eUpL4OQxzuaz9lmY+y0K7O+s7QxvTsSFc3rS1+KnDU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jdQ10bn6wbpXybGQ3gmglVsUMxb33pplu1mMxDtpbdZoVNTEFeSqYO4tdXJuF+cNQ
	 mgaV14Bn6PStTc/Ls0SsdtMQ34Cs/OLrSLAB0Sss6VlcvDkQdq6rwuoAsFYWW0A35d
	 HAwvgX8ic3UsFsFON/JsLDQMnojBQ9HbXYd03/hVpKNuvU2nT0y1QXblSTU/l6k+MB
	 q9Hs99Yer9jVX9Q+MX6xLzmkBpUmHD9w9XZBq0h96M85MqQ5cLoQwZIQ42xSOtZBTa
	 FBSeUaVUd8rRepedhXcORpcxIqJPNLxyNbQzuil9/MwhXdmv+2VTvsn3N/ALwH0xuq
	 mvUda2pX/wHJw==
Message-ID: <09372c24-0812-4f14-8d23-7d44028fb499@kernel.org>
Date: Thu, 28 May 2026 22:13:28 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] thunderbolt: USB4 v2 TBGAA tunnel creation crash in TMU
 enhanced uni-directional mode
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Sebastian Loscher <krang@krang.de>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com
References: <13787e02-75d9-8000-65d5-41434a0e817c@krang.de>
 <20260525044421.GI8580@black.igk.intel.com>
 <8c753210-e399-4ddf-8ca4-d250fd4af369@kernel.org>
 <20260526040732.GO8580@black.igk.intel.com>
 <523ddc3e-2047-c202-482a-02d76de17cd4@krang.de>
 <20260527122624.GC3102@black.igk.intel.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260527122624.GC3102@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38143-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6611C5FB3F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


> The other thing I noticed is that the host is USB4v2 as well (well
> according to the TMU configuration). @Mario is that right? I was not sure
> if AMD is v2.

AMD's integrated one is not USB4v2, but I believe this specific design 
actually has both AMD integrated USB4 as well as a discrete Intel USB4v2 
soldered down on the MB.

That's why I was suggesting to try some of the ports to rule out if it's 
a USB4v2 unique issue. I think he said the front ports are USB4 and rear 
ports are USB4v2.

