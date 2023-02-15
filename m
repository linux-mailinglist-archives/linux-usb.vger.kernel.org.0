Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA2866981FA
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 18:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjBORaA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 12:30:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjBOR37 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 12:29:59 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F2944A3
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 09:29:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2ADB0B82252
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 17:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BA4C433D2;
        Wed, 15 Feb 2023 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676482195;
        bh=IADsL7HxvyLN9/hwDjCHcfOzN9TtOAKFtNmRDhHpVxU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=c7wTpuGby7uR9/Wa7div51nZlcTvMbT2O+xMadV5HUq6qSlrqT9ZSF8qopTrm/hmJ
         fnBOpCLVftlzAXHCcTQi5CKh0Iw0Ocg6/JyW94Wtl1oBWeKOdzbtMeGFMStLSR0HqT
         zvRs0xq+QNGq6Kid0gcsTM3nAKCUQTldlykQ6gh7lSE0Db+/uNgpXWszUqMRwVMyBq
         HxgbDqPh4bfjNNoX5TOXNieDgAakaES9mE64Gbq2JSfMStysW+FYjhjd9AtT8v57cw
         +DtfhTIOPYU7V9ejDU42zppNJll8I0GViSiCw+MxjgujeJH/aG0qu/4ztAGoJYad5Q
         mbcQ+9TzAu06A==
Message-ID: <3b530a74-0fb9-432b-b1d9-606a9694ce1e@kernel.org>
Date:   Wed, 15 Feb 2023 19:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: dwc3: gadget suspend/resume vs system suspend/resume
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <7e28eb10-f27b-682a-dfb3-fec3e70b01f6@kernel.org>
 <Y+z9NK6AyhvTQMir@rowland.harvard.edu>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <Y+z9NK6AyhvTQMir@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 15/02/2023 17:41, Alan Stern wrote:
> On Wed, Feb 15, 2023 at 11:40:15AM +0200, Roger Quadros wrote:
>> Hi Thinh,
>>
>> Currently dwc3 gadget disconnects from the bus in the system suspend 
>> path. i.e. dwc3_gadget_suspend()->dwc3_disconnect_gadget().
>>
>> Is it reasonable to expect dwc3 gadget to do a USB suspend instead of 
>> a USB disconnect during system suspend?
> 
> Gadgets can't initiate a USB suspend.  Only the host can.
> 
> Did you mean to ask the opposite question?  I.e., is it reasonable for a 
> dwc3 gadget to go into system suspend when it gets a USB suspend?

Yes. Thanks for correcting. ;)

> 
> In general, it's easiest for gadgets to disconnect from the USB bus when 
> their system suspends, if they aren't already in USB suspend.  This is 
> because they would be unable to respond to requests from the host while 
> sleeping.

Oh in that case the gadget driver will have to prevent a system suspend till
the gadget is put into USB suspend by the USB host.
I think this is a reasonable expectation. It could be an application specific
requirement. i.e. whether to disconnect on system suspend or wait
for USB suspend before system suspend.


> 
>> At USB resume, system can wake up and resume and then dwc3 gadget can 
>> resume.
>>
>> I'd like to know your opinion please if this is a reasonable 
>> expectation or something just not possible to achieve. Thanks!
> 
> There can be exceptions, but it's a dicey thing.  The UDC hardware would 
> have to be able to send handshake packets back to the host while 
> remaining in low power, it would have to be able to generate a wakeup 
> signal to bring its system back to full power, and the system would have 
> to be able to resume in time for the gadget to respond to a request from 
> the host before the request times out.
> 
> The situation is different if the gadget is already in USB suspend.  
> Then it only needs to be able to wake up its system when it gets a USB 
> resume signal.  But the system would still have to wake up reasonably 
> quickly.

I was more interested in this case where USB is suspended and then system suspends.
Waking up the system on USB activity (while suspended) is taken care of by hardware.
But I'm not sure if gadget driver will be up in time to respond to the request
reasonably quickly. It would take a couple of seconds and is not hard time bound.
Is this time mandated by the USB Spec or is it host implementation specific?

cheers,
-roger
