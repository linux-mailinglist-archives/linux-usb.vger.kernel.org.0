Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A00D54FE579
	for <lists+linux-usb@lfdr.de>; Tue, 12 Apr 2022 17:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357462AbiDLQAk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Apr 2022 12:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357464AbiDLQAf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Apr 2022 12:00:35 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF043606D5
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 08:58:16 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id u18so12222804eda.3
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 08:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m1yq9l0phMbDs3OaJdyAKM7+LDXcEviQZ1GJC5Fwlyk=;
        b=QTyF6TOTAbxyQ/n3mq/gdKTk8dv3QMiBFFfoiXixBh0yk3VuEKPPTAL9XYe0d7C9OK
         0168MLAdWBMJmQ68xPK9EYj/I4cp9ljl4dciVdMtcK19mQlqEkzdMNcMVQdkZglr8I82
         f1q349Jxp6Ad0VWnyEVpBB+qqhbnxy+i8Hy0i5PVqqtzjdIFSlcfyKprnDFgFH4knII3
         gZK1kXjpUedxN6h99i+rbndmcz+tXwA12wZKl2t46Tg8bD8xotUmO8ENMyXYP7rUhmBN
         TLwShjEvXmnY3iRowKMFHeAihi+LhnVjEzNlQy2s7+UdP+KhytInvYK4i/twm0d6vRLJ
         3FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m1yq9l0phMbDs3OaJdyAKM7+LDXcEviQZ1GJC5Fwlyk=;
        b=1wy9RSZTRm7IhPbhc7nArC915jiQttzfkC9sJg+okBoydHQ71M+Gkzt+rUnbwl/aeY
         wKMXDOEkoBmEd7JopbPXxIsFEOd0T3nGrSZghy+QqafFAR5jI+afCu3QQARGMOQ7LsxI
         qVW6O6LdSqVboMB3x/zSaN5qzJk/HiXepFtsuZJJKtaOkJWIP7uqO+9y7jwZhtGAnBtF
         C7q2HwhHvt1j/solrrXuPNYHx0Gmv98j11jMJJbcklxJs34lc/L7SfBfPSlR9Goh+24f
         dZ6+ti+l7a2vDczgwtedlubCpzTbDvqe2wreoTn0YvhdKK3wzWKhRKJcDalAgL111Yfw
         r66w==
X-Gm-Message-State: AOAM531qQVJ/3qSSSCsvWBV2ZQhWwO79C1reljaDYoEfNiny24U4dLab
        ANrGzhLqDYOwKv2i9gwILLfwAYRlktrtok/+9/Q0Ougs+eg=
X-Google-Smtp-Source: ABdhPJxIahc36M9/LU/M8IGQxYVmbV2IbM3B02Dkxmn4aVjjVw5RQSJuAS/77wAxdoac73jEyfdArq6wNKNynnZw2sg=
X-Received: by 2002:a05:6402:515b:b0:41d:82c2:2749 with SMTP id
 n27-20020a056402515b00b0041d82c22749mr8838170edd.38.1649779095104; Tue, 12
 Apr 2022 08:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xK9sZGXruaLzbam+t2REqvKiTrWbZ-GdA3gXux=9B-2Lw@mail.gmail.com>
 <CAKgpwJXD-fju1=zHZY2vOxcKMY6gLOfCi+Cp543NoC9sa_3=oA@mail.gmail.com>
In-Reply-To: <CAKgpwJXD-fju1=zHZY2vOxcKMY6gLOfCi+Cp543NoC9sa_3=oA@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 12 Apr 2022 10:58:03 -0500
Message-ID: <CAHCN7x+Ru9Prvc2YW13gqWCSp7S7GBd0XqnghrxSoqnb4jZ6Cw@mail.gmail.com>
Subject: Re: Using PTN5110 w/ USB Hub
To:     Jun Li <lijun.kernel@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>, Li Jun <jun.li@nxp.com>,
        xu.yang_2@nxp.com
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

On Tue, Apr 12, 2022 at 10:37 AM Jun Li <lijun.kernel@gmail.com> wrote:
>
> Adam Ford <aford173@gmail.com> =E4=BA=8E2022=E5=B9=B44=E6=9C=8812=E6=97=
=A5=E5=91=A8=E4=BA=8C 08:24=E5=86=99=E9=81=93=EF=BC=9A
> >
> > I have a board with a dual role USB conttroller connected to a dual
> > role hub
>
> Could you please explain more about what's "a dual role hub"?
Thanks for responding.


The datasheet is listed here:
https://ww1.microchip.com/downloads/en/DeviceDoc/00002238D.pdf

I worded that poorly, sorry.  It supports DCP, CDP, SDP.

From the datasheet:
=E2=80=A2 USB Hub Feature Controller IC Hub with:- 1 USB 3.1 Gen 1 USB
Type-CTM downstream port- 4 USB 3.1 Gen 1 legacy downstream ports- 1
USB 2.0 downstream port- Legacy upstream port
=E2=80=A2 USB-IF Battery Charger revision 1.2 support on up & downstream po=
rts
(DCP, CDP, SDP)

The hope was to have the PTN enable the SRC_EN when the USB-C cable is
connected to the hub.

>
> > connected to a PTN5110 for enabing power to the USB-C.
> >
> > SoC -> Hub -> PTN-> USB-C
>
> What signals of Hub chip connect to PTN5110 chip?

Technically, only the CC pins are connected between the USB-C
connector and the PTN5110.  There isn't really a connection to the hub
itself, but the output on the PTN enables a regulator which powers the
USB-C which does connect to the hub.

>
> >
> > The hope was the PTN5110 would enable/disable the src_en pin when I
> > connect a device that needs power.  Unfortunately, most of the
> > examples I can see for the device trees on a PTN5110 show some sort of
> > connection to a USB controller, but  I am going through a hub, not a
> > controller.
> >
> > Is it possible to configure the PTN5110 to either not require
> > connection to a USB controller or plumb it to a USB hub?
>
> My understanding PTN5110(TCPCI controller with PD PHY) is independent
> with USB data path, for USB data path, I think it should be:
> SoC -> Hub -> USB-C
> PTN5110 should not care or know if there is a Hub between type-C connecto=
r
> and USB controller.
> If the type-C connector connects to a Hub, then it's a DFP only on data,
> and from power point view, you also only power source role, right?

Yes.  We're basically trying to source power when a device is
connected and power down the regulator when the USB-C device is
disconnected. Unfortunately, the PTN5110 never enables power even when
I specify it's source only with no sink.  The driver acts like it
needs some sort of USB node, and when it doesn't find one, and the
example device tree in the YAML file shows a refernce to the USB
controller.  I assumed I needed to plumb it to the hub somehow.  If I
am reading your response correctly, I should just add the node for the
USB controller and forget the hub exists, is that correct?

>
> thanks
> Li Jun
> >
> > thanks
> >
> > adam
