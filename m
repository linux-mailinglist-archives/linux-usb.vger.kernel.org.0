Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D17E1C551D
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2020 14:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbgEEML4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 08:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728180AbgEEMLz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 08:11:55 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E67C061A10
        for <linux-usb@vger.kernel.org>; Tue,  5 May 2020 05:11:55 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d184so804121pfd.4
        for <linux-usb@vger.kernel.org>; Tue, 05 May 2020 05:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Abv/7rhr/v/5ghsi0YL/I2pl8CswRSslzBuSGDsjfH8=;
        b=kmrkkpj4xzNc32kOT660UnZdVO/0XEF5w66zC5Rot7YZVN2KcAGY1hk8yWJOh0Pnp3
         wRCVTqARax9kslvfxY7YHmT9grw5/nt5Q3qXpUGg1fFZEB+ce3QiEO3A1EKp5slIJoPJ
         vyIq0Bnxj+MJezpQtGDmv+nF+FUFU/Vs3iTGMhzcdyieubsPPCEvf5AEaGQbCsonLD9K
         n0Puj9KqYj+mny72+bGRhGpd/x0oQocn83HaK6Nm0lkIoedqrs6O0U/x8fLKhfPPP44i
         U34HWnAr92OwhN4S/9wIQR6pzejqNEuSDCwjk1KPJ8dkVvk/ppzRAbyGOOGvf9advrGd
         g12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Abv/7rhr/v/5ghsi0YL/I2pl8CswRSslzBuSGDsjfH8=;
        b=aw69JmJJ8q7ybneI8l7kIcFM21Jvd0NGp05hu2PJbulGsWNrExY+mfp+VLf1Yy64XG
         DbWnA+gZCCBH5d49XjPTTNo8/K1CSY0e4m/xuqnqH8XH/MO92O9vGhfM9hBDmdlU7EHC
         75SPFgbgy1+2BCBPVcDlTW+SZYTlp/pDollaWDEcbHPoNkG+4Lt/KuL/eXAfoUmvCV9p
         TjejcftYgVPaLsmkrDHnCRz3FlBWSWxECLtCxiBtkR6UuquVO/oOJJ3QPpsWmPD1ubU+
         INEIKluYwqKzC8NzfVizpcHUaIy9BLFVNM6bE52YP5W/WqZHZd1aPd4QIIxMDzL6ZeAU
         180Q==
X-Gm-Message-State: AGi0PubRDtxedDlRkxaHuw4u/ut/Ub/Wn7LF+xg8XLjqqtyfg8OfKMhG
        N3rYJIVcrVfQZ0yAweP2tWXzzLluV0Fehw58mX04cg==
X-Google-Smtp-Source: APiQypK6cLjJ6Cd0LA0LqazL4l/v2Dyby2+2IAMcClxna2t+ak4c4LjEk2+b4TRMe2nm9/zA6fdae8mSTiT4PyV0ylc=
X-Received: by 2002:a63:a61:: with SMTP id z33mr2654097pgk.440.1588680715004;
 Tue, 05 May 2020 05:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <ca6b79b47313aa7ee9d8c24c5a7f595772764171.1587690539.git.andreyknvl@google.com>
 <059e7e0ff26cc7d6e85275f764e31d85db867c4b.1587690539.git.andreyknvl@google.com>
 <87y2q6akhh.fsf@kernel.org>
In-Reply-To: <87y2q6akhh.fsf@kernel.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 5 May 2020 14:11:44 +0200
Message-ID: <CAAeHK+y=d_Hu1mwGifYuw6GRSBR=zncGCVOeN6GobP3L1zui=Q@mail.gmail.com>
Subject: Re: [PATCH USB 2/2] usb: raw-gadget: fix typo in uapi headers
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 5, 2020 at 9:50 AM Felipe Balbi <balbi@kernel.org> wrote:
>
> Andrey Konovalov <andreyknvl@google.com> writes:
>
> > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
>
> return -ENOCHANGELOG

I've sent v2 with changelog shortly after Greg's response. Would you
like me to resend all raw-gadget fixes formed as a series?

BTW, to whom should I send them, to you or to Greg? I've noticed that
some of my gadget patches from before got into the mainline twice.

Thanks!
