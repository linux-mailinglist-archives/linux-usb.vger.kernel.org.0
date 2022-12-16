Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8B664ED68
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 16:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbiLPPG2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 10:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbiLPPFz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 10:05:55 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D9713DCB
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 07:05:51 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id fu10so2924967qtb.0
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 07:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AzrHktixScbaXzl6gCbEa0rhGLreaC7RzX5ZwWFZp8=;
        b=uMlCQnuBep8pY36cxvyQXOafmhqP/4zOVT62E66h56xvDKfQiMddjbBPaGUr19RGmR
         rB7RVdJuyrk21ydY97CgHcHS67x80FoYo0zjtPqhKAubyXMNnaHgLDU/27SKw2Pj9m2H
         anOWffARqQbYvNf/2x/oNVEbb3NWl2q40emmhNsPEfckk5ZebUDqLIAvCP2A7M/JDZGs
         pN9zYCCpBvACmPtRBE0iXSVjdLMhF0EuXt2taCuNVuaw3eDiNEyaJLW2/Er9F2ibFLfS
         Da/QfE13bSKwtjTcl825Cee7OtLGrOLaf0gpEPZaFow05FFMzUWJpBmRShdg8X1nmI8T
         RlrA==
X-Gm-Message-State: ANoB5pkGfthTu7P6qJdOLIQpqtAkn18EuGUa9xGHrBkKBrrUwY4XMXpW
        5zYW9NzTLZB+P56ZfjBTYKdZYVLRCtM0CQ==
X-Google-Smtp-Source: AA0mqf4ebReBFH2tGTvRJTRwlZb6DrZilnv+21kmI88vogf4iQZ5N7C6tocYJM4O8QEQfkjydyZR/w==
X-Received: by 2002:ac8:660f:0:b0:3a8:b87:7f70 with SMTP id c15-20020ac8660f000000b003a80b877f70mr37171892qtp.11.1671203150513;
        Fri, 16 Dec 2022 07:05:50 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id ch6-20020a05622a40c600b003a81029654csm1432939qtb.31.2022.12.16.07.05.49
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 07:05:49 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 192so2649687ybt.6
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 07:05:49 -0800 (PST)
X-Received: by 2002:a25:7204:0:b0:6f0:9ff5:1151 with SMTP id
 n4-20020a257204000000b006f09ff51151mr66442813ybc.543.1671203149221; Fri, 16
 Dec 2022 07:05:49 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdU4VQ8kvM=1bXpDmVGicU7-T78f0uZw8G2wZWctnwsJog@mail.gmail.com>
 <X66aMn2K4Kla/s5T@localhost>
In-Reply-To: <X66aMn2K4Kla/s5T@localhost>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Dec 2022 16:05:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4x6Yycmhnra_NmAjS51Da-R-qtJJh1_n4QD4Es5mEcw@mail.gmail.com>
Message-ID: <CAMuHMdW4x6Yycmhnra_NmAjS51Da-R-qtJJh1_n4QD4Es5mEcw@mail.gmail.com>
Subject: Re: USB multi-serial using few endpoints?
To:     Johan Hovold <johan@kernel.org>
Cc:     Bin Liu <b-liu@ti.com>, Felipe Balbi <balbi@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Kieran Bingham <kbingham@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Paul Stoffregen <paul@pjrc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

CC Andrew (mxuport), Paul (Teensy)

On Fri, Nov 13, 2020 at 3:37 PM Johan Hovold <johan@kernel.org> wrote:
> On Fri, Nov 13, 2020 at 02:07:41PM +0100, Geert Uytterhoeven wrote:
> > TL;DR: I'm looking for a USB-to-multi-serial solution that uses as few
> > USB endpoints as possible.  Anyone with a good suggestion?
>
> Moxa has a device with 16 ports that only use three endpoints; see the
> mxuport driver.

Thank you, that was exactly what I was looking for!

> > While I cannot replace USB-serial convertors on development boards, I
> > can replace the USB serial implementation on the Teensy.  Hence I'm
> > looking for a more efficient USB-multi-serial protocol (preferably one
> > that has a Linux driver), using as few endpoints as possible.
> > I'm not a USB expert, but If I'm not mistaken, an N-port
> > USB-multi-serial adapter could be implemented using only 2 or 3
> > endpoints (one "locked" input endpoint for signalling, and one (TX/RX
> > combined) or two (TX and RX separated) multiplexed endpoints for data)?
>
> Right, you'd (typically) need two bulk endpoints for tx and rx. The Moxa
> protocol use a third for signalling events. (And USB devices always have
> a control endpoint, which I don't count here).
>
> > If no such thing exists, I guess I can use the mos7840 protocol instead?
> > Or is there a better solution?
>
> You can always roll your own minimal mux protocol in case the moxa one
> is too complex (and we may want to keep an alternative implementation
> separate for other reasons).

That's what Kevin suggested at last ELCE, too.  The main disadvantage
is that it needs its own driver, and thus doesn't work with any existing
(old) kernel.

Finally I managed to find to time to implement and deploy this, and
it's been working fine in my board farm for the last 2 months.
As this is not Linux-specific, but Teensy-specific, I like to direct
the interested people to the Teensy forum:
https://forum.pjrc.com/threads/71684-A-better-multi-serial

Thanks again!



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
