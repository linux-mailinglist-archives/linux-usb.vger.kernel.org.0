Return-Path: <linux-usb+bounces-28959-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A87CDBC04DE
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 08:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 670794EB660
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 06:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301CE221F29;
	Tue,  7 Oct 2025 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGbpPTNk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A31A218AD4
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 06:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759817541; cv=none; b=ua4mZIB/aIo3bAjvwgqIRN0a63gaSCZA6E+pWh2yvdcTTlOaY9kLqV/9zxIY1z8ozJsmDlySGBinFSJigqGJxhqQIsJ+fgnWdsPQumK8bUG4r8bqOtQ9BKzteuKaZhnBpYTZYOTb+3uSJnDuJ4nJUucZExtOVrAWXhhK/CEW4o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759817541; c=relaxed/simple;
	bh=f/KtZW3rhkYJ2eiCGDLGTJbkYnmihth0V8SUE4SHB04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpbHbzb4VfnWKsxGOn2YKVU2V6DzeZGzQz9Pd3wQ/4QcG48nIlvHHlkSi/ZzFltY3mSbRjFxzLpC0jt6nz/k0YeI1K+n4CCkAiJOyGfTeQmnxjJnVzYLpD1q/aT4y3W9U2rNwFU5UKcNKWEOF9ZI0Ic9oHdxduzl9jSfnpT2Dy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGbpPTNk; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-336b9473529so5359000a91.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 23:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759817539; x=1760422339; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x039O0NFHGAXzxihdFNNk+CPOWRSSl0ZG6jnY+lkA64=;
        b=AGbpPTNkK+bPv/uqVFQEeN3njBGhCB4hNTE84OEQz/gZY8TytGQL+jZchJDF6LLJnq
         fOj+9NUi5z5Yh1kSGuWLNvgVAF55Z+J8n8lAWEzUWNrtEbIWBLEm7xeJ1kfZf9qyh6G3
         /xaWfllvTLaJ2lX2MeseSd2EXfUVu9AxIDTfd1JFLpDz0HluE6RyD+9cr6o9KtDJ49KE
         FdG34cnbt5oMOIECOulAkEYW/d0Pa5WHnUmxeaxfcTDAR+mdUhZk2T/g65IUuDoqaC6h
         hFOxwkzJZYVFfwXKg3zCmVFa/tt6hdytBnmXHpiHH1DAD449c7G1P7QNvvayuLwhdifD
         R2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759817539; x=1760422339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x039O0NFHGAXzxihdFNNk+CPOWRSSl0ZG6jnY+lkA64=;
        b=cZbTD33cD/jxcThbv7WIdF6fCPO1iaVZuuT9sj0KQ8HJ22/ZqcI0r6tT/R+JThRh+B
         ZfBaHv9CjRsiMtQekUnViM6wt7B0zH4/0OsamWMaQtjmbslfu1xqmUtDAMr0LddRFGxd
         Pwg8eQxVl4DG3HTY8H1YZWE0kuT4z4Oc14d+Wded+qNCPfLuF5mz2G6pVsCHc4nS5bc9
         LWewNjabh1QY1bV1vn/Sg425NwSKV0pjLS+ngVtGKDPMC/R9JNK9sPgOh4Ar69n7CaZ5
         qMYND/MGfWiJETcD4Vo1rhUAqbF2O9Asg4xS3aHymXIsCSAv5yXfW/M4KP/5/HppTIE5
         jRVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Cv41oOyJjXkB9FiXrq1smoQFb822PKrhy7KAvw90z3BQwOFOiZNkOUc3egF/p0ZYfoKfxSTf22o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+2Oo9Z/0z6aaxqn7JxJYj0g8//l3l9I1upmhx3xP0a3+lirMk
	vnKuxZ+CDjKDD/8fUmb1sErl36MAI1q+0hKyLhRt6gtljpaWYXqAQPEM
X-Gm-Gg: ASbGncuzE7SIoGs1aAPAboYMDoHlBiJzP2mvmsdH8zYCHnsdA0SZ/OA6ofcjsx52v49
	V3q6EArOcy89EuW5nn/1cObmRg+udpmdTpa9sBVjApSjoy7dl6cyLETkWy9MiJ7sezZWoxdD16C
	Dq6QT46MYdtStGxZUyamZORfLe6QTaSIjr1xXm6Y0oUupR68SzzJcVZgez8HwNAg039WWfkNgiI
	iY2k1Das3zDcq5/ZrHn14H0S29BBsLPLDAftZfQxIWvS300LLbl6dipIUZgHvjyZ7l4nrssaokO
	T3kv93cxTAFQTJhmfW8h+7xgf/Hpv23jW5Gk0lE8AHVm9KABAqQUwqD3vxHZv7OZoireVS+9ssC
	YVeviWwItunnQUD7YaiyoroeJWaJAz265QIfjDdlsVble01gtrFgJKfzGmsI4DDTH7BEy2AxBLe
	1UPA==
X-Google-Smtp-Source: AGHT+IG2DTQJY2MdHBjlE/ea/em21MmRyqHMhJutkpAPqmAVGyj8WhoqLhe1SRoTVivJMvCIXdKuuw==
X-Received: by 2002:a17:90b:384f:b0:327:53f0:6368 with SMTP id 98e67ed59e1d1-339eda67866mr2533241a91.2.1759817539087;
        Mon, 06 Oct 2025 23:12:19 -0700 (PDT)
Received: from [10.0.2.15] ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339ee9218ffsm739057a91.4.2025.10.06.23.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 23:12:18 -0700 (PDT)
Message-ID: <e8311311-61bd-4be6-8025-841b84ff4422@gmail.com>
Date: Tue, 7 Oct 2025 11:42:12 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: lan78xx: Fix lost EEPROM write timeout
 error(-ETIMEDOUT) in lan78xx_write_raw_eeprom
To: Khalid Aziz <khalid@kernel.org>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251004040722.82882-1-bhanuseshukumar@gmail.com>
 <866d28f8-616c-4a79-9030-2ebc971e73fd@kernel.org>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <866d28f8-616c-4a79-9030-2ebc971e73fd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/10/25 00:30, Khalid Aziz wrote:
> On 10/3/25 10:07 PM, Bhanu Seshu Kumar Valluri wrote:
>> The function lan78xx_write_raw_eeprom failed to properly propagate EEPROM
>> write timeout errors (-ETIMEDOUT). In the timeout  fallthrough path, it first
>> attempted to restore the pin configuration for LED outputs and then
>> returned only the status of that restore operation, discarding the
>> original timeout error saved in ret.
>>
>> As a result, callers could mistakenly treat EEPROM write operation as
>> successful even though the EEPROM write had actually timed out with no
>> or partial data write.
>>
>> To fix this, handle errors in restoring the LED pin configuration separately.
>> If the restore succeeds, return any prior EEPROM write timeout error saved
>> in ret to the caller.
>>
>> Suggested-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> Fixes: 8b1b2ca83b20 ("net: usb: lan78xx: Improve error handling in EEPROM and OTP operations")
>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
>> ---
>>   Note:
>>   The patch is compiled and tested.
>>   The patch was suggested by Oleksij Rempel while reviewing a fix to a bug
>>   found by syzbot earlier.
>>   The review mail chain where this fix was suggested is given below.
>>   https://lore.kernel.org/all/aNzojoXK-m1Tn6Lc@pengutronix.de/
>>
>>   drivers/net/usb/lan78xx.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
>> index d75502ebbc0d..5ccbe6ae2ebe 100644
>> --- a/drivers/net/usb/lan78xx.c
>> +++ b/drivers/net/usb/lan78xx.c
>> @@ -1174,10 +1174,13 @@ static int lan78xx_write_raw_eeprom(struct lan78xx_net *dev, u32 offset,
>>       }
>>     write_raw_eeprom_done:
>> -    if (dev->chipid == ID_REV_CHIP_ID_7800_)
>> -        return lan78xx_write_reg(dev, HW_CFG, saved);
>> -
>> -    return 0;
>> +    if (dev->chipid == ID_REV_CHIP_ID_7800_) {
>> +        int rc = lan78xx_write_reg(dev, HW_CFG, saved);
>> +        /* If USB fails, there is nothing to do */
>> +        if (rc < 0)
>> +            return rc;
>> +    }
>> +    return ret;
>>   }
>>     static int lan78xx_read_raw_otp(struct lan78xx_net *dev, u32 offset,
> 
> You were able to test the change to read eeprom code by forcing a timeout while doing probe on EVB-LAN7800LC. Were you able to test this code change the same way just to make sure callers of the write function handle the new ETIMEDOUT return value correctly?
> 
> Thanks,

Hi Khalid,

This function is only invoked from user's ethtool operations.  The ethtool handles errors returned from the driver callback functions. 
I tested it with ethtool -E option by forcing a ETIMEDOUT error early in the lan78xx_write_raw_eeprom temporarily. The ethtool 
reported error with "Cannot set EEPROM data" message. The ethtool version used is 5.16.

Regards,
Bhanu Seshu Kumar Valluri

