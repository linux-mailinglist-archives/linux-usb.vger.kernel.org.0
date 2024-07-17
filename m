Return-Path: <linux-usb+bounces-12260-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 484A79343DC
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 23:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 052C22866E9
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 21:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63F3185E75;
	Wed, 17 Jul 2024 21:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AsqGNl8P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FFB1DFC7
	for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 21:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721251682; cv=none; b=uqHxeY3Avwt8pxlDJpk21/O3yhk+P34E+jC5RqL4i3bc/dnoH1ozdwL+mYqFBnbvJ8gLAZJGd3qAI/LzOKo9g4EukQOaehu47O7ut0rZLsD+UZ1XQmC1r4jkALB+o19ILdPkmBfM1KYhqg40bW1ZCCj1Uzw8jaApxE0P4kPtGb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721251682; c=relaxed/simple;
	bh=HPCTD7yYTCDJ0urpW1mKCkgFsRw3URmmP/8UT0V5p8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSkeDsBVUH1HtaiR7FoUc/f0Jr2KddwFz6GcDnNsQqsYYg/SlZTyo6Lgr5iFJ0k8yVNejobRGN0dVPESAqAMrb2f//8EW85xY23qtiiy4na99ChW7wBnFAeiNU9x1E50rG0xiNta+DWaoQkUZ8cyOLCcUQ+Lzdww6NBFBgFI0+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AsqGNl8P; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-389dca7bcacso36905ab.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 14:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721251676; x=1721856476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9Dh8B0YQfdq4b7Pcm69ku7/Q9q5G6eIFU6jyMj9zJA=;
        b=AsqGNl8PrqEE/+qK5kwXPH3u9aVcJamyWElZ0XmkqUhzy1TcLRu7cEtgmOSTwZJy3M
         gqqCGa6wVk2EMshnYw+qAJPLIGsBdJ3z+7LoqjjQykYPRYe/Z3h/JvH0+iz8XgBiXaqb
         c6T0Zv3GGpCV3Bpe7mz+aPd9c1LI5gh2huKHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721251676; x=1721856476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9Dh8B0YQfdq4b7Pcm69ku7/Q9q5G6eIFU6jyMj9zJA=;
        b=o55KV4Ks7ZeHtOhFL8EJzOJFIlT2wIO9ofMMMLw6njGTS2keSom8zc0fx7mgsI/Gtz
         uyVwMxrsPbCnxsEXVGcmvkPG2XJqcXWKmWtaL1wiR95cJelMqellc7ieBeTr97mNJhNR
         FjXbJti1nDnnEY/f5Hc/ViRaLdh2pSiG0NBgTtxJEn4+cODcNSs4A7H21c+wTHmiWmAn
         JyQNA84F3ugSZuHr5kX6TH6g/7ZJWAWZFN53UAzz4KCc9cAgATX2JxDcOqMcb/GyR2Ya
         QQ3xmwg9HJbaPW2QAoznfElYs59sWQoqFkNB9Zhu45KTR8muuX/sRnVNal9whM/93AUn
         k1tQ==
X-Gm-Message-State: AOJu0YyMVoPjAzwOVcIwwFQot7B4DUqAEKa7qX/O8mt0kdbyzRETAQYH
	a9LVK+I+K76Yq9RWzIyWUrhI11k/hvwDPvGoGm4yI6uBlEpNqRzr2LFUP4iwXk8=
X-Google-Smtp-Source: AGHT+IFAMuF7mLI0WPTppWhWDGhs7PVOc1o5mD0yGudDiYvd5sU+MvdDZDtJvStjJrEPMDrqGzVFVg==
X-Received: by 2002:a6b:6302:0:b0:7f9:3fd9:cbb with SMTP id ca18e2360f4ac-8171022db8fmr206937239f.1.1721251676002;
        Wed, 17 Jul 2024 14:27:56 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c210fa1727sm971411173.142.2024.07.17.14.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 14:27:55 -0700 (PDT)
Message-ID: <d9876fee-ade3-4568-8104-93e4175e66ad@linuxfoundation.org>
Date: Wed, 17 Jul 2024 15:27:55 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: Add USB_SPEED_SUPER_PLUS as valid arg
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240715131131.3876380-1-ukaszb@chromium.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240715131131.3876380-1-ukaszb@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/15/24 07:11, Łukasz Bartosik wrote:
> Add USB_SPEED_SUPER_PLUS as valid argument to allow
> to attach USB SuperSpeed+ devices. Update speed of
> virtual HC to SuperSpeed+ as well.
> 
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
> Changes v2->v1:
> - Updated virtual HC speed to SS+,
> - Updated commit message.
> ---

Thank you.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

