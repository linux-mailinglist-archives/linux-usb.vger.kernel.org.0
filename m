Return-Path: <linux-usb+bounces-20931-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA352A3FC22
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 17:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3332B3B5F56
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 16:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141ED1F470E;
	Fri, 21 Feb 2025 16:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ITvY42ne"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F191F3FD9
	for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2025 16:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155849; cv=none; b=Mi2nBJAeW8aHQckR12Gj4aEnT2yf7RmrqtZA+jWCA0s1CDBWD3IXW7UV3UHPjvjDx9THdwJQZroCiQVL6fVCnciwe5NFQYuFDoedg5/fW6XOxwN4NIAkDQKyxyei3WwkwpouJNma0dlUHmz6bAhNNe9ealxhPspv73BMAbcZ8no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155849; c=relaxed/simple;
	bh=UeYBjbw6KRgOeleBHEwouX2N+zrJvlo6+Lp89cIcguA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTA6D9hCndDpof6+WUyI7E5C4cojL+Vg1ppA2hf3oqU6SMGNwldFpJYSt/vDJ2f/KmSiiwnAIqBRWYT2JYK5cE7LTOGYcrJ7O44hNVzExymctFP7MkDIieaww50fYtO6fcmCdUNTC4Q5R/nNhg+s1vuDcWA04q5x5Nu1+8TwXNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ITvY42ne; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-851c4f1fb18so107131239f.2
        for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2025 08:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740155847; x=1740760647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nts6kSLiHjhC7799/D5CevPzdZ51lSjLAMjPbRT1vG8=;
        b=ITvY42neb9RuAiF54oIp/sdPyBNLEFQBmy4IuM3E11uQLmKMSMZH5xzMNRbSdpHryF
         KRKG4d5CCTqi2EJEDdTmIeuzAt1JFthPt8hU1WanrbVKqP8CMchFOr63xVE2RdvQsR+3
         MWkK0xgUIucgI+9P8HVbV0w6+fe2eWPyQeMqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155847; x=1740760647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nts6kSLiHjhC7799/D5CevPzdZ51lSjLAMjPbRT1vG8=;
        b=r1ENl+fPpDvm1QpVYAeveWojAwxi1/nOTTXMqV2OKhuZW2gERaHixZ9e05rWo+Kr0o
         dURhjGgvXLBwnunEZEPATuO0gNZKXGjmUbxWNlP0N2x1tubZ6ZCw9MaMpY5T+NiK6m7k
         /F98Se0nEFawLJaAUNfFVMhvumsMhAR3JTaOxqalTiE5/mKDvNTkqSdsh9juF1QeTvz2
         UK7mdFP2v6xafGY9emf1Dk1dsOp4SFmlWy6yI/wJbB+YgWrwNjjVwnlE9S0FfKipUY5M
         jHau6ckPHvENmbM+zZ5ncYWgujVElJV15LDdg4iKkjeJR1EanPgsFw1Rzcaa5IyLHVJ1
         j/qQ==
X-Gm-Message-State: AOJu0Yxqjdls+OqM2oGzedowunqZsGqwwFgfKAedkz1wD3FHX/2F0KmD
	tZtxWRxR/6J1gDtx6alFMT42HjMA9IHiwwkk08bJ7I2711uMe013STrnj0vAkbKAqAJrOs0zysy
	C
X-Gm-Gg: ASbGncvYSXNd8SU25Fe0NZUX9hW+pme7J0zwd+2OlJFBnwwwtYZ42eoGUjtzWVc63L6
	Mew4w28ktSwQK+aEhfCt7TvvQ3kcSDoFDYbDVLF/unoG/kR3xMbyZPPTxTqJk/a4hM3DBocwSaf
	7lSvv8UL9CNl4TFZYxcwx07OUb/t0RgD3M5BL5iyQTJqXgHPBRRtY//zo1SJMul/SgFIDDH6psL
	rB5K4n0xCp8lb9sL9xtBeXa+RzxnW3RxNtkFjNoReilIqWSg7DCXLO2UMXI0XBM67Mcz1m7D8Yk
	HXHJgOJLCpnX5bRH36xRJLsuQvs1niapFyz4
X-Google-Smtp-Source: AGHT+IFNYHFTandrSBH9BgNJYeWOBNtPRRZMQmnPTYOEwQyAIRPjzza117xrEj/Aq6YdlhdE3ccndg==
X-Received: by 2002:a05:6602:140f:b0:855:a2b0:93d7 with SMTP id ca18e2360f4ac-855daa510f1mr459727239f.10.1740155846758;
        Fri, 21 Feb 2025 08:37:26 -0800 (PST)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85597850ea1sm210412039f.46.2025.02.21.08.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 08:37:26 -0800 (PST)
Message-ID: <88b2fb4b-96a4-4d29-bf92-4064d3572fa4@linuxfoundation.org>
Date: Fri, 21 Feb 2025 09:37:25 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: Fix the error limitation on max_hw_sectors for
 usbip device
To: Zongmin Zhou <min_halo@163.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zongmin Zhou <zhouzongmin@kylinos.cn>, Shuah Khan <skhan@linuxfoundation.org>
References: <20250219092555.112631-1-min_halo@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250219092555.112631-1-min_halo@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/19/25 02:25, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> This patch fixes an issue that usb device through usbip protocol,
> the max_hw_sectors will be limited to 512,and then
> read/write rate of high speed USB devices will be limited.
> 
> After the commit d74ffae8b8dd ("usb-storage: Add a limitation
> for blk_queue_max_hw_sectors()") is applied,
> This issue happened on the swiotlb enabled environment.
> This commit will checks the maximum size of a mapping for the device,
> and adjusts the max_hw_sectors.On vhci-hcd driver,
> the dma mask setting follows the platform device default setting(32-bit).
> So dma_addressing_limited() will be true,then the maximum mapping size
> use the swiotlb max mapping size(512).The max_hw_sectors reset to 512.
> 
> To fix this issue,have to get the dma mask bit that
> the real USB controllers support,and set this value on vhci-hcd driver,
> usbip device will get the correct max_hw_sectors.

I don't have objections to this change. This does change
the API between the kernel and user-space and requires more
testing with mispatched kernel and user-space.

Can you give me more details on testing you have done with
the revision mismatches environments?

Also this would require bumping up the version on kernel and
user-space sides.

thanks,
-- Shuah

