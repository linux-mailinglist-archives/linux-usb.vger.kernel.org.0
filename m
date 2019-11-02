Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 029A6ED04B
	for <lists+linux-usb@lfdr.de>; Sat,  2 Nov 2019 19:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfKBSx6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Nov 2019 14:53:58 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:32795 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfKBSx6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Nov 2019 14:53:58 -0400
Received: by mail-lj1-f195.google.com with SMTP id t5so13501006ljk.0
        for <linux-usb@vger.kernel.org>; Sat, 02 Nov 2019 11:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UFZsrTxHj8UNSOV0MW3iX+ZNPh241BxYI9RJCfbRj4I=;
        b=fwWi36Cjm33TVpJsMKyyeNJuPa+EzO/w2jcz8N5ivZnB2LBgFElTwve7u7JUY1CQlk
         LBP3NYhj8mwMGDKFLZC3aAKJjtxEeb837zFLkONBVlInZ3n9BYz2CiSK5BYhQEqMplN+
         cxbruKuD+a9IFTjckV4CYWfQYTCffHao0G3wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UFZsrTxHj8UNSOV0MW3iX+ZNPh241BxYI9RJCfbRj4I=;
        b=CodfPd8rfI1hhVkhWGEwGANA12tcFD9rRfJNQBggcD5mbgAOnbk1WF6jcGqU9Q0vtF
         vBmTILfy8GJ/LYzkokrfhjf9TW9cDlIHlDIj07oMOvW8FMXg7wHPa8kR+rPPaMbcKqeY
         2N2m5HK6NJxlHNXQgsENtlfC2dJtA4qz/aOs3YJNcrvButLCd/Je9lYdbVjMUkMQBVmD
         ht9KCFGc6dVGa/JMYfrEhiAWoidWMS5oa0Zt9eCxuwYF936mmZjFypPEoJIVLU0PdyX0
         pdlRJ2gweDqC5ZkyEOl1LtRMoBj34psrwgSHaoNVkBDNk5uch1XxPgNttGqRAMSMVGtw
         oHcQ==
X-Gm-Message-State: APjAAAUQsOoPRfksHzTIazvAXLgUnTLlR5Fq6kAffVO/p60Sqk1mQBLM
        9Lj4sBI11AMwvs2wPxRIcFCyVRxTMQY=
X-Google-Smtp-Source: APXvYqwsPt/Q8oQNKyoW87AaPncNqBpMtXAGIs6lEzdXEeGB+18RVItGXGqPdxeey7UjAlE1+OmZfA==
X-Received: by 2002:a2e:7c10:: with SMTP id x16mr4635364ljc.120.1572720835896;
        Sat, 02 Nov 2019 11:53:55 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id a11sm4191017ljp.97.2019.11.02.11.53.54
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2019 11:53:54 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id f4so9439101lfk.7
        for <linux-usb@vger.kernel.org>; Sat, 02 Nov 2019 11:53:54 -0700 (PDT)
X-Received: by 2002:ac2:4c86:: with SMTP id d6mr11465241lfl.106.1572720834124;
 Sat, 02 Nov 2019 11:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <157186182463.3995.13922458878706311997.stgit@warthog.procyon.org.uk>
 <30394.1571936252@warthog.procyon.org.uk> <c6e044cc-5596-90b7-4418-6ad7009d6d79@yandex-team.ru>
 <17311.1572534953@warthog.procyon.org.uk>
In-Reply-To: <17311.1572534953@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 2 Nov 2019 11:53:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_X_7JSYT-a3qHrzvuWGMyffDWtQ4n7adBp_fe5w0BsA@mail.gmail.com>
Message-ID: <CAHk-=wg_X_7JSYT-a3qHrzvuWGMyffDWtQ4n7adBp_fe5w0BsA@mail.gmail.com>
Subject: Re: [RFC PATCH 11/10] pipe: Add fsync() support [ver #2]
To:     David Howells <dhowells@redhat.com>
Cc:     Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
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
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 31, 2019 at 8:16 AM David Howells <dhowells@redhat.com> wrote:
>
> Konstantin Khlebnikov <khlebnikov@yandex-team.ru> wrote:
>
> > Similar synchronization is required for reusing memory after vmsplice()?
> > I don't see other way how sender could safely change these pages.
>
> Sounds like a point - if you have multiple parallel contributors to the pipe
> via vmsplice(), then FIONREAD is of no use.  To use use FIONREAD, you have to
> let the pipe become empty before you can be sure.

Well, the rules for vmsplice is simply to not change the source pages.
It's zero-copy, after all.

If you want to change the source pages, you need to just use write() instead.

That said, even then the right model isn't fsync(). If you really want
to have something like "notify me when this buffer has been used", it
should be some kind of sequence count thing, not a "wait for empty".

Which might be useful in theory, but would be something quite
different (and honestly, I wouldn't expect it to find all that
widespread use)

             Linus
