Return-Path: <linux-usb+bounces-33260-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HzDOiI3i2neRgAAu9opvQ
	(envelope-from <linux-usb+bounces-33260-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 14:48:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B1011B666
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 14:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E5D33040219
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 13:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46250329E43;
	Tue, 10 Feb 2026 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YD14sGCZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036102749C7
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 13:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770731153; cv=none; b=O9fR+5NK59C1bClggdyKMgbwMWFPRs8DGqeo9FoNC/5sp0LdaCT1lr92tNH7oeFhPtM9YAc4DPoslBpdynEBysgvq1yzwMk6Eh0QDR3OB4ANhoUjR9xbi07PcIdwvZGLAEkDi2fy3UrjF1oYQwA1+CEXqFvoTI3orNNB8Cg5Qg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770731153; c=relaxed/simple;
	bh=LFfNuASI3M4ZdLNRiyjGm28OdZZb/0qgcsrmCPDGEnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8V7pg6IgxFdYIV0+SbYHUsZFOTqkXvBTWGYOrl6kob84NhJWNA2MU9A2F41R+rCIFipRtqEcQmA6jY8DmW56W473Bk6dPopFHs9CNW0xPO8z8Ub1G5tH4XF1Anp0cVBgN1eEBZIR2XWpFHSiyxx3w8I4Hjj6etSb5ppEHHUxNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YD14sGCZ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-386714da2a2so32460881fa.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 05:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770731149; x=1771335949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqGFCgjdz+m6pCARw4RzgeZOPwXzAMTXBB6oFzK0ogE=;
        b=YD14sGCZGVu42MMimn4W7M1MyTNK8FPNtiU+rfkNWV4HttjK40yUHuDjaMmF4PBdbA
         3Ls3ssAjrf57Om0BODdM39wzsjuQr5CiyLYt+mSNPQkXgErMJzdEnvCaESudLjnsb2fP
         J74xfuWVqs3QDsk2st9MA7uGplvT7h/AxwkCXJjJL4qNGGpxPXC1Y6VLJZTs4ULC3Tiu
         nWFIcQt6M89YJXc0FMgoSkwilP+Jl2cGGZXGh2H7mGfrxiWfQhxqN9po+F3dbIH1dfb6
         9Xzk0qgASe6ThwXQbQFprFxJwnCpwyV62SRzZj+RNNIoABt1dW83+MgWxT6cSsp2onPy
         iyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770731149; x=1771335949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqGFCgjdz+m6pCARw4RzgeZOPwXzAMTXBB6oFzK0ogE=;
        b=vlAfcCQ6eVOSSlGYxoAngvmnMWWP2cVYNQtG6lY/AcjnkfPePlAaKjUrfJInR9qCZP
         6x23ABHOtHoL5vnBCfk6A/Iu1EYWwzyEdrD2pgJZI4M2T3fTp5dxd5YpsjcHK6RIRba4
         d5MHAQpWACgbqudPN61yUoFFQ7yD0buIUKLwX70jP7pGFluKuXA673Qbj//xAbDKRRf2
         qKRtVSmzU1UlHSI9utCDWmkYkLabD4OgdpvmQyywbl8cFq34oVawyUAa1BNJhE60yiGy
         eNUSprmrdHs0PHgA0H7keDHeR9EV5l0wkY0JkVXPMzgxSCN+4gjoNW+HCwDRr+67wTvK
         7lTw==
X-Gm-Message-State: AOJu0Yw7BUFVs4gv07mQwDG0OxBug05e6ckof202h0X1KBzE4LXiidIL
	6gLgvh61I6t2P9PqlCEHJsLvIhpw8kTismvALv7tto8T9lPPhe3Hbcsh
X-Gm-Gg: AZuq6aJ4hbLWw4qkbwt9HRMAKpYvG6yZNf5JSEcK+hGdH2POTxpV7/O9uyma9N+POfZ
	8R8NZhHmWqssoWX/Qlg23fHbIOzQNpLqWdHSLsA7MP2OclRLUsfwOQnaihobRD9enrJ+2xqTSlD
	3F8jXhMMQUFNWRM6mVz//k0txxPBedOPXqDzu3F6hICvV2g8l8cDHkKXxkYhVHTDS5Kll4CfUGh
	DiqMQoxSKDOAo3FVXkbZ0Eh0YgoTnhcmixNnDDXgdhqcXAWtCGVZ8sdxK7W69T1OJf4u2JohkDQ
	okGnTlfM3BIubcRkjIz+XWUilEDRFu7jd3Lql6jY1eYjAfYbjeQnfbAvgvMeTkshG8NOu2EUgY1
	FZIjTgtCnKoTLBEh8bGyBp4rWy9zRhDRJcfxE25drOoHyxG2NlmN3QDeey9m5AqeeDSyizRcH+1
	V/q+YT/HJXjR7J22n3zaoarDrEb9MqAO88ax5bOpPrfOZXX7hqF5ZJe8kymTvJhTtIJ6P3vZcuB
	5NsKjXRDw==
X-Received: by 2002:a05:6512:3044:b0:59d:f473:aa8e with SMTP id 2adb3069b0e04-59e451582cfmr5279851e87.27.1770731148826;
        Tue, 10 Feb 2026 05:45:48 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:4341:e63c:56b3:c9fb:1b7e:5017? ([2a00:1fa0:4341:e63c:56b3:c9fb:1b7e:5017])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b63b0540sm35527341fa.23.2026.02.10.05.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 05:45:47 -0800 (PST)
Message-ID: <3de6c9bd-35c5-45c5-874b-75c6623bd4ad@gmail.com>
Date: Tue, 10 Feb 2026 16:45:45 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: isp1760: Add missing error check for
 platform_get_resource()
To: Chen Ni <nichen@iscas.ac.cn>, rui.silva@linaro.org,
 gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com, balbi@ti.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210090202.2332349-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260210090202.2332349-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33260-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 53B1011B666
X-Rspamd-Action: no action

On 2/10/26 12:02 PM, Chen Ni wrote:

> Check the return value of platform_get_resource() to prevent potential
> NULL pointer dereference when the memory resource is unavailable.
> 
> Fixes: 7ef077a8ad35 ("usb: isp1760: Move driver from drivers/usb/host/ to drivers/usb/isp1760/")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/usb/isp1760/isp1760-if.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
> index a64190addba6..60f81ec81373 100644
> --- a/drivers/usb/isp1760/isp1760-if.c
> +++ b/drivers/usb/isp1760/isp1760-if.c
> @@ -196,6 +196,8 @@ static int isp1760_plat_probe(struct platform_device *pdev)
>  	int ret;
>  
>  	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!mem_res)
> +		return -EINVAL;

   Isn't it already checked in __devm_ioremap_resource(), called later on?

[...]

MBR, Sergey


