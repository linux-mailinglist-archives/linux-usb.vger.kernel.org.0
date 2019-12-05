Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE081149C8
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 00:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbfLEXUT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 18:20:19 -0500
Received: from mout.gmx.net ([212.227.15.15]:37095 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725959AbfLEXUT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Dec 2019 18:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1575587995;
        bh=qXt9uKIEuqrB5lmyh7zp6zyi1Amgfn/PCfcwychd5qo=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=J03A7wxJ2HNZMU8Tj0ZSTdj+C2PGrNwWlMT6UGH0f0QPSPZPQJRP6EJx2OIzqFok5
         5X4PsNAVTBuEow1AO7Ca1+ebdqcwySi8lW/vBFRv3Mh7PL0nSJrMJjtFt4bDYf2h56
         eRSw2q1PQZp+G6jIT/M/nyvrybbuM1XEpGB7Au5w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.132] ([91.113.91.228]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wLZ-1ifTVp2lxb-007VML; Fri, 06
 Dec 2019 00:19:54 +0100
Subject: Re: Regression: USB/xhci issues on some systems with newer kernel
 versions
To:     Prashant Malani <pmalani@chromium.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Hayes Wang <hayeswang@realtek.com>,
        Grant Grundler <grundler@chromium.org>
References: <3edaf835-7cde-37d9-5a0a-5a9b21a02968@gmx.at>
 <4dfc2bca-e333-4f05-e795-23cbe481d53e@linux.intel.com>
 <485bd962-2a2d-1e15-54c6-3685fb7597a3@gmx.at>
 <50ecb110-8ab6-929b-e33e-025e04a12bc8@linux.intel.com>
 <CACeCKaezMBWH+cnmOdOc+hizW3SNU+Sb5h5PWXdt9f2GcOVfFQ@mail.gmail.com>
From:   Bernhard Gebetsberger <bernhard.gebetsberger@gmx.at>
Message-ID: <7da29d7d-836a-8f37-5f07-e180bebcb1ca@gmx.at>
Date:   Fri, 6 Dec 2019 00:19:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACeCKaezMBWH+cnmOdOc+hizW3SNU+Sb5h5PWXdt9f2GcOVfFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:coDKR4w23GzL790+/+PmjV3vfqDAvrXFxwWlZ2G14cknBloJ44t
 SNUL8ZSBzTE89v50LK791IHfUkZPA52SYoLZTmHdT+JDVA56ioIJahBf5vO+0Oe0VhWFd9h
 7ARTK+FEfIB4l2eN35fUKEGIDmuG/2rTOpPggQCFGZXot5Bf5D++fJZ8mgGZXPV2VShvm/c
 JUe62YuEDDPWlZ53u4VNw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JF2mETqPN9g=:bgqZNE0oW4KZa1v+Tp3/TW
 1iET+wwE+3xTnUR6pT+Z4zceAlIe3yScA7BVoH4WJz3cOEBOoQPs2OIl1Jf1fQUBjtRF6zn2H
 iSYHuhNMZtm4xUOECDPIIpZRU8y4HwXSH8hfzZIo8KTRDaTlqBSR7qtYnrKE3Jw7bWV445cUv
 fED0pRrjbm6OnpCepnE57MyCOG4HX19bp9vdm52fQgnFjdrcLQMpAhJsRrZArtGE7db0mPhlt
 6Od4CDuLxVask7wTX6J9K80WOFAxu+DFe0Lf2Wo4W7aF4QDVTB/RgoJ761YJer1+o+4qW9pss
 W42vgC1RAi1r4kX2+52gw9OfQvmQFx2XseRWBDs1kgql2Bh7AKaE1SIMsXXMG1ocFAUguQ3mH
 QGABoUBJ9oi7ovbPl3iqGoLTghPGzgxYSgv+VQFzRexh3lqr29ic3cr70INHx0oxEHMP4awmV
 p3JkVza1oD8Aqds+pNrsAiwbUrTdU0S5iaywA7FOMJrvui8VogyrNjUyj3ezpmtw4GAMcRMNI
 N0Ws2OHinP25erzL4zcfrdhwp8Z7HrJwyEwBGmsWQZausZ8jvFg3HBwHIndFFMjJOMR7kNGKM
 xWory8Z11Y9p2xBDEdi4FPobUDD6Mqx6tibT2Ig0lO0dygtRPGaSJNIy7EngQKU9cQCrBNWLl
 u5OoI2Hlqud2WBUs5YtnRM2iSinytyxz2YHdB+iIPGk63BoL/j5JWHJmX8fvt6XSi0Sxufack
 3qBgQQubOhBbRRQuJQAG3RG/jZLu4nBSXbEdin6beBHxbAvLLqQgk9DF3BA91TwqFd6riE545
 6HWwuSU7XAIl9dKcvkA1abqBIi7ysmzmEhJ142q33aXkwWrsm+zIb619RZ0cSGqv281kj8d7p
 Dk1yiy06e/OPe9oRAJEGfl96E2NDoI2LJ/k5YIXoqa57oPoNBME5KtijGM3TTS0XmcgL9r1ku
 Ql6VZFHej/CfRkG75LGmiDCYubGwW1DPK4P4FJ6sqBR9VKiZHNxhkGzOeHkv+uEUYqxGEi40w
 oI+5APWF05R8ZWpAy8p62h4DqPdPItl8TPD8t0wa9v7Nl9m7j3Pg3Ug5t06uRVGfo3hqcT9oZ
 8Y+1gf1HD8B4m9/uvlx+AnMOZmut9dUSqb668EyhupQF2fKrrlqBrF27RNBYvJQeqjI2abVE+
 yykkvd0ZNHNTS/AyaOitio9JgYQdL/w9YPpsYALxNpd3Rc84JYyNuiI5FviefcsKg4V7O+Gvl
 LmQhjQSXqJK2iG3DgsziPL+8hQR257hEbtzfhkDtridyJk4lpXjgIoyNhOvs=
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

The issue I have hasn't been resolved. I'm currently running a custom kernel, with the
commitf8f80be501aa2f10669585c3e328fad079d8cb3a reverted, which works fine for me. I'm not
sure if the issue you have is related to mine, because I don't have any issues with 4.19,
and I'm also using a different driver(rt2800usb).

- Bernhard

Am 05.12.19 um 21:34 schrieb Prashant Malani:
> Hi Mathias and Bernhard,
>
> I was interested in knowing if this issue was resolved (sounded like
> this was deemed to be a hardware error, but I'm not sure).
> The reason I ask is that we've recently noticed a similar error
> popping up while using Realtek rtl8153a-based ethernet USB dongles
> (these use the r8152 driver) on kernel 4.19 :
> " hci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to
> incorrect slot or ep state."
> This is generally followed by the dongle getting reset, and the
> process repeats itself continuously.
>
> I can share more detailed logs if required. The specific dongle I used
> was LinkSys USB3GIGV1 (I think the official link is :
> https://www.linksys.com/us/support-product?pid=01t80000003fwbWAAQ)
>
> Some interesting data points:
> - This issue doesn't manifest itself on kernel 4.4 or 4.14 but does
> show up on 4.19
> - This issue didn't manifest itself on 4.19 either before recent
> changes were incorporated to patch the dongle firmware (commit
> 9370f2d05a2a150b0aa719a3070b26d478180df3 on the linux mainline
> branch). After the firmware patching changes went in, 4.19 started
> exhibiting this issue (4.4 and 4.14 still don't exhibit it).
>
> Thanks and Best regards!
>
>
> On Mon, Oct 14, 2019 at 6:01 AM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
>> On 3.10.2019 18.13, Bernhard Gebetsberger wrote:
>>> I sent the instructions to one of the users in the bug tracker.
>>> Here is the download link for his logs: https://www.sendspace.com/file/413hlj
>>>
>> Thanks.
>> Traces show driver handles the Transaction error normally by issuing a endpoint reset,
>> which is successful, but after that there is no activity on that endpoint even if there
>> are over 120 transfers requests (TRB) pending.
>> After over 40 seconds the class driver starts canceling the pending transfers.
>>
>> after soft retry the xhci driver should ring the doorbell of the endpoint, and hardware
>> should start processing pending TRBs, but ring is not handling pending TRBs
>> Looks like either driver or hardware fails to start the endpoint ring again
>>
>> I'll add some more tracing to check driver correctly rings the endpoint doorbell.
>>
>>
>> Details of trace:
>>
>> -Several TRBs (over 120) queued for slot 4 ep 3 (ep1in-bulk), starting at 0xff2d1000, up to 0xff2d1800 (0x10 per TRB)
>>
>>    164.884097: xhci_urb_enqueue: ep1in-bulk: urb 000000005ebe7973 pipe 3221259648 slot 4 length 0/3860 sgs 0/0 stream 0 flags 00010200
>>    164.884099: xhci_queue_trb: BULK: Buffer 00000000f9e2304c length 3860 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
>>    164.884101: xhci_inc_enq: BULK 00000000be510b60: enq 0x00000000ff2d1010(0x00000000ff2d1000) deq 0x00000000ff2d1000(0x00000000ff2d1000)
>>    ...
>>    164.884304: xhci_urb_enqueue: ep1in-bulk: urb 00000000fee4e260 pipe 3221259648 slot 4 length 0/3860 sgs 0/0 stream 0 flags 00010200
>>    164.884304: xhci_queue_trb: BULK: Buffer 00000000ff3a304c length 3860 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
>>    164.884304: xhci_inc_enq: BULK 00000000be510b60: enq 0x00000000ff2d1800(0x00000000ff2d1000) deq 0x00000000ff2d1000(0x00000000ff2d1000)
>>
>> -Transaction error 3 seconds later for TRB at 0xff2d1000
>>
>>    167.578273: xhci_handle_event: EVENT: TRB 00000000ff2d1000 status 'USB Transaction Error' len 3860 slot 4 ep 3 type 'Transfer Event' flags e:c
>>    167.578288: xhci_handle_transfer: BULK: Buffer 00000000f9e2304c length 3860 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
>>
>> -Soft retry by issuing a host side reset endpoint command,
>>
>>    167.578297: xhci_queue_trb: CMD: Reset Endpoint Command: ctx 0000000000000000 slot 4 ep 3 flags C
>>    167.578416: xhci_handle_event: EVENT: TRB 00000000ffefe440 status 'Success' len 0 slot 4 ep 0 type 'Command Completion Event' flags e:c
>>
>> -Host side of endpoint reset successful, endpoint is in stopped state as it should
>>
>>    167.578417: xhci_handle_command: CMD: Reset Endpoint Command: ctx 0000000000000000 slot 4 ep 3 flags C
>>    167.578419: xhci_handle_cmd_reset_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst
>>
>> -Driver should ring endpoint doorbell, and hardware should continue procressing TRBs
>> No activity at all on slot 4 ep 3, other endpoints continue running normally.
>> Check driver really rang ep doorbell
>>
>> A lot later class driver asks to cancel pending tranfer:
>>
>>    214.132531: xhci_urb_dequeue: ep1in-bulk: urb 000000005ebe7973 pipe 3221259648 slot 4 length 0/3860 sgs 0/0 stream 0 flags 00010200
>>    214.132548: xhci_dbg_cancel_urb: Cancel URB 000000005ebe7973, dev 2, ep 0x81, starting at offset 0xff2d1000
>>
>> -xhci driver tries to stop endpoint to cancel transfer:
>>
>>    214.132555: xhci_queue_trb: CMD: Stop Ring Command: slot 4 sp 0 ep 3 flags C
>>
>> -but it fails as slot is not in a proper state to be stopped, ep is in halted state after failed stop attempt.
>>
>>    214.132679: xhci_handle_event: EVENT: TRB 00000000ffefe450 status 'Context State Error' len 0 slot 4 ep 0 type 'Command Completion Event' flags e:C
>>    214.132680: xhci_handle_command: CMD: Stop Ring Command: slot 4 sp 0 ep 3 flags C
>>    214.132682: xhci_handle_cmd_stop_ep: State halted mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 0 maxp 512
>>
>> -After this endpoint stays in halted state, xhci driver fails to recover from this while canceling the reset of the TRBs
>>
>> -Mathias
