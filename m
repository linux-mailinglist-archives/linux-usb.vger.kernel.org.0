Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30A1F647276
	for <lists+linux-usb@lfdr.de>; Thu,  8 Dec 2022 16:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiLHPG6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Dec 2022 10:06:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbiLHPGx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Dec 2022 10:06:53 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F80A9D2F1
        for <linux-usb@vger.kernel.org>; Thu,  8 Dec 2022 07:06:47 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so4923214pjp.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Dec 2022 07:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+79/rVNDN1N1SEjLcBAvHUJ9oDu58WUQ9a221hxPVg=;
        b=r6C6cM8tJS7nLq3dPhUaUvYuhBWqpXXoJBn9BftBTVhpB8h8uDfhlZj+q2OTBluKuS
         hcoaypjVnnA1BC0iA+54r/xIFhhwuyabeF8qQGDVdBV80fIK1NeDH88Vsc62OE8oQ5zc
         WU3+eyNwMEhUSF9o8vG9n2oS+E1RBR6tWoMly6RtmGXAP0kpEGQ4KcblKp/vz3Kne+t+
         detBJcxiiE70B/8vemw2TjDSXm54fzueXdxp0rr4S/+CABoRo3YPFEdtzqc/VADT2pzb
         7pjoaJtXq71UymkmHj3F/zBCBBjsuU0en+weIiOswLRATrF1l1OTJn4e240nHRl2JoMg
         3tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+79/rVNDN1N1SEjLcBAvHUJ9oDu58WUQ9a221hxPVg=;
        b=Boj4e20nOGub2gUHeyJrEvODRII4wT2r/9fiAwr/R+JREICMXF+Zgob4WYHS5PV3/u
         8XAWdqJ60fM+8WDoGMZoROQRXir7LLOv+1arbiEEbDGGRnp83l7aXPLDv3S42z9EQYtv
         BucjwW2Ta+G5rE2Ic6J0/p6ioi61VRMSmoua6fL+cbPxJSEEKfImu8ic0+tlAnJ2ULn0
         SwwFaJBOLIUnII+BMor7q2T0JejFy9fhFaVeVJSo7frFLerBfFkLu6VJQqZ7otwDDr1m
         FevsDszWdxN5LMeQ2SFmDYNHxiuK8ZHqgkkY+BGV0i1sQIuL2wySJlh+Z0XWAVhwOo0g
         wlZQ==
X-Gm-Message-State: ANoB5pnVtlpRh/Ew8XFPRgGYspNFtZs9przTZm0S0qBuWuOH7cul/GOS
        7SxoAfA0UD9hdVcpxUdsAi2dwbZPKSCwp2IXeMymAA==
X-Google-Smtp-Source: AA0mqf6ryelLIcJtPAb2S5cW1UuwsQpCmsk2//hxrXbnzUoJGrRIS3IouQwBJglIvXqdE9OWXGNry025D53F6/YrY+Y=
X-Received: by 2002:a17:90a:6b85:b0:219:95eb:e11 with SMTP id
 w5-20020a17090a6b8500b0021995eb0e11mr29820246pjj.152.1670512006650; Thu, 08
 Dec 2022 07:06:46 -0800 (PST)
MIME-Version: 1.0
References: <20221208020043.374033-1-badhri@google.com> <Y5GMUzmkfU6qWZgS@kroah.com>
In-Reply-To: <Y5GMUzmkfU6qWZgS@kroah.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Thu, 8 Dec 2022 07:06:10 -0800
Message-ID: <CAPTae5KmmYoxcQWGC7yBjyZYqZn7PXLdN4jag=5Zv0RAqYyu_g@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] usb: typec: tcpm: Add callbacks to mitigate
 wakeups due to contaminant
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Apologies ! fixed it in Version 6.

On Wed, Dec 7, 2022 at 11:03 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Dec 07, 2022 at 06:00:41PM -0800, Badhri Jagan Sridharan wrote:
> > On some of the TCPC implementations, when the Type-C port is exposed
> > to contaminants, such as water, TCPC stops toggling while reporting OPEN
> > either by the time TCPM reads CC pin status or during CC debounce
> > window. This causes TCPM to be stuck in TOGGLING state. If TCPM is made
> > to restart toggling, the behavior recurs causing redundant CPU wakeups
> > till the USB-C port is free of contaminant.
> >
> > [206199.287817] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
> > [206199.640337] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
> > [206199.985789] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
> > ...
> >
> > TCPM invokes is_potential_contaminant callback to allow low level chip
> > drivers to monitor TCPM state machine transitions and notify TCPM when
> > the Type-C port needs to be checked for potential contaminant presence.
> > TCPCs which do have the needed hardware can implement the check_contaminant
> > callback which is invoked by TCPM to evaluate for presence of contaminant.
> > Lower level TCPC driver can restart toggling through TCPM_PORT_CLEAN event
> > when the driver detects that USB-C port is free of contaminant.
> >
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > Change-Id: I136d788bb46d871d12e64bd73fd50a77b4659dbf
> > ---
>
> Always run checkpatch.pl on your patches so you don't get a grumpy
> maintainer asking why you didn't run checkpatch.pl on your patches :(
