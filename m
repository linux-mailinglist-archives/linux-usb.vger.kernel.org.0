Return-Path: <linux-usb+bounces-34505-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAIdFhuXsGkukgIAu9opvQ
	(envelope-from <linux-usb+bounces-34505-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 23:11:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B60E9258C23
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 23:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2239E31B4C50
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 22:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BCB3DE43B;
	Tue, 10 Mar 2026 22:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eYgnBMFK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3F836A01F
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 22:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180625; cv=none; b=JBP8JhyS2KIlbikyFYGOnmajkiMnNp8+B39Wl54V7/7Fe/Q314i0aDm3hA41s/OyYArqIpupuVetJZc0wPERFGgRjnOj9zkPjzr+eg/jrZ/oNBw3CyaJZKK5AttmWJy1cfV90mqKh0TaxqI3noUyMyt8b8R2TO+/LQshS8lFJ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180625; c=relaxed/simple;
	bh=lpiVfMmvMEbc7WpKs/pV2ZfJ12nTPxcYx+2IFGJVlG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=po4A2eLnai9nDA6EZQUQrHfBnsNuNy9qtfIiYrnU42roIBHW6AozOBQep8c7LY4tL2RvjzZ4O/w4XKwZhmjN42XgtPa8xlNRtVOWpskwcp8FrSGueIFYIEWfchjjmi/xboUTYDyMGFBE+TKiLRfbM6F/ysQpJ306NUXkMrbGfXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eYgnBMFK; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-40946982a78so3396343fac.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 15:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773180623; x=1773785423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUlyMjmWtaDm2hBhXkC/tuotxM3BPDdGyXsYclogIX0=;
        b=eYgnBMFKWVHouQ58+dgZgkB4xTILOjVIUEmpgWBPiyS8/3U4xC3EO6DH/oU/e6tPO3
         QCfvCsjk5UgYHWDiJoPsObYkn2cNxBb9IQmejwzWSQsu5AqfKtGI2jcRyCEL28sCsXcb
         cxl5khi+GRRdDThB7UOCZvhkH9H2McSlu/5/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773180623; x=1773785423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUlyMjmWtaDm2hBhXkC/tuotxM3BPDdGyXsYclogIX0=;
        b=WYgkRaZlq3psIyanaIkK0UU1Eq/3n4bnHVA5z5NDtcue/arvhMafcwhWn76an2xbwH
         7nay6zZ9RhZ5EfYe/ezM9DlsichRRzpiKLF/4n8/FtX558CxESDUsXF2AYAj1TNq/7LK
         0ujQnZ4rx7HBKoUR6QdDytzigs5i2GKsS4JYerRrNMka2mihouB3q7oTkzRrArV4Tpws
         040lYsnZhnY25ywH17tFIQvtFG0UVaIWpPOUaMXJuFjq88SyTFlTJrvIusry8eZA0d7/
         p/Phf+H0Ng1TwuGEIecB2/3HoEukMDupDNQVV5R1KRndi/Gez9ekpbUFlJjtqOSp8oTz
         ylBw==
X-Gm-Message-State: AOJu0YxN7+X33ASOWf0MrkFBCOMAOs7IoWpRG9JirhD62DCY5TTNWsFA
	1J1uySAWPaUPkDE4bCPxIbauXzArNqKIg49xg37rRZvthpegKDO/GOb0AjaJVB9jRM4=
X-Gm-Gg: ATEYQzw1tUdCigGIQ6EBflIU9plOTkl2SKRsT1nOSahyvT4zkBj60xjPHt1ePNOXuhG
	skDrRIEHRE+6WUfVuKjJx5Y57QimVUoKRKY41oEmjdJQ9Mmd3j4+j5J3XCvHhk6PPaSNJ8uRDd9
	rpgRPINe196FXJ2IRxEa3ZTa8evELQIMORhxfkSvw94QDJfAGK3aWPjXlZwDkgU8iLeSO6r7WGH
	C1de5McPMipsnDSiwYRsSwFabvBM0A8Jpe8XHRZCo0EApBh+tfPakgJQ+uEeJyapXJ/GqusD0+Q
	Ai5DuyRA4b7yyhVb4+i6Rr4CJOJ/ums/cAujz6AlNSUTYe0l/cOr4p0OImzh/MrehNXUwnR5PIZ
	Q/ov+9KxblJAbqFuMM0qsHwHbmEWTSPrtlRDILyctZd2968ZCNzLFNZfug/6jzkGvs29lsIBfcY
	Qb0se8DSlwS6H2o20ANQ36MCgJ74/XzcUKQ8k=
X-Received: by 2002:a05:6870:8e07:b0:3e0:de76:31e5 with SMTP id 586e51a60fabf-4177c8b4e62mr340891fac.25.1773180622827;
        Tue, 10 Mar 2026 15:10:22 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e72b40asm215404fac.20.2026.03.10.15.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 15:10:22 -0700 (PDT)
Message-ID: <b49bc467-8c51-41fc-a7ee-5770a9720deb@linuxfoundation.org>
Date: Tue, 10 Mar 2026 16:10:20 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] usbip: vhci_sysfs: Use safer strscpy() instead of
 strcpy()
To: Ai Chao <aichao@kylinos.cn>, gregkh@linuxfoundation.org, b-liu@ti.com,
 johan@kernel.org, badhri@google.com, heikki.krogerus@linux.intel.com,
 valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me, tiwai@suse.de,
 kees@kernel.org, christophe.jaillet@wanadoo.fr,
 prashanth.k@oss.qualcomm.com, khtsai@google.com, dan.carpenter@linaro.org,
 tglx@kernel.org, mingo@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260310094434.3639602-1-aichao@kylinos.cn>
 <20260310094434.3639602-7-aichao@kylinos.cn>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260310094434.3639602-7-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B60E9258C23
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
	TAGGED_FROM(0.00)[bounces-34505-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kylinos.cn,linuxfoundation.org,ti.com,kernel.org,google.com,linux.intel.com,gmail.com,zenithal.me,suse.de,wanadoo.fr,oss.qualcomm.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:mid,kylinos.cn:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 3/10/26 03:44, Ai Chao wrote:
> Use a safer function strscpy() instead of strcpy() for copying to
> arrays.
> 
> Only idiomatic code replacement, and no functional changes.

It is a functional change since it calls a new routine. Get rid
of this line from change log.

How did you test this patch? I am curious because of you are
describing the change as "idiomatic code replacement"

> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>   drivers/usb/usbip/vhci_sysfs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
> index bfc10f665e52..5bc8c47788d4 100644
> --- a/drivers/usb/usbip/vhci_sysfs.c
> +++ b/drivers/usb/usbip/vhci_sysfs.c
> @@ -463,7 +463,7 @@ static void set_status_attr(int id)
>   
>   	status = status_attrs + id;
>   	if (id == 0)
> -		strcpy(status->name, "status");
> +		strscpy(status->name, "status");
>   	else
>   		snprintf(status->name, MAX_STATUS_NAME+1, "status.%d", id);
>   	status->attr.attr.name = status->name;

thanks,
-- Shuah


