Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA7E6882F4
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 16:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbjBBPqn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 10:46:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232771AbjBBPqk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 10:46:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD3B7B791
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 07:46:11 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D897D505;
        Thu,  2 Feb 2023 16:45:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675352727;
        bh=ugJOnnTC1XRM6GChGM1XsXB3bm1on/4YomtpJkVQhhg=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=X5EhEOC0/55OkYNDt10WsDtAFr2zpDe4NOD0P5lb77rYH0mA3upptjyQ6pzlN/jQK
         MrXXyIFgRf2W+DW0fa8eCfxVpn0ImWlMB4TH1/vgxNYpR8TomTISceNRsyppqCX7A8
         kJC0jtuQJYeFp+XOl9u/uMoq1ysFAo8LuyAgpn7s=
Message-ID: <9da07e03-7cd2-cfeb-8c67-4562948aa948@ideasonboard.com>
Date:   Thu, 2 Feb 2023 15:45:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        rogerq@kernel.org
References: <9ce226b4-90c6-94c4-a5ad-bd623409bc51@ideasonboard.com>
 <20230126002017.tbxc3j6xdgplncfs@synopsys.com>
 <dda24f8e-8d74-c6c1-ae7c-e423bc50a143@ideasonboard.com>
 <20230126193131.ifaj7arsrrgesjh5@synopsys.com>
 <Y9LjMcO/7/VUNld3@rowland.harvard.edu>
 <20230126235704.62d32y7y4sa4mmry@synopsys.com>
 <43b077ad-c8cd-bb49-134d-1bd66bed0b84@ideasonboard.com>
 <Y9vONL8ZyQdEVkr0@rowland.harvard.edu>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: Explicit status phase for DWC3
In-Reply-To: <Y9vONL8ZyQdEVkr0@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 02/02/2023 14:52, Alan Stern wrote:
> On Thu, Feb 02, 2023 at 10:12:45AM +0000, Dan Scally wrote:
>> (+CC roger as the author of the USB_GADGET_DELAYED_STATUS mechanism)
>>
>> On 26/01/2023 23:57, Thinh Nguyen wrote:
>>> We should already have this mechanism in place to do protocol STALL.
>>> Please look into delayed_status and set halt.
>>
>> Thanks; I tried this by returning USB_GADGET_DELAYED_STATUS from the
>> function's .setup() callback and later (after userspace checks the data
>> packet) either calling usb_ep_queue() or usb_ep_set_halt() and it does seem
>> to be working. This surprises me, as my understanding was that the purpose
>> of USB_GADGET_DELAYED_STATUS  is to pause all control transfers including
>> the data phase to give the function driver enough time to queue a request
>> (and possibly only for specific requests). Regardless though I think the
>> conclusion from previous discussions on this topic (see [1] for example) was
>> that we don't want to rely on USB_GADGET_DELAYED_STATUS to do this which is
>> why I had avoided it in the first place. A colleague made a series [2] some
>> time ago that adds a flag to usb_request which function drivers can set when
>> queuing the data phase request. UDC drivers then read that flag to decide
>> whether to delay the status phase until after another usb_ep_queue(), and
>> that's what I'm trying to implement here.
>>
>>
>> [1] https://lkml.org/lkml/2018/10/10/138
>>
>> [2] https://patchwork.kernel.org/project/linux-usb/patch/20190124030228.19840-5-paul.elder@ideasonboard.com/
> I'm in favor of the explicit_status approach from [2].  In fact, there
> was a whole series of patches impementing this, and I don't think any of
> them were merged.


Yep, I'm picking that series up and want to get it merged.

> Keep in mind that there are two separate issues here:
>
> 	Status/data stage for a control-IN or 0-length control-OUT
> 	transfer.
>
> 	Status stage for a non-0-length control-OUT transfer.
>
> The USB_GADGET_DELAYED_STATUS mechanism was meant to help with the
> first, not the second.  explicit_status was meant to help with the
> second; it may be able to help with both.

Ack - thanks. That thread I linked was very informative, I wish I'd 
found it sooner!


> Alan Stern
