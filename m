Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6E0B5F38FB
	for <lists+linux-usb@lfdr.de>; Tue,  4 Oct 2022 00:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbiJCW1E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Oct 2022 18:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbiJCW0k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Oct 2022 18:26:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A5E5AC4C
        for <linux-usb@vger.kernel.org>; Mon,  3 Oct 2022 15:23:15 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D737E9DE;
        Tue,  4 Oct 2022 00:23:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664835785;
        bh=rueWrF+VXPQ+EmewABgIXqVOrRDoGnubcauJAWXztus=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=m/kAGPJivPmhgGyCSWQ5hEpGvGYuiR3NaUtxjATwGw/8rNO0xsBoeiTW72M3rsE9z
         +pacb6cRfYFz1xwS7tFMWROtrn97PYhPSVkLcF74hk5ZuWsZnYur95slC6wG5eoXLr
         BB2OyOOjdVIL0jIlEmKlxRoF0iBuDgLp8rmTVIeA=
Message-ID: <0de496bf-fbc6-a2a1-a967-9a0580a7b1eb@ideasonboard.com>
Date:   Mon, 3 Oct 2022 23:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Dan Vacura <w36195@motorola.com>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran@linuxembedded.co.uk, balbi@kernel.org,
        gregkh@linuxfoundation.org, mgr@pengutronix.de
References: <20221003101627.144026-1-dan.scally@ideasonboard.com>
 <Yzr/Htmws3eGa41v@p1g3>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH] uvc: gadget: uvc: Defer uvcg_complete_buffer() until
 .complete()
In-Reply-To: <Yzr/Htmws3eGa41v@p1g3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan

On 03/10/2022 16:26, Dan Vacura wrote:
> Hi Dan,
>
> Looks like I did a superset of your change here:
> https://lore.kernel.org/all/20220926195307.110121-2-w36195@motorola.com/


Ah-ha nice, thanks for the heads up - I'll take a better look tomorrow, 
but yours is definitely more comprehensive :)

>
> I also included the uvc_video_encode_bulk() for consistency, even though
> it seems to be unused code.
>
> Out of curiosity, which setup did you test this on? I'm seeing issues on
> my devices with the dwc3 controller with some of the recent performance
> improvements (scatter/gather support and no_interrupt use). I've tried
> to include all relevant changes in my setup, but the issues are still
> present.


I'm testing with an imx8mp evaluation kit and a debix model A board 
(also with the imx8mp soc) as the gadget, both with a dwc3 controller. 
We also experience issues when it's using the scatter/gather API, to the 
extent that I added module parameters to set the support_sg variable 
false and exclude it. When using the sg code either the host or gadget 
would report a lot of missed isoc errors (manifesting on the host as 
uvcvideo reporting "USB isochronous frame lost" or on the gadget side as 
f_usb_uvc reporting "VS request completed with status -18") and no 
complete streams made it through to the host - particularly with 
streaming_maxpacket > 1024. Forcing the use of uvc_video_encode_isoc() 
instead resolved the majority of those problems.


I did also try an rpi4 (dwc2) as the gadget and didn't hit those 
problems with that board.


The problem this patch was solving was quite a bit different though, I 
hadn't considered them to be related.

>
> Any input is appreciated,
>
> Dan
>
>
> On Mon, Oct 03, 2022 at 11:16:27AM +0100, Daniel Scally wrote:
>> Calling uvcg_complete_buffer() from uvc_video_encode_isoc() sometimes
>> causes the final isoc packet for a video frame to be delayed long
>> enough to cause the USB controller to drop it. The first isoc packet
>> of the next video frame is then received by the host, which interprets
>> the toggled FID bit correctly such that the stream continues without
>> interruption, but the first frame will be missing the last isoc
>> packet's worth of bytes.
>>
>> To fix the issue delay the call to uvcg_complete_buffer() until the
>> usb_request's .complete() callback, as already happens when the data
>> is encoded via uvc_video_encode_isoc_sg().
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   drivers/usb/gadget/function/uvc_video.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
>> index c00ce0e91f5d..041819a655ed 100644
>> --- a/drivers/usb/gadget/function/uvc_video.c
>> +++ b/drivers/usb/gadget/function/uvc_video.c
>> @@ -194,6 +194,7 @@ static void
>>   uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
>>   		struct uvc_buffer *buf)
>>   {
>> +	struct uvc_request *ureq = req->context;
>>   	void *mem = req->buf;
>>   	int len = video->req_size;
>>   	int ret;
>> @@ -213,7 +214,7 @@ uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
>>   		video->queue.buf_used = 0;
>>   		buf->state = UVC_BUF_STATE_DONE;
>>   		list_del(&buf->queue);
>> -		uvcg_complete_buffer(&video->queue, buf);
>> +		ureq->last_buf = buf;
>>   		video->fid ^= UVC_STREAM_FID;
>>   	}
>>   }
>> -- 
>> 2.34.1
>>
