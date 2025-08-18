Return-Path: <linux-usb+bounces-26970-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FF4B29D2C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 11:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57E6E188B473
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 09:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0178930DEC2;
	Mon, 18 Aug 2025 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TfIjNGHz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFC630DEB4
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755507900; cv=none; b=sDI4nBn0niLZtVEfidYOJ1FIyxGCQ1TKhImEeNxgJ6X169Xav0C1HwpsikPYRWcadk2O9GHWh1YWH8pOfKb9cjO0HXfcCZFFAl0CHnGL2xyOyXps6oZw5JzOSOqIVdHm9QfSPVTuhDey4WEJjNxlMupezWREzJvSAE6z9MjpRA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755507900; c=relaxed/simple;
	bh=va8sFiqZgyorC646JnNnwfGYSxGL3VGuAC6L/LkmHLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GKdFSoUtTB/RHY0wWwVxQ5OAi9WIVpNNGMHZ7nr/Ays3/4uCWH5pNm0MKSGFy03Hijz84qGtLC37BzfstkvpX6mwzCZKjYgG4eUm/LPCrdH4kPADnmkFP34Zuz8jpq3iMJf4fwG7vyAsob2Y5S2257U6szoUJtqprA84Joujol4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TfIjNGHz; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb72d51dcso552695066b.0
        for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 02:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755507897; x=1756112697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Lw+LCxHSIFKIsmxIOr/OVqLwUPRzceVLg90y/kN8Gk=;
        b=TfIjNGHzDdP0AtFVHVUW/HnFyVKbUGkkIpvADfMSCEI6vXz7rqp1F561VjLzZNECwd
         bvJi//S1N381g8PXt5RBKm7B/55Nnv31YfEO5xyTpa7jwURTJLBl3yALgs5EKsroufaJ
         imuG0L0vVYVzWI7M+V4/17Vewl2ZjyTWKu/nss5WwWp8THBMDasJIbf7r3koOPgtNFL5
         aNgP/eu3qPruHrpU+2PZ+/UGh6C1rSp9SqMTuu7zzjexnPARbfuFE6PqsN7F3Y+/2QxO
         KvfukXJVfnvDoL2ipJ0Vy9jJtL71UKrEhesbbdWLrv4EbmEH/cNqHcaGE8mkBBCfgjrK
         E2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507897; x=1756112697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Lw+LCxHSIFKIsmxIOr/OVqLwUPRzceVLg90y/kN8Gk=;
        b=HI46d6wV9CSOBuSxVOzXygQCDJ0h3AKwD4zpPYVSloEZo2MKaTOK82XiZxvfXQyTaa
         hYio9gut0UHrSsSKrLN2dNo1B9ln4hyGPrcBbekHwZkVordPE9SLZD57j5tm3K1c1dtH
         07jM5TQ/RqSb8qoxrLnsFkKjhNxIJkxTzhZn7RLMHr0ll+OIpEVjtfhtqmlpR5fCCgTz
         S3zELFnd6+VKrV/pYWvGhDy2+IJ1EM52rJ/ZCdbiZNphUgsjy6/fVgsLNQFKLJwwT/eF
         Cg7ZoUwHh8Xyr8Aozix90nwp2PHMVZ/0jbC41//rNXr5CM2/SlFLLg4tSE5j/4f1UVgf
         J/Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWSSXp+F9V6GOwVVUsYwP+FsXNXzvh0KmJuRH6Z/o2imzxsEIglhJF0FgaY5ocvkRmSnog3jBj1AS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKyuld5ow0xvk1IdMXND37vvU23UxMQe4q0rUATqhKL6CH34wh
	t+P+voU9Psm8IQReizDUzlP1qdGQ6nu4VMEKibbHY3aL6D2R2M2iblZvlyrDRoO2mkk=
X-Gm-Gg: ASbGncuxRHQHFmWKVUwUCl2bvoAWNgUZ5UVf4K/ZEPqVXXJv84hk8uAOKJThGGT5oZw
	wIoJOOgu2bJXwhjSPP+sn7tvsEnA5mZpPqCZxyUT3XJgf2ztUK2Cx2Jkjl6tjMVtNKBHJS8bDrG
	XGBmnYxSNDXAv4eC78p2XHRH8iCP/ZUykm6J3Lcc3RbzsyDV7I9eftvc6Sn1k3iatZ01NJQKWPq
	K77gimBNP/swEi081Wu0ZNoPY7JB6tgkMeznbxhuAfLxTZWwb8q2FfWeldeMyByoL7z5GywjxH4
	/yZQDDasM3GCMqJiHOaCpNlUKQfvySmwcNSg1Tl5jfkmGn94etnpDmjWxJh4NxtUp+aWsu3vHEK
	DiJZ46Kapjc1AOhsosjpuCSa/mjzmlD/G5XLlchZK+CZmq3lBxF0YuUM2kX4YeAVlkek=
X-Google-Smtp-Source: AGHT+IFN2U0ifcOYrsiMP+SqBYw/LYY7lYQDL305dHhYuuI+QSSyvw76/BjR0E/2+wN/duSXPuQBIg==
X-Received: by 2002:a17:907:3c88:b0:ae3:5185:541a with SMTP id a640c23a62f3a-afceae9fd2fmr810880066b.54.1755507896815;
        Mon, 18 Aug 2025 02:04:56 -0700 (PDT)
Received: from ?IPV6:2001:a61:134f:2b01:3c68:f773:4c52:94ed? ([2001:a61:134f:2b01:3c68:f773:4c52:94ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53c1bsm764036566b.13.2025.08.18.02.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 02:04:56 -0700 (PDT)
Message-ID: <663e2978-8e89-4af4-bc1f-ebbcb2c57b1c@suse.com>
Date: Mon, 18 Aug 2025 11:04:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usbnet: skip info->stop() callback if suspend_count
 is not 0
To: Xu Yang <xu.yang_2@nxp.com>, oneukum@suse.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linux-usb@vger.kernel.org
Cc: netdev@vger.kernel.org
References: <20250818075722.2575543-1-xu.yang_2@nxp.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250818075722.2575543-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/18/25 09:57, Xu Yang wrote:

> --- a/drivers/net/usb/usbnet.c
> +++ b/drivers/net/usb/usbnet.c
> @@ -839,7 +839,7 @@ int usbnet_stop (struct net_device *net)
>   	pm = usb_autopm_get_interface(dev->intf);

This needs to fail ...

>   	/* allow minidriver to stop correctly (wireless devices to turn off
>   	 * radio etc) */
> -	if (info->stop) {
> +	if (info->stop && !dev->suspend_count) {

... for !dev->suspend_count to be false

>   		retval = info->stop(dev);
>   		if (retval < 0)
>   			netif_info(dev, ifdown, dev->net,

In other words, this means that the driver has insufficient
error handling in this method. This needs to be fixed and it
needs to be fixed explicitly. We do not hide error handling.

Please use a literal "if (pm < 0)" to skip the parts we need to skip
if the resumption fails.

	Regards
		Oliver

NACKED-BY: Oliver Neukum <oneukum@suse.com>

