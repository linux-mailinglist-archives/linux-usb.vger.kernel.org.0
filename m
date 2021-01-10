Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39E792F09FF
	for <lists+linux-usb@lfdr.de>; Sun, 10 Jan 2021 23:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbhAJWQe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Jan 2021 17:16:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbhAJWQe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 Jan 2021 17:16:34 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF8CC061786
        for <linux-usb@vger.kernel.org>; Sun, 10 Jan 2021 14:15:54 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id q25so15208663otn.10
        for <linux-usb@vger.kernel.org>; Sun, 10 Jan 2021 14:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rollanet.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FeY0R+KnBPNxRYB83oAYrtzIPt+5YyCmU6DKgkPFGf8=;
        b=K8SthIZqZUYgFym9TVuDn1YF16TbGMAEpxWcdUL/KqvWhChGdrUa8ub93LT2PPBUub
         PHzqm73PWA/ZAHJwgFkaCXCf71aWpUQrUeJqcfgPs2HvdnvM6lIaRMq9HUP7V6m3+Mnp
         u6I7gq5EkZGoXuSibipUEK4AGYDKQxLrmovyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FeY0R+KnBPNxRYB83oAYrtzIPt+5YyCmU6DKgkPFGf8=;
        b=sfaxA+AoMrvCH592FOoJoAEScsd1zKnQSDWZmVnEzmBg64D294Yt8iKJ8G1RMDeSLf
         bfNfTIbO6EqtPUIyinD7bs+7bMtHOHzTbyXSCSUmuN7tpgzrJ8/PFPktf6f0SXCHthGE
         IHmvZlTsUjRhSbX3s/ZNK86DFrUnTh0Bqmbep/EUv51k9vvKbtfROYJ/ldJhtXYN2aOv
         IiHzsI0MwpmxSYWynz4F2b2g5n+wO6XSSdS2Ks/0ZE5O7EWF0UBOMPBRkYdE58bOy1tt
         zi5EByXD6t7KZGIvNnMipNcD6NBWPOdOlRvx51ZD5ELuGF3F21hRVdk5pUhmETp4KWwQ
         2b8Q==
X-Gm-Message-State: AOAM5325oxQI0CQAImOaod+MjtMgvl41LuwLmm6Z4cdPUj+GFMJTQ9Bk
        fQ/PiD5f5jzBsDz08fYR/Bmgvtygdwcglcw2ufexjA==
X-Google-Smtp-Source: ABdhPJxrcbvsw0Q+LXkYys4lz6flOlOxWdTY0gVTsnMIx5CzEHLvpgK90f73mmuWyQuEBFOPxj7wsy6Lj35EdejZ45M=
X-Received: by 2002:a05:6830:90a:: with SMTP id v10mr9206313ott.364.1610316953517;
 Sun, 10 Jan 2021 14:15:53 -0800 (PST)
MIME-Version: 1.0
References: <CADuz4ONmN299aw460r4wXCEK5F1v9kt_cewCCrdg2hb5nJV9uQ@mail.gmail.com>
 <X/gwVvn09NFiIOWw@hovoldconsulting.com> <CADuz4ONNPq+mADWYPKp8+M2rZtuoMwjO=+HDXfgrO2dQ0S1vQA@mail.gmail.com>
 <X/htEGiNbjGb2dy8@hovoldconsulting.com> <CADuz4OPCnq_4Xx-sWc-ZijoQRAZR-4+MRvpOx4np2rXifoCL5A@mail.gmail.com>
 <X/rtPpHMii7AxXPJ@hovoldconsulting.com>
In-Reply-To: <X/rtPpHMii7AxXPJ@hovoldconsulting.com>
From:   Joe Abbott <jabbott@rollanet.org>
Date:   Sun, 10 Jan 2021 16:15:41 -0600
Message-ID: <CADuz4OPhcFSdRhw9pmjzhEwaLJMih+X-suZg=NRR-QwOq8410A@mail.gmail.com>
Subject: Re: pl2303.c 110 baud not working
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

>
> You're only replying to me instead of replying to "all" so that the USB
> mailing list is CCed. We don't do kernel development in private so
> please make sure that your mails do not drop the list from CC.
>
> I've added linux-usb@vger.kernel.org back on CC in my replies.

OK.  Now I see why my posts were not showing up.

> Look for the set-line-request control request:
>
>         bmRequestType   0x21
>         bRequest        0x20    (SET_LINE_REQUEST)
>         wValue          0
>         wIndex          0
>         wLength         7
>
> the data stage should contain the corresponding 7 bytes of request data
> for 110/cs7/parenb:
>
>         d5 0e 00 80 00 02 07

Windows wireshark  URB_CONTROL_OUT packets
using putty set to at 110 baud 7E1

The windows usb captures have these 7 bytes for 110 baud:
           a8 a6 01 80 00 02 07

and these 7 bytes for 9600 baud:
           80 25 00 00 00 02 07   0x2580 = 9600

--------------------------------------------------------------------
Linux wireshark URB_CONTROL_OUT packet
using stty 110 evenp

usb capture for 110 baud 7E1
            d5 0e 00 80 00 02 07

I tried hard coding the first four 110 baud bytes into buf[0] - buf[3]
in the divisor subroutine and
110 baud work fine.  Possible problem in the divisor routine?

Thank you.


>
> where the first four bytes encodes the baud rate (either directly or as
> for 110 baud using divisors, see the code for details).
>
> I'm afraid I don't have time to be reverse-engineering this myself, but
> if you manage to find a difference in how the Windows driver configures
> your device we may be able to figure out how to get 110 baud working.
>
> Johan
