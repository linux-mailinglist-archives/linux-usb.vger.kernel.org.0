Return-Path: <linux-usb+bounces-28833-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9CCBAFA54
	for <lists+linux-usb@lfdr.de>; Wed, 01 Oct 2025 10:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 664EC1C1CA2
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 08:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1364A283686;
	Wed,  1 Oct 2025 08:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqFrzzrq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F3D279918
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307502; cv=none; b=OawSo5ae4IxzefENErsFOoJrj84NuTK2WUdqWmCRspUI8T86YWXAViz12OFDPvaprCNJWq3b6ZDyPb/IK4vJl+1hxkWwF5zlDXClHbuWFdGyEPmhnAg9PsUDKvXEuLTEV/7nnLqGZqXzSDCcfxXmvcXDpT/lOlD6NlerM5QYTPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307502; c=relaxed/simple;
	bh=wlepJl/FDglC7Iq5FuOQ6VBskFRpNf8YuU3NftOhPfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTOYTJJ7IptSJM+MJ49iNosXmmcg5Z6vQufKxSuafQzQdnSgVsng/wEibOrD1OnDDW7L8zZ5S5NESsGHJvmDCrVz35okqQqv2YpQe1l2kChOiTGM/jm3DGuJMDi6jyxbMnB4rFcKu5S/0qrmDpgEKaqTuSXDdrqE+CNx2skWq0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqFrzzrq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-781010ff051so4808987b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 01:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759307500; x=1759912300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/BnQS5ICJGbt/butX83RKxPPfruJQzobXgxFKJ0MdI=;
        b=MqFrzzrqmvEAtBO2NWim8lp+Ze+0Ee79O/9eg0AO4pUbTq8PqWgK+ANvRTn4S4uEYj
         JDINeU+D9kJQ4vREinXqSKtO9xj7E18HjNDNU9Wa9mQxTRE0VdTLx8A01Imfpdv4lSrk
         BQlIcuIhUwpyBSpD/bqso0LEqr4DVaLLHKgl/KHbtZkTyHAc6OfAJpCy8FqXaB/dA/Um
         bhwJoUOL2T8+cUpHluIsA6U6n9NzH05hwyJIKujlpWdQ0hGj3c4kdi6mFiftJLY7rR97
         RzI4tbUBuQh+SawbQGvJpXzMWP+MrxVRrtKh2QDGzDOY+0eJ5zUPvPXmG2CmIvdqN2kd
         lp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307500; x=1759912300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/BnQS5ICJGbt/butX83RKxPPfruJQzobXgxFKJ0MdI=;
        b=smH5ZXx1mcS5ESp+IEyGexSdhtjZNvXHHxb+WCOyivxYtyEobpjSZDCMQWtKTSQhC5
         PkBikKd/8OQqwobyLUo2zP/rI6YH4Rrbv/r/VBctbJpzaDBf1HiONF1skQq3X4Vnufwz
         6gjF+BMBI1gCbIK5BNz/rrPxCwsYoBwc8Y+UISIqQ0MeFWiWr0c+1g8H/pbN37zSb0KL
         daiMDePwwt9Wyk8bG+AiWFq9vlN5rkG16Ek1qbpVGEFHutZxHHDVws8iU9cmhjKijiAj
         6XLCVMG7SnfU5oBw8EuerKnuVlQh8973CIFMUt9W/zzb6QW/EwnW+z4NSKTD036LTvmd
         od9w==
X-Forwarded-Encrypted: i=1; AJvYcCWkillSkWr5EMQ+o6d2K7vnlkTYOeKWeF5axn7ikOBjuYnPFNuj7CV+iHaBwqQd1CRHqXjDMYIAXBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGckIQPXk0CqQt5LrPjRsZgFyjE41IHsAY8l9Fd54yMMYpmqu7
	TFS4Kh7TEL4ieMWtmidRzk5+gVGap+te4AmIr2Gw56UM4dKIVsvuhxnU
X-Gm-Gg: ASbGnctHlBDQRF1mwK/Bkiao4CTQF6xx/g7UUHONhA71QGNR3DHa39yszjulYbkEFme
	Q/Ssz6HrAlOetBME8OLPPmucrvnhXBglh5t2kjVRFSycS14Gg5UJoYgJWX5JPPioRwzRRgxdfNF
	DO3JEL/E+Y110X4IeMQNXGOZG6MIpXWtD0KJBSEddeD/VFjmWDlbctEVlgV4SdRaWBdriQiv4J5
	FIett4O1YxUe9kQigz25+qD/x8Yi2F4y+rpurHGCPQDaPWH6k5FRZlHdkn8TsUrvsE2jXB+5JK9
	ru+iLyBVFzSEDhSwdVi7+djFdPODIv4SOp+gjC5aAfzXhmxjEJKnh5yMfegXqK4Jn0FufK4xOdL
	xV62S7D5oqfp4KhrWFMsNY4K9c/crrGGULX7yxNt5YqQNX/TvEt3UjXbfv0OkmHQsh3dSf0St7o
	1Wv9Ea
X-Google-Smtp-Source: AGHT+IGKzyuHahUxvEYMTvpgcvyvBiorHG33cuSCeL+2u5gG6jYyCteWnCT8fMENWTmD8XlLl3NMWw==
X-Received: by 2002:a05:6a20:72a7:b0:30a:267b:b9e8 with SMTP id adf61e73a8af0-321e43a2022mr3642212637.36.1759307500186;
        Wed, 01 Oct 2025 01:31:40 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.93.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55bdefesm15501448a12.49.2025.10.01.01.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:31:39 -0700 (PDT)
Message-ID: <7cc900dd-a49a-4f37-88e9-6794e92fc7d4@gmail.com>
Date: Wed, 1 Oct 2025 14:01:24 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: lan78xx: Fix lost EEPROM read timeout
 error(-ETIMEDOUT) in lan78xx_read_raw_eeprom
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>, Thangaraj.S@microchip.com,
 Rengarajan.S@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+62ec8226f01cb4ca19d9@syzkaller.appspotmail.com
References: <20250930084902.19062-1-bhanuseshukumar@gmail.com>
 <20250930173950.5d7636e2@kernel.org>
 <5f936182-6a69-4d9a-9cec-96ec93aab82a@gmail.com>
 <aNzbgjlz_J_GwQSt@pengutronix.de>
 <e956c670-a6f5-474c-bed5-2891bb04d7d5@gmail.com>
 <aNzlNkUKEFs0GFdL@pengutronix.de>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <aNzlNkUKEFs0GFdL@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/25 13:54, Oleksij Rempel wrote:
> On Wed, Oct 01, 2025 at 01:40:56PM +0530, Bhanu Seshu Kumar Valluri wrote:
>> On 01/10/25 13:12, Oleksij Rempel wrote:
>>> Hi,
>>>
>>> On Wed, Oct 01, 2025 at 10:07:21AM +0530, Bhanu Seshu Kumar Valluri wrote:
>>>> On 01/10/25 06:09, Jakub Kicinski wrote:
>>>>> On Tue, 30 Sep 2025 14:19:02 +0530 Bhanu Seshu Kumar Valluri wrote:
>>>>>> +	if (dev->chipid == ID_REV_CHIP_ID_7800_) {
>>>>>> +		int rc = lan78xx_write_reg(dev, HW_CFG, saved);
>>>>>> +		/* If USB fails, there is nothing to do */
>>>>>> +		if (rc < 0)
>>>>>> +			return rc;
>>>>>> +	}
>>>>>> +	return ret;
>>>>>
>>>>> I don't think you need to add and handle rc here separately?
>>>>> rc can only be <= so save the answer to ret and "fall thru"?
>>>>
>>>> The fall thru path might have been reached with ret holding EEPROM read timeout
>>>> error status. So if ret is used instead of rc it might over write the ret with 0 when 
>>>> lan78xx_write_reg returns success and timeout error status would be lost.
>>>
>>> Ack, I see. It may happen if communication with EEPROM will fail. The same
>>> would happen on write path too. Is it happened with real HW or it is
>>> some USB emulation test? For me it is interesting why EEPROM is timed
>>> out.
>>
>> The sysbot's log with message "EEPROM read operation timeout" confirms that EEPROM read
>> timeout occurring. I tested the same condition on EVB-LAN7800LC by simulating 
>> timeout during probe.
> 
> Do you simulating timeout during probe by modifying the code, or it is
> real HW issue?
> 

On my real hardware timeout didn't occur. So I simulated it once by modifying the code
to confirm the BUG. The BUG has occurred confirming syzbot finding.

Thanks. 

