Return-Path: <linux-usb+bounces-13491-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEB8952883
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 06:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF233B22C09
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 04:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD8C3FBB3;
	Thu, 15 Aug 2024 04:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WyqYkHzv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30B3405C9
	for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 04:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723696054; cv=none; b=JxTeLmXx43idZvJBw4HXim0KabgyIAs/NuUTZmKkaqSm1Uy6lJ0opyXtnxQuirJddOLo8lLteqLaDeXTJO0pVzZu+0XdzsYtCacgj0dOWW5Xfm5VIvEzLs3wcp7r7Myh+IGAEVTIJ//i1hEfMy9yz4D+XkdN0AA8Hyk38bKFkvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723696054; c=relaxed/simple;
	bh=tYZD9A0HM/95pmAJ7AMl+OiU5oNA6Fme+4d9c8qPZgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G1ILHrPJY/S9NE6KWAgDWGO8k68leGO8txSoeP9uOY6LA0janhO9MX3ZLX1/GB4rGLf7o2AQcby93uHoVhtAgQJ3pEZ7RBIAJu1k/I65IDXydDwsi3agiOU7zKPx/otdsjdFTtwM+v1Y+nrap29z44STMHemA5GjsUGoDu6ITQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WyqYkHzv; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-26b5173e861so353383fac.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2024 21:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723696052; x=1724300852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8/Id/EUvYIikfHBhIlRdALTTVRPkkouWiJiIcJo9Xao=;
        b=WyqYkHzv4mnXjjbwpOa4Ed44dreNdeJBzwZ4qtc60OL139nMbpK6fzsntdQx18GNzK
         +08iY2U6GjImzXOiIySC1bRPxUg4FAgWmm75bgTSK5KvaR+KhqmWIny4kObqeCjDqqfi
         dA2du+iZAO9w7RhheFLXKDA12EqtSvKOix3Iwb0NgdyYRxZPvqOJ2l4tNUomjzCbBKOm
         Gl4tWFuwoiZZJGnssWn2viGmEpagx0FR7lp81fz16dcm97xVxwDs/uHyznzoomBGQy9O
         TWxxQLGfkFhiHPwoaG7S0mGVufqz0vclvNIdFB8Tylt+yf6su/NVIar3x0WrJJbpuK+w
         Qbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723696052; x=1724300852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/Id/EUvYIikfHBhIlRdALTTVRPkkouWiJiIcJo9Xao=;
        b=aQYI8/Dz9qGFbdhatbi2ALftiOVSaNaglPbJmfQX8soqLvwYHqruILuaDTPYXXHB8H
         y3iiX4lf510gxO55+hbWxc6HIg6UJd/CtJI1HmILyko6m7u4kxKkSPjdZ+A2quIIGpZK
         Taid57IdXlEH102vP/+c2RpL7lLldWbkDQN08pbhGKa85/ds02qEUCOUHrMRcWF6nUtm
         c+SS6B/BRkNFgzlbCJBy8X5m0fdv85yv+ZYON9gVamqTHO6P5GzGvMVhsqrx5+hj0UM3
         3ywAKeHPTyeRLAw3m8ZSiAnEzA0INTv5MApBbAqv1+7PDBIZxe/gU5ke6aA/xlxpPpBD
         BhTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpFEdqtZAsonUkjH5TberTE7ZdYifKUSAXAcnWJqc6663Gpu2KDwXhsLFrUpLI6bDwiBPwRPmyvgsqqUps2e+WZ+Ay49Yfy74d
X-Gm-Message-State: AOJu0YwVHAklxfrynkeR44VMY7TGgaJ+OK3MS2IPQjATgw/e0Uds3ity
	D/+UPR2+aC1UltZLyHuLRIcH5BhSV71ganEhIDCeKByC89HFVWbi3sPKL2jTiQ==
X-Google-Smtp-Source: AGHT+IH0h5U/bPhlnmk5b3zsDLMzE0JExVtm3z2RlvIlWYuEUmFRoqWT5giXLb5xuE/BSS7SI0OmAg==
X-Received: by 2002:a05:6870:724c:b0:25d:f984:640 with SMTP id 586e51a60fabf-26fe5aa6c06mr5970143fac.24.1723696046951;
        Wed, 14 Aug 2024 21:27:26 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e14:7:cca1:216f:2796:1b10? ([2a00:79e0:2e14:7:cca1:216f:2796:1b10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af1be5asm356858b3a.176.2024.08.14.21.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 21:27:26 -0700 (PDT)
Message-ID: <d95fce97-61f5-4a0d-a3c9-52df50bfa820@google.com>
Date: Wed, 14 Aug 2024 21:27:24 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] usb: roles: add lockdep class key to struct
 usb_role_switch
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kyletso@google.com,
 rdbabiera@google.com
References: <20240813224216.132619-1-amitsd@google.com>
 <2024081450-triage-glorious-cba5@gregkh>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <2024081450-triage-glorious-cba5@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/13/24 9:49 PM, Greg KH wrote:
> On Tue, Aug 13, 2024 at 03:42:11PM -0700, Amit Sunil Dhamne wrote:
>> There can be multiple role switch devices running on a platform. Given
>> that lockdep is not capable of differentiating between locks of
>> different instances, false positive warnings for circular locking are
>> reported. To prevent this, register unique lockdep key for each of the
>> individual instances.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   drivers/usb/roles/class.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
>> index d7aa913ceb8a..807a8f18ec20 100644
>> --- a/drivers/usb/roles/class.c
>> +++ b/drivers/usb/roles/class.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/usb/role.h>
>>   #include <linux/property.h>
>>   #include <linux/device.h>
>> +#include <linux/lockdep.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>>   #include <linux/slab.h>
>> @@ -33,6 +34,10 @@ struct usb_role_switch {
>>   	usb_role_switch_set_t set;
>>   	usb_role_switch_get_t get;
>>   	bool allow_userspace_control;
>> +
>> +#ifdef CONFIG_LOCKDEP
>> +	struct lock_class_key key;
>> +#endif
> Please do not put #ifdef lines in .c files, they are not needed for this
> change to work properly, right?
That's right. I will correct it in the next revision.
>
> checkpatch should have complained about this...

Unfortunately it didn't complain.

Thanks,

Amit

>
> thanks,
>
> greg k-h

