Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4D3199D29
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 19:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgCaRol (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 13:44:41 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:33476 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgCaRol (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 13:44:41 -0400
Received: by mail-yb1-f194.google.com with SMTP id p196so11627597ybc.0
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2020 10:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jR1ZIvGGpwr49EcYtbAyRYtsyb7fcIsCPTJgz8brLjg=;
        b=SHQb2BZb1NJwzySP/s/k9r0GQUXNdN+AowbsOZXgtxeugyf1Pbz5h9RYTfQ/txGmiz
         NW6n042eS9IZqgphrdA1Ix0kbn9I1Dcc9NfMaX1Oc352yj3IUPLpe6Ts7yzbDQTDV+ms
         wOMIWDEWIRPaVQTApzIEL2LXOw28qnygtqLrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jR1ZIvGGpwr49EcYtbAyRYtsyb7fcIsCPTJgz8brLjg=;
        b=D7J6K5YbHP6PlzYKr9AbcDimEAAGMeo3au6WGntYfBoKIojOHEdjb/rbETPSn1Zeeg
         /th47SPE4M4Fph/gy+z83lhvIjRNwVFoaHp6gHwQ7pIQiJjvSFYVqtRLOe7fF1fF+wlV
         C72h/jkfUpOwAWlV1anZm7MeHXhoEdeURyzXVK8vQuZM36w3MHzoY+g6dqUaPZi8hf/P
         CquDiBgiHXfsYpE7vYM2zZHohuKeFFbJUbuVVbVKve+RrIMXgnrl4O43FK7vA4dlCMqj
         qCqFHXpEbseOgBsxyLC/1w14TflQ+OGQ3PZA/7Q+9iyPShINFjFnA8OJOcbw4UqA/Ynm
         nQfg==
X-Gm-Message-State: ANhLgQ0/Fau7QEWidFmQP4dn2aAyaLyhORi6xSJO5sGcOAnNZSgl7eIY
        cq5lRCsQMIIbJofOSr8xPh1scDvOuWobDnIa0bBFog==
X-Google-Smtp-Source: ADFU+vve5e1tGuJEA3r0In28yh8ZrkCmYIkMq/ET420MGqIwCwN7MftCJTiN7MqyF8fIt9NpdjXD9GAtvkLDqJQBdlo=
X-Received: by 2002:a25:6042:: with SMTP id u63mr31758293ybb.77.1585676679963;
 Tue, 31 Mar 2020 10:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000da6059059fcfdcf9@google.com> <0000000000005b022005a22a0050@google.com>
 <20200331174116.GA1844017@kroah.com>
In-Reply-To: <20200331174116.GA1844017@kroah.com>
From:   Grant Grundler <grundler@chromium.org>
Date:   Tue, 31 Mar 2020 10:44:29 -0700
Message-ID: <CANEJEGuhZChGXFzbwaEwArM4UKjUxZo=WNbREPH3887xtu62Nw@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in skb_release_data (2)
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     syzbot <syzbot+a66a7c2e996797bb4acb@syzkaller.appspotmail.com>,
        David Miller <davem@davemloft.net>, festevam@gmail.com,
        Grant Grundler <grundler@chromium.org>,
        Hayes Wang <hayeswang@realtek.com>, johan.hedberg@gmail.com,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, linux-imx@nxp.com,
        LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org,
        marcel@holtmann.org, nishadkamdar@gmail.com, peter.chen@nxp.com,
        Prashant Malani <pmalani@chromium.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, shawnguo@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 31, 2020 at 10:41 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 31, 2020 at 10:36:01AM -0700, syzbot wrote:
> > syzbot suspects this bug was fixed by commit:
> >
> > commit d9958306d4be14f4c7466242b38ed3893a7b1386
> > Author: Nishad Kamdar <nishadkamdar@gmail.com>
> > Date:   Sun Mar 15 10:55:07 2020 +0000
> >
> >     USB: chipidea: Use the correct style for SPDX License Identifier
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16d4940be00000
> > start commit:   63623fd4 Merge tag 'for-linus' of git://git.kernel.org/pub..
> > git tree:       upstream
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=5d2e033af114153f
> > dashboard link: https://syzkaller.appspot.com/bug?extid=a66a7c2e996797bb4acb
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c25a81e00000
> >
> > If the result looks correct, please mark the bug fixed by replying with:
> >
> > #syz fix: USB: chipidea: Use the correct style for SPDX License Identifier
>
> I really doubt a comment change fixed a syzbot bug :)

Just as I don't believe the bug was caused by pmalani's patch to r8152.

syzbot is just having trouble automatically bisecting/tracking this
bug since it appears only intermittently.

cheers,
grant
