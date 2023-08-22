Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237B97844DE
	for <lists+linux-usb@lfdr.de>; Tue, 22 Aug 2023 16:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237006AbjHVO71 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Aug 2023 10:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232185AbjHVO71 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Aug 2023 10:59:27 -0400
X-Greylist: delayed 431 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 07:59:25 PDT
Received: from mp-relay-02.fibernetics.ca (mp-relay-02.fibernetics.ca [208.85.217.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391A610B
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 07:59:25 -0700 (PDT)
Received: from mailpool-fe-02.fibernetics.ca (mailpool-fe-02.fibernetics.ca [208.85.217.145])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mp-relay-02.fibernetics.ca (Postfix) with ESMTPS id 897B0761A8;
        Tue, 22 Aug 2023 14:52:13 +0000 (UTC)
Received: from localhost (mailpool-mx-02.fibernetics.ca [208.85.217.141])
        by mailpool-fe-02.fibernetics.ca (Postfix) with ESMTP id 6FC7060A46;
        Tue, 22 Aug 2023 14:52:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Score: -0.2
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Received: from mailpool-fe-02.fibernetics.ca ([208.85.217.145])
        by localhost (mail-mx-02.fibernetics.ca [208.85.217.141]) (amavisd-new, port 10024)
        with ESMTP id lxD4vK63rRjA; Tue, 22 Aug 2023 14:52:13 +0000 (UTC)
Received: from [192.168.48.17] (host-104-157-193-42.dyn.295.ca [104.157.193.42])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dgilbert@interlog.com)
        by mail.ca.inter.net (Postfix) with ESMTPSA id AE8F660A42;
        Tue, 22 Aug 2023 14:52:12 +0000 (UTC)
Message-ID: <860a352c-12da-25ce-5b9e-697382a93899@interlog.com>
Date:   Tue, 22 Aug 2023 10:52:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Reply-To: dgilbert@interlog.com
Subject: Re: [RFC PATCH 0/2] usb: Link USB devices with their USB Type-C
 partner counterparts
Content-Language: en-CA
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Benson Leung <bleung@google.com>
Cc:     Jameson Thies <jthies@google.com>,
        Prashant Malani <pmalani@google.com>,
        Won Chung <wonchung@google.com>, linux-usb@vger.kernel.org
References: <20230822133205.2063210-1-heikki.krogerus@linux.intel.com>
From:   Douglas Gilbert <dgilbert@interlog.com>
In-Reply-To: <20230822133205.2063210-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2023-08-22 09:32, Heikki Krogerus wrote:
> Hi Benson,
> 
> RFC for now. I can't test these properly. If you guys could take over
> this, I would much appreciated. I hope this is at least close to your
> proposal.
> 
> With this (or something like it) you should be able to get
> notification about USB connections and disconnections to your port
> driver by implementing the new "attach" and "deattach" callbacks in
> struct typec_partner_desc. The typec partner devices will also have
> symlinks to the enumerated USB devices and vise versa.
> 
> I took a little shortcut and did not implement a proper device list.
> Instead there is now only a member for the USB2 device and a member
> for the USB3 device in struct typec_port, so with this only USB is
> supported. But the API does not deal with struct usb_device, so
> extending this to support other devices (TBT, Displayport, etc.) by
> adding the actual device list should be fairly easy.

On a related matter, I wonder why there aren't symlinks between typec ports
(under /sys/class/typec ) and/or the corresponding pd objects (under
/sys/class/usb_power_delivery ) to the related power_supply objects under
/sys/class/power_supply . For example under the latter directory I see:
     $ ls | more
     AC
     BAT0
     hidpp_battery_1
     ucsi-source-psy-USBC000:001
     ucsi-source-psy-USBC000:002

Those last two power supplies are obviously connected to typec port0 and port1
(but offset by 1). Those power_supply objects hold inaccurate data which I hope
will improve in time. Significantly power_supply objects don't seem to report
the direction of the power. Here is a little utility I have been working on
to report the USB Type-C port/pd disposition on my machine:
     $ lsucpd
     port0 [pd0]  > {5V, 0.9A}
     port1 [pd1]  <<===  partner: [pd8]

My laptop (Thinkpad X13 G3) has two type-C ports and port1 is a sink with a
PD contract. I would like that second line to have 20V, 3.25A appended to it
but there are several issues:
   - no typec or pd symlink to ucsi-source-psy-USBC000:002
   - that power supply_object says it is online (correct) with a voltage_now:
     5000000 uV (incorrect) and current_now: 3000000 uA (incorrect). See below.

   ucsi-source-psy-USBC000:002 $ ls_name_value
     current_max : 3250000
     current_now : 3000000
     online : 1
     scope : Unknown
     type : USB
     uevent : <removed>
     usb_type : C [PD] PD_PPS
     voltage_max : 20000000
     voltage_min : 5000000
     voltage_now : 5000000


Doug Gilbert




