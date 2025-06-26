Return-Path: <linux-usb+bounces-25116-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D97CAAE99CF
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 11:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A9A21C24370
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 09:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C1629A331;
	Thu, 26 Jun 2025 09:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RfqBaS3V"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E2D25C70D
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 09:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750929708; cv=none; b=i28DOm/PeX/F/MshRYmvc3jM0Tfy+Ix2hreNy5fubs5yQXo1NeEWswFNBol+276pvRiuggKXWmYIq78ijcdsjboAbS7zJQkRqiNLJCRqXIvehDvwtN7T9oZgQstPg4WAwt2YDfQlP2G8qUiq01TUszkLINofWPqioxdTrW0nTHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750929708; c=relaxed/simple;
	bh=TDgaHxV73A15VcYZvTJnOtCN8fl/sdcXVVdEId4/O5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=We1XV1YLXmcD9v2hqlcCVXqWhfYpEwpGJveqKqNlHaV6wJt00MeuEjtDUw0tWQhR6+/MxFP1bQyq/0UOPBwgW75ZmKdC242qyY/T3u58opTQ6AE1cghA2Ro/x2sb1Mf69VhZeSj2+YyjKEip0pemWHvzNIb8l2oZb1CMnM0iBuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RfqBaS3V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750929705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1RpWIxhpIhaG+dP+Aru0m/IoAlqoaj7YUbbsozIeE8=;
	b=RfqBaS3Vz0PmBObxqef6nt0bdUOo3VWN488U3OprkQUHPHFBxxRP/Baq8G5aJjXQ/zAedm
	+Qk4GacT95FXB/J7G+gN8nTDIUrejT9d87oEEaUGoOilKTmh20bklp4WjTrjjFDmqC5OMD
	Uk+8kEHkDP8hXeot58fi/rsBtASMez0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-sAzodZAeM1ySXI5-rON5gw-1; Thu, 26 Jun 2025 05:21:43 -0400
X-MC-Unique: sAzodZAeM1ySXI5-rON5gw-1
X-Mimecast-MFC-AGG-ID: sAzodZAeM1ySXI5-rON5gw_1750929702
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so293092f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 02:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750929702; x=1751534502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1RpWIxhpIhaG+dP+Aru0m/IoAlqoaj7YUbbsozIeE8=;
        b=m4hbF4umXciQx5ogWB3pOSJh0e/cDXBYg+rMwoEucSO7o48wlJjF22Enr24Lg7aKhD
         JlqvWjDa3aPXqwKb4x4HXUBWxnsuYV1aurtLcfF9u4PeqIulLC2Ua0OkuGiTM9AzAPb/
         p75E87khLugk2O/fxwCrJXZZ3XrWCDyKN/oCJLCGn5YOpoUE2Yh1oLGwaB4z76KGtA8d
         0fbHESp7rbSyglcL9bT5pt9AGRHSdpPJmSPB2rXEk+YfcHIY7wT0MtKroBFlygDVgG7B
         uIxBJEW5Nm85Y/LNP3kEH3GR2h+rv8xnRbbgxR0YiwbH5Z9t3Anp2dfzNttvF6sii+iY
         76sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhlrrbiEPnq6N0U7duS145bBenCBpAwTL+/Puf+Ip2ge/h87PMJobzvEmcSukPl31/oZXwPWg02J0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkbUY9jRGUzjOKeNrh3bjgYgahew07+8/mOixZzApL2UFPoOpF
	NQ9fhwNbWhbkX3o1IA0ulXoDiNb7JFGBS7+2QMZOSwVykOx6g78FMJa+jgqf6DczRZWIA1/0TN3
	QQwblEHe1ESKDUoAfQsT87dLDv5An7TA6RE+X2t85AxXF27MnxdUIuQ0mTcfZJA==
X-Gm-Gg: ASbGncvXFM9NZfzSZAM2078FvpSncz+X6D8uj4tj8nrl0EhCNeFWrQW+0LpS9afI40d
	1V/N9/wVAXwqQMlg7Rry3P2UCUNjEll2UlIFCusKnyOisTv7Q5uHjNnfwemPSELnCNtvN9Hl78G
	cEKMsce0ZRMOZl3KsVYtskR0vodKPzWRfwh++X7JHPe/EjjkIEwbWYPHRuz5DGBfijNRdLzpwDW
	JeZPzghL5aKwyZNBjOskF7kj8cJcTQnABBb8gx3gcCEToKWkiO2ooIZ0DCpWkIDOCAPR2m+uxIB
	A9QVNYqO4ve9x6X1AgKEHWW6/XiQAudVMJEyA4aSslqarwD5UDlqRuvJof2BwgBX3Sb65Q==
X-Received: by 2002:a05:6000:2c0f:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a6ed6746a1mr5495719f8f.52.1750929702310;
        Thu, 26 Jun 2025 02:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQH908ptIl4XWG9VAtNNzn4GS6AhbkLtgnZXZlatl+hDbFHITtgt5W1+goG/gGONisVH6vpA==
X-Received: by 2002:a05:6000:2c0f:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a6ed6746a1mr5495688f8f.52.1750929701873;
        Thu, 26 Jun 2025 02:21:41 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:bd10:2bd0:124a:622c:badb? ([2a0d:3344:244f:bd10:2bd0:124a:622c:badb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805ed03sm7021421f8f.33.2025.06.26.02.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 02:21:41 -0700 (PDT)
Message-ID: <87a7f8a6-71b1-4b90-abc7-0a680f2a99cf@redhat.com>
Date: Thu, 26 Jun 2025 11:21:39 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: usbnet: fix use-after-free in race on workqueue
To: "Peter GJ. Park" <gyujoon.park@samsung.com>,
 Oliver Neukum <oneukum@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CGME20250625093354epcas1p1c9817df6e1d1599e8b4eb16c5715a6fd@epcas1p1.samsung.com>
 <20250625-usbnet-uaf-fix-v1-1-421eb05ae6ea@samsung.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250625-usbnet-uaf-fix-v1-1-421eb05ae6ea@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/25 11:33 AM, Peter GJ. Park wrote:
> When usbnet_disconnect() queued while usbnet_probe() processing,
> it results to free_netdev before kevent gets to run on workqueue,
> thus workqueue does assign_work() with referencing freeed memory address.
> 
> For graceful disconnect and to prevent use-after-free of netdev pointer,
> the fix adds canceling work and timer those are placed by usbnet_probe()
> 
> Signed-off-by: Peter GJ. Park <gyujoon.park@samsung.com>

You should include a suitable fixes tag, and you should have specified
the target tree ('net' in this case) in the prefix subjext

> ---
>  drivers/net/usb/usbnet.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
> index c04e715a4c2ade3bc5587b0df71643a25cf88c55..3c5d9ba7fa6660273137c80106746103f84f5a37 100644
> --- a/drivers/net/usb/usbnet.c
> +++ b/drivers/net/usb/usbnet.c
> @@ -1660,6 +1660,9 @@ void usbnet_disconnect (struct usb_interface *intf)
>  	usb_free_urb(dev->interrupt);
>  	kfree(dev->padding_pkt);
>  
> +	timer_delete_sync(&dev->delay);
> +	tasklet_kill(&dev->bh);
> +	cancel_work_sync(&dev->kevent);
>  	free_netdev(net);

This happens after unregister_netdev(), which calls usbnet_stop() that
already performs the above cleanup. How the race is supposed to take place?

/P


