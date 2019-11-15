Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67B74FE456
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 18:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbfKORvY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 12:51:24 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43714 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfKORvY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Nov 2019 12:51:24 -0500
Received: by mail-pf1-f195.google.com with SMTP id 3so7025968pfb.10
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2019 09:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:to:subject:from:user-agent:date;
        bh=dLhYkfUvuM3MR/JcrrR7Nokdc6ORsY2H2jUYzk/2iMw=;
        b=EorYr20iszXneZR3cFgWw+iMhIgDDQXoL2/uXYakczV+sXoukhMfHWMbzspvnCFdxg
         kAwA6q3qrOE3B5BWKlVn0ruxtti1+d5w6tOTNC+cIbDCekuAZbgvcjjKh4duLjDGWiip
         JtuFNGj/xEp7OOMwY3CiHkt/F0ypAKegBWMU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:to:subject:from
         :user-agent:date;
        bh=dLhYkfUvuM3MR/JcrrR7Nokdc6ORsY2H2jUYzk/2iMw=;
        b=kTlJ6Ij8HiKRO4KHV+tX32Z8i7vq4h6ojfWqbIhXvb1iKicgceXmWp08a6zO4KS4vA
         j3F4wW5qH0cz0ww02d47mTxWU/fosCDzRYPbee8K8042jcp20XvqF3qa2iLsa1NX7LVq
         0b4EAa2A6bm7pXMQ9Q6kN0t1xB3zxey2rp05Vja0a9eb2RUAIZJekUS5M9rRSxFF3L4N
         o+wJrm5OXnkaBApa3s3KGiBYvHUZDJYr9EsVhHvRf3GVxHGq2Egz8I48PUZAJnQgonev
         kBLCy8EJXTD7+TS0QHI+JVJB6yYZEHclE0lADlRT8sL+MR1kxGp761WgBCxYO08nwJWM
         5BSA==
X-Gm-Message-State: APjAAAXLQmUOCbo/mcqBKA4QZ2egiyWDYLvB/2UvT/INukoysmEWuEOl
        fi4VgydWl99o6uINhQMDCcZ38g==
X-Google-Smtp-Source: APXvYqwcLOBA5BoQIkVOeY36QAMv4CCxUyLegLofHm0JXeFtgI1ujTzkBTIiWgzH4iVDJ99l3Wkk2g==
X-Received: by 2002:a63:1d0a:: with SMTP id d10mr2492394pgd.242.1573840282995;
        Fri, 15 Nov 2019 09:51:22 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v10sm10079543pgr.37.2019.11.15.09.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 09:51:22 -0800 (PST)
Message-ID: <5dcee59a.1c69fb81.188d.e4b9@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <000000000000cdaa560596acbc4e@google.com>
References: <000000000000cdaa560596acbc4e@google.com>
To:     alexandre.belloni@bootlin.com, andreyknvl@google.com,
        arnd@arndb.de, b.zolnierkie@samsung.com,
        gregkh@linuxfoundation.org, herbert@gondor.apana.org.au,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, lvivier@redhat.com,
        mchehab+samsung@kernel.org, mpm@selenic.com,
        syzbot <syzbot+f41c4f7c6d8b0b778780@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com
Subject: Re: INFO: task hung in chaoskey_disconnect
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 09:51:21 -0800
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting syzbot (2019-11-06 04:32:09)
> Hello,
>=20
> syzbot found the following crash on:
>=20
> HEAD commit:    b1aa9d83 usb: raw: add raw-gadget interface
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D16ae2adce00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D79de80330003b=
5f7
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Df41c4f7c6d8b0b7=
78780
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D10248158e00=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D16afbf7ce00000
>=20
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+f41c4f7c6d8b0b778780@syzkaller.appspotmail.com

I suspect this is because of the kthread getting stuck problem reported
by Maciej. Maybe try the commit that Herbert picked up.

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6=
.git linus

