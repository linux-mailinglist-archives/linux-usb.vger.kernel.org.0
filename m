Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB97D4DCE85
	for <lists+linux-usb@lfdr.de>; Thu, 17 Mar 2022 20:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237875AbiCQTNj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Mar 2022 15:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbiCQTNg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Mar 2022 15:13:36 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA95209A5C
        for <linux-usb@vger.kernel.org>; Thu, 17 Mar 2022 12:12:19 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id c15so8506944ljr.9
        for <linux-usb@vger.kernel.org>; Thu, 17 Mar 2022 12:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=70wXCEMgvAba9C3vGcfmMLOn2TwRxcgtIcIQrKsC1PA=;
        b=Lzg8x3KChJqWfgD6vFv3FTcYnlD3GVRJEV5X594eQdcePX5tYMgjgCO/gFzLW0L6JS
         aPxiT6WdRSv7Gre/WOKy8L3QNA2biDeayMXn2Owin8BXjXNIx/aBv0lfDtq98t3scis9
         9LFUV5qoCxzkFD9Ft1JJ6sdxGQaUREEAoiex0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=70wXCEMgvAba9C3vGcfmMLOn2TwRxcgtIcIQrKsC1PA=;
        b=BU/h6lEdHobjdZfZS4Avq5nKqqIJBHabXkNxqtES/Tyr5FJ1OwTJRSZCTkL+NtuZrM
         GvM1h+lG7YvByLWKJbmf7NAzlyokJvJ6Q/HaZ+a81hANBH6Oh3GqrAJ6UOQgeBFlRYwg
         YqwxxQMte4s0wwCafkN/BtqEznYndjKZmH8kbRswkjxZNjr+iy0JJJypcWnaJDYkDeNq
         GfzcbM8d/vRhMCAF6dqt91xMymNMIT8bRbaDWjjWGti7MuX1jkgTE445XRWGX3LF+s65
         c0GcvKE2rztt4/GRj8F5VAPWUwk9Iwcyvxt2HUf2hSGZwVWkPm0+lIIYnaodHrSG2alC
         yspQ==
X-Gm-Message-State: AOAM530DaWabcSFQWTFjKm8kBMnpxLYGRAhdo3M1zt0GPkcyqs3DEh8S
        AAm6I3WiAfh4QyvrVBUwVr7rB+r+fkPIJx18trg=
X-Google-Smtp-Source: ABdhPJyuyURuPJ/maw711/YQRFDvE65p1tp/vrxZwfdz8BlDAGjn2g7DClKo9axPXbAMYkqYrqZMlw==
X-Received: by 2002:a05:651c:516:b0:249:23ef:d9c7 with SMTP id o22-20020a05651c051600b0024923efd9c7mr3827499ljp.202.1647544337300;
        Thu, 17 Mar 2022 12:12:17 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id s20-20020a2e1514000000b00247e5d4e37fsm500337ljd.28.2022.03.17.12.12.15
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 12:12:16 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id bn33so8527931ljb.6
        for <linux-usb@vger.kernel.org>; Thu, 17 Mar 2022 12:12:15 -0700 (PDT)
X-Received: by 2002:a05:651c:1213:b0:247:e2d9:cdda with SMTP id
 i19-20020a05651c121300b00247e2d9cddamr3813842lja.443.1647544335450; Thu, 17
 Mar 2022 12:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <6232d299.9omOW8g6S6l31UFc%lkp@intel.com> <YjNfHsqfjPqBMejZ@rowland.harvard.edu>
In-Reply-To: <YjNfHsqfjPqBMejZ@rowland.harvard.edu>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 17 Mar 2022 12:11:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=whkHmpA2FM6Ve8bUu7hcyWBLznQU8RJzOdpfa-0EVPCpQ@mail.gmail.com>
Message-ID: <CAHk-=whkHmpA2FM6Ve8bUu7hcyWBLznQU8RJzOdpfa-0EVPCpQ@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION 8a11187eb62b8b910d2c5484e1f5d160e8b11eb4
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     kernel test robot <lkp@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        LinusTorvalds@rowland.harvard.edu,
        USB mailing list <linux-usb@vger.kernel.org>,
        USB Storage list <usb-storage@lists.one-eyed-alien.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 17, 2022 at 9:17 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> These warnings seem pretty bogus.  Their meaning isn't entirely clear,
> but the statements they complain about copy a 1-byte location to a
> structure consisting of eight 1-bit fields (or the equivalent).

bit field sizes are not well-defined by the standard.

Eight 1-bit bitfields may well be an "int", with just 8 bits used (and
it might be the high 8 bits of the 'int').

The fact that you declare them with "char member:1" does *not* mean
that the bitfield is encoded in a char. It might be. Or it might not
be.

"packed" may or may not help.

The basic fact is that bitfields simply are not hugely well-specified.
They are a convenience feature, not a "this is the layout in memory"
feature.

The fix for the warning itself would probably something along the lines of this:

    --- a/drivers/usb/storage/ene_ub6250.c
    +++ b/drivers/usb/storage/ene_ub6250.c
    @@ -2400,7 +2400,6 @@ static int ene_ub6250_resume(struct
usb_interface *iface)

     static int ene_ub6250_reset_resume(struct usb_interface *iface)
     {
    -       u8 tmp = 0;
            struct us_data *us = usb_get_intfdata(iface);
            struct ene_ub6250_info *info = (struct ene_ub6250_info
*)(us->extra);

    @@ -2412,10 +2411,9 @@ static int ene_ub6250_reset_resume(struct
usb_interface *iface)
             * the device
             */
            info->Power_IsResum = true;
    -       /*info->SD_Status.Ready = 0; */
    -       info->SD_Status = *(struct SD_STATUS *)&tmp;
    -       info->MS_Status = *(struct MS_STATUS *)&tmp;
    -       info->SM_Status = *(struct SM_STATUS *)&tmp;
    +       info->SD_Status = (struct SD_STATUS) { .Ready = 0,};
    +       info->MS_Status = (struct MS_STATUS) { };
    +       info->SM_Status = (struct SM_STATUS) { };

            return 0;
     }

but the fact is, using bitfields there is simply WRONG. Because this
code that sets these fields from the hardware results:

        info->SD_Status =  *(struct SD_STATUS *) bbuf;

is fundamentally buggy. You are assuming little-endian bitfields. That
is just not well-defined.

Just don't do this. Use 'unsigned char' to specify that you want a
byte, and use actual flags values to test the bits in that byte.
Because that is actually well-defined and works.

Yes, yes, yes, you *can* use bitfields if you absolutely have to, but
then you have to sprinkle the end result with

    #if defined(__BIG_ENDIAN_BITFIELD)
    .. declare it in one order..
    #else
    .. declare it in the reverse order ..

and even then you need to just pray that the compiler packs things right.

See include/uapi/linux/cdrom.h for an example of where we do it.
Because people started using bitfields long ago, and never fixed it,
and it became part of the API interface and is even exposed to user
space. Ugh.

Please don't repeat that mistake. It's been repeated several times
because people think bitfields are convenient. And they *can* be
convenient, but only for pure software uses where the actual placement
of the bits doesn't matter.

                   Linus
