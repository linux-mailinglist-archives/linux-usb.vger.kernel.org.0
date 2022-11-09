Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA1416228E4
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 11:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbiKIKrD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Nov 2022 05:47:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiKIKrC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Nov 2022 05:47:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BFDDEA8
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 02:47:01 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 489A611EC;
        Wed,  9 Nov 2022 11:46:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667990820;
        bh=MqnggFOy/8U5C56JPdGT8FLprlKtaeEFNELJwDWXaJI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Dflq2lzttVWmHAlxvAop0Wv/6kxhcfwEJEsKP9pim0sMy3Y0Bj8nlVNpMYcwg4Rw/
         YWpAg9S+fzQ88pK24Etge/e847nBJoUCzVtMhn7vF3MMcOEksAarLVsr2zcn/7gSvq
         kMlHlS5cg3zImZr+XwXTA2YkDYvBX6Qidsph6oVQ=
Message-ID: <963901c2-7a8c-ee21-fe25-d6a95d09cdfc@ideasonboard.com>
Date:   Wed, 9 Nov 2022 10:46:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] uvc: gadget: uvc: Defer uvcg_complete_buffer() until
 .complete()
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran@linuxembedded.co.uk, balbi@kernel.org, mgr@pengutronix.de,
        w36195@motorola.com
References: <20221019124535.2712902-1-dan.scally@ideasonboard.com>
 <Y2uE94G9y99ynP7r@kroah.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <Y2uE94G9y99ynP7r@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

On 09/11/2022 10:46, Greg KH wrote:
> On Wed, Oct 19, 2022 at 01:45:35PM +0100, Daniel Scally wrote:
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
>> is encoded via uvc_video_encode_isoc_sg(). For consistency's sake the
>> same change is applied to uvc_video_encode_bulk().
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>
>> Changes in v2:
>>
>> 	- Applied the same change to uvc_video_encode_bulk() for consistency
>>
>> @Dan - In the end I thought this is probably worth separating from your "usb:
>> gadget: uvc: fix sg handling in error case" patch, since it fixes a separate
>> issue by itself. I _think_ they're separable but I wasn't experiencing the
>> problem you were so I can't test that - let me know if I'm wrong.
>>
>> @Michael - I dropped your R-b since I made the change to uvc_video_encode_bulk()
>> too, didn't want to jump the gun :)
>
> Does not apply to my tree anymore :(
>
> Can you rebase against the usb-linus branch of usb.git and resend?


Sure thing

>
> thanks,
>
> greg k-h
