Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2FE311218E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2019 03:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbfLDCq3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 21:46:29 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:40938 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbfLDCq3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 21:46:29 -0500
Received: by mail-vs1-f67.google.com with SMTP id g23so3849870vsr.7
        for <linux-usb@vger.kernel.org>; Tue, 03 Dec 2019 18:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j3wMFu3Sx6jNYWZOgVEUTy/sJPhopP8NznnJcty0XhM=;
        b=jsIH14JjlrtI8ht350vH52bflG2S2FHRZBZJI9A8D//3qk8tqfA8AIydUDsKOF3fLY
         BqAscMoNF4c68OhY3bothYOoJULvfLkhIJMK60MzloWQ7thO+bmCPczLfk9OMdSteZDo
         mIAREnmdFJnSQCi+QzR+wXYvDE2iKw80x7qgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j3wMFu3Sx6jNYWZOgVEUTy/sJPhopP8NznnJcty0XhM=;
        b=BEDN1WseIuZDGtFfmyNccEPnp1MmJdkJ1Px6nHVFQOpnSpKTgyV1rBtLwbdE+Gn4B+
         ltYd7ucM1Ta/72ssnE9XIWn7FJp6xZG5Rw953lz+dV2EPN6KLC7N2mdXrFUqcE6Lu1JG
         l/fE7DR3O0OtuDv2RWVTaXWBi524Ppn79maQ6IL3GfjZjmBEYHjN5jUhaoCZUWIzwc9j
         Gax62h7AeoE6JRYudrFNaLJ5cXcHAQvDGehkkQjHv0GCbyYCsMnjmI8iMDLjI69EpffA
         SeEPKcB5LZN737KPfr/qiE9HrCPXVmXcdBmbJvIBsCbj1TjjrPwfImujja52JuvgvqHH
         I6nA==
X-Gm-Message-State: APjAAAV5AqczjGCyO0QPAY3WZh1Wr1Kegl1EJPcnY6MzQWvwwXJX0Wgt
        96hsulFzAWefO/bTAFIAs1ISGBR5Sje63vnXCUjIYg==
X-Google-Smtp-Source: APXvYqy1k9//y3Rxh91esKEW+jVlIMAM5hP9Npol/qbhbr0gv9E8PmMzJfgwVhuMAJQkagIdwF7beSYxqBbwYgdWjHM=
X-Received: by 2002:a67:f541:: with SMTP id z1mr310501vsn.70.1575427588564;
 Tue, 03 Dec 2019 18:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20191203101521.198914-1-ikjn@chromium.org> <20191203164010.GG10631@localhost>
In-Reply-To: <20191203164010.GG10631@localhost>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Wed, 4 Dec 2019 10:46:17 +0800
Message-ID: <CAATdQgBRSJVjpCawa3eZXHLex-gWqdJrmQ6xriu11ok49UmNwg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] usb: override hub device bInterval with device
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        GregKroah-Hartman <gregkh@linuxfoundation.org>,
        RobHerring <robh+dt@kernel.org>,
        MarkRutland <mark.rutland@arm.com>,
        AlanStern <stern@rowland.harvard.edu>,
        SuwanKim <suwan.kim027@gmail.com>,
        "GustavoA . R . Silva" <gustavo@embeddedor.com>,
        linux-kernel@vger.kernel.org,
        Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 4, 2019 at 12:40 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Dec 03, 2019 at 06:15:21PM +0800, Ikjoon Jang wrote:
> > This patchset enables hard wired hub device to use different bInterval
> > from its descriptor when the hub has a combined device node.
> >
> > When we know reducing autosuspend delay for built-in HIDs is better for
> > power saving, we can reduce it to the optimal value. But if a parent hub
> > has a long bInterval, mouse lags a lot from more frequent autosuspend.
> > So this enables overriding bInterval for a hard wired hub device only
> > when we know that reduces the power consumption.
> >
> > Changes in v4
> > - use of_property_read_u32() instead of of_property_read_u8()
>
> What changed in the previous versions?

changes in the previous versions:
v4: use of_property_read_u32() instead of of_property_read_u8()
v3: errata fixed "hub, interval" --> "hub,interval"
v2: do not use unlikely() macro, commit message

>
> Johan
