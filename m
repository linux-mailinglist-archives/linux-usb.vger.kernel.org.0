Return-Path: <linux-usb+bounces-7723-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95978761CA
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 11:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB2FE1C20B2A
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 10:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214C654BDB;
	Fri,  8 Mar 2024 10:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKID+KN+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33425380F
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709893157; cv=none; b=n8zTMHUcJkNkRslCztWwIL6sh7KKkCvtWHk6ttfCM2iGx7DOf9iZX8IkUxNocge20Nih5eQDsrsS5F5/O/e2X8fXaOzdBRe+wibWMXhZI1LcrC1VFW5Ghq2MOUstNOgCVl0ZuOItw1jki6BHmrVUAUZaIaschMDapbB+6mbnec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709893157; c=relaxed/simple;
	bh=NX3InaXVbs5yRlId/9PGjfLJukYdFdm2d8cL0bzXnJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYsKYTOEWNPKIyOvmZeN2/VsBine5+UVApzvbLlhhjVc2f6ur34oMSqx236fNnRm9d3KpOdBvXAhF0xs4Ak9dFx8YBZhPujtsFEiuHkSvt/Z6jOv2mUUmYEixGtxe1I+cnLY0PTRyK9OBWCoXm61kZeYdSWvlyVBYRtw97bmgqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKID+KN+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51325c38d10so2875825e87.1
        for <linux-usb@vger.kernel.org>; Fri, 08 Mar 2024 02:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709893154; x=1710497954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONhoNlwwjw1VdgEzAxiGB368edEz+Lu/aDaluFk2bQo=;
        b=HKID+KN+OjiWQjPBQrmDvCpO5yA9RHKPg5kuwc5du700tKymoc44PCp/Jj3AcSkaOC
         9GekRpHth0jXtvXSMpYz18RZnMQAFchCh5q0V9Gi7VMElvCnIAEwKqkBuAkyWj2UeHXt
         53Fz8928PGIEAPnlUyIh64mOEmfFQ2tfCaaEXFwE7gW+zxIgBoePVIyOZxOpSipCb5XZ
         +P1KNmxxcJPaVBkaxUTKYgYQGb+bq1p0dstuuiCgtowD7lqvkhBPEypnCh37OK4m1YS7
         g5dR77vY10GPxcYYO52wUPd/b+0Frj1aQbwTU6JJz70Ih2MfW+pJdG8t03M4kNMb7lBS
         g/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709893154; x=1710497954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONhoNlwwjw1VdgEzAxiGB368edEz+Lu/aDaluFk2bQo=;
        b=JNET06D6ZmzPXQC7Q8ADTDJRkNYmiQ0avqNmEKfWukYeBc6EtZy4cVudGDmJ0KU9QU
         XpKAydihveM1Ui60dYbbtUybI62v6BLRy2HEdeAxPK/hbCgtSH4niaCEYbvLXSFxQwBl
         Jr7lLQy5wAeYfCh4GbskllSgZOnASz/4WospXv6G4huuEV1NQHW6AYIiNPWXMQJdRxOz
         Eqt1OqnF/T7vUGi49TOVyVvm78lZnujPEfqI2BGMN2mY6f2SsAZLPKZJPUN+CTpnHuLB
         C/bZeFN/GUvLEnYlByrt8JsvCEPJMQH6XSGj2ktyiQmCe++tu6bhik/PH6hHil0S/d8c
         EsoQ==
X-Gm-Message-State: AOJu0Yz44oNa1t4FayCfllzpOZ6WEeN09JsH/JH57ZdLuuXZ9MeImiW4
	LnY89HyODOdC9aU+XxN97EXwsMVhpo3CY3/bijdR1rbo6OLEDVx9
X-Google-Smtp-Source: AGHT+IG6L6cJkb8nlsKepee1o35N1DQhzVTSfJmjHZ2xlaLiiAibyFagBS+bng5ZO3FeBX6MtENN1Q==
X-Received: by 2002:a05:6512:4c6:b0:513:922a:4334 with SMTP id w6-20020a05651204c600b00513922a4334mr674861lfq.1.1709893153525;
        Fri, 08 Mar 2024 02:19:13 -0800 (PST)
Received: from ?IPV6:2001:678:a5c:1204:db7b:6df3:1a86:f66a? (soda.int.kasm.eu. [2001:678:a5c:1204:db7b:6df3:1a86:f66a])
        by smtp.gmail.com with ESMTPSA id a24-20020a195f58000000b005132cbd06e2sm3263908lfj.244.2024.03.08.02.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 02:19:12 -0800 (PST)
Message-ID: <1cdfff7e-a63e-4618-b07e-e071187a3f14@gmail.com>
Date: Fri, 8 Mar 2024 11:19:11 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: usb-acpi: Set port connect type of not
 connectable ports correctly
To: Mathias Nyman <mathias.nyman@linux.intel.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu
References: <20240223140305.185182-1-mathias.nyman@linux.intel.com>
 <7e92369a-3197-4883-9988-3c93452704f5@gmail.com>
 <78fb735f-3279-40a3-8d12-201a62b13942@gmail.com>
 <7095a67d-b82d-6411-a9b9-ece40d572ad1@linux.intel.com>
Content-Language: en-US, sv-SE
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <7095a67d-b82d-6411-a9b9-ece40d572ad1@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2024-03-08 10:37, Mathias Nyman wrote:
> On 7.3.2024 19.28, Klara Modin wrote:
>> On 2024-03-07 17:04, Klara Modin wrote:
>>> Hi,
>>>
>>> On 2024-02-23 15:03, Mathias Nyman wrote:
>>>> Ports with  _UPC (USB Port Capability) ACPI objects stating they are
>>>> "not connectable" are not wired to any connector or internal device.
>>>> They only exist inside the host controller.
>>>>
>>>> These ports may not have an ACPI _PLD (Physical Location of Device)
>>>> object.
>>>>
>>>> Rework the code so that _UPC is read even if _PLD does not exist, and
>>>> make sure the port->connect_type is set to "USB_PORT_NOT_USED" instead
>>>> of "USB_PORT_CONNECT_TYPE_UNKNOWN".
>>>>
>>>> No bugs or known issues are reported due to possibly not parsing _UPC,
>>>> and thus leaving the port connect type as "unknown" instead of
>>>> "not used". Nice to have this fixed but no need to add it to stable
>>>> kernels, or urgency to get it upstream.
>>>
>>> With this patch (f3ac348e6e04501479fecf55250b25ff2092540b in 
>>> next-20240307), my machine fails to boot. I was able to get some 
>>> kernel console output from the pstore when compiling USB support as a 
>>> module instead of built in. Reverting it on top of next-20240307 
>>> resolves the issue for me.
>>
>> Correction, it does boot when building USB support as a module. Got 
>> more logs from the unhealthy system and lspci. lsusb shows a single 
>> USB 2.0 root hub and nothing else. Calling it with `-v` hangs and 
>> produces nothing useful, the same happens with lshw.
>>
>>>
>>> Please tell me if there's anything else you need.
> 
> Thanks for reporting this.
> 
> Looks like *pld might never get set in some error cases, and we end up
> freeing some random pointer.
> i.e if status = acpi_get_physical_device_location(handle, &pld) fails
> 
> Could you try if this helps:
> 
> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index f250dfc3b14d..7f8a912d4fe2 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
> @@ -154,7 +154,7 @@ usb_acpi_get_connect_type(struct usb_port *port_dev, 
> acpi_handle *handle)
>          enum usb_port_connect_type connect_type = 
> USB_PORT_CONNECT_TYPE_UNKNOWN;
>          struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>          union acpi_object *upc = NULL;
> -       struct acpi_pld_info *pld;
> +       struct acpi_pld_info *pld = NULL;
>          acpi_status status;
> 
>          /*
> 
> Thanks
> Mathias

That indeed looks to be the case, this fixes the issue for me.

Thanks,
Tested-by: Klara Modin <klarasmodin@gmail.com>

