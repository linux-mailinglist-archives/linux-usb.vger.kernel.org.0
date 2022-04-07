Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B16934F7E36
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 13:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237578AbiDGLpJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 07:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238471AbiDGLpH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 07:45:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3B664F2127
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 04:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649331786;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0K5rU3zkVKMeALXO/AuEvhFr6Rksz4114UriEdK5CJE=;
        b=E1QtiVla8YW113fM8uqNF8lH3QKFerLMWpRd8ghMm1mCOBGF8ZUBdAcmvhRV2KxwGsPlNF
        poAk2/8c6+5aa+zEfGHYf1B8cfGg9varUF/YYN5J4OFBJuvpsRSS8w39oPLgf21HuuWrFQ
        7LOURiXf7yA6UCMa6LngH5VYtXUDJMI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-Yr6GnNFYMnaHyPluT5186Q-1; Thu, 07 Apr 2022 07:43:05 -0400
X-MC-Unique: Yr6GnNFYMnaHyPluT5186Q-1
Received: by mail-pl1-f200.google.com with SMTP id s5-20020a170902b18500b00155d6fbf4d4so2674454plr.18
        for <linux-usb@vger.kernel.org>; Thu, 07 Apr 2022 04:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0K5rU3zkVKMeALXO/AuEvhFr6Rksz4114UriEdK5CJE=;
        b=RNeX+vFKMjTmzXsgDSrOpKTyxVqkVmcnwYvKi9TX4ZgkTGFy5XvTVKYh04f/nwBYfo
         jIHr9VMSrOJBijgjEQyMCsssLfdBYo3zd/kJ4KoUaDLhG9Yrc9I9eswHqSCV2CcURszU
         oDBGx6y7oOUfu3LHax4aXEgvlWP3Ndaa+hyYYX/n5J8XKnRv6vsKxog7FyBzM4UmCc4h
         RCbv6C7eXWDGzWAyqKhLQQA0Of21SeXgbwfVC8+axQGNM3R8nD8gsXM53QaUlH877f4i
         SmAilukjyDJkgu4xH7+f+W25R9eQfx/2TBHfrko/fbxLk/bWFSGNT4H05AYcU803kNKd
         LkKg==
X-Gm-Message-State: AOAM53145e3vWKC0tsUnui4D67BsOyHxkeR2ToJDtQV9cbImaK04Tbxm
        i7eXBg9Xxz94boncxuDEJlnXfXx832qAhF+EhdwyfPbX9hRhfjT8dDKD17gpmCRqN54dUQo2DhO
        Ir4g5KQXkhNh/Bj4vKQYs1ougAUPcZfoVV0mv
X-Received: by 2002:a65:5a43:0:b0:399:53e1:f299 with SMTP id z3-20020a655a43000000b0039953e1f299mr11005297pgs.146.1649331783835;
        Thu, 07 Apr 2022 04:43:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQvuMizE6/5kcEVDLbG2KuzoGdm6FO0JNrD6Yu8qQTc9tYBzD5JC/Bq4g8SZ4JWjKr+ipaeXASfYL4JHyF50E=
X-Received: by 2002:a65:5a43:0:b0:399:53e1:f299 with SMTP id
 z3-20020a655a43000000b0039953e1f299mr11005281pgs.146.1649331783590; Thu, 07
 Apr 2022 04:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <b0b97178-80ec-65f9-9ae9-7f72ffc6af74@suse.com> <da557b84330a2fc5ace11ca9436de9351149ddce.camel@hadess.net>
In-Reply-To: <da557b84330a2fc5ace11ca9436de9351149ddce.camel@hadess.net>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 7 Apr 2022 13:42:52 +0200
Message-ID: <CAO-hwJKEU=L96=Sa2ePrFFhmgZfpa8E4jgjps8XPv69bL7vayA@mail.gmail.com>
Subject: Re: device type in apple-mfi-fastcharfe
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Oliver Neukum <oneukum@suse.com>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 7, 2022 at 1:05 PM Bastien Nocera <hadess@hadess.net> wrote:
>
> On Thu, 2022-04-07 at 12:40 +0200, Oliver Neukum wrote:
> > Hi,
> >
> > looking at this bug report:
> >
> > https://bugzilla.kernel.org/show_bug.cgi?id=215799
> >
> > I had an occasion to look at the way it registers the charger.
> > In particular:
> >  .type                   = POWER_SUPPLY_TYPE_BATTERY,
> >
> > That seems kind of wrong. It does not contain a battery, does it? The
> > type seems to confound user space. Is there some deeper reason? If
> > not
> > how about the attached patch? Regards Oliver
>
> The "apple-mfi-fastcharge" driver gets registered for a lot of Apple
> iOS devices plugged in through USB, and those devices definitely
> contain a battery.
>
> I'm going to hazard a guess that the script in question doesn't check
> the power_supply "scope" property, which means it thinks any battery
> plugged in to the machine is a battery that powers the machine. That's
> not the case.
>
> POWER_SUPPLY_TYPE_USB also seems to only be used by USB ports[1] that
> are used to charge the machine itself (so a "system" scope), like the
> USB port on a phone, not for devices connected through USB (of which
> there are a lot).
>
> [1]: Except for drivers/hid/wacom_sys.c, which looks incorrect
> Benjamin, so this?

If the following patch doesn't break existing userspace and is the
"correct" way of reporting battery, sure, why not.

Cheers,
Benjamin

>
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 066c567dbaa2..620fe74f5676 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -1777,7 +1777,7 @@ static int __wacom_initialize_battery(struct
> wacom *wacom,
>         bat_desc->get_property = wacom_battery_get_property;
>         sprintf(battery->bat_name, "wacom_battery_%ld", n);
>         bat_desc->name = battery->bat_name;
> -       bat_desc->type = POWER_SUPPLY_TYPE_USB;
> +       bat_desc->type = POWER_SUPPLY_TYPE_BATTERY;
>         bat_desc->use_for_apm = 0;
>
>         ps_bat = devm_power_supply_register(dev, bat_desc, &psy_cfg);
>

