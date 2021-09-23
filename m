Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4774162BA
	for <lists+linux-usb@lfdr.de>; Thu, 23 Sep 2021 18:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242377AbhIWQH5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Sep 2021 12:07:57 -0400
Received: from mail.huberulrich.de ([81.169.200.209]:35733 "EHLO
        mail.huberulrich.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbhIWQH4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Sep 2021 12:07:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=huberulrich.de; s=2017; c=relaxed/relaxed;
 q=dns/txt; h=from:date:to:cc:message-id:subject;
 bh=IinKTHutqTynAe0GMpUqZp0BlIUeR8DbMiFutU16tBc=;
 b=ijRyuL8UpT2Pc/T4uNPJsZPVERq5+Wm99N0j3NkvdfohMFbjhTugodI+VTmcWMWxmS2izMJiNOvCrbDWx8G1dmegLYsY09OK9MwT6S27MC9GWcsMCCM/7mmxwOl74J7WRypDgVzui9cTn4NOFAoMLs/zhzo25sGirOMjQ15ILoGQ5hiky+wisyVp/e9tDLj4jNX95ELlli1X+XpeFNRYgcYuin3V2cn6ED+af45rS6DTzDEgtwTwa7ZXPGKkrWxVpWIeGLW19kGx7jZM49X12jIN7r5Sbi4lVNNfK0UVMPcHVHvfK4k2OfyqkUXvU+cFrysf1MtRynHVNT794Nlvyw==;
DomainKey-Signature: a=rsa-sha1;
 b=Y2YRmPNt0WWm235jU0MXu7RedDe5AN90dawkQ4ylKmFODb6uULW70/PrO/hAGz4xZkbVDs8fvSe1V3HUZcNKEcD6bDFYoqKFJ+TwIt++vndYr1YNKJKrk0xGQ9+oSaCYgoRoUAJS0tFazvfgwpmpOnyBd1WFI+W3ySzEKj8OxCmzPXo9j2+8NIIG8jl+bG32Pu3s09gjJMSxRp6YFXESSNLUSWJCqsEjt8Ug1YuCasmp7RGIClZJnWU5Jqs8nANElA2Z4+Gk0W600V3Q1OOnFRK+Sx1/wiEYuud7jNnnFxA4PUWTdthYc7hIViD5+2oYukHuXOB+fmfVhuVVI7aLgQ==;
 c=nofws; q=dns; d=huberulrich.de; s=2017;
 h=message-id:date:subject:to:cc:from;
Received: from [IPV6:2001:16b8:2d0f:eb00:1866:a3d7:adcc:55d6]
 (2001:16b8:2d0f:eb00:1866:a3d7:adcc:55d6) by mail.huberulrich.de (Axigen)
 with (ECDHE-RSA-AES128-GCM-SHA256 encrypted) ESMTPSA id 1B91D7;
 Thu, 23 Sep 2021 16:06:21 +0000
Message-ID: <401db7b6-1ee2-d585-f76f-bdd4577224c2@huberulrich.de>
Date:   Thu, 23 Sep 2021 18:06:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [PATCH 0/7] usb: typec: ucsi: Driver improvements
Content-Language: en-US
To:     Benjamin Berg <bberg@redhat.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <20210920142419.54493-1-heikki.krogerus@linux.intel.com>
 <52591c12693733a3caf11d2bb5999acdfe177054.camel@redhat.com>
From:   Ulrich Huber <ulrich@huberulrich.de>
In-Reply-To: <52591c12693733a3caf11d2bb5999acdfe177054.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: 
X-AXIGEN-SPF-Result: Ok
X-AXIGEN-DK-Result: Ok
DomainKey-Status: good
X-AXIGEN-DKIM-Result: Ok
DKIM-Status: good
X-AxigenSpam-Level: 9
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Am 23.09.21 um 16:38 schrieb Benjamin Berg:
> Hi,
>
> On Mon, 2021-09-20 at 17:24 +0300, Heikki Krogerus wrote:
>> The goal of this series was to improve the alt mode handling in the
>> driver, but now it seems that we can use the "poll worker" that was
>> introduced for that to handle other tasks better as well.
>>
>> Ulrich reported some problems that are caused by the second
>> GET_CONNECTOR_STATUS right after the first one that was introduced in
>> 217504a05532 ("usb: typec: ucsi: Work around PPM losing change
>> information"). In the last patch I try to improve that workaround by
>> extracting it out of the generic event handler into its own task and
>> executing it only when it's really needed. That seems to improve the
>> situation.
>>
>> These patches definitely improve the quality of the driver by making
>> it a bit more readable, but they also appear to make the behaviour a
>> bit more predictably and uniform on different platforms.
>>
>> Benjamin, can you test these?
> I just gave this a spin on a X1 Carbon Gen 8 with a Lenovo TB 3 Dock.
> Unfortunately, I can still reproduce the issue occasionally. My take is
> that the rate is much lower than it was before my patch was introduced.
> However, unfortunately the patchset does appear to cause a regression
> on the machine I tested.
>
> As before. The "online" status of the UCSI power supply is reported as
> "1" occasionally even after the cable was unplugged. And the issue
> seems to only happens with a dock, not if I use a USB-C charger.
>
> Benjamin

 From my point of view the patch set is still a huge improvement to the 
current state of the driver. Before it, the status of the UCSI power 
supply was unpredictable when using an USB-C charger with my Lenovo Yoga 
9i.

I do still get error messages in the kernel log right after waking from 
suspend occasionally, but I have not yet found reproducible steps. Most 
likely it has something to do with the controller being in an invalid 
state after waking from suspension. Though even then the status of the 
UCSI power supply is correct when this happens.


Ulrich


>
>> Heikki Krogerus (7):
>>    usb: typec: ucsi: Always cancel the command if PPM reports BUSY
>>      condition
>>    usb: typec: ucsi: Don't stop alt mode registration on busy condition
>>    usb: typec: ucsi: Add polling mechanism for partner tasks like alt
>>      mode checking
>>    usb: typec: ucsi: acpi: Reduce the command completion timeout
>>    usb: typec: ucsi: Check the partner alt modes always if there is PD
>>      contract
>>    usb: typec: ucsi: Read the PDOs in separate work
>>    usb: typec: ucsi: Better fix for missing unplug events issue
>>
>>   drivers/usb/typec/ucsi/ucsi.c      | 337 ++++++++++++++---------------
>>   drivers/usb/typec/ucsi/ucsi.h      |   3 +-
>>   drivers/usb/typec/ucsi/ucsi_acpi.c |   2 +-
>>   3 files changed, 167 insertions(+), 175 deletions(-)
>>
