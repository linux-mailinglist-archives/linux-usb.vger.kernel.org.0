Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7343E227856
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 07:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgGUFtN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 01:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgGUFtM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 01:49:12 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA5DC0619D6
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2020 22:49:12 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id l23so10364667qkk.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2020 22:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J/VlXTBNzYr8hWPwvtPcB4lgFmJDE5C1OJFdc6g87I8=;
        b=PeM20mTFYvDuzMfpomPGFEV+VbCpyqNRz96/UTtSaaCROneoqwStaNoSWR9FvUGKj6
         6d1jx8OFvjMweiWfBfcFiQfN4UKiEHKdePqOtbxKGCfMEWNaKnIucQZmYDLnRSnQh59j
         WY+MsoAYB4zkLOknqmNqoYX/jcfhu+hAn9/Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J/VlXTBNzYr8hWPwvtPcB4lgFmJDE5C1OJFdc6g87I8=;
        b=dTFqBVj2h2kql2CqTIHktnfbs5SALkFoDd/MuasqpqGq9FGtjqpiZ2v2eaJ1+Gf/oY
         //d3kf3sfCvXjn/Xm5B38+2tgbue/fspE4FN9snEqt1l87SeWSe1GyQ9YmzSfB461sAg
         11FhxJI/lEIyxR6DQO9DsiRUkRqozMPIDVeq240Eej2Xr03LU+vEnbuX4lT8UeZGkY7v
         pTvBVSCSJnZERNHAkRWVZFYEkPLKb8vPYWwUtLtxDrCZI+inQwEafOO1ORl3dt8HbBqq
         9wMbOFsMQX94CZFj3zGdkObJxnf7pZnGW+NrXr69fEUVwD1ugFxnhZxFIDiIJY0G/1T5
         3TsQ==
X-Gm-Message-State: AOAM532bKlBjODR1QvHQWpyAypU/olQWKKsZunoX1zBt0/6IzoyFj1cd
        zYO9plHgvUNtzcHD714oRpU7jR78NVRdCWlZhq6GNw==
X-Google-Smtp-Source: ABdhPJw77g3OeCWEh/vfgU+VObGbigGa4gwWnRtUgXrHgKPEHbJSVJ2NsPJ73ftijbPN4mYbIHY9ydyqGxwKveqNMh8=
X-Received: by 2002:a37:ae01:: with SMTP id x1mr23561539qke.179.1595310551419;
 Mon, 20 Jul 2020 22:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200714113617.10470-1-hdegoede@redhat.com> <20200714113617.10470-2-hdegoede@redhat.com>
 <20200721022610.GA3391383@bogus>
In-Reply-To: <20200721022610.GA3391383@bogus>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Mon, 20 Jul 2020 22:49:00 -0700
Message-ID: <CACeCKacEqZX5FKF2Gpaa_zEgf-sCrxsgk-WJ9VDdYsrwZNoCBg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb-connector: Add support for Type-C alternate-modes
To:     Rob Herring <robh@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Tobias Schramm <t.schramm@manjaro.org>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

HI Rob,

On Mon, Jul 20, 2020 at 7:26 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jul 14, 2020 at 01:36:14PM +0200, Hans de Goede wrote:
> > This commit adds the minimum bindings required to allow describing which
> > altmodes a port supports. Currently this is limited to just specifying:
> >
> > 1. The svid, which is the id of the altmode, e.g. displayport altmode has
> > a svid of 0xff01.
> >
> > 2. The vdo, a 32 bit integer, typically used as a bitmask describing the
> > capabilities of the altmode, the bits in the vdo are specified in the
> > specification of the altmode, the dt-binding simply refers to the
> > specification as that is the canonical source of the meaning of the bits.
>
> What if this information should be derived from information already in
> DT (or would be there if alt mode connections are described)?
>
> >
> > Later on we may want to extend the binding with extra properties specific
> > to some altmode, but for now this is sufficient to e.g. hook up
> > displayport alternate-mode.
>
> I don't think this is sufficient as it doesn't describe how alternate
> modes are connected to various components. This has been discussed some
> here[1] with the CrOS folks. Maybe this is orthogonal, IDK, but I really
> need something that is somewhat complete and not sprinkle a few new
> properties at a time.

Just thought I'd add a link[2] to some amendments which were made to
the "switch"
proposal in the thread you added a link to (it has many responses, so
not sure if my
responses got lost in the thread). I also wrote a short summary[3].

Please ignore these if you've already taken a look at them :)

Best regards,

-Prashant

[2] https://lkml.org/lkml/2020/6/12/602
[3] https://lkml.org/lkml/2020/7/10/234
>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> > Note I hope I got the yaml correct, this is my first time writing a
> > dt-binding in the new yaml style. I did run:
> > make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/connector/usb-connector.yaml
> > and that was happy.
>
> That aspect of it looks fine.
>
> Rob
>
> [1] https://lkml.org/lkml/2020/4/22/1819
>
