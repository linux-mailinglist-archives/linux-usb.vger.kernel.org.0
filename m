Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D50C2DA74E
	for <lists+linux-usb@lfdr.de>; Tue, 15 Dec 2020 06:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgLOFCz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Dec 2020 00:02:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgLOFCz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Dec 2020 00:02:55 -0500
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B51C061793
        for <linux-usb@vger.kernel.org>; Mon, 14 Dec 2020 21:02:15 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id y25so2764595uaq.7
        for <linux-usb@vger.kernel.org>; Mon, 14 Dec 2020 21:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pHo3XsIyWNvckFXPFqLaZNLoMiF4B6Vy4bSZJBdu8uE=;
        b=GadpvrFJEi9F6LZuJLdQyn25majs9OBszxOgcAEgzaRfc9w9PNdIMgg4jtUzZdG6rw
         cw03KExCXMUKsvKE8UOFJIxLACNLcDHN9NWbs9roX5DVcQRWaSXxIYE2K9Z350UFbJJy
         AD2zsCS7uol7RAXLRWKSbiRyy3LUDMhTtWMVpFCkian9YvIPHRzAqpQ6QyvJDnfbaTf2
         1Dfa3NVU5klgHPtuBw3yBkKLpKUG6CcZnjMUJM6jL9AIgzk+j6B4/LPE8oFRrZ34fN8y
         oClpk5K5XwbigqedWEU9lS2+JygxW3KABU9+o55pHl7m0s5fTrnOnsJoEBKkpwt2L5LM
         8+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pHo3XsIyWNvckFXPFqLaZNLoMiF4B6Vy4bSZJBdu8uE=;
        b=kiuoYGjyuJbk5cxIplEbFtjX7acwvrDQq1dqlud+/J7fDKmU1R3MLY9wDnfpgNPrq5
         vCMrs4NLY5whRc0Lvgp79NwLOtnszznzSzsZmLPxMlyVkrDvtjI92gVkwcJHHxz+OVl4
         h5JfaYgmTRYos8Vhdj+7UQA3sSQNtTy3Q1VTfQbuqTKHnuxALZNkQ/yxSVJj7ifmPRpT
         h+xQfnXtNIflPITcvYrP9f1Kc5YqSiuQwOstjGpv5zMWn3UVAmVUEPxuF/C4pt06aYmV
         ISgjYc16WXQEQXWiaZJWGROg/TdWa063oAfkHtNQ5f4+BHwN058ETboakgql3vBLOlgP
         ioeA==
X-Gm-Message-State: AOAM533mwUHt8SQLbR0fgEtmmLfWdchARCnynLEJcvn8jJMiDAAZ54ie
        6GXcpGZYkj4wsGdqB9LLXgwa22Nv8kGyohJ1BGitPxUqJxsUtA==
X-Google-Smtp-Source: ABdhPJz/HtwuWdGU0yxtlXi8mDkQh3jYI5e2rvMVgwrRe6HIeW29i5CcrUps7GXDAGoe8QIDqVHFeERH48EonXx0wmU=
X-Received: by 2002:a9f:21f8:: with SMTP id 111mr25660755uac.115.1608008534209;
 Mon, 14 Dec 2020 21:02:14 -0800 (PST)
MIME-Version: 1.0
References: <DBBPR04MB79793525394F70DE397E24038BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
In-Reply-To: <DBBPR04MB79793525394F70DE397E24038BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
From:   Jun Li <lijun.kernel@gmail.com>
Date:   Tue, 15 Dec 2020 13:02:03 +0800
Message-ID: <CAKgpwJXMFSHxi7vE5cOxkYPTnY74oB-SKf3FikerCzFDLYqcbw@mail.gmail.com>
Subject: Re: port power is on again after turning off by user space
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Peter Chen <peter.chen@nxp.com> =E4=BA=8E2020=E5=B9=B412=E6=9C=8815=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=8811:33=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Alan,
>
> I use one HUB power control application (https://github.com/mvp/uhubctl) =
to investigate power switchable HUB, and
> find the kernel turns port power on again at drivers/usb/core/hub.c, afte=
r port power is turned off by user space.
>
> 5122                 if (hub_is_port_power_switchable(hub)
> 5123                                 && !port_is_power_on(hub, portstatus=
)
> 5124                                 && !port_dev->port_owner)
> 5125                         set_port_feature(hdev, port1, USB_PORT_FEAT_=
POWER);
>
> The main sequence for testing turn port power off like below:
>
> - uhubctl sends command to turn specifc port (eg, 2-1.4) power off.
> - devio at kernel gets that command, and send to hub.
> - port power is off, the hub_event is triggered due to port status is cha=
nged.
> - usb_disconnect is called, but port power is on again by kernel at funct=
ion hub_port_connect.
>
> I can't find the code history why the port power needs to turn on after d=
evice is disconnected, do you know why?
> Any sugguestions to fix it? Thanks.

Seems in this case the port need claimed by user app, I am seeing this comm=
it

commit fbaecff06a7db4defa899a664fe2758e5161b39d
Author: Deepak Das <deepakdas.linux@gmail.com>
Date:   Wed Jan 21 23:39:58 2015 +0530

    usb: core: hub: modify hub reset logic in hub driver

    Currently if port power is turned off by user on hub port
    using USBDEVFS then port power is turned back ON
    by hub driver.
    This commit modifies hub reset logic in hub_port_connect() to prevent
    hub driver from turning back the port power ON if port is not owned
    by kernel.

    Signed-off-by: Deepak Das <deepakdas.linux@gmail.com>
    Acked-by: Alan Stern <stern@rowland.harvard.edu>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index b4bfa3a..3e9c4d4 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4655,9 +4655,13 @@ static void hub_port_connect(struct usb_hub
*hub, int port1, u16 portstatus,
        if (!(portstatus & USB_PORT_STAT_CONNECTION) ||
                        test_bit(port1, hub->removed_bits)) {

-               /* maybe switch power back on (e.g. root hub was reset) */
+               /*
+                * maybe switch power back on (e.g. root hub was reset)
+                * but only if the port isn't owned by someone else.
+                */
                if (hub_is_port_power_switchable(hub)
-                               && !port_is_power_on(hub, portstatus))
+                               && !port_is_power_on(hub, portstatus)
+                               && !port_dev->port_owner)
                        set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);

                if (portstatus & USB_PORT_STAT_ENABLE)

Li Jun
>
>
> Best regards,
> Peter Chen
>
>
