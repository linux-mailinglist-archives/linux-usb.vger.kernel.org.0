Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA2A5ED0C6
	for <lists+linux-usb@lfdr.de>; Sat,  2 Nov 2019 23:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbfKBWEG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Nov 2019 18:04:06 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42096 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfKBWEF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Nov 2019 18:04:05 -0400
Received: by mail-lj1-f196.google.com with SMTP id n5so2678427ljc.9
        for <linux-usb@vger.kernel.org>; Sat, 02 Nov 2019 15:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vTCI0qHuBsBb0Kz5RbeswHqlSoPusOsIRcj6s1CCCCU=;
        b=XRll/5vMVkjx89KHnpq6WWB0oHHUpEHdiN6O6XIbNfDvJpLq9nAHdnvBRo0qcYtdlV
         dDebt2KT4z/UoQ3oT2Pk6vWaFBXKSztN5uuRAQNTvGwr3g3jPPeee0pGSv+auGk2TkT9
         /FiIqnPnAFsk6ubf5wFePKPpQhSpZfg8GPgik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vTCI0qHuBsBb0Kz5RbeswHqlSoPusOsIRcj6s1CCCCU=;
        b=KwuY8QfiOdWzajLUwydwv+ZOoxB3vJw6skz1NsO3Yj10IWTvWqVMWAFT7liXqerLDv
         tl7Js1vobMvIDe3ibKjdtAykytV9uEG0b3Sokmk52HMkWNeilSmdrb1Ye+DnPdWyExzM
         /6LfXmmGBrbe8noHVaNP7G43kiNATbRCPqiZZXaZh/Ioq/rgxQIk4fhgiz4PRoMnRvNY
         qVDn1QKiYyWvpNKmcni4O4p6GnMuvSj6ozf/uSTpxs4e7BMrZMzxhb0LSks7P2Ygn4DE
         OaAHfNvfzufvvxGwmajLlMI4/dDrh0f9mFTjHejduLEn7xbvys+/Tbn56YdED/e2u67T
         kAXQ==
X-Gm-Message-State: APjAAAUyMjewyO+1bRl/LW610qsfAVXLnOYAKFJVLG1I1JsHffORuxFX
        f4HHy3fGfUC5bBJPDBHLaqtZ+OiYGpc=
X-Google-Smtp-Source: APXvYqzeVq7q06ASmJy2absXrIdfPoKu8fJMTGU+e2fWactV8Q+Jqo4P0CiJ3Ho21SBVoUYOZDbzog==
X-Received: by 2002:a05:651c:1107:: with SMTP id d7mr14024559ljo.12.1572732242906;
        Sat, 02 Nov 2019 15:04:02 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id a26sm5495305lfg.50.2019.11.02.15.04.00
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2019 15:04:00 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id g3so7582944ljl.11
        for <linux-usb@vger.kernel.org>; Sat, 02 Nov 2019 15:04:00 -0700 (PDT)
X-Received: by 2002:a2e:3e18:: with SMTP id l24mr13611187lja.48.1572732239632;
 Sat, 02 Nov 2019 15:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <25886.1572723272@warthog.procyon.org.uk> <CC3328CC-2F05-461E-AAC3-8DEBAB1BA162@amacapital.net>
In-Reply-To: <CC3328CC-2F05-461E-AAC3-8DEBAB1BA162@amacapital.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 2 Nov 2019 15:03:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj1BLz6s9cG9Ptk4ULxrTy=MkF7ZH=HF67d7M5HL1fd_A@mail.gmail.com>
Message-ID: <CAHk-=wj1BLz6s9cG9Ptk4ULxrTy=MkF7ZH=HF67d7M5HL1fd_A@mail.gmail.com>
Subject: Re: [RFC PATCH 11/10] pipe: Add fsync() support [ver #2]
To:     Andy Lutomirski <luto@amacapital.net>
Cc:     David Howells <dhowells@redhat.com>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 2, 2019 at 1:31 PM Andy Lutomirski <luto@amacapital.net> wrote:
>
> Add in the fact that it=E2=80=99s not obvious that vmsplice *can* be used=
 correctly, and I=E2=80=99m wondering if we should just remove it or make i=
t just do write() under the hood.

Sure it can. Just don't modify the data you vmsplice. It's really that simp=
le.

That said, if we don't have any actual users, then we should look at
removing it (maybe turning it into "write()" as you say). Not because
it's hard to use, but simply because it probably doesn't have that
many uses.

               Linus
