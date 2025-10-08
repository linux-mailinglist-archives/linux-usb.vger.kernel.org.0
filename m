Return-Path: <linux-usb+bounces-29054-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C1EBC6AD8
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 23:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1E393AB3FE
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 21:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3F62C0276;
	Wed,  8 Oct 2025 21:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KXkJpkBh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348382BE7D6
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759958645; cv=none; b=mog38lk53MG/Ph2o5UFUXS8b7I5M1+mP/+Y8n6rObGssxZZrLAUNb5pke5D960te4kgmBubvgOAN/+wPyq0KH4UgOvY6Yc9xGCM9yCjAQfDOM7RMHgJ4JNJ9poP3PZt8oVW4jwDKQjYP2iBy+Hz+aMG3akLFLuV8jtZ1hkInPvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759958645; c=relaxed/simple;
	bh=HEFZfy/bOiUPVmOEzICFEBHZzqvYM+jSBmzbPiW2n0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ud51RfE31NmHXOL+oQ4D1Zz1oZwVptN122ehSeZY5nwyT8Ig41Wn5AuJKkCn/YXeVrjct8O02Qx1UJmBUjYJ/uvLnEe6HjCXlL2BWj+bqg6+l2zf/lXcwR+d/q3bb4UhbuKVE9EZiNgB6nszL08oJ+14PMtEtLmqLctOUB02Lsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KXkJpkBh; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3d50882cc2so47604666b.2
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 14:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759958641; x=1760563441; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/9YY8RVzKysd/2FBRUq2EA9d+6aVFuf0Slin7qbDg94=;
        b=KXkJpkBhUEUrOPzgoVtou9nJvlyGRrs9AIY2TnrnnwtsDmxNcePIfVtR1k4AJsgZ/A
         JAouZfnxn1oLuCDqxB8a5ocLjTe6dOOq22LM2oGnL8EVZgLvS/LQNlWNgAd/atOys89m
         nZr8pyRPIj0vDmLkq18Zu03S7s9BGiYH+23OYGRWr/cTzJpPrtpFHXXdeytiqydm/26u
         XkPqfBmiXdEcMokX7QWMlO3ZNsDv9eeSEEKiT8aDzBYEBsauVeyVrFC3C3Jzb4EypzxX
         kTBxHIEFDwhLOc39vBeZrmTTBzho6wFCewbEfRTlW4XUvWX3+fd+0QV9On6hN/Gd0CgB
         Algw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759958641; x=1760563441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9YY8RVzKysd/2FBRUq2EA9d+6aVFuf0Slin7qbDg94=;
        b=CGx0P03yIqvBXZn62U4sUI8mQ2tW4Rd5S78EKlmeJOUMU28J8jajK4K7N34i4mtMUP
         LBypkDy3xHPF/mSZAfo+swkP4R7vUvgJ1nq+h6lhxCAh9o/YypDzDRPkkmuCxnQtqc+S
         wMUgI+2Ofzy5Cu83P8PXGfnF7XBf7VnfQefSE8EPGvXtJNEFkIt+OVlcNqpO7GEkJIui
         gKWnNPU0Dgk0AW7CiRqGey1XcTVqQAUkw239VKPUTrpj/N7w/cs3xSd6w8z0P+FmxUqx
         o3OndwVp2Ss7xCTlLdQwYZCmETHJLJoCj35nlnsbbCBAqUQDudt7nT8C+uAD4+WpqZjN
         OVdg==
X-Gm-Message-State: AOJu0Yw8R2ECudu6jw64HR8xw7yODUsabzqKbymPAF42ZSWHRW0uZbJN
	VNHVCEAe6KaxvXYlGsyTA73Q7RWfNLzGRwcHiIZDOsix5sFbLaAlmk/UGkMe5CPypH0=
X-Gm-Gg: ASbGnctm1Jc8k1RFfd3GhwBd0NBMe0dl7g3hm0fZ+l3a+05yOj+n8edt62cr1790jWg
	4S2eyiyEs5X4roTRxLp+fKIczflwa0yWYDj0uIFZxtNFtZAG8m2hmlKf3DZ5mrLBm2C8ttGZF/+
	RrPyO05m9AETykEtlhxrJSyIvzqT9pMEAFLpZommZsPhD+XjcTaAqdAwVFIPldsvPmiPliOkqib
	dsWb/orf0RCpW0DEg1rgnZ/cuF3YyGibE+2laZI24T9TPzXzGL5+ODFTaRLDj0IjRYCGz21nVyJ
	EATTKrvcpy7MmxtR2xR48j/Fdn+aP1Wp5bJaL9lE8cvNjCF7F2PZK/QQqBKUUy0o4hbKUrAOgPA
	0TSmJuSXRToKVCOCK9Dii2JZjfIZbZwrVie1lUjj3khdIiSXfYndYqIw7J0s8kYVIp32W/OVW0U
	KCFh8GHGYaNfmTN5+DKixP8jAM
X-Google-Smtp-Source: AGHT+IEodokj7MVKCM1EevdonpV47bRYAPYiGng+Bgp+oHLQSF8yGoyDw+eU3u/c5A8f7XoLgE2gUg==
X-Received: by 2002:a17:907:6d06:b0:b3d:98fa:b3fa with SMTP id a640c23a62f3a-b50ac5d090dmr530996966b.50.1759958641391;
        Wed, 08 Oct 2025 14:24:01 -0700 (PDT)
Received: from ?IPV6:2001:a61:13f0:5001:bea8:8e43:9eb1:6992? ([2001:a61:13f0:5001:bea8:8e43:9eb1:6992])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652ade6esm1681457266b.18.2025.10.08.14.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 14:24:01 -0700 (PDT)
Message-ID: <71613c2a-73d5-4f6e-a71b-03a2aa0f7bdf@suse.com>
Date: Wed, 8 Oct 2025 23:23:59 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: core: replace kmalloc + copy_from_user with
 memdup_user
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, Rex Nie <rex.nie@jaguarmicro.com>,
 Jann Horn <jannh@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250919115654.1011141-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250919115654.1011141-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19.09.25 13:56, Thorsten Blum wrote:
> Replace kmalloc() followed by copy_from_user() with memdup_user() to
> simplify and improve proc_do_submiturb(). Replace the hard-coded 8 bytes
> with the size of 'struct usb_ctrlrequest'.
> 
> Return early if an error occurs, and avoid manually setting 'ret' and
> using 'goto error'.
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   drivers/usb/core/devio.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index f6ce6e26e0d4..3bc54a5c59ff 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1670,13 +1670,9 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
>   		/* min 8 byte setup packet */
>   		if (uurb->buffer_length < 8)
>   			return -EINVAL;
> -		dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_KERNEL);
> -		if (!dr)
> -			return -ENOMEM;
> -		if (copy_from_user(dr, uurb->buffer, 8)) {
> -			ret = -EFAULT;
> -			goto error;
> -		}
> +		dr = memdup_user(uurb->buffer, sizeof(struct usb_ctrlrequest));

You cannot do this. User space cannot and must not know or care how long
struct usb_ctrlrequest is. It is a data structure internal to the kernel.
For the purpose of this API we copy 8 bytes. That is set in stone.
If the kernel's data structure ever changes length, we will have
to define a new ioctl.

You have to leave the literal 8.

	Regards
		Oliver


