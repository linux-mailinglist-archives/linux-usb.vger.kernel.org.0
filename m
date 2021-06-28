Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDA63B5698
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jun 2021 03:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbhF1B1L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Jun 2021 21:27:11 -0400
Received: from mail.as397444.net ([69.59.18.99]:58648 "EHLO mail.as397444.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231706AbhF1B1L (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 27 Jun 2021 21:27:11 -0400
X-Greylist: delayed 3142 seconds by postgrey-1.27 at vger.kernel.org; Sun, 27 Jun 2021 21:27:11 EDT
Received: by mail.as397444.net (Postfix) with UTF8SMTPSA id A0DC45F3D11;
        Mon, 28 Jun 2021 01:24:45 +0000 (UTC)
X-DKIM-Note: Keys used to sign are likely public at https://as397444.net/dkim/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattcorallo.com;
        s=1624842064; t=1624843485;
        bh=tgbzxfavtMQtCYSdvLFP0HIXqmLOuETr8LMyWOwcWl8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=mVcUG7Z8bsvf5s3fu1OskesK+Th5x6vPYxBnBMDUuKMJvb+bqp6OaMSMUUw0LnjjB
         ekVqhq7E2S9t55Hi3tV9UzpBcc7tGP2PaDVgSLXnYXvFDqojht8f+Yo9REP44CgXFy
         jH2rOSqEQFgWj45NPsvhxrfhqHbJL4QFsEypWOLNjUvEd7T5ZEsefbdwhMM4r8CePU
         xNeXGsaMYP4T19HeA/nTtKAAUSsn0C31+5+XzC0QkTSY+F/aUwZhhvC9zP8kFpogx8
         tn8gFTCwvv0d0GmdhC9CbGMEtSoD65wiAyNz7jmbQXfO7xYuoAATgsS1JxCV8cO6gl
         bdTFRRoKjwqTA==
Message-ID: <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
Date:   Sun, 27 Jun 2021 21:24:45 -0400
MIME-Version: 1.0
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
From:   Matt Corallo <oc2udbzfd@mattcorallo.com>
In-Reply-To: <20210628011628.GC638648@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 6/27/21 21:16, Alan Stern wrote:
> On Sun, Jun 27, 2021 at 09:05:25PM -0400, Matt Corallo wrote:
>>
>>
>> On 6/27/21 20:58, Alan Stern wrote:
>>> On Sun, Jun 27, 2021 at 08:32:21PM -0400, Matt Corallo wrote:
>>>> On an ODROID-C1/C2 device, using the dwc2 driver, only some devices cause USB bus to enumerate devices.
>>>>
>>>> Specifically, both on boot and during normal operation, if some devices are
>>>> plugged in, all USB devices are detected, but if those devices are removed,
>>>> no detection of any devices occurs.
>>>
>>> So if you boot with no devices plugged in, and then you plug in (say) a
>>> flash drive, it doesn't get detected?
>>
>> There is a separate and long-standing bug on the ODROID-C1 and ODROID-C2
>> devices where hotplug doesn't work reliably, which is why I mentioned
>> rebooting. This specific bug all works identically whether booting fresh
>> with the devices or testing hotplug (which sometimes works with lsusb -vvv).
> 
> That doesn't answer my question.  If no devices are plugged in (either
> at boot or during normal operation), and then you plug in a device like
> a flash drive, does it get detected?  What you wrote seems to imply that
> it does not.

That is correct, nothing gets auto-detected after boot. lsusb -vvv *does* cause devices in the second group below to be 
reliably detected, and the first group only if at least one of the devices in the second group are present.

>>>> I sadly don't have a lot more to go on, but xdarklight on IRC (I believe ==
>>>> Martin, CC'd) confirmed the findings with a grab bag of USB devices he had
>>>> sitting around as well, and may be able to provide CONFIG_USB_DWC2_DEBUG
>>>> output.
>>>>
>>>> Any further guidance on where to look to debug this issue would be appreciated.
>>>>
>>>> As a sample, some devices which, when plugged in (either alone or together)
>>>> do not cause any USB device detection (see attached lsusb -v files):
>>>>
>>>> Samsung T7 USB 3 drive
>>>> Samsung-Branded Silicon Motion USB 3 Flash Drive
>>>>
>>>> Some devices which, when plugged in cause all USB devices to be detected:
>>>>
>>>> Mushkin-Branded Kingston USB 3 Flash Drive
>>>> Kingston-Branded Kingston USB 2 Flash Drive
>>>> USB-3 MicroSD Card reader (lsusb/testing by xdarklight)
>>>> SanDisk USB 3 Flash Drive (lsusb/testign by xdkarlight)
>>>
>>> This could simply be a question of power.  Most of the flash drives and
>>> the card reader probably don't require very much power, whereas some of
>>> them need more.  You can this, to some extent, in the MaxPower fields of
>>> the lsusb -v listings.
>>
>> That seems strange, though, given that the first group of devices appear and
>> work totally fine, but only when something from the second group of devices
>> is plugged in. If the second group is not present, then the first group of
>> devices do not appear at all.
> 
> You mean that only devices in the first group are affected by this bug?
> Devices in the second group are always detected correctly regardless of
> what else is plugged in?  (This contradicts what you wrote above.)


Correct. Ignoring hotplug (ie on fresh boot or lsusb -vvv), the devices in the second group work great. The devices in 
the first group do too, but only if a device from the second group is present.

Sorry for the confusion,
Matt
