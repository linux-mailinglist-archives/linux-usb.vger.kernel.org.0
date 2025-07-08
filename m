Return-Path: <linux-usb+bounces-25565-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB578AFBF89
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 02:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E50A73B19EF
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 00:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03658633F;
	Tue,  8 Jul 2025 00:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TT091p7M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED90D1C84BC
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 00:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751936160; cv=none; b=uysBPAa2HFZTwN3ZKVkcEPBMqRsrJbVX7xCDrCuwy+cGoskd8YMkanpLe48dOT/cAFWB3OpVV7xd/m+H+0n0HhSucvG4djl4GEqqynbdfGF1nfblOWuWr4iXEDJszJLPVmZKrL7EI8FbfHnBvdBaMqRhzUmO3vKBoPWtRIx4tnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751936160; c=relaxed/simple;
	bh=5/W5PDx2OgC/pBsDMzDvztUMs/25/b1FwBAaU2+4M1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AluBAtCIjgTKsIAQvnMzZzdlK02xgWzcXYgY++E0hgSUUTA946MYfweY4U00PEINkCnke2HUh2Gnj0PJxh/z8WkHlwVhypR8185hpROASbcdN6DmbqgdknIBXSBf0Q9R3t9b+0sY6aREC5CRveQ8Qk24H/otbJHNBOsJhhC+0bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TT091p7M; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-313cde344d4so3643595a91.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 17:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751936158; x=1752540958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W485WHAP1uqJod7yt/QMj2+3WtWakaGzk8TE+3KhyPE=;
        b=TT091p7MIP3+W5/lVorl4419pv8I+NHeQw5YzUC2SWsAkc728EHZ1twm27BE/9xQSJ
         CVUbsYBgt0zWmfgcRfEr5koAtMqvQ8D/wUaBgN6IZimacbxvwOw06FpQ/v/gqftn7zV3
         3pLXj9d3YeuSRGqr/A5piIM/UjU2ljB0F0vTmbM74jDywAErFqvQmwXey3M+8UTm1S5F
         73uDmoALXwho95HoipMsgbzgT4LH70UR0bdSRQOqJz65uqjY3xzqEBhzTfMQcaKG0E+a
         Fn6etbvJqRD45FDmzDIduemqw0X/pL9MihDacJQiCKy/6KFgBVec6XC9v5yhbBQ9sRLH
         AmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751936158; x=1752540958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W485WHAP1uqJod7yt/QMj2+3WtWakaGzk8TE+3KhyPE=;
        b=jPg7/WKYPdNGtWPgcWGzbFoc9FF9RjLVAG1pOdovAB3/OIJLv3aPershq9SFWynCHm
         tkfAkeNHKu3lgkB10dvi/1s4sB0JFo0dDm/tQ6lASRLhhUtGc/gjVdxfiaDqpS9P5weR
         UOXhdv6/EaRzciHx2aUfRAfbL4LJyunBTm6G1sKJCUkUn+yCKhf0v/aAkn071p/B/phN
         ikg2e6O3Ah1xPZKBBlWswnh4YRVuov75JqpSvC26Tn6hvRht1HDqXbHk5jS9sFliHJ8q
         RQduz3xS4JRRdqKzfZs4GMcJvo6V8v5AexwWXR5iP34MVXZ1qxIZT93YwSs5rPj1dSaN
         NwpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCaU5+WRYQw4/AYYfcXsI57/EaAvJCJMsIams5Xurrf9wScR++lWQaOSWEqeX7uZEwfj4XvmRYSIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAS7N9zqc+7k5TX/TTnstnUM1gLWQWkirpTmQitMPA/5aSvU5D
	6a+IQSHnlcOkaVp2vr+Kgy8An5t88wZJFKDLgmwnplihsbE5uLh8mO2PMhyYPRt9xw==
X-Gm-Gg: ASbGnct4uKuAmLHAPV8vOKWVrPo4AQymad0Dkns976yTSI5VYbyWn2krr652+IA0uqA
	2XyFLUFfo11ZvcYbZz8DEVl5NKOoldwA8Q1AlwCYX4mscmM0CkonGRnDwwrp6wCw2z27upQV15H
	QnPSCl1SS001VT517CQY0dQpfVELJ5Bxbmcqw8bbc/l66Cbm2w6KrBsTK1rdQB5uLSB8OXI7M7Q
	R3CHIHlyq3iUOfaFtZl+A4W7vBr4ZjAR1vWFx0L7eweALtDEVA0z7OrzP0qleZyE4yvmEQjxZCs
	6liXjftKGYajsPqkAd2Xe86roGEFQL7u3uiTWT0LybkXK0wZskw8BlIlOBVlr2FTfuU2HUMiej7
	M7X29tUSEsA4nZXo26SJ9622IEebsIRavYxuV9GbvCv3wkb7A6wzkmkLaOE/p
X-Google-Smtp-Source: AGHT+IE2Y6RL3XN7SOZqgdPNO5uGsxBxp2KziPU4v6b4C3QEfxLieWn8MgzQq9cvik6V8PHCA4N4aA==
X-Received: by 2002:a17:90b:2d4f:b0:311:e9ac:f5ce with SMTP id 98e67ed59e1d1-31aadd9b5ddmr20638582a91.21.1751936157723;
        Mon, 07 Jul 2025 17:55:57 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e14:7:990d:1c2a:935c:f693? ([2a00:79e0:2e14:7:990d:1c2a:935c:f693])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm166800a91.1.2025.07.07.17.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 17:55:57 -0700 (PDT)
Message-ID: <776de517-ed60-4cf8-8790-531c1cafc512@google.com>
Date: Mon, 7 Jul 2025 17:55:55 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] usb: typec: tcpm: Add support for Battery Status
 response message
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@kernel.org>, Kyle Tso <kyletso@google.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250507-batt_ops-v2-0-8d06130bffe6@google.com>
 <20250507-batt_ops-v2-3-8d06130bffe6@google.com>
 <iqsj5w5pqcbjof3vqohhzptdp5xj7bir6digzqes775at2tpj2@r7kzy4j2fqmw>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <iqsj5w5pqcbjof3vqohhzptdp5xj7bir6digzqes775at2tpj2@r7kzy4j2fqmw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/23/25 2:27 PM, Sebastian Reichel wrote:
> Hi,
>
> On Wed, May 07, 2025 at 06:00:24PM -0700, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add support for responding to Get_Battery_Status (extended) request with
>> a Battery_Status (data) msg. The requester shall request the status of
>> an individual battery by providing an index in Get_Battery_Status. In
>> case of failure to identify battery, the responder shall reply with an
>> appropriate message indicating so.
>>
>> Battery status support is only provided for fixed batteries indexed from
>> 0 - 3.
>>
>> Support for Battery_Status message is required for sinks that contain
>> battery as specified in USB PD Rev3.1 v1.8
>> ("Applicability of Data Messages" section).
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
>> Reviewed-by: Kyle Tso <kyletso@google.com>
>> ---
> (partial review)
>
>> +static int tcpm_pd_send_batt_status(struct tcpm_port *port)
>> +{
>> +	struct pd_message msg;
>> +	struct power_supply *batt;
>> +	u32 bsdo;
>> +	u32 batt_id = port->batt_request;
>> +	union power_supply_propval val;
>> +	int ret;
>> +	bool batt_present = false;
>> +	u8 charging_status = BSDO_BATTERY_INFO_RSVD;
>> +	u16 present_charge = BATTERY_PROPERTY_UNKNOWN;
>> +
>> +	memset(&msg, 0, sizeof(msg));
>> +	if (batt_id < MAX_NUM_FIXED_BATT && port->fixed_batt[batt_id]) {
>> +		batt_present = true;
> power_supply_get_property(batt, POWER_SUPPLY_PROP_PRESENT, &batt_present);

Will update in the next revision.

Thanks,

Amit


>
>> ...
> Greetings,
>
> -- Sebastian

