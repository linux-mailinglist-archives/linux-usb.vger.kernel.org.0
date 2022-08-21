Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB25E59B636
	for <lists+linux-usb@lfdr.de>; Sun, 21 Aug 2022 22:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbiHUUD5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Aug 2022 16:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiHUUD4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Aug 2022 16:03:56 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12AEBE24
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 13:03:54 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-31f445bd486so242919817b3.13
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 13:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=one-eyed-alien.net; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=nPHPjzX6iA8Sisu1M26fpGyHV1o2jUgndD/2PkzbqC4=;
        b=JAcOr1cdfYTsap7V5rbW7hERv5xWXC5h752rfbPQHZAeGZAah1xA1bgVobkcmBmxwz
         B2D6Te1b/oxWFgEoJjrWA7eH4BhJ/LvFJEW1dGhai1zojIwBQevRwtKivpwITQQ5WHxG
         D8hiXeo1/aH4wMyikzlyj/ro/G2+ckxQxJkUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=nPHPjzX6iA8Sisu1M26fpGyHV1o2jUgndD/2PkzbqC4=;
        b=nPH9iw3inVHes5wPFp8D0zFVhme43SgCCpKNaQNB54VVS8tNWw5/FWLYmWcdzLClYQ
         ImUVrZbm466YBxNr4WsB6kmogFO1Tl+dCXOaBUiXLwfDMaX/xIkVrUEU5ROxA3FgbEZg
         PrqCQB4b1y75TzPKBhWW4F2tp1rwbB4R1GZidmW7hZFsJU9w/VzI63qpAoBL33jCbJTB
         CbzuSLkap0EOeWLn6gF07f6WKLLAsQPavfTC0GQPeAsWT3kCrovKJ4s0YvrXFQnF3seI
         Fr+OXWQmf8stmXo9GdMpXnnRXVCvhHO2fItdV2hAyIoedDF1pg0jhO2Co/NyVghUO+4R
         BhJw==
X-Gm-Message-State: ACgBeo3n9RBRRCKi61suA031IXTC28zXETdcmCEOOCVTBb6hzqBNmOvX
        s7WT6jLB2p9xuV6ngx3VQ4RWXmcqMVi0p5ehhvJQmFG4EDiaag==
X-Google-Smtp-Source: AA6agR4+2D3rAxxY+yHMHqdjjDTcRNh0c0oRmT8TvJYOy9qzN/wVp7RGpfqHW+mbR85vkAYfOKAI7FsYFVpO7zxrcfo=
X-Received: by 2002:a0d:ed05:0:b0:336:dba:4792 with SMTP id
 w5-20020a0ded05000000b003360dba4792mr17517472ywe.366.1661112234078; Sun, 21
 Aug 2022 13:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
 <YwJFZNUob3BtEM2h@rowland.harvard.edu>
In-Reply-To: <YwJFZNUob3BtEM2h@rowland.harvard.edu>
From:   Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Date:   Sun, 21 Aug 2022 13:03:43 -0700
Message-ID: <CAA6KcBC+4c9JTAt6=HJOciVW=gJ0KsiRWJeNGx-X2g5s+aafFQ@mail.gmail.com>
Subject: Re: USB disk disconnect problems
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     James Dutton <james.dutton@gmail.com>,
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

(Re-sending, as the first one got blocked by the list for having an HTML pa=
rt).

On Sun, Aug 21, 2022 at 7:47 AM Alan Stern <stern@rowland.harvard.edu> wrot=
e:
>
> On Sun, Aug 21, 2022 at 12:17:30PM +0100, James Dutton wrote:
> > I know my suggested behaviour might be detrimental for some users, in
> > case one modifies the usb disk in another computer and then comes
> > back, but I would like an option that assumes it has not been plugged
> > into anything else.

In the =E2=80=9Cold days=E2=80=9D (that is, my original design for use-stor=
age) it
used to do exactly what you are looking for - based on VID, DID, and
SerialNumber it would =E2=80=9Cremember=E2=80=9D devices. The SCSI host wou=
ld never be
destroyed, and when a device re-appeared it would be re-connected to
the existing host.

That caused all sorts of problems. The SCSI and block layers just
couldn=E2=80=99t handle it well. A clean umount / mount cycle worked fine, =
but
if you unexpectedly disconnected the device all hell broke loose and
there was no way to recover.

I did it this way because, way back when, there were issues
dynamically destroying SCSI hosts. The people who worked on those
other layers found it much, much easier to fix that problem than try
to make it possible to recover from an unexpected disconnect.

Honestly, I=E2=80=99m not even sure where you would need to begin to make t=
his
work. It would require pretty radical changes is the block I/O layers
to differentiate different failure modes, keep a lot more data around
after certain types of failures, allow for specifying which devices
this new policy (which is assuming reconnected devices really haven=E2=80=
=99t
been altered) applies to, etc =E2=80=94 it=E2=80=99s a big lift.

Matt
aka =E2=80=9Cthe guy who originally designed how this works=E2=80=9D

--=20
Matthew Dharm
Former Maintainer, USB Mass Storage driver for Linux
