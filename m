Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA08625A15B
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 00:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgIAWVO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 18:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgIAWVN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Sep 2020 18:21:13 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA67C061244
        for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2020 15:21:13 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id k63so694993oob.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2020 15:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GMjcFFMjh9CmQrHCBi43lrtpGMhqyeOaxqkERHytROo=;
        b=XSDlwuZu7QNHyUPzVRJXI2B+DZfNJBVpBAQWOJYh6bpiBfpTNRSDihtbioSha9WN18
         z30ObMyBph/Tv1lhEdumAf2Lkwce/ryZEJ83NXFE0eODJbJOXWpsJnfgfxflSNreO0KH
         o5NZa6RoXfm6BQA7YvqWr++eHR2yMePOAqeZlpAVxLXX+fCv++ttSYSOgDEO90/BmYXd
         nihiiCAs3+4T/d42nzUMGKLJFdgiVhKbh7mW2r63kh7YUpThsRvZh4Qc/w6FDjjLxXe8
         O4fGT/erFRPM6+gh7NwFfmA1nU79jnyYRSjKiXtMmFAMnj6dlkGyUfnZoUg0+xRseqV7
         wu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GMjcFFMjh9CmQrHCBi43lrtpGMhqyeOaxqkERHytROo=;
        b=hchsAdBWDKGjpqEDX7JXzEuX5YpSYXUcsA9MsYkIEmf2+/MC9HvPuUKFse3KHJBQHn
         e6trMnjScB6T3xmbeK3G57iRJnJK0hFM8m7R8m1ZHe2qRsbZWZLM/m4wAhz03qGQt+0M
         0NHNsYhYC+h6nSj8aivyJxe4nVu8szUVVOzNt5ZHShxgkTwCkWYXORg5T2hq8FgDxPG0
         E9qXZOeywaY8nKjCFj+ZlIRZH0TSl4oxsnSKa7DrO8rW6JTk3o12QOseZteebcDetXp2
         lf8lpKHH1xXL0It67NzF0Bk69q7iO594shRWW3x0NbAMTJ8S1DIMTtgUSDzZOmRuKe5n
         D5BQ==
X-Gm-Message-State: AOAM530D3MIiz46tE1ZByAmWhuOScDRHTdy4XgGK11UrnAAAU85vNZlK
        6ix1gj6tohP7DFYvjX/en9+HlO/CrLcey2++h+PkbLjd/g==
X-Google-Smtp-Source: ABdhPJxTpLRRGLRBnWegxW9lWMA2lHUlBvH9VYAEKnl6m1dYpRWVKYKyCchjxbnfg46Un80XNyhXu5i80MA8uz+MaoU=
X-Received: by 2002:a4a:aa0e:: with SMTP id x14mr3019913oom.27.1598998872537;
 Tue, 01 Sep 2020 15:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAFSKS=Pv1Ji4XqHjVMCAnszq_HjFYYk7GuzeeCCScHd1NMumDA@mail.gmail.com>
 <20200901185903.Horde.NHT9rmY1GQT34m6C6YMUCNF@webmail.kiener-muenchen.de>
In-Reply-To: <20200901185903.Horde.NHT9rmY1GQT34m6C6YMUCNF@webmail.kiener-muenchen.de>
From:   George McCollister <george.mccollister@gmail.com>
Date:   Tue, 1 Sep 2020 17:21:00 -0500
Message-ID: <CAFSKS=M8xh3UVFEt+QxcCr_Ghie8tBkudrbLO15hpvEzQEbGfQ@mail.gmail.com>
Subject: Re: usbtmc: stb race condition introduced by 4f3c8d6eddc272b386464524235440a418ed2029
To:     guido@kiener-muenchen.de
Cc:     linux-usb@vger.kernel.org, guido.kiener@rohde-schwarz.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 1, 2020 at 1:59 PM <guido@kiener-muenchen.de> wrote:
>
>
> George,
>
> Thanks for your question.
> > Since 4f3c8d6eddc272b386464524235440a418ed2029 I'm experiencing this
> > STB race condition. TL;DR an old, cached STB value can be used after a
> > new one is reported in reply to a control message. Hacking up the
> > latest driver code to ignore the cached stb value gets around the
> > issue.
>
> The SRQ notification is an important message and must not be missed
> in userspace applications. The new implementation does not miss the
> SRQ event anymore, even when multiple threads are waiting for the SRQ event.
>
> Your coding relies on the previous behavior and did not fail for your
> use case and timing. However we could not develop reliable applications with
> the previous implementation.
>
> There are now two ways to wait for the SRQ event:
> 1. Using the poll/select method
> 2. Using the new ioctl USBTMC488_IOCTL_WAIT_SRQ (preferred way)
>
> When receiving the SRQ event, you should immediately read the stb with
> USBTMC488_IOCTL_READ_STB within the same thread to prevent races or
> reading stale status byte information.

I do. I call it as soon as poll indicates there is an SRQ.

>
> More info see:
> https://github.com/GuidoKiener/linux-usbtmc/blob/master/README.md
>
> > My USBTMC device has an interrupt endpoint with a 1ms interval.
> >
> > 1) A query is sent to the USBTMC device.
> >
> > 2) An SRQ is reported via the interrupt endpoint with MAV set.
> >
> > 3) Userspace performs a read to get the reply since MAV is set after
> > being notified by poll().
>
> Did you start reading (read()) without checking the Status Byte after
> poll() event?

I check the status byte after poll(). The problem seems to be that I
also check the status byte in a loop (until there is nothing to
service) before calling poll again. As long as you only check the
status byte when there is a cached value available it should be no
problem. However if you call USBTMC488_IOCTL_READ_STB when there is
not a cached SRQ value an SRQ can occur after the lock is released in
usbtmc488_ioctl_read_stb() and cache an older value (which will be
read by the next USBTMC488_IOCTL_READ_STB) than the one returned. This
is a race condition and sounds broken to me but if this is the
intended behavior I can adjust my userspace code to only do
USBTMC488_IOCTL_READ_STB once after poll indicates an SRQ and live
with it.

It doesn't seem right for USBTMC488_IOCTL_READ_STB to ever report an
older value than what was reported on the previous call.

>
> Regards,
>
> Guido
>
>

Thanks for your reply.
