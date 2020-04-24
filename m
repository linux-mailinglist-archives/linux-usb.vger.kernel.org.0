Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A6A1B72F8
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 13:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgDXLVu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 07:21:50 -0400
Received: from cable.insite.cz ([84.242.75.189]:51378 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726289AbgDXLVu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Apr 2020 07:21:50 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id C0CBBA1F2BCF1;
        Fri, 24 Apr 2020 13:21:47 +0200 (CEST)
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gIEcJZTPzvjm; Fri, 24 Apr 2020 13:21:42 +0200 (CEST)
Received: from [192.168.105.191] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id BB324A1755F1F;
        Fri, 24 Apr 2020 13:21:41 +0200 (CEST)
Subject: Re: usb:gadget:f_uac2: EP OUT is adaptive instead of async
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc:     linux-usb@vger.kernel.org
References: <4bd36708-0ade-fbd7-5eec-5b8df7b3f2ee@ivitera.com>
 <CAB=otbRMQ6eCD0U-2zDCQvN37VRhBta_9_+9u4FwEbY4St=AgQ@mail.gmail.com>
 <f3114cb0-dc77-b4a6-f70b-2e72c9e87ce2@ivitera.com>
Message-ID: <cf933b39-1d4a-aeff-3db9-5e05da302665@ivitera.com>
Date:   Fri, 24 Apr 2020 13:21:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f3114cb0-dc77-b4a6-f70b-2e72c9e87ce2@ivitera.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dne 11. 02. 20 v 20:02 Pavel Hofman napsal(a):
> Hi Ruslan,
> 
> Dne 11. 02. 20 v 17:10 Ruslan Bilovol napsal(a):
>> On Thu, Feb 6, 2020 at 3:35 PM Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>>>
>>> .
>>
>> Are you working on async feedback EP implementation? I'm interested in that
>> feature and I can implement it soon but do not want to do double work
>> if somebody
>> is already working on it and will send to the community soon
> 
> I would be happy if you focused on the feedback. I want to solve the
> g_audio usability somehow first
> https://lore.kernel.org/linux-usb/df2eeff0-ca9c-35f9-2e72-8426b2cf72c9@ivitera.com/
> as it would allow easy usage of the existing adaptive gadget version.
> 
> The feedback - I have been shown a simple implementation which is not
> public and is not using the g_audio alsa device on the other side.
> 
> IMO the key issue is designing the async feedback to accept feedback
> values from userspace as well as from any third-party kernel module. Why
> userspace? The stream provided by the g_audio capture device  can be
> output to a real master-clock alsa device (e.g. after synchronous
> resampling), be sent by network to some master-clock device, many other
> options possible. Any master-clock output device/ userspace sink should
> be able to provide data for calculating proper up-to-date feedback value
> for the slaved UAC2 gadget.
> 
> I have done a few trials with master alsa output device -
> 
> https://www.diyaudio.com/forums/pc-based/342070-linux-usb-audio-gadget-rpi4-otg.html#post5909816
> 
> 
> https://www.diyaudio.com/forums/pc-based/342070-linux-usb-audio-gadget-rpi4-otg.html#post5910911
> 
> Details for alsa-lib are discussed in
> https://www.spinics.net/lists/alsa-devel/msg96781.html
> 
> 
> This is a solution I need - syncing the UAC2 gadget to master clock of
> real alsa soundcard . But again - I think the solution should be
> flexible to support any source of feedback information, be it in kernel
> or from userspace.
> 

Hi, please can we resume this discussion about the feedback endpoint?

Meanwhile a simple method described in
https://www.aktives-hoeren.de/viewtopic.php?p=137829&sid=0d6cd50e0f58618da33621c62e412ada#p137829
for obtaining required rate shift from /proc/asound/.../status to keep
the master side buffer optimally filled was tested. That could be one
source for the rate shift, to be passed to the driver. Perhaps a control
element like the "PCM Rate Shift" of the snd-aloop driver could be used.


Thanks a lot,

Pavel.
