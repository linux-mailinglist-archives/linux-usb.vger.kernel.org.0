Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9882F59B665
	for <lists+linux-usb@lfdr.de>; Sun, 21 Aug 2022 23:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbiHUVAV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Aug 2022 17:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbiHUVAU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Aug 2022 17:00:20 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F49720BF5
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 14:00:19 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id c4so6111843iof.3
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 14:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=MYjxHad9HPdr7I8mZYXyNhC/cx+cfHs6Z/Fv4yLOmZQ=;
        b=B6scFXAWMfUcrJAH6Bkoahq+X5MCsMzTMIfz3pRw/YY2QOTCVfQGHmb4REWhJN0k5G
         fjnjfVf126AmpQb7qnBlh+9r1jcFz5YiFaNoohN5g8T+dtyo2/3Rmsb+POJa5/6I8UWe
         0hzbSJ0gqzkSHru5Y4/XJd9uGZoisLqfY1Z4XA6bDXbQ5xCumXFricOrbhCUTA5G6q0n
         jSHEXLSwh/YsA7v/isPNlpLhy5P6wfcCJNJSqlHPnC+2SfraXd+11qZWU7irof+sgyfp
         JAwt+QmU4xNvbiloCQb+K0Qh9Ulhw9B5uEcWEfXeYRW8a7Un0j/PtbjXdT8aD/RozM8b
         H62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=MYjxHad9HPdr7I8mZYXyNhC/cx+cfHs6Z/Fv4yLOmZQ=;
        b=5ylBQCcOtBgs8aHqIWIeLV8oNdBSYnfJbPA1OLDyC48kOpK4+AxPdacqcGydp3obq6
         D8+sj++IkMKlONutrBZkY2oldpshZcX8C+3XM1wd0Y2J8gooRjogFlcWeiGcAdAG99RG
         xb5/xJpLIvmBP1u2au97k418U7HSi26549ayUon8Mdq1BZ19Rcu5wFjkrifgaC6uY0yk
         pyHb9Xdga/z6bdyzlJkUfn6Ijx/xB/ijlCykqrPh3IVf0+/Ee2vWpfJTQqsSB/cheHHx
         A2Q+BfGfeUAG8Cm/6FnTLMr88BC7ad6QoslYsUoDSgA8662Zz/nof0x0TUeHMQ8DzaVN
         mxDQ==
X-Gm-Message-State: ACgBeo1ZYYu99W7WhHxUqmCoe3WiUAUqai4dIRLFkzDkDrQzkYvaGs/6
        PO2PxDl3PfoOL90thB2JeuAoIKP8m3aQO965xUpSuZQ1tTQ=
X-Google-Smtp-Source: AA6agR5I8+euDaLk7EO+GdRYROxdu+UtIiZ/J71CzwtPMvG32qZEVNuK46drx6o59nA8mghJCdr1yvXbHp5/vRkq+BQ=
X-Received: by 2002:a02:ce88:0:b0:344:ccc5:1b4a with SMTP id
 y8-20020a02ce88000000b00344ccc51b4amr7997101jaq.141.1661115618980; Sun, 21
 Aug 2022 14:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
 <YwJFZNUob3BtEM2h@rowland.harvard.edu> <CAA6KcBC+4c9JTAt6=HJOciVW=gJ0KsiRWJeNGx-X2g5s+aafFQ@mail.gmail.com>
In-Reply-To: <CAA6KcBC+4c9JTAt6=HJOciVW=gJ0KsiRWJeNGx-X2g5s+aafFQ@mail.gmail.com>
From:   James Dutton <james.dutton@gmail.com>
Date:   Sun, 21 Aug 2022 21:59:43 +0100
Message-ID: <CAAMvbhFWBhkdLW0i5pVsrkJpSKEpsN=9gbHHgaXSP2UavmwvdA@mail.gmail.com>
Subject: Re: USB disk disconnect problems
To:     Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
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

On Sun, 21 Aug 2022 at 21:03, Matthew Dharm
<mdharm-usb@one-eyed-alien.net> wrote:
>
> (Re-sending, as the first one got blocked by the list for having an HTML =
part).
>
> On Sun, Aug 21, 2022 at 7:47 AM Alan Stern <stern@rowland.harvard.edu> wr=
ote:
> >
> > On Sun, Aug 21, 2022 at 12:17:30PM +0100, James Dutton wrote:
> > > I know my suggested behaviour might be detrimental for some users, in
> > > case one modifies the usb disk in another computer and then comes
> > > back, but I would like an option that assumes it has not been plugged
> > > into anything else.
>
> In the =E2=80=9Cold days=E2=80=9D (that is, my original design for use-st=
orage) it
> used to do exactly what you are looking for - based on VID, DID, and
> SerialNumber it would =E2=80=9Cremember=E2=80=9D devices. The SCSI host w=
ould never be
> destroyed, and when a device re-appeared it would be re-connected to
> the existing host.
>
> That caused all sorts of problems. The SCSI and block layers just
> couldn=E2=80=99t handle it well. A clean umount / mount cycle worked fine=
, but
> if you unexpectedly disconnected the device all hell broke loose and
> there was no way to recover.
>
> I did it this way because, way back when, there were issues
> dynamically destroying SCSI hosts. The people who worked on those
> other layers found it much, much easier to fix that problem than try
> to make it possible to recover from an unexpected disconnect.
>
> Honestly, I=E2=80=99m not even sure where you would need to begin to make=
 this
> work. It would require pretty radical changes is the block I/O layers
> to differentiate different failure modes, keep a lot more data around
> after certain types of failures, allow for specifying which devices
> this new policy (which is assuming reconnected devices really haven=E2=80=
=99t
> been altered) applies to, etc =E2=80=94 it=E2=80=99s a big lift.
>

Are there any situations where we should actually try to recover?
What about:
The OS has not needed to read/write to the disk in a while. The USB
disk idles out and goes into a power save mode by itself.
The OS then wishes to write something, but would need to go through
some sort of wake up procedure first.

I don't know if that is a state that is available for USB devices, but
if it was, would it be fair to try and recover?
