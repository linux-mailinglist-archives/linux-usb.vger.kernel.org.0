Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7809237FD08
	for <lists+linux-usb@lfdr.de>; Thu, 13 May 2021 20:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbhEMSBe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 May 2021 14:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhEMSBd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 May 2021 14:01:33 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0897BC06174A
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 11:00:23 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id s15so11240051vsi.4
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 11:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LTxS73qpgw8wyOGx/jay0u9L/v5jsZImh4qhHGmYKZE=;
        b=tklR2NvpwQw+STERlujGQIte3lDGnRI6uPOx0826wTpa8L8G31Ug6E15953WQ6n6M0
         TVSmARbFPEwwLv2qPGshTDhs1/5GxN4tTgsbamFHOBCFJXVSA2Ms8YervLbIT4xx55sN
         8OjYEAzWROaDdGzT083Q2p6/EUpV8xGaUsTIdQiHVNWwEoagQA0glRoo8ESHtr3/IMQ6
         k25XbMf+bjGnjrkGlsruFYotJuDv3dXice6pgkIWouXap/VXBpsAqoWfizqDZdcJXm4y
         49iq2IfFK4hO3ZE0t0cdWmRNRGSupk791amSN4Bi66XVSnIpbOEnI7+9m3V6jaTc8Jfk
         lWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LTxS73qpgw8wyOGx/jay0u9L/v5jsZImh4qhHGmYKZE=;
        b=AuSur4ZNnHDVrSiJe2VWZ58uc0iYnluRlzkCNGl1xkPMBww/1K8K3Ur7ZfWOK2YKPL
         CkjV1DBtULef0qFPTCW5m5ECYYNMfIvR+woM1v4XxhYlsfFvtUYu+1o28avAOMj4Ee1C
         b5g66wpNoLR9rQwkXPym63qkVG3+8Jq0Dw7Hm6totXS1XUKAUjaAqoAXvzXaqZ1KHIwE
         7V70QR5enOE3Wnon+sKWrUYIOzRF2eZ2yNwttcqM7qeUK3B8M3BKQ3ruu5GaNoH3M6Q2
         EVVMooNMnqcQjnJLi1YQHcDoPNEMMuu/xUimKrXBAYCFlUEJH1JvWrfhrDjlDchPlT19
         tbAg==
X-Gm-Message-State: AOAM532beVSj8LBjdRNamt32E4Tb58+eqtPf7bKDdVvcJGz6S38VkMVb
        GudM8TsRAZmSgORBjxcFCkM1hY3ZL1Wz8sDteIE5HhFYl/ltYLsE
X-Google-Smtp-Source: ABdhPJzQWS+gGEQp4Nc3rYy1a0+QdLqvtqfdhjg4P2Pun9SSC2Exu7NzJGlLNgeyqAtiU45guOWttSPurIaULWPEbNk=
X-Received: by 2002:a67:6307:: with SMTP id x7mr37421491vsb.12.1620928821530;
 Thu, 13 May 2021 11:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210510211756.3346954-1-badhri@google.com> <YJ0jDcShxW8400ez@kroah.com>
In-Reply-To: <YJ0jDcShxW8400ez@kroah.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Thu, 13 May 2021 10:59:45 -0700
Message-ID: <CAPTae5J9ctNGgoKPNteTghYMEEqxmEDqnMib82_Qf-v_5m7tqA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: Fix SINK_DISCOVERY current limit for Rp-default
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Apologies Greg ! Will pay more attention to the "fixes" string next time.

Thanks for fixing it up !
-Badhri


On Thu, May 13, 2021 at 6:01 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, May 10, 2021 at 02:17:56PM -0700, Badhri Jagan Sridharan wrote:
> > This is a regression introduced by
> > <1373fefc6243cc96b3565f0ffffadfac4ccfb977>
> > "Allow slow charging loops to comply to pSnkStby".
> >
> > When Source advertises Rp-default, tcpm would request 500mA when in
> > SINK_DISCOVERY, Type-C spec advises the sink to follow BC1.2 current
> > limits when Rp-default is advertised.
> > [12750.503381] Requesting mux state 1, usb-role 2, orientation 1
> > [12750.503837] state change SNK_ATTACHED -> SNK_STARTUP [rev3 NONE_AMS]
> > [12751.003891] state change SNK_STARTUP -> SNK_DISCOVERY
> > [12751.003900] Setting voltage/current limit 5000 mV 500 mA
> >
> > This patch restores the behavior where the tcpm would request 0mA when
> > Rp-default is advertised by the source.
> > [   73.174252] Requesting mux state 1, usb-role 2, orientation 1
> > [   73.174749] state change SNK_ATTACHED -> SNK_STARTUP [rev3 NONE_AMS]
> > [   73.674800] state change SNK_STARTUP -> SNK_DISCOVERY
> > [   73.674808] Setting voltage/current limit 5000 mV 0 mA
> >
> > During SNK_DISCOVERY, Cap the current limit to PD_P_SNK_STDBY_MW / 5 only
> > for slow_charger_loop case.
> >
> > Fixes: 1373fefc6243 ("Allow slow charging loops to comply to pSnkStby")
>
> Your string here was incorrect, I'll fix it up this time, but please be
> more careful in the future as it will get caught by our scripts.
>
> thanks,
>
> greg k-h
