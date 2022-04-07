Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E72474F7DA5
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 13:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232102AbiDGLOY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 7 Apr 2022 07:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbiDGLOW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 07:14:22 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7071DB1C8
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 04:12:21 -0700 (PDT)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 123A4CE4CA
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 11:05:53 +0000 (UTC)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id DF9BF240003;
        Thu,  7 Apr 2022 11:05:45 +0000 (UTC)
Message-ID: <da557b84330a2fc5ace11ca9436de9351149ddce.camel@hadess.net>
Subject: Re: device type in apple-mfi-fastcharfe
From:   Bastien Nocera <hadess@hadess.net>
To:     Oliver Neukum <oneukum@suse.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Date:   Thu, 07 Apr 2022 13:05:39 +0200
In-Reply-To: <b0b97178-80ec-65f9-9ae9-7f72ffc6af74@suse.com>
References: <b0b97178-80ec-65f9-9ae9-7f72ffc6af74@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2022-04-07 at 12:40 +0200, Oliver Neukum wrote:
> Hi,
> 
> looking at this bug report:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=215799
> 
> I had an occasion to look at the way it registers the charger.
> In particular:
>  .type                   = POWER_SUPPLY_TYPE_BATTERY,
> 
> That seems kind of wrong. It does not contain a battery, does it? The
> type seems to confound user space. Is there some deeper reason? If
> not
> how about the attached patch? Regards Oliver

The "apple-mfi-fastcharge" driver gets registered for a lot of Apple
iOS devices plugged in through USB, and those devices definitely
contain a battery.

I'm going to hazard a guess that the script in question doesn't check
the power_supply "scope" property, which means it thinks any battery
plugged in to the machine is a battery that powers the machine. That's
not the case.

POWER_SUPPLY_TYPE_USB also seems to only be used by USB ports[1] that
are used to charge the machine itself (so a "system" scope), like the
USB port on a phone, not for devices connected through USB (of which
there are a lot).

[1]: Except for drivers/hid/wacom_sys.c, which looks incorrect
Benjamin, so this?

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 066c567dbaa2..620fe74f5676 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -1777,7 +1777,7 @@ static int __wacom_initialize_battery(struct
wacom *wacom,
        bat_desc->get_property = wacom_battery_get_property;
        sprintf(battery->bat_name, "wacom_battery_%ld", n); 
        bat_desc->name = battery->bat_name;
-       bat_desc->type = POWER_SUPPLY_TYPE_USB;
+       bat_desc->type = POWER_SUPPLY_TYPE_BATTERY;
        bat_desc->use_for_apm = 0;
 
        ps_bat = devm_power_supply_register(dev, bat_desc, &psy_cfg);

