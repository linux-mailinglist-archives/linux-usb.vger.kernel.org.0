Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C3731F64E
	for <lists+linux-usb@lfdr.de>; Fri, 19 Feb 2021 10:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhBSJJ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Feb 2021 04:09:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhBSJHn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Feb 2021 04:07:43 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42292C061574
        for <linux-usb@vger.kernel.org>; Fri, 19 Feb 2021 01:07:02 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id k1so1058565vkb.11
        for <linux-usb@vger.kernel.org>; Fri, 19 Feb 2021 01:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yN01wuFruNiwvlR4nWVGFgREmWX9yHFllXRmh8fxIwU=;
        b=n3/LrxpsC2OkD6fPu/ezlq1VjEsvFGYJCOYMZ5J88dLnqxxoYyPe/rKQNxUSuLuIln
         TboExNJt5RX7XuGOjmi+CHKe6KOg5bie9RLclwxE3Q4HU2pBjN5yUBxmLXGv/qXtdTzy
         MpfapeRfJRJbCHj8diZP+lGSH91/hn+uqS+3gVGv1FxG9HaqX6VQT4tcqbtNGe2oSXdq
         /KgFhgNC5V/3RY7KAh9QYiCZX8bS/0YHl2cmxmEPnH7oKP6zWE97Q+kH976uyz5/bjbc
         QUbRHoubY6M68u+Sa/nKnoblkNOdmXGg+F/r/yZ7D7RTHrhoHZWxurwm3JvN7AUYAJiQ
         tJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yN01wuFruNiwvlR4nWVGFgREmWX9yHFllXRmh8fxIwU=;
        b=VO8msUsxflX8YlHUHDWo86S49MiAs6GJCtE+m0k1G+sb0CvyhryU+hKWI3OYtYnXMq
         WLpHcgoJGBV1yYR7dq9EZeFDQzBvpfxyo3NfVhx3Z+rxvIbVN6UvElbf/kHpdkSsGVBF
         mDIK5vWiuYAm50EQcKLDG4SKATEEn15zknzgWqcvB++JCd04pMWcocoye5nlLyLW8RBy
         hh9bx865MfwaFJQ2OV0bHc7N5lEAM0iUG/rXUffo4Df746eMb5rTlhZBt326AITkHhOc
         CD3o0lW3ggpnwxeQKG2CpVKRC84utD0tuB3rFR3qD7TjtChlWLboxppANLpjIRgxvL8t
         bcuQ==
X-Gm-Message-State: AOAM532PF7K5ZrbkNvyueTSyuvlp+YkwbsSxUOyNU/j90EBo1AyjLUmP
        b1Ax4bIEYPBiuum62mKwM2WlJ71aLy1fTU7EgHmx5iZahE6OWA==
X-Google-Smtp-Source: ABdhPJzKUm/xh7nllJxIUI73WY+U82eO0Jix5S18RtlTJR4/AkvhLw5A7tcATq+17s+Blm6SA10wg4ku1I2I3uRkAKE=
X-Received: by 2002:a1f:9c55:: with SMTP id f82mr235371vke.22.1613725621204;
 Fri, 19 Feb 2021 01:07:01 -0800 (PST)
MIME-Version: 1.0
References: <20210218100243.32187-1-badhri@google.com> <YC489HGT/yVHykAs@kroah.com>
 <CAPTae5+qhE9uo2s20oEQd0x+nW21zGE3S7QWkR=oqqVX-3uHmg@mail.gmail.com> <YC5EpqqNM+gnD6Zg@kroah.com>
In-Reply-To: <YC5EpqqNM+gnD6Zg@kroah.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Fri, 19 Feb 2021 01:06:24 -0800
Message-ID: <CAPTae5LuxPw+4DKt4_NFmBnZxgvM7nTDFtXJsTiqsevi4krLjQ@mail.gmail.com>
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

Done. Just sent out the following patch and CCed stable@vger.kernel.org as well.

[PATCH v2] usb: typec: tcpm: Wait for vbus discharge to VSAFE0V before toggling

Thanks,
Badhri


On Thu, Feb 18, 2021 at 2:42 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 18, 2021 at 02:38:45AM -0800, Badhri Jagan Sridharan wrote:
> > Hi Greg,
> >
> > This patch is a bug fix for the following patch which was introduced in 5.11.
> >
> > commit f321a02caebdd0c56e167610cda2fa148cd96e8b
> > Author: Badhri Jagan Sridharan <badhri@google.com>
> > Date:   Wed Oct 28 23:31:35 2020 -0700
> >
> >     usb: typec: tcpm: Implement enabling Auto Discharge disconnect support
> >
> >     TCPCI spec allows TCPC hardware to autonomously discharge the vbus
> >     capacitance upon disconnect. The expectation is that the TCPM enables
> >     AutoDischargeDisconnect while entering SNK/SRC_ATTACHED states. Hardware
> >     then automously discharges vbus when the vbus falls below a certain
> >     threshold i.e. VBUS_SINK_DISCONNECT_THRESHOLD.
> >
> >     Apart from enabling the vbus discharge circuit, AutoDischargeDisconnect
> >     is also used a flag to move TCPCI based TCPC implementations into
> >     Attached.Snk/Attached.Src state as mentioned in
> >     Figure 4-15. TCPC State Diagram before a Connection of the
> >     USB Type-C Port Controller Interface Specification.
> >     In such TCPC implementations, setting AutoDischargeDisconnect would
> >     prevent TCPC into entering "Connection_Invalid" state as well.
> >
> >     Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> >     Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >     Link: https://lore.kernel.org/r/20201029063138.1429760-8-badhri@google.com
> >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> Great, then can you resend the patch and add a proper Fixes: tag, along
> with a cc: stable as well?
>
> thanks,
>
> greg k-h
