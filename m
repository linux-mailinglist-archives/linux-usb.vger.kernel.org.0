Return-Path: <linux-usb+bounces-19170-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53896A07CC2
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 17:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CA8F188C616
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 16:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D8021D5B3;
	Thu,  9 Jan 2025 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OQQhbGUw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DAC218EB8
	for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2025 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736438560; cv=none; b=mzJC9hLqiEcF1/ytzDUQNs9MagK+e1K2BX/u26mHDAjUHbgYytvQbVkTfhw61C30VVNCTCS6O6M9PskcChSFMD2AfMbi1GPu9jJ43Iw83mw2Bu9lHI/Bwnqz9QVSi6TLMtSuaJAbH5XMKLCyFe6m8iY4i12/zV8qPXgj8Bkhsio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736438560; c=relaxed/simple;
	bh=75H6/0ajZvCmTXVSmpfAEKGoLWsp9W/9/mBv1iVOGf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QARvdkzHHJSen20Pn12VUatpx6MRhqcTfy5lPPVRJmmeAKcJ2IFUr8NXYU+C0FScRgHSeAuAUNJPU6znp8lhLH0WCFww2lQd2QwDS84d9sCrlJNaUTJDe8Ufcqtvjui/qAucowdSq/z9XmheeZ5F7Gy07LT7x+CHuKv85dXx1fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OQQhbGUw; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-844ef6275c5so32616039f.0
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2025 08:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736438558; x=1737043358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDjh9QDKm25asxr19ZyL90eABxD3gHuiz1JVJyq7sVU=;
        b=OQQhbGUwEDBaV8PwUNrlkBvkptkco3fiL4MzJPZfEdnOpj3OvB+OPg/4hJ65z91aZF
         EmMOQt6GIN1DBv8eKDCUbZjxqdBP7uNeFQ4DB+m9pSYZklKaAel19HumjNJoKkDon4NN
         O60Ay9p56/bQslnPSKHdWHGSwsfv8b3yHyHkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736438558; x=1737043358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDjh9QDKm25asxr19ZyL90eABxD3gHuiz1JVJyq7sVU=;
        b=LX6B+Suqp6/FARocW8heIgNeZgfERYlhgjL14dk45CRFXHN1bMbCS4mNokOG1KqBiE
         9qcFMO84KFDr+wmLoIpLg9YgBPF6g9jDpzJJDVOxXwfpEPturTJzVXpSYEFt/lFSYpzQ
         PTSb/x5U94bdZsc7e6XzNLcG/wkr1aR0m1SwoSLgSS8yvevDrmKPKQH0kZVg8qT6SFG/
         ipxCFvp0muEvhwkGZect2cK4Wx1I97UAP04tPigvRGJrub/Oq3Cxbz/bS+nXS3XnJr0m
         pz66TTp/l0qQcGzp5ADFVVgat59ou7PisdKu1qsYQft5zGv95xF/61vQgnnvndV+jDk7
         K9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWvEFInS0ur3i5xCuiGPYQsCNAz1pxukD7Z6uY1sNA6Gi2iV2JaSVi7wdDBkU09SCh6+/9UYOAu9xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwntD8bsYBJkUML7GA65qmLKvVER/Qpa1EezUuZfnAQZenKXfDH
	tSat4w7reL9Ogj5GigN2Dc/AZn5fCZLJZYf48L29z4H7RKZqipj4Pbu/IG/oeMg=
X-Gm-Gg: ASbGncv+L7Oahcr69aJnrseS4rEu6KOrfMpA0Q3oUEAWBYsnbDC8ASkrpR4ONP17kCc
	PXin61JzYbdK9YoAdAMj7gdzMr1iy2Ppg5AcKPijzo+Mn0/EBmWtEhF4/8Kgxl4YWgSkog9YykB
	8xBwWzbLVG1FBVjRg9zbGW1MLiUIwbv4a56q8DtIhN9nds7Houniimvx8OVNzjbb4y9c5LSDFBd
	JJsM6lySC0UOYdYJs9zlfwAVz7kniGKA4L+xOHgIXqHM+nuDCCMOJvxW+APm1604uMn
X-Google-Smtp-Source: AGHT+IFJqIqZ9WchDZrl47kNdp0lcVFTFz3959SNA5TmVUyH/Y+O6Qgy5Sn7l/Fp9bRSzYscS50J0g==
X-Received: by 2002:a05:6602:4a05:b0:844:e06e:53c6 with SMTP id ca18e2360f4ac-84ce0166661mr554190839f.11.1736438558084;
        Thu, 09 Jan 2025 08:02:38 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fa3d8asm38255439f.31.2025.01.09.08.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 08:02:37 -0800 (PST)
Message-ID: <2ff39cff-af3c-4020-81b3-4238efe6c2e3@linuxfoundation.org>
Date: Thu, 9 Jan 2025 09:02:36 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usbip: Fix seqnum sign extension issue in vhci_tx_urb
To: xndcn <xndchn@gmail.com>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB OVER IP DRIVER" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241231161539.20192-1-xndchn@gmail.com>
 <20241231161539.20192-2-xndchn@gmail.com>
 <5ad65964-dcf7-47d2-8e5f-bf82066e55f4@linuxfoundation.org>
 <CAJ=gGT3pAnKUCve1OV5SXVArz6HUdizu9wjM5tPJ_CrQ=sF=nw@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAJ=gGT3pAnKUCve1OV5SXVArz6HUdizu9wjM5tPJ_CrQ=sF=nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/25 08:18, xndcn wrote:
> Thanks.
> 
>> How did you find the problem?
>> Why does it make sense to cast it to u32?
> 
> After running with usbip enough time, I happened to see logs like this:
>> [ 293.863125] vhci_hcd vhci_hcd.0: Device attached
>> [ 294.081110] usb 1-1: new high-speed USB device number 2 using vhci_hcd
>> [ 294.193163] usb 1-1: SetAddress Request (2) to port 0
>> [ 294.204334] vhci_hcd: cannot find a urb of seqnum 2147483648 max seqnum -2147483648
>> [ 294.204850] vhci_hcd: stop threads
>> [ 294.204851] vhci_hcd: release socket
>> [ 294.204853] vhci_hcd: disconnect device
> 
> Then I notice that on 64bit platform, when
> atomic_inc_return(&vhci_hcd->seqnum) returns (2147483647 + 1, or
> 0x80000000),
> priv->seqnum (which is unsigned long, i.e. u64 on 64bit) will be
> extends to 0xffffffff80000000
> So we can fix the issue by cast it to u32.
> 

Can you send me the dmesg without and with your patch?

thanks,
-- Shuah


