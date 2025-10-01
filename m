Return-Path: <linux-usb+bounces-28835-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F17ECBAFB6B
	for <lists+linux-usb@lfdr.de>; Wed, 01 Oct 2025 10:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E00F1880133
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 08:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C162283FF5;
	Wed,  1 Oct 2025 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JY6wGH1b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A391E9B0D
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759308351; cv=none; b=BE13MzBjKwEicfnaG6r1xOOazp/3KyM4oJxYQ93/P1M+F02JjXKomISBI0Zy2KdWspnGg4gKJewxszsCW99Nh7knJ8M3mKJ/EOPJ3pbXqjQ2fwBnA7gh38SvyLACElHacaRVyPpRYdLf2Cw9WAGb9XMyUWvT2zskW/Tbc9iiHt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759308351; c=relaxed/simple;
	bh=z7PAbCaadIqI01F2PvsLYHH78DlOLBgL/BlFH5vP4u0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKP74BY/B7D9RZoPBbYiIcwEXpAzrYFZhKS/oeFt31pobP8jZ6QDjkZ3TJinjzIZRfWnY5RqyeNAb/LEBWyCjBdUKMcKBrWZRpg2ZsBI4m+RXtBGZ69siJwB9U8YfPX6KIX7+IZXXW6qiv2CuSZwf5Eb+rXWg28XtKsJGLmzxV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JY6wGH1b; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33082c95fd0so7096852a91.1
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759308349; x=1759913149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eo9F75MDR0Y0UIOkUFMpCwB73Wdw9obsMbsxTQ/B1yg=;
        b=JY6wGH1bqc+KjzPZR9YPHEhJLihiwczRLTa82onj4eSxZ6Geq2SpSrUCTPyBA6CtU/
         LLtw9UNhBbECpZfH2vdKVuF7SjKHupY/M9yMzNrbHoA15K5xxr+MlRdx9YvTyISrX3HS
         oil90PqR8V93NmYfNQheGNNhYU4v80rh5m8pJLGb1olYakyHPT4KbY2fZkxC26IfJ1sb
         XaC7nlQGNCam2zzOUKc/rP28L9NOJaAFz9aH5MwfnNce2irMCq3dT8MzujJY7fb+3kbp
         W1LDJfn0vaEm3lH6otWqFISCzaY4rGSGf7/zXyIGw/LytLJ+/wEGUjtWNsaotoxX16Ry
         2zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308349; x=1759913149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eo9F75MDR0Y0UIOkUFMpCwB73Wdw9obsMbsxTQ/B1yg=;
        b=J1fka7rletxoIqJnfbPWdTnRrtBJo+CpzkKsk8N6l5bsAIWS5NqLXWMD5mvTK/1oH9
         I3q2iVrJU4QbfL8/TOOgqYaDN70BswZYrNP/cAQ4O7mfiqzzDabZCD4NWV3HW5+ndjgz
         nWebICT5aew49PZFiSm/1YuXZofJqY+ZH1kpri7JIOXRnfPXHoZNbN5ZrBR4I0QpP0x8
         VFIQE6EubycpWFYoyA54maP0GzDDMMT+ndok9GM0mfMKyt2CB0NZ9bDHjiRIwH+IlIZt
         iOlmiZPGWS54fRYzRyFOz5QRrH/OuZ7xOTzarIKvlnqcCvwoPUpAVdtPwGqr4YHNhLgR
         /ZRA==
X-Forwarded-Encrypted: i=1; AJvYcCWBPItyTE5Kaf3Co5hKMi0YlRK2kknn9PTxMuaWe5UrJFWBHDSljQkSrHOugfaJFpGVnh6fWlpeJJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrg6+65ppWpNLNGl3p26Eik9vl53sx6xSb/wXHIa0CD7vxpsfF
	nDMPCS1byvpM1B08OiFieb8DkLaMGUrB+U5soMOSKf1zcIFk/CCN7wCK
X-Gm-Gg: ASbGncv0SV5KpFapdQnX9b72SdLW4MceWjHH2WopGGh0qwjR7kq14ihUi8/liHrCSi0
	5myycVyONDDANVJ40sVD7in9rpvJozKerN3xurgGPSYgE4POKUry6ghOCHuLJckVN5cOARRKneF
	6XiFpTzoUEsGim/nuMt0LqXV67bkPwdulqhfnx1U8sBLVFkOnQTlsC/L4Q++eXTFinFU+COywr7
	SVBJa7DllfsKcL2HQx1N1CDFrf8fBylIDm9HrSWFqFTKKLnGXSP7O6REx9DaPR8F5hAv/ZEynBy
	s+s0zMo+XJaZRgp4n35wyzHBua42+RA4T6EK6VFdwrNKBjU9Pz3EjhIQyHhmUsfUlVZb0FRiAEB
	mLEFglqgDzmKyVrg2qBTWQ4zqC5FzHB8IfB7u9Ph7pTO44lQ/hO9chJDHAlbLpKEeoz0Npw==
X-Google-Smtp-Source: AGHT+IFfy0fiNNqMKqoY4HSuTSBvTKdNKF7dGc3N2UWsorO4J+7pzOSweKSFh0q95xUD8Ljh3i35aQ==
X-Received: by 2002:a17:90b:1802:b0:332:8491:ec2 with SMTP id 98e67ed59e1d1-339a6e96373mr2984063a91.16.1759308349404;
        Wed, 01 Oct 2025 01:45:49 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.93.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c557418csm15514320a12.30.2025.10.01.01.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:45:49 -0700 (PDT)
Message-ID: <dc51b6a1-83ce-4f23-879b-3e103c4a14a0@gmail.com>
Date: Wed, 1 Oct 2025 14:15:24 +0530
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
 <7cc900dd-a49a-4f37-88e9-6794e92fc7d4@gmail.com>
 <aNzojoXK-m1Tn6Lc@pengutronix.de>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <aNzojoXK-m1Tn6Lc@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/25 14:08, Oleksij Rempel wrote:
> On Wed, Oct 01, 2025 at 02:01:24PM +0530, Bhanu Seshu Kumar Valluri wrote:
>> On 01/10/25 13:54, Oleksij Rempel wrote:
>>> On Wed, Oct 01, 2025 at 01:40:56PM +0530, Bhanu Seshu Kumar Valluri wrote:
>>>> On 01/10/25 13:12, Oleksij Rempel wrote:
>>>>> Hi,
>>>>>
>>>>> On Wed, Oct 01, 2025 at 10:07:21AM +0530, Bhanu Seshu Kumar Valluri wrote:
>>>>>> On 01/10/25 06:09, Jakub Kicinski wrote:
>>>>>>> On Tue, 30 Sep 2025 14:19:02 +0530 Bhanu Seshu Kumar Valluri wrote:
>>>>>>>> +	if (dev->chipid == ID_REV_CHIP_ID_7800_) {
>>>>>>>> +		int rc = lan78xx_write_reg(dev, HW_CFG, saved);
>>>>>>>> +		/* If USB fails, there is nothing to do */
>>>>>>>> +		if (rc < 0)
>>>>>>>> +			return rc;
>>>>>>>> +	}
>>>>>>>> +	return ret;
>>>>>>>
>>>>>>> I don't think you need to add and handle rc here separately?
>>>>>>> rc can only be <= so save the answer to ret and "fall thru"?
>>>>>>
>>>>>> The fall thru path might have been reached with ret holding EEPROM read timeout
>>>>>> error status. So if ret is used instead of rc it might over write the ret with 0 when 
>>>>>> lan78xx_write_reg returns success and timeout error status would be lost.
>>>>>
>>>>> Ack, I see. It may happen if communication with EEPROM will fail. The same
>>>>> would happen on write path too. Is it happened with real HW or it is
>>>>> some USB emulation test? For me it is interesting why EEPROM is timed
>>>>> out.
>>>>
>>>> The sysbot's log with message "EEPROM read operation timeout" confirms that EEPROM read
>>>> timeout occurring. I tested the same condition on EVB-LAN7800LC by simulating 
>>>> timeout during probe.
>>>
>>> Do you simulating timeout during probe by modifying the code, or it is
>>> real HW issue?
>>>
>>
>> On my real hardware timeout didn't occur. So I simulated it once by modifying the code
>> to confirm the BUG. The BUG has occurred confirming syzbot finding.
> 
> Ok, thank you!
> 
> Can you please add similar change to lan78xx_write_raw_eeprom. syzbot
> will find it soon or later.
> 

Ok. I will try to send a separate patch for that.

Thank you.

