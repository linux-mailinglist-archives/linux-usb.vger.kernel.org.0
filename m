Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C963B5672
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jun 2021 03:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbhF1BHv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Jun 2021 21:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbhF1BHv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Jun 2021 21:07:51 -0400
Received: from mail.as397444.net (mail.as397444.net [IPv6:2620:6e:a000:1::99])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id 85167C061574
        for <linux-usb@vger.kernel.org>; Sun, 27 Jun 2021 18:05:26 -0700 (PDT)
Received: by mail.as397444.net (Postfix) with UTF8SMTPSA id 8D5CC5F3C80;
        Mon, 28 Jun 2021 01:05:25 +0000 (UTC)
X-DKIM-Note: Keys used to sign are likely public at https://as397444.net/dkim/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattcorallo.com;
        s=1624840864; t=1624842325;
        bh=8pa21uLmbA4lr1gIMTlu/Iq6K9qQ8JbtXVKJPakqqGA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=lQ+FbKc3hv/lhsZZVkgw4VNEb4iewkLZohwSxPkilYT636CLuXkSYaKj1TKgf07KO
         luCiXA4Jj+KRW/FanBOitrjjyC6GAjEURoXxN/71MU0GdS2lLMgrVTAdPDjrKyflXQ
         p56rakPc3TcdyF8gldJzttmj+OSsKZTXzHFc4LDnP8yuZiFXf68kBSF0mNTUoh/rkb
         FUrPIReV69cEMnds72heDhQ4jE3Z1lsXWdBRGyGnDvMcN8f5sK+jadTU0hyrZK1/Xg
         H0VWlGe+eUjXhskhdffl0ExbC8Z+hMTAH3QAky3ll8TGRRLyqMSmxmnXay4xY6pekn
         afOMPBwoYdGMw==
Message-ID: <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
Date:   Sun, 27 Jun 2021 21:05:25 -0400
MIME-Version: 1.0
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
From:   Matt Corallo <oc2udbzfd@mattcorallo.com>
In-Reply-To: <20210628005825.GA638648@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 6/27/21 20:58, Alan Stern wrote:
> On Sun, Jun 27, 2021 at 08:32:21PM -0400, Matt Corallo wrote:
>> On an ODROID-C1/C2 device, using the dwc2 driver, only some devices cause USB bus to enumerate devices.
>>
>> Specifically, both on boot and during normal operation, if some devices are
>> plugged in, all USB devices are detected, but if those devices are removed,
>> no detection of any devices occurs.
> 
> So if you boot with no devices plugged in, and then you plug in (say) a
> flash drive, it doesn't get detected?

There is a separate and long-standing bug on the ODROID-C1 and ODROID-C2 devices where hotplug doesn't work reliably, 
which is why I mentioned rebooting. This specific bug all works identically whether booting fresh with the devices or 
testing hotplug (which sometimes works with lsusb -vvv).

>> I sadly don't have a lot more to go on, but xdarklight on IRC (I believe ==
>> Martin, CC'd) confirmed the findings with a grab bag of USB devices he had
>> sitting around as well, and may be able to provide CONFIG_USB_DWC2_DEBUG
>> output.
>>
>> Any further guidance on where to look to debug this issue would be appreciated.
>>
>> As a sample, some devices which, when plugged in (either alone or together)
>> do not cause any USB device detection (see attached lsusb -v files):
>>
>> Samsung T7 USB 3 drive
>> Samsung-Branded Silicon Motion USB 3 Flash Drive
>>
>> Some devices which, when plugged in cause all USB devices to be detected:
>>
>> Mushkin-Branded Kingston USB 3 Flash Drive
>> Kingston-Branded Kingston USB 2 Flash Drive
>> USB-3 MicroSD Card reader (lsusb/testing by xdarklight)
>> SanDisk USB 3 Flash Drive (lsusb/testign by xdkarlight)
> 
> This could simply be a question of power.  Most of the flash drives and
> the card reader probably don't require very much power, whereas some of
> them need more.  You can this, to some extent, in the MaxPower fields of
> the lsusb -v listings.

That seems strange, though, given that the first group of devices appear and work totally fine, but only when something 
from the second group of devices is plugged in. If the second group is not present, then the first group of devices do 
not appear at all.

> Do things work better if you plug these devices into a powered hub
> rather than directly into the computer?  If the hub can provide the
> power that these devices need, the computer won't be overloaded.

I don't have a powered hub handy, sadly. Maybe Martin does and can comment when he wakes.

Matt
