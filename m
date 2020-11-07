Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBA12AA571
	for <lists+linux-usb@lfdr.de>; Sat,  7 Nov 2020 14:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgKGNh6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 7 Nov 2020 08:37:58 -0500
Received: from mailfilter01-out30.webhostingserver.nl ([195.211.72.101]:47573
        "EHLO mailfilter01-out30.webhostingserver.nl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727298AbgKGNh5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 7 Nov 2020 08:37:57 -0500
X-Halon-ID: 6e03f2c5-20fe-11eb-9248-001a4a4cb906
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl [141.138.168.154])
        by mailfilter01.webhostingserver.nl (Halon) with ESMTPSA
        id 6e03f2c5-20fe-11eb-9248-001a4a4cb906;
        Sat, 07 Nov 2020 14:37:50 +0100 (CET)
Received: from op35.xs4all.space ([83.160.74.106] helo=[192.168.178.48])
        by s198.webhostingserver.nl with esmtpa (Exim 4.93.0.4)
        (envelope-from <fntoth@gmail.com>)
        id 1kbOPe-0099Ob-7C; Sat, 07 Nov 2020 14:37:50 +0100
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
To:     Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jack Pham <jackp@codeaurora.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com> <874kmpf583.fsf@kernel.org>
 <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
 <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com>
 <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
 <2b6586e6-528c-86e8-9d92-0061bc44866d@gmail.com>
 <aad327a8-95bc-40ec-abf7-ad216a02fad0@synopsys.com>
 <2cc783ac-6b71-190b-49fc-9e2bceeacd4b@gmail.com>
 <920590dc-5430-7f8b-b2e1-1a4c37f4dfbe@synopsys.com>
 <CAHp75Vfs9AoOYSVGTpw30h11ptPOSPNf1AsWBKdiVrDL=9X3PQ@mail.gmail.com>
 <0089306e-e2ca-9a53-6ffb-202d028050ce@gmail.com>
 <CAHp75Vc0P746FhhohJ=wRccsQL4ewn+AECMw3yTD6cuGxHCG9Q@mail.gmail.com>
 <30ab00e4-53ae-fd9e-1689-c94078a31625@gmail.com> <871rhin1yt.fsf@kernel.org>
 <ec15a515-6dbc-1224-a457-d5ac4a4db280@gmail.com> <87eel7q9bk.fsf@kernel.org>
 <326aa23e-fabd-f3d6-4778-d036858413a2@gmail.com> <87blgar2ow.fsf@kernel.org>
 <e21a5a77-9017-4cbe-a228-85357d660da5@gmail.com> <87d00py4sj.fsf@kernel.org>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <cdb37a4c-2815-0068-1707-2e9163d1a93c@gmail.com>
Date:   Sat, 7 Nov 2020 14:37:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <87d00py4sj.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

Op 07-11-2020 om 09:01 schreef Felipe Balbi:
> Hi,
>
> Ferry Toth <fntoth@gmail.com> writes:
>
>> Hi
>>
>> Op 06-11-2020 om 15:15 schreef Felipe Balbi:
>>> Hi,
>>>
>>> Ferry Toth <fntoth@gmail.com> writes:
>>>>>>> Ferry Toth <fntoth@gmail.com> writes:
>>>>>>>> Op 27-10-2020 om 22:16 schreef Andy Shevchenko:
>>>>>>>>> On Tue, Oct 27, 2020 at 10:13 PM Ferry Toth <fntoth@gmail.com> wrote:
>>>>>>>>>> Op 22-10-2020 om 15:43 schreef Andy Shevchenko:
>>>>>>>>>>> On Thu, Oct 22, 2020 at 4:21 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>>>>>>>>>>>> Ferry Toth wrote:
>>>>>>>>> ...
>>>>>>>>>
>>>>>>>>>>>> There are some fixes to dwc3 in kernel mainline. Is it possible to test
>>>>>>>>>>>> this against linux-next?
>>>>>>>>>>> I think the best is to wait for v5.10-rc1 and retest.
>>>>>>>>> Can you give a try of v5.10-rc1?
>>>>>>>> Yes, I just tried:
>>>>>>>>
>>>>>>>> I booted in host mode, then flip the switch. Gadget come up, go down
>>>>>>>> once, then come up again and stay up.
>>>>>>> please collect trace events. It's important to figure out why it's going
>>>>>>> down, even if only once. Make sure to collect trace *and* dmesg so we
>>>>>>> can correlate trace with the reenumeration that should show up in dmesg.
>>>>>>>
>>>>>>> thanks
>>>>>> Sorry, I had to replace mobo. Now back on this.
>>>>>>
>>>>>> As is, on Edison I can record with something like "perf record -e
>>>>>> 'dwc3:dwc3_gadget*' -e 'gadget:*' -g -a".
>>>>>> Then get the trace buffer with "perf script > gadget.txt". Then at each
>>>>>> trace point we get a stack trace like:
>>>>>>
>>>>>> file-storage   831 [001]  4445.240038: dwc3:dwc3_gadget_ep_cmd: [FAILED
>>>>>> TO PARSE] name=ep4in cmd=524295 param0=0 param1=0 param2=0 cmd_status=0
>>>>>>         ffffffff9a35b7e7 __traceiter_dwc3_gadget_ep_cmd+0x37
>>>>>> ([kernel.kallsyms])
>>>>>>         ffffffff9a35b7e7 __traceiter_dwc3_gadget_ep_cmd+0x37
>>>>>> ([kernel.kallsyms])
>>>>>>         ffffffff9a35fa40 dwc3_send_gadget_ep_cmd+0x320 ([kernel.kallsyms])
>>>>>>         ffffffff9a3606d0 __dwc3_gadget_kick_transfer+0x200 ([kernel.kallsyms])
>>>>>>         ffffffff9a361114 dwc3_gadget_ep_queue+0xe4 ([kernel.kallsyms])
>>>>>>         ffffffff9a3afc3a usb_ep_queue+0x2a ([kernel.kallsyms])
>>>>>>         ffffffffc047c301 start_transfer.isra.0+0x21 ([kernel.kallsyms])
>>>>>>         ffffffffc047c88a start_in_transfer.isra.0+0x3a ([kernel.kallsyms])
>>>>>>         ffffffffc047c93d send_status+0x8d ([kernel.kallsyms])
>>>>>>         ffffffffc047dd05 fsg_main_thread+0x3c5 ([kernel.kallsyms])
>>>>>>         ffffffff99c853b9 kthread+0xf9 ([kernel.kallsyms])
>>>>>>         ffffffff99c01a32 ret_from_fork+0x22 ([kernel.kallsyms])
>>>>>>
>>>>>> "perf list" shows the tracepoint events, the same as under
>>>>>> /sys/kernel/debug/tracing/events/
>>>>>>
>>>>>> Question is which points to trace (above command fills buffer to 35MB in
>>>>>> 10sec). Do you have suggestions?
>>>>> don't enable any gadget event. Only dwc3 events. Also, enable *all* dwc3
>>>>> events. Usually, I avoid perf when doing this and just go straight to
>>>>> /sys/kernel/trace/.
>>>> Ok, I can do that. But I'm not sure how I turn on tracing and capture
>>>> the results.
>>> Got you covered ;-)
>>>
>>> https://www.kernel.org/doc/html/latest/driver-api/usb/dwc3.html#reporting-bugs
>>>
>> That's exactly the fix I needed :-)
>>
>> Ok, here's what I did:
>>
>> - put the edison switch in gadget mode, with the cable unplugged
>>
>> - booted edison into 5.10.0-rc2-edison-acpi-standard
>>
>> - opened terminal via wifi
>>
>> - prepared tracing per the link above link
>>
>> - in another terminal via wifi journalctl -b 0 -f
>>
>> - plugged the cable and recorded usb connecting. Followed by
>> disconnecting/connecting 2x in the following minute
>>
>> - copied the trace (20MB) and journal tail, 7z attached.
> Oddily, there's nothing indicating a fault. Here are all three
> resets. First one:
>
>> irq/15-dwc3-494     [001] d...   430.442333: dwc3_event: event (00000101): Reset [U0]
>> irq/15-dwc3-494     [001] d...   430.496919: dwc3_event: event (00000201): Connection Done [U0]
>> irq/15-dwc3-494     [001] d...   430.496941: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
>> irq/15-dwc3-494     [001] d...   430.496946: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
>> irq/15-dwc3-494     [001] d...   430.496955: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
>> irq/15-dwc3-494     [001] d...   430.496959: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
>> irq/15-dwc3-494     [001] d...   430.570050: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>> irq/15-dwc3-494     [001] d...   430.570054: dwc3_ctrl_req: Get Device Descriptor(Index = 0, Length = 64)
>> irq/15-dwc3-494     [001] d...   430.570093: dwc3_prepare_trb: ep0in: trb 00000000fd713550 (E0:D0) buf 0000000007c1a000 size 18 ctrl 00000c53 (HLcs:SC:data)
>> irq/15-dwc3-494     [001] d...   430.570107: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 0726e000 00000000 --> status: Successful
>> irq/15-dwc3-494     [001] d...   430.570115: dwc3_event: event (000010c2): ep0in: Transfer Not Ready [0] (Not Active) [Data Phase]
>> irq/15-dwc3-494     [001] d...   430.570133: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>> irq/15-dwc3-494     [001] d...   430.570135: dwc3_complete_trb: ep0out: trb 00000000fd713550 (E0:D0) buf 0000000007c1a000 size 0 ctrl 00000c52 (hLcs:SC:data)
>> irq/15-dwc3-494     [001] d...   430.570142: dwc3_gadget_giveback: ep0out: req 00000000cd8dc122 length 18/18 ZsI ==> 0
>> irq/15-dwc3-494     [001] d...   430.570145: dwc3_event: event (000020c0): ep0out: Transfer Not Ready [0] (Not Active) [Status Phase]
>> irq/15-dwc3-494     [001] d...   430.570146: dwc3_prepare_trb: ep0out: trb 00000000fd713550 (E0:D0) buf 000000000726e000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>> irq/15-dwc3-494     [001] d...   430.570156: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 0726e000 00000000 --> status: Successful
>> irq/15-dwc3-494     [001] d...   430.570266: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>> irq/15-dwc3-494     [001] d...   430.570270: dwc3_complete_trb: ep0out: trb 00000000fd713550 (E0:D0) buf 000000000726e000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>> irq/15-dwc3-494     [001] d...   430.570273: dwc3_prepare_trb: ep0out: trb 00000000fd713550 (E0:D0) buf 000000000726e000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>> irq/15-dwc3-494     [001] d...   430.570283: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 0726e000 00000000 --> status: Successful
>> irq/15-dwc3-494     [001] d...   430.574090: dwc3_event: event (00000101): Reset [U0]
> Second one:
>
>>   irq/15-dwc3-494     [001] d...   462.594296: dwc3_event: event (00000101): Reset [U0]
>>   irq/15-dwc3-494     [001] d...   462.594307: dwc3_gadget_ep_disable: ep1out: mps 512/2389 streams 16 burst 0 ring 0/0 flags E:swBp:>
>>   irq/15-dwc3-494     [001] d...   462.594320: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20c08] params 00000000 00000000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   462.594327: dwc3_gadget_ep_disable: ep2in: mps 512/1034 streams 16 burst 0 ring 0/0 flags E:swBp:<
>>   irq/15-dwc3-494     [001] d...   462.594336: dwc3_gadget_ep_cmd: ep2in: cmd 'End Transfer' [40c08] params 00000000 00000000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   462.594367: dwc3_gadget_ep_disable: ep3in: mps 512/1034 streams 16 burst 0 ring 17/17 flags E:swBp:<
>>   irq/15-dwc3-494     [001] d...   462.594376: dwc3_gadget_ep_cmd: ep3in: cmd 'End Transfer' [60c08] params 00000000 00000000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   462.594387: dwc3_free_request: ep3in: req 00000000899d2838 length 76/76 ZsI ==> 0
>>   irq/15-dwc3-494     [001] d...   462.594392: dwc3_free_request: ep3in: req 000000007c941936 length 96/96 ZsI ==> 0
>>   irq/15-dwc3-494     [001] d...   462.594393: dwc3_free_request: ep3in: req 00000000d7578dd1 length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   462.594395: dwc3_free_request: ep3in: req 00000000d02b987b length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   462.594397: dwc3_free_request: ep3in: req 000000008a4586b3 length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   462.594399: dwc3_free_request: ep3in: req 000000001b05a881 length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   462.594400: dwc3_free_request: ep3in: req 00000000ede49e1b length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   462.594402: dwc3_free_request: ep3in: req 000000007710fa93 length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   462.594404: dwc3_free_request: ep3in: req 000000006d472cbc length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   462.594405: dwc3_free_request: ep3in: req 000000001a5e4f3e length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   462.594407: dwc3_gadget_ep_disable: ep2out: mps 512/2389 streams 16 burst 0 ring 53/43 flags E:swBp:>
>>   irq/15-dwc3-494     [001] d...   462.594416: dwc3_gadget_ep_cmd: ep2out: cmd 'End Transfer' [30c08] params 00000000 00000000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   462.594431: dwc3_gadget_giveback: ep2out: req 00000000b4c75191 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594446: dwc3_gadget_giveback: ep2out: req 0000000004911b96 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594452: dwc3_gadget_giveback: ep2out: req 00000000312948aa length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594457: dwc3_gadget_giveback: ep2out: req 00000000c3f1bc7f length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594461: dwc3_gadget_giveback: ep2out: req 00000000e9d45c98 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594466: dwc3_gadget_giveback: ep2out: req 0000000087c88a29 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594471: dwc3_gadget_giveback: ep2out: req 0000000076eac09c length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594477: dwc3_gadget_giveback: ep2out: req 00000000893b5b83 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594481: dwc3_gadget_giveback: ep2out: req 0000000032598a43 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594487: dwc3_gadget_giveback: ep2out: req 000000006f54ed94 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594492: dwc3_free_request: ep2out: req 000000006f54ed94 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594494: dwc3_free_request: ep2out: req 0000000032598a43 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594496: dwc3_free_request: ep2out: req 00000000893b5b83 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594497: dwc3_free_request: ep2out: req 0000000076eac09c length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594499: dwc3_free_request: ep2out: req 0000000087c88a29 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594500: dwc3_free_request: ep2out: req 00000000e9d45c98 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594502: dwc3_free_request: ep2out: req 00000000c3f1bc7f length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594503: dwc3_free_request: ep2out: req 00000000312948aa length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594505: dwc3_free_request: ep2out: req 0000000004911b96 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594506: dwc3_free_request: ep2out: req 00000000b4c75191 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   462.594541: dwc3_gadget_ep_cmd: ep3out: cmd 'End Transfer' [50c08] params 00000000 00000000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   462.594551: dwc3_gadget_giveback: ep3out: req 0000000021d51c6b length 0/512 zsI ==> -108
>> file-storage-493     [000] ....   462.594608: dwc3_free_request: ep4in: req 00000000807d5502 length 16/16 ZsI ==> 0
>> file-storage-493     [000] ....   462.594614: dwc3_free_request: ep3out: req 0000000021d51c6b length 0/512 zsI ==> -108
>> file-storage-493     [000] ....   462.594616: dwc3_free_request: ep4in: req 00000000e0ba52a1 length 0/13 zsI ==> -104
>> file-storage-493     [000] ....   462.594618: dwc3_free_request: ep3out: req 00000000c631ee54 length 31/512 zsI ==> 0
>> file-storage-493     [000] d...   462.594620: dwc3_gadget_ep_disable: ep4in: mps 512/346 streams 16 burst 0 ring 10/10 flags E:swbP:<
>> file-storage-493     [000] d...   462.594625: dwc3_gadget_ep_disable: ep3out: mps 512/2389 streams 16 burst 0 ring 7/6 flags E:swbp:>
>>   irq/15-dwc3-494     [001] d...   462.645482: dwc3_event: event (00000201): Connection Done [U0]
>>   irq/15-dwc3-494     [001] d...   462.645503: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   462.645509: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
>>   irq/15-dwc3-494     [001] d...   462.645520: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   462.645525: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
>>   irq/15-dwc3-494     [001] d...   462.722774: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>>   irq/15-dwc3-494     [001] d...   462.722778: dwc3_ctrl_req: Get Device Descriptor(Index = 0, Length = 64)
>>   irq/15-dwc3-494     [001] d...   462.722816: dwc3_prepare_trb: ep0in: trb 00000000fd713550 (E0:D0) buf 0000000007c1a000 size 18 ctrl 00000c53 (HLcs:SC:data)
>>   irq/15-dwc3-494     [001] d...   462.722830: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 0726e000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   462.722837: dwc3_event: event (000010c2): ep0in: Transfer Not Ready [0] (Not Active) [Data Phase]
>>   irq/15-dwc3-494     [001] d...   462.722881: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>>   irq/15-dwc3-494     [001] d...   462.722884: dwc3_complete_trb: ep0out: trb 00000000fd713550 (E0:D0) buf 0000000007c1a000 size 0 ctrl 00000c52 (hLcs:SC:data)
>>   irq/15-dwc3-494     [001] d...   462.722891: dwc3_gadget_giveback: ep0out: req 00000000cd8dc122 length 18/18 ZsI ==> 0
>>   irq/15-dwc3-494     [001] d...   462.722894: dwc3_event: event (000020c0): ep0out: Transfer Not Ready [0] (Not Active) [Status Phase]
>>   irq/15-dwc3-494     [001] d...   462.722895: dwc3_prepare_trb: ep0out: trb 00000000fd713550 (E0:D0) buf 000000000726e000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>>   irq/15-dwc3-494     [001] d...   462.722905: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 0726e000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   462.722949: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>>   irq/15-dwc3-494     [001] d...   462.722951: dwc3_complete_trb: ep0out: trb 00000000fd713550 (E0:D0) buf 000000000726e000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>>   irq/15-dwc3-494     [001] d...   462.722953: dwc3_prepare_trb: ep0out: trb 00000000fd713550 (E0:D0) buf 000000000726e000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>>   irq/15-dwc3-494     [001] d...   462.722963: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 0726e000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   462.726933: dwc3_event: event (00000101): Reset [U0]
> And Third:
>
>>   irq/15-dwc3-494     [001] d...   468.061065: dwc3_event: event (00000101): Reset [U0]
>>   irq/15-dwc3-494     [001] d...   468.061078: dwc3_gadget_ep_disable: ep1out: mps 512/2389 streams 16 burst 0 ring 0/0 flags E:swBp:>
>>   irq/15-dwc3-494     [001] d...   468.061091: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20c08] params 00000000 00000000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   468.061098: dwc3_gadget_ep_disable: ep2in: mps 512/1034 streams 16 burst 0 ring 0/0 flags E:swBp:<
>>   irq/15-dwc3-494     [001] d...   468.061107: dwc3_gadget_ep_cmd: ep2in: cmd 'End Transfer' [40c08] params 00000000 00000000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   468.061137: dwc3_gadget_ep_disable: ep3in: mps 512/1034 streams 16 burst 0 ring 2/0 flags E:swBp:<
>>   irq/15-dwc3-494     [001] d...   468.061149: dwc3_gadget_ep_cmd: ep3in: cmd 'End Transfer' [60c08] params 00000000 00000000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   468.061160: dwc3_gadget_giveback: ep3in: req 000000008a4586b3 length 0/116 ZsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061173: dwc3_gadget_giveback: ep3in: req 000000001b05a881 length 0/116 ZsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061179: dwc3_free_request: ep3in: req 000000001b05a881 length 0/116 ZsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061183: dwc3_free_request: ep3in: req 000000008a4586b3 length 0/116 ZsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061185: dwc3_free_request: ep3in: req 00000000ede49e1b length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   468.061187: dwc3_free_request: ep3in: req 000000007710fa93 length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   468.061189: dwc3_free_request: ep3in: req 000000006d472cbc length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   468.061191: dwc3_free_request: ep3in: req 000000001a5e4f3e length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   468.061193: dwc3_free_request: ep3in: req 0000000076eac09c length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   468.061195: dwc3_free_request: ep3in: req 00000000763f5c3c length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   468.061197: dwc3_free_request: ep3in: req 00000000b0300b83 length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   468.061199: dwc3_free_request: ep3in: req 000000007c621acb length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   468.061200: dwc3_gadget_ep_disable: ep2out: mps 512/2389 streams 16 burst 0 ring 10/0 flags E:swBp:>
>>   irq/15-dwc3-494     [001] d...   468.061210: dwc3_gadget_ep_cmd: ep2out: cmd 'End Transfer' [30c08] params 00000000 00000000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   468.061221: dwc3_gadget_giveback: ep2out: req 00000000e9d45c98 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061229: dwc3_gadget_giveback: ep2out: req 00000000c3f1bc7f length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061234: dwc3_gadget_giveback: ep2out: req 00000000312948aa length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061238: dwc3_gadget_giveback: ep2out: req 0000000004911b96 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061244: dwc3_gadget_giveback: ep2out: req 00000000b4c75191 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061249: dwc3_gadget_giveback: ep2out: req 00000000570c1ba8 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061254: dwc3_gadget_giveback: ep2out: req 00000000899d2838 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061258: dwc3_gadget_giveback: ep2out: req 000000007c941936 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061263: dwc3_gadget_giveback: ep2out: req 00000000d7578dd1 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061269: dwc3_gadget_giveback: ep2out: req 00000000d02b987b length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061274: dwc3_free_request: ep2out: req 00000000d02b987b length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061276: dwc3_free_request: ep2out: req 00000000d7578dd1 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061277: dwc3_free_request: ep2out: req 000000007c941936 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061279: dwc3_free_request: ep2out: req 00000000899d2838 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061280: dwc3_free_request: ep2out: req 00000000570c1ba8 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061282: dwc3_free_request: ep2out: req 00000000b4c75191 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061284: dwc3_free_request: ep2out: req 0000000004911b96 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061285: dwc3_free_request: ep2out: req 00000000312948aa length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061286: dwc3_free_request: ep2out: req 00000000c3f1bc7f length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061288: dwc3_free_request: ep2out: req 00000000e9d45c98 length 0/1536 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061323: dwc3_gadget_ep_cmd: ep3out: cmd 'End Transfer' [50c08] params 00000000 00000000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   468.061333: dwc3_gadget_giveback: ep3out: req 00000000e0ba52a1 length 0/512 zsI ==> -108
>>   irq/15-dwc3-494     [001] d...   468.061347: dwc3_gadget_ep_cmd: ep4in: cmd 'End Transfer' [80c08] params 00000000 00000000 00000000 --> status: Successful
>> file-storage-493     [000] ....   468.061451: dwc3_free_request: ep4in: req 00000000c631ee54 length 0/0 zsI ==> 0
>> file-storage-493     [000] ....   468.061456: dwc3_free_request: ep3out: req 00000000e0ba52a1 length 0/512 zsI ==> -108
>> file-storage-493     [000] ....   468.061458: dwc3_free_request: ep4in: req 0000000021d51c6b length 0/0 zsI ==> 0
>> file-storage-493     [000] ....   468.061460: dwc3_free_request: ep3out: req 00000000807d5502 length 0/0 zsI ==> 0
>> file-storage-493     [000] d...   468.061463: dwc3_gadget_ep_disable: ep4in: mps 512/346 streams 16 burst 0 ring 0/0 flags E:swbp:<
>> file-storage-493     [000] d...   468.061501: dwc3_gadget_ep_disable: ep3out: mps 512/2389 streams 16 burst 0 ring 1/0 flags E:swbp:>
>>   irq/15-dwc3-494     [001] d...   468.115718: dwc3_event: event (00000201): Connection Done [U0]
>>   irq/15-dwc3-494     [001] d...   468.115742: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   468.115748: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:>
>>   irq/15-dwc3-494     [001] d...   468.115758: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   468.115761: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:<
>>   irq/15-dwc3-494     [001] d...   468.185582: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>>   irq/15-dwc3-494     [001] d...   468.185586: dwc3_complete_trb: ep0out: trb 00000000fd713550 (E0:D0) buf 000000000726e000 size 0 ctrl 00000c32 (hLcs:SC:status2)
>>   irq/15-dwc3-494     [001] d...   468.185590: dwc3_gadget_giveback: ep0out: req 00000000cd8dc122 length 0/0 zsI ==> 0
>>   irq/15-dwc3-494     [001] d...   468.185596: dwc3_prepare_trb: ep0out: trb 00000000fd713550 (E0:D0) buf 000000000726e000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>>   irq/15-dwc3-494     [001] d...   468.185608: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 0726e000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   468.185626: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>>   irq/15-dwc3-494     [001] d...   468.185628: dwc3_ctrl_req: Get Device Descriptor(Index = 0, Length = 64)
>>   irq/15-dwc3-494     [001] d...   468.185663: dwc3_prepare_trb: ep0in: trb 00000000fd713550 (E0:D0) buf 0000000007c1a000 size 18 ctrl 00000c53 (HLcs:SC:data)
>>   irq/15-dwc3-494     [001] d...   468.185674: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 0726e000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   468.185680: dwc3_event: event (000010c2): ep0in: Transfer Not Ready [0] (Not Active) [Data Phase]
>>   irq/15-dwc3-494     [001] d...   468.185699: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>>   irq/15-dwc3-494     [001] d...   468.185701: dwc3_complete_trb: ep0out: trb 00000000fd713550 (E0:D0) buf 0000000007c1a000 size 0 ctrl 00000c52 (hLcs:SC:data)
>>   irq/15-dwc3-494     [001] d...   468.185707: dwc3_gadget_giveback: ep0out: req 00000000cd8dc122 length 18/18 ZsI ==> 0
>>   irq/15-dwc3-494     [001] d...   468.185721: dwc3_event: event (000020c0): ep0out: Transfer Not Ready [0] (Not Active) [Status Phase]
>>   irq/15-dwc3-494     [001] d...   468.185722: dwc3_prepare_trb: ep0out: trb 00000000fd713550 (E0:D0) buf 000000000726e000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>>   irq/15-dwc3-494     [001] d...   468.185732: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 0726e000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   468.185832: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>>   irq/15-dwc3-494     [001] d...   468.185835: dwc3_complete_trb: ep0out: trb 00000000fd713550 (E0:D0) buf 000000000726e000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>>   irq/15-dwc3-494     [001] d...   468.185837: dwc3_prepare_trb: ep0out: trb 00000000fd713550 (E0:D0) buf 000000000726e000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>>   irq/15-dwc3-494     [001] d...   468.185847: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 0726e000 00000000 --> status: Successful
>>   irq/15-dwc3-494     [001] d...   468.189715: dwc3_event: event (00000101): Reset [U0]
> You can see that in all cases, every transfer is successful. The -108
> givebacks is because we're shutting down the endpoint and those
> transfers were cancelled. But everything is perfectly fine. Can you
> reproduce this behavior in any computer you connect Edison to?

Coincidentally I just replaced my mobo (so new processor/mem/mobo/bios).

There was no difference in behavior.

> I don't suppose you have a USB sniffer, do you?
No, I don't have one of those.
> Andy, could you see if you can reproduce the same behavior with a
> sniffer? It really seems like this either caused by the host side or
> something outside dwc3. Perhaps the PHY is going bonkers?
>
> cheers

But got other inspiration: like you say dwc3 is behaving normally, so 
problem might be elsewhere right?

Now, to make gadget working I needed to apply the experiment from Jack Pham:

https://github.com/edison-fw/linux/commit/da90cb63fc8f0ce18805f262d4d6b5b4d8c11d5c

But now Jack has already sent in "[PATCH v3] usb: gadget: audio: Free 
requests only after callback"

So, removing the experiment and adding PATCH 3, this issue appears to go 
away.

And indeed this fixes a problem in u_audio.c, not in dwc3.

Thanks all, I'm looking forward to the patch to land in 5.10-rc3/4.

