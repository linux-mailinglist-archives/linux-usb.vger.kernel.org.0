Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D4846290D
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 01:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbhK3AZL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Nov 2021 19:25:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbhK3AZL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Nov 2021 19:25:11 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF58C061574
        for <linux-usb@vger.kernel.org>; Mon, 29 Nov 2021 16:21:52 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id z5so13998721edd.3
        for <linux-usb@vger.kernel.org>; Mon, 29 Nov 2021 16:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ci94NnhvjNDm0+nVGHKxyhtDjWfoGOaQGIN6N4LSRhE=;
        b=M53/U3hREszj1yH/KQDRSGJwykb2+3EWcdSwlq3cyn30fQyJARab/+HU0AA6KFg98b
         yeUUPk+C38qRl87ro4If+M3eLvRet45QNoQudDSuJnoNoe4GcjcBWOG2/XTM/7t4Jg5Z
         1NPHp3FrTVc4/s8fKGHVk6QKmSmkK2iDxlbWq5yA9hc92hPmVwSX/Ly2XRzEfmZXRDE5
         G008ZlAoxZdJsFVqPxlMCVj0oHvr4trTGlCExIM8UTFUFKFTifDx77uOJfuBFkudOt3F
         I7VuzCznctRFvRBmttVZ4yCtOJKLk9pe1Dg2KexAFixqvjuztAUUzZJ02Y/UZskvmnyy
         9TvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ci94NnhvjNDm0+nVGHKxyhtDjWfoGOaQGIN6N4LSRhE=;
        b=vhpmc/ao+q/8g4iiAZdhrT8f/mSfG0iHDd+diqEzyxeIP0JK/Y0JLkibvF5eEkaJfc
         1cv0W8DRnNihA0gkalaf+SDwetBz+Jy6ynLv5frncDDboDO+XoBfOqyNQOlu1OxL14gm
         b+Y2Dq8xL6bu2qDxV9RHrg0LkeYsEqZGb5qH40i7nj8gRdmUuDbmigYLAb1Ja4mW/zlx
         CD5X27TXEd1eCcKJfd7anE4bi6nEykGStaGD6siIt/o6NYsUcKx75QfjGYVS4+6WwrNg
         EkQFJdiSwOOPNhpcDQ2V2BrI0H0R7p9zsTFrzbpSqVSr5gg9r2/bBZSMJiVbOxhnDhqD
         Uu+w==
X-Gm-Message-State: AOAM531qRxrX8CNRgKr0j4r3QgWI9D29HzDBQxCI6KAZ6A9h7nNdkNv9
        7N9jaSkocNh3tqe/rUo8PegBle1WsSnc5m1yRbC+QAR4YdOxVA==
X-Google-Smtp-Source: ABdhPJxvo5fpYlewG0MUn+bdVkv6oDtGOSLMbiJWgjp4wTnepUtGOh+Y+XkgY7WxBRbCSQ8WeTF6WYndljTIlrSWkWU=
X-Received: by 2002:aa7:c14a:: with SMTP id r10mr77883888edp.122.1638231711210;
 Mon, 29 Nov 2021 16:21:51 -0800 (PST)
MIME-Version: 1.0
References: <20211124224036.734679-1-badhri@google.com> <YZ8mdjPn39ekClLq@kroah.com>
In-Reply-To: <YZ8mdjPn39ekClLq@kroah.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Mon, 29 Nov 2021 16:21:14 -0800
Message-ID: <CAPTae5LTg20LmAoUZXZYULP4HvX-2DMvp7qq1MwsHce-Y7LynQ@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: tcpm: Wait in SNK_DEBOUNCED until disconnect
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks Greg ! Missed the "Cc: stable@vger.kernel.org". Have updated
the commit message and sent it as V2.

Regards,
Badhri


On Wed, Nov 24, 2021 at 10:00 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Nov 24, 2021 at 02:40:36PM -0800, Badhri Jagan Sridharan wrote:
> > Stub from the spec:
> > "4.5.2.2.4.2 Exiting from AttachWait.SNK State
> > A Sink shall transition to Unattached.SNK when the state of both
> > the CC1 and CC2 pins is SNK.Open for at least tPDDebounce.
> > A DRP shall transition to Unattached.SRC when the state of both
> > the CC1 and CC2 pins is SNK.Open for at least tPDDebounce."
> >
> > This change makes TCPM to wait in SNK_DEBOUNCED state until
> > CC1 and CC2 pins is SNK.Open for at least tPDDebounce. Previously,
> > TCPM resets the port if vbus is not present in PD_T_PS_SOURCE_ON.
> > This causes TCPM to loop continuously when connected to a
> > faulty power source that does not present vbus. Waiting in
> > SNK_DEBOUNCED also ensures that TCPM is adherant to
> > "4.5.2.2.4.2 Exiting from AttachWait.SNK State" requirements.
> >
> > [ 6169.280751] CC1: 0 -> 0, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
> > [ 6169.280759] state change TOGGLING -> SNK_ATTACH_WAIT [rev2 NONE_AMS]
> > [ 6169.280771] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev2 NONE_AMS]
> > [ 6169.282427] CC1: 0 -> 0, CC2: 5 -> 5 [state SNK_ATTACH_WAIT, polarity 0, connected]
> > [ 6169.450825] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
> > [ 6169.450834] pending state change SNK_DEBOUNCED -> PORT_RESET @ 480 ms [rev2 NONE_AMS]
> > [ 6169.930892] state change SNK_DEBOUNCED -> PORT_RESET [delayed 480 ms]
> > [ 6169.931296] disable vbus discharge ret:0
> > [ 6169.931301] Setting usb_comm capable false
> > [ 6169.932783] Setting voltage/current limit 0 mV 0 mA
> > [ 6169.932802] polarity 0
> > [ 6169.933706] Requesting mux state 0, usb-role 0, orientation 0
> > [ 6169.936689] cc:=0
> > [ 6169.936812] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev2 NONE_AMS]
> > [ 6169.937157] CC1: 0 -> 0, CC2: 5 -> 0 [state PORT_RESET, polarity 0, disconnected]
> > [ 6170.036880] state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
> > [ 6170.036890] state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED [rev2 NONE_AMS]
> > [ 6170.036896] Start toggling
> > [ 6170.041412] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
> > [ 6170.042973] CC1: 0 -> 0, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
> > [ 6170.042976] state change TOGGLING -> SNK_ATTACH_WAIT [rev2 NONE_AMS]
> > [ 6170.042981] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev2 NONE_AMS]
> > [ 6170.213014] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
> > [ 6170.213019] pending state change SNK_DEBOUNCED -> PORT_RESET @ 480 ms [rev2 NONE_AMS]
> > [ 6170.693068] state change SNK_DEBOUNCED -> PORT_RESET [delayed 480 ms]
> > [ 6170.693304] disable vbus discharge ret:0
> > [ 6170.693308] Setting usb_comm capable false
> > [ 6170.695193] Setting voltage/current limit 0 mV 0 mA
> > [ 6170.695210] polarity 0
> > [ 6170.695990] Requesting mux state 0, usb-role 0, orientation 0
> > [ 6170.701896] cc:=0
> > [ 6170.702181] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev2 NONE_AMS]
> > [ 6170.703343] CC1: 0 -> 0, CC2: 5 -> 0 [state PORT_RESET, polarity 0, disconnected]
> >
> > Fixes: f0690a25a140b8 ("staging: typec: USB Type-C Port Manager (tcpm)")
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 4 ----
> >  1 file changed, 4 deletions(-)
>
>
> <formletter>
>
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.
>
> </formletter>
