Return-Path: <linux-usb+bounces-21607-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973F9A5A1A2
	for <lists+linux-usb@lfdr.de>; Mon, 10 Mar 2025 19:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B165170581
	for <lists+linux-usb@lfdr.de>; Mon, 10 Mar 2025 18:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAED0233D7C;
	Mon, 10 Mar 2025 18:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="seh49vo2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AA42206BD
	for <linux-usb@vger.kernel.org>; Mon, 10 Mar 2025 18:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741629996; cv=none; b=AplzUHLGlKjBTaJXhaaOXw2+BPdBkMRNRgsj0kKitUh78BTYEEj4r5Q3Lpr9QHrFiD5+ThjMKOCXzwE8rqQ/9Pt5wyyZn2XO3lT98fhZPTsGW+vwe9joB9D3aCeZd+uW9oh9jmNVDuYwJK+2svzlLHRzKW6AfAzLQUgyRzqdJ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741629996; c=relaxed/simple;
	bh=79NoslWFokmPF3M7/bKxqWenIFPB3+bRkcmISSkX+ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBislVlo1WmyKom9uZBXeAMoB9HblSTrwoS6j8rplDOWDoLBeFVcDklmnMd5DapP/SI9FWk25Qh0sTFK3IbJyP/Jyektj7JN3ap5XpPWbGwF9TkcKPomA9E7VzUr6Aeoa1SE2yH6eUFySxE5kb7Ypr5dEKGFODw0d7DR6clR/QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=seh49vo2; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c3c91060d0so529670685a.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Mar 2025 11:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1741629993; x=1742234793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XCbplbGo+wXAErff6OKF5gDHtfLPjvXhdrCE0hTtOQY=;
        b=seh49vo2icOw7VzqrPiotl5ZTi9vDAfyUOdsDz/mdeHfmvCxLlGiWj4gj+qVFGxjYZ
         fe+jvgC+u9Bd4vvsTejtyEyrIwlFji5dP8StviOmbjR2PB7mmNqF0PNqIL4B87AUb6JS
         I0o0EgOYV8o8gQiLWjjaNwVas+KuWtMeSbeyJAnSZLsxNVZSajwp0DtE0EeyFyPOXA6H
         EdhuQTZcG6AaeauaLvtVoE2gH4ZolAlJfsB0KEyDYtK8gf69VWkU6vkiL9zje/EOsxRd
         ZXKcl194pWd9Jg3YxXklQYTWOxcSVoBgH6DH4FvzWaMgxYmP8/vdBXGpgSrnlLRwPyz8
         RB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741629993; x=1742234793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCbplbGo+wXAErff6OKF5gDHtfLPjvXhdrCE0hTtOQY=;
        b=s9BRufBcZXO3pFhUMvIWIHLtbfCqgZKstEvzxDuxxjVBqsmsse43i4ewvEvVU0EZDZ
         HF+C0LMjvEcc/XZSdyga1nVL4bNMDXauz57jm6viLGBnabCqubya1k7weQpcJCl1Hrzn
         kxiAOsHZqaggWSFObZxuapI1RHLoCSTyjXRFwdgqiy2Nl3UXggR8hUtl+FqLzABBU7In
         xay5L0aruYmhutv5x5g5LuUxQ+iVynfV9uZIzTrWjSGi6/UicHlQrnsDH+2zHlG2iSrT
         Abl1kdd0bBRySG8PGyT/yObx+H5LyhaMztTLEDG2FXQKzoL9shTGSVp1sehmgZSjhUPm
         TAQA==
X-Forwarded-Encrypted: i=1; AJvYcCVcqWRxoJj1vibdUme4VtjN3cX9luT5PL2uMbVleGZwT0m/cAUxVXrvjGwTN2FaxaXyyMnrT23ZgAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG04yw8JtAo0bRtEofqssn7SQVQ/stf5CFPPRpFaGMpIaC/WtQ
	y30ZhBSRd8AKfamOcYD4xTvB6L92rrXfsDsp73yYdRKQbBKSY5GS+er/lojOgg==
X-Gm-Gg: ASbGncvO14HeRNc5nDDQVo5D1l04NUBTI+j+N1UjznXNnXVKdXH3zY+K393ywxNyp+0
	y2y5dbKo6KrV9bfrysL7vaF0ulPpwtuY6D7W+LFHEUL/Tbn88w7vEBq8EtHYIGFS+ns6+UT5PbL
	OdXmXxTzdGLWE97Bv96bcUnRD6+bKiPZNqK8uPHWMpyJ+2sksU/2A6xucS7U3hwguO8CKS9eb8F
	9ODYa1KFMRFx7gT4kclbAGlixKZso6Q+BDDYgd8Ex1Fn5MnxHYloluXFqUNXzvtc/TJRDT0cOvT
	2dIUONJk9qnwiix3LikbkN8lE2z/X8eFG+SgXsbDnrXrfqiYH/UL86LxYnnpZh4DOTrhOd9sGfD
	HclaG1nfUA4AJPariFVTZzN/sNj0Sfsg5OlZFnA==
X-Google-Smtp-Source: AGHT+IGBXTLd9FGucbRKIujIIutoo5xIGlcogc24jO38Y8DB5mhjUv+LLAgNLG3yRzzvwDJkN5rqHg==
X-Received: by 2002:a05:620a:84c4:b0:7c5:5a51:d2c0 with SMTP id af79cd13be357-7c55a51d82emr378482285a.52.1741629992671;
        Mon, 10 Mar 2025 11:06:32 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e54ffa55sm703579985a.81.2025.03.10.11.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 11:06:32 -0700 (PDT)
Date: Mon, 10 Mar 2025 14:06:29 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: netdev@vger.kernel.org,
	Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
	UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-list@raspberrypi.com, stable@vger.kernel.org
Subject: Re: [PATCH] net: usb: lan78xx: Enforce a minimum interrupt polling
 period
Message-ID: <d52e460d-2c73-4117-95b9-bed3892ac41d@rowland.harvard.edu>
References: <20250310165932.1201702-1-fiona.klute@gmx.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310165932.1201702-1-fiona.klute@gmx.de>

On Mon, Mar 10, 2025 at 05:59:31PM +0100, Fiona Klute wrote:
> If a new reset event appears before the previous one has been
> processed, the device can get stuck into a reset loop. This happens
> rarely, but blocks the device when it does, and floods the log with
> messages like the following:
> 
>   lan78xx 2-3:1.0 enp1s0u3: kevent 4 may have been dropped
> 
> The only bit that the driver pays attention to in the interrupt data
> is "link was reset". If there's a flapping status bit in that endpoint
> data (such as if PHY negotiation needs a few tries to get a stable
> link), polling at a slower rate allows the state to settle.
> 
> This is a simplified version of a patch that's been in the Raspberry
> Pi downstream kernel since their 4.14 branch, see also:
> https://github.com/raspberrypi/linux/issues/2447
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> Cc: kernel-list@raspberrypi.com
> Cc: stable@vger.kernel.org
> ---
> For the stable crew: I've *tested* the patch with 6.12.7 and 6.13.5 on
> a Revolution Pi Connect 4 (Raspberry Pi CM4 based device with built-in
> LAN7800 as second ethernet port), according to the linked issue for
> the RPi downstream kernel the problem should be present in all
> maintained longterm kernel versions, too (based on how long they've
> carried a patch).
> 
>  drivers/net/usb/lan78xx.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
> index a91bf9c7e31d..7bf01a31a932 100644
> --- a/drivers/net/usb/lan78xx.c
> +++ b/drivers/net/usb/lan78xx.c
> @@ -173,6 +173,12 @@
>  #define INT_EP_GPIO_1			(1)
>  #define INT_EP_GPIO_0			(0)
>  
> +/* highspeed device, so polling interval is in microframes (eight per
> + * millisecond)
> + */
> +#define INT_URB_MICROFRAMES_PER_MS	8
> +#define MIN_INT_URB_INTERVAL_MS		8
> +
>  static const char lan78xx_gstrings[][ETH_GSTRING_LEN] = {
>  	"RX FCS Errors",
>  	"RX Alignment Errors",
> @@ -4527,7 +4533,11 @@ static int lan78xx_probe(struct usb_interface *intf,
>  	if (ret < 0)
>  		goto out4;
>  
> -	period = ep_intr->desc.bInterval;
> +	period = max(ep_intr->desc.bInterval,
> +		     MIN_INT_URB_INTERVAL_MS * INT_URB_MICROFRAMES_PER_MS);

This calculation is completely wrong.  For high-speed interrupt 
endpoints, the bInterval value is encoded using a logarithmic scheme.  
The actual interval in microframes is given by 2^(bInterval - 1) (see 
Table 9-13 in the USB 2.0 spec).  Furthermore, when the value is passed 
to usb_fill_int_urb(), the interval argument must be encoded in the same 
way (see the kerneldoc for usb_fill_int_urb() in include/linux/usb.h).

The encoded value corresponding to 8 ms is 7, not 64, since 8 ms = 64 
uframes and 64 = 2^(7-1).

> +	dev_info(&intf->dev,
> +		 "interrupt urb period set to %d, bInterval is %d\n",
> +		 period, ep_intr->desc.bInterval);

I doubt that this dev_info() will be very helpful to anyone (in addition 
to being wrong since the value in "period" is not the actual period).

Alan Stern

