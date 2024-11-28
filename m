Return-Path: <linux-usb+bounces-17928-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D249D9DB492
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 10:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83DFA1664F2
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 09:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3A5154BF0;
	Thu, 28 Nov 2024 09:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aHB/6xj0"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00F11547E4
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732784905; cv=none; b=M4YwiVvaPGXUa0jOe1h9UtKi2xtBbmR1yEEQnRqyam3FwrWuxWLw75O2LMPF6r38noawt8uGreKdQOG9+giPSA9IuwwnKOst/2hiCBCPqGErsFWflGk53gChkmUXGzS2qGoGXN58tIez/WfTqH2Cd3O7ZIB+KOaK4EgZ1FIuta0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732784905; c=relaxed/simple;
	bh=dIngRyaba5lCy21XF8uirQt9gFufuGOE2O8GjXsDNy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0X/mkgJkhkYm8izu6Biowa/k/iZnUjgVx4dAhJtlVBAXNcxaK5774mHC+DBx0lQTypar8PwzikRgO4T8aYkqs159ThldeDlwh7MqDbXfHhxQyQyEP4eD3V2/Gx7XJDPlAtjBRG4XmPlKCrjWY8lM31h0liIED/rYuY2cVEoI9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aHB/6xj0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732784902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nd6Oy9o8pF7hYxCWd8kfvQGssh+yBV9f9FGrH23Nd4Q=;
	b=aHB/6xj0PR3jOvdENLvbJ7+KdyJDrC069SeSCYrnhpt7AWSq4jIsKPNEH2fgOkmHaTdH6c
	AavXBaUWd81xSaUhwKOnhoXi6tayIU5gI7haT/jiG46vx0jbj/JEYbgajkHIQQo3Zhv6Fx
	oYnxplXCu6yz+KdJhZ9EmzqLgr6j3rE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-536S0jDHMmyc1rTOv_VeZw-1; Thu, 28 Nov 2024 04:08:20 -0500
X-MC-Unique: 536S0jDHMmyc1rTOv_VeZw-1
X-Mimecast-MFC-AGG-ID: 536S0jDHMmyc1rTOv_VeZw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3822ec50b64so236804f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 01:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732784899; x=1733389699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nd6Oy9o8pF7hYxCWd8kfvQGssh+yBV9f9FGrH23Nd4Q=;
        b=GwCdAmDUoqWSxXw4PlKifY24mejzy6vSwbQ4/Of2QqBDhgpFJxOKcABb1LkKcL/54f
         rwhx1VL11+pUM1l8QVMsx29Oyh08mbpZkyNbXMEOxSoJkL/sjtw6rkM57etnExOGTTVp
         85xXUWuKdJ6r8fRSr3Gg5CadquI4cY86hxdiXDxe5+JK0pYpqGZ5C9/Pl9tPRPbJZi0o
         uCnRBmWDBtBppXXVQMSwKHE+blRBL/mKdgL/55n9GnNLfUszP+HuxubPd0Lmm+7u4VLI
         FZz93YmteJTe1N0gPPyHFk/nPX7xU7SJiE1KDXjBIGNcXjIwcqYys48ePV0phpVvySxq
         j4wA==
X-Forwarded-Encrypted: i=1; AJvYcCVr2pUYfTLNX72y5mTG0+zYsbkFweZ0OCU5npzm8dUil94acKqlhSQUn4bzhgl4iwQ286DKYgfAglM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIIXajFDzPcyy4XOdXSpUQsAHlHh52RvjFt1pVrenCMdOXSKad
	BcZkM0ojaRZeqxLwRQRbulPQeZaqMHoxCCItLMPXvWRU9CE/Q1KVbOPpX3HC9eNIRCeoLmRz1fa
	TIwUatFsek0l3pPr1Z6eVKSZoAcKIx6SCiZYvG95W6Zl6ddv/LkNEkylo/A==
X-Gm-Gg: ASbGnctemMHBhNWS154xIwppvcmzAiCgM5zt/rAocNiRofpa7PsMf/fyIPkPXU7mGxg
	VjADH7lG2mICvXkZBxB6q2WpAc3+XxkvjPN1hnLjCw0IhdCkoZqHJJxu/YVtLOV5w/1tvUmhleJ
	P29NJJ1hgiZpp+BJVbiN5KIyz0uMJ92lDCIyOe0LjjkLgT7pBbty6pVmUUimdvS8Vtl7cQkt678
	sCf/WxD3Oqgvi+H6/AnbtD/YyQhi36EdvNb5jDWcrE76kZUaecvcEUSpxbTbXDDOEbpjUHZKdmG
X-Received: by 2002:a5d:59a3:0:b0:385:cf9d:271d with SMTP id ffacd0b85a97d-385cf9d2858mr505970f8f.21.1732784899638;
        Thu, 28 Nov 2024 01:08:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPn1cFdjKX1VUpor0v8jaaA2iG7IitUJUGUTATanMx7SpW9wnMMd6OwcckvdMm3LpZDpXupA==
X-Received: by 2002:a5d:59a3:0:b0:385:cf9d:271d with SMTP id ffacd0b85a97d-385cf9d2858mr505946f8f.21.1732784899240;
        Thu, 28 Nov 2024 01:08:19 -0800 (PST)
Received: from [192.168.88.24] (146-241-60-32.dyn.eolo.it. [146.241.60.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd36d85sm1089329f8f.28.2024.11.28.01.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 01:08:18 -0800 (PST)
Message-ID: <f3657bf6-7980-4c5f-8c82-66c68beb96e4@redhat.com>
Date: Thu, 28 Nov 2024 10:08:17 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 4/6] usbnet: ipheth: use static NDP16 location in
 URB
To: Foster Snowhill <forst@pen.gy>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Georgi Valkov <gvalkov@gmail.com>, Simon Horman <horms@kernel.org>,
 Oliver Neukum <oneukum@suse.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20241123235432.821220-1-forst@pen.gy>
 <20241123235432.821220-4-forst@pen.gy>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241123235432.821220-4-forst@pen.gy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/24/24 00:54, Foster Snowhill wrote:
> Original code allowed for the start of NDP16 to be anywhere within the
> URB based on the `wNdpIndex` value in NTH16. Only the start position of
> NDP16 was checked, so it was possible for even the fixed-length part
> of NDP16 to extend past the end of URB, leading to an out-of-bounds
> read.
> 
> On iOS devices, the NDP16 header always directly follows NTH16. Rely on
> and check for this specific format.
> 
> This, along with NCM-specific minimal URB length check that already
> exists, will ensure that the fixed-length part of NDP16 plus a set
> amount of DPEs fit within the URB.

This choice looks fragile. What if the next iOS version moves around
such header?

I think you should add least validate the assumption in the actual URB
payload.

> Note that this commit alone does not fully address the OoB read.
> The limit on the amount of DPEs needs to be enforced separately.
> 
> Fixes: a2d274c62e44 ("usbnet: ipheth: add CDC NCM support")
> Signed-off-by: Foster Snowhill <forst@pen.gy>
> ---
> v3:
>     Split out from a monolithic patch in v2 as an atomic change.
> v2: https://lore.kernel.org/netdev/20240912211817.1707844-1-forst@pen.gy/
>     No code changes. Update commit message to further clarify that
>     `ipheth` is not and does not aim to be a complete or spec-compliant
>     CDC NCM implementation.
> v1: https://lore.kernel.org/netdev/20240907230108.978355-1-forst@pen.gy/
> ---
>  drivers/net/usb/ipheth.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
> index 48c79e69bb7b..3f9ea6546720 100644
> --- a/drivers/net/usb/ipheth.c
> +++ b/drivers/net/usb/ipheth.c
> @@ -236,16 +236,14 @@ static int ipheth_rcvbulk_callback_ncm(struct urb *urb)
>  	}
>  
>  	ncmh = urb->transfer_buffer;
> -	if (ncmh->dwSignature != cpu_to_le32(USB_CDC_NCM_NTH16_SIGN) ||
> -	    le16_to_cpu(ncmh->wNdpIndex) >= urb->actual_length) {
> +	if (ncmh->dwSignature != cpu_to_le32(USB_CDC_NCM_NTH16_SIGN)) {
>  		dev->net->stats.rx_errors++;
>  		return retval;
>  	}

The URB length is never checked, why it's safe to access (a lot of)
bytes inside the URB without any check?

Thanks,

Paolo


