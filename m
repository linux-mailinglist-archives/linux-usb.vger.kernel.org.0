Return-Path: <linux-usb+bounces-6647-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FFA8590CF
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 17:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48408B21906
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 16:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05257CF1E;
	Sat, 17 Feb 2024 16:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIo5BNdV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6CA657BE;
	Sat, 17 Feb 2024 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708186470; cv=none; b=LZfA+eslsk52J3+ly/Fm07+djm2BVS/34Q9P4VJBDCfW+noObzhfH0oM6WaUi0dqCcPW4IipJXd4pNtBRxfunKuLdiOjR24MpWtSFLjKrlD4pFzEiyZAsgGxvmv03rlViV1eYmi8NbipM1zYPJVzC7ZtgVM+cJwOG1JoJSmszJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708186470; c=relaxed/simple;
	bh=G2p0livAcyW2LTB5Os9d6SwDvJ1//AQfYmCMEb5Xrno=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=felxkYYp4bEM9GEafRLG6lUj611qtjIS93RjjEhvmBZDnMf7ePLOJmmRfVfNesSfAJsTbaSkfS6/bMf3Eqc8EZArdvAuYDEUH4DX1/V92ao/igcf0YeO3GfQZ6Tc+QFM4+bOvLl8dEMSRArWP0T0TMTG60mHetm7BPZMe7Jkvg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIo5BNdV; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6de3141f041so2352715b3a.0;
        Sat, 17 Feb 2024 08:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708186468; x=1708791268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oNtngiDudxbbUoL2vHS3wnOs232/nEEFptvV1V/0F+0=;
        b=dIo5BNdVzP/0eVzPPJbrctLUZG8CqsAbLtNQ/WfRpsTwHdLFVepDhCl0D6mbBO+0ZM
         rTIyEPHwGTGYCbrMD3gNB+kxy8hvb+bM84NJg1dWl4rHqW1QRlOS5Jdv6H8N68WiJ3+N
         7Jeh+0siM4AahPSxWZ/VhF37gWyNHkDSiKIAFtlhic2IuCIMjyKO3FXIRNCphvgUwK3Y
         dGdpRzpcqA98CQ1yZjEwFedT6sS7ePGzpjoH2SSqx9+LPjt5mt8zRs6BpvQop2W0gqxY
         N/wCf55TGUnBcNltu86Q0XApTgCh4pc8uuN68nfj6URDmiWh5/dBS2nAoCmR+jKfqahw
         DR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708186468; x=1708791268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNtngiDudxbbUoL2vHS3wnOs232/nEEFptvV1V/0F+0=;
        b=dgZDT3EBMSV6TOS5I/9KazWatAsrSg9Paqhkgdw0Qimvc8jB7oVS/i3o25wHdHAbKu
         XU9ZJzeNLN4iu3kNUY6xTK96UgHfCNYZLtwPInHPhCOlXGQ3fwJFmt6izTMN08O1yz8g
         VyhvJKqv6MYuanZFwV3y0k4DE2vYwab8+69+qFZFhDILlz3TimKuWv5OgnqxrOLPvCTa
         lYZPTWakyU/K/MtF/8x6/ndipf8nt+2GrWtT/NXcXkrG59DKG1aZzfVbc+Fhy85ePBpP
         SIQOEfojulS3qEtzHojJFU5AaOYsFtEi3s8qP8HX9UjXKF3rwiO1yHCGqEFytHhlHZ5o
         RKsg==
X-Forwarded-Encrypted: i=1; AJvYcCVs38Ys4fhE5cRTcof88KITF8bwVx4fn9NIdFpLgtQZy7SoEwD1CbkikZaxVXXLuc+Oe4dO+rMbP/v3BKqg4/beQAYF4fJZf5Qh0Xioh1lc+NiJae0tk7mYrpogSubrlCQx2+CS1V9O
X-Gm-Message-State: AOJu0Yy4BrLA2f4QVyQsjj6wehv4yUl6su14y00WWVwmsj2ViHHX6b19
	OtxKM/udlPqEo3eyxZeFLF0e70NkIJ9YirlGLDnTE2iebbTdzq7ReWEIW6EQ
X-Google-Smtp-Source: AGHT+IGkE4RrTABwIs5pPfqRvF3xw8OA5V2sumNTmJAEYyirQI1d4SUJGVGmZxcslMuJLKD58ToBQQ==
X-Received: by 2002:a05:6a21:7897:b0:19e:cb4a:4b08 with SMTP id bf23-20020a056a21789700b0019ecb4a4b08mr8343782pzc.33.1708186468156;
        Sat, 17 Feb 2024 08:14:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t63-20020a628142000000b006e3af7c719csm586333pfd.53.2024.02.17.08.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 08:14:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <26c856a1-9186-4d92-9b7e-ca59632f4a92@roeck-us.net>
Date: Sat, 17 Feb 2024 08:14:26 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "usb: typec: tcpm: reset counter when enter into
 unattached state after try role"
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, linux-usb@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20240215193352.1026707-1-megi@xff.cz>
 <2024021739-self-pencil-b932@gregkh>
 <ratkc4fo3mqwuzsbxsiwq54jclnarnjl3x7ts64elx6hguvbay@ihelujsnzd6i>
 <2024021724-festivity-divisible-0b32@gregkh>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <2024021724-festivity-divisible-0b32@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/24 08:03, Greg Kroah-Hartman wrote:

>> It's a mechanically generated revert of upstream patch. It has no authorship.
>> I did not write it, machine did. :)
>>
>> But I can add a sign off for the commit message I made:
>>
>> Signed-of-by: Ondrej Jirman <megi@xff.cz>
> 
> You have to do so.
> 

It is not a valid argument to start with. "git revert" has
a "-s" option to sign reverts for that very purpose.

Guenter


