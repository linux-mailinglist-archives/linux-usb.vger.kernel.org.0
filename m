Return-Path: <linux-usb+bounces-6242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C5A8513F2
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 14:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B60241C22587
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 13:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1234E3A1C5;
	Mon, 12 Feb 2024 12:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UfTZ2gFK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860C73A8CF
	for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 12:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707742789; cv=none; b=qHxJj+rBQCLxdYo0yndhI5fW+2yZJtVSo6CWlmGAXnj70vnXtJIwem1RJ4EVVInMGw5FmEa8tqrGHPr0+LqAJumZAULbDnnTdZgmrtkPr2rKooCiF8jHpi0HW+NJmxfQYeDtTTXV0jxdKJKufp2Khv90uFrNHS611NvkJGUNwMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707742789; c=relaxed/simple;
	bh=EqqjEOQQZEKD6KaE/SmC7xsYnekc2wdhm9IJ7ELbuEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lg7Ticvnl5iwszlDmqEwgmYCAQCI9YaOGh+qRWllaHvapuaevkJLsPjWFuoTwhKhkAzQ2arZTepbMSHEuZ4Y+D0hx4hXBUFAx0GhnPisxhKsJ6i/j0hE8t3aQr1nmrCg0nTRUyVwJsJ/wpJbVcNCEM4vt8cLdfDMt+vhBwnqraM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UfTZ2gFK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a3ccea0d75fso61138066b.1
        for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 04:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707742785; x=1708347585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VcH6J83/WN6D/iN2ZpVcBic+paBuINog2RogsRdoeF4=;
        b=UfTZ2gFKbesBHwr14rqt64e9jhx0Ye8hRFFK74zzTajcn4KuI6STKn/VhWAbaA9vt/
         DEJfYdKWGxo5aEiIX5fS4oCH4aIrmrwPXbHL/1gHncclDbe0ioa36/80E/ODbdK97bx9
         1Yigqw7MF+K6hEV/XbZP5bZKn7Uim+54OFSVly6mk/DNeRSYn4A7HzJUtpxJXcYtdDEV
         dMcXCIWjlyg07asjhtTGXSoVgrVxkA2zbGuBqjPZGW5s+vvA/Lg1yJQ4CHyPNH8Hpqmo
         1USSTRMyD8Q/JKDtPZciMXu2yCjrsdk6JHgfgU3FUcHrYRPlca0O54dTFrw/PZEM/A5q
         27Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707742785; x=1708347585;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VcH6J83/WN6D/iN2ZpVcBic+paBuINog2RogsRdoeF4=;
        b=RDgKN9+KFfpriOmLrOmrwZpQcDcOUSTFuWd/O+GkoyiTDKam94dnBvtif9nuWJc9NX
         1ElqV4v83xau/JPtJZmmtJr5scyaVuLADvnMdZXKGNPXPFgRTKfC3EsUauzxgYaZ1vRt
         D6behnSk+pu7w35nQlIRs2K26BGtPuBB7RwTB7swzRf8DOybOzIbqzkaIZKTH+myBOWc
         v0MnDfkR1X9ikvXcAfPuCL6+fiM/y5iFQW2HnDCH9heCEAkWhYOR2HoHsFzgjqFXugN0
         dL7dDRyJwtqZfVjWJxNxTaSfVsxBmJmzDgQPYGiQGT0OIRgz4d13d0PHLvmb8B684E0w
         G34A==
X-Forwarded-Encrypted: i=1; AJvYcCVutDceva0EY6FlV1vAVREey970HW4z6PSwSoEYIEUdO/FKU1FuS5o+QtbZRdnDCAlrPyRb4cBkstTmJXTKhju6J5V8F7Dx/P+x
X-Gm-Message-State: AOJu0Yz0j2NFfSDDIxQrGnH6/cerGV+xKvsRIMwzgbrq3Uys8obT8Urn
	DYj/0Myao+FX0BRaExrCLxUCljHUR1Eh6pGqkWRDhRy91xqU6Q1Gze++uR5Za3Q=
X-Google-Smtp-Source: AGHT+IGbYCo/JpjzQMdIPEDKf5u5JH1bM6sz7JwpwwYe7izGaPzNnVKPzMfVjWjWDsMIC0m8WKFBiA==
X-Received: by 2002:a17:906:dfd1:b0:a3b:fd6e:c725 with SMTP id jt17-20020a170906dfd100b00a3bfd6ec725mr3893304ejc.52.1707742784710;
        Mon, 12 Feb 2024 04:59:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1b1V6vmEFbbIFKQYiHbuOWWAvb2gobzFZtKUrQVfkeWIcV3IUjBsJo9PQ7xHUFWao2NyMBKbFPs3x3AHNZpyZ7qB5egns2/ka67jKmsm6Mk9Tx0Sn4LS95A8Sqsg2K9JEOLe/aueyugasMSRC5UJuZZ+P8VYpMyUQzpVhZkLQ/lmVGgEzf0rUEC7uAZwQj/EzuzgPT7qMKj7JiIM=
Received: from [192.168.192.135] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id u19-20020a1709064ad300b00a381a3a7081sm182224ejt.156.2024.02.12.04.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 04:59:44 -0800 (PST)
Message-ID: <99749541-25bd-4cd7-be5d-e440472c6f0f@linaro.org>
Date: Mon, 12 Feb 2024 13:59:42 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: fsa4480: Check if the chip is really there
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240212-topic-fs4480_check-v1-1-d9969e4d6f9a@linaro.org>
 <2024021210-bacteria-camping-7e48@gregkh>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <2024021210-bacteria-camping-7e48@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2024 13:48, Greg Kroah-Hartman wrote:
> On Mon, Feb 12, 2024 at 01:01:30PM +0100, Konrad Dybcio wrote:
>> Currently, the driver will happily register the switch/mux devices, and
>> so long as the i2c master doesn't complain, the user would never know
>> there's something wrong.
>>
>> Add a device id check (based on [1]) and return -ENODEV if the read
>> fails or returns nonsense.
>>
>> Checking the value on a Qualcomm SM6115P-based Lenovo Tab P11 tablet,
>> the ID mentioned in the datasheet does indeed show up:
>>  fsa4480 1-0042: Found FSA4480 v1.1 (Vendor ID = 0)
>>
>> [1] https://www.onsemi.com/pdf/datasheet/fsa4480-d.pdf
>>
>> Fixes: 1dc246320c6b ("usb: typec: mux: Add On Semi fsa4480 driver")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/usb/typec/mux/fsa4480.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
>> index cb7cdf90cb0a..d622f4f3bd54 100644
>> --- a/drivers/usb/typec/mux/fsa4480.c
>> +++ b/drivers/usb/typec/mux/fsa4480.c
>> @@ -13,6 +13,10 @@
>>  #include <linux/usb/typec_dp.h>
>>  #include <linux/usb/typec_mux.h>
>>  
>> +#define FSA4480_DEVICE_ID	0x00
>> + #define DEVICE_ID_VENDOR_ID	GENMASK(7, 6)
>> + #define DEVICE_ID_VERSION_ID	GENMASK(5, 3)
>> + #define DEVICE_ID_REV_ID	GENMASK(2, 0)
> 
> Why the indent?

In many places across the kernel, bitfields or possible values of a
register are defined with an indentation to emphasize the relation between
the defines

> 
> And those are _VERY_ generic #defines, please give a better name for
> these so you don't conflict with other stuff in the kernel accidentally.

If you don't mind them becoming very long, I can prepend them with FSA4480_,
and I suppose shrink 'VENDOR' to "VEN" and "VERSION" to "VER" to compensate

Konrad

