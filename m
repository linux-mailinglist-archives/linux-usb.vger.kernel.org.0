Return-Path: <linux-usb+bounces-28616-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04051B9C2D4
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 22:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB37516A321
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 20:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A485A263F3C;
	Wed, 24 Sep 2025 20:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RIrRoIkp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56371258CE7
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 20:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758746651; cv=none; b=ekq3OvmivNp6QfDiouWDDgwXn/Bvz2jD4C0FRYCEJ1mSHI+BFnTas0X6hB4Qj7jMn9HdViVNlJXtODDXx/VlyIfF9qm6s4meMTmuDdjiAw9r5XXTAWSwUWZq1ZSCcGL/nA9AY1377jfEvrPDoNLjTEJYUs7ghde9m8pH7aqGDcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758746651; c=relaxed/simple;
	bh=hQCFRrzhsxkJHd0T/Q9S6qEGubOT9QVFnmKdp9gdvUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rvv+dzNfhsDNt5y17KhCuVz05ru76AYiCQVI1w3sKV/JSyvF4AmgeVjJXlRiXGsPWXPlSXPsEpJPNiQmOiEYDrThv1oM2E3bQYTqC3ns/BdEOxb7atGaqqgIbHaS4spyE8hf3UmC/X8g8CtzCbezDZSc2Y9CB0160URxjNEs540=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RIrRoIkp; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-4256f0444caso1137775ab.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 13:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758746648; x=1759351448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DcrEAJWpZ6b2yow/2Ry/2Ua/hb8QLxVcxAQFim6ANQ8=;
        b=RIrRoIkpoJVXb671IIc5NYRdj9v0mZqOk9ayk1rrwF3RGWh1LQ1kTQ0wkY/LBb7VYq
         yP1g2a1cq8YMTHJ3WqfIdC025r7e3fRHknKwTYvPP/3JCRSM/MInvAZSTwfg8VCHH1+8
         onXmUnfSwrqEiP/CNW/9zlI6hAM7HuH2wGxXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758746648; x=1759351448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DcrEAJWpZ6b2yow/2Ry/2Ua/hb8QLxVcxAQFim6ANQ8=;
        b=S11Aw0xgP3+N+nlDqAP+rx7Qqj4vfmioiDK3fxZOBQNVWlqWn+Uuf2RjerW2jHQA6f
         HRTUdyN/krPa5s9EQ8DkkPNeJ/5S7k1MbzEmQjo9+HEAd4uN8tx6tEnmAC3E/8jRiamM
         IdaDohCWh3X8pjPnJP0a3m29FagE54cGPk63TAcHRv6k0lH15IBRNqxxxB5NRZiI8L94
         YppzkrEUeUaZyqDPK6w4393Vq4OolEn68K2R8MJ1udXqhI+92XVBiRuuoEYX1JMJB/Cw
         uwlEfnWLIsRWHp81WynJUWK7lwKR0Ps+75gGsXDr2HtNtc3BLdyjNPzYy57P3y5uy65+
         U0RQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1/k+Dc//YCYHvfztd2plX8OhmfqqBCVFDM18nHqrgIIoSDIvJn8NsCDX+NXPIHuPzhrcws+PVFdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaGRZqpwJx5C8uInQ/3Judvs3DXA2gG+Tm+vfrzs6CmkwP80T8
	l/IneZsggiSi/zvirACHmh240CY9vHx/iehMIcS6fOf0jhHAa9EyQNzuizweSvjzvsc=
X-Gm-Gg: ASbGncsRR6t/1NyXIQjVjqJnh+f/T5G4UupbBZ24lxBJxy9pqXE/M7s3zNHskmbcgV9
	4fPyYA59eBj94iDP6zvbS9EgChzvS+mx9GCh2I/yit/PJ93gG7DJog1fZTEGVXFSRDWifSUMCXt
	5NRs966YI21ZnDCQUbGfguQ7lgKiCTypu2zpZ2GPJ3w4w61r3IluyGlqcX4bseHfGl4SMRCXvkl
	3OXpGit4XRQ/zxILH6fJCYDJzduLbayd8+JX3oqOIpum9xYhruS+cHtZXfn+nSt5ldtDdfGUTAH
	4uqDiCcKFwwNlWxqL1gSlbSM772tGCKSIBqdYbu2axNnKRC37/t7F/cMgWTfQALdU6YdJuExmCL
	LvTTKrqcqT/L5VE5872kRiAzBLXNt5k+uu30=
X-Google-Smtp-Source: AGHT+IH6BOgqWB0moCn+1AYSvMLjM7sFyc1fdmL1yRzPltIFxLhk4VmMqY6UiuwyzQsxKt1prDWQ1w==
X-Received: by 2002:a92:da4d:0:b0:425:9531:821d with SMTP id e9e14a558f8ab-4259568ff27mr11778655ab.27.1758746648358;
        Wed, 24 Sep 2025 13:44:08 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a6b14cf76sm74458173.80.2025.09.24.13.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 13:44:07 -0700 (PDT)
Message-ID: <eb86ebd0-71ff-4c00-a524-0046b86b3aa6@linuxfoundation.org>
Date: Wed, 24 Sep 2025 14:44:07 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] USB/IP VHCI driver cleanup
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250902-vhci-hcd-cleanup-v1-0-1d46247cb234@collabora.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250902-vhci-hcd-cleanup-v1-0-1d46247cb234@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/25 05:56, Cristian Ciocaltea wrote:
> These patches were initially part of the USB/IP VHCI suspend fix series
> [1] to address a bunch of coding style issues and make checkpatch happy
> for the entire driver.
> 
> As suggested by Greg, I'm sending this as a separate patch set now.
> 
> [1] https://lore.kernel.org/r/20250726-vhci-hcd-suspend-fix-v2-0-189266dfdfaa@collabora.com
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (17):
>        usb: vhci-hcd: Ensure lines do not end with '('
>        usb: vhci-hcd: Consistently use the braces
>        usb: vhci-hcd: Avoid unnecessary use of braces
>        usb: vhci-hcd: Consistently use blank lines
>        usb: vhci-hcd: Drop spaces after casts
>        usb: vhci-hcd: Add spaces around operators
>        usb: vhci-hcd: Drop unnecessary parentheses
>        usb: vhci-hcd: Fix open parenthesis alignment
>        usb: vhci-hcd: Simplify NULL comparison
>        usb: vhci-hcd: Simplify kzalloc usage
>        usb: vhci-hcd: Use the paranthesized form of sizeof
>        usb: vhci-hcd: Fix block comments
>        usb: vhci-hcd: Remove ftrace-like logging
>        usb: vhci-hcd: Consistently use __func__
>        usb: vhci-hcd: Do not split quoted strings

>        usb: vhci-hcd: Switch to dev_err_probe() in probe path
>        usb: vhci-hcd: Replace pr_*() with dev_*() logging

I acked the 16/17 and 17/17 - others I don't see a reason for code
churn.

thanks,
-- Shuah

