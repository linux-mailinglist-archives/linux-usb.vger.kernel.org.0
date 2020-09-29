Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E585227BB1B
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 04:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgI2Co0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 22:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbgI2Co0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 22:44:26 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E6EC0613CE
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:44:25 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id w11so63299vsw.13
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=du0LpYhMc2coaa2W/VPPJIZfYKYeR/Zd26zfBJn6HZU=;
        b=JdnGypDGchYfJUMn1e0y03eunpjNQD8EeW9dWpN6m6OH4q643xScWrJ4ztkoE/UEbY
         /RDGlkO1+SBZdthpGWjWQhnLhMQMKHy1EaEL/73WKbJfk/FNJ9OLXq85jVx0/NiBEiW6
         q1RTdglBdll/nk0pYJw0QVatuYy0QzvvdgtURcFp/SsA85n7ieVlz13Zw++ghfu7Y8ym
         moF2uRzpiA9/T6DpE9FEI8hPN72z1C/TvSfHU1EX8l3L22y9GC4p6GJHLDEyQH4wLCTT
         PTAg+UpvknampBCRlaAZlnJEgkIT0XB4IUiJsic20XI0Pe3y/17O/rCWEdY4z81im1KZ
         aOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=du0LpYhMc2coaa2W/VPPJIZfYKYeR/Zd26zfBJn6HZU=;
        b=M+iiXvUpmEUG141LTCFB7Z+owf3FfCuk4fEVImRDaYyWXHSgeJSmIU6iIwzIQsC8v1
         JYST5BYFWnCB38sBFwwNUvU9aecAJwFDPgX0KwWJp/+D9EU/kMw8TFHZLDcBcKjjLqp4
         fEYz+jZqh1N70hOD8+/JW2dOrSReikXyqno0XrlKKHOBhpfvpzIClTOoS4IjH4vd+lc2
         iFUOoI+LTXeVgL2u1wsQuNq4d6S+jRSl3TV7NBQ9ZCMnR5JQOLEURBLavI/f9nseDSWC
         WrXj4MaEgKxdbINa5gAMrYCtUMa9pbtEF67hvaPJ6emnsqJ6FjaXuW90StKRBkTWgNiM
         mR6w==
X-Gm-Message-State: AOAM531/oGfnRs+VjHWP/ltGH5CrAnq2MbrmtAm9C74wjp1A0K91HIBi
        ozYLp/gQFClNZNiQCqSs5YXzP5dz8XiW7CZkLCwKLQ==
X-Google-Smtp-Source: ABdhPJz7HsvGAR8ybFZBMtwGK2p9twjVlkK7EiXllkwgdYHhnaaIhF5FIUxKg9l8dpdIb9/R+PC1X+yzes1MK7SI3e8=
X-Received: by 2002:a67:c398:: with SMTP id s24mr1619426vsj.58.1601347464908;
 Mon, 28 Sep 2020 19:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200921195555.1050731-1-badhri@google.com> <20200921195555.1050731-5-badhri@google.com>
 <CAKgpwJUqfyZv1+-A4R8R--O-u2R65T+VUxL6PtW4c6kG0FJWfg@mail.gmail.com>
 <CAPTae5LcTqoc52C01rQjL9NzA5Yh=NH0zvvJNosih8n2kMTn+A@mail.gmail.com> <CAKgpwJXEyeeh9_W-A4JfcRCeV5iXnEeiZBZoDPDT_s23TkLSuw@mail.gmail.com>
In-Reply-To: <CAKgpwJXEyeeh9_W-A4JfcRCeV5iXnEeiZBZoDPDT_s23TkLSuw@mail.gmail.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Mon, 28 Sep 2020 19:43:48 -0700
Message-ID: <CAPTae5Kkse5o-d-XKosgkqVszqX=D+=+8zSay05a_9zL2qciJQ@mail.gmail.com>
Subject: Re: [PATCH v8 05/11] dt-bindings: connector: Add property to set
 initial current cap for FRS
To:     Jun Li <lijun.kernel@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 28, 2020 at 1:57 AM Jun Li <lijun.kernel@gmail.com> wrote:
>
> Badhri Jagan Sridharan <badhri@google.com> =E4=BA=8E2020=E5=B9=B49=E6=9C=
=8824=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:09=E5=86=99=E9=81=93=
=EF=BC=9A
> >
> > Hi Jun,
> >
> > Thanks for the feedback !
> > The sink PDO from current source reflects the current source's(i.e.
> > transmitter of the FRS signal) power requirement during fr swap.
> > The current sink (i.e. receiver of the FRS signal) should check if it
> > will be able to satisfy the current source's
> > requirement during frswap before enabling the frs signal reception.
> > The property in this patch refers to maximum current capability
> > that the current sink can satisfy.
>
> In this case I agree a new property is required.
>
> Rob mentioned another similar property for typec[1], which is
> for typec source(without power delivery) to define its power
> capability to present its Rp, so a different usage.
>
> [1]https://lore.kernel.org/linux-arm-kernel/20200902075707.9052-2-amelie.=
delaunay@st.com/
>
> > Perhaps, I should name it
> > sink-frs-typec-current. Does that make sense to you ?
>
> it looks better, thanks.

Ended up naming it new-source-frs-type-ccurrent and have sent the
v9 version of the patch. Thanks for you reviews !

>
> Li Jun
> >
> > Thanks,
> > Badhri
> >
> > On Wed, Sep 23, 2020 at 3:43 AM Jun Li <lijun.kernel@gmail.com> wrote:
> > >
> > > Badhri Jagan Sridharan <badhri@google.com> =E4=BA=8E2020=E5=B9=B49=E6=
=9C=8822=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=883:57=E5=86=99=E9=81=
=93=EF=BC=9A
> > > >
> > > > This change adds frs-typec-current which allows setting the initial=
 current
> > > > capability of the new source when vSafe5V is applied during PD3.0
> > > > sink Fast Role Swap.
> > > >
> > > > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > > > ---
> > > > Changes since v1:
> > > > - Changing patch version to v6 to fix version number confusion.
> > > >
> > > > Changes since v6:
> > > > - Removed the redundant usb-connector.txt that I created by mistake=
.
> > > > - Moved to yaml.
> > > >
> > > > Changes since v7:
> > > > - Rebase
> > > > ---
> > > >  .../devicetree/bindings/connector/usb-connector.yaml   |  8 ++++++=
++
> > > >  include/dt-bindings/usb/pd.h                           | 10 ++++++=
++++
> > > >  2 files changed, 18 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/connector/usb-connec=
tor.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > > index 9bd52e63c935..1ca8e6a337e5 100644
> > > > --- a/Documentation/devicetree/bindings/connector/usb-connector.yam=
l
> > > > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yam=
l
> > > > @@ -142,6 +142,14 @@ properties:
> > > >      required:
> > > >        - port@0
> > > >
> > > > +  frs-typec-current:
> > > > +    description: Initial current capability of the new source when=
 vSafe5V
> > > > +      is applied during PD3.0 Fast Role Swap. "Table 6-14 Fixed Su=
pply PDO - Sink"
> > > > +      of "USB Power Delivery Specification Revision 3.0, Version 1=
.2" provides the
> > > > +      different power levels and "6.4.1.3.1.6 Fast Role Swap USB T=
ype-C Current"
> > > > +      provides a detailed description of the field.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > >
> > > If it's a part of sink PDO, I think you don't need a new property for=
 this, just
> > > define it directly into sink-pdos by adding a new PDO define for PD 3=
.0,
> > > something like:
> > >
> > > sink-pdos =3D <PDO_FIXED_v3(5000, 3000, PDO_FIXED_USB_COMM, FRS_CURRE=
NT_1P5A)>;
> > >
> > > Li Jun
> > > > +
> > > >  required:
> > > >    - compatible
> > > >
> > > > diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb=
/pd.h
> > > > index 985f2bbd4d24..db1ad4532197 100644
> > > > --- a/include/dt-bindings/usb/pd.h
> > > > +++ b/include/dt-bindings/usb/pd.h
> > > > @@ -35,6 +35,16 @@
> > > >
> > > >  #define VSAFE5V 5000 /* mv units */
> > > >
> > > > +/*
> > > > + * Based on "Table 6-14 Fixed Supply PDO - Sink" of "USB Power Del=
ivery Specification Revision 3.0,
> > > > + * Version 1.2"
> > > > + * Initial current capability of the new source when vSafe5V is ap=
plied.
> > > > + */
> > > > +#define FRS_NOT_SUPPORTED      0
> > > > +#define FRS_DEFAULT_POWER      1
> > > > +#define FRS_5V_1P5A            2
> > > > +#define FRS_5V_3A              3
> > > > +
> > > >  #define PDO_BATT_MAX_VOLT_SHIFT        20      /* 50mV units */
> > > >  #define PDO_BATT_MIN_VOLT_SHIFT        10      /* 50mV units */
> > > >  #define PDO_BATT_MAX_PWR_SHIFT 0       /* 250mW units */
> > > > --
> > > > 2.28.0.681.g6f77f65b4e-goog
> > > >
