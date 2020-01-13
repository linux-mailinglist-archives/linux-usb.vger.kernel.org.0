Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80E5A1397DA
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 18:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgAMRej (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 12:34:39 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:50763 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728641AbgAMRej (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jan 2020 12:34:39 -0500
Received: by mail-pj1-f65.google.com with SMTP id r67so4449909pjb.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2020 09:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1PJ13D+KFCkNQkN2EIudaVpEqGNZODR++Sj1BPuo/ZE=;
        b=bHUxH4h7szTdb1IgkxMSHl1LpvDPXrw+WDyMWAPf7c3MB7w02xunVZWtUZCdADY4Hj
         d4D1Pu0lWUi+wPPmAy3uzD0euIaNsbCAPIz8+Cagp4fmYrOq0UhEk87VexH5DYwPKmAw
         /Pjdwsn1VaK9QJNhO0HysvG3+1jGwUqp8hNiu+oHH+A/Yx4ohJ/GUdBmu+TzZ8LH4ggx
         tUUbFCBVCMQPhKtP2uMS/a/VSRMvzKpB7bHmBGAj1zq3ru2OFCsSfI2MhGcHDlpOeQ25
         j5RTtLChMAGY9IKx/APGv0aBRW+NqAclwtjgFbkPAyYnEmHvjmSZG2qkQsndOH+MLqeC
         XYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1PJ13D+KFCkNQkN2EIudaVpEqGNZODR++Sj1BPuo/ZE=;
        b=RLHS00wdqNSFDChYU0KO04gqr11scpUUf31z3f8R4Snfcv28Rn2nzcgdMvSan/sJAq
         YUsS2DKxqK6pOL++x9fDWuo9/gh2k+wXxknmwePjm5ZE1ZXs+pJwF/90vQKqh+feFbH1
         JjD6wK1i5V1TlYOmqldewRfskKcCdlSe7uZXvVNNunRf1jYWrroFYVG6UONDw/N4Ct/g
         FeMtFsl/bgN7uBKjJnzgTqUP4J4cANxPL2V380i/wHWu+sH89cB5OMWN8SGq14qhoHd6
         2WkX/+V79sFIu17xMoJS8DZA++cbFay96pP9g9v6jZ7Ef3o6TDuolm8achF2MyL9MTkG
         R7Nw==
X-Gm-Message-State: APjAAAWX4yh3GXUwqxH5cm+Z6SPkTtB5k03AkxwRZiNsmNlGsLkMlyjf
        fLcOODe03HxL4VblJ+Rkx4yZ0S5UW5hGKCWTPl4qvw==
X-Google-Smtp-Source: APXvYqzhSw66ss9J19Bjac2oaOFq/pDddpDORRAOnLXq4ahSX0R0wKp+qgDirMl7EaPEK0XTjarlevURK39Dyda2jqo=
X-Received: by 2002:a17:902:9889:: with SMTP id s9mr7931281plp.252.1578936878099;
 Mon, 13 Jan 2020 09:34:38 -0800 (PST)
MIME-Version: 1.0
References: <CAAeHK+z2+_UHNp4_D2iL9FzPtDoU1YBohCaDJG8sAy12uc_-ew@mail.gmail.com>
 <Pine.LNX.4.44L0.2001131049090.1502-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2001131049090.1502-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 13 Jan 2020 18:34:27 +0100
Message-ID: <CAAeHK+x9Gk3cD77MA9jkhpwO8S62i6KT7PP3NZ6QTZ2qk2FB6w@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] usb: gadget: add raw-gadget interface
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 13, 2020 at 5:50 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, 13 Jan 2020, Andrey Konovalov wrote:
>
> > I've also found an issue, but I'm not sure if that is the bug in Raw
> > Gadget, or in the gadget layer (in the former case I'll add this fix
> > to v5 as well). What I believe I'm seeing is
> > __fput()->usb_gadget_unregister_driver()->usb_gadget_remove_driver()->gadget_unbind()
> > racing with dummy_timer()->gadget_setup(). In my case it results in
> > gadget_unbind() doing set_gadget_data(gadget, NULL), and then
> > gadget_setup() dereferencing get_gadget_data(gadget).
> >
> > Alan, does it look possible for those two functions to race? Should
> > this be prevented by the gadget layer, or should I use some kind of
> > locking in my gadget driver to prevent this?
>
> In your situation this race shouldn't happen, because before
> udc->driver->unbind() is invoked we call usb_gadget_disconnect().  If
> that routine succeeds -- which it always does under dummy-hcd -- then
> there can't be any more setup callbacks, because find_endpoint() will
> always return NULL (the is_active() test fails; see the various
> set_link_state* routines).  So I don't see how you could have ended up
> with the race you describe.

I've managed to reproduce the race by adding an mdelay() into the
beginning of the setup() callback. AFAIU what happens is setup() gets
called (and waits on the mdelay()), then unbind() comes in and does
set_gadget_data(NULL), and then setup() proceeds, gets NULL through
get_gadget_data() and crashes on null-ptr-deref. I've got the same
crash a few times after many days of fuzzing, so I assume it can
happen without the mdelay() as well.

> However, a real UDC might not be able to perform a disconnect under
> software control.  In that case usb_gadget_disconnect() would not
> change the pullup state, and there would be a real possibility of a
> setup callback racing with an unbind callback.  This seems like a
> genuine problem and I can't think of a solution offhand.
>
> What we would need is a way to tell the UDC driver to stop invoking
> gadget callbacks, _before_ the UDC driver's stop callback gets called.
> Maybe this should be merged into the pullup callback somehow.
>
> Alan Stern
>
