Return-Path: <linux-usb+bounces-2317-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B68F7DA77F
	for <lists+linux-usb@lfdr.de>; Sat, 28 Oct 2023 16:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70F98B20F05
	for <lists+linux-usb@lfdr.de>; Sat, 28 Oct 2023 14:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E1E156FB;
	Sat, 28 Oct 2023 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3+nm+CoK"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC3653A8
	for <linux-usb@vger.kernel.org>; Sat, 28 Oct 2023 14:09:24 +0000 (UTC)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3496ED
	for <linux-usb@vger.kernel.org>; Sat, 28 Oct 2023 07:09:21 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-66fbcc70c94so9045996d6.3
        for <linux-usb@vger.kernel.org>; Sat, 28 Oct 2023 07:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698502161; x=1699106961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6L7rpUCYcNsJk00A3QFyNPiwTqn3W74KW0t1ePj7vug=;
        b=3+nm+CoKsHY8GIiGZ+OYDMO+IDJSnAGD0MIAmrpN6guB+F9V0F0RpvYGkNhsthxTe3
         i+OGF4PQlcP0trtyminiTC7cw7EYHnOwnA1Zl7f9aD7kkI9dEUKP2EU6auLH+G9w9gdG
         6r8GP3ETBH5E57Pey2Pn3x/HMAaGoxbLLgdWRSBpyTZEiER/Ml6NK4/9mo+LwpHK5dqF
         wH7cDW8ORgz51C0zgC7pHOb5F+9m1Jd2rK8mBgdrBGxd+1jMl31asTKoDm2kBXe+bfSZ
         tLBL+1IbzNVJtUyyTE6RTkNfLkbPe0Mj7FyDxeSHp5Okjoww0ZBDP3fIK72k2///gkXc
         FbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698502161; x=1699106961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6L7rpUCYcNsJk00A3QFyNPiwTqn3W74KW0t1ePj7vug=;
        b=Y9d1VkoNMvXg10MYPXvW21PjSb6N01PBAdsuMs3tcKRn+YnOqLC+XvvT208VPbpg2F
         0NaMXwsfX2yErYWzdCThgQT9YOMKrPSJPvpE+upWhED9iA74EH6j1pOue+xr77+AqG7l
         szS9yAXsE/cACd+7rk3EkF+7pAS+mXO2J9dK7ZLcdbJYeWH3+U9VJQzKxEUZhvcWsQUg
         8XURp7xKg3qA+a2MbMOQxEJ5x1sTY+V0Pgs1Gjsul4CxihyWfiKqC3qlNsVTiVfzZgDF
         +tiItOc04hjZwVgihZe/0elDl2SrLcDCcXfGWdxIAAA3i72HlQLST9+8C1Db1tl+buOA
         u/Ag==
X-Gm-Message-State: AOJu0YwUnvQX6Ff4RbQnYUnMkZ/Kaq6zrzGpeObOHWig4Se8h0/hqzm8
	ILKEc64CUQWi7jz9xFoYCAJUOw==
X-Google-Smtp-Source: AGHT+IFxJ/FDoJS68PD7qMrzmAsk3DKalsqtux142SuGdn1QnmuPxpI7se/KZBd8AMH4GvgqbFrxFA==
X-Received: by 2002:a05:6214:2a8b:b0:64c:9d23:8f55 with SMTP id jr11-20020a0562142a8b00b0064c9d238f55mr6487367qvb.58.1698502160486;
        Sat, 28 Oct 2023 07:09:20 -0700 (PDT)
Received: from [192.168.7.192] (d14-69-93-221.try.wideopenwest.com. [69.14.221.93])
        by smtp.gmail.com with ESMTPSA id t7-20020a0cde07000000b0064f53943626sm1636205qvk.89.2023.10.28.07.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Oct 2023 07:09:20 -0700 (PDT)
Message-ID: <5fd7d151-cf60-48e1-8eae-fe39039a5acb@google.com>
Date: Sat, 28 Oct 2023 07:09:11 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb:gadget:uvc Do not use worker thread to pump usb
 requests
Content-Language: en-US
To: Michael Grzeschik <mgr@pengutronix.de>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thinh.Nguyen@synopsys.com, arakesh@google.com, etalvala@google.com,
 dan.scally@ideasonboard.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <ZToOJhyOFeGCGUFj@pengutronix.de>
 <20231026215635.2478767-1-jchowdhary@google.com>
 <20231027075117.GJ26306@pendragon.ideasonboard.com>
 <ZTuanepgXLXRoSMW@pengutronix.de>
 <20231027114752.GB12144@pendragon.ideasonboard.com>
 <ZTu9oEw1QEOxbHCf@pengutronix.de>
 <7c30f943-aaad-47dd-9ae3-02f1ca57e49b@rowland.harvard.edu>
 <ZTzsJo1/NPVTLCnY@pengutronix.de>
From: Jayant Chowdhary <jchowdhary@google.com>
In-Reply-To: <ZTzsJo1/NPVTLCnY@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10/28/23 04:10, Michael Grzeschik wrote:
> On Fri, Oct 27, 2023 at 10:58:11AM -0400, Alan Stern wrote:
>> On Fri, Oct 27, 2023 at 03:39:44PM +0200, Michael Grzeschik wrote:
>>> On Fri, Oct 27, 2023 at 02:47:52PM +0300, Laurent Pinchart wrote:
>>> > On Fri, Oct 27, 2023 at 01:10:21PM +0200, Michael Grzeschik wrote:
>>> > > On Fri, Oct 27, 2023 at 10:51:17AM +0300, Laurent Pinchart wrote:
>>> > > > On Thu, Oct 26, 2023 at 09:56:35PM +0000, Jayant Chowdhary wrote:
>>> > > >> This patch is based on top of
>>> > > >> https://lore.kernel.org/linux-usb/20230930184821.310143-1-arakesh@google.com/T/#t:
>>> > > >>
>>> > > >> When we use an async work queue to perform the function of pumping
>>> > > >> usb requests to the usb controller, it is possible that thread scheduling
>>> > > >> affects at what cadence we're able to pump requests. This could mean usb
>>> > > >> requests miss their uframes - resulting in video stream flickers on the host
>>> > > >> device.
>>> > > >>
>>> > > >> In this patch, we move the pumping of usb requests to
>>> > > >> 1) uvcg_video_complete() complete handler for both isoc + bulk
>>> > > >>    endpoints. We still send 0 length requests when there is no uvc buffer
>>> > > >>    available to encode.
>>> > > >
>>> > > > This means you will end up copying large amounts of data in interrupt
>>> > > > context. The work queue was there to avoid exactly that, as it will
>>> > > > introduce delays that can affect other parts of the system. I think this
>>> > > > is a problem.
>>> > >
>>> > > Regarding Thin's argument about possible scheduling latency that is already
>>> > > introducing real errors, this seemed like a good solution.
>>> > >
>>> > > But sure, this potential latency introduced in the interrupt context can
>>> > > trigger other side effects.
>>> > >
>>> > > However I think we need some compromise since both arguments are very valid.
>>> >
>>> > Agreed.
>>> >
>>> > > Any ideas, how to solve this?
>>> >
>>> > I'm afraid not.
>>>
>>> We discussed this and came to the conclusion that we could make use of
>>> kthread_create and sched_setattr with an attr->sched_policy = SCHED_DEADLINE
>>> here instead of the workqueue. This way we would ensure that the worker
>>> would be triggered with hard definitions.
>>>
>>> Since the SG case is not that heavy on the completion handler, we could
>>> also make this kthread conditionaly to the memcpy case.
>>
>> If you don't mind a naive suggestion from someone who knows nothing
>> about the driver...
>>
>> An attractive possibility is to have the work queue (or kthread) do the
>> time-consuming copying, but leave the submission up to the completion
>> handler.  If the data isn't ready (or there's no data to send) when the
>> handler runs, then queue a 0-length request.
>>
>> That will give you the best of both worlds: low latency while in
>> interrupt context and a steady, constant flow of USB transfers at all
>> times.  The question of how to schedule the work queue or kthread is a
>> separate matter, not directly relevant to this design decision.
>
> That's it. This is probably the best way to tackle the overall problem.
>
> So we leave the call of the encode callback to the worker, that will
> probably still can be a workqueue. The complete callback is calling
> the explicit uvcg_video_ep_queue when prepared requests are available
> and if there is nothing pending it will just enqueue zero requests.
>
> Thank you Alan, this makes so much sense!
>
> Jayant, Laurent: Do you agree?
> If yes, Jayant will you change the patch accordingly?
>
>
Thanks for all the discussion Greg, Michael, Laurent and Alan.
Apologies for not responding earlier since I am OOO.

While I  haven't tried this out this does seem like a very good idea.
Thank you Alan! I will aim to make changes and post a patch on Monday night PST.

Jayant


