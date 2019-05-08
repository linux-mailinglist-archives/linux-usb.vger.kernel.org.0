Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDC3181BB
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 23:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbfEHVpS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 May 2019 17:45:18 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44977 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbfEHVpR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 May 2019 17:45:17 -0400
Received: by mail-wr1-f68.google.com with SMTP id c5so3894611wrs.11
        for <linux-usb@vger.kernel.org>; Wed, 08 May 2019 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7D+ymcQFsrZ9j+jO/ay0tfKGA3nxqSGTzzYNIStXbzQ=;
        b=kAuKSd/V2ppASosx273j6mDoFHWe4rWhtbFfHE41dqsWfGFqHmoZvFmHnGki//NAG4
         K0wuhsGesLSOeFD499Xy4lUu5oGzfgV73AK53meOAhmINDFgtEHam9PqPkfXVI8ZG5vJ
         r3kXIcJ8zc4AiZyUtIPHYVFMNana60A/OhnlX1iW2MfALdyafIM5npX4keYfqudvGRXf
         iZIknMFX/dbrTfuS/pcDVPchKuJ2g55KEbtSJ2jYTtdlo5hRXG2iJFF4Qy8u1X7zLe2S
         YbZ4pXCNETFqW9L+nifPLENUoQ8fhc12kkBDjLCqs/WWjb0mG4SRz/0vuBSdGZCgBBCu
         H0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7D+ymcQFsrZ9j+jO/ay0tfKGA3nxqSGTzzYNIStXbzQ=;
        b=C+O8+t+7dovq9kdYHJkDCFKSpQW0jr/4NtJRgZ+ldmIfwvPGxk/SSyfv4NGicVdqLf
         y5zW4pmKEcbU/ZC20KsS/EQ82FThU46pL4oEznjIVu7ybFhQMrONpb52rZHsm8/oWvC1
         Ze5l34h3QeyG9eMiIo0kXq2AfkZWi/Le+aa1vtUDhwaA49o6TD/JKKK3WcxEPVbVkabc
         pA/y3nD6GqRA0SBBfxqtAUpMpQxWTGFO1BJ4hzL8PVdWOWI6bd3of+lzHyA5rjM4yUWQ
         KjyD5c8TlVEM3SRiqAgoTr/qmVo0Vto4i5jm8oyJl8fCg0iRoTJNI2/b9CEfw0igsSf5
         U1Sw==
X-Gm-Message-State: APjAAAXv3zCQkftjnxruk2gSzq4mjSL7rbnRHp6hz9LS5UedgHAQ4zGw
        yZQ8Ztf6RuO6DBgw+WYMZtZG5zTNftSyZ3yDWsCNVQ==
X-Google-Smtp-Source: APXvYqzl1zSINu14DgAj1utER5ei9eR2196mUVGyWSseCtTBtzOoGri96Qc9/kkU1stUP1eLXx+3MEK1BfAf7ZCAhsw=
X-Received: by 2002:a5d:50c2:: with SMTP id f2mr101308wrt.253.1557351915966;
 Wed, 08 May 2019 14:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLUMRaNxwTUi9QS7-Cy-Ve4+vteBm8-jW4yzZg_QTJVChA@mail.gmail.com>
 <3b57eb64-4c25-4582-7b0d-59143060b5a5@collabora.com>
In-Reply-To: <3b57eb64-4c25-4582-7b0d-59143060b5a5@collabora.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 8 May 2019 14:45:05 -0700
Message-ID: <CALAqxLW2AubzLOz7S1QWdNtxhO3kk5kikyXo7ToZ=vCOF0vNbg@mail.gmail.com>
Subject: Re: [REGRESSION] usb: gadget: f_fs: Allow scatter-gather buffers
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Felipe Balbi <balbi@kernel.org>, "Yang, Fei" <fei.yang@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chen Yu <chenyu56@huawei.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "kernel@collabora.com" <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 8, 2019 at 5:44 AM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
> W dniu 08.05.2019 o 04:18, John Stultz pisze:
> > Andrzej: Do you have any ideas or suggestions on this? I'm happy to
> > test or run any debug patches, if it would help narrow the issue down.
> >
>
> Can you please try the below patch?
>
> One more thing to consider is "functionfs read size 512 > requested size 24,
> splitting request into multiple reads." in your original report, but let's
> try this first:
>
>  From f2b8f27cfa42cafe1f56d8abbe2c76fa0072e368 Mon Sep 17 00:00:00 2001
> From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Date: Wed, 8 May 2019 13:52:40 +0200
> Subject: [PATCH] usb: gadget: Zero ffs_io_data
>
> In some cases the "Allocate & copy" block in ffs_epfile_io() is not
> executed. Consequently, in such a case ffs_alloc_buffer() is never called
> and struct ffs_io_data is not initialized properly. This in turn leads to
> problems when ffs_free_buffer() is called at the end of ffs_epfile_io().
>
> This patch uses kzalloc() instead of kmalloc() in the aio case and memset()
> in non-aio case to properly initialize struct ffs_io_data.
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Hey Andrzej,
  Thanks so much for sending this patch out! I tried it, but on both
HiKey960 and Dragonboard 845c (both dwc3 hardware) I'm still seeing
the same problem with this change.

On db845c "adb logcat" will usually hang mid-way and just sit there.
Further adb shell connections don't connect until I unplug and replug
the usb cable.

On HiKey960 logcat seems to work, but doing something like adb install
<big application> will stall and never complete.

Again, in both cases I'm not getting much in the way of error
messages, so there's not much clue as to whats going wrong.

Let me know if you have any further ideas to try.

thanks
-john
