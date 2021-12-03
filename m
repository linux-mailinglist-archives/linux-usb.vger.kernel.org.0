Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125D9467EC0
	for <lists+linux-usb@lfdr.de>; Fri,  3 Dec 2021 21:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383079AbhLCU0L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Dec 2021 15:26:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383071AbhLCU0L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Dec 2021 15:26:11 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64B3C061751
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 12:22:46 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id v22so4540300qtx.8
        for <linux-usb@vger.kernel.org>; Fri, 03 Dec 2021 12:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x1kq1FdKjUmZxEc0L0fA9v+hSFe1Fbo2xAA2zL+m6AM=;
        b=a9oNxZXTlUEzUXw8+ENCGBiqU783EAZra7SrY1xlm05gp8zTlt92GuFLwht7F+wxAM
         5+5SifX86l66n9EnTDq/AOkabo+hNQ8cRy4rgOrbdFVbyVvs+L/kMvbMsJ0hRqvWU4/v
         iuzkalBK6RNYpXAPRs9hkbxMSRhymF1uz1X8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x1kq1FdKjUmZxEc0L0fA9v+hSFe1Fbo2xAA2zL+m6AM=;
        b=dzPSN5kgz0UF819Gl2tI7tl7lCjg/6AJ+B1ir843toxGd1B1Y2E0cBxRqUOv4S1ey+
         tPH/PSC33olTzgFuYBciqEXD473hRoAFNMe0oqWFb5Bla+6CuKBkpLDPO7q0pUUvw9Xs
         YJ1gUwMu8fgb9DDGjuYHG8CkeuQZ4YGQcKdOFfDrsAddAELqprTq+jDqMaTc8jw+HXZQ
         Yusry6nBhABSoi4TT5BEHkoyHo1tMD+4bkCoGwWehwUt4Px1gf0yn2cNIZKEVOreBK+G
         ByxrKb8A7LDOTg3GK62ujNsRUbIIcyr3P5al+xR81POr2SvCzQOuchtnJtp8eZRKDblF
         JrKw==
X-Gm-Message-State: AOAM530WJgQ4BOPdtoWJY9udbRM5yEQBLbgB9rGW2wbd/Jz3QHAYnbSh
        k+1+r9xaZdhAabdWQ+xfSaI2HYHOzxYy7VEPh8z8tg==
X-Google-Smtp-Source: ABdhPJyNp/VQC/spMZ619lxwEGXZv6Q3fXGbTxaqdwnd/3xa4NJokGo1qQMUw8fxocLCzFuyef5asg64k1DS9yAyz+g=
X-Received: by 2002:a05:622a:120d:: with SMTP id y13mr22612059qtx.155.1638562965867;
 Fri, 03 Dec 2021 12:22:45 -0800 (PST)
MIME-Version: 1.0
References: <20200714113617.10470-1-hdegoede@redhat.com> <Yakej0+7W+Lk9OWP@google.com>
 <9a5d71ae-a571-248c-173b-7545f9f7d344@redhat.com>
In-Reply-To: <9a5d71ae-a571-248c-173b-7545f9f7d344@redhat.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Fri, 3 Dec 2021 12:22:35 -0800
Message-ID: <CACeCKafantM4ubxTLnge5DZLT87Pyrpc34nQrUvN1Zu1FgyVKw@mail.gmail.com>
Subject: Re: PATCH 0/4] usbd: typec: fusb302: Add support for specifying
 supported alternate-modes through devicetree/fwnodes
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        bleung@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hans,

On Fri, Dec 3, 2021 at 2:14 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Prashant,
>
> On 12/2/21 20:29, Prashant Malani wrote:
> > Hi Hans,
> >
> > Sorry for posting on an old thread, but I was wondering if there was
> > still a plan to submit this? This is something we'd like to use on
> > Chrome OS too.
> >
> > It sounded like the primary discussion was whether to have an "altmodes"
> > property encaspulating the various alt modes, but not sure what the
> > final consensus on that was (sounded to me like your current
> > implementation was fine for now, and ACPI use cases would be handled
> > later?).
>
> Support for this has already landed, but so far has only been tested
> on a x86/ACPI device, where the firmware-nodes parsed by the new
> typec_port_register_altmodes() helper are setup through software-nodes,
> see:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7b458a4c5d7302947556e12c83cfe4da769665d0
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=55d8b34772e0728a224198ba605eed8cfc570aa0
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3d28466e5f4f8
>
> In theory this should be usable for devicetree as is. But that would
> require documenting the current in kernel swnode bindings as
> official devicetree bindings and getting that through the devicetree
> bindings review process.

That's good to hear :)

>
> I have deliberately not done this because the devicetree maintainers
> have asked for properties / swnode "bindings" used only inside
> the kernel (1) to NOT be documented as official devicetree bindings,
> they (the dt bindings maintainers) want to first see at least one
> real devicetree users before adding things like this to the
> official devicetree bindings docs.
>
> Note if the way typec_port_register_altmodes() parses the fwnode
> properties needs to change as result of the devicetree bindings review
> process, please let me know, because then the swnode-s created in
> drivers/platform/x86/intel/int33fe/intel_cht_int33fe_typec.c
> need to change to match so as to not regress things on those devices.

Heikki, can we reconcile this with the format you had in mind for ACPI
devices which specify this in ASL files?
If not, would you rather:
1. We handle the actual ACPI format differently in
typec_port_register_altmodes() itself ? If so, is it documented
in some place that we can reference?
<or>
2. Parse whatever ACPI format there is in the port drivers probe
function, and then inject software nodes like in the int33fe driver
[1]
<or>
3. Is there scope for updating the ACPI altmode descriptor format to
match what is being parsed by typec_port_register_altmodes()

Thanks,

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_typec.c#n221
