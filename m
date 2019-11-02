Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74B55ED091
	for <lists+linux-usb@lfdr.de>; Sat,  2 Nov 2019 21:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbfKBUbP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Nov 2019 16:31:15 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44818 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfKBUbO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Nov 2019 16:31:14 -0400
Received: by mail-pf1-f194.google.com with SMTP id q26so9350153pfn.11
        for <linux-usb@vger.kernel.org>; Sat, 02 Nov 2019 13:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=3UJcAg5pgAKoJ5Gm+ePXKf237ihZLN3FrJl8TSBImIg=;
        b=WQYmjkbBu/hvk7IO4II81+pXnWWSv7cZzRYKVx/XG0INxzQf7SKwKMr5nQs8teoa5c
         xKjk7/c6ZhE3qV2FTV3iQHHUC4dxiGZEizSc6/wagvdDtQiZv6m4XzVFHLkCCmgDEHxb
         fmK1J4M0CMB/cSNTO5GB4Jva0lky8IKV+3nmWBFtSTu+Vtzmn/2YRpKC5zsTeCRhuMNs
         6PL3Z57fVG8WIc0Hq3WvWeRGUBmYjfm6/0bmyZNCugZlL3aIvcSKI6XPD/Xy+NHzn1yj
         CTfXWHb5Pn65JVClRjn5V5G3JNnauyuxY/KfLgkd8yXlJI1RMuEQMp2JlvBdD6pzutWT
         y/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=3UJcAg5pgAKoJ5Gm+ePXKf237ihZLN3FrJl8TSBImIg=;
        b=Ymahbe3iwDVEo/GLyPAQ1wWrcr4EnS2JHGpwmKi5iGBPhC32QlOQ01hRTEVBb3rCUY
         H9MDkk9O+cUu0+GMLFLW5ARofq3yJwqfERFXtTQWbf2js3G90dz5Gd+l8azvv9oPDY88
         G9kfoe7RbapdGLRf0fndLNsF5kZj0ZFVP4HihUrwOqaoZq609dmsxJT1KJbt2kn6ekH0
         OzmkfH5u7GGJAoXrLsA126NgFxnLjAYXxtipMLxs3Z7OddL/RDF9+kGGtA9IjylBoUoI
         JDs3ReFOSMu3NMU3iQTIOLedv5xRVjPwrreK7q+YrsOhwvts+aBHP0g8I+BBtKEjnYSD
         0Cyw==
X-Gm-Message-State: APjAAAXjOHRFXlUMQk3TJ3STICB7kFq2URZW2nGy5DdpZ5pQK+d81dUj
        B17yeQbAtJJAJa/xWelYpb36Sg==
X-Google-Smtp-Source: APXvYqxrrEOByQ4qbcOvY3siH8i3/eQHq7yB3p/94kOJIdB/NcTjhPXtmouv1/NiVE4aTmUn/uGUlA==
X-Received: by 2002:a63:f25:: with SMTP id e37mr21668425pgl.269.1572726672787;
        Sat, 02 Nov 2019 13:31:12 -0700 (PDT)
Received: from ?IPv6:2600:1010:b067:e6ce:10dd:e058:94b7:feca? ([2600:1010:b067:e6ce:10dd:e058:94b7:feca])
        by smtp.gmail.com with ESMTPSA id j24sm10070252pff.71.2019.11.02.13.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2019 13:31:11 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH 11/10] pipe: Add fsync() support [ver #2]
Date:   Sat, 2 Nov 2019 13:31:10 -0700
Message-Id: <CC3328CC-2F05-461E-AAC3-8DEBAB1BA162@amacapital.net>
References: <25886.1572723272@warthog.procyon.org.uk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
In-Reply-To: <25886.1572723272@warthog.procyon.org.uk>
To:     David Howells <dhowells@redhat.com>
X-Mailer: iPhone Mail (17A878)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Nov 2, 2019, at 12:34 PM, David Howells <dhowells@redhat.com> wrote:
>=20
> =EF=BB=BFLinus Torvalds <torvalds@linux-foundation.org> wrote:
>=20
>>>> Similar synchronization is required for reusing memory after vmsplice()=
?
>>>> I don't see other way how sender could safely change these pages.
>=20
> Actually, it's probably worse than that.  If the output of the pipe gets t=
eed
> or spliced somewhere else, you still don't know when the vmspliced pages a=
re
> finished with.
>=20
>=20

I sometimes wonder whether vmsplice should be disallowed or severely restric=
ted. Even ignoring these usability issues, it makes me very uncomfortable th=
at you can have some data queue up on a pipe, tee() it, and get *different* d=
ata in the original pipe and the teed copy because the sender used vmsplice a=
nd is messing with you.

Add in the fact that it=E2=80=99s not obvious that vmsplice *can* be used co=
rrectly, and I=E2=80=99m wondering if we should just remove it or make it ju=
st do write() under the hood.

I suppose the kernel could guarantee that it stops referring to the vmsplice=
 source pages as soon as anything sees *or* tees the data. This way it would=
 be, at least in principle, possible to say =E2=80=9Chey, the pipe has consu=
med the first n vmspliced bytes, so I can reuse that memory=E2=80=9D.=
