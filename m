Return-Path: <linux-usb+bounces-23966-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CDEAB7E9C
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 09:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 787B34C571F
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 07:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56B61FBC94;
	Thu, 15 May 2025 07:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xKuDpf0m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D5C219E4
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 07:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747293334; cv=none; b=sHsfb4cRQEd23Z8bVKv1iCp6r6v4Z8JOrqBtKhl3k5mhqyFEPYd5EZV5mvcZzA3CSrxOQjiYT8FzRa9TVOZYmKeo8ndLk5NEw0tuAy0JRRtCfvtY36Jc4t7Y1bEnF9eoQPRu02CzUxR/VK4YhnityK987g6bqvEVjnbIwbEhkt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747293334; c=relaxed/simple;
	bh=qlh+kB3YovK9w5uTPzIUuljTu10BHoW6zgni0KrhuZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Izu7oWBCZBBauWSvxjbT0mQzvrOS9qeVdlRfSJjaw2KAbhKJn/EChGJtV4P4nHpG3jOtOCLoekK6XI3cKNgYDe2Un7Z5tlYJW8qH4uJIIoqWBEsW8mRB//Fpy7HvkkJDlYQiQ7DhnPtiFJJ3qJWU5ylQN8Mu/+u+ifyJollTOCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xKuDpf0m; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30a9cd61159so570862a91.1
        for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 00:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747293332; x=1747898132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fNz4MAM7giVqZ1kIj91pZlfFRdZA2woN5u2lniAi+R0=;
        b=xKuDpf0mzG7diSHWerbhdw21qCiCky/s7+6nTpQzi6swB+UA0LiwDcVph0BqN6LQfZ
         Ir/ugie3DTYRqKDqQ0YAQ7BOKM2BdER/+oAwwnf0flYE7kR8bVCJF7jQ7iC0Ghl/QLQu
         DJ64gzL619aeIpWkBowQeN0pB7qIfdUz6yqD4atEooxp7wGxBO5ByapOFKCH9rqoGwSW
         lDRU9GY30uKMi5ekS6peGQlDheMEPg0vZOUcZyNs6bJalCqORjwrgHEUpz6ucNxtkn0x
         faRxIYve/+CLDhwXZQccRFQlgBdJ2A6jeXmkLgR526g99yAM+qb0zG38OIu96WnugqPT
         aChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747293332; x=1747898132;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNz4MAM7giVqZ1kIj91pZlfFRdZA2woN5u2lniAi+R0=;
        b=jElPNX4g9yjyfIlIUKHS/HQoWG9ffY3nE9vTpQaGjNyEYWpagGAcncU+KY7XRj60t7
         or+POFWCbbxivByKK0jea56DJxQ+6rk2k5rVsyua7l7/whLVHvXq/XYKmoq14svnMi8+
         qb9ELr+1ceu2iazEQg/MBJnk+rz6olW99RsXkT3ZI4W7Bk+AsQXS6WAAe244rTPk3u6a
         XvswRklVXT5I7S/T3YTUp81x9OOXtryZjQn6SENoHQJz7kO6q3a4aJNaUYxOVsrCyLNI
         H6UkvHWMkYdWTan0Zf+TfoWJz9CARcVnppnkHxyw2VT1aVykXmfyCKsFsE3t+KCoTemi
         Jz3A==
X-Forwarded-Encrypted: i=1; AJvYcCWS7y7IcT5q02+HY78eW6w4otlmWXXomPuwx8YgpbLVaeVD2FR+bbQQ+pG2T2//fsgl7qCyCN347IA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Gb5OB8YcAhknpOUybpslzWTUyRCyMh0k3piT2KAcLmAAiuq6
	IbAs6WWyr1q76pCC08Qf4WNPgq6w0GoiYT9Z6TYtLZc/1llj4gAnkZ4HpM3VIw==
X-Gm-Gg: ASbGncvknLkQ65Y6K3vkoH6Vfd4EHSrE/Nds5ToffifNV5VSntd99I9FLUEcUcjsIfT
	m+F6lF8QMoTjh4eI/uM4aFq/LSE7UPbvpK08Ny+efsl0WEEt8aU8UaAk4uhQsCqR+8EjWqJlRQL
	HCtZFFEaraWtvUOiVnjAYBIUHEAE/gY6FmZlw5WgLn5sa1AUqCWSzfDR12wmFY1xujf9wQdBKpL
	pQF8NxiWn66oO6jhbTOlFMvqYtP9YnB+lPrI2r3qkfMYSoOJ5dH1PGXfaM0Y+KWEkLyVcDZqR+k
	bTEzmEF4Iocc0IexP1mf+/XD1AmkqmxWnDAOo3MuHpGzwjZJoITpOzCoZXRfb5B4SCsc83KsAOg
	u5IEYjl7sizXIQj4X8Ex1n8Q=
X-Google-Smtp-Source: AGHT+IEp9eTd3hls9DgkDTgFMCjs1olsgJPSelhs5NIcds9k0dqlTrGcDISLk+XnoExwF4yOwHRgIQ==
X-Received: by 2002:a17:90b:5350:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-30e4d99d77amr4167602a91.0.1747293331617;
        Thu, 15 May 2025 00:15:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:4570:89a0:f74c:a163:fe37:3c0f? ([2600:1700:4570:89a0:f74c:a163:fe37:3c0f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e3345f4ecsm2803723a91.27.2025.05.15.00.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 00:15:31 -0700 (PDT)
Message-ID: <4245c9da-cb81-4494-93c6-224883057410@google.com>
Date: Thu, 15 May 2025 00:15:29 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: tcpm: Use configured PD revision for
 negotiation
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Cosmo Chou <chou.cosmo@gmail.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cosmo.chou@quantatw.com
References: <20250513130834.1612602-1-chou.cosmo@gmail.com>
 <aCNLeX1k34BSgPOV@kuha.fi.intel.com> <aCNOOXcAuA_1B-0Z@kuha.fi.intel.com>
 <CAOeEDyuFmFqacy1N8TtpuJRdv-3K2f1DzXNwR1MpyNn4Nrug7A@mail.gmail.com>
 <aCRQbRCHFdFOCNw2@kuha.fi.intel.com>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <aCRQbRCHFdFOCNw2@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Heikki,

On 5/14/25 1:12 AM, Heikki Krogerus wrote:
> On Tue, May 13, 2025 at 10:14:32PM +0800, Cosmo Chou wrote:
>> On Tue, May 13, 2025 at 04:50:49PM +0300, Heikki Krogerus wrote:
>>> On Tue, May 13, 2025 at 04:39:09PM +0300, Heikki Krogerus wrote:
>>>> On Tue, May 13, 2025 at 09:08:34PM +0800, Cosmo Chou wrote:
>>>>> Initialize negotiated_rev and negotiated_rev_prime based on the port's
>>>>> configured PD revision (rev_major) rather than always defaulting to
>>>>> PD_MAX_REV. This ensures ports start PD communication using their
>>>>> appropriate revision level.
>>>>>
>>>>> This allows proper communication with devices that require specific
>>>>> PD revision levels, especially for the hardware designed for PD 1.0
>>>>> or 2.0 specifications.
>>>>>
>>>>> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
>>>>> ---
>>>>> Change log:
>>>>>
>>>>> v2:
>>>>>   - Add PD_CAP_REVXX macros and use switch-case for better readability.
>>>>>
>>>>> ---
>>>>>  drivers/usb/typec/tcpm/tcpm.c | 29 +++++++++++++++++++++++++----
>>>>>  1 file changed, 25 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>>>> index 8adf6f954633..48e9cfc2b49a 100644
>>>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>>>> @@ -313,6 +313,10 @@ struct pd_data {
>>>>>     unsigned int operating_snk_mw;
>>>>>  };
>>>>>
>>>>> +#define PD_CAP_REV10       0x1
>>>>> +#define PD_CAP_REV20       0x2
>>>>> +#define PD_CAP_REV30       0x3
>>>>> +
>>>>>  struct pd_revision_info {
>>>>>     u8 rev_major;
>>>>>     u8 rev_minor;
>>>>> @@ -4665,6 +4669,25 @@ static void tcpm_set_initial_svdm_version(struct tcpm_port *port)
>>>>>     }
>>>>>  }
>>>>>
>>>>> +static void tcpm_set_initial_negotiated_rev(struct tcpm_port *port)
>>>>> +{
>>>>> +   switch (port->pd_rev.rev_major) {
>>>>> +   case PD_CAP_REV10:
>>>>> +           port->negotiated_rev = PD_REV10;
>>>>> +           break;
>>>>> +   case PD_CAP_REV20:
>>>>> +           port->negotiated_rev = PD_REV20;
>>>>> +           break;
>>>>> +   case PD_CAP_REV30:
>>>>> +           port->negotiated_rev = PD_REV30;
>>>>> +           break;
>>>>> +   default:
>>>>> +           port->negotiated_rev = PD_MAX_REV;
>>>>> +           break;
>>>>> +   }
>>>>> +   port->negotiated_rev_prime = port->negotiated_rev;
>>>>> +}
>>>> Do we need this? Couldn't you just add one to rev_major?
>>>>
>>>>         port->negotiated_rev = port->pd_rev.rev_major + 1;
>>>>         port->negotiated_rev_prime = port->pd_rev.rev_major + 1;
>>>>
>>>> Or am I missing something?
>>> Sorry, I mean minus one :-)
>>>
>>>         port->negotiated_rev = port->pd_rev.rev_major - 1;
>>>         port->negotiated_rev_prime = port->pd_rev.rev_major - 1;

The only reason I asked for macros is that in the case of Spec Revision
for header, the value for PD 3.0 is 0x2, PD 2.0 is 0x1 & so on. While
for PD max revisions, it's the exact values. Having a clear distinction
may be easier to follow. If you want to go with the +/- approach you can
add a comment stating the above. 

I don't have a hard opinion on either approach :).

Thanks,

Amit

>>>
>>> --
>>> heikki
>> It seems to be the PATCH v1:
>> https://lore.kernel.org/all/20250508174756.1300942-1-chou.cosmo@gmail.com/
>>
>> if (port->pd_rev.rev_major > 0 && port->pd_rev.rev_major <= PD_MAX_REV + 1) {
>>         port->negotiated_rev = port->pd_rev.rev_major - 1;
>>         port->negotiated_rev_prime = port->pd_rev.rev_major - 1;
>> } else {
>>         port->negotiated_rev = PD_MAX_REV;
>>         port->negotiated_rev_prime = PD_MAX_REV;
>> }
> Okay, sorry I missed that. I still don't like the extra definitions,
> but I don't have any better idea (I guess macro is not an option?).
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>
> thanks,
>

