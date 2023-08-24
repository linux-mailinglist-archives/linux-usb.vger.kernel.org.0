Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9AF0787606
	for <lists+linux-usb@lfdr.de>; Thu, 24 Aug 2023 18:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242719AbjHXQvd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Aug 2023 12:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242724AbjHXQvJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Aug 2023 12:51:09 -0400
Received: from mp-relay-02.fibernetics.ca (mp-relay-02.fibernetics.ca [208.85.217.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075101B9
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 09:51:06 -0700 (PDT)
Received: from mailpool-fe-01.fibernetics.ca (mailpool-fe-01.fibernetics.ca [208.85.217.144])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mp-relay-02.fibernetics.ca (Postfix) with ESMTPS id 196D67671D;
        Thu, 24 Aug 2023 16:51:06 +0000 (UTC)
Received: from localhost (mailpool-mx-01.fibernetics.ca [208.85.217.140])
        by mailpool-fe-01.fibernetics.ca (Postfix) with ESMTP id 0C35E41783;
        Thu, 24 Aug 2023 16:51:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Score: -0.2
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Received: from mailpool-fe-01.fibernetics.ca ([208.85.217.144])
        by localhost (mail-mx-01.fibernetics.ca [208.85.217.140]) (amavisd-new, port 10024)
        with ESMTP id 5jLpviUAfafW; Thu, 24 Aug 2023 16:51:05 +0000 (UTC)
Received: from [192.168.48.17] (host-104-157-193-42.dyn.295.ca [104.157.193.42])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dgilbert@interlog.com)
        by mail.ca.inter.net (Postfix) with ESMTPSA id 689DE41781;
        Thu, 24 Aug 2023 16:51:05 +0000 (UTC)
Message-ID: <58409169-dc24-accc-46e8-13402cd93f79@interlog.com>
Date:   Thu, 24 Aug 2023 12:51:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Reply-To: dgilbert@interlog.com
Subject: Re: [RFC PATCH 0/2] usb: Link USB devices with their USB Type-C
 partner counterparts
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Benson Leung <bleung@google.com>,
        Jameson Thies <jthies@google.com>,
        Prashant Malani <pmalani@google.com>,
        Won Chung <wonchung@google.com>, linux-usb@vger.kernel.org
References: <20230822133205.2063210-1-heikki.krogerus@linux.intel.com>
 <860a352c-12da-25ce-5b9e-697382a93899@interlog.com>
 <ZOXJ2cs5dUBsSNjX@kuha.fi.intel.com>
Content-Language: en-CA
From:   Douglas Gilbert <dgilbert@interlog.com>
In-Reply-To: <ZOXJ2cs5dUBsSNjX@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2023-08-23 04:56, Heikki Krogerus wrote:
> Hi Douglas,
> 
> On Tue, Aug 22, 2023 at 10:52:12AM -0400, Douglas Gilbert wrote:
>> On 2023-08-22 09:32, Heikki Krogerus wrote:
>> On a related matter, I wonder why there aren't symlinks between typec ports
>> (under /sys/class/typec ) and/or the corresponding pd objects (under
>> /sys/class/usb_power_delivery ) to the related power_supply objects under
>> /sys/class/power_supply . For example under the latter directory I see:
>>      $ ls | more
>>      AC
>>      BAT0
>>      hidpp_battery_1
>>      ucsi-source-psy-USBC000:001
>>      ucsi-source-psy-USBC000:002
>>
>> Those last two power supplies are obviously connected to typec port0 and port1
>> (but offset by 1). Those power_supply objects hold inaccurate data which I hope
>> will improve in time. Significantly power_supply objects don't seem to report
>> the direction of the power. Here is a little utility I have been working on
>> to report the USB Type-C port/pd disposition on my machine:
>>      $ lsucpd
>>      port0 [pd0]  > {5V, 0.9A}
>>      port1 [pd1]  <<===  partner: [pd8]
>>
>> My laptop (Thinkpad X13 G3) has two type-C ports and port1 is a sink with a
>> PD contract. I would like that second line to have 20V, 3.25A appended to it
>> but there are several issues:
>>    - no typec or pd symlink to ucsi-source-psy-USBC000:002
>>    - that power supply_object says it is online (correct) with a voltage_now:
>>      5000000 uV (incorrect) and current_now: 3000000 uA (incorrect). See below.
>>
>>    ucsi-source-psy-USBC000:002 $ ls_name_value
>>      current_max : 3250000
>>      current_now : 3000000
>>      online : 1
>>      scope : Unknown
>>      type : USB
>>      uevent : <removed>
>>      usb_type : C [PD] PD_PPS
>>      voltage_max : 20000000
>>      voltage_min : 5000000
>>      voltage_now : 5000000
> 
> I'm glad you brought that up. The major problem with the Type-C power
> supplies is that the Type-C connector class does not actually take
> care of them. They are all registered by the device drivers, and all
> of them seem to expose different kind of information. In your case the
> power supplies are registered by the UCSI driver, and the above may
> indicate a bug in that driver.

Hi,
Thanks for the background.

My X13 Gen 3 (i5-1240P) uses the typec_ucsi and ucsi_acpi modules. Some time
back in a post you explained how to use debugfs with ucsi. Following that
procedure, just after a 20 Volt PD contract is negotiated on port 0 I see:

     # cat /sys/kernel/debug/tracing/trace
     ....
      kworker/0:1-18718   [000] ..... 137813.407189: ucsi_connector_change:
         port0 status: change=0000, opmode=5, connected=1, sourcing=0,
         partner_flags=1, partner_type=1,
         request_data_obj=1304b12c, BC status=1

That RDO is incorrect, the top nibble (1) is the index of the default Vsafe5v
PDO. The correct PDO index would be 4 in this case. The source is an Apple 140W
USB-C power adapter so I doubt that it is breaking any PD 3.0/3.1 protocol
rules.

According the a PD analyzer (km002c) only one Request is sent by the sink:
82 10 d6 59 87 43 which it decodes as "Pos: 4 Fixed: 20V, 4.7A" which is
Accepted and 200 ms later a PS RDY is sent by the source and Vbus
transitions from from 5.17 Volts to 20.4 Volts. So I can see no Request for
PDO index 1 being sent.

With acpi_listen the following traffic occurs just after the power adapter
is plugged into port 0:
   battery PNP0C0A:00 00000080 00000001
   battery PNP0C0A:00 00000080 00000001
   ibm/hotkey LEN0268:00 00000080 00006032
   ac_adapter ACPI0003:00 00000080 00000001
   ac_adapter ACPI0003:00 00000080 00000001
   ibm/hotkey LEN0268:00 00000080 00006030
   thermal_zone LNXTHERM:00 00000081 00000000
   ibm/hotkey LEN0268:00 00000080 00006030
   thermal_zone LNXTHERM:00 00000081 00000000

Hope this helps if you find time to look at this.

Doug Gilbert

> To improve the situation, I originally proposed that instead of
> adding a separate device class for USB Power Delivery objects, we
> would utilise the already existing power supply class. That proposal
> was not seen acceptable by many (including Benson if I recall), and I
> now tend to agree with that because of several reasons, starting from
> the fact that USB PD objects supply other informations on top of power
> delivery details (so completely unrelated to PM).
> 
> Even before that I had proposed that the Type-C connector class could
> supply API for the drivers to take care of the registration of the
> power supplies. I proposed that not only the Type-C ports should
> register the power supplies but also the partners should represent
> their own power supplies. That would make things much more clear for
> the user space IMO. The port and partner would always create a "chain"
> of supplies where the other is the supply the other the sink of power.
> That is already supported by the power supply class. For some reason
> this proposal was also not seen as a good idea at the time, but it may
> be that I just failed to explain it properly.
> 
> Nevertheless, I still think that that is exactly how the Type-C power
> supplies should be always presented - separate supplies for both ports
> and partners - and that obviously the Type-C connector class should
> take care of those supplies so that they always supply the same
> information. Unfortunately I do not have any time at the moment to
> work on this right now.
> 
> Br,
> 

