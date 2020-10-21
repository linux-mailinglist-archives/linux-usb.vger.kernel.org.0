Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3692947BA
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 07:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440410AbgJUFTR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 01:19:17 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:35973 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440408AbgJUFTR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Oct 2020 01:19:17 -0400
Received: by mail-il1-f195.google.com with SMTP id p10so1159917ile.3
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2020 22:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IHQLhiahxjzBExZWVYRG4MzYtEx/IzjTTclICTJR3vw=;
        b=B1dY+aLL9BAJ/haZrK1ZbhSpI3lHGmTeABbZuRjPen3XKf+WyXUWq9zBnga23nAfSJ
         C8oHuJBPA+CcZCTkRN0I22KfClbuvrwhQm7GAhBqtf4aH42wP57aqiQBlSXYmuZs6ZIT
         WrczIjVg5MBah2kzrLj637CnQkk9US2cpKhvt8fYs+9vvCy15Uha9bErMxv6LZ0v67dg
         h3K5cXxn74lJNruQRg+QH7xCLzPLK3eMbYCwDLiysk9QBzSsd738KeAhvrJ0MB/8zkei
         PFvez9CQ5Sms+Vbj59zNetkm0ppZtlkYKawYhs/4jJhTv4I0ybY8yWCUIXT0tBCJgPbm
         2bQA==
X-Gm-Message-State: AOAM532FTMOgijopuep3vZ0FbTn7dGbI/pVpjGBulNHZdRP+NzVL7gaR
        YNw1s8VHjPk5tKM17M7b90oKj+kJLIS3m2p5
X-Google-Smtp-Source: ABdhPJzCgeHIxCp9btJODOzW5C+pMBM3PEhDyK312YmGNN8aa8krWN/XwEgsC5YDGFNW2XUiXojHbw==
X-Received: by 2002:a05:6e02:1283:: with SMTP id y3mr1081882ilq.305.1603257555688;
        Tue, 20 Oct 2020 22:19:15 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com. [209.85.166.169])
        by smtp.gmail.com with ESMTPSA id j3sm507870ilq.85.2020.10.20.22.19.15
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 22:19:15 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id g7so1104580ilr.12
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2020 22:19:15 -0700 (PDT)
X-Received: by 2002:a92:da05:: with SMTP id z5mr1044881ilm.182.1603257555073;
 Tue, 20 Oct 2020 22:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
 <20201017200200.GB842001@rowland.harvard.edu> <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
 <20201019174028.GF898631@rowland.harvard.edu> <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
 <CAE3RAxuX6SBKx22q6XZ7wTVYQNzJqZ=2Vsc4jOqK3V2-mgYOqQ@mail.gmail.com> <3fcc724f-5b5e-e441-fd12-31365d140773@runbox.com>
In-Reply-To: <3fcc724f-5b5e-e441-fd12-31365d140773@runbox.com>
From:   Pany <pany@fedoraproject.org>
Date:   Wed, 21 Oct 2020 05:19:03 +0000
X-Gmail-Original-Message-ID: <CAE3RAxvmZ-quV121smHyNk5MDW44WgLzfSJCPWTHrbkQ_zbVKA@mail.gmail.com>
Message-ID: <CAE3RAxvmZ-quV121smHyNk5MDW44WgLzfSJCPWTHrbkQ_zbVKA@mail.gmail.com>
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
To:     "M. Vefa Bicakci" <m.v.b@runbox.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thank you Vefa!

Appending module_blacklist=apple_mfi_fastcharge works for me!

Actually I checked the output of "sudo lsmod | grep fastcharge" with
the working kernel, and I should have noticed that module name
apple_mfi_fastcharge, but I missed it.

Thank you for your suggestion again. If you need more information or
debug log, please let me know.

On Wed, Oct 21, 2020 at 4:19 AM M. Vefa Bicakci <m.v.b@runbox.com> wrote:
>
> On 20/10/2020 23.17, Pany wrote:
> > Thank you so much for guiding me!
> > On Tue, Oct 20, 2020 at 12:04 PM M. Vefa Bicakci <m.v.b@runbox.com> wrote:
> [Snipped by Vefa]
> >> Pany, in the mean-time, could you add the following string to your kernel's
> >> command line (i.e., via GRUB, or the actual boot-loader that you use) and
> >> let us know whether it helps to *work around* this issue with the latest
> >> versions of 5.8.y kernels?
> >>
> >>          module_blacklist=apple-mfi-fastcharge
> >
> > And I also installed the official built kernel-5.8.15-201.fc32.x86_64.rpm [5].
> >
> > Adding module_blacklist=apple-mfi-fastcharge to the GRUB entry did not
> > succeed in the kernel booting.
> >
> > With following kernel cmdline, I captured the journal [6]:
> >
> > kernel: Command line:
> > BOOT_IMAGE=(hd5,gpt3)/vmlinuz-5.8.15-201.fc32.x86_64
> > root=/dev/mapper/fedora_localhost--live-root ro
> > resume=/dev/mapper/fedora_localhost--live-swap
> > rd.lvm.lv=fedora_localhost-live/root
> > rd.luks.uuid=luks-65d9ed28-ea08-4ea5-a1dd-7b2b086f5e09
> > rd.lvm.lv=fedora_localhost-live/swap
> > module_blacklist=apple-mfi-fastcharge systemd.debug-shell=1
>
> Hello Pany,
>
> My apologies, the original kernel command line entry I mentioned was
> incorrect; the module name needs to be specified with underscore characters
> ("_") instead of dash ("-") characters. Could you try the following as well?
>
>    module_blacklist=apple_mfi_fastcharge
>
> Using this string in the kernel command line causes "modprobe apple-mfi-fastcharge"
> to fail with -EPERM on my system, and hence I am hoping that this should
> at least unblock your day-to-day use of recent kernels.
>
> Sorry again for the mistake in my earlier suggestion.
>
> Vefa

-- 
Regards,
Pany
pany@fedoraproject.org
