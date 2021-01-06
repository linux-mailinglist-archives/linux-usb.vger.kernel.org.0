Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9667F2EC386
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jan 2021 19:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbhAFSxT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jan 2021 13:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbhAFSxS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jan 2021 13:53:18 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CEA4C06134D
        for <linux-usb@vger.kernel.org>; Wed,  6 Jan 2021 10:52:38 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id n4so3661484iow.12
        for <linux-usb@vger.kernel.org>; Wed, 06 Jan 2021 10:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ilweRid2PTP5O1MtxMZGJxR32MfRd37WEMH4upbJL8Q=;
        b=QDPvLwq9ONOMa8nzneyNS6/i8/lGKi3cYPZgjszX8j0xufcBLPdLIExrL1eadrmnBH
         rmd6rwg9oIwF0h5L1PGyHHEvipSPep1BsQQ8svvJSbr9RkpZjX9IeVAvVCyqnciWN/5U
         rTUs6nkimkJY16xvLSJ5eXdzqx0PA/Zu5h3TOmDtxXQfaxzKHrmGUHRs+t7CBA9y2jsA
         uqw1qohxwUYuogPqutB5DnlWBMZ6vLobVB1DL42m2xWyKKjWzLA30FmDSONpGWvwB+VV
         E4TPx2xNra3u30b8AY3g1Jw8T28wJnvrTKHuEr2Id5Cj1LKDetJxdsm6WXwGFSK3AhBb
         EC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ilweRid2PTP5O1MtxMZGJxR32MfRd37WEMH4upbJL8Q=;
        b=JQw81/wZDoyy65OzzlfDJ0YZk9TxcfbqbKLjddeP7g4jpMAf6T2yXaW83/O6fr3LUr
         SWThw38INb9GXpcLEF07su+B6qdu9jLaF4Nvrg1d6+DgwLPa1AHRSuk4+RIA/gGY0sao
         ZoOeuT+f5G2CKrG/jnoJTdgsLxK6DH4hMbp6qdAR8OZhi+MDg+dwPoctsn2JUwNdbwqn
         PWH89Atr24UO4GdTeL08qtDoAwqGB+IG1eh/TXlfBr1Js3PrzeL4SqvYHI5SVcdJP1on
         kfqIY4VfQ2eQpX8K0T0CYRnNEPwTtrGcKoIg9qAfGKk3gH7hXztG+gwWDOtZTbzRCaef
         4iXA==
X-Gm-Message-State: AOAM530WMTE8lasoFtm+46bnbWYkiCxalZXUh145JJAMSEW7lLL8MTPI
        2Cr9DziGr1iOxt0+xPcw28gIgA==
X-Google-Smtp-Source: ABdhPJzGpCtnVRudeyOGeZ7o9sUrVU3bhvY23g1gCKBPnoUVGxklFUPLOdK8p/wzj/uHmKy4lHfvfQ==
X-Received: by 2002:a05:6638:bc1:: with SMTP id g1mr4836935jad.27.1609959157557;
        Wed, 06 Jan 2021 10:52:37 -0800 (PST)
Received: from google.com ([2601:285:8380:9270::28bc])
        by smtp.gmail.com with ESMTPSA id d5sm2545273ilf.33.2021.01.06.10.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 10:52:36 -0800 (PST)
Date:   Wed, 6 Jan 2021 11:52:34 -0700
From:   Ross Zwisler <zwisler@google.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: xhci problem -> general protection fault
Message-ID: <CAGRrVHyJcMCAEHMzRFbaD7ibZZd1oDbYWzmz-j+=1U5esR8gOw@mail.gmail.com>
References: <20201012215348.GA3324220@google.com>
 <ad976018-31ec-3b1e-464c-363a08538ef5@linux.intel.com>
 <CAGRrVHwC=3qs00CTzPkrVPzXBnpcxfjRCKjgaYK9Hjt0GRfObg@mail.gmail.com>
 <ee24e656-f898-6b0b-ea91-9875390abb72@linux.intel.com>
 <CAGRrVHwgxtPF89niHV3N58SaDb7q5jWde_g7-yVxGPcKhemsaw@mail.gmail.com>
 <b6eba37b-c78b-fc99-5aca-f9e5856e80ac@linux.intel.com>
 <X8+22DeNDn1A7X+N@google.com>
 <068b49cd-4afa-7adb-572b-634b1728744d@linux.intel.com>
 <X9EdVbO08Y8Ohih5@google.com>
 <f75d6e13-d1f7-0282-f93d-be4693e82e29@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f75d6e13-d1f7-0282-f93d-be4693e82e29@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 30, 2020 at 5:31 AM Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
<>
> I was able to reproduce the issue with two USB devices on a different system.
>
> I saw that the new incorrect dequeue pointer sometimes had the higher 32 bits
> incorrect while the lower bits were correct.
> So this looks like a memory access order issue.
>
> The command TRB is 16 bytes. The xhci driver writes it in four 4 byte chunks.
> Even if the driver writes the chunk that sets the cycle bit last, handing the TRB
> over to the controller, it appears that the actual write order can be different.
> The controller ends up reading a command TRB with updated cycle bit but old bogus
> values in the "new dequeue pointer" field.
>
> Adding a write memory barrier before writing the cycle bit solved the issue in my case.
>
> Whole patch series is updated, added write memory barrier, and rebased on 5.10.
> It can be found force-updated in the same rewrite_halt_stop_handling branch:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git rewrite_halt_stop_handling
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=rewrite_halt_stop_handling
>
> Does this work for you?

Yes, it does!!  I verified that I'm able to reproduce the issue in less than
10 seconds with this commit which is the HEAD~1 of your series:

a7d053d207121 xhci: handle halting transfer event properly after endpoint stop and halt raced.

With this commit (the final commit in your series, adding a single patch): 

96887d191a88c xhci: make sure TRB is fully written before giving it to the controller

I ran cleanly for over 20 minutes and haven't been able to reproduce the
issue.  It looks like the wmb() added in that patch makes all the difference!

Thank you for the fix, and you can add this tag to the series:

Tested-by: Ross Zwisler <zwisler@google.com>
