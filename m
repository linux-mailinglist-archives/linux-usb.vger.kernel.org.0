Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF7B2DB39E
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 19:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394375AbfJQRoU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Oct 2019 13:44:20 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:46822 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394364AbfJQRoU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Oct 2019 13:44:20 -0400
Received: by mail-vk1-f201.google.com with SMTP id n124so1234192vkg.13
        for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2019 10:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=AepTsz+A74jxm03gyi80tnEG5pdCAiVEmB2VKmmYbAA=;
        b=txWXUG/bKJH+xYvRuY3lNWGbs0Fu/K7TeNieEqEzkwCbQ951DttsTLGCzkXdVPy3KY
         Km2w/kOt807GP8B2mwZNT/1sE4XCnhEOgDKdD2r4LCXjfxdltkSQyRv4CGCTq1VoGRr2
         91CJUZ7DeaO+yiJF+glAdddLlpQJvF72+eqedoBsFNo0bVaZHL++3E9pDK/04d2YWGe+
         np7G/lXqW7cVF7AenbULxn1+Hg8fqiLGg2q6O/L99nPop1TMN0R0LzXBRRMq6hiBGMPQ
         t+QwWnw5oWFay2e0WWPMTYmTGfrtu7hXElVim/VjermRHIFXL96frNDlAwKVbaRGZzxv
         pUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=AepTsz+A74jxm03gyi80tnEG5pdCAiVEmB2VKmmYbAA=;
        b=Ot0aQdKcp0s8rOO93PAtoNRb9ZxRTRVGmD+/W7S3aQvzhvInuyYnxSVjBGk120o1X8
         qtxKae6LBlT6d7vVE+RTL1ZlELPg0QRF4/YHjq72tJ4hYdmnngaqwsLe7VgYzKr3P4fK
         uvl7Mq/QxdwdewVPzhhARXwDias/rr7Z3hazrqtE8v9IoUAv4f0dEdTtZCWxWHT3HAlY
         hoIGieI3xfiVb3OyVV0jNhLJa7rFGNh9btXgWSS3aXasKHXoITuMCUV09SuUEUjFhbUW
         bPRDrlyLxnSFeENpHgNKVOg3mF+ixnC0iSwj+MRc1lvEWOhI9h4qFI4eaNH5xhnEw11i
         8FzQ==
X-Gm-Message-State: APjAAAVDtSjDL8RNFx8aVEoOWYY4LucWI8U+8dl9Opzq5uItnYq1aKUW
        LiWQog/+opN3KdDsH6vuV4ihzmICETZNKDR6Asa9ASB3hkeW0U6FnXVkZZYlAHbmg5/iLh+dUB5
        bZuh+02KwqAZJnWWbFrRt0KZM/+7HxZJ8Absq6UCl8DzG776MSADbkyzdXx1zNIShixmDeiPEy9
        Rp
X-Google-Smtp-Source: APXvYqw6C55wAy116NWvppt7eDZT+fCR1ORnXW7Efx/dADnmZz5XHGPkhTIDMeFVShexmVeAGLoCcWUsVfibJxkz
X-Received: by 2002:a9f:200a:: with SMTP id 10mr2884411uam.42.1571334259331;
 Thu, 17 Oct 2019 10:44:19 -0700 (PDT)
Date:   Thu, 17 Oct 2019 19:44:12 +0200
Message-Id: <cover.1571333592.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH RFC 0/3] kcov: collect coverage from usb and vhost
From:   Andrey Konovalov <andreyknvl@google.com>
To:     linux-usb@vger.kernel.org, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        David Windsor <dwindsor@gmail.com>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patchset extends kcov to allow collecting coverage from the USB
subsystem and vhost workers. See the first patch description for details
about the kcov extension. The other two patches apply this kcov extension
to USB and vhost.

These patches have been used to enable coverage-guided USB fuzzing with
syzkaller for the last few years, see the details here:

https://github.com/google/syzkaller/blob/master/docs/linux/external_fuzzing_usb.md

Andrey Konovalov (3):
  kcov: remote coverage support
  usb, kcov: collect coverage from hub_event
  vhost, kcov: collect coverage from vhost_worker

 Documentation/dev-tools/kcov.rst |  99 +++++++
 drivers/usb/core/hub.c           |   4 +
 drivers/vhost/vhost.c            |  15 ++
 drivers/vhost/vhost.h            |   3 +
 include/linux/kcov.h             |  10 +
 include/linux/sched.h            |   6 +
 include/uapi/linux/kcov.h        |  18 ++
 kernel/kcov.c                    | 434 ++++++++++++++++++++++++++++---
 8 files changed, 554 insertions(+), 35 deletions(-)

-- 
2.23.0.866.gb869b98d4c-goog

