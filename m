Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDB96E62D5
	for <lists+linux-usb@lfdr.de>; Sun, 27 Oct 2019 15:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfJ0OD6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Oct 2019 10:03:58 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35804 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbfJ0OD5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Oct 2019 10:03:57 -0400
Received: by mail-lj1-f195.google.com with SMTP id m7so8570652lji.2
        for <linux-usb@vger.kernel.org>; Sun, 27 Oct 2019 07:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aUtxqBrTqUG2JQM67qlbeu/gWrmsCKLHs/nf3HjwR6o=;
        b=UBVoDLidxhGRZnO3t3s9odW+975NWscpsgyn72pMoIFtMXrLI8gYCDX8RoEk4dUGpu
         XShVkulYmvYa4f4vPiGJkAOAAjj/NBHXSLZISLlhGaOzl5SAbZ6BhT9CpKJEgEzb8LhN
         G2c7dQQvyPPapIvGT5FeHB9zbcHI3CN4A0Ff0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aUtxqBrTqUG2JQM67qlbeu/gWrmsCKLHs/nf3HjwR6o=;
        b=iqBEASLZUTQMbR7KY69J6iTBZ9wl3p2xM4SBxyov9zwDvRZiffSU91YKoph/85/aHz
         8t9GqOvhERBn2vt8B93f+N2GkmevDubdrNoUACSE1Vgsio08z8dp3Fa9HU4gtTuug3Sn
         VbESceB01hB58ipixNekRyzHQ5v4upKe6hJ9SImc4u375bcC6kMER0zK1QUE2pMW7z4d
         QgxL3/tcuR+Rc6Zvd8SFajvTNu+PfIlVasXQfdd4jZUr9P5EdO3WBRmCkTv/9L9cHExj
         CENDy3op80AOg3tb6O36EOUgS1Kq0ZLIdpNtHy/RMyzxEoehdInAwdsezxlhXT2NvF8N
         38Yg==
X-Gm-Message-State: APjAAAU4Ym6Y+w7zC37Bhli8ttEV5DOx/7Ef5uhWQWT8XlgtdZaS88ES
        e1MZ2bOgfupzcTHc2VcjBwjf4VmwPljPxg==
X-Google-Smtp-Source: APXvYqz1DPohM0HiXD5+XrDc2dKbRWnRhgEVmsCPhiepiGjHZ+o91YkHO1AEag04D0q+KggQMNCmzg==
X-Received: by 2002:a05:651c:293:: with SMTP id b19mr8450187ljo.176.1572185034598;
        Sun, 27 Oct 2019 07:03:54 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id x76sm6131321ljb.81.2019.10.27.07.03.52
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2019 07:03:52 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id c4so8532754lja.11
        for <linux-usb@vger.kernel.org>; Sun, 27 Oct 2019 07:03:52 -0700 (PDT)
X-Received: by 2002:a05:651c:331:: with SMTP id b17mr8760744ljp.133.1572185032112;
 Sun, 27 Oct 2019 07:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <157186182463.3995.13922458878706311997.stgit@warthog.procyon.org.uk>
 <157186186167.3995.7568100174393739543.stgit@warthog.procyon.org.uk>
In-Reply-To: <157186186167.3995.7568100174393739543.stgit@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 27 Oct 2019 10:03:35 -0400
X-Gmail-Original-Message-ID: <CAHk-=wh7cf3ANq-G9MmwSQiUK2d-=083C0HV_8hTGe2Mb4X7JA@mail.gmail.com>
Message-ID: <CAHk-=wh7cf3ANq-G9MmwSQiUK2d-=083C0HV_8hTGe2Mb4X7JA@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] pipe: Use head and tail pointers for the ring,
 not cursor and length [ver #2]
To:     David Howells <dhowells@redhat.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
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

This still has signs of that earlier series:

On Wed, Oct 23, 2019 at 4:17 PM David Howells <dhowells@redhat.com> wrote:
>
>                 if (rem >= ibuf->len) {
>                         *obuf = *ibuf;
>                         ibuf->ops = NULL;
> -                       pipe->curbuf = (pipe->curbuf + 1) & (pipe->buffers - 1);
> -                       pipe->nrbufs--;
> +                       tail++;
> +                       pipe_commit_read(pipe, tail);
>                 } else {
>                         if (!pipe_buf_get(pipe, ibuf))
>                                 goto out_free;

with those odd "pipe_commit_read/write()" helpers.

They make no sense, and they don't make things more legible.

It's shorter and more obvious to just write

   pipe->head = head;

than it is to write

   pipe_commit_write(pipe, head);

Even when the addition of the notifications,  it's all under the
pipe->wait.lock, so it's all just regular assignments.

Now, if at some point it starts doing fancy lockless things, at _that_
point the updates might become more complex, but that's a potential
future thing that wouldn't be relevant for a while, and isn't a reason
to make the code more obscure now.

Hmm?

             Linus
