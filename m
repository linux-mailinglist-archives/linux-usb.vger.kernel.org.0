Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDC1019F66B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2020 15:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbgDFNGZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Apr 2020 09:06:25 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45509 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728154AbgDFNGZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Apr 2020 09:06:25 -0400
Received: by mail-pg1-f193.google.com with SMTP id o26so7505106pgc.12
        for <linux-usb@vger.kernel.org>; Mon, 06 Apr 2020 06:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KhSvvNX37AqGYSPMCFmD7uV2EWGdoJwPwRTpZiE0Zyw=;
        b=k+JP4yH6IRbPHxBkpngTLsgTJw1fOQYmyottKvE5lflF+WYlq81K4ERRLbgaItyRiD
         ykLcmjEqxsxByPegR6foHwYu9c1hyo0WSmydeJmFT/nxUc5JGOO9l83rSalWmR9URGn5
         G1a5EUoJhL2Yu0YRxeP1SS8U8atn/XNBhumecDBqp7dh6sC71X1nV/8QbFDzwhHW3I2j
         kUI/MDBzut7b7Q2EMaC7sjWhQNN6t/PZK6Ewf5W1aFnZu6i4PKkXMwPwg/Gx4DqhY4yC
         Gt7M0Blhl6jqJgxbFa3wedKD8aLs0DjuCylz3wcUPIdccqUjA1TMD8GBgIMyduxNWNBn
         TcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KhSvvNX37AqGYSPMCFmD7uV2EWGdoJwPwRTpZiE0Zyw=;
        b=o6t5TpUsvfhHBGY/LXbpm330hsLkyGevujoIBPtjmvVRlKGTaFO2zHQaXzBu6BO5TB
         aa5u9sAEwT+w4QdjHHEBokOKwKJChpnBAUsokREqM4bY2yz84Luw8dyrGzMWga/CvFS1
         nONlUflYWt6wXw9+sr8UxYzzZAwPzMnptgkVL7TIpmLfN3ODvetrqZ+En5H6ljRROHXr
         eGqIyLoLXuVzSSJ0nl/NzjkTwaAqxlNUEr+iYN4CvKlVhqU4lp7NxRjOn1fnyRZIcWur
         PlWGx2leJr2GxFUMRV2cHVHSN9jErYxqYE8WVKb4ohfmvisJJE4KVNslu9X1U4524HvU
         IMPw==
X-Gm-Message-State: AGi0PuYrVS/tdK14C/kBM1xKtJGleLhX/54Sv11Mxm7EumOvHj5uNUcP
        sP0Ww1HBopzHDZHHEO0A3F5fwLrt10BaJhALDsbjevA3JEA=
X-Google-Smtp-Source: APiQypJhSBFGn9Uh4ZR+g1oETZH/lDXIBMfeUuer8tL7KV2og6DOW8W2p1cGfiHoo2/hY9b02jX57aJMt0d7/mNByvU=
X-Received: by 2002:a62:ce48:: with SMTP id y69mr21051585pfg.178.1586178384092;
 Mon, 06 Apr 2020 06:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200406105545.GA35744@mwanda>
In-Reply-To: <20200406105545.GA35744@mwanda>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 6 Apr 2020 15:06:12 +0200
Message-ID: <CAAeHK+xRnfxJwbPapPJv6LhE5xKiELEKc6ThTgSchkE+6y+wJw@mail.gmail.com>
Subject: Re: [bug report] usb: gadget: add raw-gadget interface
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 6, 2020 at 12:55 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Andrey Konovalov,
>
> The patch f2c2e717642c: "usb: gadget: add raw-gadget interface" from
> Feb 24, 2020, leads to the following static checker warning:
>
>     drivers/usb/gadget/legacy/raw_gadget.c:102 raw_event_queue_fetch() warn: inconsistent returns 'queue->sema'.
>       Locked on  : 96,102
>       Unlocked on: 93
>
> drivers/usb/gadget/legacy/raw_gadget.c
>     81  static struct usb_raw_event *raw_event_queue_fetch(
>     82                                  struct raw_event_queue *queue)
>     83  {
>     84          unsigned long flags;
>     85          struct usb_raw_event *event;
>     86
>     87          /*
>     88           * This function can be called concurrently. We first check that
>     89           * there's at least one event queued by decrementing the semaphore,
>     90           * and then take the lock to protect queue struct fields.
>     91           */
>     92          if (down_interruptible(&queue->sema))
>     93                  return NULL;
>     94          spin_lock_irqsave(&queue->lock, flags);
>     95          if (WARN_ON(!queue->size))
>     96                  return NULL;
>
> I'm going to have investigate to see why Smatch doesn't complain that
> we have disabled IRQs on this path...  Anyway, this doesn't seem like it
> can be correct.  I get that this is a WARN_ON() path, but we're leaving
> the computer in a very screwed up state we don't at least enable IRQs.

Hi Dan,

Oh, right, I'll send a patch to add spin_lock_irqsave() there.

I don't really get the warning about queue->sema though, is there
something wrong with it, or is it actually a warning about
queue->lock?

Thanks for the report!

>
>     97          event = queue->events[0];
>     98          queue->size--;
>     99          memmove(&queue->events[0], &queue->events[1],
>    100                          queue->size * sizeof(queue->events[0]));
>    101          spin_unlock_irqrestore(&queue->lock, flags);
>    102          return event;
>    103  }
