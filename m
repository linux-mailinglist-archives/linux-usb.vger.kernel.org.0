Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC8231EA00
	for <lists+linux-usb@lfdr.de>; Thu, 18 Feb 2021 13:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233163AbhBRMno (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Feb 2021 07:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232126AbhBRKsu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Feb 2021 05:48:50 -0500
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D209C061756
        for <linux-usb@vger.kernel.org>; Thu, 18 Feb 2021 02:39:22 -0800 (PST)
Received: by mail-vk1-xa30.google.com with SMTP id d13so323365vko.4
        for <linux-usb@vger.kernel.org>; Thu, 18 Feb 2021 02:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YOMMWx83sVK5s2KM8oWsXJouuzi+vPSeQ0UYQiVlDHo=;
        b=c9BPEGK3whetKJ6sOLH5PlmsnME8gyj1FGRVbxRKxYxf2UwAwymKeA5i/DtAjtui/q
         dTghxChZ0MwNq3RmRuCHNsKs4Yhg7C6YL+oqu0koUHEZpIvqmjNe4lAQvGk0pccqZ+j9
         AaB56ANM8+auv7mRc1MaO00zR9BzFgiL1nCWmm+gLu7IDi44vQJJsqHcQH2CYPuT2Tu+
         /N7mLzN30IN6D3UPBlea3gP+0zD+/ki9SglVgbeT2CT9NNA9vf1saZTdYWQzYtS9TzGH
         EtTMqYiT0qFI3i5psPFes07/aHSOYzJcs9NPw+eIfCTFeGbmgHka4VWstntjVbz9mBCt
         N0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YOMMWx83sVK5s2KM8oWsXJouuzi+vPSeQ0UYQiVlDHo=;
        b=L4v92LGWH8WJTHbJVWBLCx7Q6zmUkD2pnGwjPhqpuocGQp8c3EEUmPaH/xkKC8BmkU
         JQbz+C5s2TUHzHU4X3Fl2Gr6ZScU7QKWmTT1EBvgTu9c6ARrE4i3RLo8qHl+tphd0mjt
         UIhMSe0a2vMDA9aItT8zg8uRSJ/ooWJp7FCCgANW6QGqW5mSPpWXEPu4C1xq5dMhIDGS
         8xCqqddXvzIfI7tLmQ6zTUrWhaAF97NBntHsXZ3OstIvAS+kh0zsA7pUOgThv7QfOLfR
         GkrI8MPbE4nzAH83CJ4daR3bvMNfBSENdSlW2mbYkg5lafNaIVXcUZlX0yofqH/9ISqc
         P8bg==
X-Gm-Message-State: AOAM530f51I5oITyVU19pKk/r8ZwoJiPN8um5yyOEtFOibi9xjIS3kZT
        brVFk2wO9hmi8WIVgFUUe1xRhJO0NG6P0kyhGVyIEfDMV4smsA==
X-Google-Smtp-Source: ABdhPJwbKZ2CjJr/ED3Jd+n1MYSk6WT03eq9v22SIbgjU5vxjEkA7aSOcZizUMRstVvz3Bd3JLnzZcW+z8IL2tTe3Z0=
X-Received: by 2002:a1f:df06:: with SMTP id w6mr373486vkg.18.1613644761430;
 Thu, 18 Feb 2021 02:39:21 -0800 (PST)
MIME-Version: 1.0
References: <20210218100243.32187-1-badhri@google.com> <YC489HGT/yVHykAs@kroah.com>
In-Reply-To: <YC489HGT/yVHykAs@kroah.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Thu, 18 Feb 2021 02:38:45 -0800
Message-ID: <CAPTae5+qhE9uo2s20oEQd0x+nW21zGE3S7QWkR=oqqVX-3uHmg@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: tcpm: Wait for vbus discharge to VSAFE0V
 before toggling
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Kyle Tso <kyletso@google.com>, USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

This patch is a bug fix for the following patch which was introduced in 5.11.

commit f321a02caebdd0c56e167610cda2fa148cd96e8b
Author: Badhri Jagan Sridharan <badhri@google.com>
Date:   Wed Oct 28 23:31:35 2020 -0700

    usb: typec: tcpm: Implement enabling Auto Discharge disconnect support

    TCPCI spec allows TCPC hardware to autonomously discharge the vbus
    capacitance upon disconnect. The expectation is that the TCPM enables
    AutoDischargeDisconnect while entering SNK/SRC_ATTACHED states. Hardware
    then automously discharges vbus when the vbus falls below a certain
    threshold i.e. VBUS_SINK_DISCONNECT_THRESHOLD.

    Apart from enabling the vbus discharge circuit, AutoDischargeDisconnect
    is also used a flag to move TCPCI based TCPC implementations into
    Attached.Snk/Attached.Src state as mentioned in
    Figure 4-15. TCPC State Diagram before a Connection of the
    USB Type-C Port Controller Interface Specification.
    In such TCPC implementations, setting AutoDischargeDisconnect would
    prevent TCPC into entering "Connection_Invalid" state as well.

    Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
    Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
    Link: https://lore.kernel.org/r/20201029063138.1429760-8-badhri@google.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks,
Badhri

On Thu, Feb 18, 2021 at 2:10 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 18, 2021 at 02:02:43AM -0800, Badhri Jagan Sridharan wrote:
> > When vbus auto discharge is enabled, TCPM can sometimes be faster than
> > the TCPC i.e. TCPM can go ahead and move the port to unattached state
> > (involves disabling vbus auto discharge) before TCPC could effectively
> > discharge vbus to VSAFE0V. This leaves vbus with residual charge and
> > increases the decay time which prevents tsafe0v from being met.
> > This change introduces a new state VBUS_DISCHARGE where the TCPM waits
> > for a maximum of tSafe0V(max) for vbus to discharge to VSAFE0V before
> > transitioning to unattached state and re-enable toggling. If vbus
> > discharges to vsafe0v sooner, then, transition to unattached state
> > happens right away.
> >
> > Also, while in SNK_READY, when auto discharge is enabled, drive
> > disconnect based on vbus turning off instead of Rp disappearing on
> > CC pins. Rp disappearing on CC pins is almost instanteous compared
> > to vbus decay.
> >
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 60 +++++++++++++++++++++++++++++++----
> >  1 file changed, 53 insertions(+), 7 deletions(-)
>
> As this seems to be a bugfix, what commit does it fix?  Should it go to
> stable kernels?  If so, how far back?
>
> And as this is the merge window, I can't do anything with this until
> 5.12-rc1 is out, so be prepared for the delay...
>
> thanks,
>
> greg k-h
