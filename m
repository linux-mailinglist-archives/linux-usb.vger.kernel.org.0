Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452361EE593
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jun 2020 15:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728632AbgFDNql (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jun 2020 09:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgFDNql (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jun 2020 09:46:41 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B3AC08C5C0
        for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2020 06:46:41 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k2so1156154pjs.2
        for <linux-usb@vger.kernel.org>; Thu, 04 Jun 2020 06:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n5YykYsVUmfiYW7cam1Z3BdN8xFpPSyKTmUEcfdR1z8=;
        b=SAnLe1raw9A4EmsBJguXRQGrJKostKsyeaOCvXtx+vkXOqS/nm/mJ9oqklAQ7COf1Q
         UlwOQOyUoB9/EsZn51VmWeP94nIuTDkyhJNhODAYYn8TnRXbKLfRzL89Iw+qNMeuf2/v
         Me8K0gPwV7eg6hmt8/RtclW9lslfo8Vmp29S5lIatjbHcDBM/e3PbtSae6m1bBZ5N2mQ
         bTZ7MsjFQTXfRQu+ONtTqfEXryr8jNFKv1093lA2BLcaGV1NB2UU8TyEGN3oazuz8WfE
         Vq/FzmaEnFKYfLJ2Ei6lJbVKhU9t4tG3o7eGnknAU1fsNVRHXURDsCHIrHRhvqF0LMFL
         kS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n5YykYsVUmfiYW7cam1Z3BdN8xFpPSyKTmUEcfdR1z8=;
        b=bTB8p/3peUiM12Y8TMsss9W2kpg8pje/qgO7R9jmilLW+SDOhvpg/Cmse2nIvSBpQB
         T/7hpBoayqkxNMw22Y9Nl08/lCxyI+ReGBDXDPFs5zDA3jxeqk+MQ4AnB7Ao3a1BJh7X
         5GxZ/tJ8qxEOWkhIK+DmDDlrO2yPFPSb1/HEYkLyg2vOOemVej7sEQbkojJy0u3syeWf
         /SGCLdw2lHX7UInBk8eawx1eR/HWvuiSo2gQBHHRuQMdPwF+87r8HXdK97t9Nfz+O8/T
         3ZZiwUkqlDJv+S6uZq+TkJwC4l8nAs2HTVDvE0RVYA+0JUcdJ4krvdyF5T4cgprI9/v5
         SzZg==
X-Gm-Message-State: AOAM530dTAcxG0opMucRH8sucHazUKIsEWvXEN/sqXPlAGIOwduPpl+x
        SoV+iX9xEEBsg+SIOCxZt4TQBFRgC42d5nNIx9E+jw==
X-Google-Smtp-Source: ABdhPJzrDlfKyrK9SXD/lXa77Cmadj3Hph6fubIl8NPTvCzCoLujYwh+sH5rIR/F4JJBOHpdHGdCEcq6XXVjtlEhv/M=
X-Received: by 2002:a17:90b:1244:: with SMTP id gx4mr6105454pjb.136.1591278400429;
 Thu, 04 Jun 2020 06:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585233617.git.andreyknvl@google.com>
In-Reply-To: <cover.1585233617.git.andreyknvl@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 4 Jun 2020 15:46:29 +0200
Message-ID: <CAAeHK+wxKQnxRKJcjvBWQYgV5wbA7F=dqQ=8Tnw-JS4j-3GV6Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] kcov: collect coverage from usb soft interrupts
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 26, 2020 at 3:44 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> This patchset extends kcov to allow collecting coverage from soft
> interrupts and then uses the new functionality to collect coverage from
> USB code.
>
> Any subsystem that uses softirqs (e.g. timers) can make use of this in
> the future. Looking at the recent syzbot reports, an obvious candidate
> is the networking subsystem [1, 2, 3 and many more].
>
> [1] https://syzkaller.appspot.com/bug?extid=522ab502c69badc66ab7
> [2] https://syzkaller.appspot.com/bug?extid=57f89d05946c53dbbb31
> [3] https://syzkaller.appspot.com/bug?extid=df358e65d9c1b9d3f5f4
>
> This patchset has been pushed to the public Linux kernel Gerrit instance:
>
> https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2225
>
> Changes v3 -> v4:
> - Turn current->kcov_softirq into unsigned int to fix objtool warning.
> - Fix commit author email address.
>
> Changes v2 -> v3:
> - New patch: "kcov: fix potential use-after-free in kcov_remote_start".
> - New patch: "kcov: move t->kcov assignments into kcov_start/stop".
> - New patch: "kcov: move t->kcov_sequence assignment".
> - New patch: "kcov: use t->kcov_mode as enabled indicator".
> - Dropped out-of-memory error message from kcov_init() as checkpatch
>   complains.
> - Use a single local_irq_disable section when accessing per-task kcov
>   variables in kcov_remote_start/stop().
>
> Changes v1 -> v2:
> - Add local_irq_save/restore() critical sections to simplify dealing with
>   softirqs happening during kcov_remote_start/stop().
> - Set kcov_softirq after flag kcov_start() in kcov_remote_start().
>
> Changes RFC -> v1:
> - Don't support hardirq or nmi, only softirq, to avoid issues with nested
>   interrupts.
> - Combined multiple per-cpu variables into one.
> - Used plain accesses and kcov_start/stop() instead of xchg()'s.
> - Simplified handling of per-cpu variables.
> - Avoid disabling interrupts for the whole kcov_remote_start/stop()
>   region.
> - Avoid overwriting t->kcov_sequence when saving/restoring state.
> - Move kcov_remote_start/stop_usb() annotations into
>   __usb_hcd_giveback_urb() to cover all urb complete() callbacks at once.
> - Drop unneeded Dummy HCD changes.
> - Split out a patch that removed debug messages.
>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
>
> Andrey Konovalov (7):
>   kcov: cleanup debug messages
>   kcov: fix potential use-after-free in kcov_remote_start
>   kcov: move t->kcov assignments into kcov_start/stop
>   kcov: move t->kcov_sequence assignment
>   kcov: use t->kcov_mode as enabled indicator
>   kcov: collect coverage from interrupts
>   usb: core: kcov: collect coverage from usb complete callback
>
>  Documentation/dev-tools/kcov.rst |  17 +-
>  drivers/usb/core/hcd.c           |   3 +
>  include/linux/sched.h            |   3 +
>  kernel/kcov.c                    | 266 ++++++++++++++++++++++---------
>  lib/Kconfig.debug                |   9 ++
>  5 files changed, 213 insertions(+), 85 deletions(-)
>
> --
> 2.26.0.rc2.310.g2932bb562d-goog
>

Hi Andrew,

This series is ready to be sent upstream.

Thanks for bearing with us!
