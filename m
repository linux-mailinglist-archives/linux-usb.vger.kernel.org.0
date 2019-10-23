Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5463CE1460
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 10:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390277AbfJWIhZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 04:37:25 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37674 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387829AbfJWIhZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 04:37:25 -0400
Received: by mail-qt1-f195.google.com with SMTP id g50so16968105qtb.4
        for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2019 01:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8lz7pb4FteEgyJv9IPQ/OLCtPnphrxWGvxhOP9Cg5xg=;
        b=JwTjN6vydN0+Zf4u7pB30rwoE59an2gXmw4CK43Gw2mUgwv6sHB8dRu5ef+CPKrKi9
         t37NRMXY7Pqn+GOXFnQVRUhDon6l/NVQ8pA0BemeHOS2xV5gnJeOluyURTVwqiqciHLr
         qDsbygaUpKyOoJQGtYGQCZ1Z1qPmuIERBA+CkHYIsho9310tefDA69PATQdcjEBUxKvZ
         zccwGPi/rBKb1ABlUBTM4DzoW7/ny0B2e4mksE9SWdW/VXPMMYWRkgwBwgTZmF6XoI/2
         9Klci3Rpbj2E75wUXAhDRIwV2xUCPGOaB+CkTyurziCQ8SokD8YBhlXIMeY8vmxGNMh9
         CpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8lz7pb4FteEgyJv9IPQ/OLCtPnphrxWGvxhOP9Cg5xg=;
        b=gtguJZvFywFNvCxdcZQJ8fSoew8cNOmi0xwlIY/bDED93Dox3XlZgGIs91QToAvGX0
         mnHNjVoC0iUbo5VYb81GjtyHPMYncoK5yJsSQc9zDZqQKCDZjVSttuqghI5q3gmUBHAA
         RFJP4yRpHSM6HqEOlaB/yMlCkpy8JFexXSTaVhGwDhz0xf6hQTtKDKs0TigdsAc7FG+T
         U6c9OK1A8lcX2ukxZcP6+41M4Yd0KmeghqfNYwivu1uuDDOrURy48k+UfNwQB4BMZQLV
         zuUACGogTIUJIG0saNVGtsYEBlTF7v6Bib/SDAyDE+vECrk2MAA0l1r5lqZG7XG2dmMA
         VGrg==
X-Gm-Message-State: APjAAAWkKKWMdUrn6ffuwSnL1fCvM+CLpzF4L2cv4EdpTeQ4VWQ+mpRd
        LmRWPl+IZCKJKBW/m+9o9WYOjG+EaMhVWTp3M4lKSQ==
X-Google-Smtp-Source: APXvYqzx+Vk1M8As38RQ4hIHR6mJF2kC4m1fQbj0srob4XtBiTnVVZbS/2BQAN6f9QjBuuoyoWNpTyhH+FFLQW+4r9s=
X-Received: by 2002:a0c:fec3:: with SMTP id z3mr7697922qvs.122.1571819843712;
 Wed, 23 Oct 2019 01:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571762488.git.andreyknvl@google.com>
In-Reply-To: <cover.1571762488.git.andreyknvl@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 23 Oct 2019 10:37:12 +0200
Message-ID: <CACT4Y+aUf5_+U90BD=1FsS1vVFrH=kskkUJWFyg2cdeRjL1LVw@mail.gmail.com>
Subject: Re: [PATCH 0/3] kcov: collect coverage from usb and vhost
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        David Windsor <dwindsor@gmail.com>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 22, 2019 at 6:46 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> This patchset extends kcov to allow collecting coverage from the USB
> subsystem and vhost workers. See the first patch description for details
> about the kcov extension. The other two patches apply this kcov extension
> to USB and vhost.
>
> These patches have been used to enable coverage-guided USB fuzzing with
> syzkaller for the last few years, see the details here:
>
> https://github.com/google/syzkaller/blob/master/docs/linux/external_fuzzing_usb.md
>
> This patchset has been pushed to the public Linux kernel Gerrit instance:
>
> https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/1524

Oh, so much easier to review with side-by-side diffs, context and
smart in-line colouring!

> Changes from RFC v1:
> - Remove unnecessary #ifdef's from drivers/vhost/vhost.c.
> - Reset t->kcov when area allocation fails in kcov_remote_start().
> - Use struct_size to calculate array size in kcov_ioctl().
> - Add a limit on area_size in kcov_remote_arg.
> - Added kcov_disable() helper.
> - Changed encoding of kcov remote handle ids, see the documentation.
> - Added a comment reference for kcov_sequence task_struct field.
> - Change common_handle type to u32.
> - Add checks for handle validity into kcov_ioctl_locked() and
>     kcov_remote_start().
> - Updated documentation to reflect the changes.
>
> Andrey Konovalov (3):
>   kcov: remote coverage support
>   usb, kcov: collect coverage from hub_event
>   vhost, kcov: collect coverage from vhost_worker
>
>  Documentation/dev-tools/kcov.rst | 120 ++++++++
>  drivers/usb/core/hub.c           |   5 +
>  drivers/vhost/vhost.c            |   6 +
>  drivers/vhost/vhost.h            |   1 +
>  include/linux/kcov.h             |   6 +
>  include/linux/sched.h            |   6 +
>  include/uapi/linux/kcov.h        |  20 ++
>  kernel/kcov.c                    | 464 ++++++++++++++++++++++++++++---
>  8 files changed, 593 insertions(+), 35 deletions(-)
>
> --
> 2.23.0.866.gb869b98d4c-goog
>
