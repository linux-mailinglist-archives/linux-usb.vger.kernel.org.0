Return-Path: <linux-usb+bounces-30931-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C45A8C87AC1
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 02:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B76A4E127E
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 01:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F472F7AC5;
	Wed, 26 Nov 2025 01:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pxpSk3bT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4798C1DA0E1
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 01:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764119971; cv=none; b=QmuOtHJ85DysCslm4gSjOEmSbvcEik7SBy9Hp+4oFBGWmDHWg4YSL08v6B9/VeerraUhjZLu8e07nmKxWX6JORajeQTbksi1kibQ8lRBRZAtHpQlI6+p6RCRHW7DUbj0oOVc+OLv2abrKWB5X6znYC2LizvzCDFHTQgHO6EJ+mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764119971; c=relaxed/simple;
	bh=G7ZNDNiR8Djja/TvyR9CLyYYZM1cA+rALARCuQmH59Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRxy7PPiWho6zbBEvXbSAYX0J5mImwMjE3w1vTWTERKuFRDGnLUx7PX+I3yTQotp+IDBBc7dMTSNlaM/+Sjnc1J3dvZzLW6rs9XJHGOXM7gybhjnQhwP9QWLjpR5G7zWuQ4Y5qqowpN87/0g9iUNuQOQ91duSUUuDtEdmI5EKwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pxpSk3bT; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bc1f6dfeb3dso3670869a12.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 17:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764119967; x=1764724767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONQMnRlPCQWGLqZuet9LBiEJ0IZkYpFPjI5nCq6R0G0=;
        b=pxpSk3bTCdrqI0/hGfTwDSWmA1Ae/c6VVXHVR6i7LxRQ1XjdCPQt5Xw36GS3uFW2Db
         yh9fdw0KUKP8Fy+nZv/8zMkTgEmjk1MARz9zK2UlqXsVF2gQIacY+4JFyK7HhhH4JTDh
         bla1WZUox51rprOi+n0Ma0omV7K49ntby/qKxfXjNo+kLSSthSTbcZYRkDXSJCIng2Ra
         9MdWyGnosmOwR4NGRgipUhaSkcU1noLKZWMkR0/anT/EcjlTlMDZ9IbnolLHmozJqOFP
         pAG26EhmHanwv0eqaSfhTuBi/cou30WvJ/EYMHUKOPMRmI68o6LiJ6i2UcEl0Cmwu8ln
         CkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764119967; x=1764724767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONQMnRlPCQWGLqZuet9LBiEJ0IZkYpFPjI5nCq6R0G0=;
        b=q4oXs2Ttiq8lCisO2WrI+mjThQ/iKa1bYbXteOZqp6ORVRqlgbp0yHrWyMjdmSM1y2
         IqlzXnYIC7ucu4PTtOwqcqIF8hgLWEqHALFe6Rx1xuW1rnjthsB+z6Ftr4o1w7+SG8hh
         Cj9UtEt4EJDu66C4FmxzXG076XD4jjeg6nnju62vF923bK94N7ZKXhzxtCdTR+SvCUjm
         qjnvTsVdnT496NRfMoiAbXWniAkO3DLU7jEi5t9EYZ9LKtXnKBajtbOuCuhlfFSPfcaO
         /i/N1f4rUPpLAVJT8lMZW08eIRq7TsFNHK9hdrf2nGRXNV+zANOb/8UHoPdtIgcZ771d
         RPcA==
X-Forwarded-Encrypted: i=1; AJvYcCX6y1wpGGUXvsqLFOgwx++kv1fl4mX+4V2+cNUuTfmJed1Yq/2WKewZKoc6hIW6odZtmkkH4Xroknk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMbA7SsCsT+HL+AymKcxNCviiJNUasLKq/9fgp9v6x6FJ6Ewld
	klQJaZJ5wb7Pepdx2Ao7R9ZnxXN+6SP0IIflC3mayU2o7QMsGbKh8Bdh+toJA67AoQ==
X-Gm-Gg: ASbGnctohus6i1U156KO71zqFSebdrjhMe/sm9kCPY188mPdSgWzUye5nIdQWUjZ5eQ
	f5SXrDteANIxsDfDHwbGsGVP6n/BVodCHM74eRa06krT8yHnvGw2WP7xQa7nNnxRAz/u20fYIO9
	oxe5T+fDDLJmNK40tOOJSUeSquHYxMF58c1OxhNGrCIgM/b/Wvn7vxEXwzm4cT5vYDoghkv9mGT
	3VJ0+5t4Pkq1CifE5q0Tl7o1ZpJ5hNL/PgrkBSD7ELmWCXLDMfgKfGxRGeHytSypyd8H3yOUjKq
	7nzbMpaffELE9nWMbQs/M7PaonRzOeW50MftyqAiDsWaPERpamfJscVB37ahTtOqUwv860ngXa9
	H5FhRc32S3REO37GtXW5wMCQmhN6Nksq5gX/l4OS+Nc2CE/ufQdeqahrSvb3obivFuDR01KLiiW
	CYvcZ0hGp0u/Ie8H0pqtwlbqKEpjHXzDQMyJncFsONQrHjBSUScXIGnAOh8AsMT2ZlZIm+C8cFF
	v4zalIsjBHUBg==
X-Google-Smtp-Source: AGHT+IG7vAAdnJdBV1xPAxMSocFYLV08aRb8J8ZFA9YU4wW1fgRuVRFaXJs0v7uY7YYTEmsaJSmrhw==
X-Received: by 2002:a05:7301:da82:b0:2a4:4e8f:5861 with SMTP id 5a478bee46e88-2a94188c7d0mr2414680eec.28.1764119967060;
        Tue, 25 Nov 2025 17:19:27 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30? ([2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm95954083eec.2.2025.11.25.17.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 17:19:26 -0800 (PST)
Message-ID: <bb2ecf99-6153-4623-81ae-0fd41e4d306a@google.com>
Date: Tue, 25 Nov 2025 17:19:25 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: max77759: modify irq configs
To: Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
 <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
 <d2184e6b-ba22-423a-8d3c-3b8c2f8ec329@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <d2184e6b-ba22-423a-8d3c-3b8c2f8ec329@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/23/25 11:39 PM, Krzysztof Kozlowski wrote:
> On 24/11/2025 07:21, André Draszik wrote:
>>>   	if (ret)
>>>   		return dev_err_probe(&client->dev, ret,
>>>   				     "MAX77759_MAXQ_INT_APCMDRESI failed\n");
>>> @@ -633,7 +643,7 @@ static int max77759_probe(struct i2c_client *client)
>>>   		return dev_err_probe(&client->dev, -EINVAL,
>>>   				     "invalid IRQ: %d\n", client->irq);
>>>   
>>> -	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
>>> +	irq_flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_LOW;
>> I don't believe IRQF_TRIGGER_LOW should be added here, as this is board-specific.
>> The polarity is meant to be set via DT (and the only current user of this driver
>> does so).
>>
> If this is the main chip interrupt, then you are right and the code is
> obviously wrong. What's more, it is completely unexplained in the commit
> msg, because that vague statement cannot be taken as any reasonable
> explanation.

You are right. As discussed in the thread with André, I will drop this 
particular change in the next rev.

BR,

Amit

>
> Best regards,
> Krzysztof

