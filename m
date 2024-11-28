Return-Path: <linux-usb+bounces-17930-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4AA9DB4A8
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 10:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD8F8282084
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 09:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D22156222;
	Thu, 28 Nov 2024 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O7v/rPWC"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6678153565
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 09:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732785372; cv=none; b=JjID0ZA4wHI5nFcyFhvPewOvy4uNZvTxgPPWlT6t4J6MW9S3PxuPPa5Ecr2HzGDkNmpZRwT3MeHe3AXRJioxd4+H6I+a8DgmJA3EaIlNRd7rHoBe3IcypUZGsLAamLwjOVGncFgXUDeTirsVkW8w3xoFq7Qc7qZeAsexjNsHMgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732785372; c=relaxed/simple;
	bh=FyV9k9BiWIiG1fLXMC/clklAqIvfhz7ndK0Tus2EcXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxoacLWAdFEAHR9G0n3T8B5DIqDC7jJ1WT9AzTsGHS+qIFOB3Q1lOcuM8sjTXxUUbo5mPNptHbtgzcq0xhS0FndzkHPj6BFUHcwmvAasgx3DLee+enGFjlmt35Q5U7qhowjaXq2kxPufVjacIYJfcAaS/rDPvV0SesdWD1Vjg40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O7v/rPWC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732785369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ha5L68y3ev/uSENMtjj0g79NbkHzUtOgDv6uIZ/ru/4=;
	b=O7v/rPWCZkGIWxh0pteMbzrjMXlkyWJ1tPVCs+I6ffMvwAyAvF5QkQvfgfmx8DjF6V243Q
	kF5O3OKiqD5+yMQWf6Iv1lK+ANl0bj5gb3FwCYw3z8ppf58GhJNzzZp2QsH4T+3Rdx9ocM
	P3S56P5o5SUAQ79tlRNMhsTIFB0PLRQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-w70WOq-8OiGS8vHMp_XM0w-1; Thu, 28 Nov 2024 04:16:07 -0500
X-MC-Unique: w70WOq-8OiGS8vHMp_XM0w-1
X-Mimecast-MFC-AGG-ID: w70WOq-8OiGS8vHMp_XM0w
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-434ad71268dso3540765e9.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 01:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732785366; x=1733390166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha5L68y3ev/uSENMtjj0g79NbkHzUtOgDv6uIZ/ru/4=;
        b=RoTQlyRmA7Ozt6PV5hQv8nVKVO0/UG2500BBILMdHir7Amds4gUpASaH3l8JQ9Dqhf
         Qo1ZO/Pcayq42hAHvqjQ6sVR6ckvwgXR8uJGPIFCdoDkZJRsGO/zs1UcyI6sJbDzo0kv
         cB+aTbLm/1RUEC83Gpozm11JaBnn3ZX6cpUQ64cKGePhM3iY/rLpFa0u/DX6teawevP7
         aGUBKTdSjMYIqXYebaLQGiLEnvCMYlaR89BLdJcjyKl0jHZkmmM5nkjoPhO1JHiDB7au
         1bio/1QdDJFB6Oe0zObJVgkYQDS6BbyJlfwwSG/XrWI4Ie0GQjpD4UD8Fz3J8HTwnOqx
         CF8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgyZbxfsgLpLmTdfr78VlqKAMv/bghYbAe2EuSJ7vDXm8xnahIffCHUtsiqZ7NXujlzuAiBTN6RXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmMZhx+RM6OiZiQ+kGqw8aSmUVv0/ZH5sbYHtCHhGGMzpJrPIj
	z09UKEkmGPBdc2TgAwJeCtFCwTtQxKn7T1aAvZ5fLsvDyNhjVkTI+UR5Ae/+JGSWpTCsQL+jJ9q
	Riqvj4A4lgmwxvm+G/BBhZLuHrfI3WNM9XWzOixY0tipDCQ6biCLAn2Xp+Q==
X-Gm-Gg: ASbGncsonl/zE03XQ+ke/2Saagxnx7dRmRX1f70cHMCjIp01YIL4zbUg3TsxT6Puk5k
	p6H32/CIWku+LDGzOLmxA1EYnS1iRBiARWHp7WKI1NnvBtjWLj6gF9V57sTB1BQWxlKzXVI3zsw
	5pBarY3aMDwXaQJ0Mc6DW4cjRIFiVPBhOf/oowLrQN80bBHXzSHsymlsuHTEm3xqo1KVIuBVmNN
	oE95UCm1vx7GjFEF8PtE4Detrov4NRjVvoxQw5aUKygM/OYK9TUqBHtzS1bgFXm+EcpYFaBnrQ1
X-Received: by 2002:a05:600c:2d4b:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-434afb94427mr17485325e9.4.1732785366573;
        Thu, 28 Nov 2024 01:16:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmEDvmrJ8pRI64i/AmdhJmU2UDmqW0+eegVh9JzZIG7I6SenmIEe3Gvcu2M3TCNPYSuisvzQ==
X-Received: by 2002:a05:600c:2d4b:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-434afb94427mr17485175e9.4.1732785366270;
        Thu, 28 Nov 2024 01:16:06 -0800 (PST)
Received: from [192.168.88.24] (146-241-60-32.dyn.eolo.it. [146.241.60.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7d25c5sm46864315e9.28.2024.11.28.01.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 01:16:05 -0800 (PST)
Message-ID: <551a761c-ebc3-423c-ac8d-865b429cf8b8@redhat.com>
Date: Thu, 28 Nov 2024 10:16:04 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 1/6] usbnet: ipheth: break up NCM header size
 computation
To: Foster Snowhill <forst@pen.gy>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Georgi Valkov <gvalkov@gmail.com>, Simon Horman <horms@kernel.org>,
 Oliver Neukum <oneukum@suse.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20241123235432.821220-1-forst@pen.gy>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241123235432.821220-1-forst@pen.gy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/24 00:54, Foster Snowhill wrote:
> Originally, the total NCM header size was computed as the sum of two
> vaguely labelled constants. While accurate, it's not particularly clear
> where they're coming from.
> 
> Use sizes of existing NCM structs where available. Define the total
> NDP16 size based on the maximum amount of DPEs that can fit into the
> iOS-specific fixed-size header.
> 
> Fixes: a2d274c62e44 ("usbnet: ipheth: add CDC NCM support")
> Signed-off-by: Foster Snowhill <forst@pen.gy>

This change is not addressing any real issue, it just makes the
following ones simpler, right?

If so, I think it's better to drop the fixes tag here and add the above
reasoning.

> ---
> Each individual patch in the v3 series tested with iPhone 15 Pro Max,
> iOS 18.1.1: compiled cleanly, ran iperf3 between phone and computer,
> observed no errors in either kernel log or interface statistics.

This should go in the cover letter (currently missing, please add it in
the next iteration).

Thanks,

Paolo


