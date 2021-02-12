Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13517319DCD
	for <lists+linux-usb@lfdr.de>; Fri, 12 Feb 2021 13:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbhBLMBl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Feb 2021 07:01:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbhBLMAQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Feb 2021 07:00:16 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA99C061756
        for <linux-usb@vger.kernel.org>; Fri, 12 Feb 2021 03:59:36 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id u14so699401wmq.4
        for <linux-usb@vger.kernel.org>; Fri, 12 Feb 2021 03:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2/O2+yGZT3dlZkoYb3t6s2sashcYjFfo5PgmQZA4ci4=;
        b=O7jG6N4xXeInCuTzuYFbUULeb++dWhK95wxcFuGMx7bjGtzz0sVTl7QX3PxsT3/RX5
         IKDeq0nGGbSZNOqbz+oWGuHLfOiswNnFtgbnQ6GIJxVeVg2447G+5fVMgIbUGa4d4s4G
         TAqpCjzEJ7So3yGjMVGfdeAyikeO9LYIBI/FlFNPh4sTfrIhehl79ouOvCxieAMgzIos
         Ih07l9+OqEjQgbsxoaZy978U9r6TJbgnZYVHKGkQ/8GrynEGzYUpRQ/ZfzLiRBjj51aX
         iFmfz0GrJPbgFC8KgjogfYbOe1sZj6Cic5cMbcuUOVK/fG8+meW9c2lXrCQ5MQC8S3mH
         dy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2/O2+yGZT3dlZkoYb3t6s2sashcYjFfo5PgmQZA4ci4=;
        b=EW10O68r+QzhEiWBvAKC6V90SobchcafCRYTUQx/S6i87r1CB5L9Y+BOprkp7+utVB
         26baEzwIAk+cH0kQbae69fnTfns60hqLadmeiykNEueYCy5l80MBbH/O/VOiHyDQSWlw
         0yk6Ya5SNre+egCZZETm3458QwAikT8oczNiAxNu4tegFKlGgXDR6xSUQHtbQaWVMegp
         0ecRiVnVj4SYOpdAzDPtFZXeo42wwUU3vn/ST0bIuUIAIE6WQxBNcxwmAz5q65Q+5YrG
         UGJPE/991DDb0ZFNP9j6flzRKd+OrFjoqy+LSOhTxawSlYREzcjmo5GBHCj457A3eX+m
         Y2ug==
X-Gm-Message-State: AOAM531Kzbmi6lDr63P/eZt7FhqBLFnClYJ7QZ81jgH0U6iLegOVvxW0
        iej5v06RQKFNuskBD/ZBy5eFctflTZNUoSLF7kI=
X-Google-Smtp-Source: ABdhPJzPYdM26oL1Mc2zA6Xr4FMF12p/zwkDq7ANw2qVLZH/Q2cYfnuhFO5CTFYp+Awm2tdLFDfT8sBsYx8doPfxRbk=
X-Received: by 2002:a1c:e309:: with SMTP id a9mr2340184wmh.99.1613131174853;
 Fri, 12 Feb 2021 03:59:34 -0800 (PST)
MIME-Version: 1.0
References: <20210212110738.169808-1-ydewid@gmail.com> <20210212111046.170342-1-ydewid@gmail.com>
 <88cbbc09e998761097677111b9d166fc1f677026.camel@suse.com>
In-Reply-To: <88cbbc09e998761097677111b9d166fc1f677026.camel@suse.com>
From:   Yorick de Wid <ydewid@gmail.com>
Date:   Fri, 12 Feb 2021 12:59:05 +0100
Message-ID: <CAGDk_A8kZZiGTdx+JGZDRu5ibOcy8VPYDaqeQtbHfc3wCsjG4A@mail.gmail.com>
Subject: Re: [PATCH v3] Goodix Fingerprint device is not a modem
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> what else is it?

It's a fingerprint device/biometrics that should be handled by the
Goodix MOC driver in libfprint. libfprint supports some Goodix devices
but not all. I _suspect_ that other PID's from the same VID and
class/subclass/protocol will also match the ACM driver.

Y.

On Fri, Feb 12, 2021 at 12:43 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Freitag, den 12.02.2021, 12:10 +0100 schrieb Yorick de Wid:
> > The CDC ACM driver is false matching the Goodix Fingerprint device against
> > the USB_CDC_ACM_PROTO_AT_V25TER.
>
> Hi,
>
> what else is it? Which driver should be used or is it to be handled
> in user space? That needs to go into the change log. Otherwise
> this patch just looks like it drops every access to the device.
>
>         Regards
>                 Oliver
>
>
