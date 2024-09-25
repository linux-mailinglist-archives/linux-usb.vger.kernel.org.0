Return-Path: <linux-usb+bounces-15409-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 122A398510C
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 04:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4295C1C21753
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 02:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BC01494C3;
	Wed, 25 Sep 2024 02:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MtAgPLJ/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CD6647
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 02:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727232267; cv=none; b=Ypp3vt8IJ8KQPf63MoDoFA56g6gxhzw96sAV0vTH3uuYvRShVjs5Hy5GYGxRE7uLyf+YXrOtMvUDhHQQd6EfU0wZonyJfxo4pyOvWQMxWQBH++6UkGPqL3i9mLwHXTh/xDpIiUkD5sU04FpGM6JY+w0G4NGFu4OP5XrXPUGmzqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727232267; c=relaxed/simple;
	bh=n4vzVMJk/wnTZoLjPI6/94113lyUB4lEeWRcZRd99M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgrlpFkWfxUDEj6epCh0v+uljIcLwCDgi4UTywb+j7Q2/ZqnrwFJyaOrowSXdqRG7EnktieuXm9aUNbg/T8Z8aLZlynKEfImlMHoJDaPOmEHfmb4muBYxB/53VtitFWhZ6W6us+hjS08FLU5qmLjO30x1Qa1NPoymnGKrnEpQCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MtAgPLJ/; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b01da232aso930025ad.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 19:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727232264; x=1727837064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5u9fJUNtEJazJzPyTQOtG1FO6Z7cS1MgX+7pZ8RK+ts=;
        b=MtAgPLJ/8BNj+j2n9NpzgVXS/nyxj2z1pFBVCFeRJUWGOoZBxWjaO66AKIce/xlX3k
         L2jF2mNAmIvH9XI9h6/Djskf461Zxa+me8ksgNS5cb0Kgd16NsljUIen50E+ReCWhtUK
         YOaR9rZzKUHbEOKCRbXA9NIBQcmO1vomUxxNXqPBTzYocYdWrQhndHZsPX7S9fiYIYja
         shjcrrC56nlpOT/7hk0hbtKB10SUcxUizR3rpDrmHpSX6ua5IojtY6K3iNW8jd5y5YkW
         7B+Jtr1SpOVS/HcDI+tUZyPNP2QrHBSb3JiXqIgzaW+5mGnhDek9V9IGhOgmMvOV/o3G
         DBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727232264; x=1727837064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5u9fJUNtEJazJzPyTQOtG1FO6Z7cS1MgX+7pZ8RK+ts=;
        b=AATydDP9+FHay11cdGfYKrJzHFE0LMrJg0AnW5uIh/qSGOOA1m9/SE4bNgzmVL/BJl
         GW5RUV8CzASxoLpBl3pJT/KRTec55qqOVqC4a5vKXY6fZyhYguJeWnZNqG1gG12o2dBh
         3JH02ko9ygbD51Ct4YbK713Ebp9slFXQA6rK9CU8iVuGckdvWvS9dg6E/v2mtD/df7Tb
         m3imKOcCo7iu4V+UNKeKFHocbFPgBz54Mec+MQVk9h8zWU12rBUYJ5/HtMeLChzk9U89
         hH3TpYlQSgzAhnOpztl57mSwoRO4sbiVt0REI9dg569E6AACJZ18sWq/4wPCfFTpKnya
         LWrg==
X-Forwarded-Encrypted: i=1; AJvYcCX6oY5aXFHPcdT5YSqLqqoE+CnSLgbqZgKbqWocyGtfyf2kUSkin6OiGdcqpc6Fxrz/ARlXo6u02K8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeMXWZH56uT21j6j2FqG4V1aBmgW/q09X57AXiO/+kAcYGCBhC
	7x8AnGrDXcdSpKbA6+adY2FjwEiG3PR+2I+QAxR71i1kXIJmpu5VMPFKqWAtDQ==
X-Google-Smtp-Source: AGHT+IFOu3sATw4O+ghyS7x5azvPQ4AJoo6YIcBuz/3H73r9HL0ro3DSjKBapUQ9ynom5wab2GLyuQ==
X-Received: by 2002:a17:902:f644:b0:207:3a4c:8c6f with SMTP id d9443c01a7336-20afc436639mr16594225ad.29.1727232264093;
        Tue, 24 Sep 2024 19:44:24 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e14:8:32ad:6c37:2d1:220a? ([2a00:79e0:2e14:8:32ad:6c37:2d1:220a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af1859c00sm15796035ad.286.2024.09.24.19.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 19:44:23 -0700 (PDT)
Message-ID: <d72cc89a-7f73-4294-927e-48e647e37310@google.com>
Date: Tue, 24 Sep 2024 19:44:19 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 2/2] usb: typec: tcpm: Add support for parsing time dt
 properties
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
 badhri@google.com, kyletso@google.com, rdbabiera@google.com,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240923224059.3674414-1-amitsd@google.com>
 <20240923224059.3674414-3-amitsd@google.com>
 <ZvK2slBHR8PhzaMt@kuha.fi.intel.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <ZvK2slBHR8PhzaMt@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Heikki,

On 9/24/24 5:55 AM, Heikki Krogerus wrote:
> Hi,
>
>> @@ -7611,10 +7650,13 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>>   	err = tcpm_fw_get_caps(port, tcpc->fwnode);
>>   	if (err < 0)
>>   		goto out_destroy_wq;
>> +
>
> This extra newline is not relevant or necessary. Otherwise this LGTM:

Thanks for reviewing! Please let me know if I should upload a new set or 
this is alright at this time?

--

Amit

>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>
>>   	err = tcpm_fw_get_snk_vdos(port, tcpc->fwnode);
>>   	if (err < 0)
>>   		goto out_destroy_wq;
>>   
>> +	tcpm_fw_get_timings(port, tcpc->fwnode);
>> +
>>   	port->try_role = port->typec_caps.prefer_role;
>>   
>>   	port->typec_caps.revision = 0x0120;	/* Type-C spec release 1.2 */
> thanks,
>

