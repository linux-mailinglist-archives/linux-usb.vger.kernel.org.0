Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E3C38E64
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 17:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729088AbfFGPFx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 11:05:53 -0400
Received: from mail-pg1-f172.google.com ([209.85.215.172]:42062 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbfFGPFx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jun 2019 11:05:53 -0400
Received: by mail-pg1-f172.google.com with SMTP id e6so1312491pgd.9
        for <linux-usb@vger.kernel.org>; Fri, 07 Jun 2019 08:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cREA8xeqB60H4A4boaKI+1i6Wyt0mTSiiLVHUjDfR1Q=;
        b=ZjqIbUbS4jPzlVcBvEqj5fH5Hdsqu1x82KCgQAY4oXKhnfPXv/vdOvh51NZWW0p/tx
         J0j2qLwRF+YXV2c3+Z/jHThHzAICIAUlR+8CtLm8t4my/kq3FVCG2h7dkpR1Mv1V12KG
         rV4bFa/VRDa+bRq5/3c/suWO/6eCOtL4P42zdsM+mFxgTT/Cp3LzAvw68SHJs5NShxQv
         RXublJISuQAj4JtrmKdXyGf15dT6cbcWurO+UOnrWe+cjZTVqO30gYxiuftDLKqPv+Sv
         tNtVEfssrUKp9UcVc12xAASqmerXifmv7ou0eOmZJmdqM0H/3AKXgJU3zB6hr2zpA6CH
         JnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cREA8xeqB60H4A4boaKI+1i6Wyt0mTSiiLVHUjDfR1Q=;
        b=KxMNnlcnNBNJa+sCoTQKqyb8kWmZE47KcfqUzlinAw4+n98aC379LvApliIyrw4C84
         qS6TLtq0R7Gy1GyAx1ZY6kxxBBNoR7SklPItrBq7n8/YZF3KNQV4/sU1VTD9yYtjtslb
         PzkGabvBly+dK6ZsFHCe51m/sWYhqCdYLKm3gz5k3GwcH/8AYrurxHPXVkDZWO/x42Hn
         0HLcvAvEqs3BM9P1dTRAVajhzkLERecoygdslD+xmR4EmU6BYkYdxHxkIjOLiVgquYN1
         131D8ZsX4MgJIIx6ADGN9/KwtJ9vCmKqkLjo+UJpE2rzJTxbk61MOYFoj4ymqa0Sq9Oh
         F3xA==
X-Gm-Message-State: APjAAAWXRxEezfLJPhWgLlm430At+A4bbqEuUt9FwjPtt9GposrF3GgD
        u7hA+6BmdVhy9CuuBYj7h3lN7g3XRdgRCo14ldiF1A==
X-Google-Smtp-Source: APXvYqy0Bsus1UINDTSmwYaKmk7yQt+YsIW7c2UOoW3+UpS/AdczylhSxyIYjW/5cbyrYqg3DeIfTpMb1+rjChvC8ik=
X-Received: by 2002:a17:90a:6505:: with SMTP id i5mr5889234pjj.47.1559919951862;
 Fri, 07 Jun 2019 08:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+xxn1dSJBwBv7g=Mp3e9XARmJwb9JgjLjbDLx0rE+9tew@mail.gmail.com>
 <Pine.LNX.4.44L0.1906071056380.1612-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1906071056380.1612-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 7 Jun 2019 17:05:40 +0200
Message-ID: <CAAeHK+yoEVJDQJCp0gXjX2t+QT_c-CqR+NnhtTTYOg6aj=MhQA@mail.gmail.com>
Subject: Re: Pass transfer_buffer to gadget drivers
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 7, 2019 at 5:02 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 7 Jun 2019, Andrey Konovalov wrote:
>
> > > > The problem is that I want to receive that data (from the data stage)
> > > > from within my gadget driver module. But it's not passed to the
> > > > setup() callback. And the question is: how do I do that then?
> > >
> > > I just caught up on this thread...
> > >
> > > The answer is simple: The gadget driver's setup() callback routine
> > > submits a request for endpoint 0.  The Data Stage data is sent or
> > > received (depending on the direction encoded in the Setup information)
> > > by this request.
> >
> > Ah, OK, got it, thanks!
> >
> > Although while looking at the dummy_hcd implementation, I saw that it
> > accesses usb->transfer_buffer in case USB_REQ_GET_STATUS in
> > handle_control_request(), which is called right before the setup()
> > callback is called. So the data already available there without any
> > additional requests. Is this an implementation detail that is specific
> > to dummy_hcd?
>
> Yes, it is.  dummy-hcd is unusual in that it combines both a USB host
> controller and a USB device controller in a single driver.
>
> Normal UDC drivers do handle USB_REQ_GET_STATUS on their own without
> requiring the use of an explicit usb_request, because they handle the
> entire transfer internally and don't involve the gadget driver.
> However, they don't have access to any transfer_buffer; all they can do
> is exchange packets with the host.

OK, I see. Thanks a lot!

>
> Alan Stern
>
