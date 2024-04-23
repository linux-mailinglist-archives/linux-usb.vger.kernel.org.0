Return-Path: <linux-usb+bounces-9627-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2EA8ADB15
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 02:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B14331F25328
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 00:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F25262BD;
	Tue, 23 Apr 2024 00:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kP3fzSzw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3F3225DD
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 00:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713831674; cv=none; b=IEwhUmuuCeSjCVK9SkSqOTf8gqg3DPOLoJk2TdhxDWOduyWPbewlH8sSbJVlcbyYvp5swRSYVqxhZwaaIuSwFuJBzeOiblFJMB584j8AJMth7rrM/jwl5QjoSvuqu1aq5aLILz6KmBH/o/tszYLM3DTLFkDGruiLyP5tqttceqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713831674; c=relaxed/simple;
	bh=Mq7zkVwuUWQUc3aqR0kHon2b1Y3jeAOIT/AyxJRdiwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CycmY/eGzeqx53nJOAwEPueRaOmtZlHA8XGbSdBvLSqeugvsYwIz75tkiU/oGwE75BU+0o6sVzbi0+AkCyGz/jHDzqH6PVEQfkDIAz5C9CGmwdTau9BnQh8LJF+yfirn+30IDsJ0/ZcfiTz7hD4C0xcygBNhdaD/WKMzFQORIhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kP3fzSzw; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2a2d248a2e1so4199285a91.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Apr 2024 17:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713831672; x=1714436472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DG8SmujVrV3/d/wJYkV3HtACiwFGKad7/vEWNJwjogg=;
        b=kP3fzSzwCG2SNGIAJMG9E/D9L3QDfIxnnFE2pKbnYggRWlS+D3rOudAw+PZvUHvbvj
         NbET6SuMCIxipk82oigO3JL6YDAN6gin0qMBw48GLLoV9wJ8iBnLnuwdPBnOSNeQvLSD
         OL2nWXiXfwsMBcfAXiSzQHdXMOCoUhVUEGys4CT4TpD+KYwXFuqgbn+J6asYBp1OPbHC
         nB+MtWIWhVRN4hJcUZV7qhViwR98OsXxOLzdvGE6HWhgX6rpB0CjuDuHyzOvoLpHI08o
         CdkzyDt89p501r0sNZh7nstVz1jGkoQ6o/e6BIajNulMyQqXmrwcXMef8JcD9y3y93Xw
         Yvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713831672; x=1714436472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DG8SmujVrV3/d/wJYkV3HtACiwFGKad7/vEWNJwjogg=;
        b=RmSMy0+FX+RndpsWxvXS7UuWs2Yi/unVa60w2zgyVuYHrWWqSvB+uRWE4BOPRD2MQZ
         2ELGLRxySMOVeSpFeuVsPXLbHzV8FR2SWrBQSappi8uFtlCqsSHqNo0246RSr56cZ/mK
         t/ivwMomh2oN/e7MUObSDrr/1xl7cayoodExcNKh8yyPk10O3EgqjkdiPR8dPbInNjuD
         95OE3dwJJ7h/R155xDaopjwtflvtktaCgBx8AxFLGdfazVRdRdQ8aYQ7MON9CUnKgMto
         57Atxy/0ETzONEybyCmmjfoU8AVRFJXlUT6iRCl743JdT/NkvSxAJLI2nHVDUxkBy0ZX
         WPuA==
X-Gm-Message-State: AOJu0Yz+GuA65NuGN4W53Cz1Lg4HgPOTcjHr09CkNTkpxJryG4YGMeM1
	Pdj8doLae+IygTijN0/KvfaS7Nw20NeXJKFSpG3cd9Kp9tecsi6xvB+3SbNCJg==
X-Google-Smtp-Source: AGHT+IHqwgHn6S6UmdxbjnxXq2IU+YdXC2dWUxmKJAEkcTK34z2/d1ak6pzKMxau9YV1GJzPxXsWpw==
X-Received: by 2002:a17:90a:c68c:b0:2a2:fec9:1bbd with SMTP id n12-20020a17090ac68c00b002a2fec91bbdmr1478299pjt.17.1713831671463;
        Mon, 22 Apr 2024 17:21:11 -0700 (PDT)
Received: from [192.168.60.239] (159.21.83.34.bc.googleusercontent.com. [34.83.21.159])
        by smtp.gmail.com with ESMTPSA id ns5-20020a17090b250500b002a5f44353d2sm10207982pjb.7.2024.04.22.17.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 17:21:11 -0700 (PDT)
Message-ID: <dcad0089-4105-44bc-a2b4-3cfc6f44164b@google.com>
Date: Mon, 22 Apr 2024 17:21:09 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] usb: gadget: uvc: allocate requests based on frame
 interval length and buffersize
To: Michael Grzeschik <mgr@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jayant Chowdhary <jchowdhary@google.com>, etalvala@google.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ZiWga5Kqno1ICv97@pengutronix.de>
Content-Language: en-US
From: Avichal Rakesh <arakesh@google.com>
In-Reply-To: <ZiWga5Kqno1ICv97@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/21/24 16:25, Michael Grzeschik wrote:
> On Tue, Apr 09, 2024 at 11:24:56PM +0200, Michael Grzeschik wrote:
>> This patch series is improving the size calculation and allocation
>> of the uvc requests. Using the currenlty setup frame duration of the
>> stream it is possible to calculate the number of requests based on the
>> interval length.
> 
> The basic concept here is right. But unfortunatly we found out that
> together with Patch [1] and the current zero length request pump
> mechanism [2] and [3] this is not working as expected.
> 
> The conclusion that we can not queue more than one frame at once into
> the hw led to [1]. The current implementation of zero length reqeusts
> which will be queued while we are waiting for the frame to finish
> transferring will enlarge the frame duration. Since every zero-length
> request is still taking up at least one frame interval of 125 us.

I haven't taken a super close look at your patches, so please feel free
to correct me if I am misunderstanding something.

It looks like the goal of the patches is to determine a better number
and size of usb_requests from the given framerate such that we send exactly
nreqs requests per frame where nreqs is determined to be the exact number 
of requests that can be sent in one frame interval?

As the logic stands, we need some 0-length requests to be circulating to
ensure that we don't miss ISOC deadlines. The current logic unconditionally
sends half of all allocated requests to be circulated.

With those two things in mind, this means than video_pump can at encode
at most half a frame in one go, and then has to wait for complete 
callbacks to come in. In such cases, the theoretical worst case for 
encode time is  
125us * (number of requests needed per frame / 2) + scheduling delays
as after the first half of the frame has been encoded, the video_pump
thread will have to wait 125us for each of the zero length requests to
be returned.

The underlying assumption behind the "queue 0-length requests" approach
was that video_pump encodes the frames in as few requests as possible
and that there are spare requests to maintain a pressure on the 
ISOC queue without hindering the video_pump thread, and unfortunately
it seems like patch 3/3 is breaking both of them?

Assuming my understanding of your patches is correct, my question 
is: Why do we want to spread the frame uniformly over the requests
instead of encoding it in as few requests as possible. Spreading
the frame over more requests artificially increases the encode time
required by video_pump, and AFAICT there is no real benefit to it?

> Therefor to properly make those patches work, we will have to get rid of
> the zero length pump mechanism again and make sure that the whole
> business logic of what to be queued and when will only be done in the
> pump worker. It is possible to let the dwc3 udc run dry, as we are
> actively waiting for the frame to finish, the last request in the
> prepared and started list will stop the current dwc3 stream and therf> no underruns will occur with the next ep_queue.

One thing to note here: The reason we moved to queuing 0-length requests
from complete callback was because even with realtime priority, video_pump
thread doesn't always meet the ISOC queueing cadence. I think stopping and
starting the stream was briefly discussed in our initial discussion in 
https://lore.kernel.org/all/20230419001143.pdxflhzyecf4kvee@synopsys.com/
and Thinh mentioned that dwc3 controller does it if it detects an underrun,
but I am not sure if starting and stopping an ISOC stream is good practice.
Someone better versed in USB protocol can probably confirm, but it seems
somewhat hacky to stop the ISOC stream at the end of the frame and restart
with the next frame. 

> With all these pending patches the whole uvc saga of underruns and
> flickering videostreams should come to an end™.

This would indeed be nice!

> 
> I already started with this but would be happy to see Avichal and others
> to review the patches when they are ready in my eyes.

Of course!

- Avi.

