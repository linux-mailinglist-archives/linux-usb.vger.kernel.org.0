Return-Path: <linux-usb+bounces-28614-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C9AB9C2BC
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 22:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 091021884995
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 20:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDAD25783F;
	Wed, 24 Sep 2025 20:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M+Jfq1Fo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB32322764
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 20:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758746497; cv=none; b=H3KPG+ypf8oyyLYKLVKOtpjGxED7A4p8YbzAlNtQwQ0XDawC8CeQ1VrHuIv6M/jmGoUu+I5gMTTw6aWC4lDW58iSv+C178F/aQtTyfzuocX5QFvjxlyWh4K5PuUj7CV57HnNdZn32qKE9OtbX1I4EAMLtEeSSd/cmLr3CaztTLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758746497; c=relaxed/simple;
	bh=kXwStSJzUUM2wTjVcQqIiMRHPqvIep/0eotaHzEAHoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JLUo3JVmoWaJ+SlU61t2sBXHhnLeHDGfF+gZG47ZOjGj76BISdqNEiaJi7Ar1A4Ra9rCrXR3kfLHz0ZDJAXPh+HPioEcRyu10M6/7t8GgKW6idYXwhkZwx2yH43v3GlgeP51cjKLmPBYTMfR/YQDr57M1+LGjt+Ki4bn8RORRcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M+Jfq1Fo; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-424d3c1256fso1364395ab.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 13:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758746494; x=1759351294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlmrI7hpUi0HNqRBLgmvEzqTujMsR83VWTin/t3tj/I=;
        b=M+Jfq1FoKV0zfynI3dhaNa/ZZ50ZiYO24IM72esclLkd2XoNBVqkDvUgHeCuArUjlB
         knQMLZnbNVJ/uHpaHB/iqGYXPES/a1jcuLtdyBYRd3DN049yeBNfCBnvn3qPkSxRF/FJ
         Y0XmPbMFHA72OKvn0hKDuVykeidKjjnF+Z5PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758746494; x=1759351294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlmrI7hpUi0HNqRBLgmvEzqTujMsR83VWTin/t3tj/I=;
        b=jrlksFf7OeN9IAt2NTVdvhDWQT4umo8SZRd2CcEy4h3cWW2PKHSpUj3pyHenqqs+qd
         T+EcTWXkbdPJnrR74FNDaHYq/gYqJHtYsJqw+t82pI2fHgzNI7CrhGWmOoLUdcSDS8ug
         pJvIqotOG9buvjX1GAoloKVWrvz8PJQi3pU/oQyCP8DjirutR39sPSESBQqzbGtPIXn+
         mvkBINbKN7Sscjbnk71RU3w/LF75xaWR01s4GGhuzuD9g/qLQvGJVtvBQDFIQKx5sBdp
         Li9Homg0mgk7J5DrAGRZuW7Qh58l8DPlEY9cTN4IeHC49kvzP/x2OjIgSiUi9iYewk6G
         7uPA==
X-Forwarded-Encrypted: i=1; AJvYcCWT2wB5bKMQxkqi267r7YdiLMK8MlUqRnOdI7gIUlCMHFH+buAOQBt5LNT1UPyMynnUlkkMZyhUGYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJcmGzBYjNcSWa5fGiFs1dYAGB5Tg8tnKJmitRGqFWUQvBL/er
	Qv65Fg/va1efIhuFmC5cErenr+kSFcnuH61DTGcEbPtJaRdzu5ESZu4MYTuZtYkZHu7QPgOP/Ti
	C8rVU
X-Gm-Gg: ASbGncvu9gBF9FGvD9lMJuwPL+c902tOzs8bs4TzNZjdEy5GFSLGvLxw3FdMqIxN27w
	4rvOXipAvqxVHz39eGxEY95DKIYgl/2j++gg3S/o4cSAA3J32fUYPW5CN1koRnUmgWz1x5JMK04
	4BvQ0F2sjexrBNmBnNPEjaKSjaE64SFkhuJe6DWsSwdRYEG0oSdQY0uqvm3qd8BQ2mHZYgjdaCT
	22jZ12ILXO/cJGndJhoAJrIS9NH9DUG+afRO3/zaPDc4Z+jDz683RETV6g+SIR4JJnaKqmf1rdQ
	LviUWUSXoHN4X2N+R1aubvgNTh/t+k/r92wja1yuJECFVmR14dAbkmeYsvRGsSwhXFZBD8hMmnL
	8SzxoQPWQ9JRxqCFlFNmxWY/b2GIXlQ3yMw8=
X-Google-Smtp-Source: AGHT+IGNshkXrQ7jqueT0uM6B6VLdLEXbxxLiC3Daw8fjI5R8aeGXHxnL/5gMD5P8xdu4OEt9TU7xQ==
X-Received: by 2002:a05:6e02:1d8a:b0:423:2666:4687 with SMTP id e9e14a558f8ab-425c36bb2cdmr2782795ab.15.1758746494490;
        Wed, 24 Sep 2025 13:41:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bc0b059bsm910745ab.10.2025.09.24.13.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 13:41:34 -0700 (PDT)
Message-ID: <cf6f39ec-60c7-4779-971b-1f52b7253f4f@linuxfoundation.org>
Date: Wed, 24 Sep 2025 14:41:33 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] usb: vhci-hcd: Replace pr_*() with dev_*() logging
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250902-vhci-hcd-cleanup-v1-0-1d46247cb234@collabora.com>
 <20250902-vhci-hcd-cleanup-v1-17-1d46247cb234@collabora.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250902-vhci-hcd-cleanup-v1-17-1d46247cb234@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/25 05:56, Cristian Ciocaltea wrote:
> Where possible, use driver model logging helpers dev_*() instead of
> pr_*() to ensure the messages are always associated with the
> corresponding device/driver.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

