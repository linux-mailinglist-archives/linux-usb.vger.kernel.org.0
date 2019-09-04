Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73BF4A8CB4
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 21:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732607AbfIDQQY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 12:16:24 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36551 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732862AbfIDQQV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Sep 2019 12:16:21 -0400
Received: by mail-lj1-f193.google.com with SMTP id l20so5762057ljj.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Sep 2019 09:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=one-eyed-alien.net; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3OkOI3j0Oo0CjA3trKCkMR2MwBR7d8kErbi/HKpfcyM=;
        b=TUlK0rc196VsjDYABXU7yCCcQ4sTNOl47V6TQt/Z6Y4FZj6TevmCuFWT9dKCaAnTkd
         ii+pt9kyT4tMSieTNWDBUkxJWxisf3YEfmljgf/j7puwe7joaJGEU4O2426wowD5IuNU
         CQLeaZs18KcpY8ipXZwRFzvDYcdReO/oyNEP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3OkOI3j0Oo0CjA3trKCkMR2MwBR7d8kErbi/HKpfcyM=;
        b=KxLmz0qJBDXd5bTgZEK/fdX2zKMYKBHEmqZu8KOzGRJdN2R/wK5HiK6/9Lky3BqbKo
         m5rAnLCxQLFyTLDIRGiNm417ekw4O44Y+nUqre6/M6cqenk4uBfeMnJ8Ug50xRf1Vt56
         wl+6J48IDNbnHGICqJEWMxVDFvWH/bS2j0+mlvYTINtmVXaqhaEV07rFmi6zh+yDGSEW
         HD2peIzN1QpCLiZ5kH2BZNKD/TtX9yf1tMoOy8Ngr0BVx0XEL3TGmyCg0oAN7PkiR0Ys
         tfJdIM0hTQJram1fLE6qtHCCaPOKwTX+9f5mVgaBxXTzWXHbwz88Asq4FIE1oFaNcYy7
         GeeQ==
X-Gm-Message-State: APjAAAVqtEKe3tU4XspIVOKUHpDAgBex0Wzo/pPUf+BACM/dhSxMrvyl
        ++J5VTmNCBQWC2AdGunfzty+K5+X8WVbuVfQYDGqLw==
X-Google-Smtp-Source: APXvYqwjBs0W5/qIegdlz+i6Wn/+JSt4M3u1OfLNwPhUCj4In1akz/3V+ycUi8EU6qZzBMs2ICtcju1RZEnxtZQrP/k=
X-Received: by 2002:a2e:9ad4:: with SMTP id p20mr24178237ljj.49.1567613778648;
 Wed, 04 Sep 2019 09:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
 <20190903150638.242049-13-maennich@google.com> <20190903161045.GA22754@roeck-us.net>
 <CAK7LNARYqqCSCc0G4FL7_bj80iMoLLJrUJ7B3+huD25EUkrttA@mail.gmail.com> <c6ac941c-06a4-e5dc-5cb9-fca7b40d7e9a@roeck-us.net>
In-Reply-To: <c6ac941c-06a4-e5dc-5cb9-fca7b40d7e9a@roeck-us.net>
From:   Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Date:   Wed, 4 Sep 2019 09:16:07 -0700
Message-ID: <CAA6KcBBeP9xYbVws4=RMFNA4kyrodE-R3mifhbkee-Q+jFRcoQ@mail.gmail.com>
Subject: Re: [usb-storage] Re: [PATCH v4 12/12] RFC: watchdog: export core
 symbols in WATCHDOG_CORE namespace
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Matthias Maennich <maennich@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        maco@android.com, sspatil@google.com,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-modules@vger.kernel.org,
        linux-usb <linux-usb@vger.kernel.org>,
        USB Mass Storage on Linux 
        <usb-storage@lists.one-eyed-alien.net>,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 4, 2019 at 5:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Note that I don't object to the patch set in general. There may be symbols
> which only need be exported in the context of a single subsystem or even
> driver (if a driver consists of more than one module). For example, a mfd
> driver may export symbols which should only be called by its client drivers.
> In such a situation, it may well be beneficial to limit the use of exported
> symbols.

I can appreciate this benefit.

> I am not sure what good that does in practice (if I understand correctly,
> a driver only has to declare that it wants to use a restricted use symbol
> if it wants to use it), but that is a different question.

I think this question implies that you are coming from the perspective
of "security" or wanting to restrict access to the underlying
functions, rather than wanting to clean-up the way symbols are handled
for manageability / maintainability purposes (which is the goal, as I
understand it).

HOWEVER, I have one question:  If these patches are included, and
someone wants to introduce a bit of code which needs to use two
symbols from different namespaces but with the same name, can that be
done?  That is, if driver A has symbol 'foo' and driver B has symbol
'foo' (both in their respective namespaces), and driver C wants to use
A.foo and B.foo, can that be supported?

Matt


-- 
Matthew Dharm
Former Maintainer, USB Mass Storage driver for Linux
