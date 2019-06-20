Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC704DB15
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 22:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbfFTUT7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 16:19:59 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:41028 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfFTUT7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 16:19:59 -0400
Received: by mail-io1-f67.google.com with SMTP id w25so1632632ioc.8
        for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2019 13:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mvHLUZuDvUaB4+0jmbhxtm/BukT/wSoPUu7rsvycJ6Y=;
        b=sApeHDWGQ0iqMLmu6AAjZTRIYCp6ED1OntrYXOF4SkDBJF44mZlycIKi05C++cL3zX
         IA9lpXMba8f7Mohe7cSHaYaLLxKb2xqCRFRp3pf07w9FQaZh/vi50ujEGFEnfr4pXbAO
         x+deb6JgJv2PwKv33p4fDKVP6i4ZcAE1AqGuQYLuo/zcK8ftXtzgFeFFxeuRRuieMPdn
         zpY8MndYsy1FSQaAsxU/5qXQOBRcKwea59LdHSSzfB0O+wqaB7Dg1pilJB07QoyVvYW4
         kQp5AHRQvmtgAS3tkM1ajpeKDzX4qccjx6/PGtPl7Gv2zyCdGbHqkIodMymk1HIwl9Lj
         01nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mvHLUZuDvUaB4+0jmbhxtm/BukT/wSoPUu7rsvycJ6Y=;
        b=N6a/fAvD4A3drbvML5upj9EcmvzxtrIuKnIYE0+7vv5VpOqOfpt3NbgYQ0mejNcB/k
         7BiUBq7I0a0jYYaiaZ6R5YS1J1dWAUaFwUVI1+hotFvhHMQR/6sL9CwZQuwVZB6IpKYs
         9AFaw1HXR9Leqiq0FMt8d1eoqsgAtfvyJaVVE56aUUWEWRwi6todqoqQXPa9G0JjNTqA
         xBxk2qEKnO6Dak9mXIoP5fSRfT7vu9CRaMJC0UvIBRxrHHvHaPAghBNkw2BbhS4d8GZC
         9sG6g811ec2XHpCVNeYExNTj7tbxkYC4DmasZiYwhZswBybaY8ZA6qf1jMMekeM/sH61
         vlrg==
X-Gm-Message-State: APjAAAUi7w1P7KFjxXYYm+UIevMiyoiqSY4/Yny8f7AK9IRV31+B8zdT
        xxS7xoSAOlhO176JCgn8FrXWrPSVjFKxHTVxAtI=
X-Google-Smtp-Source: APXvYqyCPQW2HtzWAWjQEDVP7X313GbJJZIdzOaqPq4kx2ARUlxIJSArecBYEKfJOb0N487QR6JK78JR8Y1hzQOAvbI=
X-Received: by 2002:a02:914c:: with SMTP id b12mr20705870jag.105.1561061998194;
 Thu, 20 Jun 2019 13:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190601075257.GA24550@jimmy.localdomain> <1559555890.25071.5.camel@suse.com>
In-Reply-To: <1559555890.25071.5.camel@suse.com>
From:   Aidan Thornton <makosoft@gmail.com>
Date:   Thu, 20 Jun 2019 21:19:46 +0100
Message-ID: <CAB=c7ToV==vGZWOXaRqRcoOb4TNeVqi4QNAvgtiN0K6JjoF8Tg@mail.gmail.com>
Subject: Re: [PATCH] Fix chipmunk-like voice when using Logitech C270 for
 recording audio.
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Marco Zatta <marco@zatta.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 3, 2019 at 12:46 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Samstag, den 01.06.2019, 09:52 +0200 schrieb Marco Zatta:
> > This patch fixes the chipmunk-like voice that manifets randomly when
> > using the integrated mic of the Logitech Webcam HD C270.
> >
> > The issue was solved initially for this device by commit
> > 2394d67e446bf616a0885167d5f0d397bdacfdfc but it was then reintroduced by
> > e387ef5c47ddeaeaa3cbdc54424cdb7a28dae2c0. This patch is to have the fix
> > back.
>
> Are you sure only the C270 is affected?

I can unfortunately confirm that it doesn't just seem to be the C270.
I've been having the same problem with my Logitech Webcam Pro 9000
which was one of the models that 2394d67e446b applied the RESET_RESUME
quirk to, and adding it to the quirks list appears to have solved the
problem.

This doesn't make much sense though. e387ef5c47dd should apply this
quirk to all Logitech UVC webcams, and this is definitely a UVC-based
Logitech webcam with the appropriate VID and interface descriptor.
Surely it shouldn't make any difference whether I add an entry for the
specific VID+PID pair of my particular camera or not? The C270 is as
well, I think.

What's particularly annoying is that since this is an intermittent
problem, it's hard to tell if I'm chasing a phantom solution for it
again. Haven't managed to replicate it since applying this fix and did
so pretty quickly before but you never know.
