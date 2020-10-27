Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9AF29CB94
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 22:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S374545AbgJ0Vy0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 17:54:26 -0400
Received: from mailfilter05-out41.webhostingserver.nl ([141.138.168.206]:40756
        "EHLO mailfilter05-out41.webhostingserver.nl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2506374AbgJ0VyZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 17:54:25 -0400
X-Halon-ID: f8cdf5ff-189e-11eb-9ed4-001a4a4cb933
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl [141.138.168.154])
        by mailfilter05.webhostingserver.nl (Halon) with ESMTPSA
        id f8cdf5ff-189e-11eb-9ed4-001a4a4cb933;
        Tue, 27 Oct 2020 22:54:22 +0100 (CET)
Received: from [2001:981:6fec:1:68dc:4ef6:3eb9:a9b9]
        by s198.webhostingserver.nl with esmtpa (Exim 4.92.3)
        (envelope-from <fntoth@gmail.com>)
        id 1kXWv8-004NOn-6H; Tue, 27 Oct 2020 22:54:22 +0100
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
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
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <30ab00e4-53ae-fd9e-1689-c94078a31625@gmail.com>
Date:   Tue, 27 Oct 2020 22:54:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc0P746FhhohJ=wRccsQL4ewn+AECMw3yTD6cuGxHCG9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Op 27-10-2020 om 22:16 schreef Andy Shevchenko:
> On Tue, Oct 27, 2020 at 10:13 PM Ferry Toth <fntoth@gmail.com> wrote:
>> Op 22-10-2020 om 15:43 schreef Andy Shevchenko:
>>> On Thu, Oct 22, 2020 at 4:21 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>>>> Ferry Toth wrote:
> ...
>
>>>> There are some fixes to dwc3 in kernel mainline. Is it possible to test
>>>> this against linux-next?
>>> I think the best is to wait for v5.10-rc1 and retest.
> Can you give a try of v5.10-rc1?

Yes, I just tried:

I booted in host mode, then flip the switch. Gadget come up, go down 
once, then come up again and stay up.

I tested mass storage mounts, network works. Sound device is detected by 
the host, I didn't actually try to play a sound.

So, big improvement, thanks!

>> I looks like there have been at least 3 problems:
>>
>> 1) dwc3 was not working in host mode, but not causing an oops. This may
>> have been caused by platform changes. Andy has provided a fix for this,
>> dwc3 now working in host mode on 5.9
> Rafael took the above mentioned change(s) for v5.10-rcX.
> https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=bleeding-edge&id=99aed9227073fb34ce2880cbc7063e04185a65e1
>
>> 2) dwc3 was causing the oops in gadget mode as referenced in this
>> thread. The experimental patch from Jack Phan indeed fixes this.
>>
>> Code here: https://github.com/edison-fw/linux/commits/eds-acpi-5.9.0
>>
>> 3) With the above 2 fixes gadgets work but seem to be powered down
>> (after 15 sec. or so) and up (after 1 sec.) continuously. No oops, no
>> errors in journal. The gadgets I enabled are a network, sound and mass
>> storage. The latter stops working due to going up/down quickly. But my
>> host shows network/sound appearing/disappearing. Journal of edison shows:
>>
>> systemd-networkd[525]: usb0: Gained carrier
>> systemd-networkd[525]: usb0: Gained IPv6LL
>> systemd-networkd[525]: usb0: Lost carrier
>> systemd-networkd[525]: usb0: Gained carrier
>> systemd-networkd[525]: usb0: Gained IPv6LL
>> systemd-networkd[525]: usb0: Lost carrier
>>
>> Any ideas how to proceed are highly welcomed!
