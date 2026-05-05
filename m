Return-Path: <linux-usb+bounces-36981-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PZlNvIz+mlLKwMAu9opvQ
	(envelope-from <linux-usb+bounces-36981-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 20:16:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 410724D28AE
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 20:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A613C304D25B
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 18:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB544963B6;
	Tue,  5 May 2026 18:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XFjPsvTQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F2431F9BA
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 18:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778004955; cv=none; b=jxg94ovpvUOGggXKg5Ae6/CQ0BS8teF3bFVVo5dzSi4K36XyGn4FsLKQuRi1XDDSl4+dHw6wc2I+JMumf7AH1wHpJoDMf9uRLfc6tjbAuflmBz/dQ5a+CPznlVoCAMzzl2erVK61JpXG5RJocw5X+JASRg0W/xL4NYwUvTb8JiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778004955; c=relaxed/simple;
	bh=nLIMB1PdV3eOid1SLb0XX+dckuXtlfeDMJV7ZHeV5YM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NouVXE3kY1HUJaoCK/VK4tNIr93rtXAfhRdLuQ5+DVTEHuAO8spukhrVWuX/rdvlvbu5CrPpedtKUKJav8fpWaTNTP9ZdcojKkwgPaiXWe9V/VgnhifV2o5Y3Xx6qLT5mEnyT1BFHSo1QrktXgbAthcJDC1V4JRmNhAmnev0q2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XFjPsvTQ; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-409de4132b5so3419903fac.1
        for <linux-usb@vger.kernel.org>; Tue, 05 May 2026 11:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778004953; x=1778609753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p4A7BikZMtv/yj3plsfhVEeOjiwdWqagCxXKNIKmazk=;
        b=XFjPsvTQZ2hFmeCwuntc1QgBNrKOOwbZYRTGyNwLzYksrtQd8xXMOUuM8Q1eItf5k8
         13eAD5HM5/Zr0JWN/myHhkGY0HCuZ2BN6OAEAV7vhdDqvTZJKphrIGJo8fn2TWQouGrd
         8VfViCh6Fqz+JbQYJa3xEgHrzczEp5du0Z07o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778004953; x=1778609753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4A7BikZMtv/yj3plsfhVEeOjiwdWqagCxXKNIKmazk=;
        b=lczfkQ3Dva4lkzaObxtzggdDBWgaTQk0g/kG0azgUFRUl+bhLmyQp8mwJLszIrKZDl
         7wFzEEanicUC3N24XZw20iccKLlV0xEpXH0KbLmrEEHKd3FVfR630iMqVlVbSrLuUORs
         3U/FMbullgG/11vvNit8/T23fTF8BXvewGs0F+VVGS2ORe+yQCScb4y2uGJW1qRb7cgW
         A+AB2RNSaGV0aBwIT6U0UyV3FWTP7hU+redRk4EybOcKAZVXoFpfE54b20Dv2lbgDeRK
         zBilaP9N/GcANPxNtGZLRjdw5j+3Mj0QXWSBSjfHtOrBs2YDPzpA7CDMWWKoR62boFyG
         5arw==
X-Forwarded-Encrypted: i=1; AFNElJ9oj08aHuVeiS3M0PF6I/DL49thWgap7TqqWAKkuWRxNF8YIO3dbs8ngneNIcIAlKY9LXrcE3xrVPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfWuoFXzRtSsX1gU7bX9M8dDU8OTB5SAX4QFN3Ta3/OzjfU9oF
	1Ra+vuZTNC3fS3Av+PnMOK3a7++blfW+yZ9M+0tPTWPNhf5z6u2Ar7EYwpmXjXaw26c=
X-Gm-Gg: AeBDietQdoANbGMuxiLLGuYS0gqH29x7jL7lKkkbvywrVzHCac667415KfhtRNVIIkQ
	iuRQu+cX0SwuH/hS7Om3/HWTCY0TH2+6sCGGt6wMYwYQocW/6NUQ4bn2agr/O6WrWUDZKpNwTEI
	MatRogGI9UW0fiEb0G+SEFRLaHGKykKKFGt1/OUu1o9LwyaKDtfYImcakqOSFL6E7hDhiZxWvIh
	TQ1Ku/Z/ZOj8HLjCLJKPsbBm+B2NnLOVmnjNKNp32uF3TM4AoCiVYk6IE1zQ4BPb0vox70KzUVz
	FUJiyrEIYcABukxke33sLuyhY/oD7tzFi+zm40EGQTmC8zubngLfkeYJ9IAKy09tkHzbqBIU4WU
	4MUh0NlVt4WutKOZ0E8jSTitwnP4NuihEAIlulbfg1ZEQeDP2leZyvWzxkTB7qLJdYIj4WeMqJK
	nUIRLeoleNckOJXuUK8rEFUX1UJK77YFQskyWSfvCreg==
X-Received: by 2002:a05:6870:c201:b0:40e:dcc9:c3a9 with SMTP id 586e51a60fabf-434f56d7d32mr274919fac.3.1778004953077;
        Tue, 05 May 2026 11:15:53 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43454cbd8dbsm14446656fac.11.2026.05.05.11.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:15:52 -0700 (PDT)
Message-ID: <1c8b0149-261a-447c-acd9-4ee62b74adfd@linuxfoundation.org>
Date: Tue, 5 May 2026 12:15:51 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usbip: vhci_hcd: reduce CONFIG_USBIP_VHCI_NR_HCS
 upper bound to 32
To: Adrian Wowk <dev@adrianwowk.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org
Cc: i@zenithal.me, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260414010050.158064-1-dev@adrianwowk.com>
 <20260414010050.158064-3-dev@adrianwowk.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260414010050.158064-3-dev@adrianwowk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 410724D28AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[adrianwowk.com,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-36981-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]

On 4/13/26 19:00, Adrian Wowk wrote:
> Each VHCI HC instance registers two USB buses (one HS, one SS).
> USB_MAXBUS in drivers/usb/core/hcd.c is hard-coded to 64, giving an
> effective maximum of 32 VHCI HC instances (32 * 2 = 64 buses).
> 
> The Kconfig range for USBIP_VHCI_NR_HCS currently allows up to 128,
> which will cause probe failures for any HC instance beyond the 32nd.
> These probe failures trigger the NULL pointer dereference fixed in the
> previous commit.
> 
> Reduce the upper bound to 32 to reflect the real maximum imposed by
> USB_MAXBUS. Note that probe failures can still occur below this limit
> if real hardware has already claimed enough USB bus numbers, making
> the NULL check fix necessary regardless.
> 
> Signed-off-by: Adrian Wowk <dev@adrianwowk.com>
> ---
>   drivers/usb/usbip/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/usbip/Kconfig b/drivers/usb/usbip/Kconfig
> index b9f94e2e278..50945b6fae1 100644
> --- a/drivers/usb/usbip/Kconfig
> +++ b/drivers/usb/usbip/Kconfig
> @@ -40,7 +40,7 @@ config USBIP_VHCI_HC_PORTS
>   
>   config USBIP_VHCI_NR_HCS
>   	int "Number of USB/IP virtual host controllers"
> -	range 1 128
> +	range 1 32
>   	default 1
>   	depends on USBIP_VHCI_HCD
>   	help

Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, Please pick this up.

thanks,
-- Shuah

