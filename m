Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4B0F273B32
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 08:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbgIVGtx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 02:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbgIVGtx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Sep 2020 02:49:53 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D265DC061755
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 23:49:52 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id p15so8923479qvk.5
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 23:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SLHAP6IosqBz3sFAeXX/g/uswwmtEjUdI1x19+SMA5c=;
        b=l9JYVW3UaZkyRVD1hO0Bw9X1aNvPBrvdjRm3KjcXGu6j0mEv8uSLLScbADnbDcRusZ
         Obrcorv0vPbsI9QDWeKyvDCzyEDTBMVOu5xFfiq+juGAKh+TgiYMm/g3OOcTnAoAD+of
         4wHcUUQEsqr+x3+f520bAOWlEF8kjRVZ4Jbod1b3IHqgST5v1EogdbpTICFJPiL7ZudN
         y78HM3fUUPi4ZHWZbkzQstxqByO1GqdkU14s47rDZcRpKg0oKAGuwmVSxQSHIgbfLziG
         +Ix8JIyUtR4wcCUw5G3WSW37oxm2AmfJZJxHoMsDGSta/aoAoYe6IegW4vCmVyfS4gCT
         QMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SLHAP6IosqBz3sFAeXX/g/uswwmtEjUdI1x19+SMA5c=;
        b=cMAoHoetje94C1Zs/6qHcY5uUnZUEGCkGGrxxn67Pi6PQEcnzJ31A4lTsaObPF1Qhe
         sVq8wKlc4CPIzVSlT3Xba8ojnTuIkpwjWYwCMJ1o+U9DwkHerzoTjp+KmxAv/8JGyX3y
         G2P7mYCHOrH/itMyXv5j1bOYgj2n7IgGYRulQMLa52j2N3+FZVcMegwx8vOVmaO+TcXe
         fsFiKy/QUIDD+gXKMkyq+Ldgn/sfbHGHy+s0jch80cX2fDe8Wg9C20rgUiiSyiyX/9FW
         61oupc0au1tkETa16r4UUUch4ZA2//+M2YHZ/uEWjK1DEo/hxY7xnF5DUgZsqo3ZRsKH
         cVVg==
X-Gm-Message-State: AOAM530eNcY7UTkqPiYCnhVYzKXR3eYzYxBi3k/L6szBvzMHLC9PHNL4
        UzuezgUv0XhDQPOnpL81jBot8qMG8bBvd0f0pZLXKg==
X-Google-Smtp-Source: ABdhPJzM24GhNT4M6B1P/iysuMWufusCuHXjpcvcOVjDC6z2NLJEmDS22sjTXHTQSESh6Nkb/npU2t9mUDePXvjkwbU=
X-Received: by 2002:ad4:4e33:: with SMTP id dm19mr4311142qvb.47.1600757391695;
 Mon, 21 Sep 2020 23:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <13659a4e-ad71-0cef-4bfa-3eb4b8c73f4b@gmail.com> <000000000000cce55c05afe0f8f0@google.com>
In-Reply-To: <000000000000cce55c05afe0f8f0@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 22 Sep 2020 08:49:39 +0200
Message-ID: <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
Subject: Re: INFO: trying to register non-static key in ath9k_htc_rxep
To:     syzbot <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com>
Cc:     Brooke Basile <brookebasile@gmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        USB list <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 22, 2020 at 8:21 AM syzbot
<syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>
> Reported-and-tested-by: syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2c523334171d074
> dashboard link: https://syzkaller.appspot.com/bug?extid=4d2d56175b934b9a7bf9
> compiler:       gcc (GCC) 10.1.0-syz 20200507
>
> Note: testing is done by a robot and is best-effort only.

Hi Brooke,

As far as I understand, UBS is currently completely broken on upstream
HEAD, so testing any USB bugs on upstream HEAD will lead to false
positive results only.
