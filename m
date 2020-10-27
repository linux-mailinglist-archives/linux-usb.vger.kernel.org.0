Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9097329CBC0
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 23:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505853AbgJ0WHG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 18:07:06 -0400
Received: from mailfilter01-out41.webhostingserver.nl ([141.138.168.30]:48111
        "EHLO mailfilter01-out41.webhostingserver.nl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2505912AbgJ0WHG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 18:07:06 -0400
X-Halon-ID: bddcb8c0-18a0-11eb-9248-001a4a4cb906
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl [141.138.168.154])
        by mailfilter01.webhostingserver.nl (Halon) with ESMTPSA
        id bddcb8c0-18a0-11eb-9248-001a4a4cb906;
        Tue, 27 Oct 2020 23:07:02 +0100 (CET)
Received: from [2001:981:6fec:1:68dc:4ef6:3eb9:a9b9]
        by s198.webhostingserver.nl with esmtpa (Exim 4.92.3)
        (envelope-from <fntoth@gmail.com>)
        id 1kXX7O-004yKK-6U; Tue, 27 Oct 2020 23:07:02 +0100
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <874kmpf583.fsf@kernel.org>
 <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
 <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com>
 <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
 <2b6586e6-528c-86e8-9d92-0061bc44866d@gmail.com>
 <aad327a8-95bc-40ec-abf7-ad216a02fad0@synopsys.com>
 <2cc783ac-6b71-190b-49fc-9e2bceeacd4b@gmail.com>
 <920590dc-5430-7f8b-b2e1-1a4c37f4dfbe@synopsys.com>
 <CAHp75Vfs9AoOYSVGTpw30h11ptPOSPNf1AsWBKdiVrDL=9X3PQ@mail.gmail.com>
 <0089306e-e2ca-9a53-6ffb-202d028050ce@gmail.com>
 <20201027210648.GB26640@jackp-linux.qualcomm.com>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <8d14735a-d8ff-da78-b93f-c80b1c3307c3@gmail.com>
Date:   Tue, 27 Oct 2020 23:07:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027210648.GB26640@jackp-linux.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Op 27-10-2020 om 22:06 schreef Jack Pham:
> Hi Ferry,
>
> On Tue, Oct 27, 2020 at 09:13:31PM +0100, Ferry Toth wrote:
>> Hi guys,
>>
>> Sorry for messing up the CC list. This was partly thanks to gmane, partly my
>> own stupidity. I hope it is complete now.
>>
>> I am summarizing the status of this one at the bottom.
>>
>> Op 22-10-2020 om 15:43 schreef Andy Shevchenko:
>>> On Thu, Oct 22, 2020 at 4:21 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>>>> Ferry Toth wrote:
>>>>> Op 21-10-2020 om 21:50 schreef Thinh Nguyen:
>>>>>> Ferry Toth wrote:
>>> ...
>>>
>>>>>> Oops, looks like I can't make it synchronous this way. Can you try
>>>>>> Jack's change to the u_audio.c instead?
>>>>> Oops indeed goes away with Jack's change, but usb connection goes
>>>>> up/down continuously, meaning: my host sees usb network and audio
>>>>> device appearing / disappearing.
>>>> Ok, thanks for verifying that it went away.
>>>>
>>>>> mass_storage device does not appear all.
>>>> There are some fixes to dwc3 in kernel mainline. Is it possible to test
>>>> this against linux-next?
>>> I think the best is to wait for v5.10-rc1 and retest.
>>>
>> I looks like there have been at least 3 problems:
>>
>> 1) dwc3 was not working in host mode, but not causing an oops. This may have
>> been caused by platform changes. Andy has provided a fix for this, dwc3 now
>> working in host mode on 5.9
>>
>> 2) dwc3 was causing the oops in gadget mode as referenced in this thread.
>> The experimental patch from Jack Phan indeed fixes this.
>>
>> Code here: https://github.com/edison-fw/linux/commits/eds-acpi-5.9.0
> Great, thanks! I'll submit the patch to the list. Is it alright if I
> add a Reported-and-tested-by tag from you?

Sure.

I also tested against 5.10-rc1 now, see below.

>> 3) With the above 2 fixes gadgets work but seem to be powered down (after 15
>> sec. or so) and up (after 1 sec.) continuously. No oops, no errors in
>> journal. The gadgets I enabled are a network, sound and mass storage. The
>> latter stops working due to going up/down quickly. But my host shows
>> network/sound appearing/disappearing. Journal of edison shows:
>>
>> systemd-networkd[525]: usb0: Gained carrier
>> systemd-networkd[525]: usb0: Gained IPv6LL
>> systemd-networkd[525]: usb0: Lost carrier
>> systemd-networkd[525]: usb0: Gained carrier
>> systemd-networkd[525]: usb0: Gained IPv6LL
>> systemd-networkd[525]: usb0: Lost carrier

With 5.10-rc1 booting in host mode, then switching to gadget lost 
carrier (after 30 dec.) happens only once, then comes back and stays:

root@edison:~# journalctl -b -1 | grep usb0
Oct 27 22:36:52 edison kernel: usb0: HOST MAC aa:bb:cc:dd:ee:f2
Oct 27 22:36:52 edison kernel: usb0: MAC aa:bb:cc:dd:ee:f1
Oct 27 22:36:52 edison kernel: IPv6: ADDRCONF(NETDEV_CHANGE): usb0: link 
becomes ready
Oct 27 22:36:52 edison systemd-networkd[527]: usb0: Gained carrier
Oct 27 22:36:54 edison systemd-networkd[527]: usb0: Gained IPv6LL
Oct 27 22:37:25 edison systemd-networkd[527]: usb0: Lost carrier
Oct 27 22:37:26 edison kernel: IPv6: ADDRCONF(NETDEV_CHANGE): usb0: link 
becomes ready
Oct 27 22:37:26 edison systemd-networkd[527]: usb0: Gained carrier
Oct 27 22:37:27 edison systemd-networkd[527]: usb0: Gained IPv6LL

Booting in gadget mode sequence of event is defferent:
root@edison:~# journalctl -b | grep usb0
Oct 27 22:58:54 edison kernel: usb0: HOST MAC aa:bb:cc:dd:ee:f2
Oct 27 22:58:54 edison kernel: usb0: MAC aa:bb:cc:dd:ee:f1
Oct 27 22:58:57 edison systemd-networkd[543]: usb0: Gained IPv6LL
Oct 27 22:58:57 edison systemd-networkd[543]: usb0: Lost carrier
Oct 27 22:58:57 edison systemd-networkd[543]: usb0: Gained carrier


>> Any ideas how to proceed are highly welcomed!
> I suppose you can start with enabling dwc3 trace events and try to see
> what's going on from the gadget side. Please refer to
> Documentation/driver-api/usb/dwc3.rst **Reporting Bugs**
I'll try to get something meaningful here
> Also what happens if you enable the network, sound and mass storage
> functions individually rather than all at once (assuming you are using
> ConfigFS)?
I haven't tried this yet. I did try disabling sound entirely but that 
made no difference.
> Jack
