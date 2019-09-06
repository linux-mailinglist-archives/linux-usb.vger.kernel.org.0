Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 067BDABE9E
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2019 19:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387856AbfIFRWY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Sep 2019 13:22:24 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39097 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729928AbfIFRWY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Sep 2019 13:22:24 -0400
Received: by mail-lj1-f195.google.com with SMTP id j16so6721061ljg.6
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2019 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HgnD7xuPPV7kJPJv1y/oxrmL+dxJJMuTrQ4Q4FChOdU=;
        b=S6FXIRgesHQioG8oGxLk5Tjwzb4SPiDI6TQkN/1PfVNUkJMeUM47+DjxmFZZnsgnqF
         aVUh5gjMjdVeG3Ez1LdJPa9NKOGaCIHQumkrSOBf3OS+YC+yfMLrM6/zSsHJRG8ghrAg
         d5Mr3bY5beGZhlJwy9YNIxLVtQzi4ydOFbhE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HgnD7xuPPV7kJPJv1y/oxrmL+dxJJMuTrQ4Q4FChOdU=;
        b=BOt6Y7+0adgbbbsw5bvHjUSXlBjKWjRIua9yOQt/dDiYL/P92BGxOFuD1I0oohEUGT
         3b8uXqJAKb4aGSvjxq29YX63GNwToSSYCKp4EckK4dpPIj9WWb2bvJfztK4HyjMiZjmx
         0tre9JD6kuc2kHcrMn9oM7xkomDyLR5QWxhRiFuJzIPWDky0rj0jTQilQ/i67+tI5QAF
         e3r991u68HnWTPpKCMfKbEeKEGD0ScuRtpGnWGjk8NjsXZY7eXo0RcjBQ0T7doOdD3Im
         jc+sASUdmqyd6rbr2Wi5k6n47MXeBAis5aJmxHvEv3bYlrPN1QtvES9ECL7prT8Lsxqo
         b8dQ==
X-Gm-Message-State: APjAAAWpTPYnZz59D8NM0cUtqsVUeL3J5yc7bvQF7WDsqlYfU2xYsHbk
        FaUFq8qYwLHnKQKin0dJunu7fVpPGbo=
X-Google-Smtp-Source: APXvYqw7/kJ3Biod6I5S02ZuG+voBFcZSBLsON0+0CAnFuLW0U4Ui5v54UwYuAAD86Ir8vkbVSjV+g==
X-Received: by 2002:a2e:a17a:: with SMTP id u26mr6399836ljl.137.1567790541667;
        Fri, 06 Sep 2019 10:22:21 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id t5sm1248460lfl.91.2019.09.06.10.22.21
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2019 10:22:21 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id a22so6749986ljd.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2019 10:22:21 -0700 (PDT)
X-Received: by 2002:a2e:8507:: with SMTP id j7mr6626752lji.156.1567790104003;
 Fri, 06 Sep 2019 10:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <156763534546.18676.3530557439501101639.stgit@warthog.procyon.org.uk>
 <CAHk-=wh5ZNE9pBwrnr5MX3iqkUP4nspz17rtozrSxs5-OGygNw@mail.gmail.com>
 <17703.1567702907@warthog.procyon.org.uk> <CAHk-=wjQ5Fpv0D7rxX0W=obx9xoOAxJ_Cr+pGCYOAi2S9FiCNg@mail.gmail.com>
 <CAKCoTu7ms_Mr-q08d9XB3uascpzwBa5LF9JTT2aq8uUsoFE8aQ@mail.gmail.com>
 <CAHk-=wjcsxQ8QB_v=cwBQw4pkJg7pp-bBsdWyPivFO_OeF-y+g@mail.gmail.com>
 <5396.1567719164@warthog.procyon.org.uk> <CAHk-=wgbCXea1a9OTWgMMvcsCGGiNiPp+ty-edZrBWn63NCYdw@mail.gmail.com>
 <14883.1567725508@warthog.procyon.org.uk> <CAHk-=wjt2Eb+yEDOcQwCa0SrZ4cWu967OtQG8Vz21c=n5ZP1Nw@mail.gmail.com>
 <27732.1567764557@warthog.procyon.org.uk> <CAHk-=wiR1fpahgKuxSOQY6OfgjWD+MKz8UF6qUQ6V_y2TC_V6w@mail.gmail.com>
 <CAHk-=wioHmz69394xKRqFkhK8si86P_704KgcwjKxawLAYAiug@mail.gmail.com>
 <8e60555e-9247-e03f-e8b4-1d31f70f1221@redhat.com> <CAHk-=wg6=qhw0-F=2_8y=VdT+fj8k7G1+t2XNSkRYimXhampVg@mail.gmail.com>
In-Reply-To: <CAHk-=wg6=qhw0-F=2_8y=VdT+fj8k7G1+t2XNSkRYimXhampVg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 6 Sep 2019 10:14:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjaSzdzYNuQXUSZNkT75Wmfw2v96tekgnV8nOwBQ3h0ig@mail.gmail.com>
Message-ID: <CAHk-=wjaSzdzYNuQXUSZNkT75Wmfw2v96tekgnV8nOwBQ3h0ig@mail.gmail.com>
Subject: Re: Why add the general notification queue and its sources
To:     Steven Whitehouse <swhiteho@redhat.com>
Cc:     David Howells <dhowells@redhat.com>,
        Ray Strode <rstrode@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        Christian Brauner <christian@brauner.io>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "Ray, Debarshi" <debarshi.ray@gmail.com>,
        Robbie Harwood <rharwood@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 6, 2019 at 10:07 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Hmm. Maybe somebody can come up with a good legacy signaling solution
> (and "just use another pipe for error notification and OOB data" for
> the first one may _work_, but that sounds pretty hacky and just not
> very convenient).

... actually, maybe the trivial solution for at least some prototyping
cases is to make any user mode writers never drop messages. Don't use
a non-blocking fd for the write direction.

That's obviously *not* acceptable for a kernel writer, and it's not
acceptable for an actual system daemon writer (that you could block by
just not reading the notifications), but it's certainly acceptable for
the "let's prototype having kernel support for /proc/mounts
notifications using a local thread that just polls for it every few
seconds".

So at least for _some_ prototypes you can probably just ignore the
overflow issue. It won't get you full test coverage, but it will get
you a working legacy solution and a "look, if we have kernel support
for this, we can do better".

                 Linus
