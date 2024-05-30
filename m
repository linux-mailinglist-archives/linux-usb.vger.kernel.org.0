Return-Path: <linux-usb+bounces-10690-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F60C8D4584
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 08:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2C791C211CD
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 06:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3931E21C16A;
	Thu, 30 May 2024 06:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b="T6KmJN8d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BCB21019B
	for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 06:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717051120; cv=none; b=fZ51AZGhDAs0dlqgTujNaRAsdnSRa9iqJQ3zbHBTufJA1lhDBhJ5bZXTTNTI2Qxj2Psea4uYavlsPgXUuuWlgUWzU5IXgbOQOzyGCWWt6jYtjv9JZMvQdwkBNyQHxpDORex7w5yk3F2stGxdnf9D164faT9o3EGdymIJd+mXkPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717051120; c=relaxed/simple;
	bh=3iSSVFjIwnSFCrdOdDZd6ny8U3SfjsDDOMMrtMc+HQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkzBtnweWfE9J2yPnERz6XI9OV4LG4tbQeZdHnmjJzOcpO/DOslT/ktenjBig3gBvLjgBn3G7RTFpsw8AyUuUeecYVm/FIw6x3fBjAEn859OIqOJgZC4RBJztkiwNoVGITfIHcvBoBnhdr6Fua4N7r3FSS+EAwZgdS0C7vOmtjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org; spf=pass smtp.mailfrom=me.ssier.org; dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b=T6KmJN8d; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.ssier.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-df78b040314so539180276.0
        for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 23:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1717051117; x=1717655917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6I6bUq5MtPsSJCD04nOMib7SEtzLq2qYb33NbiPQPqo=;
        b=T6KmJN8dXKR+gpQFlofwnZqiUAG120afg0GLGnolKa3n452as6YE2ZaqJ0/pcYqI/U
         kAGnFFCjM/ysx5Um8pNs5y1jS1PNk9Ieacbo2EKsE3IWnpHPZx3UCGC9LA9ZtfdpAZgK
         QuzPB1e2+364hHmok3+AB35YTijGqENENGMxlKVMW8QmD9q6Emqztxc1LKzJkHfnUaub
         LmI8XQNdxN3qW5d4X8J4JxBKx5SLpzB4207Igb086uK494CtGE6GEwnPZqrvrsucOm+v
         GOBdG1WNA0uF/dq64ChutGhr5Zt1q1dB+RMlwCbnAGARrpGKNBT5dPWybaR2gk0B8IGJ
         vQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717051117; x=1717655917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6I6bUq5MtPsSJCD04nOMib7SEtzLq2qYb33NbiPQPqo=;
        b=DtC5GiISeHNI2JslorUfM4fxzaGXAgfVGwQ+sUtXIgZK6NE+zPo2W9hD+KxQoycjuz
         Apj6vg0NuCQoIRZQqb1qQeGqRhJgyzQpzZoPhqGbV6njTGRLkvhajNFG5uPCSYlrI+c/
         mHqoK1P7/yDvJF8l7UiSVEIolTLrVXKLna+7+GVU0nLYTSboKwNlTtAkXPWumYI8ujEB
         ydgFI1T4MyeYdWfVht9ceg152HuacvwFOeH6acRQrmaCcpkZup+ePb+8hc5NxKPXCw5T
         jPLY0rnAPdLmmY7bJgDmu9bHbiffw1nSPLlDVY5AupMc9qPSZeFkMn6MYq4YvzC+aeuY
         Nuww==
X-Gm-Message-State: AOJu0YwAmuntUCkHDwzEmB7DzM0aAibyv2xJ3hSncXTWEvEGPe+UDqHk
	CjBpG9f/eZdVsUAKX+aWPSg6OkEtPIoNrnGFHmfg5AqVqu0kCHnAeUnty94NZvU=
X-Google-Smtp-Source: AGHT+IF7XKqWolRteq20RdszdOCxHfIqaWsAlefedQXQH0si50DrOE1KOgzxBdM/g6qKNQxWSjjdWw==
X-Received: by 2002:a25:a2cb:0:b0:dfa:584d:5e3b with SMTP id 3f1490d57ef6-dfa5a5b7f75mr1425987276.6.1717051117021;
        Wed, 29 May 2024 23:38:37 -0700 (PDT)
Received: from [192.168.2.14] ([74.14.126.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ac162ef87fsm60876626d6.80.2024.05.29.23.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 23:38:36 -0700 (PDT)
Message-ID: <87546d93-3fe7-4459-b44a-47cbcab9da74@me.ssier.org>
Date: Thu, 30 May 2024 02:38:25 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: chipidea: move ci_ulpi_init after the phy
 initialization
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Peter Chen <peter.chen@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, wouter@franken-peeters.be
References: <20240328-chipidea-phy-misc-v1-1-907d9de5d4df@pengutronix.de>
 <CGME20240425194033eucas1p2c1e98d1c55c970e246087e2dab180e84@eucas1p2.samsung.com>
 <21ea292a-b1d1-43e2-92ab-9f1f63aaf729@samsung.com>
Content-Language: en-US
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <21ea292a-b1d1-43e2-92ab-9f1f63aaf729@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-04-25 15:40, Marek Szyprowski wrote:
> Dear All,
> 
> On 02.04.2024 08:23, Michael Grzeschik wrote:
>> The function ci_usb_phy_init is already handling the
>> hw_phymode_configure path which is also only possible after we have
>> a valid phy. So we move the ci_ulpi_init after the phy initialization
>> to be really sure to be able to communicate with the ulpi phy.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> This patch landed in linux-next some time ago as commit 22ffd399e6e7 
> ("usb: chipidea: move ci_ulpi_init after the phy initialization"). 
> Unfortunately it breaks host USB operation on DragonBoard410c 
> (arch/arm64/boot/dts/qcom/apq8016-sbc.dts). There is no error nor 
> warning in the kernel log besides the information about deferred probe 
> on the chipidea controller:
> 
> platform ci_hdrc.0: deferred probe pending: (reason unknown)
> 
> Tomorrow I will try to investigate which operation during driver probe 
> triggers it. If there is anything else to check that might help fixing 
> this issue, let me know.

I am also seeing this issue on a msm8974-based device.

There is also a report and analysis by Wouter Franken here:
https://lore.kernel.org/all/ecb8d3e8-d525-4a2d-a868-803202c16296@franken-peeters.be/

Reverting the commit does fix the issue for me.

Adding to regzbot for tracking:

#regzbot introduced: 22ffd399e6e7 ^

Thanks,
Alexandre

> 
>> ---
>>   drivers/usb/chipidea/core.c | 8 ++++----
>>   drivers/usb/chipidea/ulpi.c | 5 -----
>>   2 files changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
>> index 835bf2428dc6e..bada13f704b62 100644
>> --- a/drivers/usb/chipidea/core.c
>> +++ b/drivers/usb/chipidea/core.c
>> @@ -1084,10 +1084,6 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>>   		return -ENODEV;
>>   	}
>>   
>> -	ret = ci_ulpi_init(ci);
>> -	if (ret)
>> -		return ret;
>> -
>>   	if (ci->platdata->phy) {
>>   		ci->phy = ci->platdata->phy;
>>   	} else if (ci->platdata->usb_phy) {
>> @@ -1142,6 +1138,10 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>>   		goto ulpi_exit;
>>   	}
>>   
>> +	ret = ci_ulpi_init(ci);
>> +	if (ret)
>> +		return ret;
>> +
>>   	ci->hw_bank.phys = res->start;
>>   
>>   	ci->irq = platform_get_irq(pdev, 0);
>> diff --git a/drivers/usb/chipidea/ulpi.c b/drivers/usb/chipidea/ulpi.c
>> index dfec07e8ae1d2..89fb51e2c3ded 100644
>> --- a/drivers/usb/chipidea/ulpi.c
>> +++ b/drivers/usb/chipidea/ulpi.c
>> @@ -68,11 +68,6 @@ int ci_ulpi_init(struct ci_hdrc *ci)
>>   	if (ci->platdata->phy_mode != USBPHY_INTERFACE_MODE_ULPI)
>>   		return 0;
>>   
>> -	/*
>> -	 * Set PORTSC correctly so we can read/write ULPI registers for
>> -	 * identification purposes
>> -	 */
>> -	hw_phymode_configure(ci);
>>   
>>   	ci->ulpi_ops.read = ci_ulpi_read;
>>   	ci->ulpi_ops.write = ci_ulpi_write;
>>
>> ---
>> base-commit: 5bab5dc780c9ed0c69fc2f828015532acf4a7848
>> change-id: 20240328-chipidea-phy-misc-b3f2bc814784
>>
>> Best regards,
> 
> Best regards


