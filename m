Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68CA47215C6
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jun 2023 11:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbjFDJQi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Jun 2023 05:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjFDJQh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Jun 2023 05:16:37 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6246CB1
        for <linux-usb@vger.kernel.org>; Sun,  4 Jun 2023 02:16:36 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b1b8593263so14066951fa.2
        for <linux-usb@vger.kernel.org>; Sun, 04 Jun 2023 02:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685870194; x=1688462194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FfuSgGldzIkIC93DcQvqf5rwRqiaE7YMm6Zt8k3kic=;
        b=nrdq2n42nzqDoJYw0k73axQicNWo7rLYlGyJlKdPP47Gip1sv9E3OvQM9Km9Ft7wOo
         oTcmHcgzQ/Y1uV9G4Gk2bKU0h/PsA+TSrqzDhYS7/dI4kEKD+/BTMQAga5ETSDQM62Yf
         faM0ydacAno0Mwaf6joMRFt9uJdCW7NBcOJNEzOYicrXIcPeGcudI5naTvI3KHWA6BB+
         15Q91ocwCoeKhbC5RjLSB5wNoTfCfmAMlU6W8tdUxb0Zz3rDnNm3EDiJ+XbKggGNcvVl
         BGuNvnrFAl25sp4wTZgeBkD7uZgDRaYwPzvvAAcsOkwJ3fXXDV16iLdGN3Wuoca2LiZi
         wIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685870194; x=1688462194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FfuSgGldzIkIC93DcQvqf5rwRqiaE7YMm6Zt8k3kic=;
        b=cIpHXIYSHrlbgkP47Vi7dYSQQpn7XUN/PRu4Ps3SMdjSkTzskba3ufDgCFOdGiOq+F
         liSo0trMNXsPMgSDt1MyrVqovmWIxzTpF3uI5fwXCanUbSEEJ2tWJUYoK9kDfqExP7TH
         CcAdlgIDqy5aLWWwkbi7mPVaAzNxxQR3ZvjGaIK/Eg7FhJI2qJUhRI6p4BWpUbLOw/mC
         prQIx/LIVsBZhPaMtYhujiEvDAOX5AyfuEk4CFZbj4VlX37nsZG6QcPi2Sp4OgAdQKhe
         0GyHOjy8VZbUJbNugaqt2PlWhvQkAer+EinKNz/yp1/A0WTpNQ5nwMrheFzRD7o0vmqq
         vvag==
X-Gm-Message-State: AC+VfDzPOg3iDUmZvB7kApuHaLNQ1e/3oRw3/Frdtvji6Pp8Ecd/XxEP
        oSNiC3uxJ9bfudGPu7GxpGh3J1KSUv4Wc/dIFMU=
X-Google-Smtp-Source: ACHHUZ5N+xqlMV3UG5HOdSg3HJ0zMsKiqldy+ciYWfecqtNMNs9Yqj9P8omhws6Lk18x4VyLq2s2i4SuJZCNweCGPe4=
X-Received: by 2002:a2e:96c2:0:b0:2b1:c1ac:6f56 with SMTP id
 d2-20020a2e96c2000000b002b1c1ac6f56mr979215ljj.7.1685870194319; Sun, 04 Jun
 2023 02:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230602091055.65049-1-mika.westerberg@linux.intel.com>
 <20230602091055.65049-4-mika.westerberg@linux.intel.com> <CA+CmpXs2K8Bi2xHk_hhWC3x6rVeTQ=SbtjuxLSBV+3rjHRwxVQ@mail.gmail.com>
 <20230604051136.GQ45886@black.fi.intel.com>
In-Reply-To: <20230604051136.GQ45886@black.fi.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Sun, 4 Jun 2023 12:16:18 +0300
Message-ID: <CA+CmpXtNgVRrOdJyTvcyPSxa9jxkNjQvPbGtmbSickL7QFwYPA@mail.gmail.com>
Subject: Re: [PATCH 3/3] thunderbolt: Enable/disable sideband depending on
 USB4 port offline mode
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh H Patel <utkarsh.h.patel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 4, 2023 at 8:11=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Sat, Jun 03, 2023 at 10:24:38PM +0300, Yehezkel Bernat wrote:
> > On Fri, Jun 2, 2023 at 12:11=E2=80=AFPM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > >
> > > When USB4 port is in offline mode (this mean there is no device
> > > attached) we want to keep the sideband up to make it possible to
> > > communicate with the retimers. In the same way there is no need to
> > > enable sideband transactions when the USB4 port is not offline as the=
y
> > > are already up.
> > >
> > > For this reason make the enabling/disabling depend on the USB4 port
> > > offline status.
> >
> > I'm probably missing something here, but if we don't allow disabling it=
 when the
> > port is offline, and when the port is online the sideband is enabled, w=
hen can
> > it be disabled? If we can manually disable it when the port is online, =
on
> > enablement we can't assume that it's already enabled just because the p=
ort
> > is online, as we might have manually disabled it earlier.
>
> We allow disabling them when the port is online. This all basically
> separates how the device attached and non-device attached handle the
> sideband communications.

OK, but then we don't enable it back, as we assume it's enabled because the
port is online, even while the user might have disabled it earlier?
