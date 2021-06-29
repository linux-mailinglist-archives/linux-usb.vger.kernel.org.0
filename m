Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A466F3B7372
	for <lists+linux-usb@lfdr.de>; Tue, 29 Jun 2021 15:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234145AbhF2NsZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Jun 2021 09:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233050AbhF2NsZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Jun 2021 09:48:25 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06254C061760
        for <linux-usb@vger.kernel.org>; Tue, 29 Jun 2021 06:45:58 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id o139so16483974ybg.9
        for <linux-usb@vger.kernel.org>; Tue, 29 Jun 2021 06:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=HRTmpwpH5bcqsgViVo+tzjiKz41aMk5YgpdTNp3QNP0=;
        b=dKln60ZoIaqFKnA0YNLWDf5RpwfmYQJEUYOj2GoG+wyDkkMnsb8y6BYv+0VYIABRLf
         g2iiVCgezFZReLQg/v0gz1a7mHmhRqkgAiNUAgCKnjXnx+n2rIYY0Ot35PpPXoUhmtY3
         eW2TYQuz8lvspZZf/OcsFrWQWRLkxFUZEmFFE8YdGw5xp9rTUM6dH1iyPYcvFhNm1lsB
         iacwlkRiOtJqAxne4FR2wIJRwaBj/CnZ+6ly0WQzComoHkq8YyNCuhgW2NFJ2tgamh7d
         VkysFMUJJ2iEanXvdIJrSESm1FdgaLOPfgRdw6oz+8AaDNBqFu9WEUH8xBVzehsFbc7I
         NtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=HRTmpwpH5bcqsgViVo+tzjiKz41aMk5YgpdTNp3QNP0=;
        b=roNi0vEF9Enf+jAS/772pPJwnJmQpwhqc39+gprZpfkYK2U304yoX3azB7JkwUy4TD
         uPoU8lTfBvnhjMekA4i/FX5Ya1weEp6vVjZjMUayOk7wD6SbBeGf+Zp8Fp4OglbSVpy8
         QliYecspFvWP9aIqUU4wsvyJIQCjCBqG+5vnq1nAzPCs/nHinjxNNBUU0mPRe6jcfZtm
         RR2e+t3NN7A0C8OA+A/cCQ+De59+Jio9bA9elbOoZ/V/ZElUNpVkywpg+0zOQHU2F+0X
         IVpmaXfAquWgD2IJG90wis2100fwZ/ZdfSXjXer5s/8iOJnWGZSnFIxZfPonxgtGAJ7e
         xejQ==
X-Gm-Message-State: AOAM533eXkZsO+V1GoMhmpcMufRaAyqNSu5cp3B1Lnh+g6bJvVhPm31q
        z79FcEC7d92ritbXp7pd+qjQErGe0vQUEXHms3q2O4Wy6u0=
X-Google-Smtp-Source: ABdhPJx3Jyrclz89Pj9OS66hYoR4ozUGIWxL1o0btEU26k/GlUzUN/+N/3dc6MnL/0ny/fg1h/a4KQUpWCJKZzJioVk=
X-Received: by 2002:a25:be44:: with SMTP id d4mr40116130ybm.497.1624974357334;
 Tue, 29 Jun 2021 06:45:57 -0700 (PDT)
MIME-Version: 1.0
From:   Benjamin Marty <benjamin.marty@gmail.com>
Date:   Tue, 29 Jun 2021 15:45:46 +0200
Message-ID: <CABSdY3LGN202SN5YJxnk_bMAx2-js=AB0hictqo69ENgWbMQSw@mail.gmail.com>
Subject: USB Gadget Filesystem HID stuck on write when using mass storage at
 the same time
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello

In my application, I boot a Linux System through USB Gadget mass
storage and at the same time pass in USB Touch commands via USB HID
Device. Both over the same USB OTG Gadget Link.

If I execute USB HID commands during high traffic over the USB Mass
Storage, the HID device gets stuck. Writes to it are then blocking
forever. I'm not sure if I use something wrong or if this is a Kernel
issue. Do I maybe need to check something before I'm allowed to write
to the HID device?

Hardware issue are unlikely, I tried it on the Raspberry Pi Platform
and also on the NXP iMX8MM platform. Both have this HID device stuck
issue. I have also tried multiple Intel Computers as USB Host.

I tried to document my issue here with test scripts to replicate what
I do in my C Application with the same result:
https://github.com/raspberrypi/linux/issues/4373

Thanks

Benjamin
