Return-Path: <linux-usb+bounces-2738-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E0B7E646B
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 08:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 627B4B20C6F
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 07:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AA4DF40;
	Thu,  9 Nov 2023 07:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fYPYZfLH"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C687DDB9
	for <linux-usb@vger.kernel.org>; Thu,  9 Nov 2023 07:38:18 +0000 (UTC)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC2F4A4
	for <linux-usb@vger.kernel.org>; Wed,  8 Nov 2023 23:38:17 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-da41e70e334so603407276.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Nov 2023 23:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699515497; x=1700120297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+iBiX1bOHvpJxojh5UIDm67CaHAWofg3Cpxz0o8uBI=;
        b=fYPYZfLHL6GuBCWQf5BPl0mbCsvtDb3uvj6+2u2EZRsBS5jihzDOmohPIJvRYNdMqT
         XoInDYK5/V/j0eTwU44x0yOAswvbXEUM8KtVWh+AJK21Qzu/LVCq72UrsWYgtwPoypJH
         yKRbmcYGnvx/R1IBoZCqJ/d/GCx97SYHaTlVzYP7gHvY55kaJa8FHEauBVDI/ALhCeLU
         RG/NtPm11lssCKoaS+GiWfDbmdLbvK4hVuaL8JeSCPOtrhUNXZSPNWxzNEU3KJc2SX0q
         CP2J0td4+uyrmGlGhSLd9uayyg8h3zXsbxTE+vyUj/cEtQtqInH45Ed/ORwRjAcXIcvS
         CK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699515497; x=1700120297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+iBiX1bOHvpJxojh5UIDm67CaHAWofg3Cpxz0o8uBI=;
        b=G6znxgiiZD22KjahhTLSSkrjYLwtmTHRFRoeASc5lupXHayK2bvzvZCsFhUfmDLIQm
         ZmYNt4MY5X40onGjqQMIAWKjZ36c2lgrFdM50pV/y8H6mJ7wdYBv4twqvx2uH9A1bDPe
         inDkgyRUCGEfa2HFo09XEU/nHCEitTyz8Ms22xn3kbA771rFU6xQBxB/ZEP+c4JlLZGm
         kiPD5fEJ4KsKlFgQD0XZDqYYmknGU6RMu8xaHTzLMLnEy1Y1Mb2xg5X9tDA0UGUp4Xi6
         vHY5tRhfnOx0vWxKbiEIK3H33hzwCYiObCdAB6twhuQLxDh8503/a31LEK9LQRuEkPIJ
         OkhA==
X-Gm-Message-State: AOJu0Yy6iUsXKDR4jNuT/HQAYlJHv4TiURWT7MYQWkDX9Y/0vEL1/ue1
	mezi/CqwA7oyU7InhidTO6+z6w==
X-Google-Smtp-Source: AGHT+IENeTFbvsV4rkNBL5EgZoWoA+GPw7TiC5tkteseh8Q/+O7c8ydKT+7nJwKRQk1ScyNJLwjtRg==
X-Received: by 2002:a25:d0cc:0:b0:da0:4213:7c5a with SMTP id h195-20020a25d0cc000000b00da042137c5amr4254654ybg.2.1699515496612;
        Wed, 08 Nov 2023 23:38:16 -0800 (PST)
Received: from ?IPV6:2601:645:8100:1350:6ce3:194:86ca:9c36? ([2601:645:8100:1350:6ce3:194:86ca:9c36])
        by smtp.gmail.com with ESMTPSA id v4-20020aa78084000000b006be7d407a11sm10367708pff.178.2023.11.08.23.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 23:38:16 -0800 (PST)
Message-ID: <6ee5bf0d-415e-4042-b857-ff041d666295@google.com>
Date: Wed, 8 Nov 2023 23:38:14 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] usb:gadget:uvc Do not use worker thread to pump isoc
 usb requests
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.scally@ideasonboard.com, stern@rowland.harvard.edu,
 laurent.pinchart@ideasonboard.com, m.grzeschik@pengutronix.de,
 Thinh.Nguyen@synopsys.com, arakesh@google.com, etalvala@google.com,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20231103071353.1577383-1-jchowdhary@google.com>
 <20231109021251.542558-1-jchowdhary@google.com>
 <2023110953-tavern-underwent-63e7@gregkh>
From: Jayant Chowdhary <jchowdhary@google.com>
In-Reply-To: <2023110953-tavern-underwent-63e7@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/8/23 21:29, Greg KH wrote:
> On Thu, Nov 09, 2023 at 02:12:50AM +0000, Jayant Chowdhary wrote:
>> When we use an async work queue to perform the function of pumping
>> usb requests to the usb controller, it is possible that amongst other
>> factors, thread scheduling affects at what cadence we're able to pump
>> requests. This could mean isoc usb requests miss their uframes - resulting
>> in video stream flickers on the host device.
>>
>> To avoid this, we make the async_wq thread only produce isoc usb_requests
>> with uvc buffers encoded into them. The process of queueing to the
>> endpoint is done by the uvc_video_complete() handler. In case no
>> usb_requests are ready with encoded information, we just queue a zero
>> length request to the endpoint from the complete handler.
>>
>> For bulk endpoints the async_wq thread still queues usb requests to the
>> endpoint.
>>
>> Change-Id: I8a33cbf83fb2f04376826185079f8b25404fe761
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> Signed-off-by: Jayant Chowdhary <jchowdhary@google.com>
>> Suggested-by: Avichal Rakesh <arakesh@google.com>
>> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
>> ---
>>  Based on top of
>>  https://lore.kernel.org/linux-usb/20230930184821.310143-1-arakesh@google.com/T/#t:
>>  v1->v2: Added self Signed-Off-by and addressed review comments
>>  v2->v3: Encode to usb requests in async_wq; queue to ep in complete handler
>> 	 for isoc transfers.
>>  v3->v4: Address review comments around code style.
>>  v4->v5: Update comments. Remove 0 length request queueing from async_wq
>> 	 thread since it is already done by the complete handler.
> You forgot to run checkpatch.pl :(

My apologies, I sent out v6 with checkpatch.pl fixed.

Thanks


