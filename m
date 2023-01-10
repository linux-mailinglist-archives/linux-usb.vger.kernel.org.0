Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0852666388C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jan 2023 06:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjAJFYr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 00:24:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjAJFYn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 00:24:43 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E23362FC
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 21:24:42 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id cf18so19379256ejb.5
        for <linux-usb@vger.kernel.org>; Mon, 09 Jan 2023 21:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rcILyZnN23z+VxgxsvoaHQodidHb+rZD69kWFA1n68U=;
        b=TzLZKNn4IVjdtS2D/t+5DIgQwCnA/6Cd0oExsnKZGNtUZ1BsrxFebzwwgbzIdh4FZ7
         K1O0T6zA5SmuNFdyRBINCxl28fYcqJbtvdNTKezEuP8p2sPSUHaliK9k0UPv6XQDh2m7
         6SMR53duXNr2lBeoAv/6l2Ig2GDx0gjuieKOdZFtgWTDMWUBMVWwKqtoQzg3ipII8twZ
         ruTLpVgfxjBXbzG6E/eRDohCTKD7K5LTgVW8Fi4Aeh8gA8ptt6+p4niEubKRc/PQnAUO
         zqiedIJRq38kWpXmOS+oRfhquzxT0ea8WDbYgzFe4nVhhT+jNLQhCeAjkBm8cwgV3WEL
         Li3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcILyZnN23z+VxgxsvoaHQodidHb+rZD69kWFA1n68U=;
        b=uSgj0FFRy/ABJKzzlqXK+lUs+iDHkNN+GolDcdlN1ikxLRXrHXEWrPAnMGPZi1Ayld
         MqfrS5lnIVWO+2DMtNLjRcL6f9QZzFf1QSeb56nsTZTPVWvRZyETfshTvupKels1xa8a
         Q2VhdMDxUNeeBKofUCdEKMuYvZg5ToONSZbxXKXUUI6v69Bm3P3iGTKdB9yGnUS2pT3O
         nWGvL8sbg0eEXqWTsTUva+DzFSPReP6+B0l+VefZusxgWxH1hWkQZNiEDzRVCTAXfnga
         IBBf/Ulec7SvoTg1YE6mEfsYg1urC5jjDTqlizCTxeA4FpzdYvF5PGkisbvsV5eW4FKo
         bEPQ==
X-Gm-Message-State: AFqh2koLgKHbXYAnDaeSoIg8jfT1/Yd+STKFvbPvueLYlzEkkKzS0UKJ
        t/XDi+SdBcOn5hQjq20uUReaijd4LOFXue72QNY=
X-Google-Smtp-Source: AMrXdXvbecVlwJOSg35C3SCFGsSWu+QzjrA3gSKUfCwrJJgPiVyaq2XiVHCsk4qHjj+mkN0g8YgSaF6/8W19EjPx6J8=
X-Received: by 2002:a17:906:bfe3:b0:7de:e71d:b07f with SMTP id
 vr3-20020a170906bfe300b007dee71db07fmr4082460ejb.479.1673328280192; Mon, 09
 Jan 2023 21:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20230109115550.71688-1-qkrwngud825@gmail.com> <Y7w3UgeJHHcR7O6o@rowland.harvard.edu>
In-Reply-To: <Y7w3UgeJHHcR7O6o@rowland.harvard.edu>
From:   Juhyung Park <qkrwngud825@gmail.com>
Date:   Tue, 10 Jan 2023 14:24:28 +0900
Message-ID: <CAD14+f1VjH8569zzx+Hn169LbUW3XHJvx9_vq60qk56P36FoyQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS"
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        gregkh@linuxfoundation.org, zenghongling@kylinos.cn,
        zhongling0719@126.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 10, 2023 at 12:48 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, Jan 09, 2023 at 08:55:50PM +0900, Juhyung Park wrote:
> > This reverts commit e00b488e813f0f1ad9f778e771b7cd2fe2877023.
> >
> > The commit e00b488e813f ("usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS")
> > blacklists UAS for the entire RTL9210 enclosures. Realtek's VendorId is 0x0bda
> > and RTL9210 enclosures reports 0x9210 for its ProductId.
> >
> > The RTL9210 controller was advertised with UAS since its release back in 2019
> > and was shipped with a lot of enclosure products with different firmware
> > combinations.
> >
> > If UAS blacklisting is really required said product (Hiksemi USB3-FW), it
> > should be done without blacklisting the entire RTL9210 products.
>
> We cannot simply revert a patch if it fixes a problem for some devices.
> The devices would then stop working and that would be a regression,
> which is not allowed.

This to me, sounds equivalent to "disable trim on all NVMe SSDs on
'some' vendor because it fixes issues on one reported case, 3 years
after release". More thorough reviews should have taken place to begin
with.

Reading through previous threads for all 7 patch-sets(!), there
apparently was no effort spent in minimizing the affected products,
especially when 0x0bda is blatantly a VendorId for Realtek, or to
avoid using US_FL_IGNORE_UAS at all and try other workarounds, not to
mention Hongling's questionable method of determining whether Windows
uses UAS on it too.

His product name in the commit is also questionable. RTL9210 is a
NVMe-to-USB bridge, but his commit names it "Hiksemi External HDD". I
was unable to find any product online that matches "Hiksemi External
HDD" that could be using a NVMe-to-USB bridge.

Disabling UAS can even workaround a broken hardware, I've seen it
personally happen with a JMS567 controller: the device originally
worked just fine with UAS enabled on both Linux and Windows, later it
started to not work on both platforms and it started working again
under Linux when UAS was disabled. I'd be not surprised if Hongling's
unit is defective.

Unlike US_FL_BROKEN_FUA or US_FL_NO_REPORT_OPCODES, US_FL_IGNORE_UAS
is far more detrimental to both performance and functionality. For
users like me, the original patch is a regression itself as I need
trim to work (which is my topmost concern, rather than just raw
performance).

RTL9210 is an extremely popular NVMe-to-USB bridge controller and the
original patch-set was merged with no real deep thought and reviews
spent into evaluating its effect.

With Hongling not responding to Greg's question for nearly 2 months,
I'm afraid this original patch does more harm than good left
long-term.

Just my two cents, apologies in advance for my strong words.
Thanks, regards

>
> It will be necessary to find some other way of solving this problem.
> For example, a small piece of test code which can safely determine
> whether the firmware can handle UAS.
>
> Alan Stern
>
> > Fixes: e00b488e813f ("usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS")
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Cc: Hongling Zeng <zenghongling@kylinos.cn>
> > Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
> > ---
> >  drivers/usb/storage/unusual_uas.h | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> > index 251778d14e2d..c7b763d6d102 100644
> > --- a/drivers/usb/storage/unusual_uas.h
> > +++ b/drivers/usb/storage/unusual_uas.h
> > @@ -83,13 +83,6 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
> >               USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> >               US_FL_NO_REPORT_LUNS),
> >
> > -/* Reported-by: Hongling Zeng <zenghongling@kylinos.cn> */
> > -UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0x9999,
> > -             "Hiksemi",
> > -             "External HDD",
> > -             USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> > -             US_FL_IGNORE_UAS),
> > -
> >  /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
> >  UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
> >               "Initio Corporation",
> > --
> > 2.39.0
> >
