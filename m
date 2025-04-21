Return-Path: <linux-usb+bounces-23255-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDCBA94DEC
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 10:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB82D1889E70
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 08:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0389E25B690;
	Mon, 21 Apr 2025 08:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Du3P4IJ5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9C220F069
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 08:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223345; cv=none; b=AhTveUCT4qXl7HuzliDLlJNNS7CaVY2MhbGUxk7IHPff2+ACSvOpfuKts+T1YumIRoYc3qAuHepKijDMz7XyH3gK8xuzSCt4jiSVZ2pfG0XEbOPs/3izvMfL4Wb1UpA21uIFEjRHIoLrlOzmOnbssWE5ZWDINSdM0DX9b1/7I7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223345; c=relaxed/simple;
	bh=PSakre68xMqZqU/n6qy9g4V84MOKdKKSdynHd0YN9qI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wco0c4Zstuh9bKVyVYa7HVgECEAIU+OAYUcmc46fc38pp7DQq9PzdjHISNJnpJgWNdC6Ffv0KbAw45vnzj4cJi6gvgz6DCdsHGtN5OTi+7DX69oNsDZNYqYndHQkJodRNFKVEctRzX0IOPabEHeN17sr1M4kLWXDXtiZqmQJi2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Du3P4IJ5; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54993c68ba0so4411212e87.2
        for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 01:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745223340; x=1745828140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SwSLkKF494EYvtKtsoOT6lfSytCBlFNUt5zSuh5X9TY=;
        b=Du3P4IJ5nOBBX7pBmtIQMLYZlEBJRjLpO354VuwmwnnyzJuohyqRR0v9lzsV5T2e46
         +rOOC4hZN2Ap2iBnFbD8tP9exeiy7CRMN+GGMwRjelUKOCAR+2TDV8SSRQ+QGP2RtyS2
         rJYxybunRmLupUm4m+4QrQXGTq2pO5IaqWmNLvHkFBPFs699cKMRW6rS3wGYlbjz9OL5
         /sg9sUuznSReoeOI+i4CD3nGdR8lWlZci6ut8yNyooKxUwiOpzgynOtbUSDpe0eodGZi
         sEBfy3zVxgCiegjtFDt+XvMYGyERpyKpNmU5DTlVCrTBPm9gTdcEXMAqWNSJ2Vvw+aVw
         m1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223340; x=1745828140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SwSLkKF494EYvtKtsoOT6lfSytCBlFNUt5zSuh5X9TY=;
        b=Rdn1jbeVzTWymFD4/sbz1DQMuTNJsUzCwus4fQlD9lZy204QFJD5fMBuvA9UL1B1kR
         YtHkOLtGD4mMbracajXhSQ/YsbX9ydD6xufpds3W6YpH3H0iPiv7bTAYZqafp85VmuB1
         yGr9ltagATRoNyMV8ENeSQpxaiiE5N6RJsqCaUyMIpe0SOld0/64NDQhOD++By/zbaFe
         PIqz2k5rO16Mtbf10UaHiuxVuwOz+EqfeuvMzlE2vY7C2Q68fTEl0RdHoV5qk9wpj4dr
         ZM6k8vhoG7EzUfO70g68Pg/htMdb0FLC8cgHSgYMReWvFhjSXuaQlmRSVCUENFrA6hkZ
         3EaA==
X-Forwarded-Encrypted: i=1; AJvYcCWZUkIKIakPOtlSpSqdcwDvHpQZ+P5GzH4aZoaeghiKxcfSGn/XtjP6rKcLFdriAWExc5odX5V6HjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqH93pSItiGRYgOkGWLB7F6USYXDvqRyRgv/V8T34ypFacGkLC
	6qIyC21SgeuASXHAw1Rco0I7GUzvsnOFEt7aTWQluMo5IT6yfC95
X-Gm-Gg: ASbGncvFf+0axeH52rp9cXHmP13QvuCTk6Do+SONJJ5bU9qx1CYuBghmfM+40R+LGnX
	dO4cRXc6bjrYoSqVbeXGQ5ooN+nC4V/RpfM7p4qDor57a5yWskHyopcsT8Fd/O7qLWuO0cWQUZw
	8PRcb3osw4CSifd8BRjf87Q/NwuOa3yKQpY65dEpE0ybkJRmtUWig4yY7w+Ow9B1pN6nR+Y8t4A
	ilg5w7JS390WRzzGk0hmyy/Fo4R8aaQ5JuAILunuVpAAedkDLEZkatDhIxB1rr01oeSPWnvTN3P
	oXCdw8knmwGCQ0HsYrvotsl1ZVpUl9/5Lj1Eepy1b/NPeK8awum/Pt0xBmBRuk9GX5YGrqF19pO
	SAnaS
X-Google-Smtp-Source: AGHT+IFdgBJmMUNVNl7WZ+joqGJqxEMuLYH5WvdwfS/Nc57JqkoErOE3BY9bYqAS3Gm6BcQghZkrbQ==
X-Received: by 2002:a05:6512:230c:b0:549:8cc9:67d1 with SMTP id 2adb3069b0e04-54d6e662e27mr3133457e87.38.1745223339388;
        Mon, 21 Apr 2025 01:15:39 -0700 (PDT)
Received: from [192.168.2.145] (109-252-148-237.dynamic.spd-mgts.ru. [109.252.148.237])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-54d6e5f4b02sm865096e87.211.2025.04.21.01.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 01:15:38 -0700 (PDT)
Message-ID: <410a1a6a-d866-44ad-8592-5babd3fe50b1@gmail.com>
Date: Mon, 21 Apr 2025 11:15:37 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: initialize struct otg_fsm earlier
To: "Peter Chen (CIX)" <peter.chen@kernel.org>,
 Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20250417111502.140474-1-oneukum@suse.com>
 <20250421014545.GA3578913@nchen-desktop>
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20250421014545.GA3578913@nchen-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

21.04.2025 04:45, Peter Chen (CIX) пишет:
> On 25-04-17 13:14:54, Oliver Neukum wrote:
>> The earlier fix bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list
>> corruption") in effect hid an issue with intialization.
>> In effect it replaces the racy continous reinitialization
>> of fsm->hnp_polling_work with a delayed one-time
>> initialization.
>>
>> This just makes no sense. As a single initialization
>> is sufficient, the clean solution is just to do it once
>> and do it early enough.
>>
>> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> 
> Add Dmitry.
> 
> I am okay for this change, and see what's the Dmitry's response.

Thanks for notifying me

> Peter
>> ---
>>  drivers/usb/common/usb-otg-fsm.c | 7 +------
>>  drivers/usb/phy/phy-fsl-usb.c    | 1 +
>>  include/linux/usb/otg-fsm.h      | 2 +-
>>  3 files changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/usb/common/usb-otg-fsm.c b/drivers/usb/common/usb-otg-fsm.c
>> index e11803225775..a22d536ccdf8 100644
>> --- a/drivers/usb/common/usb-otg-fsm.c
>> +++ b/drivers/usb/common/usb-otg-fsm.c
>> @@ -117,7 +117,7 @@ static void otg_leave_state(struct otg_fsm *fsm, enum usb_otg_state old_state)
>>  	}
>>  }
>>  
>> -static void otg_hnp_polling_work(struct work_struct *work)
>> +void otg_hnp_polling_work(struct work_struct *work)
>>  {
>>  	struct otg_fsm *fsm = container_of(to_delayed_work(work),
>>  				struct otg_fsm, hnp_polling_work);
>> @@ -193,11 +193,6 @@ static void otg_start_hnp_polling(struct otg_fsm *fsm)
>>  	if (!fsm->host_req_flag)
>>  		return;
>>  
>> -	if (!fsm->hnp_work_inited) {
>> -		INIT_DELAYED_WORK(&fsm->hnp_polling_work, otg_hnp_polling_work);
>> -		fsm->hnp_work_inited = true;
>> -	}
>> -
>>  	schedule_delayed_work(&fsm->hnp_polling_work,
>>  					msecs_to_jiffies(T_HOST_REQ_POLL));
>>  }
>> diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
>> index 40ac68e52cee..7f0fdba689de 100644
>> --- a/drivers/usb/phy/phy-fsl-usb.c
>> +++ b/drivers/usb/phy/phy-fsl-usb.c
>> @@ -845,6 +845,7 @@ int usb_otg_start(struct platform_device *pdev)
>>  
>>  	/* Initialize the state machine structure with default values */
>>  	SET_OTG_STATE(otg_trans, OTG_STATE_UNDEFINED);
>> +	INIT_DELAYED_WORK(&fsm->hnp_polling_work, otg_hnp_polling_work);
>>  	fsm->otg = p_otg->phy.otg;

The original problem was fixed for the ChipIdea driver in the common USB
code, while this phy-fsl-usb is the Freeescale USB driver that has
nothing to do with the ChipIdea and the common code, AFAICT. Hence this
patch should be wrong. I suggest not to change the original logic.


