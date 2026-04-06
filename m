Return-Path: <linux-usb+bounces-36021-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIKQLAYi1GlxrgcAu9opvQ
	(envelope-from <linux-usb+bounces-36021-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 23:13:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B333A770E
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 23:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF3A030547CE
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2026 21:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3A638838B;
	Mon,  6 Apr 2026 21:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a95mVwEC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278B08634C
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 21:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775509979; cv=none; b=QnujvAceZLoSQZDON7rJL+kCiugTe7MUSzRB+1ROA9c6uAMoEtFAAmfymgKnfLfVIRaj7f4VgmHliMqtGDCGhDLXkgil2FHZneifDrr3Q9TgTx6OtExbqZpeStWdpSHdBcksRCfUJibJtHHrmOj2gCWA7VRhLXRH7sVElT7HEpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775509979; c=relaxed/simple;
	bh=aV8nHzi0a8jr/2WiI2qH4yf5lhEiVVMkGp3MXWjdDJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WywfJzMfmrAo1Zt8rV+hV3Sx1l6mBkj2cDikdlLmBjfnjO8WDOUTLVrQVU7nH+/IPUdj5Nt96QeuZ9hMImKbzzmd14U6OSOXyabF7p3AzzysouLPTagdh6WDEf8fOr/J9fsYoIipOpSMLT81Ew+PKhEkOpHoVTz6VdYsm00SkfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a95mVwEC; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7dbcd92eda5so1687940a34.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Apr 2026 14:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775509976; x=1776114776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pWK3waau6Ia06c6heEcaBjF2/x2U2gZGHRskfdLqA4s=;
        b=a95mVwECYoDHH80N3/r51E9BmqmoKcGmNQm4lew6WJo2qZU7XmVkasDHVLAtIEWKs1
         aGoM3ELV4XNr3wGFpuhlnuPoZZ+WVA/jhT9kkY9MIbq6I0Bqi9k7tQnztRdfvCLGziaj
         Yd+drBpxL/ac1wXxy7LKHGyB4o1AZKI6J+65k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775509976; x=1776114776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWK3waau6Ia06c6heEcaBjF2/x2U2gZGHRskfdLqA4s=;
        b=OEnUDN2HA5eUdJ8b5JD4zESyV/F8kcYRnPvfWmXQNuDvFFLlywDnvuoCo4t+kI8alP
         yCrE2If2u5bk1wXyY13dXMDChGLKiTY4pMNd1Qx2HUISWcDPqlk4epyCaa5KsI2LHeAy
         7nk+zFxumtHPDIJnrQWOS+6ZqBG7NPXZRfTIq1h4iKkPTqr3IPgH/Rj52aJGJ3Xlkszd
         qosbjB3dguLbefadpN5I2pZa81QfNkiXJgMx8x2UCB8kYZI0EWOxZMz9V3/5HPaUwIL3
         P9VJ0Jd3TgJoB4Gz+ccwNfe0tzcaoLWcWu4SyZc+d2YYjqEj4aU8OGE8cvJ3ve2kY5HW
         abYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyVB/ZR+HyqKk9+bAaUlFlMh8TrBJjxJA4CoHFoxqRrgVIbXhlpLQGgayEPyuISP4ffV/HGf51A1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGXHjPXAt7GdZo+A42gh3UT3jQFu+6A3vH0cPQ+knBgjQuYwf8
	6ksMAylrC7XHnLs/ghJ24U3BeILizy9fvxRGRtMCo6f2j6Wd16t0vZp8lOsGUmOeksI=
X-Gm-Gg: AeBDiet6hBPDya5m8kSwW+WLDYqRDK5FdFFMw4KkJ0XE+ed6M3Av5Onzgfi/to8As7d
	GyAJMOfhmGprsrP3tnqQ0wOKHJN1l4JBCCvwBqOhLVgI8kxFp79BRvHSjNg53bQYB6ZOO3OdNhQ
	nv8brvccuTJEQTBozDNvkJoNFc8Es/gXqla6A9SsHl2aUlh7hDH2MFE4sX2eZD7wM4gk18xUMDc
	p2z5PbP3gOT4avzjiuPDf27Q1dxjHW3+A9rRsizW5fHOkzkrc0rvJqszeQnXXD1cXbUnl9wMP/S
	yEbaVNdOLZWSPfALlEil+T1dFQPPrAgzZ4AC5NDj3wAHvtK/1ko12xHgYoMfCwkYWl4D2wHOjXM
	wtrLVKC4KSTldvwrwyyZ+vF14TJwk9aZWlLRQ6i1CInaEDjjCTj560VGFC4h/3/7I0CtZCCUM1f
	VrhYCEVR17eZVjinalp7SdbD4WdorpeUkUsO/wblHtlkJQ5Q==
X-Received: by 2002:a05:6820:81c3:b0:67e:9a9:5ba9 with SMTP id 006d021491bc7-6821d83c791mr7929299eaf.5.1775509976040;
        Mon, 06 Apr 2026 14:12:56 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-680a540002csm9223548eaf.1.2026.04.06.14.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 14:12:55 -0700 (PDT)
Message-ID: <83e82b09-a617-4e56-980c-563d8fba2045@linuxfoundation.org>
Date: Mon, 6 Apr 2026 15:12:54 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usbip: tools: add hint when no exported devices are
 found
To: Zongmin Zhou <min_halo@163.com>
Cc: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, valentina.manea.m@gmail.com,
 Zongmin Zhou <zhouzongmin@kylinos.cn>, Shuah Khan <skhan@linuxfoundation.org>
References: <8d7000a9-981c-468a-bd4b-60111e0b77e9@linuxfoundation.org>
 <20260402083204.53179-1-min_halo@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260402083204.53179-1-min_halo@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zenithal.me,vger.kernel.org,gmail.com,kylinos.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36021-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email,linuxfoundation.org:mid,kylinos.cn:email]
X-Rspamd-Queue-Id: 20B333A770E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 02:32, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> When refresh_exported_devices() finds no devices, it's helpful to
> inform users about potential causes. This could be due to:
> 
> 1. The usbip driver module is not loaded.
> 2. No devices have been exported yet.
> 
> Add an informational message to guide users when ndevs == 0.
> 
> Also update the condition in usbip_host_driver_open() and
> usbip_device_driver_open() to check both ret and ndevs == 0,
> and change err() to info().
> 
> Message visibility by scenario:
> - usbipd (console mode): Show on console/serial, this allows instant
>    visibility for debugging.
> - usbipd -D (daemon mode): Message logged to syslog, can keep logs for
>    later traceability in production. Also can use "journalctl -f" to
>    trace on console.
> 
> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> ---
> Changes in v4:
> - Printing behavior adjusted as suggested.
> Changes in v3:
> - Just add an informational message when no devices are found.
> Changes in v2:
> - Use system calls directly instead of checking sysfs dir.
> 
>   tools/usb/usbip/libsrc/usbip_device_driver.c | 6 +++---
>   tools/usb/usbip/libsrc/usbip_host_common.c   | 3 +++
>   tools/usb/usbip/libsrc/usbip_host_driver.c   | 7 ++++---
>   3 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
> index 927a151fa9aa..1dfbb76ab26c 100644
> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
> @@ -137,9 +137,9 @@ static int usbip_device_driver_open(struct usbip_host_driver *hdriver)
>   	INIT_LIST_HEAD(&hdriver->edev_list);
>   
>   	ret = usbip_generic_driver_open(hdriver);
> -	if (ret)
> -		err("please load " USBIP_CORE_MOD_NAME ".ko and "
> -		    USBIP_DEVICE_DRV_NAME ".ko!");
> +	if (ret || hdriver->ndevs == 0)
> +		info("please load " USBIP_CORE_MOD_NAME ".ko and "
> +		     USBIP_DEVICE_DRV_NAME ".ko");
>   
>   	return ret;
>   }
> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
> index ca78aa368476..01599cb2fa7b 100644
> --- a/tools/usb/usbip/libsrc/usbip_host_common.c
> +++ b/tools/usb/usbip/libsrc/usbip_host_common.c
> @@ -149,6 +149,9 @@ static int refresh_exported_devices(struct usbip_host_driver *hdriver)
>   		}
>   	}
>   
> +	if (hdriver->ndevs == 0)
> +		info("Please load appropriate modules or export devices.");

Is this message needed here in refresh_exported_devices()?
usbip_host_driver_open() and usbip_device_driver_open(), the
only two callers of refresh_exported_devices() print info
message with this change?

thanks,
-- Shuah

