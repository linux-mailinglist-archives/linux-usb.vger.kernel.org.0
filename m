Return-Path: <linux-usb+bounces-31527-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4D3CC5B7C
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 02:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99BA03011A5D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 01:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8437257423;
	Wed, 17 Dec 2025 01:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGnq+gw1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E5819CC28
	for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 01:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765935817; cv=none; b=nvf/z+s/pJUzK8cPEfpEGyiLPA++secEY9npMnp8Y0+nrt91SLotQMti+nGm2/bDGiYJS+8f0URz5VfTkgSPgbiKQNgnAFUIcvVIDdKgPMAzS+JTmbwZBMfmeR91hzKA6G7xZj0OwstjFNwTBnqdScUEuJTmE74KgCV+9aEfvMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765935817; c=relaxed/simple;
	bh=KTv2ZHe+Pf2UP7Gc46z2Dv4PlUrx7h0Lcu9f7VVuRtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gjsA1KaZlWsNlKNqkl9GLS/MOSiHgfVKnev6LD0lCWhVWixxs1lNrUjfpMSR9ckALKCGx5AV5d8cuXmqWRACQ3kLOOUdIwduHtaC7brXFL5LxHhDHk13m6a1WC0etbDYFftPPSSSro3k/UT+g1XkNvUddJ5Xv3bJXRn+PyW+3v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGnq+gw1; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34c6f6566a7so724023a91.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 17:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765935815; x=1766540615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hcmcva5D3bcMY/RGiF1OQIJue0+9CAWp28PjOvFTVsg=;
        b=AGnq+gw17Emdpu9aMUboDpkhM+elqedbmcG503yVHfL39iF44wsLx0h4t0oAm1qynQ
         2D/GnTWxA786cajH+gH7wXXSmblQYnWpQL7kx1mshTOb1FPXdJIg2FkBvOKdQD24ke09
         HnyiWQZQLBg3VekQNi34tRcBDSXPxWyvJmnXoJy7uNFdFp8exqFexoNA8UMy2cblUyhJ
         43ij1EdmrY0XLjbTZEKJ6IHrRGbZU4Qo/ctGF8G9Q5cfCwNXumeV+1jj0tJfiJycbMhZ
         Dg9GcbrV1htZHSPAdemPhNddj/ebifvAFdItddkDd8mfDYruEPH6nUIiELXK9vQ1ZC+H
         FoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765935815; x=1766540615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcmcva5D3bcMY/RGiF1OQIJue0+9CAWp28PjOvFTVsg=;
        b=fELKOWPHmsEtGWxjCs8IZgTF3C/FlVy+ZKsmdE9I0Z/QTa7jdfscbxXeD5WfBRagBH
         BmYlU5Wyt+XRyd3ZlEhnC3emhalcoMTFyXgMzh+LkEFna9KGMITN4FWqRIUUuCPrsOoN
         wQEcIcS0Xek1amrzkw7+b/OGUKnCb1OGhXvKJny7fI37T+vwttBDnhUHsdct0wheGrkL
         kFJZ7Btkp419zSEDOeULjlvYVHyJm0THK5nxTBl8/rwaQ4N+TPCXsNBzpgWhHGCF6jSz
         fh4lWcz4PUhxlddUQBV/H4taG6xgeJ57B+qfiM2BnZS7zPTxBUxD/qyAuqeNYKH5A7yB
         L0lg==
X-Forwarded-Encrypted: i=1; AJvYcCWFKfsegPX8ST5FETRQCh2xKjfAq7fIwub7E2Bvay3hsBl+xYTaWOO7XI3JtQ1tBFn3y6P9aytOdbA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhy+uaZiR6aMxm6egBjpmEQtGmo+aX+iqdK4nOkLl2pPg/5Yk0
	iFN5xtzgNKskI6GzcKcfajuAfM+2i3BOn3e1DoYZt0dPxtdYZjHql3Qcra7ppQ==
X-Gm-Gg: AY/fxX5NB8GdXaFuGO38mCfbz945QwHhUdQDg+iWDFe6J6MvuMnFvoSqswTwDmd1nll
	WrpSZUC3HHikJ30A8gpN3Sx5qzKqnx0US+nPD9myWqR3LfRZdlz+/UxwwDOP3oCjfEFnwr5CQKB
	ys/FOIIzeXwlRsHTbAfzAqsz6kUapKspfFU+0oCIkH/8D4goA+fxnh2SK9FI3E/s4jTyZ4vr+Ao
	8L15uxc1qCViaZLjMKRF0If36eEIOcAP6zy6bafbtKT3AMDr93lM47Q/+DvKfItlUvGNWV8RSSK
	hZxGVgbU+HNPy757YylXMyH9cP4ogMqB+O8xoFfXzwOKa//zbU7mXh06R+vAvpoG5wOTHKvlqzH
	pmf1e6KKXmh/8OsVdDG6+Q/9Ytdc37nlw8r/wHUnB18kz4TlFmm8PfliqPHlIZN5CxTHr9rhaS4
	ANzyite+KNqOK3o7B39nyJgw==
X-Google-Smtp-Source: AGHT+IEvYT2dtudRmQm/bn6C+b2uveteegEC5cy8ieEVjUTt8/LNqv/L0djHPan73XAHBCyQvW/waA==
X-Received: by 2002:a17:90b:4f41:b0:341:88c1:6a89 with SMTP id 98e67ed59e1d1-34abd7e3bd4mr11530747a91.2.1765935815417;
        Tue, 16 Dec 2025 17:43:35 -0800 (PST)
Received: from [192.168.1.7] ([159.192.237.173])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-34cd9a832absm1112773a91.4.2025.12.16.17.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 17:43:35 -0800 (PST)
Message-ID: <5227fbeb-0338-4006-845e-37f00b09218d@gmail.com>
Date: Wed, 17 Dec 2025 08:43:28 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Trouble with drivers for Epson Moverio BT-40
To: Oliver Neukum <oneukum@suse.com>,
 natalie roentgen connolly <natalie@natalieee.net>, linux-usb@vger.kernel.org
References: <9c4491aa-88d3-4c9a-843c-2f0d471263e0@natalieee.net>
 <ade89a9d-6034-43e6-ba74-778db2f8837c@suse.com>
 <ce3a8714-bce5-4cac-ba80-f3c64e6ff5e9@natalieee.net>
 <b0899011-78bb-4fdd-9e49-3dad6b11a9e6@suse.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <b0899011-78bb-4fdd-9e49-3dad6b11a9e6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-16 15:39, Oliver Neukum wrote:
> 
> 
> On 15.12.25 15:17, natalie roentgen connolly wrote:
>> Hello,
>>
>> Without adding {USB_DEVICE(0x04b8, 0x0d12)} to acm_ids, the stock driver
>> emits no logs:
> 
> Hi,
> 
> OK, I see the issue. There is no nice solution to this
> issue, so here is the ugly solution. Could you test the attached patch?
> 
>      Regards
>          Oliver

Oliver,
your solution is more ugly than it has to be because it assigns fixed 
interface numbers to the cdc-acm interface pairs and won't work for
devices with faulty union using pairs 2,3 or 3,4 and so on.
Instead, when parsing the control interface then assign data interface 
number to next interface number.

thanks
Lars

