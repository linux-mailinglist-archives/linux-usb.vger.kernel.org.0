Return-Path: <linux-usb+bounces-29344-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 608FEBDFC62
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 18:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7348E3C5BA0
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 16:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0160338F28;
	Wed, 15 Oct 2025 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtMWLhjd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1BE324B1D
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 16:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760547129; cv=none; b=lYCrFK2M17di7f3QZV/AhUEtbkor6POflrgzWBKBcidsGe27cHzcnzQbPJX4nRLF25ltf4U8u+Eken91k8tUtsjqn8vtBWj7L3JkILuVn9lml4JK6H7N+Ev+NA1YNOp6Lg9jJdJVmI4WTG9uLiX6WzPna8O1vJarfwYLqKMllvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760547129; c=relaxed/simple;
	bh=wbxUTvPZYOO+jnUBOwHP6vqN2Y8d3Evx6zjpDRrIqFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8gomlhrEMlYdBsvQoQoETTBrlajH8rdQN9fI5Ysbk6m1wSFR+vxSg0tOmyO8R8PEeyqIxmvOO2L+aGRhApytWgLEw6jP6ITVozbogf8pZFyDYDc4OGXx3ZB0kxsC7PRCQ4ydPYNVJAKFCECTON64y718lAcILIO8dPxcRuZy6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtMWLhjd; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3da3b34950so1112839366b.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760547126; x=1761151926; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=neLd0+dDQvDA5L4vv0sP7kK28bvW/poi2lRWCeQYViM=;
        b=XtMWLhjdHBLttzyRnOCk7fT64rZUtawKBK+fiZaUyhESgZ9m6tHtmI9JH2d4POkSRS
         siVFJpZuQ3KJM2dcTkF3oakGLjiYm1dyxklbPiw4zQuAIShZj76zxGDuJ3iQIzRz+QEy
         Ov6cjUJD5xUQ7CrOSK3Tg5+CsIX8wICe8y3Z3fUbTBdcGmxCNw0qweKuvBrskgBKBMm8
         8QZEryxebdFxQhzCZcMFhwbwS7VCK0bwtNaRrTDUymXo9H1qQrRWjEnGaCzetcPLU0rn
         Dxm8V7hkg9sO+HRGrv0+g8wWJRWTwlZzXbBi0NGqgo92OoPkRXyYp/vsHaPjc5Da9G+S
         UxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760547126; x=1761151926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neLd0+dDQvDA5L4vv0sP7kK28bvW/poi2lRWCeQYViM=;
        b=s1Cxtso3F6Z9L+IS8ET848r1dZ5YECF0GsAnFPF5RS91U6kAdOXFwTLrQV9vuf9TD/
         1LjEC35z2TVOF+GJEgPS/jnS1az4iYWHHljOxjOWn8imFAJ/7vYVFkHH15o01WrLXErH
         hH89ktw6otmZYoe7jI47RTH7G5cwr2uYM0ilhRC3PQ0erK7BOQIHplqFnHiiWZU1HdCd
         ERNFzIx8qWfhzde6/m/38g9kIu0phzgz6GaEGygK7md09x9CNCMaVFskkVW+5ti2fzY3
         m7igWmSlJAgMTOdsCLr1ODsA2wmIcTIk13aADLZTE61C6vTJZdFQ6fV74Ghw1tRMSfXg
         InHA==
X-Forwarded-Encrypted: i=1; AJvYcCVffEIbL4K2WdjT1soXe6+J/o+snXrDVr8zmIpZOHWUpiRZZbkUcxuiCYWJbLA2Fsn2vYCUVSwHB3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSTr87jUqeL/yRsdsFg2uz7Pnes9qZgkzuCxgQe7uId71V/aRN
	bIe7TS+4d1R81tFx1LPVHG5CEpS3IzYKCZg5SQRgSr6Lxm3pbvjFdnwtp3GZFd3JQTOsC/hKy++
	QyWBb1h+eG8ur4HzWP3L3w6uLavqOHLM=
X-Gm-Gg: ASbGncscM2+64Ksean3n0HDBfZBQiEl1v+ilxU0IjnXpTAFxkhohLtWn3sIFoaz8ZQA
	mC5Ms2CLkd5EysSn0Jbp35YkVgsrOxQdt4SSHQn+UyGCNQGWlJdyylVFniNfuhq9J5V293/Uh0e
	B3e35vY/N5zkw4vqTRLmHLo+wB3lIZSfVwNe4AKLX1sRRRQ5kWID2S/Oc6GIgYK7CI0pc7GbGPH
	9PaHmf7GaGBV8TtwIvFyqKclbNbz6s5AzcuYcNnLKQVRo8vDf5DHF+EL9MhuN16d5KwwIKLWyPo
	xbOBGiloGg==
X-Google-Smtp-Source: AGHT+IGsOnSPE3hz5ZfYzWJNVjtUVgW/EHP33IR6zBRV5g9gSsqBcciCEwgcZlf2wmO5rhi1e9vsERWWoOP5SCZzdpg=
X-Received: by 2002:a17:907:7f13:b0:b45:e09c:7e66 with SMTP id
 a640c23a62f3a-b50aa8a5bfdmr2998830266b.28.1760547125501; Wed, 15 Oct 2025
 09:52:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013181648.35153-1-viswanathiyyappan@gmail.com> <1adfe818-c74f-4eb1-b9f4-1271c6451786@kernel.org>
In-Reply-To: <1adfe818-c74f-4eb1-b9f4-1271c6451786@kernel.org>
From: I Viswanath <viswanathiyyappan@gmail.com>
Date: Wed, 15 Oct 2025 22:21:53 +0530
X-Gm-Features: AS18NWA4RJCcpLPYd5taRLYmabL4v7fT9byYpjgnUo14PKi00TibSEE5yn4bNKs
Message-ID: <CAPrAcgPs48t731neW4iLq3d+HXEQAezHj5Ad9KR8EK+TNu5wbg@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usb: lan78xx: fix use of improperly
 initialized dev->chipid in lan78xx_reset
To: Khalid Aziz <khalid@kernel.org>
Cc: Thangaraj.S@microchip.com, Rengarajan.S@microchip.com, 
	UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Oct 2025 at 21:25, Khalid Aziz <khalid@kernel.org> wrote:

> How did you determine this is the commit that introduced this bug?
>
>  From what I can see, commit a0db7d10b76e does not touch lan78xx_reset()
> function. This bug was introduced when devid was replaced by chipid
> (commit 87177ba6e47e "lan78xx: replace devid to chipid & chiprev") or
> even earlier when the order of calls to lan78xx_init_mac_address() and
> lan78xx_read_reg() was introduced in lan78xx_reset() depending upon if
> lan78xx_init_mac_address() at that time used devid in its call sequence
> at the time.

The commit a0db7d10b76e introduced the dependency on devid to
lan78xx_read_raw_eeprom() and
lan78xx_read_eeprom() and ultimately lan78xx_init_mac_address() and
lan78xx_reset()

In lan78xx_init_mac_address()

Only lan78xx_read_eeprom() depends on devid as

lan78xx_read_reg() and lan78xx_write_reg() do not use devid

lan78xx_read_otp() depends on lan78xx_read_raw_otp() which depends
only on lan78xx_write_reg() and lan78xx_read_reg()
and hence doesn't use devid either

is_valid_ether_addr(), random_ether_addr() and ether_addr_copy() are
net core functions and do not care about driver specific data

The devid read exists in this commit (was added in ce85e13ad6ef4)

a0db7d10b76e was supposed to move the devid read before the
lan78xx_init_mac_address() because of the newly added
dependency but it was a tricky detail that the author failed to see

Thanks,
I Viswanath

