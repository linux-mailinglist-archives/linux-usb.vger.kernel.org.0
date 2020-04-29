Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C87EC1BDF56
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 15:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgD2Nme (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 09:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgD2Nmd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 09:42:33 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 221B7C03C1AD
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 06:42:33 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id f15so858228plr.3
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jcuMipojCGNcmWtZkpEsne85cuM9vCdsVRuhqw4qkfQ=;
        b=Vo6ujL+1K/rlmwBetJOfKkmpNJvZkAU6G4eFYQa3axLt6JNk78WtLy58SdvaQGvx3C
         GjS9SvTPA3vrZjniyMdNYVPiLxz3hinFmIBnHj0cTDjsZuUU7iqHVIWoYGlPhXPAPQWQ
         vCKXbYDB0Ce6varsLjyrvDMPfnzCzx2DxEN9gZJZ/Pdz6p4NViZbarikgYfw2wufsIL/
         l98r/vFb7xm8++l54YIam3db3LV2/TlkXJ8Sg2HndFvtpOs31/SEZ1xKxJinmgYcvQSn
         WAWO2MxOgdCVmf+WHhxILT8IgXXAEMKOtAN+613CsThM9GiJqgz+bkl+4myVYmfkckwM
         HkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jcuMipojCGNcmWtZkpEsne85cuM9vCdsVRuhqw4qkfQ=;
        b=LC+JeVU9OqjMg62kvuE2dW5Kpx82UeQOU81wNQ8fb8FAudIRP6DoZY98agPrLs9NJ8
         6dx9xIDEkZYBKpsHM1bLl11G5qxsN8JRr8RW9o8JFahf3JIZb42x8F5++nJkjaFGXjgX
         CyWMGUjn6tEOkp4gsnTd9zGj9XW5/Im1traJVlN7fgvW4sIe/l/yBzOlou8ddzWJVMPo
         L120Zdinpks6xP7W8BAlDnVbeAiX+hJaL3QqeMBYmnV1Thob1+jsv50j9yzsUGZ7rmUb
         YMd5kGTj1M38ZXaPmOgmQL/rmROss4mFYcARbbavKO1ZcwuyHQG2HgFyCByzxoQjRjsy
         srYg==
X-Gm-Message-State: AGi0Puagex9i6bFXL2fC+g0KF2QGaZQuWNi/0lDYWBMbRbz8Z1D2la2L
        Tk0RSB1LinzEPv/HdydnCwli0mMKz4xETd6YNcjbpw==
X-Google-Smtp-Source: APiQypIotw8JHRrzMYfXh2Ai/shtV6ofa1ev2DZpViQJ0YmRkKeU5mYHpb2Z1/9/H9L8FIskYiEouR8MIgOa8dShWp4=
X-Received: by 2002:a17:90b:198e:: with SMTP id mv14mr3335876pjb.69.1588167752368;
 Wed, 29 Apr 2020 06:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+zBLWKn-YQjoD6S5uwwhuB-kTmdnBD28E06ujrx8ymv7A@mail.gmail.com>
 <87ees62114.fsf@kernel.org>
In-Reply-To: <87ees62114.fsf@kernel.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 29 Apr 2020 15:42:21 +0200
Message-ID: <CAAeHK+yRMBFX4zgYLSLECdnM54GoEYcbocTDw=GrGrAD+cJ1bA@mail.gmail.com>
Subject: Re: Recommended USB3/SuperSpeed gadget device
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 29, 2020 at 9:39 AM Felipe Balbi <balbi@kernel.org> wrote:
>
>
> Hi,
>
> Andrey Konovalov <andreyknvl@google.com> writes:
> > What is the recommended driver/device to test USB3/SuperSpeed gadgets?
> > Ideally something cheap, but at the same time with good driver
> > support.
> >
> > I have a EC3380-AB board [1], which kind of works with net2280 driver,
> > but it passes almost none of the usbtest tests with g_zero (only tests
> > #1 and #9). I need something better.
>
> You have a unique chance to fix those problems :-)

It would be awesome to get that board working properly, as it's a
really compact solution that fits into an ExpressCard slot on older
laptops. My current priority is to figure out a testing setup for Raw
Gadget though.

>
> If you're not willing to do that, I anything using dwc3 (dragonboard,
> beaglebone AI, and many many others) would be good here.

All DragonBoards that I found have USB 2.0 device ports AFAIU, but
BeagleBone AI looks like what I need. Thanks!

While looking for a board with USB 3.0 device support, I've also found
the UP board [1]. I'm not sure which driver it uses though.

[1] https://up-board.org/up/specifications/
