Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E585AA9DB
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 19:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389344AbfIERUS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Sep 2019 13:20:18 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34947 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388443AbfIERUR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Sep 2019 13:20:17 -0400
Received: by mail-lf1-f66.google.com with SMTP id w6so2711889lfl.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Sep 2019 10:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1KYTdnyfvsSaF6SRrjqwQi9Gt/hCAHZIxAtXY6aZZJ0=;
        b=JGdKASNkgFHvBA05jXqdXX7Gpi6+9NL4cvo+gcNYqUSvjqoKuIvNGkviDlPZtR6WeE
         TlbHiadWjxZKtu9iPHXIVgBm9c/Q2iEzthUZRUK4NhHiCU4gT3Zrwu7Fj6GF8TOr2PYi
         RUy/jSH90pSu65c5M/A/XF8yr8GznFTNLI8nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1KYTdnyfvsSaF6SRrjqwQi9Gt/hCAHZIxAtXY6aZZJ0=;
        b=e0YNrINzQl23d3FYpM8I4MCp28RuCNKywi2B24IanjX39WXCfzutTxyc0ZK8FZNe3/
         iYH2Kbai3taTLdQ7heaQS/lZS68Ft/TgekZNo4oAmmjG+eloFjo60jWrtictuoYo1sma
         e907iheqABhVQjTRmfXaAeg6z9c4I3HExYXARYJkvzWdqofCw5z1QpVlRdymY0zIc4Te
         XOBh0dxD+O33AYi6hGGEMOzBbF1KnsYQoyrwCyCcIuHkt1ZNkDm5rebjojZMUX0yJvUC
         3ANKq6dNaUh3f1KeZvor6ncdpsnG8Ja2H3pbxhMBgqcb5ULCio/8qX7S4l9u2jpQu+VL
         kGxw==
X-Gm-Message-State: APjAAAVg6mHLFacpdmdv/tVItOYF0pX6grKR/FW3NzdKnDP8ivKcYsoz
        S4eEoL8PnT/ifg8KFzYoVclCHsPVV90=
X-Google-Smtp-Source: APXvYqyZU9SOy7jR/iJKrtDQnQmZqXMT5gwIG6kh3X1nAgFQpcXDcaNNRsKAL7GBKo3Vp8K0kCUhWw==
X-Received: by 2002:a19:cc15:: with SMTP id c21mr3175537lfg.64.1567704014716;
        Thu, 05 Sep 2019 10:20:14 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id e21sm543585lfj.10.2019.09.05.10.20.11
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2019 10:20:13 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id c12so2691763lfh.5
        for <linux-usb@vger.kernel.org>; Thu, 05 Sep 2019 10:20:11 -0700 (PDT)
X-Received: by 2002:ac2:5a4c:: with SMTP id r12mr3118360lfn.52.1567704010099;
 Thu, 05 Sep 2019 10:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <156763534546.18676.3530557439501101639.stgit@warthog.procyon.org.uk>
 <CAHk-=wh5ZNE9pBwrnr5MX3iqkUP4nspz17rtozrSxs5-OGygNw@mail.gmail.com> <17703.1567702907@warthog.procyon.org.uk>
In-Reply-To: <17703.1567702907@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 5 Sep 2019 10:19:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjQ5Fpv0D7rxX0W=obx9xoOAxJ_Cr+pGCYOAi2S9FiCNg@mail.gmail.com>
Message-ID: <CAHk-=wjQ5Fpv0D7rxX0W=obx9xoOAxJ_Cr+pGCYOAi2S9FiCNg@mail.gmail.com>
Subject: Re: Why add the general notification queue and its sources
To:     David Howells <dhowells@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rstrode@redhat.com, swhiteho@redhat.com,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        Christian Brauner <christian@brauner.io>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 5, 2019 at 10:01 AM David Howells <dhowells@redhat.com> wrote:
> >
> > I'm just going to be very blunt about this, and say that there is no
> > way I can merge any of this *ever*, unless other people stand up and
> > say that
> >
> >  (a) they'll use it
> >
> > and
> >
> >  (b) they'll actively develop it and participate in testing and coding
>
> Besides the core notification buffer which ties this together, there are a
> number of sources that I've implemented, not all of which are in this patch
> series:

You've at least now answered part of the "Why", but you didn't
actually answer the whole "another developer" part.

I really don't like how nobody else than you seems to even look at any
of the key handling patches. Because nobody else seems to care.

This seems to be another new subsystem / driver that has the same
pattern. If it's all just you, I don't want to merge it, because I
really want more than just other developers doing "Reviewed-by" after
looking at somebody elses code that they don't actually use or really
care about.

See what I'm saying?

New features that go into the kernel should have multiple users. Not a
single developer who pushes both the kernel feature and the single use
of that feature.

This very much comes from me reverting the key ACL pull. Not only did
I revert it, ABSOLUTELY NOBODY even reacted to the revert. Nobody
stepped up and said they they want that new ACL code, and pushed for a
fix. There was some very little murmuring about it when Mimi at least
figured out _why_ it broke, but other than that all the noise I saw
about the revert was Eric Biggers pointing out it broke other things
too, and that it had actually broken some test suites. But since it
hadn't even been in linux-next, that too had been noticed much too
late.

See what I'm saying? This whole "David Howells does his own features
that nobody else uses" needs to stop. You need to have a champion. I
just don't feel safe pulling these kinds of changes from you, because
I get the feeling that ABSOLUTELY NOBODY ELSE ever really looked at it
or really cared.

Most of the patches has nobody else even Cc'd, and even the patches
that do have some "Reviewed-by" feel more like somebody else went "ok,
the change looks fine to me", without any other real attachment to the
code.

New kernel features and interfaces really need to have a higher
barrier of entry than one developer working on his or her own thing.

Is that a change from 25 years ago? Or yes it is. We can point to lots
of "single developer did a thing" from years past. But things have
changed. And once bitten, twice shy: I really am a _lot_ more nervous
about all these key changes now.

                    Linus
