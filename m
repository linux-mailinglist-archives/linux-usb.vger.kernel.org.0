Return-Path: <linux-usb+bounces-1642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB07C9E41
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 06:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 898A61C20947
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 04:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58DD1C08;
	Mon, 16 Oct 2023 04:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zVhwq+Fv"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8033D79CD
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 04:33:51 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 109E1DF
	for <linux-usb@vger.kernel.org>; Sun, 15 Oct 2023 21:33:47 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6ba172c5f3dso972363b3a.0
        for <linux-usb@vger.kernel.org>; Sun, 15 Oct 2023 21:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697430826; x=1698035626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Tejy3Kv2ewCsu4ePvtm8O+1oKzqOghrnllUZz+x8is=;
        b=zVhwq+Fv+KFXXghEin8MqnARtXZX6r979pJsfTaBtYQJTm2V6+Cn3eGvr68oaMHW3W
         h9xirOPvUb9sMrWoahJYHirdlKK/b64nQVwv2K4KLILVx2/5qXvvIibA52DOya2mYXDa
         3Zf7ODsqOBlDBuZ3E6OzI96fEHY5GENwPh2SGswAXb54+d+GjrEogUxZ5PRN19bpjeIF
         7S71kfM2s06leqBBbJZdVU9R3cUdutiNR4LxSCLsmd2Atl+05ccNzkJqoVU6tWfrmTmy
         wi7JFR4d8sPyq3iDoNQ7oyJq1a0drgRJMcme9tETa/06qneqkeN8QUpMFlhKo5b33cT7
         USYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697430826; x=1698035626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Tejy3Kv2ewCsu4ePvtm8O+1oKzqOghrnllUZz+x8is=;
        b=FuLgpd6urPJpedN1TmTo6cpPT0ZqE/Pf1yyd4ugJFWCH/VvJ1IMv+hrK4fVK47srVJ
         rsWLdhScojKPkZbnzlilEKbpu6YG03grAUiIcUvMvifxL1eDMqTjKvkjy2rUlaE4R9Ev
         wF0MQqKBnBCAu0shd31mseTGZ9JmwH7DXsVSIKPb/5ogVfErkt/OHrp18jNR4/CFGUoB
         6n1GJ/AaTfyU2hAkTHYZmL++4/zW+QN30zezqR2dzkfGLODzKuoDddCNc4RtFjn5mlTd
         GeSs1foX0e7jn3iBzrBTaJPt0DDH/wdiNPaphrbuSwn356VVYVCGYys2VPj0xnGMxriv
         OflQ==
X-Gm-Message-State: AOJu0YzI2AYT6NZS1gfpCzTwnTG7UgATa7qz0d7FG0FDmnn2rJKRr8Cu
	VCcQoXx3K5M7rOpNfy0FGTR0qQ==
X-Google-Smtp-Source: AGHT+IGXP/Q3ZMU3lWTF3wh/lT2U/xael8C052BezvhvxxWT5fcxi4F6U4vCCB2TbtiqD6CXzWxgoQ==
X-Received: by 2002:a05:6a21:a106:b0:174:1466:359c with SMTP id aq6-20020a056a21a10600b001741466359cmr11503435pzc.61.1697430826220;
        Sun, 15 Oct 2023 21:33:46 -0700 (PDT)
Received: from ?IPV6:2601:645:8100:1350:aa26:108f:3b80:445a? ([2601:645:8100:1350:aa26:108f:3b80:445a])
        by smtp.gmail.com with ESMTPSA id 15-20020a17090a01cf00b00263dfe9b972sm4198311pjd.0.2023.10.15.21.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Oct 2023 21:33:45 -0700 (PDT)
Message-ID: <c47e864b-4b9e-4a21-afea-af121a4d7771@google.com>
Date: Sun, 15 Oct 2023 21:33:43 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: uvc gadget: Making upper bound of number of usb requests
 allocated configurable through configfs
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, mgr@pengutronix.de
Cc: Greg KH <gregkh@linuxfoundation.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "etalvala@google.com" <etalvala@google.com>,
 "arakesh@google.com" <arakesh@google.com>
References: <edad1597-48da-49d2-a089-da2487cac889@google.com>
 <2023100834-statistic-richly-49ef@gregkh>
 <7ed46b3c-bd42-468e-b28d-860dc8a6c7e6@google.com>
 <20231012184954.ech7kfpqjkunq6eu@synopsys.com>
Content-Language: en-US
From: Jayant Chowdhary <jchowdhary@google.com>
In-Reply-To: <20231012184954.ech7kfpqjkunq6eu@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

 Hi Thinh,


On 10/12/23 11:50, Thinh Nguyen wrote:
> Hi,
>
> On Mon, Oct 09, 2023, Jayant Chowdhary wrote:
>>> On Fri, Oct 06, 2023 at 03:03:56PM -0700, Jayant Chowdhary wrote:
>>>> Hi Everyone,
>>>>
>>>> We had been seeing the UVC gadget driver receive isoc errors while
>>>> sending packets to the usb endpoint - resulting in glitches being shown
>>>> on linux hosts. My colleague Avichal Rakesh and others had a very
>>>> enlightening discussion at
>>>> https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/8741b7cb-54ec-410b-caf5-697f81e8ad64@google.com/T/__;!!A4F2R9G_pg!e3zVZGt-6Td6HJXqh8GaZAsUeKyvKBhOoyru9qzn3Vkw01Vdkwk7hFr_t5glBG2BYJlOYfFKEUpiH5H4gQ73n_-Y$ 
>>>>
>>>>
>>>> The conclusion that we came to was : usb requests with actual uvc frame
>>>> data were missing their scheduled uframes in the usb controller. As a
>>>> mitigation, we started sending 0 length usb requests when there was no
>>>> uvc frame buffer available to get data from. Even with this mitigation,
>>>> we are seeing glitches - albeit at a lower frequency.
>>>>
>>>> After some investigation, it is seen that we’re getting isoc errors when
>>>> the worker thread serving video_pump() work items, doesn’t get scheduled
>>>> for longer periods of time - than usual - in most cases > 6ms.
>>>> This is close enough to the 8ms limit that we have when the number of usb
>>>> requests in the queue is 64 (since we have a 125us uframe period). In order
>>>> to tolerate the scheduling delays better, it helps to increase the number of
>>>> usb requests in the queue . In that case, we have more 0 length requests
>>>> given to the udc driver - and as a result we can wait longer for uvc
>>>> frames with valid data to get processed by video_pump(). I’m attaching a
>>>> patch which lets one configure the upper bound on the number of usb
>>>> requests allocated through configfs. Please let me know your thoughts.
>>>> I can formalize  the patch if it looks okay.
>>> Why do you want to limit the upper bound?  Why not just not submit so
>>> many requests from userspace as you control that, right?
>>
>> Userspace negotiates a video frame rate (typically 30/60fps) with the host that does
>> not necessarily correspond to the ISOC cadence. After the
>> patch at https://urldefense.com/v3/__https://lkml.org/lkml/diff/2023/5/8/1115/1__;!!A4F2R9G_pg!e3zVZGt-6Td6HJXqh8GaZAsUeKyvKBhOoyru9qzn3Vkw01Vdkwk7hFr_t5glBG2BYJlOYfFKEUpiH5H4gWbb9bvy$  was submitted, we are
>> maintaining back pressure on the usb controller even if we do not have uvc frame
>> data, by sending the controller 0 length requests (as long as usb_requests are
>> available). Also, even if the userspace application were to somehow produce
>> data to match the ISOC rate, it would  need to have information about USB
>> timing details - which I am not sure is available to userspace or is the right
>> thing to do here ?
>>
>> Here, we are trying to handle the scenario in which the video_pump() worker
>> thread does not get scheduled in time - by increasing the number of usb requests
>> allocated in the queue. This would send more usb requests to the usb controller,
>> when video_pump() does get scheduled - even if they're 0 length. This buys
>> the video_pump() worker thread scheduling time -since more usb requests
>> are with the controller, subsequent requests sent will not be 'stale' and
>> dropped by the usb controller.
>>
> I believe you're testing against dwc3 controller right? I may not be as
> familiar with UVC function driver, but based on the previous
> discussions, I think the driver should be able to handle this without
> the user input.

Yes we are testing against the dwc3 controller.

>
> The frequency of the request submission should not depend on the
> video_pump() work thread since it can vary. The frequency of request
> submission should match with the request completion. We know that
> request completion rate should be fixed (1 uframe/request + when you
> don't set no_interrupt). Base on this you can do your calculation on how
> often you should set no_interrupt and how many requests you must submit.
> You don't have to wait for the video_pump() to submit 0-length requests.
>
> The only variable here is the completion handler delay or system
> latency, which should not be much and should be within your calculation.


Thanks for the suggestion. It indeed makes sense that we do not completely depend on
video_pump() for sending 0 length requests. I was concerned about
synchronization needed when we send requests to the dwc3 controller from
different threads. I see that the dwc3 controller code does internally serialize
queueing requests, can we expect this from other controllers as well ? 

This brings me to another question for Michael - I see
that we introduced a worker thread for pumping  usb requests to the usb endpoint
in https://lore.kernel.org/all/20200427151614.10868-1-m.grzeschik@pengutronix.de/
(I see multiple email addresses, so apologies if I used the incorrect one).

Did we introduce the worker thread to solve some specific deadlock scenarios ?
Or was it a general mitigation against racy usb request submission from v4l2 buffer
queuing, stream enable and the video complete handler firing ?

I was chatting with Avi about this, what if we submit requests to the endpoint
only at two points in the streaming lifecycle - 
1) The whole 64 (or however many usb requests are allocated) when
   uvcg_video_enable() is called - with 0 length usb_requests.
2) In the video complete handler - if a video buffer is available, we encode it
   and submit it to the endpoint. If not, we send a 0 length request.

This way we're really maintaining back pressure and sending requests as soon
as we can to the dwc3 controller. Encoding is mostly memcpys from what I see
so hopefully not too heavy on the interrupt handler. I will work on prototyping
this meanwhile.

Thanks,
Jayant


