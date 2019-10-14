Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F815D62AF
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2019 14:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730793AbfJNMi0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Oct 2019 08:38:26 -0400
Received: from mga07.intel.com ([134.134.136.100]:49527 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730719AbfJNMi0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Oct 2019 08:38:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Oct 2019 05:38:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,295,1566889200"; 
   d="scan'208";a="395177144"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga005.fm.intel.com with ESMTP; 14 Oct 2019 05:38:16 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Roger Quadros <rogerq@ti.com>, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Bin Liu \[EP\]" <b-liu@ti.com>
Cc:     "Nori\, Sekhar" <nsekhar@ti.com>
Subject: Re: how to test g_webcam
In-Reply-To: <a23554e6-4dd7-b252-eda3-4d986d4a80be@ti.com>
References: <7c65d743-f6cd-846b-381a-07808c6f4c5a@ti.com> <8736fzv3c5.fsf@gmail.com> <a23554e6-4dd7-b252-eda3-4d986d4a80be@ti.com>
Date:   Mon, 14 Oct 2019 15:38:16 +0300
Message-ID: <8736fvh58n.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Roger Quadros <rogerq@ti.com> writes:
>>> I'm having a hard time to figure out how to get g_webcam working with
>>> the tip of http://git.ideasonboard.org/uvc-gadget.git
>>>
>>> Platform I'm using is dra7-evm with dwc3 controller.
>> 
>> which arguments are you passing to g_webcam?
>
> I've tried a couple of things
>
> modprobe g_webcam streaming_maxpacket=1024
>
> modprobe g_webcam streaming_maxpacket=3072 streaming_maxburst=9
>
> but nothing worked.
>
>
> I managed to get things working on am335x-bone (musb) using the
> uvc-gadget.sh script provided at http://git.ideasonboard.org/uvc-gadget.git
> which uses configfs.
>
> It seems to use "streaming_maxpacket=1024".
>
>> setting commit control, length = 26
>> Setting format to 0x56595559 1280x720
>> === Setting frame rate to 15 fps
>> Starting video stream.
>
>
> am335x-bone does work with g_webcam (streaming_maxpacket=1024) however, notice fps below
>
>> setting commit control, length = 26
>> Setting format to 0x56595559 1280x720
>> === Setting frame rate to 0 fps
>> Starting video stream.
>
> using uvc-gadget.sh with dwc3 fails like so
>
>> root@lta0400828a:~# ./uvc-gadget.sh start
>> Detecting platform:
>>   board : TI DRA742
>>   udc   : 48890000.usb
>> Creating the USB gadget
>> Creating gadget directory g1
>> OK
>> Setting Vendor and Product ID's
>> OK
>> Setting English strings
>> OK
>> Creating Config
>> Creating functions...
>>         Creating UVC gadget functionality : uvc.0
>> OK
>> [   20.165439] configfs-gadget gadget: uvc: uvc_function_bind()
>> Binding USB Device Controller
>> [   20.171431] configfs-gadget 48890000.usb: failed to start g1: -19

fair enough. Let's get dwc3 tracepoints to try and figure this out. -19
is ENODEV, btw. That's weird.

> dwc3 trace is below.

oh, you already did :-)

> # tracer: nop
> #
> # entries-in-buffer/entries-written: 830/830   #P:2
> #
> #                              _-----=> irqs-off
> #                             / _----=> need-resched
> #                            | / _---=> hardirq/softirq
> #                            || / _--=> preempt-depth
> #                            ||| /     delay
> #           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
> #              | |       |   ||||       |         |
>     uvc-gadget.sh-241   [000] ....    98.963663: dwc3_alloc_request: ep0out: req b52ce5b9 length 0/0 zsI ==> 0
>     uvc-gadget.sh-241   [000] ....    98.969442: dwc3_alloc_request: ep0out: req 2e97646a length 0/0 zsI ==> 0
>     uvc-gadget.sh-241   [000] dn..    98.970354: dwc3_gadget_ep_cmd: ep0out: cmd 'Start New Configuration' [409] params 00000000 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970359: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970362: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970366: dwc3_gadget_ep_cmd: ep1out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970369: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970372: dwc3_gadget_ep_cmd: ep2out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970375: dwc3_gadget_ep_cmd: ep2in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970379: dwc3_gadget_ep_cmd: ep3out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970382: dwc3_gadget_ep_cmd: ep3in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970385: dwc3_gadget_ep_cmd: ep4out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970388: dwc3_gadget_ep_cmd: ep4in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970391: dwc3_gadget_ep_cmd: ep5out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970394: dwc3_gadget_ep_cmd: ep5in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970398: dwc3_gadget_ep_cmd: ep6out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970401: dwc3_gadget_ep_cmd: ep6in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970404: dwc3_gadget_ep_cmd: ep7out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970407: dwc3_gadget_ep_cmd: ep7in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970410: dwc3_gadget_ep_cmd: ep8out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970413: dwc3_gadget_ep_cmd: ep8in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970416: dwc3_gadget_ep_cmd: ep9out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970419: dwc3_gadget_ep_cmd: ep9in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970423: dwc3_gadget_ep_cmd: ep10out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970426: dwc3_gadget_ep_cmd: ep10in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970429: dwc3_gadget_ep_cmd: ep11out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970432: dwc3_gadget_ep_cmd: ep11in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970436: dwc3_gadget_ep_cmd: ep12out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970439: dwc3_gadget_ep_cmd: ep12in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970442: dwc3_gadget_ep_cmd: ep13out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970445: dwc3_gadget_ep_cmd: ep13in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970448: dwc3_gadget_ep_cmd: ep14out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970451: dwc3_gadget_ep_cmd: ep14in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970454: dwc3_gadget_ep_cmd: ep15out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970458: dwc3_gadget_ep_cmd: ep15in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970463: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 00001000 00000500 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970466: dwc3_gadget_ep_enable: ep0out: mps 512/512 streams 0 burst 1 ring 0/0 flags E:swbp:>
>     uvc-gadget.sh-241   [000] dn..    98.970471: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 00001000 02000500 00000000 --> status: Successful
>     uvc-gadget.sh-241   [000] dn..    98.970473: dwc3_gadget_ep_enable: ep0in: mps 512/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
>     uvc-gadget.sh-241   [000] dn..    98.970476: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>     uvc-gadget.sh-241   [000] dn..    98.970482: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...    98.979475: dwc3_event: event (00150301): Link Change [RX.Detect]
>      irq/170-dwc3-270   [000] d...   173.168413: dwc3_event: event (00150301): Link Change [RX.Detect]
>      irq/170-dwc3-270   [000] d...   173.267160: dwc3_event: event (00040301): Link Change [SS.Disabled]
>      irq/170-dwc3-270   [000] d...   173.267162: dwc3_event: event (00000301): Link Change [U0]
>      irq/170-dwc3-270   [000] d...   173.270152: dwc3_event: event (00050301): Link Change [RX.Detect]
>      irq/170-dwc3-270   [000] d...   173.273148: dwc3_event: event (00030301): Link Change [U3]

Hmm, Link Change is disabled by default upstream, unless you're running
on anything older than 2.50a. I don't remember the version you're using,
though :-p

>      irq/170-dwc3-270   [000] d...   173.408918: dwc3_event: event (00000101): Reset [U0]
>      irq/170-dwc3-270   [000] d...   173.463787: dwc3_event: event (00000201): Connection Done [U0]
>      irq/170-dwc3-270   [000] d...   173.463796: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.463799: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
>      irq/170-dwc3-270   [000] d...   173.463803: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.463804: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<

hmm, High speed? Can we get traces for superspeed too?

>      irq/170-dwc3-270   [000] d...   173.463806: dwc3_event: event (00000301): Link Change [U0]
>      irq/170-dwc3-270   [000] d...   173.536912: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.536917: dwc3_ctrl_req: Get Device Descriptor(Index = 0, Length = 64)
>      irq/170-dwc3-270   [000] d...   173.536926: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 18 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.536932: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.536937: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.536960: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.536962: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.536967: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 18/18 ZsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.536975: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.536976: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.536982: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.537035: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.537037: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.537041: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.537046: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.540041: dwc3_event: event (00050301): Link Change [RX.Detect]
>      irq/170-dwc3-270   [000] d...   173.540537: dwc3_event: event (00000101): Reset [U0]

Another Reset. This is somewhat unexpected here; then again, we didn't
even get an address yet.

>      irq/170-dwc3-270   [000] d...   173.592089: dwc3_event: event (00000201): Connection Done [U0]
>      irq/170-dwc3-270   [000] d...   173.592095: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.592097: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
>      irq/170-dwc3-270   [000] d...   173.592100: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.592102: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
>      irq/170-dwc3-270   [000] d...   173.592103: dwc3_event: event (00000301): Link Change [U0]
>      irq/170-dwc3-270   [000] d...   173.664897: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.664899: dwc3_ctrl_req: Set Address(Addr = 16)
>      irq/170-dwc3-270   [000] d...   173.664904: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.664905: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
>      irq/170-dwc3-270   [000] d...   173.664911: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.664947: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.664948: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
>      irq/170-dwc3-270   [000] d...   173.664952: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.664958: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.684864: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.684866: dwc3_ctrl_req: Get Device Descriptor(Index = 0, Length = 18)
>      irq/170-dwc3-270   [000] d...   173.684872: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 18 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.684878: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.684880: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.684904: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.684906: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.684910: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 18/18 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.684911: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.684912: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.684918: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.684948: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.684949: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.684953: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.684958: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.685093: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.685096: dwc3_ctrl_req: Get BOS Descriptor(Index = 0, Length = 5)
>      irq/170-dwc3-270   [000] d...   173.685102: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 5 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.685108: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.685116: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.685144: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.685146: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.685150: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 5/5 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.685151: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.685152: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.685158: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.685216: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.685217: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.685221: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.685226: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.685354: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.685357: dwc3_ctrl_req: Get BOS Descriptor(Index = 0, Length = 12)
>      irq/170-dwc3-270   [000] d...   173.685362: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 12 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.685367: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.685375: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.685402: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.685403: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.685407: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 12/12 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.685414: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.685415: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.685420: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.685473: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.685475: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.685478: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.685484: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.685616: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.685619: dwc3_ctrl_req: Get Configuration Descriptor(Index = 0, Length = 9)
>      irq/170-dwc3-270   [000] d...   173.685628: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 9 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.685633: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.685641: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.685648: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.685649: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.685653: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 9/9 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.685659: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.685660: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.685666: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.685696: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.685698: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.685701: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.685707: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.685775: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.685778: dwc3_ctrl_req: Get Configuration Descriptor(Index = 0, Length = 325)
>      irq/170-dwc3-270   [000] d...   173.685785: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 325 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.685791: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.685798: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.685839: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.685840: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.685844: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 325/325 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.685846: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.685847: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.685852: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.685908: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.685910: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.685913: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.685919: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.686062: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.686064: dwc3_ctrl_req: Get String Descriptor(Index = 0, Length = 255)
>      irq/170-dwc3-270   [000] d...   173.686071: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 4 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.686076: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.686085: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.686110: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.686112: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.686116: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 4/4 ZsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.686123: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.686124: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.686129: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.686175: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.686177: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.686181: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.686186: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.686284: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.686287: dwc3_ctrl_req: Get String Descriptor(Index = 2, Length = 255)
>      irq/170-dwc3-270   [000] d...   173.686293: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 22 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.686298: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.686307: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.686308: dwc3_event: event (000090c2): ep0in:  [Data Phase]

huh? Hopefully this is a problem with the decoders only

>      irq/170-dwc3-270   [000] d...   173.686335: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.686337: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.686341: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 22/22 ZsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.686348: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.686349: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.686354: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.686417: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.686419: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.686422: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.686428: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.686505: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.686506: dwc3_ctrl_req: Get String Descriptor(Index = 1, Length = 255)
>      irq/170-dwc3-270   [000] d...   173.686512: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 24 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.686518: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.686526: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.686551: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.686553: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.686557: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 24/24 ZsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.686563: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.686565: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.686570: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.686596: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.686597: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.686601: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.686606: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.686649: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.686650: dwc3_ctrl_req: Get String Descriptor(Index = 3, Length = 255)
>      irq/170-dwc3-270   [000] d...   173.686656: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 22 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.686661: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.686669: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.686686: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.686687: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.686691: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 22/22 ZsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.686698: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.686699: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.686704: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.686733: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.686734: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.686738: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.686743: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.687701: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.687702: dwc3_ctrl_req: Set Configuration(Config = 1)
>      irq/170-dwc3-270   [000] d...   173.705124: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020086 06070200 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.705133: dwc3_gadget_ep_cmd: ep1in: cmd 'Start Transfer' [406] params 00000000 ae85e000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.705135: dwc3_gadget_ep_enable: ep1in: mps 16/1024 streams 15 burst 0 ring 0/0 flags E:swBp:<
>      irq/170-dwc3-270   [000] d...   173.711434: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.711436: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
>      irq/170-dwc3-270   [000] d...   173.711441: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.711485: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.711487: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
>      irq/170-dwc3-270   [000] d...   173.711491: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 0/0 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.711493: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.711499: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.711629: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.711631: dwc3_ctrl_req: Get String Descriptor(Index = 4, Length = 255)
>      irq/170-dwc3-270   [000] d...   173.711639: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 2 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.711645: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.711655: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.711662: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.711663: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.711668: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 2/2 ZsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.711675: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.711676: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.711682: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.711743: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.711745: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.711749: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.711754: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.711897: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.711898: dwc3_ctrl_req: Get String Descriptor(Index = 5, Length = 255)
>      irq/170-dwc3-270   [000] d...   173.711905: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 22 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.711911: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.711916: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.711948: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.711950: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.711954: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 22/22 ZsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.711956: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.711957: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.711962: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.712021: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.712022: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.712026: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.712031: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.712258: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.712260: dwc3_ctrl_req: Get String Descriptor(Index = 5, Length = 255)
>      irq/170-dwc3-270   [000] d...   173.712266: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 22 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.712271: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.712281: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.712308: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.712310: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.712315: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 22/22 ZsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.712324: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.712325: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.712331: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.712386: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.712388: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.712392: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.712397: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.712503: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.712505: dwc3_ctrl_req: a1 86 00 02 00 01 01 00

Class specific request...

>      irq/170-dwc3-270   [000] d...   173.712514: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.712583: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

... which got stalled. I wonder if this is expected or not.

>        uvc-gadget-275   [001] d...   173.712586: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.712592: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.712688: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.712690: dwc3_ctrl_req: a1 81 00 02 00 00 01 00

Another one...

>      irq/170-dwc3-270   [000] d...   173.712699: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.712744: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

... same result

>        uvc-gadget-275   [001] d...   173.712747: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.712752: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.712966: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.712968: dwc3_ctrl_req: a1 86 00 02 00 02 01 00
>      irq/170-dwc3-270   [000] d...   173.712976: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.713034: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

and again

>        uvc-gadget-275   [001] d...   173.713037: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.713043: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.713126: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.713128: dwc3_ctrl_req: a1 81 00 02 00 00 01 00
>      irq/170-dwc3-270   [000] d...   173.713142: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.713195: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

and again

>        uvc-gadget-275   [001] d...   173.713197: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.713203: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.713295: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.713297: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 0)
>      irq/170-dwc3-270   [000] d...   173.724426: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.724427: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
>      irq/170-dwc3-270   [000] d...   173.724432: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.724462: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.724464: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
>      irq/170-dwc3-270   [000] d...   173.724467: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 0/0 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.724468: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.724473: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.724621: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.724623: dwc3_ctrl_req: a1 87 00 01 01 00 1a 00
>      irq/170-dwc3-270   [000] d...   173.724634: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.724665: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   173.724671: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.724688: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.724689: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.724692: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.724698: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.724698: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.724703: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.724732: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.724732: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.724735: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.724740: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.724846: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.724846: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)

some Unknown feature being cleared. I think we need to update our
decoders :-p

>      irq/170-dwc3-270   [000] d...   173.724858: dwc3_event: event (000010c0): ep0out:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.724879: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000455 (HlCs:Sc:data)
>        uvc-gadget-275   [001] d...   173.724882: dwc3_prepare_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   173.724887: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.724947: dwc3_event: event (00002040): ep0out: Transfer Complete (Sil) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.724948: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000454 (hlCs:Sc:data)
>      irq/170-dwc3-270   [000] d...   173.724952: dwc3_complete_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.724955: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.724963: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.724964: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.724969: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.724993: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.724994: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.724997: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.725002: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.725152: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.725153: dwc3_ctrl_req: a1 81 00 01 01 00 1a 00
>      irq/170-dwc3-270   [000] d...   173.725165: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.725185: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   173.725190: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.725213: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.725214: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.725217: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.725218: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.725219: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.725223: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.725241: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.725242: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.725245: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.725250: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.726538: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.726539: dwc3_ctrl_req: Get String Descriptor(Index = 6, Length = 255)
>      irq/170-dwc3-270   [000] d...   173.726544: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 32 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.726548: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.726551: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.726574: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   173.726575: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   173.726578: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 32/32 ZsI ==> 0
>      irq/170-dwc3-270   [000] d...   173.726583: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.726584: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.726589: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.726618: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   173.726619: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   173.726622: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   173.726627: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.761792: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.761793: dwc3_ctrl_req: a1 87 00 02 00 02 02 00
>      irq/170-dwc3-270   [000] d...   173.761801: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.761857: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

more stall

>        uvc-gadget-275   [001] d...   173.761860: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.761866: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.761942: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.761944: dwc3_ctrl_req: a1 81 00 02 00 00 01 00
>      irq/170-dwc3-270   [000] d...   173.761959: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.761994: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

and again

>        uvc-gadget-275   [001] d...   173.761997: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.762002: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.762082: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.762084: dwc3_ctrl_req: a1 87 00 02 00 02 02 00
>      irq/170-dwc3-270   [000] d...   173.762092: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.762131: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

again

>        uvc-gadget-275   [001] d...   173.762133: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.762138: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.762213: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.762216: dwc3_ctrl_req: a1 81 00 02 00 00 01 00
>      irq/170-dwc3-270   [000] d...   173.762230: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.762263: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

again

>        uvc-gadget-275   [001] d...   173.762266: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.762271: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.762359: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.762361: dwc3_ctrl_req: a1 87 00 02 00 02 02 00
>      irq/170-dwc3-270   [000] d...   173.762375: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.762407: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

again

>        uvc-gadget-275   [001] d...   173.762409: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.762415: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.762486: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.762487: dwc3_ctrl_req: a1 81 00 02 00 00 01 00
>      irq/170-dwc3-270   [000] d...   173.762503: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.762533: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

^

>        uvc-gadget-275   [001] d...   173.762536: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.762541: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.762628: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.762630: dwc3_ctrl_req: a1 87 00 02 00 02 02 00
>      irq/170-dwc3-270   [000] d...   173.762639: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.762676: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

^

>        uvc-gadget-275   [001] d...   173.762679: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.762684: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.762921: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.762922: dwc3_ctrl_req: a1 81 00 02 00 00 01 00
>      irq/170-dwc3-270   [000] d...   173.762937: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.762968: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

^

>        uvc-gadget-275   [001] d...   173.762971: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.762976: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.763060: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.763061: dwc3_ctrl_req: a1 87 00 02 00 02 02 00
>      irq/170-dwc3-270   [000] d...   173.763075: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.763106: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

^

>        uvc-gadget-275   [001] d...   173.763109: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.763114: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.763185: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.763187: dwc3_ctrl_req: a1 81 00 02 00 00 01 00
>      irq/170-dwc3-270   [000] d...   173.763201: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.763232: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

^

>        uvc-gadget-275   [001] d...   173.763234: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.763240: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.763314: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.763317: dwc3_ctrl_req: a1 87 00 02 00 02 02 00
>      irq/170-dwc3-270   [000] d...   173.763330: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.763362: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

^

>        uvc-gadget-275   [001] d...   173.763364: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.763369: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.763446: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.763447: dwc3_ctrl_req: a1 81 00 02 00 00 01 00
>      irq/170-dwc3-270   [000] d...   173.763461: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.763492: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

^

>        uvc-gadget-275   [001] d...   173.763494: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.763500: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.763587: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.763588: dwc3_ctrl_req: a1 87 00 02 00 02 02 00
>      irq/170-dwc3-270   [000] d...   173.763604: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.763634: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

^

>        uvc-gadget-275   [001] d...   173.763636: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.763641: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.763882: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.763883: dwc3_ctrl_req: a1 81 00 02 00 00 01 00
>      irq/170-dwc3-270   [000] d...   173.763897: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.763930: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

^

>        uvc-gadget-275   [001] d...   173.763932: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.763937: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.763997: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.763998: dwc3_ctrl_req: a1 87 00 02 00 02 02 00
>      irq/170-dwc3-270   [000] d...   173.764011: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.764043: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

^

>        uvc-gadget-275   [001] d...   173.764045: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.764050: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   173.764131: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   173.764132: dwc3_ctrl_req: a1 81 00 02 00 00 01 00
>      irq/170-dwc3-270   [000] d...   173.764146: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   173.764177: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

^

>        uvc-gadget-275   [001] d...   173.764179: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   173.764185: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   175.809799: dwc3_event: event (00050301): Link Change [RX.Detect]
>      irq/170-dwc3-270   [000] d...   175.812781: dwc3_event: event (00030301): Link Change [U3]
>      irq/170-dwc3-270   [000] d...   184.986914: dwc3_event: event (00000401): WakeUp [U0]

And here it seems like the host gave up trying to talk with this
device. Maybe some recovery trying to succeed here.

>      irq/170-dwc3-270   [000] d...   185.032947: dwc3_event: event (00000301): Link Change [U0]
>      irq/170-dwc3-270   [000] d...   185.101025: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.101027: dwc3_ctrl_req: Get Device Status(Length = 2)
>      irq/170-dwc3-270   [000] d...   185.101033: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab851400 size 2 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.101039: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.101041: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.101072: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.101074: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab851400 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.101079: dwc3_gadget_giveback: ep0out: req 8b15becf length 2/2 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.101086: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.101087: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.101093: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.101146: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.101148: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.101152: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.101157: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.101950: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.101952: dwc3_ctrl_req: a1 87 00 02 00 02 02 00
>      irq/170-dwc3-270   [000] d...   185.101961: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.102030: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

But again we get stalls

>        uvc-gadget-275   [001] d...   185.102034: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   185.102039: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.102174: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.102176: dwc3_ctrl_req: a1 81 00 02 00 00 01 00
>      irq/170-dwc3-270   [000] d...   185.102190: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.102229: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

^

>        uvc-gadget-275   [001] d...   185.102232: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   185.102237: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.102586: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.102589: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)

Clearing unknown interface feature

>      irq/170-dwc3-270   [000] d...   185.102603: dwc3_event: event (000010c0): ep0out:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.102640: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000455 (HlCs:Sc:data)
>        uvc-gadget-275   [001] d...   185.102644: dwc3_prepare_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.102649: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.102709: dwc3_event: event (00002040): ep0out: Transfer Complete (Sil) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.102711: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000454 (hlCs:Sc:data)
>      irq/170-dwc3-270   [000] d...   185.102715: dwc3_complete_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.102719: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.102730: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.102731: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.102737: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.102767: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.102768: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.102772: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.102777: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.102906: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.102909: dwc3_ctrl_req: a1 82 00 01 01 00 1a 00
>      irq/170-dwc3-270   [000] d...   185.102922: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.102956: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.102962: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.102998: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.102999: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.103004: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.103010: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.103012: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.103017: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.103074: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.103075: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.103079: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.103085: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.103179: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.103180: dwc3_ctrl_req: a1 83 00 01 01 00 1a 00
>      irq/170-dwc3-270   [000] d...   185.103195: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.103230: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.103236: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.103271: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.103273: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.103277: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.103284: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.103285: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.103290: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.103350: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.103351: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.103355: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.103360: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.103489: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.103490: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)

^

>      irq/170-dwc3-270   [000] d...   185.103504: dwc3_event: event (000010c0): ep0out:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.103538: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000455 (HlCs:Sc:data)
>        uvc-gadget-275   [001] d...   185.103541: dwc3_prepare_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.103547: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.103603: dwc3_event: event (00002040): ep0out: Transfer Complete (Sil) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.103605: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000454 (hlCs:Sc:data)
>      irq/170-dwc3-270   [000] d...   185.103609: dwc3_complete_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.103613: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.103623: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.103625: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.103630: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.103657: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.103659: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.103663: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.103668: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.103793: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.103795: dwc3_ctrl_req: a1 81 00 01 01 00 1a 00
>      irq/170-dwc3-270   [000] d...   185.103803: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.103844: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.103849: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.103887: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.103888: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.103893: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.103899: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.103901: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.103906: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.103960: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.103961: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.103965: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.103970: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.104073: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.104074: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)

^

>      irq/170-dwc3-270   [000] d...   185.104088: dwc3_event: event (000010c0): ep0out:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.104123: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000455 (HlCs:Sc:data)
>        uvc-gadget-275   [001] d...   185.104126: dwc3_prepare_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.104132: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.104170: dwc3_event: event (00002040): ep0out: Transfer Complete (Sil) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.104173: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000454 (hlCs:Sc:data)
>      irq/170-dwc3-270   [000] d...   185.104177: dwc3_complete_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.104181: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.104191: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.104193: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.104198: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.104215: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.104216: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.104220: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.104225: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.104310: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.104312: dwc3_ctrl_req: a1 82 00 01 01 00 1a 00
>      irq/170-dwc3-270   [000] d...   185.104319: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.104358: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.104364: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.104378: dwc3_event: event (000090c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.104406: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.104407: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.104412: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.104419: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.104420: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.104426: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.104479: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.104480: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.104484: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.104489: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.104544: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.104545: dwc3_ctrl_req: a1 83 00 01 01 00 1a 00
>      irq/170-dwc3-270   [000] d...   185.104553: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.104593: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.104598: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.104618: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.104620: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.104625: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.104632: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.104633: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.104638: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.104664: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.104666: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.104669: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.104675: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.104715: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.104717: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)

^

>      irq/170-dwc3-270   [000] d...   185.104730: dwc3_event: event (000010c0): ep0out:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.104764: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000455 (HlCs:Sc:data)
>        uvc-gadget-275   [001] d...   185.104767: dwc3_prepare_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.104773: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.104801: dwc3_event: event (00002040): ep0out: Transfer Complete (Sil) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.104802: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000454 (hlCs:Sc:data)
>      irq/170-dwc3-270   [000] d...   185.104806: dwc3_complete_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.104810: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.104822: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.104823: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.104829: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.104859: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.104860: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.104864: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.104869: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.104936: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.104937: dwc3_ctrl_req: a1 81 00 01 01 00 1a 00
>      irq/170-dwc3-270   [000] d...   185.104951: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.104984: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.104990: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105015: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.105016: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.105020: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.105029: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.105031: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.105037: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105063: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.105064: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.105068: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.105073: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105128: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.105129: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)

^

>      irq/170-dwc3-270   [000] d...   185.105143: dwc3_event: event (000010c0): ep0out:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.105178: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000455 (HlCs:Sc:data)
>        uvc-gadget-275   [001] d...   185.105182: dwc3_prepare_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.105187: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105241: dwc3_event: event (00002040): ep0out: Transfer Complete (Sil) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.105242: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000454 (hlCs:Sc:data)
>      irq/170-dwc3-270   [000] d...   185.105247: dwc3_complete_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.105250: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.105261: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.105262: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.105268: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105302: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.105303: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.105307: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.105312: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105363: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.105364: dwc3_ctrl_req: a1 82 00 01 01 00 1a 00
>      irq/170-dwc3-270   [000] d...   185.105378: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.105411: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.105417: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105434: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.105435: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.105439: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.105446: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.105448: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.105453: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105479: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.105482: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.105485: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.105491: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105498: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.105499: dwc3_ctrl_req: a1 83 00 01 01 00 1a 00
>      irq/170-dwc3-270   [000] d...   185.105507: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.105547: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.105552: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105574: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.105576: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.105580: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.105587: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.105588: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.105594: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105619: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.105621: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.105624: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.105630: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105638: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.105639: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)

^

>      irq/170-dwc3-270   [000] d...   185.105653: dwc3_event: event (000010c0): ep0out:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.105687: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000455 (HlCs:Sc:data)
>        uvc-gadget-275   [001] d...   185.105691: dwc3_prepare_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.105696: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105749: dwc3_event: event (00002040): ep0out: Transfer Complete (Sil) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.105750: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000454 (hlCs:Sc:data)
>      irq/170-dwc3-270   [000] d...   185.105754: dwc3_complete_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.105758: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.105768: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.105769: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.105775: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105801: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.105803: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.105807: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.105812: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105821: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.105822: dwc3_ctrl_req: a1 81 00 01 01 00 1a 00
>      irq/170-dwc3-270   [000] d...   185.105830: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.105868: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.105874: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105890: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.105892: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.105896: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.105903: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.105904: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.105909: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.105935: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.105936: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.105940: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.105946: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.108071: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.108073: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)

^

>      irq/170-dwc3-270   [000] d...   185.108087: dwc3_event: event (000010c0): ep0out:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.108122: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 26 ctrl 00000455 (HlCs:Sc:data)
>        uvc-gadget-275   [001] d...   185.108125: dwc3_prepare_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c53 (HLcs:SC:data)
>        uvc-gadget-275   [001] d...   185.108131: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.108170: dwc3_event: event (00002040): ep0out: Transfer Complete (Sil) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.108171: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000abecbec0 size 0 ctrl 00000454 (hlCs:Sc:data)
>      irq/170-dwc3-270   [000] d...   185.108175: dwc3_complete_trb: ep0out: trb 9c31d645 buf 00000000ae85c000 size 38 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.108179: dwc3_gadget_giveback: ep0out: req 2e97646a length 26/26 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.108189: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.108191: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.108197: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.108213: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.108214: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.108218: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.108224: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.108687: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.108690: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 1)

changing alternate setting.

>      irq/170-dwc3-270   [000] d...   185.124282: dwc3_gadget_ep_cmd: ep2in: cmd 'Set Endpoint Configuration' [401] params 00042002 0a000600 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.124289: dwc3_gadget_ep_enable: ep2in: mps 1024/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
>      irq/170-dwc3-270   [000] d...   185.124304: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>        uvc-gadget-275   [001] ....   185.182565: dwc3_alloc_request: ep2in: req f1fb458c length 0/0 zsI ==> 0
>        uvc-gadget-275   [001] ....   185.182568: dwc3_alloc_request: ep2in: req 5be7fd9f length 0/0 zsI ==> 0
>        uvc-gadget-275   [001] ....   185.182570: dwc3_alloc_request: ep2in: req 996abf23 length 0/0 zsI ==> 0
>        uvc-gadget-275   [001] ....   185.182571: dwc3_alloc_request: ep2in: req d9961026 length 0/0 zsI ==> 0
>        uvc-gadget-275   [001] d...   185.182597: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
>        uvc-gadget-275   [001] d...   185.182602: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.182641: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.182643: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
>      irq/170-dwc3-270   [000] d...   185.182647: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 0/0 zsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.182649: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.182654: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.182720: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.182722: dwc3_ctrl_req: Get String Descriptor(Index = 6, Length = 255)
>      irq/170-dwc3-270   [000] d...   185.182730: dwc3_prepare_trb: ep0in: trb 4a151d32 buf 00000000ab5d1000 size 32 ctrl 00000c53 (HLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.182735: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.182742: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.182746: dwc3_event: event (000090c2): ep0in:  [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.182769: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>      irq/170-dwc3-270   [000] d...   185.182770: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ab5d1000 size 0 ctrl 00000c52 (hLcs:SC:data)
>      irq/170-dwc3-270   [000] d...   185.182774: dwc3_gadget_giveback: ep0out: req b52ce5b9 length 32/32 ZsI ==> 0
>      irq/170-dwc3-270   [000] d...   185.182780: dwc3_event: event (000020c0): ep0out:  [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.182781: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.182786: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.182842: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
>      irq/170-dwc3-270   [000] d...   185.182843: dwc3_complete_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
>      irq/170-dwc3-270   [000] d...   185.182847: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>      irq/170-dwc3-270   [000] d...   185.182852: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.183054: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.183055: dwc3_ctrl_req: a1 87 00 02 00 02 02 00
>      irq/170-dwc3-270   [000] d...   185.183068: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.183110: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

More stalls

>        uvc-gadget-275   [001] d...   185.183113: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   185.183118: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>      irq/170-dwc3-270   [000] d...   185.183156: dwc3_event: event (a66810ca): ep2in: Transfer Not Ready [42600] (Not Active)
>      irq/170-dwc3-270   [000] d...   185.183227: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>      irq/170-dwc3-270   [000] d...   185.183228: dwc3_ctrl_req: a1 81 00 02 00 00 01 00
>      irq/170-dwc3-270   [000] d...   185.183241: dwc3_event: event (000010c2): ep0in:  [Data Phase]
>        uvc-gadget-275   [001] d...   185.183273: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Stall' [404] params 00000000 00000000 00000000 --> status: Successful

^

>        uvc-gadget-275   [001] d...   185.183275: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>        uvc-gadget-275   [001] d...   185.183280: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>        uvc-gadget-275   [001] d...   187.518706: dwc3_ep_queue: ep2in: req 5be7fd9f length 0/1024 zsI ==> -115

one and a half second between giveback and a new EP queue. This is
probably causing the...

>        uvc-gadget-275   [001] d...   187.518713: dwc3_prepare_trb: ep2in: trb 2bfdc994 buf 00000000ab188800 size 1x 1024 ctrl 00000c61 (Hlcs:SC:isoc-first)
>        uvc-gadget-275   [001] d...   187.518721: dwc3_gadget_ep_cmd: ep2in: cmd 'Start Transfer' [a6690406] params 00000000 ae870000 00000000 --> status: Bus Expiry

... bus expiry problems. After a series of them...

>        uvc-gadget-275   [001] d...   187.518722: dwc3_gadget_giveback: ep2in: req 5be7fd9f length 0/1024 zsI ==> -11
>        uvc-gadget-275   [001] d...   187.518726: dwc3_ep_queue: ep2in: req 996abf23 length 0/1024 zsI ==> -115
>        uvc-gadget-275   [001] d...   187.518727: dwc3_prepare_trb: ep2in: trb 5174e250 buf 00000000abb9d000 size 1x 1024 ctrl 00000c61 (Hlcs:SC:isoc-first)
>        uvc-gadget-275   [001] d...   187.518733: dwc3_gadget_ep_cmd: ep2in: cmd 'Start Transfer' [a66c0406] params 00000000 ae870010 00000000 --> status: Bus Expiry
>        uvc-gadget-275   [001] d...   187.518734: dwc3_gadget_giveback: ep2in: req 996abf23 length 0/1024 zsI ==> -11
>        uvc-gadget-275   [001] d...   187.518738: dwc3_ep_queue: ep2in: req d9961026 length 0/1024 zsI ==> -115
>        uvc-gadget-275   [001] d...   187.518739: dwc3_prepare_trb: ep2in: trb 55db2f85 buf 00000000abb9d400 size 1x 1024 ctrl 00000c61 (Hlcs:SC:isoc-first)
>        uvc-gadget-275   [001] d...   187.518744: dwc3_gadget_ep_cmd: ep2in: cmd 'Start Transfer' [a66f0406] params 00000000 ae870020 00000000 --> status: Bus Expiry
>        uvc-gadget-275   [001] d...   187.518746: dwc3_gadget_giveback: ep2in: req d9961026 length 0/1024 zsI ==> -11
>        uvc-gadget-275   [001] d...   187.518748: dwc3_ep_queue: ep2in: req f1fb458c length 0/1024 zsI ==> -115
>        uvc-gadget-275   [001] d...   187.518750: dwc3_prepare_trb: ep2in: trb a2098d36 buf 00000000ab188c00 size 1x 1024 ctrl 00000c61 (Hlcs:SC:isoc-first)
>        uvc-gadget-275   [001] d...   187.518755: dwc3_gadget_ep_cmd: ep2in: cmd 'Start Transfer' [a6720406] params 00000000 ae870030 00000000 --> status: Bus Expiry
>        uvc-gadget-275   [001] d...   187.518757: dwc3_gadget_giveback: ep2in: req f1fb458c length 0/1024 zsI ==> -11

... the host just gives up...

>        uvc-gadget-275   [001] d...   215.933831: dwc3_gadget_ep_disable: ep2in: mps 1024/1024 streams 15 burst 0 ring 4/0 flags E:swbP:<
>        uvc-gadget-275   [001] d...   215.933837: dwc3_gadget_ep_disable: ep1in: mps 16/1024 streams 15 burst 0 ring 0/0 flags E:swBp:<

... and endpoints are disabled.

>        uvc-gadget-275   [001] d...   215.933842: dwc3_gadget_ep_cmd: ep1in: cmd 'End Transfer' [30c08] params 00000000 00000000 00000000 --> status: Successful
>        uvc-gadget-275   [001] .n..   215.933980: dwc3_ep_dequeue: ep2in: req f1fb458c length 0/1024 zsI ==> -11
>        uvc-gadget-275   [001] .n..   215.940651: dwc3_ep_dequeue: ep2in: req 5be7fd9f length 0/1024 zsI ==> -11
>        uvc-gadget-275   [001] .n..   215.947297: dwc3_ep_dequeue: ep2in: req 996abf23 length 0/1024 zsI ==> -11
>        uvc-gadget-275   [001] .n..   215.953954: dwc3_ep_dequeue: ep2in: req d9961026 length 0/1024 zsI ==> -11
>        uvc-gadget-275   [001] .n..   215.960615: dwc3_free_request: ep2in: req f1fb458c length 0/1024 zsI ==> -11
>        uvc-gadget-275   [001] .n..   215.960617: dwc3_free_request: ep2in: req 5be7fd9f length 0/1024 zsI ==> -11
>        uvc-gadget-275   [001] .n..   215.960618: dwc3_free_request: ep2in: req 996abf23 length 0/1024 zsI ==> -11
>        uvc-gadget-275   [001] .n..   215.960619: dwc3_free_request: ep2in: req d9961026 length 0/1024 zsI ==> -11

So, first things first:

Let's figure out what those class requests are and why are they *always*
stalled. UVC class spec should answer that.

Then we need to find out why it takes 1.5 seconds for uvc-gadget to
queue more data.

-- 
balbi
