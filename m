Return-Path: <linux-usb+bounces-1688-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3987CB135
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 19:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37B222816F6
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 17:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F8431A7A;
	Mon, 16 Oct 2023 17:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZAgpocJE"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A87F30FBA
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 17:19:47 +0000 (UTC)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0506183
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 10:19:44 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7a2874d2820so57571839f.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 10:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697476783; x=1698081583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgUa+mKvmsmGKgSXxgXS6XuuY5vQ/8sgjMNQWn66qJU=;
        b=ZAgpocJEXXYkm5caiZ4CN5fHG0ZSWLSXEMEztK+uOTyjLaleHYlZv7xdtNvdSCwCg2
         iMKfbhtopRFsabF0LDQ3GFWRBNaV9YtqfI2g1olPMxEWp7WcmkdE4iGYlDzFYRJ0zqwL
         APMZM31DZMdAKAt6KFELS5NVdlvfsWWftF75E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697476783; x=1698081583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QgUa+mKvmsmGKgSXxgXS6XuuY5vQ/8sgjMNQWn66qJU=;
        b=dt4ohOCIgda8Z3fTSCdKEumtyDS62P9nQ5dnAfmQOeC8bRCQYH3/avH77zZyjYcffr
         iZuhBYr+3iIc8SJOvcQqP3Wn2Hkk4fFpITi0hgbLthhy53hgEGGY4AhUabaYThuarU9x
         4+eEFXYrEmieBiBFt2zIF8YlTWaMMKsvVILG2HEucYVO6qrq+H9K+ZIzOiTXzeG2xlhU
         yNOKsvbBED81kINmZcka1BJHdOp04i4Txel9UQMQR75KtgztXMDLzWeiQqCV+juxYsvQ
         UaHOqGSrKT2JRp+9lh6tRlIXbZjt9dHlyOFjqSqqMUBFFOgBCM3qxaH6Cv9eDNSgQLQR
         ncGg==
X-Gm-Message-State: AOJu0YxEbciBA+778EMKVR7MUL724pYe7bha4VthwjZB/pFgr+Fi1XaO
	74UCU6rryOLJBJD2I2yqHU1JMw==
X-Google-Smtp-Source: AGHT+IH01KOJB7womZ3bhd3IAY5anUtTZrEzFuuJ1qqL/RrjkhKbEMdf0j89Pwsvv9woipq/08kmpQ==
X-Received: by 2002:a92:cac7:0:b0:351:54db:c1bc with SMTP id m7-20020a92cac7000000b0035154dbc1bcmr98759ilq.0.1697476783349;
        Mon, 16 Oct 2023 10:19:43 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id r2-20020a92c502000000b00350b7a9f0c1sm3498858ilg.62.2023.10.16.10.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 10:19:42 -0700 (PDT)
Message-ID: <8328df87-67d0-43a8-aa6a-4b9587089e3a@linuxfoundation.org>
Date: Mon, 16 Oct 2023 11:19:41 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 -next] usb/usbip: fix wrong data added to platform
 device
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hongren Zheng <i@zenithal.me>
Cc: Shuah Khan <shuah@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Valentina Manea <valentina.manea.m@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
 Shuah Khan <skhan@linuxfoundation.org>
References: <ZSpHPCaQ5DDA9Ysl@Sun> <ZSzo816RQEP1ha/l@smile.fi.intel.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZSzo816RQEP1ha/l@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 10/16/23 01:40, Andy Shevchenko wrote:
> On Sat, Oct 14, 2023 at 03:46:04PM +0800, Hongren Zheng wrote:
>> .data of platform_device_info will be copied into .platform_data of
>> struct device via platform_device_add_data.
> 
> platform_device_add_data()
> 
>> However, vhcis[i] contains a spinlock, is dynamically allocated and
>> used by other code, so it is not meant to be copied. The workaround
>> was to use void *vhci as an agent, but it was removed in the commit
>> suggested below.
>>
>> This patch adds back the workaround and changes the way of using
>> platform_data accordingly.
> 
> Good learning to me, thank you for the fix!
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 

Thank you both.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

