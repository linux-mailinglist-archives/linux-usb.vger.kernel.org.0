Return-Path: <linux-usb+bounces-23178-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D127A9166D
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 10:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2D2E189F433
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 08:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4728722E3E2;
	Thu, 17 Apr 2025 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="brim1i8g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BB21E32C6
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744878454; cv=none; b=k8pRN4mX3uQV9Bbsaj9/k/GMJT9/ohY2MbrCiXLD9zUOVRY8s6eSN4Hgeum5knDVb/0dmSuSOUxWX9T2l7cr8DvlW37DroW6yvp9bkNoDdB08FEMRHZVwkxdCU0sgUVkDyk3yHzrghtIkLBDv+rc+4OHeCNgH0/nJcNg+pMJdDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744878454; c=relaxed/simple;
	bh=Ys7turLPNUrCbQ/IqSXrDiwYLViP3PKPFaDGr1MT3mM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BTAwkYHcbvjos7cr7eEVmfqupPg4YfOWJgfcVD1mqsB1oHYW+4cDf8obkyLcRFa7Aw2UEm3/M5tG1HVfHbc41bFn8DHi9sxemoRXVh9Cfm8ztBZETyhNon13jcgZCMdcG3qLnNhbgb99Q4B4tnSEbuZ2J5pJEWEwDHUm1nrDl/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=brim1i8g; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so163165e9.3
        for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744878451; x=1745483251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f5PvR3AodARroRTyuj8IWmURh8VDNFVUppDggbzQxys=;
        b=brim1i8gmk9uDMmdzM4k5IZ3ddMIC1HmEpaO4t/+LR9skPYAf1Ne6yZB0UPa0fvVhc
         dmPPRKIZqSFpXrHCtpZ0lKa8o9SLNH+/Qe1I54BAmAE74rmLnYiIkfTaAPYdupaanv52
         kEx+68MqkjcUDfXoKa3v7ITDTPbN3PP3IXn9qCnCK0Fj8ai7O93VTAASSm70oDPzapzG
         QPYmjZG1BzvZjy66jpMLPpuPiQFNYBrKlRN3DkAKOgv+7Kz/vUNHYMKHkCavmWQfhqow
         PC14M1hxmMOsHfmE74GGrWlsnq/OghRdCShpJugoMCZTx++iPB/PBYlxJr6y9cA/I5Qq
         iR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744878451; x=1745483251;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5PvR3AodARroRTyuj8IWmURh8VDNFVUppDggbzQxys=;
        b=vA88RFXsNKQSz0kvE53yUaG0rWjZ68ZU1w5OYarM3ZAQl++OGLrJjnDyFWdte03/7o
         VRq7X59XUoyCr8gLcg268qCMXkzwVWGKUdqy9DCZuF2IpsvUTwLsYmYTIIMWr3Dmuu5g
         z+pY9xy18U5+y1hb48V5KC9YfTumq/IJjOTbdwDouqb0YfOeSUwGf6Migz10VZ0gMl+B
         5aWCfiTgigIOuRY21LKFivcf+MAIiXz5sBCcV/brD13fFJc0aIaVytGlD6UHwtfJtyvK
         6R/HUKv8GoGmxjF5xjrNych5H4SvUEBQAksg4E1gUd7ztlcPkYI5kY7DHw5lSe/rPFcS
         4wmg==
X-Gm-Message-State: AOJu0YwzG3GYbMnkLDWvRSZ6C4lHPESaT5EnhPG2iuxIN9ad6kQa8S88
	qCIxLjiwU1FdhQpSBC1lcoPUghVBhcANXLnlmGMA788PtuY0Ja8eJCt60ZXyXH0=
X-Gm-Gg: ASbGncsBviLK6hfze+1JbaVpMWmOgcJZEx0XECea/Pcbr+3DrLi7cft2KHGFqX6zk/7
	da1mDOtrKUIhPexufFA0BluynZjkdcdtxS7PCklwfCnB5ZPXWSZAeEp9f7r614WkGgBfV4iP38d
	Tez6F9YErB1CpE9uBz+Swg7Fep8PJbRpVMtN5FN9SH9yUEl2m5d9vdm5iZjIjm98qgNKqTAPgSJ
	fvMnrRryp990nmF7H/cpyl+ooc1hB+IcWkumqHoUUe0/Hh7hhyML/aiGqB5iVgTQXEXV8WgqH3z
	8ci7FF7/7Y3MTU/xRxvDp2WRmFwrn2rXA3Dbc7qOUmrgZojoqVtJ3/UQXkz0mU+Tm33lkIu53lk
	oDFCk1vamfJBKyNCu
X-Google-Smtp-Source: AGHT+IEcGbORPITh0fLvXCs/AzuHGYG5B9pgjdozQySOTPwc6DbyW89ut0VlnjxCwO44OoH8xIv1Eg==
X-Received: by 2002:a05:600c:b90:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-44062a3b804mr6837235e9.6.1744878451200;
        Thu, 17 Apr 2025 01:27:31 -0700 (PDT)
Received: from [192.168.0.101] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d3523sm44540455e9.15.2025.04.17.01.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 01:27:30 -0700 (PDT)
Message-ID: <d4bfefc7-cdd0-46d7-aa0e-d038f3c43e36@linaro.org>
Date: Thu, 17 Apr 2025 10:27:28 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: host: omap: Do not enable by default during compile
 testing
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250417074634.81295-1-krzysztof.kozlowski@linaro.org>
 <2025041747-cruncher-exposure-590c@gregkh>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2025041747-cruncher-exposure-590c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2025 10:22, Greg Kroah-Hartman wrote:
> On Thu, Apr 17, 2025 at 09:46:34AM +0200, Krzysztof Kozlowski wrote:
>> Enabling the compile test should not cause automatic enabling of all
>> drivers, but only allow to choose to compile them.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> For longer rationale:
>> https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
>> ---
>>  drivers/usb/host/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>> index d011d6c753ed..6dedacba94b3 100644
>> --- a/drivers/usb/host/Kconfig
>> +++ b/drivers/usb/host/Kconfig
>> @@ -225,7 +225,7 @@ config USB_EHCI_HCD_OMAP
>>  	tristate "EHCI support for OMAP3 and later chips"
>>  	depends on ARCH_OMAP || COMPILE_TEST
>>  	depends on NOP_USB_XCEIV
>> -	default y
>> +	default ARCH_OMAP
> 
> Should this get a "Fixes:" tag as well?
> 
I think not, because some people's intention was to enable everything
during compile test, thus it was not a bug, but a feature.

Best regards,
Krzysztof

