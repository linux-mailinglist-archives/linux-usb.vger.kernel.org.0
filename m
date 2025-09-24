Return-Path: <linux-usb+bounces-28612-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D896B9C2B6
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 22:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB5DB3BACF7
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 20:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87EC32896F;
	Wed, 24 Sep 2025 20:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gQetrCAj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510DD322DBB
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 20:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758746361; cv=none; b=JlhuDgnvkR/n27z/vx/d2g1FxLDwVsSYJWYPOMWk6cNmX+nxPWCB0q1kJlZfKUawuAH8LmZQ9ZF653pFK3Ecw79r8xzp1HWdCPA32R2V8W6Q71D9lhILYXzSak4yuIkQHkclSSOlKxZEYcXeDpVZD3jhqDsACTjdGfgyGamcEKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758746361; c=relaxed/simple;
	bh=3OB+OiR7aipUBr93oxJCcURJQ4mS1LlHNjNNKL2BlyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=saxTrg+2YVrB9/UJ2YawlZ8vLHUykySgF2Xs5bq9FSXXr9AqaoHYV4N9EIqZl0Sn5c7yTgzeVe5F+0VpWrzDejIu00cKoXf3fnUlm+S0qWLzJPtzYXe8CzC60dlhcYIhEZ2nCP+VNNPr/jJzMfyFdV3Gi4YdeUznzvRbpchj3ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gQetrCAj; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-887764c2868so25065939f.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 13:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758746358; x=1759351158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JdD3K8oOTr2CNnAO9Xm+r51N/6GP07cpXL8zgDmSPuI=;
        b=gQetrCAjIsKkM4Ksh1qe+BNhZq9ZLOhUlZSab873YDXxp1tardzmP/jCmI8wrjDm8c
         EQj9/AhTKDqiWfm5n6Y1cXxacU/nrFXd0Qv33HG9m/hs3GbKnHB8RAmpu5mJ1f9tlbTQ
         qtXaDhiJhbyVjY5xdBUjU24LMiZXP7BNncKRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758746358; x=1759351158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JdD3K8oOTr2CNnAO9Xm+r51N/6GP07cpXL8zgDmSPuI=;
        b=kuKzWyVQ/2C5i5jj+x4x5mR/3ZtbQVS0sqxr8yi9kc2myERc6NYeBl45GPrXcqkxeY
         9Gkr+HcxNoIXTY/lQ4D6uw9LgSaRwWgpZGPQ0C50qgB6obQ/S6zk4cUM+X42w4bLw1LE
         6kMP6jgqtzwSTzo0pzXO+e0DSwUOVhHE+F5KSlr1psYac4luOTM7lnhxUgb0/oMHkKrW
         ZJafbCL7L90Ez0IgyEjwvzVquIth+xNKO2UiJsvmAEUTib2i/S32MtzgTCUzyD1q2fdE
         aZYyL5pheZ9GcIqIIuB0go5CedrmNB4+X4JCW9uSQSGTHyZK6VDGgahs4NN09RutzxnX
         t7og==
X-Forwarded-Encrypted: i=1; AJvYcCV/Kz51Wei44rHvHpIj9Nfgey5Rz8MNmPSURctmsDjCmDElVc/3rI/wxXj3Ta7Sv+LqPbTH7ThWmJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwLpk/rRwW89mjCtvImTkGByZnoqfXJ5bWWmyRb+kqiH2bTAp8
	zB7FwQA5AaL1es3n4SkvV0g1RXytc+aj0KKhs9XDfZVfuqA0YY3blw9MwFelpFO2490=
X-Gm-Gg: ASbGncslnpOjFExw/d67a8Z9o0V/URkTMDXG8ksDojXLFWu0qgJXbXfap4US51JwWND
	L6EE9VmaCa9yNeuKMmUq3qBZ9G7BQM3CSyK4YQR9AfquE4NN1z9Sy19jt6T+M37b0sX9EUbGLTJ
	uZFWRdk2SnBevojtJSd0PfIqGPGqOSNxrpzzxJJdiiw3HFO6KF8tJXdN9kWvQ6IJWLAbtQZnTf5
	fyY3jBvatGUsN6hKdYUByfYo4JsYuyGZcx8zp03I4YZa+sPPPi48/pT2T9P8TJaUEY+Pd2l6cyw
	Qy9bYmfEGoBpi4WrJXr0RXyHtRBVHKqrgfZaQ738EuSyZZ/0+MMeBUGpHtPL+8Uu60GIsHnJ4wY
	gGzzu3GOanf596uTaaPtYhybiOx9OMWnKvMs=
X-Google-Smtp-Source: AGHT+IGbX7l8mmrEe1aN8ADpnz0w/9Ym/EoRBWc7+zWYE9DckTQZwComktGLTR80vh7d/pMDEfz9PQ==
X-Received: by 2002:a05:6602:1510:b0:887:5335:1a59 with SMTP id ca18e2360f4ac-90168488dfamr134796039f.13.1758746358103;
        Wed, 24 Sep 2025 13:39:18 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-903f718019dsm1545739f.5.2025.09.24.13.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 13:39:17 -0700 (PDT)
Message-ID: <21e8256b-5409-4420-9958-e89b716ddfe8@linuxfoundation.org>
Date: Wed, 24 Sep 2025 14:39:16 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: vhci-hcd: Prevent suspending virtually attached
 devices
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Brian G. Merrell" <bgmerrell@novell.com>
Cc: kernel@collabora.com, Greg Kroah-Hartman <gregkh@suse.de>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250902-vhci-hcd-suspend-fix-v3-1-864e4e833559@collabora.com>
 <71b47ce7-a799-42f1-acc7-e59e6ce13884@collabora.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <71b47ce7-a799-42f1-acc7-e59e6ce13884@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/25 11:01, Cristian Ciocaltea wrote:
> Hi,
> 
> On 9/2/25 3:15 PM, Cristian Ciocaltea wrote:
>> The VHCI platform driver aims to forbid entering system suspend when at
>> least one of the virtual USB ports are bound to an active USB/IP
>> connection.
>>
>> However, in some cases, the detection logic doesn't work reliably, i.e.
>> when all devices attached to the virtual root hub have been already
>> suspended, leading to a broken suspend state, with unrecoverable resume.
>>
>> Ensure the virtually attached devices do not enter suspend by setting
>> the syscore PM flag.  Note this is currently limited to the client side
>> only, since the server side doesn't implement system suspend prevention.
>>
>> Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> The USB/IP Virtual Host Controller (VHCI) platform driver is expected to
>> prevent entering system suspend when at least one remote device is
>> attached to the virtual USB root hub.
>>
>> However, in some cases, the detection logic for active USB/IP
>> connections doesn't seem to work reliably, e.g. when all devices
>> attached to the virtual hub have been already suspended.  This will
>> normally lead to a broken suspend state, with unrecoverable resume.
>>
>> The first patch of the series provides a workaround to ensure the
>> virtually attached devices do not enter suspend.  Note this is currently
>> limited to the client side (vhci_hcd) only, since the server side
>> (usbip_host) doesn't implement system suspend prevention.
>>
>> IMPORTANT:
>>
>> Please note commit aa7a9275ab81 ("PM: sleep: Suspend async parents after
>> suspending children") from v6.16-rc1 introduced a regression which
>> breaks the suspend cancellation and hangs the system.
>>
>> A fix [1] has been already provided, which also landed soon after in
>> v6.16-rc7 under commit ebd6884167ea ("PM: sleep: Update power.completion
>> for all devices on errors").
>>
>> [1] https://lore.kernel.org/all/6191258.lOV4Wx5bFT@rjwysocki.net/
>> ---
>> Changes in v3:
>> - Moved all driver cleanup patches to a separate series:
>>    https://lore.kernel.org/all/20250902-vhci-hcd-cleanup-v1-0-1d46247cb234@collabora.com/
>> - Replaced FIXME with NOTE in the new comment block, as it refers to a
>>    potential cleanup of redundant code rather than addressing a
>>    functional issue
>> - Rebased remaining patch onto next-20250902
>> - Link to v2: https://lore.kernel.org/r/20250726-vhci-hcd-suspend-fix-v2-0-189266dfdfaa@collabora.com
> 
> Just a kind reminder in case there's still a chance to get this and/or the
> cleanup patches queued for v6.18.
> 

Sorry for the delay - it has been crazy few weeks for me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


