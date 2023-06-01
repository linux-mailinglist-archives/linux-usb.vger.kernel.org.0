Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 032A471A113
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jun 2023 16:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234553AbjFAOyn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jun 2023 10:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232776AbjFAOym (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jun 2023 10:54:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE0819F
        for <linux-usb@vger.kernel.org>; Thu,  1 Jun 2023 07:54:34 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77B2B2BC;
        Thu,  1 Jun 2023 16:54:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685631250;
        bh=yT+g84pa/6LUf/y89iITInPDE+AsKzv1/o7oNlVQD70=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=RN7pGS5bPg89Q2aUeBax+omgAexCJ6/2AhTKYVxEUhaUyolEg7LR/sQb8yJ0QH3Te
         v5moY9S692avJnN2sxp1B5GSM+XvIb0KmCW+tmOIEqhT4W9o57ipytmVAbzb/xHsPr
         xeCe2x1a6gv5gvjSyhDur5xpYIpRil8kCKfZTucU=
Message-ID: <9bc19f98-7842-2c9d-5cb3-6c10916731fd@ideasonboard.com>
Date:   Thu, 1 Jun 2023 15:54:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Avichal Rakesh <arakesh@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
References: <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230420172011.GF21943@pendragon.ideasonboard.com>
 <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
 <20230506125317.GD17474@pendragon.ideasonboard.com>
 <CAMHf4WLMAjigKypYho24TqeuWx6Y9-LWjq2cj_5ad31pqsKDzg@mail.gmail.com>
 <20230509002143.7x5zo6bohvn5dyb2@synopsys.com>
 <CAMHf4WLzx3Bj-TR1ZrqsW1tfY+WUtgTt8TVObOFnkNcx2Pc9kw@mail.gmail.com>
 <20230509223526.5e6oqqri3mhwc34l@synopsys.com>
 <20230509224241.vvylagjkqbwo4hbk@synopsys.com>
 <c68249a8-4e22-abd9-5c7c-7e8b7f383898@google.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
In-Reply-To: <c68249a8-4e22-abd9-5c7c-7e8b7f383898@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Avi

On 16/05/2023 01:29, Avichal Rakesh wrote:
>
> On 5/9/23 15:42, Thinh Nguyen wrote:
>> On Tue, May 09, 2023, Thinh Nguyen wrote:
>> Just want to clarify that complete here is from the perspective of the
>> controller. The controller driver doesn't automatically update the
>> request and give back the request to the gadget driver yet.
>>
>> BR,
>> Thinh
>>
> Hey all,
>
> Sorry in advance for the long message. I have been running more tests to
> quantify if (and how) performance is affected with my patch. I wanted to
> quantify what the 8ms latency looks like, so I modified the gadget driver to
> track some stats. Specifically, I tracked the round trip time of
> usb_requests and the time between two consecutive frames being queued.
>
> TL;DR: Naively queueing up 0-length requests as fast as possible has the
> consequence of delaying the entire stream by ~8ms, but does not seem to be
> delaying frames individually any more than before. Changing the number of
> 0-length requests has very little consequence on the stream, but increases
> the chances of missed ISOCs.
>
> For usb_requests' RTTs, I tracked the time it takes between 'usb_ep_queue' and
> the controller's 'complete' callback to return the usb_request. This is
> affected by the 'no_interrupt' flag as the controller will call 'complete'
> callback in batches.
>
> Frame time is defined as the time elapsed between completely queueing two
> consecutive video frames. This is meant to give an idea of how long the
> frame sat around waiting for usb_requests to come back.
>
> These were collected in 4 settings:
>    1. Unpatched: As the name implies, ToT!
>    2. Burst: (Name borrowed from Laurent) Queue requests ASAP. This is the
>          implementation in
>          https://lore.kernel.org/20230508231103.1621375-1-arakesh@google.com/.
>    3. Burst w/ more interrupts: Same as (2) but instead of interrupting every
>          16th 0-length request, interrupt every 8th request. The idea was to
>          increase the gadget's driver responsiveness at the cost of extra
>          interrupts.
>    4. Burst w/ limited 0-length packets: Same as Burst but only queue up at most
>          32 0-length requests. The idea was to reduce the number of empty
>          usb_requests that a video frame could get stuck behind.
>
> Some other things to note before the logs:
>    - All times are reported in ns
>    - Samples were randomly collected during an ongoing 1080p @ 30fps stream
>    - The number of allocated usb_requests was fixed at 64 for all tests.
>
> Okay, so here are the numbers:
>
> 1. Unpatched:
> ```
> usb_request rtt : min/max/mean: 3860718 : 220744/5710327/3372587
> usb_request rtt : min/max/mean: 3857951 : 220744/5710327/3372587
> usb_request rtt : min/max/mean: 3854004 : 220744/5710327/3372587
> usb_request rtt : min/max/mean: 3847575 : 220744/5710327/3372587
> usb_request rtt : min/max/mean: 3841594 : 220744/5710327/3372587
> usb_request rtt : min/max/mean: 3834066 : 220744/5710327/3372587
> usb_request rtt : min/max/mean: 3426879 : 220744/5710327/3372587
> usb_request rtt : min/max/mean: 3414632 : 220744/5710327/3372587
> usb_request rtt : min/max/mean: 3408203 : 220744/5710327/3372587
> usb_request rtt : min/max/mean: 3401489 : 220744/5710327/3372587
> ```
>
> ```
> frame time: curr: min/max/mean: 33385376 : 15103638/60926513/33474315
> frame time: curr: min/max/mean: 31438558 : 15103638/60926513/33472507
> frame time: curr: min/max/mean: 31650391 : 15103638/60926513/33470890
> frame time: curr: min/max/mean: 36657959 : 15103638/60926513/33473715
> frame time: curr: min/max/mean: 31758260 : 15103638/60926513/33472195
> frame time: curr: min/max/mean: 34915934 : 15103638/60926513/33473472
> frame time: curr: min/max/mean: 34599447 : 15103638/60926513/33474467
> frame time: curr: min/max/mean: 33658162 : 15103638/60926513/33474629
> frame time: curr: min/max/mean: 44577637 : 15103638/60926513/33484428
> ```
>
> With no changes, the usb_requests spend ~3ms in flight, and there
> is one video frame dispatched every ~33ms. Unfortunately (or perhaps
> fortunately?), it seems like the system latencies add to >8ms of per frame
> jitter when encoding frames.


I'm really really impressed with the thoroughness of your investigation here. Can you share how you 
tracked the frame times and RTTs? I have some devices with a DWC2 controller and I think a MUSB too 
- I'd be interested in testing those too to see how they compared.


Thanks

Dan

>
>
> 2. Burst:
> ```
> usb_request rtt curr : min/max/mean: 7966878 : 1663778/9449341/7878007
> usb_request rtt curr : min/max/mean: 7964966 : 1663778/9449341/7878008
> usb_request rtt curr : min/max/mean: 7963582 : 1663778/9449341/7878009
> usb_request rtt curr : min/max/mean: 7920817 : 1663778/9449341/7878009
> usb_request rtt curr : min/max/mean: 7923503 : 1663778/9449341/7878009
> usb_request rtt curr : min/max/mean: 7916545 : 1663778/9449341/7878009
> usb_request rtt curr : min/max/mean: 7914021 : 1663778/9449341/7878009
> usb_request rtt curr : min/max/mean: 7914348 : 1663778/9449341/7878009
> usb_request rtt curr : min/max/mean: 7914469 : 1663778/9449341/7878009
> ```
>
> ```
> frame time: curr: min/max/mean: 31675130 : 14732381/121984294/33563117
> frame time: curr: min/max/mean: 33192668 : 14732381/121984294/33563095
> frame time: curr: min/max/mean: 35761963 : 14732381/121984294/33563223
> frame time: curr: min/max/mean: 30776733 : 14732381/121984294/33563059
> frame time: curr: min/max/mean: 31940471 : 14732381/121984294/33562964
> frame time: curr: min/max/mean: 39079834 : 14732381/121984294/33563286
> frame time: curr: min/max/mean: 30279500 : 14732381/121984294/33563093
> frame time: curr: min/max/mean: 38558472 : 14732381/121984294/33563385
> frame time: curr: min/max/mean: 34294149 : 14732381/121984294/33563427
> frame time: curr: min/max/mean: 26993286 : 14732381/121984294/33563042
> ```
>
> As discussed in the thread above, we do in fact see usb_requests taking an
> average of 8ms to be returned to the gadget. This means that the driver is
> generally keeping up the back pressure to the controller, which is consistent
> with no missed ISOCs.
>
> Slightly more interesting is that the frames are still being dispatched at the
> same frequency as (1), albeit a fraction slower than (1). The jitters for
> individual frames are difficult to show here, but they seemed about the same as
> (1). IIUC, this means that the 8ms delay gets applied to the entire the entire
> stream once a steady state is reached. However, with system latencies already
> showing jitter >8ms, it is possible that a slight regression here is being
> covered up.
>
>
> 3. Burst w/ more interrupts
> ```
> usb_request rtt curr : min/max/mean: 7982137 : 906942/11119832/7712539
> usb_request rtt curr : min/max/mean: 7998698 : 906942/11119832/7712539
> usb_request rtt curr : min/max/mean: 7998088 : 906942/11119832/7712539
> usb_request rtt curr : min/max/mean: 7933024 : 906942/11119832/7712539
> usb_request rtt curr : min/max/mean: 7948364 : 906942/11119832/7712539
> usb_request rtt curr : min/max/mean: 7945476 : 906942/11119832/7712539
> usb_request rtt curr : min/max/mean: 7968872 : 906942/11119832/7712539
> usb_request rtt curr : min/max/mean: 7982219 : 906942/11119832/7712539
> usb_request rtt curr : min/max/mean: 7983155 : 906942/11119832/7712539
> usb_request rtt curr : min/max/mean: 7649048 : 906942/11119832/7712538
> ```
>
> ```
> frame time: curr: min/max/mean: 40471069 : 21488363/46635051/33474386
> frame time: curr: min/max/mean: 29503703 : 21488363/46635051/33473695
> frame time: curr: min/max/mean: 27489502 : 21488363/46635051/33472654
> frame time: curr: min/max/mean: 36647908 : 21488363/46635051/33473205
> frame time: curr: min/max/mean: 34343506 : 21488363/46635051/33473356
> frame time: curr: min/max/mean: 31686198 : 21488363/46635051/33473045
> frame time: curr: min/max/mean: 34582601 : 21488363/46635051/33473237
> frame time: curr: min/max/mean: 32652425 : 21488363/46635051/33473094
> frame time: curr: min/max/mean: 31930054 : 21488363/46635051/33472826
> frame time: curr: min/max/mean: 34652669 : 21488363/46635051/33473030
> ```
>
> There were no meaningful differences in usb_request RTTs from (2), which is
> expected, as the driver can still comfortably maintain the back pressure.
>
> However, we do see a very slight increase in responsiveness as the frames are
> queued at approximately the same frequency as (1). However, the per frame
> jitter is consistent with (1) and (2), so this could just be a sampling issue.
>
>
> 4. Burst w/ limited 0-length packets:
> ```
> usb_request rtt curr : min/max/mean: 6591879 : 644246/7986613/4202894
> usb_request rtt curr : min/max/mean: 6585978 : 644246/7986613/4202929
> usb_request rtt curr : min/max/mean: 6582805 : 644246/7986613/4202964
> usb_request rtt curr : min/max/mean: 3980957 : 644246/7986613/4202960
> usb_request rtt curr : min/max/mean: 4000162 : 644246/7986613/4202956
> usb_request rtt curr : min/max/mean: 3995484 : 644246/7986613/4202952
> usb_request rtt curr : min/max/mean: 3989380 : 644246/7986613/4202948
> usb_request rtt curr : min/max/mean: 3998942 : 644246/7986613/4202944
> usb_request rtt curr : min/max/mean: 3998779 : 644246/7986613/4202940
> ```
>
> ```
> frame time: curr: min/max/mean: 35985392 : 21889445/42860636/33474731
> frame time: curr: min/max/mean: 34428670 : 21889445/42860636/33476020
> frame time: curr: min/max/mean: 35499146 : 21889445/42860636/33478750
> frame time: curr: min/max/mean: 40315307 : 21889445/42860636/33487963
> frame time: curr: min/max/mean: 24934611 : 21889445/42860636/33476451
> frame time: curr: min/max/mean: 32321005 : 21889445/42860636/33474897
> frame time: curr: min/max/mean: 33268799 : 21889445/42860636/33474620
> frame time: curr: min/max/mean: 37001586 : 21889445/42860636/33479347
> frame time: curr: min/max/mean: 30968384 : 21889445/42860636/33475985
> ```
>
> This showed the most jitter in usb_request RTTs, likely because controller was
> frequently underrun or on the verge of underrunning. So while the requests were
> delayed by an average of 4ms, there was significant deviation per packet.
>
> The video frames were still encoded at a stable frequency, but there were still
> flickers from when ISOC requests would eventually underrun.
>
> In conclusion, it seems like the naive approach (2) has similar
> characteristics to the current version (1), albeit with an 8ms stream latency,
> and optimizing by means of changing interrupt frequency or number of requests
> result is minor, if any, performance increases.
>
> - Avi.
