Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 056851B7F0F
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 21:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgDXTgl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 15:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDXTgl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Apr 2020 15:36:41 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CE3C09B048
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 12:36:41 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id s10so4117652plr.1
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 12:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=26daL5TVU9tqYHjmN19W/C96ld/f9VAD65ReHjBtz+0=;
        b=pAqhCGvYM5n2UGZJ2xw9qHwlCmOA/Y6XTx2+ys9T3eoEmNkxO9Nbb5zWRiIXowXRpa
         8SUSwHejGEppQ6yVTzYmqlKKzf1uH9QBm79p9E0lecg/EsMfhgiCYaKtRCnVv/5OHk25
         Y46YZMDVCZuOrW1ARRk9Z9h/+r1ihCDoXtLaqnlpSSNazb23Pt2nDYSuhPYWFc48KxB6
         rqn6TotibBZvV5atx64Z2OJ/hJ8fIGkgk4hf8aRkffxDFO5I4FdgfE8VOZW/Ww3HtKRu
         YXRLf4Q68MowIm/jFbCA5pXyvjAH6wrBnq7dQJov9z9JYwAFlmIA2HdY7g1NhiBA6y5a
         0LGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=26daL5TVU9tqYHjmN19W/C96ld/f9VAD65ReHjBtz+0=;
        b=R87HU0DRrmzot1dfBXyfowfyqjaGgTgfTHHAxfdBeEcs1G5u7JOuYhLKeYKVRh5ic0
         pUuqDtJP3JxkNiRUVjp/LAIRbW6MDX5w/XhuuAf7zsF9M7usjZaPAv3s6OMlvBVCYr78
         MjLjAxhOO2w2MQGzHW4wJsXUXuHFgyy5IgWKBeFtr37rvkSXXk5AlGfrFmlNGsfgCSKk
         LswA77RmiWsKZJ/92d58MUfjtwoSqOuJXu+SbkHHWRMdMiue0w7T+h2XKdXJp9xXJ6uU
         MjAd9FvvcsBvqOr9NA4nBlPPFq/0515b4yK3bvgL8DwweqKtpgwU9rpLGTuyn41ZKkyT
         aPvQ==
X-Gm-Message-State: AGi0PuZzjRS2gkXXPCaPbubG/PUw/3crje6B3eIuVc0pxvlmDcPZVV84
        2xdN+OxczUvzqzYN+MATtPLBzIlBT1wkGXPrK5762g==
X-Google-Smtp-Source: APiQypK46KSxjdgOiR+CjOPmyqkxiNdF0/vvTHXGD13VI/OdbTrFKj9iwIuzb88kTZnJa2aLHUZ311YHQdXMOa1anOg=
X-Received: by 2002:a17:90a:26a2:: with SMTP id m31mr8013861pje.128.1587757000398;
 Fri, 24 Apr 2020 12:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+x7Fihwriocp8Kpr+AQks6h3syZa+g0Wd+Q62fg-y93Lg@mail.gmail.com>
 <Pine.LNX.4.44L0.2004092015180.30065-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2004092015180.30065-100000@netrider.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 24 Apr 2020 21:36:29 +0200
Message-ID: <CAAeHK+wYc1De7AN12mkkjDsx-PJODOAvBCOtcDSykSjq6gwCNA@mail.gmail.com>
Subject: Re: Testing endpoint halt support for raw-gadget
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 10, 2020 at 2:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, 9 Apr 2020, Andrey Konovalov wrote:
>
> > Hi Alan and Greg,
> >
> > I've been thinking about what kind of features raw-gadget might be
> > missing, that would allow more flexibility in emulating USB devices.
> > One of the things that is currently missing is halting endpoints.
> > Adding this functionality seems to be fairly easy, but it's unclear to
> > me how to test it. Any suggestions?
>
> You should use the usbtest driver along with the testusb program in
> tools/usb.  Of course, to do it you will need a userspace driver for
> raw-gadget.  usbtest works best with gadget-zero, but it can be used
> (in degraded form) with any USB device.

Hi Alan,

I've started working on a test suite for raw-gadget based on the
usbtest module as you suggested and have a few questions:

1. (Re test #10:) Currently there's no way to stall USB (control)
requests with raw-gadget (which is what happens when you return -EPIPE
from gadget's setup() callback AFAIU). Is stalling an important part
of the protocol? Should we somehow support it? AFAIU gadgetfs also has
no ability to stall requests that are passed to userspace.

2. Re test #4: the test fails with length that is not divisible by
endpoint's max packet value when using dummy_hcd (assuming that gadget
keeps queueing URBs with max packet length), as dummy_hcd's transfer()
function sets status to -EOVERFLOW when this happens. Is this
expected?

3. Re test #7: the test fails when e.g. vary parameter is set to some
odd value when using dummy_hcd. AFAIU this happens since dummy_hcd
doesn't have no_sg_constraint flag set and therefore the sanity check
in usb_submit_urb() fails. Is this expected?

Thanks!
