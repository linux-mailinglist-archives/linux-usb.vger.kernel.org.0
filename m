Return-Path: <linux-usb+bounces-36979-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KwALc0w+mkGKwMAu9opvQ
	(envelope-from <linux-usb+bounces-36979-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 20:02:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2369A4D2750
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 20:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB35430753BB
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 18:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248534A33F5;
	Tue,  5 May 2026 18:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MrI32tUO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5869649251F
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 18:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778004140; cv=none; b=lONUr+5YBGIHTaZKkRauKR7PSL6ktmsAD+TF8iQB84r4cuNMTbZrKvHzslh9kTh4LLFGKh7OXziVxNLLsChUT3v6ZtTCecS+lMa87WiGcBD9YxeS7wEBV9XnHac2oMrdTbOSEMn3RBFigyz23PsuuaVvGyatdCvXVxwK+tbvNIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778004140; c=relaxed/simple;
	bh=viG8R2mDoAcZqggJnDOucgogWv5GnrN+eXMPLjcox5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbUmfLvz0GDZAV7Wpp1HCVRl5xoc9bDbP/G86idlkSzjPA+96XC3w9a8guSca6hBBFsbJczFfZbwD8MEI0EWnr5dpSrnEmI3VzqFtKKfbNMmJh1CUo3W4TToEGafyhUDYjsIaURZena6chUDTUdOXIY08zUo31UtrwJYv8sV/O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MrI32tUO; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dcc9b506d9so5353463a34.1
        for <linux-usb@vger.kernel.org>; Tue, 05 May 2026 11:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778004136; x=1778608936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lRuWquNC/y9Oi8holSmNss4ZLk/ie2nyH8NEoX7A+d8=;
        b=MrI32tUOFayYYZronul+lMX5SUKK3NqayA4+cdegrdHxQhM+YbbGwyjnD3CRwRnJ6M
         iaaoYwGm6zQlP08EuRB0pd2zAaITO3upa6tUmNiuEyF9PqSLu5tK9+YO4+DTDQJhssfb
         uUDT09HX1O+iC8xhvsGe4Q4KwL/w+9xi+SN0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778004136; x=1778608936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRuWquNC/y9Oi8holSmNss4ZLk/ie2nyH8NEoX7A+d8=;
        b=Fww0eXlZU9SUBhJYJhTneSSGEJzG3MN5wwr9TU7ZauZQQ+9RfW7qPWeKr6iKYDl+27
         q3MWzak4HalasqkmJm+Y+XY1ufNm07XTEBZNT/R10+MsXIEY3/C4B5P1GdpyS0dJsc8t
         eWdZ2o+uFDECmkkhp73h2yAL1FKlHDyoEV5eCZfH04hk9y74hl0hFFTV0GIuW356SYXs
         AeRawi6TegRyfq4Nsv3ORPBfrLq/d9hYGUwMTvNwLrEGqVdlL6GNMCE7H6dt0r2dC4np
         NV4ONBpmVPvmBS7DwXJx+VMmMjT0wzjSbnv4GFM1kL5E+7u0Ag2mRe33lS+b6sZDL74B
         EUNA==
X-Forwarded-Encrypted: i=1; AFNElJ9JC6Y+DS4BoLyt91cyK1s4/yeiC5asdodjsdG0Qy/UwNRDLNhDHQxLOphY6dFst0yYSC6S4pgBuaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLmSTQT4uNJuKZA0HP9e3S8sDaMiMvhCFv1Tc0X+cGv5HpgaRd
	J8cPtteMwZzfIVRMmE651+zaH1xEnUfZCVEMFhhZAnK6D6blOIsVZLsODVuP1Wcr54I=
X-Gm-Gg: AeBDiesw4wHFtoVAAew6DCUDDJFT2+uW4EkhcpprahUBCGl1jSGdb3DphhnZSq1X2gz
	mcbsDB3oBNxcz/BfAU19i1Uaxn0VAANU54KxmV4X3gURz7V5co1LbTHkCcT8RUZAj3fmh3nm3Jq
	z0tdBT+CX+0gPvileBDs16ac5ds0XSTaJlsbnPshcbmgbL4KQlVyBhuM+5dLFYhs4gWcy08ux4Z
	EyDM3igNzJXACAcebMxiWoLOm2azIN3akA5n1DeZEpFdVuVOdAnh6gU+iPLQF+lc/ow1Xt6JtiV
	MAAcd0/XcTnotFER3uV8+pvHOw+PX/XYzmL3n3x0VG9NJn0WVK7N779lvF6rH6eUXjVGECS8PUs
	mGmKy/l7H42fitn91Vnvb4BDJsBgko9Irao4ldGvU3Ho9B+MncLKuvC6VE1zR6RoJ3s2zRfZ7dz
	/YN6s9qwh/7KvkhzG7NJSzlVSB812idndNemsQ6EEnNA==
X-Received: by 2002:a05:6830:67c5:b0:7de:a2cc:9da2 with SMTP id 46e09a7af769-7dee13a4e13mr9224682a34.15.1778004135963;
        Tue, 05 May 2026 11:02:15 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7decac248d1sm10791568a34.15.2026.05.05.11.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:02:14 -0700 (PDT)
Message-ID: <052eafb8-03f9-48a7-a1b4-4c366f120d51@linuxfoundation.org>
Date: Tue, 5 May 2026 12:02:13 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: vudc: Fix use after free bug in vudc_remove due to
 race condition
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Zheng Wang <zyytlz.wz@163.com>,
 Zheng Hacker <hackerzheng666@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20230317100954.2626573-1-zyytlz.wz@163.com>
 <20260417163552.807548-1-michael.bommarito@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260417163552.807548-1-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2369A4D2750
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com,gmail.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36979-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 4/17/26 10:35, Michael Bommarito wrote:
> This patch follows up Zheng Wang's 2023 report of a use-after-free in
> vudc_remove(). The original thread stalled on Shuah Khan's request for
> runtime testing of the unplug/unbind path. This patch supplies that
> testing and keeps Zheng's original fix shape.
> 
> In vudc_probe(), v_init_timer() binds udc->tr_timer.timer to v_timer().
> usbip_sockfd_store() starts the timer via v_start_timer()/v_kick_timer().
> vudc_remove() can then free the containing struct vudc while the timer is
> still pending or executing.
> 
> KASAN confirms the race on an unpatched x86_64 QEMU guest with
> CONFIG_KASAN=y, CONFIG_USBIP_VUDC=y, CONFIG_USB_ZERO=y, and a tight loop
> that repeatedly writes a socket fd to usbip_sockfd, closes the socket
> pair, and unbinds/rebinds usbip-vudc.0:
> 
>    BUG: KASAN: slab-use-after-free in __run_timer_base.part.0+0x8ba/0x8e0
>    Write of size 8 at addr ffff888001b80740 by task trigger_and_unb/239
>    Allocated by task 239:
>      vudc_probe+0x4d/0xaa0
>    Freed by task 239:
>      kfree+0x18f/0x520
>      device_release_driver_internal+0x388/0x540
>      unbind_store+0xd9/0x100
> 
> This lands in the timer core rather than v_timer() itself because the
> embedded timer_list is being walked after its containing struct vudc has
> already been freed. The underlying lifetime bug is the same one Zheng
> reported.
> 
> With v_stop_timer() called from vudc_remove() and the timer deleted
> synchronously, the same harness completed 5000 bind/unbind iterations
> with no KASAN report.
> 
> Fixes: b6a0ca111867 ("usbip: vudc: Add UDC specific ops")
> Reported-by: Zheng Wang <zyytlz.wz@163.com>
> Closes: https://lore.kernel.org/linux-usb/20230317100954.2626573-1-zyytlz.wz@163.com/
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> ---
>   drivers/usb/usbip/vudc_dev.c      | 1 +
>   drivers/usb/usbip/vudc_transfer.c | 3 ++-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
> index 90383107b660..c5f079c5a1ea 100644
> --- a/drivers/usb/usbip/vudc_dev.c
> +++ b/drivers/usb/usbip/vudc_dev.c
> @@ -632,6 +632,7 @@ void vudc_remove(struct platform_device *pdev)
>   {
>   	struct vudc *udc = platform_get_drvdata(pdev);
>   
> +	v_stop_timer(udc);
>   	usb_del_gadget_udc(&udc->gadget);
>   	cleanup_vudc_hw(udc);
>   	kfree(udc);
> diff --git a/drivers/usb/usbip/vudc_transfer.c b/drivers/usb/usbip/vudc_transfer.c
> index a4f02ea3e3ef..d4ce85c4c6a2 100644
> --- a/drivers/usb/usbip/vudc_transfer.c
> +++ b/drivers/usb/usbip/vudc_transfer.c
> @@ -490,7 +490,8 @@ void v_stop_timer(struct vudc *udc)
>   {
>   	struct transfer_timer *t = &udc->tr_timer;
>   
> -	/* timer itself will take care of stopping */
> +	/* Delete the timer synchronously before teardown frees udc. */
>   	dev_dbg(&udc->pdev->dev, "timer stop");
> +	timer_delete_sync(&t->timer);
>   	t->state = VUDC_TR_STOPPED;
>   }


Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

