Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79C754B061C
	for <lists+linux-usb@lfdr.de>; Thu, 10 Feb 2022 07:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234828AbiBJGLk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Feb 2022 01:11:40 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234038AbiBJGLj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Feb 2022 01:11:39 -0500
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647DF10CB
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 22:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=D0GvVMhwp2o7VNeroeOQSD9yjzvlbNbfjJ9MkBkzfnw=; b=nksprf82BgcZueOm7WCsrLvwJy
        B9VJyWPDAAKHtw2AEme/ztKF06sztRXSHkygAjD+MdQiyvR8/CugZIh2V9NgVfVsAz0XYmi+Tscrh
        bA2J9VrvLNKOixIzrs2CGGlG/xq0zOhRDde+Pq6llcuqgEkgOva2DLAnZSO1KfMpZxsF2O+Hi6P0V
        tgsbvHAfX8QIntA7WOqS9S1iH19ZC1tBVEqwE7rsn9RnpsQwgS0skHlcP3WoCDZW98ebZqxH5JEvi
        vpEdiVYKjVAP/pM4javwrRyXxbcjm095ixSaL384b/NExCRwMxq0p4oUi4rplwoWVQe+9Qz1SN5Cq
        0d8ue5rw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nI2g5-008cro-TO; Thu, 10 Feb 2022 06:11:38 +0000
Message-ID: <6256a6e5-cb82-48d9-3012-76750bedab3f@infradead.org>
Date:   Wed, 9 Feb 2022 22:11:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: long ucsi_acpi_platform_driver_init
Content-Language: en-US
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
References: <b9993432-0192-f546-bf67-bb462f51e209@infradead.org>
 <YgED7x4tylyFzvsR@kuha.fi.intel.com>
 <7702d384-a0ce-51a5-221d-9241a9453d5e@infradead.org>
 <YgPROWZkZlIo0ZnU@kuha.fi.intel.com>
 <4c7bb41f-2639-2acc-1b35-e16c0fb9dad2@infradead.org>
In-Reply-To: <4c7bb41f-2639-2acc-1b35-e16c0fb9dad2@infradead.org>
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

Hi again,

On 2/9/22 09:14, Randy Dunlap wrote:
> Hi,
> 
> On 2/9/22 06:35, Heikki Krogerus wrote:
>> On Mon, Feb 07, 2022 at 09:01:50AM -0800, Randy Dunlap wrote:
>>>
>>>
>>> On 2/7/22 03:35, Heikki Krogerus wrote:
>>>> On Sun, Feb 06, 2022 at 05:28:48PM -0800, Randy Dunlap wrote:
>>>>> Hi,
>>>>>
>>>>> On my custom 5.16, 5.17-rc1, and 5.17-rc2 kernels I am seeing
>>>>> ucsi_acpi_platform_driver_init() take around 60 seconds.
>>>>>
>>>>> [    2.733138] calling  ucsi_acpi_platform_driver_init+0x0/0x1000 [ucsi_acpi] @ 470
>>>>> [   64.603126] initcall ucsi_acpi_platform_driver_init+0x0/0x1000 [ucsi_acpi] returned 0 after 58690601 usecs
>>>>
>>>> I don't have any ideas what could be causing it to take that long?
>>>> That driver does not really do anything else except it queues a work
>>>> that then actually initialises the UCSI interface. The probe() in that
>>>> driver (ucsi_acpi) does not stay and wait for the initialisation to
>>>> finish.
>>>>
>>>> Can you check are the USB Type-C devices appearing under
>>>> /sys/class/typec faster then that?
>>>
>>> One entry there:
>>>
>>> lrwxrwxrwx 1 root root 0 Feb  7 08:57 port0 -> ../../devices/platform/USBC000:00/typec/port0/
>>>
>>> Do you want more than that?
>>
>> You should have a port there for every physical USB Type-C
>> port on you system.
> 
> Yes, I have only one Type-C port.
> 
>> I can't really tell from that was the port registered before
>> ucsi_acpi_platform_driver_init() finished or not.
> 
> Sorry, I didn't understand the first time...
> 
> I rebooted and checked /sys/class/typec multiple times. It was empty until
> the end of ucsi_acpi_platform_driver_init() roughly 55 seconds later.
> 

Good news. Pretty sure that it's not a problem with ucsi_acpi code.

I noticed that there were a few kernel log messages about firmware loading
near the ucsi_acpi init messages so I looked at my kernel's config options.

I had this one set/enabled:

config FW_LOADER_USER_HELPER_FALLBACK
	bool "Force the firmware sysfs fallback mechanism when possible"
	depends on FW_LOADER_USER_HELPER
	help
...
	  If you are unsure about this, say N here.

After disabling it, there is no significant delay in ucsi_acpi_platform_driver_init.

I'm happy to blame it on this kernel config option.


cheers.
-- 
~Randy
