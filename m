Return-Path: <linux-usb+bounces-35756-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAB8Am1mzGktSwYAu9opvQ
	(envelope-from <linux-usb+bounces-35756-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 02:27:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A38213731B7
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 02:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12F8F3015B6D
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 00:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA5B195811;
	Wed,  1 Apr 2026 00:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DJmRkx1z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFE15B1EB
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 00:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003239; cv=none; b=K/3f65EiywhAw+fMGugHkcIlpTBhS6TW4h7gwTzqrlAzBMng2Lawx1KTDQXdlt1RRq2HU691x/6jrWjI1OufM8qRbLbBQh4JMINlDiPOqnrjHsflHyVGT3CD4a5mms6YNbmzyWYfZC6mVGVApc/JtfpUWlY0rh2lPJxYRsUfdqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003239; c=relaxed/simple;
	bh=Jk3/bt2gmKId4jafshg5W5PzA2Ea3CHOFMbIEjAyTWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DUqbXbEs30dCDmUsA5Up1o5TtXENDwmDl46a4SShoUxJyE5ij6aSjEVSXVVi2De9L+Xqj4VfJvzsjcAqfPlKq47AVAza0eHSkEkMWK1aWs0cy27IZ1nh5BilI+DueMfYUfgll+jJshWuPJ3hGJFPcom9nYL3B1s4B/PDxyr2h80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DJmRkx1z; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d7e5e8c907so4042164a34.0
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 17:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775003237; x=1775608037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IvFlcB6AQtRta0LEWu5k7SRnOgWWnnSTlXIjEhCSbfY=;
        b=DJmRkx1zj5sttZYEkuKhkLoYLhitcJbkeFGOQ31PIGCfmMmVBFcpcXNnbGm4zZ2MmL
         v5VpN3WffB6zu3ME1GIVSr0eQAaQhuWPK6+Qhlg+jpR1Oxw+m61C2xg5SRoZe8vgbxon
         Q29KHfzLF4cY1H0s+Kc9GW/GeOytsFpkyQYX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775003237; x=1775608037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvFlcB6AQtRta0LEWu5k7SRnOgWWnnSTlXIjEhCSbfY=;
        b=UcnA2nhu0/OA7rpv6rrHoqk5Plew4tVF1W74/f+oCX80iY0gQQT2Fk3qlsYRLtSuRq
         sN1FhxDd4pO0iu8a19l49BfvQ3EffPwO3vmZtxwj8iAmExMx46EPznTqzI1+GDPymPoe
         qyA87jmkW21MEzecAJhvyzLYa3nVlgMyx97EDdoFa/RFZNBEDKZeeqPJuxlx+eM2VMZa
         FhKX2iM7MaZGw9DvA29sHsWK/WaWRXVmxM1zZSCAqTIhT34ysTRA8ElJ0lDOH0mSOHLn
         tiNkubT6MKLD4qn0ZIjBmUt0AwaxHybTfT4Zi1xnvqqGZajYXgqi4WrM/Ftd4C7fkRB7
         TYVA==
X-Forwarded-Encrypted: i=1; AJvYcCVbNzAu5hc7doY0qLwew3KzyeZ+0uLMTZoi9HNCNOQWKtXRDaRxWtreT7ZZgH2ZibOPzMjdMXvIDn4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz38EtUfMpzl/ff0aS46CRbXWCw04+kZJAvBVifOUfl81NU5rOT
	7PTQTuk9TyHdo0XNQ6CSlCOE0MFZGrAgCncRO9Lw0e2OiCQwpvk2ta/nPWUxg9WD+wM=
X-Gm-Gg: ATEYQzx45FxErkYeVePI4pn1+jFSsIRVrhsG4fCd03vwN0cdqZHlZD3efQFcv9XcHcM
	XLfNj4r0RZJ2yAug3OiPnJ7UMCRnuNz5UzGHyc6BSuLoXaHsZ1H4QIKdK6mnjhlrnvThCfL9huq
	uIjbENO2yj71FIEzDZPAqhtf6QRvt0SkS3CHAtbwTPpwHSAp2rI6xsJ7nEQxhMkb788nK/xbGc7
	apACuitcUC7lT6NJIrWH+n8JiYuMA5pCXFuCIi9glBsBWYV23vgH9amnoBnL9uqooGoRuRsyrUw
	MoMlHZ3Z4uPACK2EhBsN0YFLmGeyUgx/Vlu37p0MZKHKRUUXHAe82RWS833p6lZez+Vci+EZj70
	addrt0W5FtHwtk+3JDGBekteVfU9UJ3uOfLPjRtm4wCEfb2iB8KzJiqCw5h6CD1QrzFS9rnzkxb
	FCyqXBzEISvryCO2bydqPv/pd+tu2ikM3pYFc=
X-Received: by 2002:a05:6830:210c:b0:7d7:f700:fec1 with SMTP id 46e09a7af769-7db99425c78mr1250125a34.32.1775003236818;
        Tue, 31 Mar 2026 17:27:16 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a3b2e37sm9617912a34.10.2026.03.31.17.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 17:27:16 -0700 (PDT)
Message-ID: <d72e7bf6-a0db-4984-8a7e-31d898190c28@linuxfoundation.org>
Date: Tue, 31 Mar 2026 18:27:15 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usbip: tools: add hint when no exported devices are
 found
To: Zongmin Zhou <min_halo@163.com>
Cc: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, valentina.manea.m@gmail.com,
 Zongmin Zhou <zhouzongmin@kylinos.cn>, Shuah Khan <skhan@linuxfoundation.org>
References: <3ff00e2e-1c45-45be-a65c-16da9b2ae5a5@linuxfoundation.org>
 <20260331095830.124543-1-min_halo@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260331095830.124543-1-min_halo@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zenithal.me,vger.kernel.org,gmail.com,kylinos.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35756-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A38213731B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 03:58, Zongmin Zhou wrote:
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
> Changes in v3:
> - Just add an informational message when no devices are found.
> Changes in v2:
> - Use system calls directly instead of checking sysfs dir.
> 
>   tools/usb/usbip/libsrc/usbip_host_common.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
> index ca78aa368476..cd92baee310c 100644
> --- a/tools/usb/usbip/libsrc/usbip_host_common.c
> +++ b/tools/usb/usbip/libsrc/usbip_host_common.c
> @@ -149,6 +149,13 @@ static int refresh_exported_devices(struct usbip_host_driver *hdriver)
>   		}
>   	}
>   
> +	if (hdriver->ndevs == 0) {
> +		if (!strcmp(hdriver->udev_subsystem, "usb"))
> +			info("Please check if %s driver is loaded or export devices.",USBIP_HOST_DRV_NAME);

Check coding guidelines and match the new code to the existing. Need a space between
the string and the next argument.


> +		else
> +			info("Please check if %s driver is loaded or export devices.",USBIP_DEVICE_DRV_NAME);

When will this be true? Isn't refresh_exported_devices() called from

Thinking about this more, since you have to differentiate between
host and device, it makes sense to make this change to

usbip_device_driver_open() and usbip_host_driver_open()
There is an err() message already in both of these routines.
that prints the right information.

You can check hdriver->ndevs == 0 and add an info that says
load appropriate modules or export devices. This way you
don't have to add logic to refresh_exported_devices() to figure
out which driver.

thanks,
-- Shuah

