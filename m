Return-Path: <linux-usb+bounces-33985-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFtQJOFSqGnUtAAAu9opvQ
	(envelope-from <linux-usb+bounces-33985-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 16:42:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF746203044
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 16:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F4A631B499B
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 15:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1526E352F88;
	Wed,  4 Mar 2026 15:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q3Qpc/pp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E98734C98C
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772638444; cv=none; b=jyuAATSBqBeMCnE2/uX2tt/7s0+F8c+f2Az1Td/zgptgfFLljHImMKpSS8FdTEkYMLQmkxFco3JONHUxuRh6S1nRn+lvxZG3HF8ZsDuv1ys8FDeWniFkW1IJ8MJdNOPXSWXzfccX0/ZLyOQtpbuQNQ1n41vnWcjcyq9UPyxZMZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772638444; c=relaxed/simple;
	bh=7Y7NjelO+9HCnp/3reM0s2JQSV7kxUw+mgkUXvBrL18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=He2oavuu5p+GZyD6ZsgeJE1W2sadOn5RGCqLOXG19cpvzOraM6eoYzuR9xWvqWgsAfVUG8Hfn5JAb+EpsbC9lgHeMrKeBiomR59PxLV0SxxJIh6q6EZP+OZzSOhNwTxOLCanLLg7L9JRL5Q2DzayWxxiGI/V8GDxveUo7EwasLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q3Qpc/pp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48069a48629so74420835e9.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 07:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772638442; x=1773243242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+Y1yYkc3TnZHw6WP08jIl5veXiuJkcXL9d5EK6jlag=;
        b=Q3Qpc/ppD1s+OC6u2rFZywVt1Qqhmphruh5vtkRPjlMCWaH74ShcBsFflnRKT826uQ
         szbwskeHL5G3ZKlJomBDbDCuP9jiDIiWcxLdxi/dE6YbOuUOgMobkgsOsvFx2Z9KWmif
         kn0yx2VugWwqOz9qpT1Ik7aw8r22LEi+raMzz2OUYdIWMydF6LJrapUkN5QB+OjJQ9Iu
         dowNANRa04FTva6s1A3vWJTEPZyCYtBTJj03KSn2GD3Fm9nJF5M4GUBoL5N8r9Vxx5zi
         MDVcpCH0cff5paobgNTFsu+TYfFnJ0wBvskdNJBOKdnQdqPN9AdY5l+0B2JYTZdOrNu6
         mfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772638442; x=1773243242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+Y1yYkc3TnZHw6WP08jIl5veXiuJkcXL9d5EK6jlag=;
        b=kj/6oTJkMy5YqAVQSBxn/+glOg1ARwv4V3NFLwYolfW7DNCgV+clI6XZ7mA/cwTIVY
         gKeBbsOBJ/mUn1YZJFh9piDem+s19W+50mKEOdivCt3EvP/ZqbJUwPUAdM8EtuENX/LE
         R6qz+LA5TPx3E1t4zm/nT1Wq/0SsFZ+reTEa76l7XzGWKvyToDZRwjOkid2BGBgkgal0
         4SiaEVl8sRHHAGGSCtljZDI8fLrNXwJlryBcVa0gnEuiKtu5ulK624tbrAxzWXzFXs0z
         gFpnITYyn6EoNi+OTm3S2kF7v75b0jjJvi6wX0wckSeyqFQWk6YRclaVnxYUM56OPdsd
         W3+g==
X-Forwarded-Encrypted: i=1; AJvYcCXh6vpcbDkFrW/zrV5NHE17W4mhoBWUdj7yYWJ1OSer7PpT3txfXwtaI8u3xRDDu9vDpVO4WOSm7DY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yychk6FpYf/I5kxgzSmUPL82qwhjsjw8kYlako87or75uP/rHhP
	xPZwTflCBTpmnYFlBNo9D7bUbL+LoZwXcDDtvJGfh7lEyeqkKA4MU6YRJmDNo6iMk50=
X-Gm-Gg: ATEYQzziKxtQxoObaSO6iCvC06u0RHjgiC6CiygB9SutZYWX7lRyCEEAUJX+M+qFcCq
	6aShmkvO/zGBHMZxwB120sR9wSGFCqXpG+JlzpzXTovmzyjOseNAyhhPnshYee/WtkxasBoNxbp
	0mmWJtf+VMksblJlGzxOvxHS68vYk6ovgpsa/Iap0/qx1fGudrihxPgNq5FO76HiHefoh05Cg41
	1IIshSp0gftSEankhCunh9UXb6N6Ygdj0DT+giRM5gltY+UqXKi1C/Z2C+rycx5EML3Yrc2B0y9
	v8HIIHfvsyh4cS9m0m7zI3D9CuCXZyuYy46t7pg610jQKJhoTOcrJF/5ysMQbzzgkydJ/so0SxP
	CwrKPrDIwYKrUo51rDFNhDf3hwfkjDdB+fcHbfWpOb/hYXDPIeQY1ngbSiGQVfV6bXQm7UNRRlQ
	r12iA9iJoSsm6U5c8qPWdPIHnUYC+wVIm/lWXnaR9q3maa5IeX+GvTxDMZj3Q2atExxo4=
X-Received: by 2002:a05:600c:608f:b0:483:43d8:8d68 with SMTP id 5b1f17b1804b1-48519897fb8mr41486835e9.28.1772638441820;
        Wed, 04 Mar 2026 07:34:01 -0800 (PST)
Received: from ?IPV6:2001:a61:1359:b601:bcaa:990c:b64f:ae73? ([2001:a61:1359:b601:bcaa:990c:b64f:ae73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b3cc2e65sm28325495f8f.2.2026.03.04.07.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 07:34:01 -0800 (PST)
Message-ID: <d99a55d0-169b-4c11-b519-23cb0363ca45@suse.com>
Date: Wed, 4 Mar 2026 16:34:00 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: class: cdc-wdm: fix reordering issue in read code
 path
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20260304130116.1721682-1-oneukum@suse.com>
 <CALbr=LYe7O7f=YZZB+cGqY0hDPLhO74-2h-=EbZTpSU=cpqh2Q@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CALbr=LYe7O7f=YZZB+cGqY0hDPLhO74-2h-=EbZTpSU=cpqh2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EF746203044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33985-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.com:dkim,suse.com:mid]
X-Rspamd-Action: no action



On 04.03.26 15:54, Gui-Dong Han wrote:

Hi,

thank you for the suggestion.

> Instead of using smp_wmb() + WRITE_ONCE() and smp_rmb() + READ_ONCE(),
> we could use smp_store_release() and smp_load_acquire().
> 
> It perfectly matches the acquire/release semantics here and might
> bring slight performance benefits in some scenarios.

CDC-WDM is not really critical to performance. Hence I'd like
as obvious and simple a fix as possible.
  
> Feel free to send a v2 if you like the idea. But no pressure at all—I
> am totally fine with the current v1 as well, so it is entirely up to
> you.

The clean fix is to go to kfifo, isn't it? This is the best
long term solution IMHO. First I'll review reordering issue
with set_bit() and related operations.

In defense of the driver, if I may: It is older than the kfifo
API.

	Regards
		Oliver


