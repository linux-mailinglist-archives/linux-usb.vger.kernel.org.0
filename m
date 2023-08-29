Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C03278CC4F
	for <lists+linux-usb@lfdr.de>; Tue, 29 Aug 2023 20:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234299AbjH2Smp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Aug 2023 14:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237648AbjH2Smg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Aug 2023 14:42:36 -0400
Received: from mp-relay-01.fibernetics.ca (mp-relay-01.fibernetics.ca [208.85.217.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7A419A
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 11:42:31 -0700 (PDT)
Received: from mailpool-fe-02.fibernetics.ca (mailpool-fe-02.fibernetics.ca [208.85.217.145])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mp-relay-01.fibernetics.ca (Postfix) with ESMTPS id 7E559E17DB;
        Tue, 29 Aug 2023 18:42:30 +0000 (UTC)
Received: from localhost (mailpool-mx-01.fibernetics.ca [208.85.217.140])
        by mailpool-fe-02.fibernetics.ca (Postfix) with ESMTP id 695EA60316;
        Tue, 29 Aug 2023 18:42:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Score: -0.2
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Received: from mailpool-fe-02.fibernetics.ca ([208.85.217.145])
        by localhost (mail-mx-01.fibernetics.ca [208.85.217.140]) (amavisd-new, port 10024)
        with ESMTP id IekaZJh39Ma0; Tue, 29 Aug 2023 18:42:30 +0000 (UTC)
Received: from [192.168.48.17] (host-104-157-193-42.dyn.295.ca [104.157.193.42])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dgilbert@interlog.com)
        by mail.ca.inter.net (Postfix) with ESMTPSA id ABD3E603E4;
        Tue, 29 Aug 2023 18:42:29 +0000 (UTC)
Message-ID: <c12b1eb4-a437-38fe-6abe-fdbe753739ea@interlog.com>
Date:   Tue, 29 Aug 2023 14:42:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Reply-To: dgilbert@interlog.com
Subject: Re: [RFC PATCH 0/2] usb: Link USB devices with their USB Type-C
 partner counterparts
Content-Language: en-CA
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Benson Leung <bleung@google.com>,
        Jameson Thies <jthies@google.com>,
        Prashant Malani <pmalani@google.com>,
        Won Chung <wonchung@google.com>, linux-usb@vger.kernel.org
References: <20230822133205.2063210-1-heikki.krogerus@linux.intel.com>
 <860a352c-12da-25ce-5b9e-697382a93899@interlog.com>
 <ZOXJ2cs5dUBsSNjX@kuha.fi.intel.com>
 <58409169-dc24-accc-46e8-13402cd93f79@interlog.com>
 <ZOxnJxELyjZ7I5f5@kuha.fi.intel.com>
From:   Douglas Gilbert <dgilbert@interlog.com>
In-Reply-To: <ZOxnJxELyjZ7I5f5@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2023-08-28 05:21, Heikki Krogerus wrote:
> On Thu, Aug 24, 2023 at 12:51:04PM -0400, Douglas Gilbert wrote:
>> On 2023-08-23 04:56, Heikki Krogerus wrote:
>>> Hi Douglas,
>>>
>>> On Tue, Aug 22, 2023 at 10:52:12AM -0400, Douglas Gilbert wrote:
>>>> On 2023-08-22 09:32, Heikki Krogerus wrote:
>>>> On a related matter, I wonder why there aren't symlinks between typec ports
>>>> (under /sys/class/typec ) and/or the corresponding pd objects (under
>>>> /sys/class/usb_power_delivery ) to the related power_supply objects under
>>>> /sys/class/power_supply . For example under the latter directory I see:
>>>>       $ ls | more
>>>>       AC
>>>>       BAT0
>>>>       hidpp_battery_1
>>>>       ucsi-source-psy-USBC000:001
>>>>       ucsi-source-psy-USBC000:002
>>>>
>>>> Those last two power supplies are obviously connected to typec port0 and port1
>>>> (but offset by 1). Those power_supply objects hold inaccurate data which I hope
>>>> will improve in time. Significantly power_supply objects don't seem to report
>>>> the direction of the power. Here is a little utility I have been working on
>>>> to report the USB Type-C port/pd disposition on my machine:
>>>>       $ lsucpd
>>>>       port0 [pd0]  > {5V, 0.9A}
>>>>       port1 [pd1]  <<===  partner: [pd8]
>>>>
>>>> My laptop (Thinkpad X13 G3) has two type-C ports and port1 is a sink with a
>>>> PD contract. I would like that second line to have 20V, 3.25A appended to it
>>>> but there are several issues:
>>>>     - no typec or pd symlink to ucsi-source-psy-USBC000:002
>>>>     - that power supply_object says it is online (correct) with a voltage_now:
>>>>       5000000 uV (incorrect) and current_now: 3000000 uA (incorrect). See below.
>>>>
>>>>     ucsi-source-psy-USBC000:002 $ ls_name_value
>>>>       current_max : 3250000
>>>>       current_now : 3000000
>>>>       online : 1
>>>>       scope : Unknown
>>>>       type : USB
>>>>       uevent : <removed>
>>>>       usb_type : C [PD] PD_PPS
>>>>       voltage_max : 20000000
>>>>       voltage_min : 5000000
>>>>       voltage_now : 5000000
>>>
>>> I'm glad you brought that up. The major problem with the Type-C power
>>> supplies is that the Type-C connector class does not actually take
>>> care of them. They are all registered by the device drivers, and all
>>> of them seem to expose different kind of information. In your case the
>>> power supplies are registered by the UCSI driver, and the above may
>>> indicate a bug in that driver.
>>
>> Hi,
>> Thanks for the background.
>>
>> My X13 Gen 3 (i5-1240P) uses the typec_ucsi and ucsi_acpi modules. Some time
>> back in a post you explained how to use debugfs with ucsi. Following that
>> procedure, just after a 20 Volt PD contract is negotiated on port 0 I see:
>>
>>      # cat /sys/kernel/debug/tracing/trace
>>      ....
>>       kworker/0:1-18718   [000] ..... 137813.407189: ucsi_connector_change:
>>          port0 status: change=0000, opmode=5, connected=1, sourcing=0,
>>          partner_flags=1, partner_type=1,
>>          request_data_obj=1304b12c, BC status=1
>>
>> That RDO is incorrect, the top nibble (1) is the index of the default Vsafe5v
>> PDO. The correct PDO index would be 4 in this case. The source is an Apple 140W
>> USB-C power adapter so I doubt that it is breaking any PD 3.0/3.1 protocol
>> rules.
> 
> The driver reads the RDO from the UCSI interface, so if it's wrong,
> there is possibly a problem in the Embedded Controller firmware :-(.
> 
>> According the a PD analyzer (km002c) only one Request is sent by the sink:
>> 82 10 d6 59 87 43 which it decodes as "Pos: 4 Fixed: 20V, 4.7A" which is
>> Accepted and 200 ms later a PS RDY is sent by the source and Vbus
>> transitions from from 5.17 Volts to 20.4 Volts. So I can see no Request for
>> PDO index 1 being sent.
>>
>> With acpi_listen the following traffic occurs just after the power adapter
>> is plugged into port 0:
>>    battery PNP0C0A:00 00000080 00000001
>>    battery PNP0C0A:00 00000080 00000001
>>    ibm/hotkey LEN0268:00 00000080 00006032
>>    ac_adapter ACPI0003:00 00000080 00000001
>>    ac_adapter ACPI0003:00 00000080 00000001
>>    ibm/hotkey LEN0268:00 00000080 00006030
>>    thermal_zone LNXTHERM:00 00000081 00000000
>>    ibm/hotkey LEN0268:00 00000080 00006030
>>    thermal_zone LNXTHERM:00 00000081 00000000
>>
>> Hope this helps if you find time to look at this.
> 
> Thank you. I'll try to reproduce the issue this week, but I don't have
> that exact model of Thinkpad available I'm afraid (UCSI tends to
> behave a little bit differently on every single platform).

Could it be a CPU generation thing? My CPU is 12th generation (2022) and
there is another report of a Lenovo P15gen2 (11th generation 2021 I assume)
not reporting PDOs at all. I have an older Dell XPS 9380 which has an 8th
generation CPU (3 USB-C port and no Type A ports) that has no UCSI support.
So do PDOs and the active RDO get properly reported on 13th generation
CPUs?

Doug Gilbert
