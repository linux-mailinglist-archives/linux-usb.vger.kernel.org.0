Return-Path: <linux-usb+bounces-2438-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC957DE7F3
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 23:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 256E31C20E1A
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 22:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B721BDEC;
	Wed,  1 Nov 2023 22:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="clx1ASjh"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A82C11CBB
	for <linux-usb@vger.kernel.org>; Wed,  1 Nov 2023 22:14:02 +0000 (UTC)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD1E10F
	for <linux-usb@vger.kernel.org>; Wed,  1 Nov 2023 15:14:01 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3b566ee5f1dso217059b6e.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Nov 2023 15:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698876840; x=1699481640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlCR/tLfeyi2t/6kexPICovuqpYCh6D5uLc0MpM42zU=;
        b=clx1ASjhxySIpiT+9S/iX6wpXXiuJ1jHocfu63PCcZci14X0rJ4oLCgr2ZjVDcjEb2
         e0m9lugAAbxP7OEhmg0ANyc73YYMa7r8zxaPpWe/AXM6EsEFCwvYS4YVGrVP1Y2Ey8jN
         oLLEqC2DxkPRjUFzy0ozRAmQxY9XZdj3TlmFTwxQQVJPP+xn8dScmvJ+w7FIw/jAfHGZ
         hNvrNvaZmC6LEuVU4uT/EGKsJnc9h+vzTOrQXrJPmOPC9bg8+cRa/RRGrsCgG0y1YPrI
         9F5B6SHcA1Zs9Z1CxKb9vNLfFYzaCwjNIXYmpDqkma1IHtnHIQp05eS7tO2k7jmHqepD
         KugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698876840; x=1699481640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vlCR/tLfeyi2t/6kexPICovuqpYCh6D5uLc0MpM42zU=;
        b=Of6nANnLm6lqngOtvnb03hCVKrrX8WsOGlBxzUeyhqsnZ42GYgS6M1AvGLhnTvr1ca
         m9CDZM8W53VCr2/JFVrfC97ofbUWxCWsxJoFUFVWnwoK9Z6SjuIAISmhoODDTj43w7hQ
         aaDZvWt8nyTfVmUdfyvEVJ99L4hKHtVpuyqS1afRwSaMBcu+V3zme9xFyoHE3DPFLNC4
         /nH/mOf+EgTQj4JNFZIFy+eg2mWk4FXO8yCuCmLIk999BHaZngFKsEPglr0b3Tqc6gPl
         ExR6F8VubLesqYONAWMjEaYObn2KyzSXT14mBugycKc8RrJklzrJkYbyRnEnB+Qrucda
         wUxg==
X-Gm-Message-State: AOJu0Ywo7W37CDopd6qN3z0dlFbtes/FxEpzuLjE50FqS4erfZ52Q2jO
	7S9uDF644KQa+PdxNT+Q4DunDA==
X-Google-Smtp-Source: AGHT+IGWBafYpym6IOSMbRqd53gquhbqtYIFv73RgIewZiuiQDtXVDi9y84GeqUuJPFa/BOiphfZKQ==
X-Received: by 2002:a05:6808:8db:b0:3ae:5e0e:1669 with SMTP id k27-20020a05680808db00b003ae5e0e1669mr17916649oij.42.1698876840645;
        Wed, 01 Nov 2023 15:14:00 -0700 (PDT)
Received: from [192.168.60.239] (183.43.230.35.bc.googleusercontent.com. [35.230.43.183])
        by smtp.gmail.com with ESMTPSA id fh37-20020a056a00392500b006c03f58b5b1sm1682286pfb.59.2023.11.01.15.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 15:13:59 -0700 (PDT)
Message-ID: <d08b080c-54cc-4fdf-929a-df2b6ad41844@google.com>
Date: Wed, 1 Nov 2023 15:13:58 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] usb: gadget: uvc: Allocate uvc_requests one at a
 time
Content-Language: en-US
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: etalvala@google.com, gregkh@linuxfoundation.org, jchowdhary@google.com,
 laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, m.grzeschik@pengutronix.de
References: <73309396-3856-43a2-9a6f-81a40ed594db@google.com>
 <20231030202231.3263253-1-arakesh@google.com>
 <20231030202231.3263253-2-arakesh@google.com>
 <7d4c762a-9fe1-41ba-b394-cefa8fa70786@ideasonboard.com>
From: Avichal Rakesh <arakesh@google.com>
In-Reply-To: <7d4c762a-9fe1-41ba-b394-cefa8fa70786@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/1/23 04:06, Dan Scally wrote:
> Morning Avichal
> 
> On 30/10/2023 20:22, Avichal Rakesh wrote:
>> Currently, the uvc gadget driver allocates all uvc_requests as one array
>> and deallocates them all when the video stream stops. This includes
>> de-allocating all the usb_requests associated with those uvc_requests.
>> This can lead to use-after-free issues if any of those de-allocated
>> usb_requests were still owned by the usb controller.
>>
>> This patch is 1 of 2 patches addressing the use-after-free issue.
>> Instead of bulk allocating all uvc_requests as an array, this patch
>> allocates uvc_requests one at a time, which should allows for similar
>> granularity when deallocating the uvc_requests. This patch has no
>> functional changes other than allocating each uvc_request separately,
>> and similarly freeing each of them separately.
>>
>> Link: https://lore.kernel.org/7cd81649-2795-45b6-8c10-b7df1055020d@google.com
>> Suggested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> Reviewed-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> Tested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> Signed-off-by: Avichal Rakesh <arakesh@google.com>
> 
> 
> Thanks for the update; this seems ok now:
> 
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Awesome, thank you! I'll add the Reviewed-by in the next patchset
(assuming you have more review comments on patch 4/4 v10). 

Regards,
Avi.

> 
>> ---
>> v1 -> v2 : Rebased to ToT
>> v2 -> v3 : Fix email threading goof-up
>> v3 -> v4 : Address review comments & re-rebase to ToT
>> v4 -> v5 : Address more review comments. Add Reviewed-by & Tested-by.
>> v5 -> v6 : No change
>> v6 -> v7 : No change
>> v7 -> v8 : No change. Getting back in review queue
>> v8 -> v9 : Address review comments.
>> v9 -> v10: Address review comments; remove BUG_ON(&video->reqs);
>>             Rebase to ToT (usb-next)
>>
>>   <snip>

