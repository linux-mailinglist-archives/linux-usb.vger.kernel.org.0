Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6542A8936
	for <lists+linux-usb@lfdr.de>; Thu,  5 Nov 2020 22:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732162AbgKEVpd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Nov 2020 16:45:33 -0500
Received: from mailfilter05-out30.webhostingserver.nl ([195.211.73.139]:21828
        "EHLO mailfilter05-out30.webhostingserver.nl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732046AbgKEVpc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Nov 2020 16:45:32 -0500
X-Greylist: delayed 963 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Nov 2020 16:45:30 EST
X-Halon-ID: fa328c57-1fad-11eb-9ed4-001a4a4cb933
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl [141.138.168.154])
        by mailfilter05.webhostingserver.nl (Halon) with ESMTPSA
        id fa328c57-1fad-11eb-9ed4-001a4a4cb933;
        Thu, 05 Nov 2020 22:29:25 +0100 (CET)
Received: from [2001:981:6fec:1:1c7a:93e2:3548:ae72]
        by s198.webhostingserver.nl with esmtpa (Exim 4.93.0.4)
        (envelope-from <fntoth@gmail.com>)
        id 1kamov-00D7bP-2k; Thu, 05 Nov 2020 22:29:25 +0100
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
To:     Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jack Pham <jackp@codeaurora.org>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
 <874kmpf583.fsf@kernel.org> <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
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
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <ec15a515-6dbc-1224-a457-d5ac4a4db280@gmail.com>
Date:   Thu, 5 Nov 2020 22:29:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <871rhin1yt.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Op 28-10-2020 om 10:18 schreef Felipe Balbi:
> Hi,
>
> Ferry Toth <fntoth@gmail.com> writes:
>> Op 27-10-2020 om 22:16 schreef Andy Shevchenko:
>>> On Tue, Oct 27, 2020 at 10:13 PM Ferry Toth <fntoth@gmail.com> wrote:
>>>> Op 22-10-2020 om 15:43 schreef Andy Shevchenko:
>>>>> On Thu, Oct 22, 2020 at 4:21 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>>>>>> Ferry Toth wrote:
>>> ...
>>>
>>>>>> There are some fixes to dwc3 in kernel mainline. Is it possible to test
>>>>>> this against linux-next?
>>>>> I think the best is to wait for v5.10-rc1 and retest.
>>> Can you give a try of v5.10-rc1?
>> Yes, I just tried:
>>
>> I booted in host mode, then flip the switch. Gadget come up, go down
>> once, then come up again and stay up.
> please collect trace events. It's important to figure out why it's going
> down, even if only once. Make sure to collect trace *and* dmesg so we
> can correlate trace with the reenumeration that should show up in dmesg.
>
> thanks

Sorry, I had to replace mobo. Now back on this.

As is, on Edison I can record with something like "perf record -e 
'dwc3:dwc3_gadget*' -e 'gadget:*' -g -a".
Then get the trace buffer with "perf script > gadget.txt". Then at each 
trace point we get a stack trace like:

file-storage   831 [001]  4445.240038: dwc3:dwc3_gadget_ep_cmd: [FAILED 
TO PARSE] name=ep4in cmd=524295 param0=0 param1=0 param2=0 cmd_status=0
     ffffffff9a35b7e7 __traceiter_dwc3_gadget_ep_cmd+0x37 
([kernel.kallsyms])
     ffffffff9a35b7e7 __traceiter_dwc3_gadget_ep_cmd+0x37 
([kernel.kallsyms])
     ffffffff9a35fa40 dwc3_send_gadget_ep_cmd+0x320 ([kernel.kallsyms])
     ffffffff9a3606d0 __dwc3_gadget_kick_transfer+0x200 ([kernel.kallsyms])
     ffffffff9a361114 dwc3_gadget_ep_queue+0xe4 ([kernel.kallsyms])
     ffffffff9a3afc3a usb_ep_queue+0x2a ([kernel.kallsyms])
     ffffffffc047c301 start_transfer.isra.0+0x21 ([kernel.kallsyms])
     ffffffffc047c88a start_in_transfer.isra.0+0x3a ([kernel.kallsyms])
     ffffffffc047c93d send_status+0x8d ([kernel.kallsyms])
     ffffffffc047dd05 fsg_main_thread+0x3c5 ([kernel.kallsyms])
     ffffffff99c853b9 kthread+0xf9 ([kernel.kallsyms])
     ffffffff99c01a32 ret_from_fork+0x22 ([kernel.kallsyms])

"perf list" shows the tracepoint events, the same as under 
/sys/kernel/debug/tracing/events/

Question is which points to trace (above command fills buffer to 35MB in 
10sec). Do you have suggestions?

Thanks

