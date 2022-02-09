Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4904AF7EC
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 18:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233404AbiBIROz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 12:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbiBIROy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 12:14:54 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0136C05CB87
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 09:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=XIhmtydogLh6cg1l/ZLk8sisI41jnSzC1z46gs9JEjw=; b=uSkqM7cpeFyyxnZ2sIJ5dpgmR6
        pbGjg7hDtO/C1WzUw2yUSpfqYjs2h5XRaujMYOwV9wCZQj5r4U3m2+jSIcQ43PrybQRr5vA3d4Wfm
        AXouUw7feee4KTRC+Mzpw92NVx8y/iBjNPyOaItMjB678KtSjiNrJoWOuKIVtO9xS4WQBYbdJ6VHL
        7S6IZWGvmLn/pgyB17vvTe70cZRVbIvQBnXcmCFdam4k5xOMh/JCLI6xQgrtwNPzycCtXcoc0NFuX
        0nVnOGOm3bcXMgUGYhXllwoImv03n/l94RDDBtVpvhP9cr+AxUjPuVzH4rA+LMIusx6w2HEvL94eQ
        vLXz6dUQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nHqYQ-008E02-GT; Wed, 09 Feb 2022 17:14:54 +0000
Message-ID: <4c7bb41f-2639-2acc-1b35-e16c0fb9dad2@infradead.org>
Date:   Wed, 9 Feb 2022 09:14:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: long ucsi_acpi_platform_driver_init
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
References: <b9993432-0192-f546-bf67-bb462f51e209@infradead.org>
 <YgED7x4tylyFzvsR@kuha.fi.intel.com>
 <7702d384-a0ce-51a5-221d-9241a9453d5e@infradead.org>
 <YgPROWZkZlIo0ZnU@kuha.fi.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <YgPROWZkZlIo0ZnU@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 2/9/22 06:35, Heikki Krogerus wrote:
> On Mon, Feb 07, 2022 at 09:01:50AM -0800, Randy Dunlap wrote:
>>
>>
>> On 2/7/22 03:35, Heikki Krogerus wrote:
>>> On Sun, Feb 06, 2022 at 05:28:48PM -0800, Randy Dunlap wrote:
>>>> Hi,
>>>>
>>>> On my custom 5.16, 5.17-rc1, and 5.17-rc2 kernels I am seeing
>>>> ucsi_acpi_platform_driver_init() take around 60 seconds.
>>>>
>>>> [    2.733138] calling  ucsi_acpi_platform_driver_init+0x0/0x1000 [ucsi_acpi] @ 470
>>>> [   64.603126] initcall ucsi_acpi_platform_driver_init+0x0/0x1000 [ucsi_acpi] returned 0 after 58690601 usecs
>>>
>>> I don't have any ideas what could be causing it to take that long?
>>> That driver does not really do anything else except it queues a work
>>> that then actually initialises the UCSI interface. The probe() in that
>>> driver (ucsi_acpi) does not stay and wait for the initialisation to
>>> finish.
>>>
>>> Can you check are the USB Type-C devices appearing under
>>> /sys/class/typec faster then that?
>>
>> One entry there:
>>
>> lrwxrwxrwx 1 root root 0 Feb  7 08:57 port0 -> ../../devices/platform/USBC000:00/typec/port0/
>>
>> Do you want more than that?
> 
> You should have a port there for every physical USB Type-C
> port on you system.

Yes, I have only one Type-C port.

> I can't really tell from that was the port registered before
> ucsi_acpi_platform_driver_init() finished or not.

Sorry, I didn't understand the first time...

I rebooted and checked /sys/class/typec multiple times. It was empty until
the end of ucsi_acpi_platform_driver_init() roughly 55 seconds later.


>>> Also, if the driver is a module, can you check does it always take
>>> that long if you unload and the reload the module (ucsi_acpi.ko)?
>>>
>>>> Did I miss some other (needed) Kconfig option or is something missing in
>>>> my system's ACPI tables e.g.?
>>>
>>> There shouldn't be any dependencies that are missing, but it would not
>>> hurt to take a look at your acpi tables. Can you send acpidump?
>>>
>>> Though, I doubt there is anything missing from there either.
>>>
>>>> DMI: Dell Inc. Inspiron 15 5510/076F7Y, BIOS 2.4.1 11/05/2021
>>
>> The (large) acpidump output is here:
>>   http://www.infradead.org/~rdunlap/doc/dell15-acpidump.out.gz
> 
> Thanks!
> 
> Br,
> 

-- 
~Randy
