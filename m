Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E018E3E2B
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 23:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729277AbfJXVaN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 17:30:13 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34361 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729258AbfJXVaN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 17:30:13 -0400
Received: by mail-lf1-f66.google.com with SMTP id f5so12602514lfp.1
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2019 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h5FP/voiQdxeaQU3Va8HH5cRZmi1OHTMwBKcRrrOo6E=;
        b=G+CKE+0sNMbBuosjchwhgzz8NQwfbV/8kKBYcW1zgIA+wCHZXB0W4xnrddKNkrujly
         nBXQf8TMFFxtwDaqAlubm1WQBu/DIP2jq0ClHTeKxpnxD8j4n3vqHGpl41RLHFrD0jXc
         jfdzDY5G/0JxiPvAj8Pc7cihC14c7Kl2f6hiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h5FP/voiQdxeaQU3Va8HH5cRZmi1OHTMwBKcRrrOo6E=;
        b=gZr8Fly4f49uNChxCmarPGpUf8ecnQDaB7Eb3NgR5veFcMs5zwox7ODCRhlXCTkfaF
         f31vuM+5k4XXvIa1jMUTzmuDXmNcJLHHmSxRM9yuQEj1UIqRuYhedoUlTS+vtEJiPveK
         hG9CDy4KCY51DjKJ+4Wt4+Q+TAIXefg9ewDLVEVGeJh96CXcD3rHYxB9Px3Oh2IKCpoq
         sQ51bohfxggNrFlyW/DXZoONn+U8+6lPT2MZ3BALEdcmo01UeO+RAZeTNolorHgZB+6+
         wM4Ft59gxj583ejHiUY6rtTEFjIuEisJBPYZ/SALfvHT2Vi9JJ9mDxUc6ZdkUomshfKq
         EfGQ==
X-Gm-Message-State: APjAAAWXvDjuKz9y6c1R/ECF1yXem+ifQx82QcMy7ZgblwuvupDgI6N2
        VkXyv8g4Ml/obQfCVnP2gE0yH+eJU0SXAg==
X-Google-Smtp-Source: APXvYqyHQ1DQNCw/f0JbfxV4SiBud2ucSmwRq7IdFQfUUXU2GQosjE8Zdp8+a1QI1aOcF3dalF6YPw==
X-Received: by 2002:a19:2356:: with SMTP id j83mr191831lfj.103.1571952610318;
        Thu, 24 Oct 2019 14:30:10 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id i190sm20311803lfi.45.2019.10.24.14.30.08
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 14:30:08 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id a22so292851ljd.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2019 14:30:08 -0700 (PDT)
X-Received: by 2002:a05:651c:331:: with SMTP id b17mr3303284ljp.133.1571952607809;
 Thu, 24 Oct 2019 14:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <157186182463.3995.13922458878706311997.stgit@warthog.procyon.org.uk>
 <30394.1571936252@warthog.procyon.org.uk>
In-Reply-To: <30394.1571936252@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 24 Oct 2019 17:29:51 -0400
X-Gmail-Original-Message-ID: <CAHk-=wiMho2AhcTWC3-3zGK7639XL9UT=AheMXY0pxGHDACn6g@mail.gmail.com>
Message-ID: <CAHk-=wiMho2AhcTWC3-3zGK7639XL9UT=AheMXY0pxGHDACn6g@mail.gmail.com>
Subject: Re: [RFC PATCH 11/10] pipe: Add fsync() support [ver #2]
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

On Thu, Oct 24, 2019 at 12:57 PM David Howells <dhowells@redhat.com> wrote:
>
> pipe: Add fsync() support
>
> The keyrings testsuite needs the ability to wait for all the outstanding
> notifications in the queue to have been processed so that it can then go
> through them to find out whether the notifications it expected have been
> emitted.

Can't you just do

    ioctl(fd, FIONREAD, &count);

in a loop instead? "No paperwork. Just sprinkle some msleep() crack on
him, and let's get out of here"

               Linus
