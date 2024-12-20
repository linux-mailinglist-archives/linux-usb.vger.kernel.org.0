Return-Path: <linux-usb+bounces-18712-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2A39F9906
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 19:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90CC81899390
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 17:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8FF22A1E5;
	Fri, 20 Dec 2024 17:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V7POU4hv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AC11A072C
	for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2024 17:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715609; cv=none; b=StwtE1ZKsBAXeNf273UYb9nc05oCkDitfNEO+m+JJD+8YTmAe4Q6a3onI6j9K7U/a5gBBWInhDAFS4tpOxcJdy4UtZgFtUOK4CUgrCeENd4RL5ZT46WCS3P2UnknQ+851zGSA+GmxSnEhwOnfON+w2WCmc1szVngdXvqcxzYE9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715609; c=relaxed/simple;
	bh=jSIfjfNwHavGq9WpJTIF0YZrue0yP0dswsVOYiZCMwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PNpJc1XH043PjTG5KTy1Ll3qpZPgdJ2z6RyVhp9WzVsPZc+vf+Bk9guk+yA005yq8ePpj8P3S7owccQeEhqWh2QZCCy7MD8UF2ePQwXRgEdPA3x8kGNjMj6T374ICaG5cYK5rwgjkfvI2/9yPrJ0ZABN7t580IyGvXwXWoQM8wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V7POU4hv; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-844e1020253so76838339f.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2024 09:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734715607; x=1735320407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cKqCsprLhSjySiGtEbQs1cvNyLxgc/R4E/pyHq3A0Dg=;
        b=V7POU4hveEKl027DEmJ3SYDkhx0JuUme12Wy4DmnnphPZq/BJjZJq+wvdeJ/aBofyW
         iG5TFy/ml7YN5U6yLap/GwPesJTp7CHffhwOW1Q1Xhxx2vO8T1yQpGc3kK6rMOzV0WVh
         wENDwPbbpBp3Fk1Dxn2I0JuRTnU7c743/BUNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715607; x=1735320407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKqCsprLhSjySiGtEbQs1cvNyLxgc/R4E/pyHq3A0Dg=;
        b=FkEAxWQ7vBNhMYcIE7J0zQbgDK0cx4u4NSiLVRUCvuk4DCw8QKvcRC/BxmMJnCXJTI
         X0PBXujDbKeChebD5YOqjYAmQr6Qivpt/2mwzsn0+IUZvj5OiHJK+DQwJBFRBZ2P3rxG
         3xp+qRovdcNSGl0kvFm8jXKV3o+rDv+DLv8RuVvnlIMggdFfT9fvo5ZLp3dgnz5rDyYp
         cLanVw3wM6v/lkcSCrGRoa3W+620e+9AsddxhXpxv4yvknkNkomJAx2/OjmgkBPjxDf7
         /j1aLxoeknbYZd0CfcJOrCskrw5ZsxjlUMkP61VoumgJZsx9PUrTpjhRPNQPT7Ovk7By
         n8lw==
X-Forwarded-Encrypted: i=1; AJvYcCVpvqA8eeEWeyj4QSvAnSBfzOhV5dlUrlA5kk3hSJzaaxGZRLLOBHzcCo7wquQUBri5kgT6n3Wi5qw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjB6oj/XEDUco8lI5kMs+IF9HbZRBiN0IpLOXDIH6HFxT5o4Y8
	L6kF/hMBbhfL4iCzAqkwquho1v64bQtwdoQ7P9EHj6LJ8/6XBNbf1Ia7MtLKhRs=
X-Gm-Gg: ASbGncsLmctq4i5xfoFYLCIv5sHn0q7IIN1oIenYWag+pvRLfkbPfeo5M6bsOfcs8/I
	MsG1KPmu/LbbKAuqD4otO1njUOgx0X7ojxW7GR+J1P6MVbDflAPh3TdsJEOI7kdQIlITbQWa2qL
	MHeCdDAJhFiPs1iLpLlmLh3BefKOEI+ZA/fv7xc15w+eKVIzeV0yUOeM7enIJrIECaVWJV+zqm4
	3gv4IjBqEWvJj+hvvUeNz6S/kzpmAOGleOYXXy7XGftg07f/QZgknSm6o8BllTjusSv
X-Google-Smtp-Source: AGHT+IFLLsPVliqX3v9zo/RGcZvKpQTZmMP4V+904wwRJayq4zZHTb75BaAbxbm1RaTLx3iDUs/WYQ==
X-Received: by 2002:a92:c24c:0:b0:3a7:fe8c:b004 with SMTP id e9e14a558f8ab-3c2d2782c53mr28148945ab.11.1734715607126;
        Fri, 20 Dec 2024 09:26:47 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf67693sm890932173.44.2024.12.20.09.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 09:26:46 -0800 (PST)
Message-ID: <f797850d-49e4-4077-96d6-e88adcdefc4c@linuxfoundation.org>
Date: Fri, 20 Dec 2024 10:26:46 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: tools: update return status when failed
To: Hongren Zheng <i@zenithal.me>, Zongmin Zhou <min_halo@163.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241022064856.4098350-1-min_halo@163.com> <ZxdbKiwZ1fz4kAZw@Sun>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZxdbKiwZ1fz4kAZw@Sun>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/24 01:58, Hongren Zheng wrote:
> On Tue, Oct 22, 2024 at 02:48:56PM +0800, Zongmin Zhou wrote:
>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>
>> Have to set "ret" before return when found a invalid port.
>>
>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> Reviewed-by: Hongren Zheng <i@zenithal.me>
> 
>> ---
>>   tools/usb/usbip/src/usbip_detach.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/usb/usbip/src/usbip_detach.c b/tools/usb/usbip/src/usbip_detach.c
>> index b29101986b5a..6b78d4a81e95 100644
>> --- a/tools/usb/usbip/src/usbip_detach.c
>> +++ b/tools/usb/usbip/src/usbip_detach.c
>> @@ -68,6 +68,7 @@ static int detach_port(char *port)
>>   	}
>>   
>>   	if (!found) {
>> +		ret = -1;
>>   		err("Invalid port %s > maxports %d",
>>   			port, vhci_driver->nports);
>>   		goto call_driver_close;
>> -- 
>> 2.34.1
>>

Looks like I missed this one. Sorry for the delay on this.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, Please pick this one as well.

thanks,
-- Shuah

