Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794EA3194AE
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 21:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhBKUqV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Feb 2021 15:46:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbhBKUqO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Feb 2021 15:46:14 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF29C061756
        for <linux-usb@vger.kernel.org>; Thu, 11 Feb 2021 12:45:34 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id n10so4747102pgl.10
        for <linux-usb@vger.kernel.org>; Thu, 11 Feb 2021 12:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Ebf2iyk2sDPJNE/46h+qWPL4xv5D5vr7QpF6kav1Xw0=;
        b=AcazD/jjuYL1bRmgv5rAO1uv4cKX/eRnEHgI+Mzua6MJRb0hPNrpZ1HEfXDfEzPWOu
         VvlZBLFd88N1/Q3gDpGihJD7ySyd7rNHPPYz+4gkPndNxMyCMQWRjPwkI8LmLJ1nSjOP
         Ivh7RGN8BYZkA10WV9eRQ2MnAXZocwvJFvEvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Ebf2iyk2sDPJNE/46h+qWPL4xv5D5vr7QpF6kav1Xw0=;
        b=Gc+AV/9EVTcoyPNlBPC6AOvFrWuA1xY3ZW7L40cGekt0b/PD2wPooqME66zTRA/aWb
         HmulNJuU1vziffnwGWyh0v1TNVcNu2xRgmWaRl3HTxXo6IfbPpT119E3J0m28RlPhUIE
         3c6ruDncRjUMrmYB3GWY0aisi4eDxNzHyaPo3UTMAPOVnAF9D+92vkaFfub1VXIYORfL
         No3/C4oOceuo15Bi4T60YnayZ3bnQpWhz8GAD2AcFGx6XRrwLRSSXWDJ6SE5Zx7Yuo5i
         axgZtwv6xu2hKAGMB34fKxhlI45zUbha+9+35tViJ0OP2vh7MzAhlqJrAoQyBWeYPT8e
         cRsw==
X-Gm-Message-State: AOAM53263rHRPDsAhEtZ7vk2LrnM1gSSeik2B2XKXaUK0u7TQPM87aXc
        3Tj4mSY/tNGQRxOOo1MtX3RZFw==
X-Google-Smtp-Source: ABdhPJxPjRecZil7JtsMPcwLmQncqmN5j3ifme8W4bfenH5tqLi0jrHlSFzaQF2KdUsqf0mSH3mc1A==
X-Received: by 2002:a63:c64f:: with SMTP id x15mr9515084pgg.196.1613076333902;
        Thu, 11 Feb 2021 12:45:33 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:f038:5688:cf3c:eca2])
        by smtp.gmail.com with ESMTPSA id j185sm7086727pge.46.2021.02.11.12.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 12:45:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YCWVU7YCE+WzRx9v@google.com>
References: <20210210171040.684659-1-mka@chromium.org> <20210210091015.v5.3.I7a3a7d9d2126c34079b1cab87aa0b2ec3030f9b7@changeid> <20210210210645.xapaua7djdsvr3ca@kozik-lap> <YCRcIuCxB8nYi7/e@google.com> <161307087919.1254594.11784819060723374369@swboyd.mtv.corp.google.com> <YCWVU7YCE+WzRx9v@google.com>
Subject: Re: [PATCH v5 3/4] usb: host: xhci-plat: Create platform device for onboard hubs in probe()
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
To:     Matthias Kaehlcke <mka@chromium.org>
Date:   Thu, 11 Feb 2021 12:45:31 -0800
Message-ID: <161307633188.1254594.14761449293146776857@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Matthias Kaehlcke (2021-02-11 12:36:35)
> Hi Stephen,
>=20
> On Thu, Feb 11, 2021 at 11:14:39AM -0800, Stephen Boyd wrote:
> >=20
> > Is it possible to use the graph binding to connect the USB controller on
> > the SoC to the port on the hub? Then the hub would be a standalone node
> > at the root of DT connected to the USB controller (or phy) and xhci code
> > could probe the firmware to see if there's a graph connection downstream
> > that is a powered hub like this. I didn't see this idea mentioned in the
> > previous discussions, but maybe I missed it.
>=20
> Thanks for bringing this up. I'm not sure I completely understand your
> suggestion, but in general it seems a direction that could be worth
> exploring.

Cool.

>=20
> I think something like the following should work even without requiring
> cooperation from the XHCI code:
>=20
> onboard-usb-hub {
>     compatible =3D =E2=80=9Crealtek,rts5411=E2=80=9D, =E2=80=9Conboard_us=
b_hub=E2=80=9D;
>     #address-cells =3D <1>;
>     #size-cells =3D <0>;
>=20
>     vdd-supply =3D <&pp3300_hub>;
>=20
>     port@0 {
>         reg =3D <0>;
>=20
>         rts5411_3_0: endpoint {
>             // should not be needed
>             remote-endpoint =3D <&usb_1_dwc3_port1>;
>         };
>     };
>=20
>     port@1 {
>         reg =3D <1>;
>=20
>         rts5411_2_0: endpoint {
>             // should not be needed
>             remote-endpoint =3D <&usb_1_dwc3_port2>;
>         };
>     };
> };
>=20
> &usb_1_dwc3 {
>     dr_mode =3D "host";
>     #address-cells =3D <1>;
>     #size-cells =3D <0>;
>=20
>     port@1 {
>         reg =3D <1>;
>=20
>         usb_1_dwc3_port1: endpoint {
>             remote-endpoint =3D <&rts5411_3_0>;
>         };
>     };
>=20
>     port@2 {
>         reg =3D <2>;
>=20
>         usb_1_dwc3_port2: endpoint {
>             remote-endpoint =3D <&rts5411_2_0>;
>         };
>     };
> };
>=20
> That looks like an actual description of the hardware, without multiple DT
> nodes for the hub.
>=20
> The USB part of the onboard_hub driver could determine the platform device
> from the remote endpoint and register the USB device with it.

Yeah you got it, this is what I'm suggesting. I'd like to go even
further and also describe the ports on "the other side" or "downstream
facing side" of the USB hub that go to things like type-c ports or
type-a ports. This would allow us to describe the USB topology and how
it is physically connected to ports on the device that humans see. But
that's mostly a job for the type-c subsystem, so it's a parallel
discussion that's only related because of the graph binding.
