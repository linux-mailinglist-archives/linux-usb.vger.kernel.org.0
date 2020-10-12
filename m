Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89AB28B55B
	for <lists+linux-usb@lfdr.de>; Mon, 12 Oct 2020 14:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgJLM6q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Oct 2020 08:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgJLM6q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Oct 2020 08:58:46 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8E1C0613D0
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 05:58:46 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 10so3909121pfp.5
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=reOzyJrsniBO2nwMi3H/mkrdDD6NcedCHzoL76QyI30=;
        b=La1neubO+tx9bEnVOlpDUmfBRHHhLp9sb+Oicr1ibu621uEe1hJd3y2dvPnIRrmI0M
         S7RAssOCZn6vzaYsb2mF23fwiVWjRfdtpqQima9oXIQgXkry4GucEW8powsj3J7ftmD9
         dbuofS/NjlxfZvRCxJ86pGkSJKIdXaY2NcTDtXEmREJITL4dugSf2i/cCPI/L6rMG7Qx
         monPLjbsolWgPlB6LvUWHzBxmHrQoS+gnzDzpi1BfGPQW4qnaZ7KRMZnCyTtVyZxK7Y0
         uRMhYEgssAKF2aaoImsx82hUmyBZMSriAAb/WBy1NLF4/iDoyGmDAATpptK/VEauk2hT
         zmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=reOzyJrsniBO2nwMi3H/mkrdDD6NcedCHzoL76QyI30=;
        b=acx/uuia9eip9Q2QBLiR1/02akW8ME/rl8d7RBxZ+B66ZIv6iO2w06+4fcOdzlQe/h
         b75MwVrO5E0yGaosqyqRoMP/8KdPosprTtNrf20tokD0f0yHOY5oem6T2UrTLGf/XXap
         RzdGc8Ztd2xZ+gt/oMElp03/IXWHId6nwregtL8089z64dc50HSq89NKby3oHUuB+Eu3
         FtxBwlPYxXTWarctynaFz4qsg13n41rsYmkxQKMxIZ0vpNuSjbkvzNQh5ung1ltI2CxA
         Qi08a6XTxvUjWfXmGiSE7YgZ2B2INkIoLGpsjMSz3OQ1DwhzJTKyzN5u5eH0Ceo7Gerl
         48Hw==
X-Gm-Message-State: AOAM531pwU/AwfBKhGb5IUUgAOtGqVa7ftxAMEz0pkpPVY1c6CTftFMc
        dx3rRoX2fNxh6FWddLNjIQAn0gyT13UjQ7AOBFPd/A==
X-Google-Smtp-Source: ABdhPJyx/a16f8RYypyz+PcykMTRZXqibrYFsGfunl+c7L1RzS1MMiV4cKON1GpMX0uXpXFSaCEJWSCF7/ZXbThan4A=
X-Received: by 2002:a63:1906:: with SMTP id z6mr3520215pgl.286.1602507525514;
 Mon, 12 Oct 2020 05:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000021e6b05b0ea60bd@google.com> <00000000000069707b05b13da267@google.com>
 <20201009185548.GA546075@rowland.harvard.edu>
In-Reply-To: <20201009185548.GA546075@rowland.harvard.edu>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 12 Oct 2020 14:58:34 +0200
Message-ID: <CAAeHK+y11k5rj9n=+Z7Y9bYjsWBoqaXfsystF3pCWgTPaRxrjg@mail.gmail.com>
Subject: Re: WARNING in hif_usb_send/usb_submit_urb
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+f5378bcf0f0cab45c1c6@syzkaller.appspotmail.com>,
        QCA ath9k Development <ath9k-devel@qca.qualcomm.com>,
        eli.billauer@gmail.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        gustavoars@kernel.org, ingrassia@epigenesys.com,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        linux-wireless@vger.kernel.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 9, 2020 at 8:55 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> To the ath9k_htc maintainers:
>
> This is an attempt to fix a bug detected by the syzbot fuzzer.  The bug
> arises when a USB device claims to be an ATH9K but doesn't have the
> expected endpoints.  (In this case there was a bulk endpoint where the
> driver expected an interrupt endpoint.)  The kernel needs to be able to
> handle such devices without getting an internal error.
>
> On Fri, Oct 09, 2020 at 07:19:19AM -0700, syzbot wrote:
> > syzbot has found a reproducer for the following issue on:
> >
> > HEAD commit:    6c8cf369 usb: typec: Add QCOM PMIC typec detection driver
>
> Andrey, why doesn't syzbot put a 12-digit commit ID here?

No particular reason, I think. Makes sense to change it to 12, as it's
the recommended minimum AFAIU. I've a bug to track this here:
https://github.com/google/syzkaller/issues/2184

Thank you!
