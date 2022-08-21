Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E70459B66C
	for <lists+linux-usb@lfdr.de>; Sun, 21 Aug 2022 23:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbiHUV0z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Aug 2022 17:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiHUV0z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Aug 2022 17:26:55 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDBB19C26
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 14:26:54 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-3246910dac3so245751807b3.12
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 14:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=one-eyed-alien.net; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=LKwbHvPMgOq2feWhjVqXeZiHBYRYIM+OiJRtxpYB3Ag=;
        b=E0RJsX9+9DLB4zgIMD0wil0lus+QiryyYxt5D+h9L5R5VJmHycyqayNPOpUKPt09pf
         vkJMtB5hADGDymyI/SMBlQqPsOHBhrxQRFolm+mbOOg7qPiyFxPejg2H2fuyE9d67IEY
         +tfVluOQuOu6vnqdPSU7qrcrWYwZGywRwbi88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=LKwbHvPMgOq2feWhjVqXeZiHBYRYIM+OiJRtxpYB3Ag=;
        b=wpBvD4O2vT5RCJjq2wMdADBp/iFJrtVAY8TUD+QN1shTNFb+ijLh+QiuA+JurhB9MP
         n6fmL6lE9Z95jaUrNW+yAxunzoTBkrFmOVdYBgH/V/pQOX2ZFP4Txv+cBuG39hl+AZmN
         DafiUVt4Ml7jTPNKmOlO1WFw6zcjEZbSbwsPPr0gXMPqdG2nIfEdaaXwuIfHA1qGxJmO
         daZg+o/TK069z9JMZbjKfAWVZQq8ZXIuMi1OlbWYf6X2ORsM9ZIRzKdZGNyzOpwR6dit
         jxvovYo697i4BCrhpKdjHYmri7oPMWdq7GqgVlTOIug3Rue3s7FTEnXyFCyucfiAdSr3
         31wg==
X-Gm-Message-State: ACgBeo17kRDjfid5ihg2ZMReot6tcK9cDkllIYUgJNRmDj4AmMTr0Tfi
        5J9NzeaZe8e51IlCRld9wZ6jrD8YGCm9y7Ny5su3KNLwgKw=
X-Google-Smtp-Source: AA6agR78bVvAjJ8JbWD8Yj81zhYjxtffAR4K5JMQOWfUhzMRBeRQLSAurdwAMwKmttrMjUaKPKP0Rlrjd1iL/9N1RNQ=
X-Received: by 2002:a0d:ed05:0:b0:336:dba:4792 with SMTP id
 w5-20020a0ded05000000b003360dba4792mr17772338ywe.366.1661117213368; Sun, 21
 Aug 2022 14:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
 <YwJFZNUob3BtEM2h@rowland.harvard.edu> <CAA6KcBC+4c9JTAt6=HJOciVW=gJ0KsiRWJeNGx-X2g5s+aafFQ@mail.gmail.com>
 <CAAMvbhFWBhkdLW0i5pVsrkJpSKEpsN=9gbHHgaXSP2UavmwvdA@mail.gmail.com>
In-Reply-To: <CAAMvbhFWBhkdLW0i5pVsrkJpSKEpsN=9gbHHgaXSP2UavmwvdA@mail.gmail.com>
From:   Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Date:   Sun, 21 Aug 2022 14:26:42 -0700
Message-ID: <CAA6KcBAbHzvBbP5QzaC-aLKbq3T6J3VjahJjOssS1u++_DJqXQ@mail.gmail.com>
Subject: Re: USB disk disconnect problems
To:     James Dutton <james.dutton@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 21, 2022 at 2:00 PM James Dutton <james.dutton@gmail.com> wrote=
:
>
> On Sun, 21 Aug 2022 at 21:03, Matthew Dharm
> <mdharm-usb@one-eyed-alien.net> wrote:
> >
> > In the =E2=80=9Cold days=E2=80=9D (that is, my original design for use-=
storage) it
> > used to do exactly what you are looking for - based on VID, DID, and
> > SerialNumber it would =E2=80=9Cremember=E2=80=9D devices. The SCSI host=
 would never be
> > destroyed, and when a device re-appeared it would be re-connected to
> > the existing host.
> >
> > That caused all sorts of problems. The SCSI and block layers just
> > couldn=E2=80=99t handle it well. A clean umount / mount cycle worked fi=
ne, but
> > if you unexpectedly disconnected the device all hell broke loose and
> > there was no way to recover.
>
> Are there any situations where we should actually try to recover?
> What about:
> The OS has not needed to read/write to the disk in a while. The USB
> disk idles out and goes into a power save mode by itself.
> The OS then wishes to write something, but would need to go through
> some sort of wake up procedure first.
>
> I don't know if that is a state that is available for USB devices, but
> if it was, would it be fair to try and recover?

That scenario already happens all the time; rotating disks often
spin-down after an idle period and then automatically spin-up at the
next media-access command.  So long as they spin-up within the command
timeout (typically 30 seconds), there is no issue.  BUT, this is very
different from what you originally asked about -- in a low-power
spin-down state, the USB interface is still connected; only the
rotating has stopped.  From the computer's perspective, the device has
always remained attached; the only anomaly is that a command takes
longer-than-usual to complete.

The next level of deeper power savings would be a system-wide suspend
/ resume, which we've already discussed and is a path which is already
handled (and also different from the original scenario you described).

Matt

--=20
Matthew Dharm
Former Maintainer, USB Mass Storage driver for Linux
