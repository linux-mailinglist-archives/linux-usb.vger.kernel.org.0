Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0BEA333BC
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2019 17:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbfFCPj0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 11:39:26 -0400
Received: from crumpet.qq2.net ([80.247.17.44]:41991 "EHLO crumpet.qq2.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726889AbfFCPjZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Jun 2019 11:39:25 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48])
        by crumpet.qq2.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <geoff@defgeoff.co.uk>)
        id 1hXp3S-0002SH-R6
        for linux-usb@vger.kernel.org ; Mon, 03 Jun 2019 16:39:23 +0100
Received: by mail-wr1-f48.google.com with SMTP id n4so7339772wrw.13
        for <linux-usb@vger.kernel.org>; Mon, 03 Jun 2019 08:39:22 -0700 (PDT)
X-Gm-Message-State: APjAAAVxLiqQM74lj4kcQTNUcjfam7VDf2549qpc9Km+PJaaTEUWuJz6
        taR8VuhBBlICUYkFJy9nPDHSLlRh6CYyB7TPJQ==
X-Google-Smtp-Source: APXvYqyoU2GhR/CkGgXF1WJc5hXQrGWRI55bcWvAkhklFALmS/pKiF6k8ZixuGOHIQvTV9rVLdm1c5kUHFkd/SUGDdo=
X-Received: by 2002:a5d:6242:: with SMTP id m2mr3326340wrv.310.1559576362570;
 Mon, 03 Jun 2019 08:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAEzk6feqwwW9=9Wun0MjqLk09m7Qiuh4D=884Z70nSOgXX7VcA@mail.gmail.com>
 <Pine.LNX.4.44L0.1906031125380.1547-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1906031125380.1547-100000@iolanthe.rowland.org>
From:   Geoff Winkless <geoff@defgeoff.co.uk>
Date:   Mon, 3 Jun 2019 16:39:11 +0100
X-Gmail-Original-Message-ID: <CAEzk6fc_ZpM9izzRH+Q3uMPzV1voC3GjmJ3GHoGsXgtpYSXfMw@mail.gmail.com>
Message-ID: <CAEzk6fc_ZpM9izzRH+Q3uMPzV1voC3GjmJ3GHoGsXgtpYSXfMw@mail.gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>, Linux-USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on crumpet.qq2.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.2
Subject: Re: ehci support on old VIA vt82xxx disappeared around kernel 3.8.
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 3 Jun 2019 at 16:29, Alan Stern <stern@rowland.harvard.edu> wrote:
> On Mon, 3 Jun 2019, Geoff Winkless wrote:
>
> > Thanks (and also to Alan) for the help, apologies for wasting your time.
>
> Just goes to show we all have our blind spots.  I didn't realize what
> was going on either, and I should have.

You're too kind :)

> On the other hand, you mentioned that it was getting some errors even
> under earlier kernels such as 3.7.10 (before ehci-pci was split off
> into a separate module, or it would have failed completely).  Any idea
> about that?

Well I was going to go after that next (test script would be a bit
more complicated), but given that those errors don't seem to be
showing up on 4.x I'll probably just drop it, unless you care.

Geoff
