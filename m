Return-Path: <linux-usb+bounces-1146-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 846177BA023
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 16:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id E2332281E42
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 14:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF0128E34;
	Thu,  5 Oct 2023 14:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fr2fR6/s"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA741125DD
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 14:34:12 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11E065AE
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 07:33:56 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7a2874d2820so14365139f.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Oct 2023 07:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696516435; x=1697121235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QXhhPLEbAH2Co1vOCJVLpu3VNCebYxHTaxUBPSL3m/A=;
        b=Fr2fR6/sJIOJCoOuJUi58GJngqPaA/HSFSa0fJhJ0ldiySmGOcjhyPTuaUVI/U5Oz3
         rYl1vLlsXhNp/pZMBiIupFFan+bOh+xkTqM08MXOQBWjFlimRsqPrdAHQUQ22p33Wtbq
         kHoNN8ycuVZA6lpw3qhZdgawSzehMgB8tchYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696516435; x=1697121235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QXhhPLEbAH2Co1vOCJVLpu3VNCebYxHTaxUBPSL3m/A=;
        b=PCXxXtRyVSh4vdAnZR8NOzBi9iT9TEJ18pHtFqub9Kf0mv5er6Q7ZdOexgAqnNLpH3
         kgm2O4FLBUV5o8Vxa/KjOVS4z6Ij7bjdipYMpt6lz618Y3g+RU29DCE4OOA+Kzkv972t
         sEsB3APPBOMHSPLnqMIaB2ZX3Es6d2fJPLlSxe683BkrHN099LyJhEYsj0Myu0vI64if
         FsJxrM8x3LjSIGYPBi5f1tf95YEBRfl7CPaB9AvytxDd1zbc1Ee39syt+YTiCMFIAT7l
         2ohtFMoucrwllMcXAGVnLH7yc6/a84BAb8ogalPEc1LAJuoehed32P3ODoXCzODGDeq/
         2deA==
X-Gm-Message-State: AOJu0Yztn3XbqB9w/V7VjWTtyiwNG9qr8UDpwTwngaokXFYfiIEcvcfm
	jkYEMzjcb5xYPcgPFOGg3JDSNw==
X-Google-Smtp-Source: AGHT+IHO+aFM7ha6XCEPzgrAXCsvNjRwxGCPHmreI2zNmrs7Itj3mlYvL2vecXZPtwUHFZ4V9sHWOw==
X-Received: by 2002:a05:6602:140c:b0:79f:a8c2:290d with SMTP id t12-20020a056602140c00b0079fa8c2290dmr6926134iov.0.1696516435724;
        Thu, 05 Oct 2023 07:33:55 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id y10-20020a02bb0a000000b0043e8735ea85sm461243jan.144.2023.10.05.07.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 07:33:55 -0700 (PDT)
Message-ID: <e56353b2-a814-4a81-9516-63736d12abba@linuxfoundation.org>
Date: Thu, 5 Oct 2023 08:33:54 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] USB: usbip: fix stub_dev hub disconnect
To: Greg KH <gregkh@linuxfoundation.org>, Jonas Blixt <jonas.blixt@actia.se>
Cc: shuah@kernel.org, valentina.manea.m@gmail.com, stern@rowland.harvard.edu,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20230615092810.1215490-1-jonas.blixt@actia.se>
 <2023100548-kleenex-deceased-624e@gregkh>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <2023100548-kleenex-deceased-624e@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 10/5/23 01:22, Greg KH wrote:
> On Thu, Jun 15, 2023 at 11:28:10AM +0200, Jonas Blixt wrote:
>> If a hub is disconnected that has device(s) that's attached to the usbip layer
>> the disconnect function might fail because it tries to release the port
>> on an already disconnected hub.
>>
>> Fixes: 6080cd0e9239 ("staging: usbip: claim ports used by shared devices")
>> Signed-off-by: Jonas Blixt <jonas.blixt@actia.se>
>> ---
>> v2:
>>   - Clarify comment
>> v1:
>>   Link to v1: https://lore.kernel.org/linux-usb/20230615092205.GA1212960@W388ANL/T/#m575e37dc404067797eadf4444857366c73ba3420
>> ---
>>   drivers/usb/usbip/stub_dev.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
>> index 2305d425e6c9..2170c95c8dab 100644
>> --- a/drivers/usb/usbip/stub_dev.c
>> +++ b/drivers/usb/usbip/stub_dev.c
>> @@ -427,8 +427,13 @@ static void stub_disconnect(struct usb_device *udev)
>>   	/* release port */
>>   	rc = usb_hub_release_port(udev->parent, udev->portnum,
>>   				  (struct usb_dev_state *) udev);
>> -	if (rc) {
>> -		dev_dbg(&udev->dev, "unable to release port\n");
>> +	/*
>> +	 * NOTE: If a HUB disconnect triggered disconnect of the down stream
>> +	 * device usb_hub_release_port will return -ENODEV so we can safely ignore
>> +	 * that error here.
>> +	 */
>> +	if (rc && (rc != -ENODEV)) {
>> +		dev_dbg(&udev->dev, "unable to release port (%i)\n", rc);
>>   		return;
>>   	}
>>   
>> -- 
>> 2.25.1
>>
> 
> Shuah, what ever happened to this change, is it correct or was something
> else applied to fix it?
> 

Sorry for the delay. I thought I took care of acking this one. :(

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


