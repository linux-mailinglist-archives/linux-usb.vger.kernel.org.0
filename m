Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A69E500E59
	for <lists+linux-usb@lfdr.de>; Thu, 14 Apr 2022 15:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243124AbiDNNKS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Apr 2022 09:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232078AbiDNNKR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Apr 2022 09:10:17 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1EEF7890F
        for <linux-usb@vger.kernel.org>; Thu, 14 Apr 2022 06:07:52 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id k23so9947031ejd.3
        for <linux-usb@vger.kernel.org>; Thu, 14 Apr 2022 06:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OXJWrHR39duk3OxBtfd3HGo0tcnwuOhLcIA2k/7/Obg=;
        b=IiDsroNi7FnBEJYY3ypNapgYbdT39kJ/3Gnqct0dbOEZakE6g+xZT3FbNzX+HkCszV
         xI5Us5B54woDMzXBmlXn5mhAmHtluFDgCWacaA1I/EF6kku96kR4rjBSw5msXN3R95R/
         +jJ868QMBavVkg/j6tYRSKZyZdVX70pmTBW1WhFs716gP6aHnD+kHM4qhhaf17YaEpqH
         BI7f9YmmQq2kA7bKSy89smjlb9CMVKaNg2IHj/dRI43TAPjofMyom/DHCOZrbEod0hmQ
         Q3Xh8LsEEVpU/HMagQDzVVgVgoUMBz2GcbucFzaeupSCtuAS4IfgWzszbrq19i7kKSX8
         icIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OXJWrHR39duk3OxBtfd3HGo0tcnwuOhLcIA2k/7/Obg=;
        b=I07J+2uXLiPgRChJBUBlTWa/l60GvVVw+KR3yoA/ehls095u5IOPQWZvnnpxmyf3qk
         p1vNegfS1ZH7kxJrWIoiC5KgvEAc9gb6lOoSJ1JRFEmVgM0qr8CmAlyvbntGXp7ad8qX
         1C9Vo1hTulC0F/ZDKmerXcO4jWQqliZO+yx4dOu9DV2sZS+i3zCS8e2+k+LAWqxCCHcD
         IRkxhybYT00wszE1Azmr4VIHzTujd+6rsJv0cLMzyWRMbzp13cyjK3ulsGotYFx6qvWq
         cWLcYMg9SAWlnadyFDVlos4FrxkkjtxtiHmKNlhp0vV86Qjc6eOSTUImkSIGE4jcol2/
         XZlA==
X-Gm-Message-State: AOAM532Pdc5cC8GZHf/R1nbz/SyXzp5x+Ja63T0d4ymHQvLSXKLvWm/X
        BQbISvqb+lN3XFtrlLN7BgYtw3Wf9zpDrnIzmKs=
X-Google-Smtp-Source: ABdhPJxDk+cf++wshqm0c3FrybokbxJSb+4b3o1MWw0m+Wy97y//MXx+ohTs4J3Cs2wQjJtTwENAKVbtagrRXNlNeRA=
X-Received: by 2002:a17:907:7b8b:b0:6e8:9dd9:59ac with SMTP id
 ne11-20020a1709077b8b00b006e89dd959acmr2256371ejc.588.1649941670881; Thu, 14
 Apr 2022 06:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xK9sZGXruaLzbam+t2REqvKiTrWbZ-GdA3gXux=9B-2Lw@mail.gmail.com>
 <CAKgpwJXD-fju1=zHZY2vOxcKMY6gLOfCi+Cp543NoC9sa_3=oA@mail.gmail.com>
 <CAHCN7x+Ru9Prvc2YW13gqWCSp7S7GBd0XqnghrxSoqnb4jZ6Cw@mail.gmail.com>
 <VI1PR04MB43337DFA47857C9EAD2E756089EC9@VI1PR04MB4333.eurprd04.prod.outlook.com>
 <DB8PR04MB684349F5C77C27B0016FF6F28CEF9@DB8PR04MB6843.eurprd04.prod.outlook.com>
In-Reply-To: <DB8PR04MB684349F5C77C27B0016FF6F28CEF9@DB8PR04MB6843.eurprd04.prod.outlook.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 14 Apr 2022 08:07:39 -0500
Message-ID: <CAHCN7xJCkg9MBVBao+SzcTGXA0=0UiH6u76pefuugt9PnA9aXQ@mail.gmail.com>
Subject: Re: Using PTN5110 w/ USB Hub
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     Jun Li <jun.li@nxp.com>, Jun Li <lijun.kernel@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 14, 2022 at 8:05 AM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Hi jun,
>
> > -----Original Message-----
> > From: Jun Li <jun.li@nxp.com>
> > Sent: Wednesday, April 13, 2022 9:16 PM
> > To: Xu Yang <xu.yang_2@nxp.com>; Adam Ford <aford173@gmail.com>; Jun Li
> > <lijun.kernel@gmail.com>; Xu Yang <xu.yang_2@nxp.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>; Heikki Krogerus
> > <heikki.krogerus@linux.intel.com>; USB list <linux-usb@vger.kernel.org>
> > Subject: RE: Using PTN5110 w/ USB Hub
> >
> >
> >
> > > -----Original Message-----
> > > From: Adam Ford <aford173@gmail.com>
> > > Sent: Tuesday, April 12, 2022 11:58 PM
> > > To: Jun Li <lijun.kernel@gmail.com>
> > > Cc: Guenter Roeck <linux@roeck-us.net>; Heikki Krogerus
> > > <heikki.krogerus@linux.intel.com>; USB list
> > > <linux-usb@vger.kernel.org>; Jun Li <jun.li@nxp.com>; Xu Yang
> > > <xu.yang_2@nxp.com>
> > > Subject: Re: Using PTN5110 w/ USB Hub
> > >
> > > On Tue, Apr 12, 2022 at 10:37 AM Jun Li <lijun.kernel@gmail.com> wrot=
e:
> > > >
> > > > Adam Ford <aford173@gmail.com> =E4=BA=8E2022=E5=B9=B44=E6=9C=8812=
=E6=97=A5=E5=91=A8=E4=BA=8C 08:24=E5=86=99=E9=81=93=EF=BC=9A
> > > > >
> > > > > I have a board with a dual role USB conttroller connected to a
> > > > > dual role hub
> > > >
> > > > Could you please explain more about what's "a dual role hub"?
> > > Thanks for responding.
> > >
> > >
> > > The datasheet is listed here:
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
w1.
> > > m
> > >
> > icrochip.com%2Fdownloads%2Fen%2FDeviceDoc%2F00002238D.pdf&amp;data
> > =3D04%
> > > 7
> > >
> > C01%7Cjun.li%40nxp.com%7C71a9f6a3197248e09d0708da1c9d4187%7C686ea
> > 1d3bc
> > > 2
> > >
> > b4c6fa92cd99c5c301635%7C0%7C1%7C637853758981725860%7CUnknown%7
> > CTWFpbGZ
> > > s
> > >
> > b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> > %3D
> > > %
> > >
> > 7C3000&amp;sdata=3DVFowzrzgNKvG7ZbXGMUBtmMa2nV5bH5Jl9knYVS%2BJ7w
> > %3D&amp;
> > > r
> > > eserved=3D0
> > >
> > > I worded that poorly, sorry.  It supports DCP, CDP, SDP.
> > >
> > > From the datasheet:
> > > =E2=80=A2 USB Hub Feature Controller IC Hub with:- 1 USB 3.1 Gen 1 US=
B
> > > Type-CTM downstream port- 4 USB 3.1 Gen 1 legacy downstream ports- 1
> > > USB 2.0 downstream port- Legacy upstream port =E2=80=A2 USB-IF Batter=
y Charger
> > > revision 1.2 support on up & downstream ports (DCP, CDP, SDP)
> >
> > P2 ~ P6 all are normal downstream ports, how about P1? It's just has 2 =
sets of SS
> > lanes(for typec) but still downstream port(DFP)?
> >
> > >
> > > The hope was to have the PTN enable the SRC_EN when the USB-C cable i=
s
> > > connected to the hub.
> >
> > If you use the correct USB-C cable(Present Rd), PTN should detect a sin=
k and
> > Linux tcpm + tcpci driver will enable SRC_EN for you, Did you correctly=
 enable
> > the typec port driver?
> >
> > Cat /sys/kernel/debug/usb/tcpm-xxx/log
> >
> > @Xu Yang, could you help check if a source only config like below still=
 Can work?
> >
> >         ptn5110: tcpc@50 {
> >                 compatible =3D "nxp,ptn5110";
> >                 pinctrl-names =3D "default";
> >                 pinctrl-0 =3D <&pinctrl_typec>;
> >                 reg =3D <0x50>;
> >                 interrupt-parent =3D <&gpio4>;
> >                 interrupts =3D <19 8>;
> >
> >
> >                 usb_con: connector {
> >                         compatible =3D "usb-c-connector";
> >                         label =3D "USB-C";
> >                         power-role =3D "source";
> >                         data-role =3D "host";
> >                         source-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXE=
D_USB_COMM)>;
> >
> >                         ports {
> >                                 #address-cells =3D <1>;
> >                                 #size-cells =3D <0>;
> >
> >                                 port@1 {
> >                                         reg =3D <1>;
> >                                         typec_con_ss: endpoint {
> >                                                 remote-endpoint =3D <&u=
sb3_data_ss>;
> >                                         };
> >                                 };
> >                         };
> >                 };
> >         };
>
> After my check, the ptn5110 can work with the above source only config.

 I've been sick for a few days, so when I can work on this again, I
will give it a try.

I think I understand it better now. Thanks for your help.

adam
>
> Xu Yang
>
> >
> > >
> > > >
> > > > > connected to a PTN5110 for enabing power to the USB-C.
> > > > >
> > > > > SoC -> Hub -> PTN-> USB-C
> > > >
> > > > What signals of Hub chip connect to PTN5110 chip?
> > >
> > > Technically, only the CC pins are connected between the USB-C
> > > connector and the PTN5110.  There isn't really a connection to the hu=
b
> > > itself, but the output on the PTN enables a regulator which powers th=
e
> > > USB-C which does connect to the hub.
> >
> > That's a typical usage.
> >
> > >
> > > >
> > > > >
> > > > > The hope was the PTN5110 would enable/disable the src_en pin when
> > > > > I connect a device that needs power.  Unfortunately, most of the
> > > > > examples I can see for the device trees on a PTN5110 show some
> > > > > sort of connection to a USB controller, but  I am going through a
> > > > > hub, not a controller.
> > > > >
> > > > > Is it possible to configure the PTN5110 to either not require
> > > > > connection to a USB controller or plumb it to a USB hub?
> > > >
> > > > My understanding PTN5110(TCPCI controller with PD PHY) is
> > > > independent with USB data path, for USB data path, I think it shoul=
d be:
> > > > SoC -> Hub -> USB-C
> > > > PTN5110 should not care or know if there is a Hub between type-C
> > > > connector and USB controller.
> > > > If the type-C connector connects to a Hub, then it's a DFP only on
> > > > data, and from power point view, you also only power source role, r=
ight?
> > >
> > > Yes.  We're basically trying to source power when a device is
> > > connected and power down the regulator when the USB-C device is
> > > disconnected. Unfortunately, the PTN5110 never enables power even whe=
n
> > > I specify it's source only with no sink.  The driver acts like it
> > > needs some sort of USB node,
> >
> > If you don't need usb data dual role(host and device), I assume the typ=
ec node
> > does not need link to any usb controller node, PTN just works to enable
> > power(via SRC_EN) and do orientation flip.
> >
> > > and when it doesn't find one, and the
> > > example device tree in the YAML file shows a refernce to the USB
> > > controller.  I assumed I needed to plumb it to the hub somehow.  If I
> > > am reading your response correctly, I should just add the node for th=
e
> > > USB controller and forget the hub exists, is that correct?
> >
> > You even need not link PTN to USB controller, see my comment above.
> >
> > Li Jun
> >
> > >
> > > >
> > > > thanks
> > > > Li Jun
> > > > >
> > > > > thanks
> > > > >
> > > > > adam
