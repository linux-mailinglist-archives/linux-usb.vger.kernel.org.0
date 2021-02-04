Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5B430EA24
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 03:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbhBDCZq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 21:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbhBDCZp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Feb 2021 21:25:45 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44134C0613ED
        for <linux-usb@vger.kernel.org>; Wed,  3 Feb 2021 18:25:05 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id v126so1942735qkd.11
        for <linux-usb@vger.kernel.org>; Wed, 03 Feb 2021 18:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=coQqiN3FjhMumWX+Pj5k2VahzTykRwZ/urCVvX96ACs=;
        b=QRw9w8JbGadOnoLA6qR/63CZCpksB52KDOqQ3673VQ/ViuSlws/Hx9o/vcDJK+Khek
         Wx4K29ZWJwSd2nZ0Ng5sOry3reqIeFnmjGYHi1IKgsAIHHrYEbhcMDwhAOv6EwObg2uX
         LOXTgl+qcVDYtk4b+EgCf1YQRHhk28g0CFWXtsSw5P4/5gJgzTUze8qMhYgM+lFEd0yh
         rh4K0YtwNz5aF/3/YyMjxRhEk7Dr53MWxvva2SqldUvT41+k8FuP1vVQThPHHjQknvQb
         lq5Ok3CWLm1C0V2OqDOhe3jsWtiAcCwIcp2qnNWDqMHJ7Fvr6gdRY4qZdmrXQlLHwwNn
         7NWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=coQqiN3FjhMumWX+Pj5k2VahzTykRwZ/urCVvX96ACs=;
        b=Fze6LuoGOGttAWepD+czQuWHTD9XMi7ib0QnOJS/5Z2cSAQPBVDRhJK5jb1sQkWjTI
         vi/vjGlyXLcaHbNu5siiJ52nnNky0dhBv2vFmiKJo1J+Nj1Q6ywfWe85iz33Yw2lcYiR
         8mTzZaIks2wNgwCbwowTTRXWXIxKloo82lrqcDxZ4/ljIMT3Srrcwl2hBKqHLYrCY0A9
         HM4E8MaJLOai5b9We0PWvvn31qmv9kv8odLckBW9hjealpZud3aSxuGBsDZ+3uodNCPL
         PyOnYDanukcXsToXu0IGLbsQjIR7mBshMlYSA/crseOzwP8Q5LMPptWbTnOg4rj2Aj8S
         suGA==
X-Gm-Message-State: AOAM532Fl9cjQPsfA5HvMPSmIqoA9J7/DbSVpV91IcAEnJvUqGkHSG7y
        wVQnhBNfSvWxgO88F7kp8OEQGYex4JfeDHchJMnWGw==
X-Google-Smtp-Source: ABdhPJyRfjc8PKg1KqpRhg1EDVcRoiAlJjnb05X+vD4GIEVsvYUxljT0A1kSoDUY0OLCR0KH4+t+b5gMLOv09r5pQgs=
X-Received: by 2002:a37:cd5:: with SMTP id 204mr5690206qkm.410.1612405503880;
 Wed, 03 Feb 2021 18:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20210202161733.932215-1-kyletso@google.com> <20210202161733.932215-3-kyletso@google.com>
 <CANLzEksFtyYe01F_+MEFdG+KC83FAu00-PAtc95-v2GswMnTvw@mail.gmail.com>
In-Reply-To: <CANLzEksFtyYe01F_+MEFdG+KC83FAu00-PAtc95-v2GswMnTvw@mail.gmail.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Thu, 4 Feb 2021 10:24:47 +0800
Message-ID: <CAGZ6i=3EqLVJn+KE4TV2iq+Z+HKOJQzMOgODvw-Z0z3CpjYCzA@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] usb: pd: Update VDO definitions
To:     Benson Leung <bleung@chromium.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Prashant Malani <pmalani@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 4, 2021 at 12:55 AM Benson Leung <bleung@chromium.org> wrote:
>
> Hey Kyle,
>
> On Tue, Feb 2, 2021 at 8:23 AM Kyle Tso <kyletso@google.com> wrote:
> >
> > "PD Spec Revision 3.0 Version 2.0 + ECNs 2020-12-10" introduces several
> > changes regarding the ID Header VDO and the Product Type VDOs.
> >
> > Signed-off-by: Kyle Tso <kyletso@google.com>
>
> We have to actually be very careful in this change, because the switch
> from PD 2.0 -> PD 3.0 does not mean that a PD 3.0 DFP will never
> encounter a PD 2.0 partner or cable again.
>
> It actually has to be the case that we may have to maintain two sets
> of these object field definitions (and any other PD object decoding we
> do in the kernel) and switch the decoding on pd_revision (which I
> recently added here:
> https://lore.kernel.org/linux-usb/20210129061406.2680146-3-bleung@chromium.org).
>
> Just to put a point on it: PD 2.0's Passive Cable VDO has B4, which is
> "Vbus through cable." PD 3.0, on the other hand, reserves this bit, so
> the field is gone. We can't just delete that bit in the kernel's data
> structures. We have to be able to refer to it if we encounter a PD 2.0
> cable.
>
> I think this change needs to be reworked so that we strictly maintain
> a PD 2.0 object field definitions, and a separate PD 3.0 one too. They
> will operate on the same objects, but whoever's doing the decoding has
> to check the revision (2.0 vs 3.0) first to check applicability of one
> set or the other.
>
> Thanks,
> Benson
>
>
> --
> Benson Leung
> Staff Software Engineer
> Chrome OS Kernel
> Google Inc.
> bleung@google.com
> Chromium OS Project
> bleung@chromium.org

You are correct!
Fix is here: https://patchwork.kernel.org/project/linux-usb/patch/20210204005036.1555294-1-kyletso@google.com/

thanks,
Kyle
