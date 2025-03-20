Return-Path: <linux-usb+bounces-21983-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5653AA6AED8
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 20:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B94D486245
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 19:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9450722A7E8;
	Thu, 20 Mar 2025 19:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rOpet2k+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3EA2288EA
	for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 19:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742499926; cv=none; b=RNN5HMAwcWuvT8G2VJbjKW2YnNwhEAO8B2OGiIBzTi0h7kp8vlhhzsc6iF6cLUWpNmF32glHMCOTjpDiykJ75jjMTTMnFwPFVMIPIBSEsw1S+kW+1kB06X6Eh42smuV2D9anBDn8uZbgimJdPapodepmuIKCxxjDAVjN09MbV68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742499926; c=relaxed/simple;
	bh=KThe2nutzd9mqonkSKay3Hl9cUyVPIB7fcY6wCFZQdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmRScxoizCHyLVQwNreQ+6FnZ9lOhAn5qWt0rHlkZtTGuve86z+Ya4cpoFjos/zB+sSpYRwFVnEDAZXxLpfdiCO//tItCAu4kSGzLe0y6MQY0wwDyYg9anYhVzXsbwyS0cnBYyO1rc7cOUUtvsPuuYfE2e1xpnoDa6p4f7chRhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rOpet2k+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22403cbb47fso23364635ad.0
        for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742499924; x=1743104724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FlpgaR0yQjJtGhaDJfcefOfylwG4dpk/sOugUwcoAf0=;
        b=rOpet2k+g6fhDQ2vHVB90Eh9EDW25tnXWoZM3Hwl7FWRb6vxR2EoDjKSVHJA5SssLe
         FKSqx4E3i5Vn3OZVlbRUHiv7m77JBSavjKfZQCUGfqNGDG3hMNxUMksQJ4BC1ajSNTJX
         UtM0laCgik1jbC2SXby8ItK1YH12ga5oRSW2E2DduIQWhgCcv0vl6vhuBtze1w35mHjS
         DpW8t8sa4dyxyI8ILI9rZdNo3WfAqpzeg2HWOdxkKeP9YrigOpdl1fA9qUEpkvdWIn+a
         G3vtBvSh4oXOdAi0lyf64l8eQLKCvQcIpRUMVhaXZERomfCo0YO9HtseWiuV6jvF+Q7P
         Lc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499924; x=1743104724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FlpgaR0yQjJtGhaDJfcefOfylwG4dpk/sOugUwcoAf0=;
        b=kTGOMeNZecRyAa3YVw54gJQNWb+77ln40BSkJMv8o0pLZDc7O0PQS1F/dOmh/3RpUs
         7yNvdK6qmop11Ak7vscJYhDHxe7ZIFw/d+3TcgZI/yrGUf56LW++GbzyqMXRb9KdSyvK
         +j1RtxBaxOXU9XX2m+9uv6qoePHRhKzblPFMn7Sc0iHPKtorTi17F5B3Bdvsm/QBjryF
         ViFzXeIfzVnBTp6+RW4hHz29vYneTy9jMD35F8kye2HfMOvvBTOawBdVzbaOKry/sz38
         iSQsgv+MiPXTsO4M/vIYHdE2NXwyeeG4dSFSSvK90TJQGmfYU/doJ5oE0jKEe1LUc4aH
         1u4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUg+Gw+kQV2F5ebFPm+1GrW5zS2EfYszQqOfkasuPm0ar6GWznoBzSeA2+0QyvpMRztUC67N861+a0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLr6+4tAxOfJlycVTuCh3TPpTyiMw/+AagbwkIr1HUnu/81qJH
	BRUTO33TWEWc7lsxOTlTY7WWqBz0y1UHTkL0HkbdPJrbH7k8y8e9wPz6Y9TMIg==
X-Gm-Gg: ASbGnctd36Kujbi0imPVcO3k+sI1bu+wGT+nmBzUlWWJifxro3U4pXJ+yRk+FNA36hX
	6FL89lK0N4EzPNmoPAHM98qVIscHze68rM5fnhbbHdJF75lsfYro7nSnsnyjq9iTE/HiFPlLu/b
	F5YXAA/6DeJ3mLWQeW2XCYeOBd7wlnT7tK3u8ISdET8iR9XBLeEhjTZa+7tRUgx0Pd+wAeDDADw
	Fn11n/gwXV4l/VlAI1+iA2q1Qy1GAKp3MnxuD9KyALt62BO2YcROBTQFlEl/Xkzmv3l+sf3Fvbg
	5MRlw7MBEY8/rvg1yERjKGumeuG597SxEAGwz5bfVsXt7+afmlNUYY+Go8AwlUshnI6GyDgc0A9
	N6dXPYVGvcgdevqrW/UwM0NqRw5rTPZQ3KwvVFlC5n+Xymy1okrfoiQ==
X-Google-Smtp-Source: AGHT+IENLKihrksiYGmmjoFVdGD3nmnNaE4lKfWVvWkc6djuSQ42SPGpugmxhc5MD8+aQ5CdkfkZjw==
X-Received: by 2002:a05:6a00:2d0e:b0:736:d297:164 with SMTP id d2e1a72fcca58-739059457d6mr1123691b3a.1.1742499923443;
        Thu, 20 Mar 2025 12:45:23 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e14:7:c50a:4138:6122:653a? ([2a00:79e0:2e14:7:c50a:4138:6122:653a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fab7c0sm212508b3a.7.2025.03.20.12.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 12:45:22 -0700 (PDT)
Message-ID: <9bfab72b-d851-48c9-9cf4-d760dfb8e618@google.com>
Date: Thu, 20 Mar 2025 12:45:21 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: connector: add fixed-batteries property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Sebastian Reichel <sre@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-pm@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20250312-batt_ops-v1-0-88e0bb3129fd@google.com>
 <20250312-batt_ops-v1-1-88e0bb3129fd@google.com>
 <20250313-tidy-kakapo-of-abundance-eebf91@krzk-bin>
 <85c6de6a-f8b4-4e4e-8fa2-da53816abc89@google.com>
 <0e654a26-91de-4218-bd60-64e996d5378a@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <0e654a26-91de-4218-bd60-64e996d5378a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/16/25 9:55 AM, Krzysztof Kozlowski wrote:
> On 15/03/2025 01:56, Amit Sunil Dhamne wrote:
>> The intent of the patchset & this change is for the USB Type C protocol
>> manager module (that consumes these bindings) to be able to get info
>> (such as State of charge, design capacity, etc) from drivers that manage
>> the battery/batteries in the system. In order for such info to propagate
>> I need to hook up the references of these battery manager devices (fuel
>> guages, etc.) to connector.
>>
>> I have addressed the connector <-> battery question in the cover letter.
>>
>>
>>> If you mean chargers, the OF graph is already there for this and no need
>>> for this patch.
>> No I don't mean just chargers in this case. Also, I didn't follow you on
>> the OF graph. Please can you explain further?
>>
> You are duplicating existing bindings and existing practice of
> describing the actual connections via OF graph. And the binding already
> has the OF graph. What to explain more? Please open the binding and look
> at the ports. Maybe they are incomplete? Look how other USB and USB
> Type-C connections are represented.

I will try to use existing bindings. I will update my patchset and drop 
this property.

Thanks,

Amit

> Best regards,
> Krzysztof

