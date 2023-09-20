Return-Path: <linux-usb+bounces-430-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD517A8DA4
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 22:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 173D5281873
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 20:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA8841223;
	Wed, 20 Sep 2023 20:15:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4353A41205
	for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 20:15:24 +0000 (UTC)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F05A9
	for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 13:15:23 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6c0b3cea424so158787a34.2
        for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 13:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695240922; x=1695845722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FW45CPg1jDYpvMYB5E8yFnoTPDOHi1lGsORRcFqJO8c=;
        b=GiqK2g2mmi4VfZ9TKT2dz8lcevTUUfGVeKFTuq6q8pvKI4rEwhjgPrCOlI7CJkBKvM
         6nuS4zePPUtXzxgz5+GAaK8IPb9CSmktBVi5TxiRo3vi9AseDuBhjObTc5Xyn93Nmj/B
         JI/bv89ARzu3H++V+0Y2gJOpMEBLMWTIpWsuBrIEvzdReKyzbQaEAmiAvlDBhHpVUs4Z
         eKDSvj/tHt2ymlXcbOJZDbuLM9CH7I9jbXUuoJFh2SM2xwWGgbWtCARG/OPvC54iQD2T
         ZJwtoSpUid55WiSiTVlPAybbmdL2fmyV/KhIwSopJqAl0jQ7FvdigzQ124gLihO+3PVa
         Beyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695240922; x=1695845722;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FW45CPg1jDYpvMYB5E8yFnoTPDOHi1lGsORRcFqJO8c=;
        b=w9npn76zH3IX+1fTz0UOOyxMlG44Rs/m3ZavNrsjuXFY84RzTTSoQSdbcCrlSk0yT5
         w0mFuQAVZsDZVtc+TfmMlM8fIiXEVdFLvqG42kT7MrpjR2O276ONJ2o8HtQBPusFx6HD
         nhvXD/ahY6Aqf9xWJgwRbZKVzEf2lOuUsUYQudDl1tuHpUlho+Qtc3z5QUv8l8IYaHSb
         zmEloRjOpwqH3XQwz8VNc9LI9VlYils+AIrECFlQfrtdGg8wLoe4HT35dcvEiDcGTG5S
         NUXHmAYSJAbAafBWsqa55siRMKgLLrzYLcrtWZxcOmLDOutSZlF9fUsHJ/upKVfdz0lZ
         x8Aw==
X-Gm-Message-State: AOJu0Yxs9JWUNUde4GJE9M6vajVT1AInOMFjZqj8fafPL/gDXF3hPz8u
	Smp8nEjRV4AWxOOioQRRyTrG7w==
X-Google-Smtp-Source: AGHT+IF037oLyVtGpRARZRKr7/PcrWJFhSX+CXfP7hz/9UpL8DqhTz7M+2aFxEQuJpP+qc1HFwV4/Q==
X-Received: by 2002:a05:6358:888:b0:134:e777:c78b with SMTP id m8-20020a056358088800b00134e777c78bmr3953257rwj.5.1695240921989;
        Wed, 20 Sep 2023 13:15:21 -0700 (PDT)
Received: from [192.168.60.239] (124.190.199.35.bc.googleusercontent.com. [35.199.190.124])
        by smtp.gmail.com with ESMTPSA id s14-20020a63924e000000b0057825bd3448sm8286996pgn.51.2023.09.20.13.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 13:15:21 -0700 (PDT)
Message-ID: <c948cf51-7e1d-4bbc-b760-2cc8e850d801@google.com>
Date: Wed, 20 Sep 2023 13:15:20 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: gadget: uvc: cleanup request when not in correct
 state
Content-Language: en-US
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: laurent.pinchart@ideasonboard.com, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, dan.scally@ideasonboard.com,
 gregkh@linuxfoundation.org, nicolas@ndufresne.ca, kernel@pengutronix.de,
 Jayant Chowdhary <jchowdhary@google.com>
References: <ZQTpnJvTV+8Ye1si@pengutronix.de>
 <587c9b95-a80c-4bf9-b1a0-fe7ef0f4cd60@google.com>
 <ZQY5Ab+YB9FLHoQq@pengutronix.de>
 <d678b644-5f66-4c23-b2ba-6c84ba56012f@google.com>
 <ZQjEZlk2UFQgA0TF@pengutronix.de>
 <7cd81649-2795-45b6-8c10-b7df1055020d@google.com>
 <ZQnyxA1WldcqQ+k5@pengutronix.de>
 <1d32914c-3a67-439f-b15d-7c7b7d6fc99b@google.com>
 <ZQn/eSaSqd8cgux5@pengutronix.de>
 <45add13c-ffa4-4cd1-be1b-6888fb011534@google.com>
 <ZQoPqLUfDBaO9VIh@pengutronix.de>
From: Avichal Rakesh <arakesh@google.com>
In-Reply-To: <ZQoPqLUfDBaO9VIh@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 9/19/23 14:16, Michael Grzeschik wrote:
> On Tue, Sep 19, 2023 at 01:22:42PM -0700, Avichal Rakesh wrote:
>>
>>
>> On 9/19/23 13:07, Michael Grzeschik wrote:
>>> On Tue, Sep 19, 2023 at 12:55:02PM -0700, Avichal Rakesh wrote:
>>>> On 9/19/23 12:13, Michael Grzeschik wrote:
>>>>> On Mon, Sep 18, 2023 at 04:40:07PM -0700, Avichal Rakesh wrote:
>>>>>>
>>>>>>
>>>>>> On 9/18/23 14:43, Michael Grzeschik wrote:
>>>>>>> On Mon, Sep 18, 2023 at 12:02:11PM -0700, Avichal Rakesh wrote:
>>>>>>>> On 9/16/23 16:23, Michael Grzeschik wrote:
>>>>>>>>> On Fri, Sep 15, 2023 at 07:41:05PM -0700, Avichal Rakesh wrote:
>>>>>>>>>> On 9/15/23 16:32, Michael Grzeschik wrote:
>>>>>>>>>>> On Mon, Sep 11, 2023 at 09:52:22PM -0700, Avichal Rakesh wrote:
>>>>>>>>>>>> On 9/10/23 17:24, Michael Grzeschik wrote:
>>>>>>>>>>>>> The uvc_video_enable function of the uvc-gadget driver is dequeing and
>>>>>>>>>>>>> immediately deallocs all requests on its disable codepath. This is not
>>>>>>>>>>>>> save since the dequeue function is async and does not ensure that the
>>>>>>>>>>>>> requests are left unlinked in the controller driver.
>>>>>>>>>>>>>
>>>>>>>>>>>>> <snip>
>>
>> Agreed, uvc_video_free_requests should only free the requests in
>> req_free.
>>
>> Just to clear any confusion: are you working on incorporating these changes
>> into your patchset, or do you want me to include them in
>> https://lore.kernel.org/20230912041910.726442-3-arakesh@google.com/
>> instead?
> 
> As I am busy on a different topic at the moment, and you have suggested
> the main walkthrough for the solution, it would be great if you could
> come up with the proper patch.
> 
> But it would be great to find my Suggested-by in the patches. :)

Just sent out https://lore.kernel.org/20230920200335.63709-1-arakesh@google.com
with the changes discussed in this thread. The patch should work without
requiring any changes to dwc3. 

I didn't run into any crashes when testing the changes locally, but if you can,
I'd appreciate you testing the patches on your crash-prone setup as my setup's
crash rate was pretty low to begin with.

Thank you!

- Avi.



