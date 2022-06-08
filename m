Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0825543288
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jun 2022 16:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241135AbiFHO1g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jun 2022 10:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241117AbiFHO1f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jun 2022 10:27:35 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F2B250246
        for <linux-usb@vger.kernel.org>; Wed,  8 Jun 2022 07:27:28 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id o37-20020a05600c512500b0039c4ba4c64dso5472718wms.2
        for <linux-usb@vger.kernel.org>; Wed, 08 Jun 2022 07:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=tVwQOQOm6XmoLskCbkZeE3k/lHToDOEL0yuXz32rXy4=;
        b=eXfKjHphToHQziJiDWiol8patvCYmmr/AuvohPLo/VbFfaohGS3CaXyEsRf5ISIgXI
         ALb85pOp3XaYDeUy2oxTuIK44Bs2mwvfLErvnON0D4EbXo3pHwmxjGs1DHZsBh1DYgiE
         Pg+mZuxDPRcZXGyWLfYrDDWBmm4XdhzXIutbZadtGJZzKvQl5jh21ivQzu9n0LyhLi1W
         W7v9OtuA5rKs7zDgVHSYEj7hlsaNTcTk3yAGD02e0gbmMg/CqwGfMniiyGWNc8zPI7+S
         fFodo5m2byeL56t7lf8s0fTOiosoA7cvcoewfihJ4RZHXfTyKOxTKNVRz+6IqH8R9WLK
         yX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=tVwQOQOm6XmoLskCbkZeE3k/lHToDOEL0yuXz32rXy4=;
        b=M5T9xVgx14TBGUtzGpd+qq2qmULO/bxmIE9dm7ScRtXWocgkDJCKybqNQbtZV5mqRN
         IRBwdRjCF5k9rQ02hWD3NBR1nJ6gKiULw74CSIJaebw6uQ5DGyM/ALP4evOPju6yIZ9j
         gDeg2olTSg21W2sTxMQOrbSPp8qtudRyMRMbFlnpPA52aycVLEwNmZN/kytTfat7ImQi
         WONH9qWCq3Bbz8UotkoXWRjwlapHz7s2ZcsLnY2s8dwBSOXwhlvW1n3tyLUW6PWQsq3N
         P26EvQ9c+ICJdUWaQQpgBlP25CSixjYJoIg2LYJ0olsld40aJty47/LQ0pQkIsuryFTr
         eybQ==
X-Gm-Message-State: AOAM531mdkN9dMAxDM8/vxCkaXBr83kZKD5Sd8cIeapZOtvX/UG5hnuW
        QV0ubnKWYUS/03TKDFJc72qWRK3xCZs=
X-Google-Smtp-Source: ABdhPJwT3FCigtw69pshla/JTaZCTVWgzhR0c186CHIULm2jWY0na7Sdl346btH/J72H3OqtSuEhaA==
X-Received: by 2002:a05:600c:2345:b0:39c:44ba:5a79 with SMTP id 5-20020a05600c234500b0039c44ba5a79mr25658760wmq.50.1654698446701;
        Wed, 08 Jun 2022 07:27:26 -0700 (PDT)
Received: from [192.168.1.168] (078088109026.wroclaw.vectranet.pl. [78.88.109.26])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d65c4000000b0020d09f0b766sm20812162wrw.71.2022.06.08.07.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:27:25 -0700 (PDT)
Message-ID: <cf0dbecff8e70d15c7121bfdee16d945ba52b55c.camel@gmail.com>
Subject: Re: Thunderbolt: One missing DisplayPort?
From:   Tomasz =?UTF-8?Q?Mo=C5=84?= <desowin@gmail.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Stefan Hoffmeister <stefan.hoffmeister@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Date:   Wed, 08 Jun 2022 16:27:24 +0200
In-Reply-To: <YpmWXl5Y/VToYFvJ@lahna>
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
         <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com> <Yoy7oXpMugFFmfBP@lahna>
         <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
         <YpCVc6eYkpmjP9AF@lahna>
         <CALhB_QP8SPqubq-eBNa1BTMuy3kCA65OuajOeJGt5DB9jDRKKg@mail.gmail.com>
         <ce969e3b4a6ed04584fdecd3234578bd87d52594.camel@gmail.com>
         <YpSUSk9u5z3ueufa@lahna>
         <92ab08fe65c12d6159966bdd7d2c4215044a00ff.camel@gmail.com>
         <YpmWXl5Y/VToYFvJ@lahna>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2022-06-03 at 08:04 +0300, Mika Westerberg wrote:
> On Thu, Jun 02, 2022 at 09:34:27PM +0200, Tomasz Mo=C5=84 wrote:
> > How do I determine that the cable is non-Thunderbolt Type-C?
>=20
> It does not have that "lightning" logo on the connector.

I got two more (to a total of 4) cables without lightning logo and all
seem to enter Thunderbolt mode.

> > I have tried with two different brands 1m USB Type-C cables that are
> > not advertised as Thunderbolt. Both cables are electronically marked
> > and 5A capable. When the docking station is connected using these
> > cables, it operates in Thunderbolt mode.
>=20
> Oh, yeah it is possible actually that with a passive type-C cable that
> it still enters TBT/USB4 mode (20G). I think.

Yes, with all the cables boltctl shows 20 Gb/s =3D 2 lanes * 10 Gb/s

With the 0.7m cable that came with dock (without e-Marker), boltctl
shows 40 Gb/s =3D 2 lanes * 20 Gb/s

> > If the device was operating in USB (+DP altmode), I assume that boltctl
> > would show that the docking station status as disconnected?
>=20
> Correct.
>=20
> > Can I read the cable EMCA details in Linux?
>=20
> This I don't know.

My USB-C Power Meter shows basic EMCA details. I presume the
information is not complete (it only shows it on small display, I
didn't find option to export/dump EMCA).

Below is the EMCA for all 4 cables. None support Thunderbolt, but all,
even the 3m one, manage to enter Thunderbolt mode.


Type     Passive Cable
Vendor   CE-LINK (0x2095)
Specs    [ <10ns (~1m) ] [ 20V ] [ 5A ] [ USB3 10Gbps ]
VER      HW:0009 FW:0001 VDO:0 v:3
Vdo object hex
IdHeader 0x18002095
CertStat 0x00000974
Product  0x00050310
Cable    0x91082042
SVISD    0x00000000
TBT3/4   0x00000000


Type     Passive Cable
Vendor   Unknown (0x0000)
Specs    [ <10ns (~1m) ] [ 20V ] [ 5A ] [ USB3 10Gbps ]
VER      HW:0000 FW:0000 VDO:0 v:3
Vdo object hex
IdHeader 0x18000000
CertStat 0x00000000
Product  0x00000000
Cable    0x00082042
SVISD    0x00000000
TBT3/4   0x00000000


Type     Passive Cable
Vendor   VIA Labs (0x2109)
Specs    [ <20ns (~2m) ] [ 20V ] [ 5A ] [ USB3 10Gbps ]
VER      HW:0000 FW:0000 VDO:0 v:3
Vdo object hex
IdHeader 0x18002109
CertStat 0x00000000
Product  0x00000000
Cable    0x00004042
SVISD    0x00000000
TBT3/4   0x00000000


Type     Passive Cable
Vendor   Yichong (0x315c)
Specs    [ <30ns (~3m) ] [ 20V ] [ 5A ] [ USB3 10Gbps ]
VER      HW:0001 FW:0001 VDO:0 v:3
Vdo object hex
IdHeader 0x1800315c
CertStat 0x00004244
Product  0x00020002
Cable    0x11086042
SVISD    0x00000000
TBT3/4   0x00000000
