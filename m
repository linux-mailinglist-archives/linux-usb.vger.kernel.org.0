Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D120F2CF3A9
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 19:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729619AbgLDSJe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 13:09:34 -0500
Received: from cable.insite.cz ([84.242.75.189]:56035 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729483AbgLDSJe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Dec 2020 13:09:34 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id CF922AA0444D0;
        Fri,  4 Dec 2020 19:08:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1607105325; bh=o7FsbjM80BhNXsDLxh4YLbiDij+ygDMOOkC2zc5EIX0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=saUCt/yLpNKOgzw24mIDDTFKcKVTT15tUv3kU9bPx9q9OLK8nmX3HNUjXuvaK6Da0
         +8Roc+mclci8PQx/ErnQiegP3DjEBLhOJwHGq0aOhq4rESnYsfjQthgUUuYIF15frx
         hyRl/V87962P/M1wB77JRKSzjbx5E9/1LqLnYtHg=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4bTLIq0AHqhf; Fri,  4 Dec 2020 19:08:39 +0100 (CET)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 8FD23AA0444C3;
        Fri,  4 Dec 2020 19:08:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1607105319; bh=o7FsbjM80BhNXsDLxh4YLbiDij+ygDMOOkC2zc5EIX0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ouOJD1cdf+GhaBhwYoGRG8YwYLRC7/Lg/Q8NBGxLhZ9hXnqFm+pWdo2iPsbv3IZyf
         TQ05W0LxTqbscasA97J5Bl7hC0IAZWL0iMa/UDBkhWkEYVZmTqQWJ8Gfsb1gL6RxRm
         kJcKCdzV8gH180ED/SIZOwdtUKOGiie+lK0Pez3g=
Subject: Re: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Glenn Schmottlach <gschmottlach@gmail.com>,
        Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <20201111092941.GJ14896@b29397-desktop>
 <CAB=otbSAGhDYxim9_fsyH4pZCLqgq+bxNJfv5hXqgQRVngVaig@mail.gmail.com>
 <CAMS2kBF5Gvhnf7AzdeSFeVeWBLhtHM_hHfTvMLTN-3Jkh=BwHw@mail.gmail.com>
 <CAB=otbTK0j03HjiLS-tqqaBTuavaFEJs49hpKPj2Df8e1_WN+A@mail.gmail.com>
 <1jblfk8di1.fsf@starbuckisacylon.baylibre.com>
 <8bf995b1-7b95-4c79-fbe8-275f29716c0e@ivitera.com>
 <CAB=otbS0RdXyLEHrkHXWZN+S-CKwdBONifrH11hiAf-3SL9cSQ@mail.gmail.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <c33f2009-254d-5017-3917-a34d45b55b55@ivitera.com>
Date:   Fri, 4 Dec 2020 19:08:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAB=otbS0RdXyLEHrkHXWZN+S-CKwdBONifrH11hiAf-3SL9cSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 04. 12. 20 v 15:39 Ruslan Bilovol napsal(a):
> On Thu, Nov 26, 2020 at 3:44 PM Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>>
>> Dne 26. 11. 20 v 14:16 Jerome Brunet napsal(a):
>>>
>>>> Maximum data rates that I used were (AFAIR) 8 channel 192kHz/32bit,
>>>> but there is another issue with high data rate if someone uses so many
>>>> channels, very high sampling frequency or sample size that data can't
>>>> fit into allowed (by USB spec) max packet size of endpoint. In this case
>>>> need to decrease bInterval of endpoint.
>>
>> Should anyone test the patches with RPi4 dwc2 as the gadget, please note
>> the recently accepted patch
>> https://patchwork.kernel.org/project/linux-usb/patch/e9e7d070-593c-122f-3a5c-2435bb147ab2@ivitera.com/
>> which allows using full 1024 bytes maxpacketsize on EP OUT. It is not an
>> enumeration issue, but the old (= existing) RX FIFO size drops data with
>> packet sizes above 960 bytes.
> 
> Thanks for bringing this to our attention. Does it affect RPi 3 as well?
> I'm going to test feedback feature on this board

It configures the dwc2 IP of the broadcom which IIRC is in all RPis. The
affected files bcm283x-rpi-usb-otg.dtsi and
bcm283x-rpi-usb-peripheral.dtsi do not seem RPi4 specific. But I had
only RPi4 to analyze the problem and check the fix.

Ruslan, please what do you think about the existing behaviour of gaudio
in case of USB stream disconnection? The elapsed-period callback stops
being called and the user space will eventually time out. How about
closing the PCM stream immediately in case of a problem in the USB
layer? E.g. some SPDIF receivers do that in case of change in the
incoming samplerate
https://github.com/torvalds/linux/blob/master/sound/i2c/other/ak4117.c#L503
.

Thanks a lot for the great work.

With regards,

Pavel.
