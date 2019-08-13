Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4C08BA75
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2019 15:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbfHMNgp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 09:36:45 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35850 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729078AbfHMNgp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Aug 2019 09:36:45 -0400
Received: by mail-pg1-f195.google.com with SMTP id l21so51272490pgm.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2019 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+IvNSSv0dZm7axcgPut/ZuBnpzRxpjWFBA2DB52xh9c=;
        b=QrxepzLmOBoZK0Vp3cJ2nU93pw3j3fVwLPP8sYLTjyx0IrRfZhfNrpYzbxSV6rTCll
         EmiUYGYTX/d16aMLmSc8zxA6nrlusrfk7a54k3X3x+0w5bKqsCAvGcutC+y5oY1vxqrC
         HB3wcWK9ul5YcGkECANGcKImB6LFLDHw+ivDJsmvT2lE/K6e4KJPGs+wEHMOnl/ab009
         3PmktF3ayV9N06px7vQqpGNxi6fgpDwjJ5x37k7Nn3ZP67mX2GuBdkk4QB7b37w4vSUL
         44PAQ/6IXK21Y77LShwQS5tFQQoUs9mVJXc1EFAJPROnHsBtgVSix1r9eu9T2+wwIVHY
         OeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+IvNSSv0dZm7axcgPut/ZuBnpzRxpjWFBA2DB52xh9c=;
        b=UIy3LVXvdlsBc3NOWFa/ae0/Ba+rim9z4JeZ72S2iXxh6VIbtvQrpWTINDf1NtdY/v
         JWjek+dGO8MD4EZWbqz5TGFKlWG1TNeVIFeol4LGxuKdyNNqpZBdIR1e6wh/xGIzcDFj
         GdmwZIa91z0/NUBFMsn24RnwtZZn67W2rxNll/I/bmsUG+WZoEpYqWNepadnOcoZALCK
         wb+Sb2ZHTrEqthP2fTPUSDNHAaaHzgHV4xW3cS8pahHHm3bv490o3ydodSoSY6eHQJgN
         EZCmH/ERMY5rjU49HdlaFu0k+Ngrq3c2kzH0yOyzEX220W1qxPNaiuCbYiik5pW9HZ6y
         osng==
X-Gm-Message-State: APjAAAVhXX5Z05Yp3aQyFdG20YKC6C20hdoJy+ZrzB0rpSyrVIU/7cWJ
        pTh5Q338Ao48yploRhVBUh9cy5H79dcZenAHILuhQA==
X-Google-Smtp-Source: APXvYqwzus8Mtw0RHdzJEsBAud/s5NcacwuOmBPpD3609fcLHhegjTsTUDGvYfNxqz6BY5e0KvIMty/JsLsr6xzPyEE=
X-Received: by 2002:a17:90a:c20f:: with SMTP id e15mr2243028pjt.123.1565703404043;
 Tue, 13 Aug 2019 06:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000927a7b0586561537@google.com> <MN2PR18MB263783F52CAD4A335FD8BB34A01A0@MN2PR18MB2637.namprd18.prod.outlook.com>
 <CACT4Y+aQzBkAq86Hx4jNFnAUzjXnq8cS2NZKfeCaFrZa__g-cg@mail.gmail.com>
 <MN2PR18MB26372D98386D79736A7947EEA0140@MN2PR18MB2637.namprd18.prod.outlook.com>
 <MN2PR18MB263710E8F1F8FFA06B2EDB3CA0EC0@MN2PR18MB2637.namprd18.prod.outlook.com>
In-Reply-To: <MN2PR18MB263710E8F1F8FFA06B2EDB3CA0EC0@MN2PR18MB2637.namprd18.prod.outlook.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 13 Aug 2019 15:36:33 +0200
Message-ID: <CAAeHK+z8MBNikw_x50Crf8ZhOhcF=uvPHakvBx44K77xHRUNfg@mail.gmail.com>
Subject: Re: [EXT] INFO: trying to register non-static key in del_timer_sync (2)
To:     Ganapathi Bhat <gbhat@marvell.com>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        syzbot <syzbot+dc4127f950da51639216@syzkaller.appspotmail.com>,
        "amitkarwar@gmail.com" <amitkarwar@gmail.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "huxinming820@gmail.com" <huxinming820@gmail.com>,
        "kvalo@codeaurora.org" <kvalo@codeaurora.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "nishants@marvell.com" <nishants@marvell.com>,
        "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 12, 2019 at 6:03 PM Ganapathi Bhat <gbhat@marvell.com> wrote:
>
> Hi Dmitry,
>
> We have a patch to fix this: https://patchwork.kernel.org/patch/10990275/

Hi Ganapathi,

Has this patch been accepted anywhere? This bug is still open on syzbot.

Thanks!
