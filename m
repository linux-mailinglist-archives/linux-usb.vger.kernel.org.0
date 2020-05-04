Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31721C3E36
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2020 17:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728968AbgEDPMQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 May 2020 11:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726509AbgEDPMQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 May 2020 11:12:16 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E0D3C061A0E
        for <linux-usb@vger.kernel.org>; Mon,  4 May 2020 08:12:15 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o18so3350227pgg.8
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2020 08:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zAgqElNOEB4sfvd/YNDWk1ZpRVXjlXgVkQGnwHDqFzo=;
        b=BrzKW+LorT56/tizKQS4xy20QQ69K2KOMywsICo6eW9ysCFFGA+CcQCUpQAxCSwI3H
         LYkUAhwdGBTwt2aDIeP79uqEQr8hjW5fcS1WiW+XDwFn3KDTjMQcHO0Om98bQ3w7FjH6
         WMenBg2wDt1XufrPXfBXFRF30rqzU9jewcaTLMwrT7zfHRp7tDV9GDQ9guE8TctRKjxm
         MeD1EOGecfZGJmHKaToZfmh2DN/MLkTW4SXM+Z6p4JyZzp8WZQIPBPLBT5WMA6ZK0kzq
         u812LO9eQIvLkYXUJ9M1kTN/rEbhG0CzCr19tuUC0hXdiRpvPR8reEUH3Uzh9tpTEw1P
         G1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zAgqElNOEB4sfvd/YNDWk1ZpRVXjlXgVkQGnwHDqFzo=;
        b=atCKsP63NfIBHiAqYU1UKC3z5g7/nRredPJ1+tchYCjyiW8a7TU5vxTEYvI68UyyGr
         6GchYbqPdVZkbeScg2B7KXwtihJ5CiBGp6Gh6KBJpvy3Cco4iGkS+ZHHeaewnU36RXqm
         NXbftWXe0xEAKffSxZ1LVDmV0rZOyjxETNKJAIsR6G2e3MGoKtR0twarsSVgzn/I1cT7
         WiHnjhHs91HYCMrkmSm3NWHxuSs5/njzDWhHDtmmFdddNGpqpWYveLliVzi0du3tYP5T
         afXVmbSH3lYrdcmTu+EVqMnAAqemCmkAbxE/8f2T5VDRiyw4HxwXINAZLWXP/myd28Da
         YFSw==
X-Gm-Message-State: AGi0PuZ45nKLmy81jpUfXfIA6raUiLRf65G2RpWWzHwSZ8U21oq01evV
        qylrAfJfiUCtvwoDR7xxOZtcfXZeDUn9kBJIDZMWCA==
X-Google-Smtp-Source: APiQypILbNqxA1/gCqTuBcjQLpbszXrbWvJDpF2fTWUBIdz+DGK+lV86ukLt19uR5VqhxNL8DO7BVKBqBklumJWfKDo=
X-Received: by 2002:a63:a61:: with SMTP id z33mr4289902pgk.440.1588605134613;
 Mon, 04 May 2020 08:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+zdN280v54=qbEA5ALuXuCB3u=8BO8YHN+ZMzxWBzsQYg@mail.gmail.com>
 <Pine.LNX.4.44L0.2005041018520.11213-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2005041018520.11213-100000@netrider.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 4 May 2020 17:11:52 +0200
Message-ID: <CAAeHK+y0A5U6m6XmeVZTSh-pyVJB6oe37HDDcv4S6_LfYyZS7Q@mail.gmail.com>
Subject: Re: Testing endpoint halt support for raw-gadget
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 4, 2020 at 4:24 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, 4 May 2020, Andrey Konovalov wrote:
>
> > One more question (sorry for so many :).
> >
> > Looking at other fields of usb_request struct I see frame_number.
> > AFAIU it's filled in by the UDC driver for ISO transfers. Does it make
> > sense to expose it to userspace? I don't see any composite/legacy
> > gadgets use that field at all.
>
> Do any of those gadget drivers use isochronous endpoints?

Yes, there are audio/uvc function/legacy drivers that use those.

> In fact, it also looks like none of the drivers in gadget/udc/ touch
> the frame_number field.  Maybe we should just get rid of it, since it
> isn't being used.

It is used by dwc2/3 gadget drivers (which are not in gadget/udc/).
