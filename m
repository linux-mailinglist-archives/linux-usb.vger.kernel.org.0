Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED15F3384E3
	for <lists+linux-usb@lfdr.de>; Fri, 12 Mar 2021 06:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbhCLFJJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Mar 2021 00:09:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhCLFIl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Mar 2021 00:08:41 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A15BC061574
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 21:08:41 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id x8so1362452ual.6
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 21:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uHOpvLhtcBHbawIEfPz5vAJeY+3oJDGose4sCS14ksM=;
        b=ji/rHHnMPcSm4WLA9naLB2j+Vp4jtFUnVlqAWZEb7g4lwsK4w50Xo8CivItnD5kt37
         c33wqWjZS8uyoKoAQGWSGJwnyF9wCNK20JXj/C8yBTDDYC8L9Nbypb8x5qt59fhwhQX7
         yX7PvrP4JZCusZRmRYRXk8z8u9QIzHh+nQWzAwhgkpQeFcbwuwpp0VESgEfh2SyMmTZx
         4JtQ/Hnq1MPahG1u+aqLi4vdRZM/E47Ihqq8NCHGLEj+jmIdhbSNrFDToO28vHWvaI3A
         TSo4lpDddfbemVh1dSj+n29yNhnmeQlmw+A+lVnJOYGSyGBFAzGWATfuS4mYPFlJO8C8
         ft2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uHOpvLhtcBHbawIEfPz5vAJeY+3oJDGose4sCS14ksM=;
        b=Mj3Sc5DtjVPirslCE91Uu3gv57u+HaV5YM+8oIEHOew43FkaBl5yvT9Prh1Q3a9r/C
         JY5/hZvMyflpRnokn6OdXft1wl35oyqZkxM3LlQJPMoWEDZZKngCHf68NSizg/tabf6U
         7xBGDme1Sffm2F5tev8uf6S3p0/s79S6dO3f3D2uzxcnStHwwr0dfwtJAV+09g1/dV/B
         /ck/3HEN+03Uh4R8Nz8uUUS5IQsu0oFg7NTS6Li7YWxUUiMyExRJxI71K1XoSEcQzRTd
         LgbYzCOOAhYOt9+s5HvanjJOcpv2PZVssdpNHFXVfINokfySgtXvn+s2LnqOm/Ei740/
         mUcA==
X-Gm-Message-State: AOAM530ZiJFzQy/gJJZkeDLBC+fntauY+PTkCA7wEqxxbXiFmCeiMx5F
        OJIyUtDIWJUMMCb9bmXB0G4QSWcIG7pPF0PHoVUEhw==
X-Google-Smtp-Source: ABdhPJwihHID2NqIizK1UVSvkKIlg1hQtMOUGnX9QgjjQuWobQoLMA4beT9qvQURge0Xfa+UMUNJnIsYo+zLxN3ygF0=
X-Received: by 2002:ab0:4d6a:: with SMTP id k42mr7030498uag.69.1615525720433;
 Thu, 11 Mar 2021 21:08:40 -0800 (PST)
MIME-Version: 1.0
References: <20210311100313.3591254-1-badhri@google.com> <20210311100313.3591254-3-badhri@google.com>
 <YEocMN1aSdDZ2dl/@kuha.fi.intel.com>
In-Reply-To: <YEocMN1aSdDZ2dl/@kuha.fi.intel.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Thu, 11 Mar 2021 21:08:04 -0800
Message-ID: <CAPTae5KNXK1M1L134RKj6QPr1NGv5uo-43NVZ+cM5otsxjvMOw@mail.gmail.com>
Subject: Re: [PATCH 3/4] usb: typec: tcpci_maxim: configure charging & data paths
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kyle Tso <kyletso@google.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 11, 2021 at 5:33 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi,
>
> On Thu, Mar 11, 2021 at 02:03:12AM -0800, Badhri Jagan Sridharan wrote:
> > This change allows the driver to configure input current/voltage
> > limit for the charging path. The driver sets current_max and voltage_max
> > values of the power supply identified through chg-psy-name.
> >
> > The change also exposes the data_role and the orientation as a extcon
> > interface for configuring the USB data controller.
>
> This looks wrong to me. Why wouldn't you just register your device as
> a separate psy that supplies your charger (which is also a psy, right)?

Hi Heikki,

Looks like that would pretty much make it reflect the same values as
"tcpm-source-psy-" exposed
by tcpm. So experimenting with making the charger power supply a supplicant.
However, noticed that the "tcpm-source-psy-" does not have calls to
power_supply_changed().
So the notifiers are not getting invoked.
Trying to fix that to see if just "tcpm-source-psy-" helps the case
without me trying to create another
one which almost would reflect the same values. Let me know if you
think that might not work.

For now, refactored the patches to only include changes related to
data path and sending
them in. Will follow up with patches for the charger path once I am
done with the above approach
and some validation.

Thanks,
Badhri
>
>
> thanks,
>
> --
> heikki
