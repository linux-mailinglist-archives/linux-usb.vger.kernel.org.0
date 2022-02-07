Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7D34AC6F0
	for <lists+linux-usb@lfdr.de>; Mon,  7 Feb 2022 18:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbiBGRNc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Feb 2022 12:13:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237790AbiBGRBz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Feb 2022 12:01:55 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF85C0401D3
        for <linux-usb@vger.kernel.org>; Mon,  7 Feb 2022 09:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=BlVv/kxMhy9BuFCwu2MdazSOGWGaCFgZHfQJJ3D3lxk=; b=cdNU9hKfN8PmcF7hw6GZ1cV+yO
        SkparZhbF+TruIsVIPj0cERO/TnW3CraqHPe29OKvAdQ4EZqlkjbpbqnQd+RzQ0L03sf7Wfnuwv9H
        4qBOaTjH7bY3YVosli2o+gfv0ejl1wPhkEDRwZvBzDm0M1Uf4RtGTghl5drLtsQLhCJyaisG/GjsP
        DvRlf3uKbs5HXDZdEzZeiNJ7JWbizvGqXxwEPeYmRYQU/67KlzzXNVZhufEmfHVW83H4kAOXh4Xr4
        KbI+oawUE5H8Wly44HO/GpXmPk76NDQtaDOqulWAAjsyW7ScJhn0MMTebyry3NyZZX8wooQM0zIeU
        o+EuUB+w==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nH7Oj-001X7k-49; Mon, 07 Feb 2022 17:01:53 +0000
Message-ID: <7702d384-a0ce-51a5-221d-9241a9453d5e@infradead.org>
Date:   Mon, 7 Feb 2022 09:01:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: long ucsi_acpi_platform_driver_init
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
References: <b9993432-0192-f546-bf67-bb462f51e209@infradead.org>
 <YgED7x4tylyFzvsR@kuha.fi.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <YgED7x4tylyFzvsR@kuha.fi.intel.com>
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



On 2/7/22 03:35, Heikki Krogerus wrote:
> On Sun, Feb 06, 2022 at 05:28:48PM -0800, Randy Dunlap wrote:
>> Hi,
>>
>> On my custom 5.16, 5.17-rc1, and 5.17-rc2 kernels I am seeing
>> ucsi_acpi_platform_driver_init() take around 60 seconds.
>>
>> [    2.733138] calling  ucsi_acpi_platform_driver_init+0x0/0x1000 [ucsi_acpi] @ 470
>> [   64.603126] initcall ucsi_acpi_platform_driver_init+0x0/0x1000 [ucsi_acpi] returned 0 after 58690601 usecs
> 
> I don't have any ideas what could be causing it to take that long?
> That driver does not really do anything else except it queues a work
> that then actually initialises the UCSI interface. The probe() in that
> driver (ucsi_acpi) does not stay and wait for the initialisation to
> finish.
> 
> Can you check are the USB Type-C devices appearing under
> /sys/class/typec faster then that?

One entry there:

lrwxrwxrwx 1 root root 0 Feb  7 08:57 port0 -> ../../devices/platform/USBC000:00/typec/port0/

Do you want more than that?

> Also, if the driver is a module, can you check does it always take
> that long if you unload and the reload the module (ucsi_acpi.ko)?
> 
>> Did I miss some other (needed) Kconfig option or is something missing in
>> my system's ACPI tables e.g.?
> 
> There shouldn't be any dependencies that are missing, but it would not
> hurt to take a look at your acpi tables. Can you send acpidump?
> 
> Though, I doubt there is anything missing from there either.
> 
>> DMI: Dell Inc. Inspiron 15 5510/076F7Y, BIOS 2.4.1 11/05/2021

The (large) acpidump output is here:
  http://www.infradead.org/~rdunlap/doc/dell15-acpidump.out.gz


thanks.
-- 
~Randy
