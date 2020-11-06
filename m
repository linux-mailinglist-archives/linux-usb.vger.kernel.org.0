Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49362A8F7F
	for <lists+linux-usb@lfdr.de>; Fri,  6 Nov 2020 07:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgKFGiM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Nov 2020 01:38:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:35792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbgKFGiM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Nov 2020 01:38:12 -0500
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E095C208C3;
        Fri,  6 Nov 2020 06:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604644691;
        bh=8s2RI5Ad2SsTPjgjKLg8JM/UTPhyIkCxxMtpB4xd+vk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=YRcEG+3E3YuUqhRDp/knDmn8Wuew19eq1iRucQzS/JMoor22QstXWUTlP4VmDylGO
         9CU++RdLi3HtYo+5dknb4hSjLTczR7kAvrXvWK2lbL//glBEar9SCV2cGeWFvan5og
         oklR+D5f0Br9ZTi7T8HMsAQozT1ProxJT7Kla4UM=
From:   Felipe Balbi <balbi@kernel.org>
To:     Ferry Toth <fntoth@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
In-Reply-To: <ec15a515-6dbc-1224-a457-d5ac4a4db280@gmail.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org>
 <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
 <874kmpf583.fsf@kernel.org>
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
 <30ab00e4-53ae-fd9e-1689-c94078a31625@gmail.com>
 <871rhin1yt.fsf@kernel.org>
 <ec15a515-6dbc-1224-a457-d5ac4a4db280@gmail.com>
Date:   Fri, 06 Nov 2020 08:38:07 +0200
Message-ID: <87eel7q9bk.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Ferry Toth <fntoth@gmail.com> writes:
> Hi,
>
> Op 28-10-2020 om 10:18 schreef Felipe Balbi:
>> Hi,
>>
>> Ferry Toth <fntoth@gmail.com> writes:
>>> Op 27-10-2020 om 22:16 schreef Andy Shevchenko:
>>>> On Tue, Oct 27, 2020 at 10:13 PM Ferry Toth <fntoth@gmail.com> wrote:
>>>>> Op 22-10-2020 om 15:43 schreef Andy Shevchenko:
>>>>>> On Thu, Oct 22, 2020 at 4:21 PM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>>>>>>> Ferry Toth wrote:
>>>> ...
>>>>
>>>>>>> There are some fixes to dwc3 in kernel mainline. Is it possible to =
test
>>>>>>> this against linux-next?
>>>>>> I think the best is to wait for v5.10-rc1 and retest.
>>>> Can you give a try of v5.10-rc1?
>>> Yes, I just tried:
>>>
>>> I booted in host mode, then flip the switch. Gadget come up, go down
>>> once, then come up again and stay up.
>> please collect trace events. It's important to figure out why it's going
>> down, even if only once. Make sure to collect trace *and* dmesg so we
>> can correlate trace with the reenumeration that should show up in dmesg.
>>
>> thanks
>
> Sorry, I had to replace mobo. Now back on this.
>
> As is, on Edison I can record with something like "perf record -e=20
> 'dwc3:dwc3_gadget*' -e 'gadget:*' -g -a".
> Then get the trace buffer with "perf script > gadget.txt". Then at each=20
> trace point we get a stack trace like:
>
> file-storage=C2=A0=C2=A0 831 [001]=C2=A0 4445.240038: dwc3:dwc3_gadget_ep=
_cmd: [FAILED=20
> TO PARSE] name=3Dep4in cmd=3D524295 param0=3D0 param1=3D0 param2=3D0 cmd_=
status=3D0
>  =C2=A0=C2=A0 =C2=A0ffffffff9a35b7e7 __traceiter_dwc3_gadget_ep_cmd+0x37=
=20
> ([kernel.kallsyms])
>  =C2=A0=C2=A0 =C2=A0ffffffff9a35b7e7 __traceiter_dwc3_gadget_ep_cmd+0x37=
=20
> ([kernel.kallsyms])
>  =C2=A0=C2=A0 =C2=A0ffffffff9a35fa40 dwc3_send_gadget_ep_cmd+0x320 ([kern=
el.kallsyms])
>  =C2=A0=C2=A0 =C2=A0ffffffff9a3606d0 __dwc3_gadget_kick_transfer+0x200 ([=
kernel.kallsyms])
>  =C2=A0=C2=A0 =C2=A0ffffffff9a361114 dwc3_gadget_ep_queue+0xe4 ([kernel.k=
allsyms])
>  =C2=A0=C2=A0 =C2=A0ffffffff9a3afc3a usb_ep_queue+0x2a ([kernel.kallsyms])
>  =C2=A0=C2=A0 =C2=A0ffffffffc047c301 start_transfer.isra.0+0x21 ([kernel.=
kallsyms])
>  =C2=A0=C2=A0 =C2=A0ffffffffc047c88a start_in_transfer.isra.0+0x3a ([kern=
el.kallsyms])
>  =C2=A0=C2=A0 =C2=A0ffffffffc047c93d send_status+0x8d ([kernel.kallsyms])
>  =C2=A0=C2=A0 =C2=A0ffffffffc047dd05 fsg_main_thread+0x3c5 ([kernel.kalls=
yms])
>  =C2=A0=C2=A0 =C2=A0ffffffff99c853b9 kthread+0xf9 ([kernel.kallsyms])
>  =C2=A0=C2=A0 =C2=A0ffffffff99c01a32 ret_from_fork+0x22 ([kernel.kallsyms=
])
>
> "perf list" shows the tracepoint events, the same as under=20
> /sys/kernel/debug/tracing/events/
>
> Question is which points to trace (above command fills buffer to 35MB in=
=20
> 10sec). Do you have suggestions?

don't enable any gadget event. Only dwc3 events. Also, enable *all* dwc3
events. Usually, I avoid perf when doing this and just go straight to
/sys/kernel/trace/.

--=20
balbi
