Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E75136879E4
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 11:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232245AbjBBKMz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 05:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbjBBKMw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 05:12:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B07D71996
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 02:12:51 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90381505;
        Thu,  2 Feb 2023 11:12:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675332768;
        bh=2jYANZg6skmoVk4M7HuBZgtlDydISLaFPT+EvzB14SM=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=AzydEKdiAn0QU1zCB/c4kiH5tIGekRhaN+58o638PdaNiBw0GwJ1145hVanHGoDCz
         cqQ+U9ANrmnBmfEJRwpDj5cTOAzfAyntfdu5w2EyVhhsX8jiwx9Vmpi8iuwny4YW/P
         33v144bZ1ZPtbqWboej0wleYh6oPi2s78RKEw9PE=
Message-ID: <43b077ad-c8cd-bb49-134d-1bd66bed0b84@ideasonboard.com>
Date:   Thu, 2 Feb 2023 10:12:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        rogerq@kernel.org
References: <9ce226b4-90c6-94c4-a5ad-bd623409bc51@ideasonboard.com>
 <20230126002017.tbxc3j6xdgplncfs@synopsys.com>
 <dda24f8e-8d74-c6c1-ae7c-e423bc50a143@ideasonboard.com>
 <20230126193131.ifaj7arsrrgesjh5@synopsys.com>
 <Y9LjMcO/7/VUNld3@rowland.harvard.edu>
 <20230126235704.62d32y7y4sa4mmry@synopsys.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: Explicit status phase for DWC3
In-Reply-To: <20230126235704.62d32y7y4sa4mmry@synopsys.com>
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

(+CC roger as the author of the USB_GADGET_DELAYED_STATUS mechanism)

On 26/01/2023 23:57, Thinh Nguyen wrote:
> On Thu, Jan 26, 2023, Alan Stern wrote:
>> On Thu, Jan 26, 2023 at 07:31:34PM +0000, Thinh Nguyen wrote:
>>> On Thu, Jan 26, 2023, Dan Scally wrote:
>>>> Hi Thinh
>>>>
>>>> On 26/01/2023 00:20, Thinh Nguyen wrote:
>>>>> On Tue, Jan 24, 2023, Dan Scally wrote:
>>>>>> Hi Thinh
>>>>>>
>>>>>>
>>>>>> I'm trying to update the DWC3 driver to allow the status phase of a
>>>>>> transaction to be explicit; meaning the gadget driver has the choice to
>>>>>> either Ack or Stall _after_ the data phase so that the contents of the data
>>>>>> phase can be validated. I thought that I should be able to achieve this by
>>>>>> preventing dwc3_ep0_xfernotready() from calling dwc3_ep0_do_control_status()
>>>>>> (relying on an "explicit_status" flag added to the usb_request to decide
>>>>>> whether or not to do so) and then calling it manually later once the data
>>>>>> phase was validated by the gadget driver (or indeed userspace). A very
>>>>>> barebones version of my attempt to do that looks like this:
>>>>>>
>>>>> We shouldn't do this. At the protocol level, there must be better ways
>>>>> to do handshake than relying on protocol STALL _after_ the data stage.
>>>>> Note that not all controllers support this.
>>>>
>>>> Maybe I'm misunderstanding, but isn't this how the USB spec expects it to
>>>> work? Reading "Reporting Status Results (8.5.3.1)" in the USB 2.0 spec for
>>>> the status stage in a control write it says "The function responds with
>>>> either a handshake or a zero-length data packet to indicate its current
>>>> status", and the handshake can be either STALL or NAK. If we can't do this,
>>>> how else can we indicate to the host that the data sent during a control out
>>>> transfer is in some way invalid?
>>>>
>>> My concern is from the documentation note[*] added from this commit:
>>> 579c2b46f74 ("USB Gadget: documentation update")
>> When the gadget subsystem was originally designed, it made no allowance
>> for sending a STALL in the status stage.  The UDC drivers existing at
>> that time would automatically send their own zero-length status packet
>> when the control data was received.
>>
>> Drivers written since then have copied that approach.  They had to, if
>> they wanted to work with the existing gadget drivers.  So the end result
>> is that fully supporting status stalls will require changing pretty much
>> every UDC driver.
>>
>> As for whether the UDC hardware has support...  I don't know.  Some of
>> the earlier devices might not, but I expect that the more popular recent
>> designs would provide a way to do it.
>>
> Right, it's just a bit concerning when the document also noted this:
> "Note that some USB device controllers disallow protocol stall responses
> in some cases."
>
> It could be just for older controllers as you mentioned.
>
>
> Hi Dan,
>
> We should already have this mechanism in place to do protocol STALL.
> Please look into delayed_status and set halt.


Thanks; I tried this by returning USB_GADGET_DELAYED_STATUS from the 
function's .setup() callback and later (after userspace checks the data 
packet) either calling usb_ep_queue() or usb_ep_set_halt() and it does 
seem to be working. This surprises me, as my understanding was that the 
purpose of USB_GADGET_DELAYED_STATUS  is to pause all control transfers 
including the data phase to give the function driver enough time to 
queue a request (and possibly only for specific requests). Regardless 
though I think the conclusion from previous discussions on this topic 
(see [1] for example) was that we don't want to rely on 
USB_GADGET_DELAYED_STATUS to do this which is why I had avoided it in 
the first place. A colleague made a series [2] some time ago that adds a 
flag to usb_request which function drivers can set when queuing the data 
phase request. UDC drivers then read that flag to decide whether to 
delay the status phase until after another usb_ep_queue(), and that's 
what I'm trying to implement here.


[1] https://lkml.org/lkml/2018/10/10/138

[2] 
https://patchwork.kernel.org/project/linux-usb/patch/20190124030228.19840-5-paul.elder@ideasonboard.com/

>
> Regarding this question:
> 	How else can we indicate to the host that the data sent during a
> 	control out transfer is in some way invalid?
>
> Typically there should be another request checking for the command
> status. I suppose if we use protocol STALL, you only need to send status
> request check on error cases.
>
> Thanks,
> Thinh
