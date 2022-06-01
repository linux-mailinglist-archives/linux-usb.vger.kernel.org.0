Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEED53B010
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jun 2022 00:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbiFAVSW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jun 2022 17:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbiFAVSV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jun 2022 17:18:21 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71E66B7DD
        for <linux-usb@vger.kernel.org>; Wed,  1 Jun 2022 14:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654118299; x=1685654299;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SxZ8oAyQcloLr4MItHNwRib2OfGTG5BD7+AARjsiOwg=;
  b=MIz0x+VRxa6FSj7cV9FJH8BwgdkFtTp9rZK3LeoVpPFFuDzNnHEfYcNW
   zt8UUGL0p/+reIPI2+i5gNlYTjpxC1LOlBlZpy160JFEwWFSUGDrppqAW
   cPoC+j/Czo47JW8BLJLP0uYpiYsKFQ/ywBnieJY0D86WttaEX6oiHlnM/
   Q=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Jun 2022 14:18:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 14:18:19 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 1 Jun 2022 14:18:18 -0700
Received: from [10.110.23.84] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 1 Jun 2022
 14:18:18 -0700
Message-ID: <a1eb1ca1-7253-2c4a-960c-82d0f435ae41@quicinc.com>
Date:   Wed, 1 Jun 2022 14:18:16 -0700
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
 <3b3e4d7f-d993-628d-c3c0-aa104127223a@quicinc.com>
 <7e4e9e74-c7f2-e4f1-577d-45b0e3be9ac0@quicinc.com>
 <4988ed34-04a4-060a-ccef-f57790f76a2b@synopsys.com>
From:   Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <4988ed34-04a4-060a-ccef-f57790f76a2b@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh,

On 5/25/2022 5:25 PM, Thinh Nguyen wrote:
> Wesley Cheng wrote:
>> Hi Thinh,
>>
>> On 5/23/2022 6:34 PM, Wesley Cheng wrote:
>>> Hi Thinh,
>>>
>>> Welcome back! :)
>>>
>>> On 5/23/2022 5:30 PM, Thinh Nguyen wrote:
>>>> Wesley Cheng wrote:
>>>>> Hi Thinh,
>>>>>
>>>>> On 4/26/2022 2:05 PM, Wesley Cheng wrote:
>>>>>> Hi Thinh,
>>>>>>
>>>>>> On 4/21/2022 7:22 PM, Thinh Nguyen wrote:
>>>>>>> This series cleanup and enhance dwc3 pullup() handling to cover
>>>>>>> different
>>>>>>> corner cases.
>>>>>>>
>>>>>>> Would be great to have some Tested-by before picking this series up.
>>>>>>> Thanks!
>>>>>>>
>>>>>>>
>>>>>>> Thinh Nguyen (6):
>>>>>>>      usb: dwc3: gadget: Prevent repeat pullup()
>>>>>>>      usb: dwc3: gadget: Refactor pullup()
>>>>>>>      usb: dwc3: gadget: Don't modify GEVNTCOUNT in pullup()
>>>>>>>      usb: dwc3: ep0: Don't prepare beyond Setup stage
>>>>>>>      usb: dwc3: gadget: Only End Transfer for ep0 data phase
>>>>>>>      usb: dwc3: gadget: Delay issuing End Transfer
>>>>>>>
>>>>>>>     drivers/usb/dwc3/ep0.c    |   2 +-
>>>>>>>     drivers/usb/dwc3/gadget.c | 126
>>>>>>> ++++++++++++++++++++------------------
>>>>>>>     2 files changed, 69 insertions(+), 59 deletions(-)
>>>>>>>
>>>>>>>
>>>>>>> base-commit: 5c29e864999763baec9eedb9ea5bd557aa4cbd77
>>>>>>
>>>>>> Thanks for this series.  Running the tests w/ the changes now and will
>>>>>> debug if I run into any issues.  I will need to run the previous test
>>>>>> cases I had as well, since the change removes the GEVNTCOUNT clearing
>>>>>> during pullup disable (this was added for some controller halt
>>>>>> failures).
>>>>>>
>>>>>
>>>>> Going to summarize some of the things I've found so far:
>>>>> 1.  DWC3_EP_DELAY_STOP flag set for EPs:
>>>>> The test case being run will have usb ep dequeue running closely in
>>>>> parallel to soft disconnect.  There is a chance that we run into
>>>>> controller halt due to active EPs, since we are not
>>>>> waiting/synchronizing for DWC3_EP_DELAY_STOP to be cleared or complete.
>>>>
>>>> I sent an update. Can you test it out?
>>>>
>>>>>
>>>>> Attached thinh_newest_delayed_status_causing_ep_stop_delay_flag.txt
>>>>> - Force device crash if run/stop routine fails w/ -ETIMEDOUT.
>>>>
>>>> Can you clarify here? Did you force the crash or did the crash occur due
>>>> to the change?
>>>>
>>> Just injecting a kernel panic if there is an -ETIMEDOUT condition
>>> during run/stop clear.  The end of the traces will be at the point of
>>> which the error occurred.
>>>
>>>>> - There is a situation where a function will return delayed_status, and
>>>>> we can see "timed out waiting for SETUP phase" print during pullup
>>>>> disable.
>>>>
>>>> It should be fine that the warning gets printed. The programming guide
>>>> suggested that the driver should wait for all the control transfers to
>>>> complete. This deviates from the programming guide. If it happens often
>>>> enough, we may need to increase the timeout.
>>>>
>>> Yes, agreed.
>>>
>>>>>
>>>>> 2.  Controller halt failure due to non-zero GEVNTCOUNT
>>>>> So with this patch series, and removing the GEVNTCOUNT clearing, I'm
>>>>> running into controller halt failures again.  When I printed the
>>>>> GEVNTCOUNT register at the time of failure, it showed that there were
>>>>> several pending events.
>>>>
>>>> Do you have the log for this? What's the IO delay for each register read
>>>> on your platform? I suspect that the polling for halt status is too
>>>> quick, we may need to add some delay between polls.
>>>>
>>> Will try to collect a log for you after adding the new changes (if I
>>> run into this).  I tried to increase the number of loops as well, but
>>> that didn't help.
>>>
>> I think the reason for the non-zero GEVNTCOUNT is probably due to the
>> fact that we're still getting EP0 events:
>>
>> [ 3548.040859][T20051] dwc3 a600000.dwc3: unexpected direction for Data
>> Phase
>> [ 3548.061282][T20051] dwc3 a600000.dwc3: unexpected direction for Data
>> Phase
>> [ 3548.071429][T20051] dwc3 a600000.dwc3: unexpected direction for Data
>> Phase
>> [ 3548.083499][T20051] dwc3 a600000.dwc3: unexpected direction for Data
>> Phase
>> [ 3548.095546][T20051] dwc3 a600000.dwc3: unexpected direction for Data
>> Phase
>> [ 3548.105820][T20051] dwc3 a600000.dwc3: unexpected direction for Data
>> Phase
>> [ 3548.122027][ T2189] dwc3_gadget_run_stop: pullups_connected = 0
>> [ 3548.156770][ T2189] GEVENT COUNT = 8
>>
>> In the changes proposed, you're blocking the inspect setup API if
>> !dwc->connected, but due to ret = -EINVAL, the exit routine will go and
>> issue a stall and restart on EP0.  I think your main intention was just
>> to ignore it, correct?
>>
> 
> No, not just ignoring it. The intention is that while polling for the
> halted state, the driver will continue to service any interrupt
> generated by the controller. If it's a control transfer, then the
> controller will respond with a STALL and rejects any new control
> transfer and setup a new TRB for the next setup stage. The interrupt
> handler will clear the GEVNTCOUNT while polling for halted state. The
> expectation here is to poll for the halted state long enough for the
> interrupt handler to come and clear the GEVNTCOUNT before the timeout.
> 
> Looks like somehow the polling for the halted state block the irq
> handler:
> 
> [ 3548.117872285       0xff828a6ab]   dbg_gadget_giveback: ep7in: req ffffff8041575600 length 0/65536 zsI ==> -108
> [ 3548.120646816       0xff82976c3]   dbg_send_ep_cmd: ep8in: cmd 'End Transfer' [110c08] params 00000000 00000000 00000000 --> status: Successful
> 
> There's a 30ms gap here. Probably during the polling? (would be good to
> have more register read/write tracepoints)
> 
> [ 3548.151314473       0xff83272d7]   event (080001c0): ep0out: Endpoint Command Complete
> [ 3548.151760931       0xff8329451]   event (080001c0): ep0out: Endpoint Command Complete
> [ 3548.152104577       0xff832ae18]   event (080001c0): ep0out: Endpoint Command Complete
> [ 3548.152452441       0xff832c82e]   event (080001c0): ep0out: Endpoint Command Complete
> [ 3548.152842702       0xff832e574]   event (080001c0): ep0out: Endpoint Command Complete
> [ 3548.153250150       0xff8330403]   event (080001c0): ep0out: Endpoint Command Complete
> [ 3548.153657285       0xff833228b]   event (080001c0): ep0out: Endpoint Command Complete
> 
> 
> Can you add msleep(1) in between the polling:
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index ee8e8974302d..9c0d61a2dd82 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2814,6 +2814,8 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
>          dwc3_gadget_dctl_write_safe(dwc, reg);
>   
>          do {
> +               msleep(1);
> +
>                  reg = dwc3_readl(dwc->regs, DWC3_DSTS);
>                  reg &= DWC3_DSTS_DEVCTRLHLT;
>          } while (--timeout && !(!is_on ^ !reg));
> 
> 
> (If this works, we can slightly modify this logic to save 1ms)
> 
> BTW, is there a problem with enabling other tracepoint events? I have to
> make some guesses when reading the log.
> 

With the test I'm running, I have to make some changes to hook into the 
DWC3 tracepoints we have and save it into a different logging mechanism 
we have.  The default ftrace is being routed to a different path while 
this test is running.

I'll see if I can add some reg reads/writes logs.

With the current changes (I've also seen this w/o the latest msleep() 
change), I'm getting into a situation where there is a controller halt. 
  In this case though, GEVNTCNT is 0, but I think what is happening is 
that we are interweaving pullup enable and pullup disable calls, and 
some pullup enable sequences are failing, which lead to the next pullup 
disable to fail halting of the controller.

if (dwc->pullups_connected == is_on)
         return 0;

If the pullup disable routine is running the run/stop path, and USB 
gadget attempts to call pullup enable, this IF condition will allow the 
pullup enable to continue.  This is because pullups_connected is set to 
FALSE before the controller halt polling, so 0->1 transition is valid.

I'm not sure how most USB composite devices behave, but I don't think 
most will retry if the pullup enable returns an error. (?)  I say this 
because we can modify the IF condition to block the subsequent pullup 
enable call, if we have not yet finished the controller halt.

In the snippet below, we can see that, we disabled the run/stop bit and 
halted the controller shortly after receiving the RESET event.  This 
means that the dwc3 gadget stop was called, and EP0 was disabled as well 
(flags were also cleared).  This is leading to the CONNDONE event to 
then re-do the start config, as EP0 is not "enabled."  I think that is 
not the expected sequence.

[ 3899.673491795       0x118aae3bf1]   dbg_send_ep_cmd: ep0out: cmd 'Set 
Endpoint Configuration' [401] params 00001000 00000500 00000000 --> 
status: Successful
[ 3899.673534504       0x118aae3f25]   dbg_send_ep_cmd: ep0in: cmd 'Set 
Endpoint Configuration' [401] params 00001000 02000500 00000000 --> 
status: Successful
[ 3899.673584920       0x118aae42ed]   dbg_send_ep_cmd: ep0out: cmd 
'Start Transfer' [406] params 00000000 efffa000 00000000 --> status: 
Successful
[ 3899.700573][T24732] dwc3_gadget_run_stop: pullups_connected = 1

[ 3899.744634556       0x118ac313a7]   event (00030601): Suspend [U3]
[ 3899.838616483       0x118ade9c4d]   event (00000101): Reset [U0]

[ 3899.922413][ T2186] dwc3_gadget_run_stop: pullups_connected = 0

[ 3900.147395911       0x118b3912c0]   event (00000201): Connection Done 
[U0]
[ 3900.147486276       0x118b391988]   dbg_send_ep_cmd: ep0out: cmd 
'Start New Configuration' [409] params 00000000 00000000 00000000 --> 
status: Successful
[ 3900.147535234       0x118b391d34]   dbg_send_ep_cmd: ep0out: cmd 'Set 
Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> 
status: Successful

Thanks
Wesley Cheng
