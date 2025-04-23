Return-Path: <linux-usb+bounces-23381-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC88A98B68
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 15:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 601A3444141
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 13:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FAB1A7AF7;
	Wed, 23 Apr 2025 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYiKbTfT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69691AB530
	for <linux-usb@vger.kernel.org>; Wed, 23 Apr 2025 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415471; cv=none; b=O/eXcEFTPQd4x7mzrNI4iCFQsXksgtEhu1zJ11kiw8cN1UaERvsUCTm8wLr6CJZLuaV2X5MQ/m5mUho3GT9EMGu9VKC+6mhYaxKQyFoNXO7Fejh9zo+/JIXQ/I6wO36datmbEpO6TOLeG6gkW5C938+SDsyOq0AYa3NKVuUuNqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415471; c=relaxed/simple;
	bh=m3+HOIdQ8BcCaJieZgcIY9jqbnEaTKjJC7DXOfV8Y+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZffTaA+Sony/M0HEMa+ze2Z0pYlur3wfGdwqAoT4ai4PkbptAl4OZHj73SKXolzHUWNXkqhgy121ZwrvqfF7EYjEfM7X0vAlj0W3I683l4raXnbwgtS81xNmoazKXaIo6EzvIIgtuy4eH7s9ZVH0nri6gt9miVkF7vT0r8Wazk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYiKbTfT; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-549967c72bcso6746448e87.3
        for <linux-usb@vger.kernel.org>; Wed, 23 Apr 2025 06:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745415468; x=1746020268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WoR20hHHzqvYW0eZR2Ax4ZgW+c4kcr2c1rpdD5pooxM=;
        b=kYiKbTfTjWlIKvIDpAEgEZWQ8VLNXN3uQdY3mHac01mFvX6mJpy4O+fRB5i3e4xQLD
         q/7T64YU4bbClApCr8L1C9rECIBARdiKJOUynNq2FVeXaUpIgCJy3yytIUEXAYVrJyJg
         bwJ1TP9pZ3ctCqhgHP/1v/+AsG013eBGqTjhVhmIN19MLFLLS8SX7fY+EIlXaZl+PHUu
         91ca2O+hdtQ4rdo619qln4tkANtGx2bWulXddliC+KXMLSa3LEvzQbwX/0UHldRr7Ab/
         9+avOo+KVDmiTiVzdUcWQnlbkbmsnVksfJudK1Dv1UL2udSoSchPImA0DWcA7X/jAmb+
         zJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415468; x=1746020268;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WoR20hHHzqvYW0eZR2Ax4ZgW+c4kcr2c1rpdD5pooxM=;
        b=HG2G0KbYQkJyxugv/KqkOcyDwFfq4kUfbo2/xksdQcyU4efoWsL3misEHI9j2muY9f
         sybJPgKPzHnpRCz/e13qagbP+vIYK0qUDBvgmqzhgJgxR3URUisLa6XAOEOvZeUeGtVr
         QW7v1fJd7ey2TtcQcaUUzJy+g8HEPX3u/sMH1CzZBn7wUoH87yyeN8enEUT0OxprZjjO
         +PSEfF1FW0LK7IXTdrfyzGbsGN14MnZwadsZhqx1FKI1AKf1+PSasJjCrGZ488QHQ8JG
         Odmyu3O1JoCQiA/Zk+XuOkEB7ZCGKc5k1sdE12YlnA0CUpkVfj2mE+WBMqrbRSM1D6pi
         I+Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVySi7qh0E2Mj2rfNK8SkPBe2e1mbUZDDtftd5V2SYKcVddEThfGpzBguRsW/J68p/Z1Pyx4uHUDDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG1CgoYMvPyaIS7ubXC/m1S0ZQ5oRjOSm03ePy1bZNGNDvOHxA
	DOvctk2m1pQJNtkosYeBJ0GypTFDUh0mnTqh8dtMzRb+6EqDDt5e
X-Gm-Gg: ASbGncvjS6blGSQNhEwm6errUQtMa8IhqLnrmtaC6BmvVRj3oABYJA74KXA+FArZQpX
	op4OAZqsTGtlLLxbG8c7PPqMyU+hTltI6vV1t92PoJQ0bvxsUAHiNMDT3ZbtYj7uU39Z6w0p/f6
	OWuYQmF3FsCX7HqDYg7qj253NKWy4GAI2yGjdF0q747Qxf5CVx1coIFa2oReqQAC65cioSmzSWv
	Aj8sdDITrS6EGzY0xMYfrEr5BRcpZ5PECylv4F0DFWzSTWqcjKll5JxfJ+yBp8OIqW3LQ5Am2wN
	fkNbMtCRVDnDZr0+TJezkZb2QJnFlN/fIlYggeJpU6pO1O4ZGHVYL3SpMMxF0vOzt4qyjixcGZZ
	zI8o=
X-Google-Smtp-Source: AGHT+IEvZRs4B1AETSH6fJBObMha7mVF5EhXSDxX44QzSh8nbQC1uZZksWvUfuMgNYpBjAdzcWjRgQ==
X-Received: by 2002:a05:6512:ea7:b0:549:4a2d:30af with SMTP id 2adb3069b0e04-54d6e6343b5mr4906770e87.25.1745415467563;
        Wed, 23 Apr 2025 06:37:47 -0700 (PDT)
Received: from [192.168.2.19] (109-252-148-237.dynamic.spd-mgts.ru. [109.252.148.237])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-54d6e5e529esm1538549e87.187.2025.04.23.06.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:37:47 -0700 (PDT)
Message-ID: <ddf2deac-40e5-4738-8c99-31f44767ef70@gmail.com>
Date: Wed, 23 Apr 2025 16:37:46 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: initialize struct otg_fsm earlier
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org
References: <20250417111502.140474-1-oneukum@suse.com>
 <20250421014545.GA3578913@nchen-desktop>
 <410a1a6a-d866-44ad-8592-5babd3fe50b1@gmail.com>
 <20250422012300.GA3584429@nchen-desktop>
From: Dmitry Osipenko <digetx@gmail.com>
Content-Language: en-US
In-Reply-To: <20250422012300.GA3584429@nchen-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

22.04.2025 04:23, Peter Chen (CIX) пишет:
> On 25-04-21 11:15:37, Dmitry Osipenko wrote:
>> 21.04.2025 04:45, Peter Chen (CIX) пишет:
>>> On 25-04-17 13:14:54, Oliver Neukum wrote:
>>>> The earlier fix bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list
>>>> corruption") in effect hid an issue with intialization.
>>>> In effect it replaces the racy continous reinitialization
>>>> of fsm->hnp_polling_work with a delayed one-time
>>>> initialization.
>>>>
>>>> This just makes no sense. As a single initialization
>>>> is sufficient, the clean solution is just to do it once
>>>> and do it early enough.
>>>>
>>>> Signed-off-by: Oliver Neukum <oneukum@suse.com>
>>>
>>> Add Dmitry.
>>>
>>> I am okay for this change, and see what's the Dmitry's response.
>>
>> Thanks for notifying me
>>
>>> Peter
>>>> ---
>>>>  drivers/usb/common/usb-otg-fsm.c | 7 +------
>>>>  drivers/usb/phy/phy-fsl-usb.c    | 1 +
>>>>  include/linux/usb/otg-fsm.h      | 2 +-
>>>>  3 files changed, 3 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/common/usb-otg-fsm.c b/drivers/usb/common/usb-otg-fsm.c
>>>> index e11803225775..a22d536ccdf8 100644
>>>> --- a/drivers/usb/common/usb-otg-fsm.c
>>>> +++ b/drivers/usb/common/usb-otg-fsm.c
>>>> @@ -117,7 +117,7 @@ static void otg_leave_state(struct otg_fsm *fsm, enum usb_otg_state old_state)
>>>>  	}
>>>>  }
>>>>  
>>>> -static void otg_hnp_polling_work(struct work_struct *work)
>>>> +void otg_hnp_polling_work(struct work_struct *work)
>>>>  {
>>>>  	struct otg_fsm *fsm = container_of(to_delayed_work(work),
>>>>  				struct otg_fsm, hnp_polling_work);
>>>> @@ -193,11 +193,6 @@ static void otg_start_hnp_polling(struct otg_fsm *fsm)
>>>>  	if (!fsm->host_req_flag)
>>>>  		return;
>>>>  
>>>> -	if (!fsm->hnp_work_inited) {
>>>> -		INIT_DELAYED_WORK(&fsm->hnp_polling_work, otg_hnp_polling_work);
>>>> -		fsm->hnp_work_inited = true;
>>>> -	}
>>>> -
>>>>  	schedule_delayed_work(&fsm->hnp_polling_work,
>>>>  					msecs_to_jiffies(T_HOST_REQ_POLL));
>>>>  }
>>>> diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
>>>> index 40ac68e52cee..7f0fdba689de 100644
>>>> --- a/drivers/usb/phy/phy-fsl-usb.c
>>>> +++ b/drivers/usb/phy/phy-fsl-usb.c
>>>> @@ -845,6 +845,7 @@ int usb_otg_start(struct platform_device *pdev)
>>>>  
>>>>  	/* Initialize the state machine structure with default values */
>>>>  	SET_OTG_STATE(otg_trans, OTG_STATE_UNDEFINED);
>>>> +	INIT_DELAYED_WORK(&fsm->hnp_polling_work, otg_hnp_polling_work);
>>>>  	fsm->otg = p_otg->phy.otg;
>>
>> The original problem was fixed for the ChipIdea driver in the common USB
>> code, while this phy-fsl-usb is the Freeescale USB driver that has
>> nothing to do with the ChipIdea and the common code, AFAICT. Hence this
>> patch should be wrong. I suggest not to change the original logic.
>>
> 
> Thanks for confirming it.  I did not check the user for OTG FSM
> carefully since there are no active users long time.
> 
> I have checked that the phy-fsl-usb has not used hnp polling,
> and the fsm->host_req_flag is not allocated. The chipidea driver is
> the only user for hnp polling, so this patch is not needed.
> .
> By the way, I just curious that are there any products in market still
> use OTG FSM?

There are older devices supported by mainline kernel that can make use
of OTG FSM, but these devices likely are relevant to hobbyists only.
Otherwise, I'm not aware of products actively using OTG FSM.

