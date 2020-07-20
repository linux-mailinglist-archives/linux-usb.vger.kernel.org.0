Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 216EC22625D
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 16:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgGTOnD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 10:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgGTOnD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jul 2020 10:43:03 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C1AC061794
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2020 07:43:03 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id k23so17813703iom.10
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2020 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=AzSHEuv17HYVoMickq0zE1CffPl0lF4DcXAquwGOxlk=;
        b=s+er6cMme0YcBfO/WgBfSK6vQInLeXTy1dHCm18g8utWUg6w6s7vhVjDyTqDfLREBV
         pSYGvDYOKCkdTAZqTdT+ElPjfy/92xMDoE/EuxgzxPCAeoaPHU9t34vy11b9NYvCBzHG
         6/9ix9x3UVPumvd14PKVjrphvnFY2D/ev/UYKGr2iPK1WKbsEFYlxf7Yz+4Hwk1wXFeQ
         q23mDck9nVMbfeELvoYbyaZP/SkpiAc2c2rDXE/gIuIMLwRyfvd7uiqpHe5boicCDciy
         vGTnsfGaXJnMVgM6IlJvPvZNhScwduZoXiMPLO0KZIPgSHOfeta4XyUBE9HsLOXDZaF/
         1YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=AzSHEuv17HYVoMickq0zE1CffPl0lF4DcXAquwGOxlk=;
        b=WP6Pz2quylpUoHtvu8KI4AJqiMhHLQEjAUtK84CUUFEfqiYbikqc6m2ypzjeqkk895
         WlzX6s844UMwOriEWP5Cn/pww+CY/WK6TEZtw0kSTzOu7bZ7FYLUyApllNGUTxbPEbCe
         btfxsN+fs1Ts47suuUyg4Pxy2KOVXO4m5zytPR50lXvW9C0W3+h8DaKR7aOf00IHlrZK
         ap5Na1G8q2++rZOQnYQ78Pw+MSs/TvF7wqmKH1htCqSJF6VKc6NYVU1ZU6TeC4OFdQz6
         usmJxSerUbbW5USDcM3UdEuDJhI7jwsvJ6SDMUiOiiIMHINV+9tCG7aZhK77JeY8sEtg
         zMAg==
X-Gm-Message-State: AOAM533Syoc92hXqg4DPKkWr/RtBHeoeFOovxLhfTCeutgv2yVCAV6gz
        sYturJDmUD4nDpmdYwz9djBDcY8TAmfoE/r+QNIbkiXRPQ8=
X-Google-Smtp-Source: ABdhPJyuYdAQ85QziTeAdFLay+hWmFBshponT5LyYnvKEBqBHq6Cd3KTtBHuQJ76oBM27Pms5VpLnXwlc5y8GwLx3v8=
X-Received: by 2002:a6b:b2d1:: with SMTP id b200mr22902590iof.137.1595256182670;
 Mon, 20 Jul 2020 07:43:02 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?B?U1pJR0VUVsOBUkkgSsOhbm9z?= <jszigetvari@gmail.com>
Date:   Mon, 20 Jul 2020 16:42:26 +0200
Message-ID: <CAJK_Yh-KwrrWeGY5s=RKJDhp0gyZBf+LsWCydKSfj0dEAYGHCA@mail.gmail.com>
Subject: linux usb gadget - mass storage
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I would like to ask a few questions about the Linux USB Gadget
project, more specifically about the mass storage gadget itself.
Currently it is possible to emulate a CD reader with an iso image
file, which works okay, and has been around for some time.
My use-case would be to use a Raspberry PI Zero, to emulate an optical
drive through an iso file and boot a desktop machine with it.
Unfortunately I also noticed that there were attempts a number of
years ago to contribute support for DVD reader emulation, but
unfortunately those efforts did not get into the mainline kernel.

To be more specific I am referring to these:
http://linuxehacking.ovh/2013/07/12/how-to-emulatore-dvd-rom-hardware-usb/
https://lkml.org/lkml/2015/3/7/388

In an effort to explore the possibilities, I took Tiziano Bacocco's
patch (the first of the two) and ported it (in a trivial way) to the
current Raspberry PI kernel versions (both 4.19.118 and 5.4.44) and
compiled the kernel and modules.
The code compiled cleanly after a few minor changes, but when I tried
to use it on an 11 GB CentOS iso image, the module crashed.
I would need some help and guidance to resolve any of the possible
issues, and hopefully to make DVD-ROM emulation finally a thing in the
mass storage gadget.
I can add further details later on if there will be anyone interested.
Also, if this is not the correct forum to ask questions about the
Linux USB Gadget codebase, then please let me know also.

Thank you!

Best Regards,
J=C3=A1nos Szigetv=C3=A1ri
--
Janos SZIGETVARI
RHCE, License no. 150-053-692

LinkedIn: linkedin.com/in/janosszigetvari

__@__=CB=9AV=CB=9A
Make the switch to open (source) applications, protocols, formats now:
- windows -> Linux, iexplore -> Firefox, msoffice -> LibreOffice
- msn -> jabber protocol (Pidgin, Google Talk)
- mp3 -> ogg, wmv -> ogg, jpg -> png, doc/xls/ppt -> odt/ods/odp
