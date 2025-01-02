Return-Path: <linux-usb+bounces-18950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 156C3A00114
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2025 23:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F41EA3A39E2
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2025 22:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510151B982E;
	Thu,  2 Jan 2025 22:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JCHLAivQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3368E1487E1
	for <linux-usb@vger.kernel.org>; Thu,  2 Jan 2025 22:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735855770; cv=none; b=OkxHeBiIpnDf3tMhPWKBfK22YXgQAFxcqtt3/BTPCROOTXnJFOqt6Hunht6elDEsu6RcuydTpV38sw/ookzjdMaX5IG0aJNEN1DwKrdCxuHl8rRNJgcVJXIdZeTPdFSJj2vTGnGN91KqSBYTnMlUkqUewKoqo799fS1717EiRdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735855770; c=relaxed/simple;
	bh=LjeVe7p+Aum9VOt2LVWt2THAoUqbgpaQMPKY9qP06hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rccQqVmVwIXsF9GCxDyOWjVmD+ix4JG95xoCV8Ktvv6WoO3ot4RwSO4t5TfKcr/cmWB3H7cepJ7nC59s1Z32FlaEuL1fvbgXNX4VKuPdNAPcAmyxHxGs0OtfcnmIAp1s/FHXL4rBH/GaXm+ooXj6sEMaL7WPqicqMvjLEPJ3oRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JCHLAivQ; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-844e9b7e50dso1086144939f.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Jan 2025 14:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735855768; x=1736460568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v8inhkGj25yUPyodyeM2Xw/fibo1Q0W+G8xd1drkkE8=;
        b=JCHLAivQEW+4DZNmrtmMD+4mFAynw0OuU91TVE4lvqR/sPh7WDpvNox8rcKF2H+NL9
         kxCklpQ9SvQ1+YoLEEKuC1ZH+rMpZQJonjRiDtePBlHWsW3VO22aHFUpPImF3RCXgplp
         vu3gAQ6+469WceqfTqNxZ/9Cjs7qQobhwtxLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735855768; x=1736460568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8inhkGj25yUPyodyeM2Xw/fibo1Q0W+G8xd1drkkE8=;
        b=qsLfERLaMblVUrKlQbx2vosLSofc2rRcveqG09zoIecHjHRgtrcWpetKRL7scD759s
         Eo4lOyR3FNM4r9+d80WzHth/hE8cLkH0r6WxFTkOmx3EDVFmtRH5NxK8AsU7gQtv/O1n
         9MIkECAHdVkVX+71chadTANmC86hxnXvEOUM9A4cJZwnbosaBtp2OZxsUP7oHNYOfCrE
         lhw0ha8F0ddlyYlj7ovF9CewpV06Ji8ps2/MJAWCaG1/gI5TWidNpcSosUoGBhTBYYjW
         Oj6ZqCdDBujycdkT+SMoPXfhwTnUrsXk5TQRtILPZA7YqCYsRL/fqMduGykBkr+oOUVm
         w9lg==
X-Gm-Message-State: AOJu0Yzodsn4XLQI/GLVNdqD5lxkfejV0m7DHXOjrAF/GTkWqccyWzx6
	ZREcAt3kEeEvF9aUqCrAith6rcHfGai88RikdtJRoenNwIdZxV28qtGZ6j/urn0=
X-Gm-Gg: ASbGncs3kb3JV8VX2245CcfEAJPLlrsLHH/tZrRBd7sxxIWRsMUn0X22ZZ3dXfhsqSn
	NKTuk2hG4js1iOb3qrpQ7IEHUMibOfPc5rGK4JfG6s673xgHf3goOlvidnlWGqhhhqQd+7U5yls
	FFhv2kbre7JCh2UaPnzp9saUCSHH5y6nCGrVYtpWJYHykyW+oP7NuJ7enOZh3uYelLK0lQIyu45
	Jpls6bD/CvZZS7JpMh1VJe0D9TDY37CZhQ/vPgxDbCSx3i4XxE70i9reqIhj4OcMr4V
X-Google-Smtp-Source: AGHT+IEpBPhutBtDX832fBzi0z0kuArKz06fve9d1rbkpO2l1JjgOG1TkdzWraNna74uUmIjZQaNXw==
X-Received: by 2002:a05:6602:6c10:b0:841:a9d3:3b39 with SMTP id ca18e2360f4ac-8499e60dc31mr4768249139f.5.1735855768312;
        Thu, 02 Jan 2025 14:09:28 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c22176fsm7055056173.153.2025.01.02.14.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 14:09:28 -0800 (PST)
Message-ID: <da4b2710-f36e-40ad-addb-6b114e60b187@linuxfoundation.org>
Date: Thu, 2 Jan 2025 15:09:27 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usbip: Correct format specifier for seqnum from %d to
 %u
To: Xiong Nandi <xndchn@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "open list:USB OVER IP DRIVER" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241231161539.20192-1-xndchn@gmail.com>
 <20241231161539.20192-3-xndchn@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241231161539.20192-3-xndchn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/31/24 09:15, Xiong Nandi wrote:
> The seqnum field in USBIP protocol is an unsigned value.
> So we fix the format specifier from %d to %u to correctly
> display the value.
> 

How did you find the problem? Include log from the tool
or compiler output.

> Signed-off-by: Xiong Nandi <xndchn@gmail.com>
> ---
>   drivers/usb/usbip/stub_rx.c | 2 +-
>   drivers/usb/usbip/stub_tx.c | 2 +-
>   drivers/usb/usbip/vhci_rx.c | 6 +++---
>   drivers/usb/usbip/vudc_tx.c | 2 +-
>   4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index 6338d818bc8b..9aa30ef76f3b 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -269,7 +269,7 @@ static int stub_recv_cmd_unlink(struct stub_device *sdev,
>   		return 0;
>   	}
>   
> -	usbip_dbg_stub_rx("seqnum %d is not pending\n",
> +	usbip_dbg_stub_rx("seqnum %u is not pending\n",
>   			  pdu->u.cmd_unlink.seqnum);

seqnum is unsigned long - don't you have to use %ul?
>   
>   	/*
> diff --git a/drivers/usb/usbip/stub_tx.c b/drivers/usb/usbip/stub_tx.c
> index b1c2f6781cb3..7eb2e074012a 100644
> --- a/drivers/usb/usbip/stub_tx.c
> +++ b/drivers/usb/usbip/stub_tx.c
> @@ -201,7 +201,7 @@ static int stub_send_ret_submit(struct stub_device *sdev)
>   
>   		/* 1. setup usbip_header */
>   		setup_ret_submit_pdu(&pdu_header, urb);
> -		usbip_dbg_stub_tx("setup txdata seqnum: %d\n",
> +		usbip_dbg_stub_tx("setup txdata seqnum: %u\n",
>   				  pdu_header.base.seqnum);
>   
>   		if (priv->sgl) {
> diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
> index 7f2d1c241559..a75f4a898a41 100644
> --- a/drivers/usb/usbip/vhci_rx.c
> +++ b/drivers/usb/usbip/vhci_rx.c
> @@ -66,7 +66,7 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
>   	spin_unlock_irqrestore(&vdev->priv_lock, flags);
>   
>   	if (!urb) {
> -		pr_err("cannot find a urb of seqnum %u max seqnum %d\n",
> +		pr_err("cannot find a urb of seqnum %u max seqnum %u\n",
>   			pdu->base.seqnum,
>   			atomic_read(&vhci_hcd->seqnum));
>   		usbip_event_add(ud, VDEV_EVENT_ERROR_TCP);
> @@ -162,10 +162,10 @@ static void vhci_recv_ret_unlink(struct vhci_device *vdev,
>   		 * already received the result of its submit result and gave
>   		 * back the URB.
>   		 */
> -		pr_info("the urb (seqnum %d) was already given back\n",
> +		pr_info("the urb (seqnum %u) was already given back\n",
>   			pdu->base.seqnum);
>   	} else {
> -		usbip_dbg_vhci_rx("now giveback urb %d\n", pdu->base.seqnum);
> +		usbip_dbg_vhci_rx("now giveback urb %u\n", pdu->base.seqnum);
>   
>   		/* If unlink is successful, status is -ECONNRESET */
>   		urb->status = pdu->u.ret_unlink.status;
> diff --git a/drivers/usb/usbip/vudc_tx.c b/drivers/usb/usbip/vudc_tx.c
> index 3ccb17c3e840..30c11bf9f4e7 100644
> --- a/drivers/usb/usbip/vudc_tx.c
> +++ b/drivers/usb/usbip/vudc_tx.c
> @@ -107,7 +107,7 @@ static int v_send_ret_submit(struct vudc *udc, struct urbp *urb_p)
>   
>   	/* 1. setup usbip_header */
>   	setup_ret_submit_pdu(&pdu_header, urb_p);
> -	usbip_dbg_stub_tx("setup txdata seqnum: %d\n",
> +	usbip_dbg_stub_tx("setup txdata seqnum: %u\n",
>   			  pdu_header.base.seqnum);
>   	usbip_header_correct_endian(&pdu_header, 1);
>   
thanks,
-- Shuah

