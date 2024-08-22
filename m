Return-Path: <linux-usb+bounces-13911-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF6E95C0EC
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 00:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E28D2B23A57
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 22:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4CC1D1753;
	Thu, 22 Aug 2024 22:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WQfzCta/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B46916C854
	for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 22:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724365976; cv=none; b=qFNF/bw+sg3NY5G/o+xLg7vOLe8HVAU284uP4XOYkmgbjJgZuq304DiqtS3j3HMkvx7eq9QDJR4swinTyqcJ3D7JP+Ve+kPRigRH5XfNvva3kOHkTgLrLajqn8F5m6XjBeRfMoJ1Uqi0ECEBiS7Mjavn8W/3fdYqErbmWDv26TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724365976; c=relaxed/simple;
	bh=jjNEYIJjV7wLmSkgW8D/PpldQP8vvg+WqFnbk1lLTxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=coHOkkYC/4x97f5cEMDIiDaeBV+CLYie7u6BFu7lCipRFdy1p+8XLrQfMblJt51RO05HqXe7xL68Qp8pB5rXyy95hHsheJlxPR4KGjaicHVwEh4ryR0wy1345t8DiexnrKBCs51j9oMD9wN1JmNduNruEQXTdlFzBP/HN/DarxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WQfzCta/; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7141e20e31cso1201651b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 15:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724365972; x=1724970772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g0SGX9Qic7oGEJeTajtwD9J1G1sxL5DtesXFFxJmbgA=;
        b=WQfzCta/CHC9qV+SRjQcstYXGJXU1S8H8iRo+8kZjJdeBGsvwe+SGAbR7s2xwn8Ta0
         i8tCtA/ceCVYEmTXl5/OTOo/VN4eBWycpPGLKnJXKshQ6/NhT3OaOxJnbmTHlO8uP2ok
         6EDxmShBnLwVyt2o2WwjlKUb5N2RC9T9URww5iTyIAqWjloXMTDyrH+5TUyBww2y9oED
         vZB8aeDxd/SASs9X49fLyx1info7hUs1nwPLM3JbpWdLudqtDFMnCprAGGUC4Al5gv6b
         oEHos+37rB3RWPGiO5QC3Hp0c/7/BFuyWkBziG6bF21wz5UMh8CNHFRyqauzfCnlrLDT
         EA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724365972; x=1724970772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0SGX9Qic7oGEJeTajtwD9J1G1sxL5DtesXFFxJmbgA=;
        b=NCCZqObJlZTyUQoSjLXEEVrRfYIounKqb5j2g4YmWb8RuvW5xTXKb/We2Bd+xtQPyw
         S6H/ccKTbgbuYLBMm2YdbBvLmjzg+I6tETgKyfwlD40frMnqrm8ezHMKaBWf5dBSCVSn
         ZwTkfYOWelCvl+3LmeiAmWzF9yMVTaat78A9wVDHsnRzlD7Gnpt61+ypyLQ2IdBd8N5J
         Z0aoOO5FI0vGtxvpbHipZQBlBOSxwDpd/TP+vFbENguvLsy8JqV939Ucq0ZRnEbYEX89
         3MTN3OeLjX01Wkxhv1uBZFKd0ny9vc+sZOQjygZeDNvPFjFdvH8acwhDF0mfQQXoXyQD
         V6OA==
X-Forwarded-Encrypted: i=1; AJvYcCWfV7dKtfbEyCXgEjn8B7IwrowQyuaCToWcS0PDrW/ceqVEQyUEid3oCS0R3otYa8R5Cl/3VmFKphw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8nVUFBkg26pio9MVRFAxucOgNhH91/d9YhW26mIPbTX7mU9sm
	nCVjM/Ptd/k2dcMLpwm/21xkBtAfhP6z0lncFrRnzRsEpHzKNgcn1yXPaKGf4Q==
X-Google-Smtp-Source: AGHT+IGDh72YlPkNyQ2tuSQTpoBIda6bDv9JUBcCL4Xo24/6A7mMJ/NWocDDKXYLcgtv1Q47esMLow==
X-Received: by 2002:a05:6a00:9458:b0:714:1ca1:7134 with SMTP id d2e1a72fcca58-714457c32a2mr538450b3a.18.1724365972138;
        Thu, 22 Aug 2024 15:32:52 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e14:7:f4ac:2ba7:c568:c06b? ([2a00:79e0:2e14:7:f4ac:2ba7:c568:c06b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434fe94b0sm1774022b3a.103.2024.08.22.15.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 15:32:51 -0700 (PDT)
Message-ID: <da8ba5d8-b22e-4bdb-9a49-c89df97713a2@google.com>
Date: Thu, 22 Aug 2024 15:32:49 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: roles: add lockdep class key to struct
 usb_role_switch
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kyletso@google.com,
 rdbabiera@google.com
References: <20240815044058.1493751-1-amitsd@google.com>
 <2024081549-lusty-boondocks-00e4@gregkh>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <2024081549-lusty-boondocks-00e4@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/14/24 10:06 PM, Greg KH wrote:
> On Wed, Aug 14, 2024 at 09:40:55PM -0700, Amit Sunil Dhamne wrote:
>> There can be multiple role switch devices running on a platform. Given
>> that lockdep is not capable of differentiating between locks of
>> different instances, false positive warnings for circular locking are
>> reported. To prevent this, register unique lockdep key for each of the
>> individual instances.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>> v1->v2
>> - Avoid usage of ifdefs.
>> ---
>>   drivers/usb/roles/class.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
>> index d7aa913ceb8a..9dbe9f6bea83 100644
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
>> @@ -33,6 +34,8 @@ struct usb_role_switch {
>>   	usb_role_switch_set_t set;
>>   	usb_role_switch_get_t get;
>>   	bool allow_userspace_control;
>> +
>> +	struct lock_class_key key;
>>   };
>>   
>>   #define to_role_switch(d)	container_of(d, struct usb_role_switch, dev)
>> @@ -396,6 +399,11 @@ usb_role_switch_register(struct device *parent,
>>   
>>   	sw->registered = true;
>>   
>> +	if (IS_ENABLED(CONFIG_LOCKDEP)) {
> Why is this if statement needed at all?

Upon closer look it's redundant. Unfortunately, I missed the different 
definitions for the lockdep API & structs based on CONFIG_LOCKDEP in hdr 
file.

Will be more careful next time.

>
> Please get someone internal to your company/group to review the change
> before sending it out for others to find the obvious issues with it.
> That's what your peers are for.  Please do so and get them to provide a
> reviewed-by on it before submitting it again.

Sounds good. I will send the next revision with reviewed-by signature 
from a peer.


Thanks,

Amit

> thanks,
>
> greg k-h

