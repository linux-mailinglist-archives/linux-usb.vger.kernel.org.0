Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E92B29234C
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 14:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfHSMSD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 08:18:03 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:45419 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbfHSMSD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 08:18:03 -0400
Received: by mail-pf1-f169.google.com with SMTP id w26so1068374pfq.12
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2019 05:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o94mO5oDmPFzb2RFrcERpL0IeTzi6a9GdDU8DyS+zvY=;
        b=Kmou11VEcqH2kZQif1grO/nXHzAopJVeKj1VW+wwT6yM6e2X1Lh7HhK3Bkn+U+vfBr
         dPuln8X7iL3xQyfXWRFg5uoMMB2qbvOxG6u9rrgn3cFPA62K6VZ9cYE4tTzIfoCSdIlD
         VZSj3VYayGvUiiqMvTyrAKHKuF82MGIve/pDKhDK3Diqnp/qiXRX9SvivR1+JIFiUpI1
         Y5+PqIq/kJzaSklw0zRHcqZZV20EMJrG+qrsUp8WsBiiGJO2Yy8XR1xJITMQqgCs8X/Z
         Xz95FAOx+hu0AXM5xgxXcePqMmJR6YBKNAV2PULY0IxGFsabh9BL0phGCJG/Zi/fE6oq
         7cAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o94mO5oDmPFzb2RFrcERpL0IeTzi6a9GdDU8DyS+zvY=;
        b=OUbmNekOK6E3HceKAu/bVlzKSqsCprSRgeL+8+TuzMM/ZX3/tBSE7CtxpFtnd6S28g
         GKS1sANGOQ6lqYHrcZX6LkHKMIGrgeiKisIdmRGbbP8M2uJE8sLatjYSIA37JJuGaUmp
         Ro9NtdWINZgPqpjlwIreYp0wqqVUGMAb1iONu+MwTZo/Rjtk+dkebzoVftfDwC+fPLOj
         /uzNMugT1xHa9muKIp3KCyZkIWg1Fqi02tM12HrHIWXklz/uTA2p5z/ue4r8INnIHrVL
         gsmkj54/kWH7o6USFpR6LeQdUa/fZ791roaHqDXDK6FXb88sEoWQ4BKL/0X4YntUSiuU
         4tug==
X-Gm-Message-State: APjAAAV47B+ehRIa1GThojKaPSK2Pcqtjr055+UalXxN1f4M9ArtkJQ1
        7SPv4/3GaK9e9zY+ruEbQEhul29n7Iiv2hCjyWfxPA==
X-Google-Smtp-Source: APXvYqw/Hpkg4QomP7PTfbBI8aTx5sIeOCuaYixMi8G2VuDdWEDzdRkTGvs7l8eXQ2yuFzzGYlyOehMiZIa68foe4C0=
X-Received: by 2002:a63:3006:: with SMTP id w6mr19802785pgw.440.1566217081919;
 Mon, 19 Aug 2019 05:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000a59094059013dd63@google.com> <1565875886.5780.7.camel@suse.com>
In-Reply-To: <1565875886.5780.7.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 19 Aug 2019 14:17:50 +0200
Message-ID: <CAAeHK+zd9P2hLXuXynbZfhVpSE1Sak2GihX6sDCPWfD+kPaEGg@mail.gmail.com>
Subject: Re: divide error in usbtmc_generic_read
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        steve_bayless@keysight.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        guido.kiener@rohde-schwarz.com,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 15, 2019 at 3:31 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Mittwoch, den 14.08.2019, 06:38 -0700 schrieb syzbot:
> > syzbot has tested the proposed patch but the reproducer still triggered
> > crash:
> > KASAN: use-after-free Read in usbtmc_disconnect
>
> I am afraid that is a difficiency in KASAN that should be fixed.
> Is the class of the error compared if I leave in more of the
> original bug report? Actually the ID is still there, so it really
> should return an inconclusive in these cases.

I don't get this, what kind of deficiency do you mean?

Anyway, looks like I was wrong, the reported use-after-free is caused
by an incomplete fix, and setting the right retcode fixes the
use-after-free.
