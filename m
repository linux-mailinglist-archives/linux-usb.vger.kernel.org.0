Return-Path: <linux-usb+bounces-24672-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E84FDAD3C90
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 17:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE30C189AFF1
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 15:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4D123FC5A;
	Tue, 10 Jun 2025 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AcdnXO82"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F8023CEF9
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 15:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568567; cv=none; b=h0hAem71Y0wXLCkOcztndw/zKJ/IpSw3a6e/JAkL+8YI5eY+dMBJMquqob0sZOU5KOoUok/Jr8vRvL9eM+g3Q4L7d3f1FTNK/NFS7Mt1OUvjsPv18/6j6Nnd+DaE2cdkdMDgcViBeV9IWCJliQmSExOivJ/MdgZfIfqeDwdp6eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568567; c=relaxed/simple;
	bh=bXZQ7o36EMz4WGW+YYGbt37kKEh0DWrz9B/gcC34k2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=taD64R/KUt/c2Z6JGbVdDScLybddbmxGWc564BT2ChJHbECeFuxEHMats0vopwLvX8U67BIQ7UbMnVjmiI2H5kHI8Y7RpWglDk8nAV6smqBayH3+BQszcas3etq6nVhnPfH7RbYX1f6yYoukFOrzOjEaj1VFThzYsyyV33B/skU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AcdnXO82; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70a57a8ffc3so54870567b3.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 08:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749568564; x=1750173364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lpq9pZAYXAByb+LJPROy6HG7zgtnlujLYfg81KL91Tg=;
        b=AcdnXO82dz8krrZj6klWK1juhxGd0apYR3XkdbtvJtr5BgDxi6d4wamk4A6fqG7FLk
         top0rh02RPDPjeA96RRuZpZlJhJvL7LeJ+LJlxIUkQA5At1dYpABjfQMKKdG1XoUyNWY
         G+8MTmlsZIF8TQiubkvPI8megDT4W2kUyTTvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749568564; x=1750173364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lpq9pZAYXAByb+LJPROy6HG7zgtnlujLYfg81KL91Tg=;
        b=PCSEQgftwiZYvOjAdeYONjsscb0G2xXAVSdMTZz1Cl4PXsWhFbSAEl2KobhPwOYf2P
         B22Cv1nvtxhjxuzbqtEBhTiNHLHvbVo6U+2fyGgCgUzyhPbk4lRmollA6VLYNrAkhRbG
         JF/P3FZq1PG+IpvzWGn48fSJ02lG3Ixla6zbFSsCYtCe66qQjLqgHeyRauwsi84Yi/Hs
         Z6zWkLZnKumCdUj/ZbTiHNZeGu/zG5MdMCg3C0CoCvdGyxiDM5v3H+jVvMsYvNDOXDRS
         T8t5SdKSeIzafHep6C0iOm13p/MOODOdKsZ2LBd9tvzVVjkpmqI9N+GjHpwUk8Yo/2L2
         Gj7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVl6MeIO1r1HITpqSppmRri8tpNF6qoChAMPCYfgcu8vv3xQ05Xta4Kt60NjGWai2UbDpN51jItazA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4YhXHD9oj+xXgnbZtUDd3N6krutR9ljOTUUiieqnQQsuimHYD
	oc3dLP/SYDCXxc0+Oby0AdIb9jG7PvvXQjPjgxgAh38dws5+pBpL/0ku0OyDa5h9vzzIDLLdmnw
	1xQOh
X-Gm-Gg: ASbGncsxbPixbPXp+nb+CbsStDethVODdEeX0rdNzrvWGJskZvxiP13awpNU20eEB2b
	8h2tymxc/clGy/txcQDRAgwOCYXOBJpqx6f+OXdiuGHXr9ubwp0Uj7TrtxVK7jUOIMoolUIeN9o
	RK2yjBxnH3Hcix2lD7euJCYudsyDXIZ47LYzlkIOeWB3o1qsiHW47jPATfsYqa5T0+lTt7YeFRo
	3+/ax7ePL4BaosezO2VOj/ysiXgVWputyNQewvP02XstP1cSQs7JApg0XK6ARMbb8FUhM3B/cQn
	/YXasjfHWNyupmwJayQjGg17EdvZ7mRvUXm+OXef+XZhnGufcbUyR1OCO8Ed3OVJqqtYGRTu3HY
	5
X-Google-Smtp-Source: AGHT+IHvjKLUH4aILJb7na3KJkxtnNMmv5oRYWORhBi1NhvFUiJ7dWxHiE8oEqBuLTsqSDzZ66pK0A==
X-Received: by 2002:a05:6214:627:b0:6fa:9b1c:740b with SMTP id 6a1803df08f44-6fb0905c04cmr277414796d6.42.1749568552703;
        Tue, 10 Jun 2025 08:15:52 -0700 (PDT)
Received: from [10.212.144.179] ([12.216.155.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b2a1b6sm67051666d6.100.2025.06.10.08.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 08:15:52 -0700 (PDT)
Message-ID: <1a9cea94-c198-4cc4-bd69-d36f6511a121@linuxfoundation.org>
Date: Tue, 10 Jun 2025 09:15:51 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: convert to use faux_device
To: Zongmin Zhou <min_halo@163.com>, gregkh@linuxfoundation.org,
 shuah@kernel.org
Cc: valentina.manea.m@gmail.com, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, zhouzongmin@kylinos.cn,
 Shuah Khan <skhan@linuxfoundation.org>
References: <2a327b520760271471717fff9b222cdc34967489.1746662386.git.zhouzongmin@kylinos.cn>
 <20250604065410.76069-1-min_halo@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250604065410.76069-1-min_halo@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/4/25 00:54, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> The vhci driver does not need to create a platform device,
> it only did so because it was simple to do that in order to
> get a place in sysfs to hang some device-specific attributes.
> Now the faux device interface is more appropriate,change it
> over to use the faux bus instead.
> 
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> ---
> Changes in v2:
> - don't change faux create api,just call probe on vhci_hcd_init.

I will defer the review to Greg on this.

I am fine with the change if Greg is happy with it. :)

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

