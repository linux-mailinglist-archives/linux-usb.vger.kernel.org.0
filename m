Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8876653204C
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 03:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbiEXBeW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 May 2022 21:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbiEXBeV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 May 2022 21:34:21 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C2C742A0D
        for <linux-usb@vger.kernel.org>; Mon, 23 May 2022 18:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653356060; x=1684892060;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=roIljArhbdWJhaTXOkIjKx2me6y6mQe+aX4ezUkMXro=;
  b=O6nf10FG8qAv4X6o+SkMEDEpU0WQrQmtjxG1Ex2pEIXY9X8Ryoayd1nO
   /0O9I4xaqdX7O2n2c55YcVnU/RK4UZX8OeXSYDG+D6kumhDavgIZ58Gpy
   xdJKxZSvB9lgq2PGv34+q1JzKeRlj4eOrtxvirLD8yZ1EEot2EEA8V2xg
   w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 23 May 2022 18:34:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 18:34:19 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 23 May 2022 18:34:19 -0700
Received: from [10.110.113.252] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 23 May
 2022 18:34:18 -0700
Message-ID: <3b3e4d7f-d993-628d-c3c0-aa104127223a@quicinc.com>
Date:   Mon, 23 May 2022 18:34:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/6] usb: dwc3: gadget: Rework pullup
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
 <14105f3b-aa09-1fd5-48f4-9f15eec2473e@quicinc.com>
 <aa9e6681-76f1-357c-b01c-64576b5faee8@quicinc.com>
 <ac113646-7814-374c-c546-a583e4144e18@synopsys.com>
From:   Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ac113646-7814-374c-c546-a583e4144e18@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh,

Welcome back! :)

On 5/23/2022 5:30 PM, Thinh Nguyen wrote:
> Wesley Cheng wrote:
>> Hi Thinh,
>>
>> On 4/26/2022 2:05 PM, Wesley Cheng wrote:
>>> Hi Thinh,
>>>
>>> On 4/21/2022 7:22 PM, Thinh Nguyen wrote:
>>>> This series cleanup and enhance dwc3 pullup() handling to cover
>>>> different
>>>> corner cases.
>>>>
>>>> Would be great to have some Tested-by before picking this series up.
>>>> Thanks!
>>>>
>>>>
>>>> Thinh Nguyen (6):
>>>>     usb: dwc3: gadget: Prevent repeat pullup()
>>>>     usb: dwc3: gadget: Refactor pullup()
>>>>     usb: dwc3: gadget: Don't modify GEVNTCOUNT in pullup()
>>>>     usb: dwc3: ep0: Don't prepare beyond Setup stage
>>>>     usb: dwc3: gadget: Only End Transfer for ep0 data phase
>>>>     usb: dwc3: gadget: Delay issuing End Transfer
>>>>
>>>>    drivers/usb/dwc3/ep0.c    |   2 +-
>>>>    drivers/usb/dwc3/gadget.c | 126 ++++++++++++++++++++------------------
>>>>    2 files changed, 69 insertions(+), 59 deletions(-)
>>>>
>>>>
>>>> base-commit: 5c29e864999763baec9eedb9ea5bd557aa4cbd77
>>>
>>> Thanks for this series.  Running the tests w/ the changes now and will
>>> debug if I run into any issues.  I will need to run the previous test
>>> cases I had as well, since the change removes the GEVNTCOUNT clearing
>>> during pullup disable (this was added for some controller halt failures).
>>>
>>
>> Going to summarize some of the things I've found so far:
>> 1.  DWC3_EP_DELAY_STOP flag set for EPs:
>> The test case being run will have usb ep dequeue running closely in
>> parallel to soft disconnect.  There is a chance that we run into
>> controller halt due to active EPs, since we are not
>> waiting/synchronizing for DWC3_EP_DELAY_STOP to be cleared or complete.
> 
> I sent an update. Can you test it out?
> 
>>
>> Attached thinh_newest_delayed_status_causing_ep_stop_delay_flag.txt
>> - Force device crash if run/stop routine fails w/ -ETIMEDOUT.
> 
> Can you clarify here? Did you force the crash or did the crash occur due
> to the change?
> 
Just injecting a kernel panic if there is an -ETIMEDOUT condition during 
run/stop clear.  The end of the traces will be at the point of which the 
error occurred.

>> - There is a situation where a function will return delayed_status, and
>> we can see "timed out waiting for SETUP phase" print during pullup disable.
> 
> It should be fine that the warning gets printed. The programming guide
> suggested that the driver should wait for all the control transfers to
> complete. This deviates from the programming guide. If it happens often
> enough, we may need to increase the timeout.
> 
Yes, agreed.

>>
>> 2.  Controller halt failure due to non-zero GEVNTCOUNT
>> So with this patch series, and removing the GEVNTCOUNT clearing, I'm
>> running into controller halt failures again.  When I printed the
>> GEVNTCOUNT register at the time of failure, it showed that there were
>> several pending events.
> 
> Do you have the log for this? What's the IO delay for each register read
> on your platform? I suspect that the polling for halt status is too
> quick, we may need to add some delay between polls.
> 
Will try to collect a log for you after adding the new changes (if I run 
into this).  I tried to increase the number of loops as well, but that 
didn't help.

> If you have the log, can you also enable register read/write to see the
> delta time?
> 
I'll need to collect a set of logs for this.  Will add the register 
read/write log also.

Thanks
Wesley Cheng
