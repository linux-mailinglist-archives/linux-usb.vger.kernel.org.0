Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E752ED3F0
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jan 2021 17:08:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbhAGQHt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jan 2021 11:07:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbhAGQHs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jan 2021 11:07:48 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851AEC0612F4
        for <linux-usb@vger.kernel.org>; Thu,  7 Jan 2021 08:07:08 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id w12so7166576ilm.12
        for <linux-usb@vger.kernel.org>; Thu, 07 Jan 2021 08:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3IzI8VC5SlTwuSuEK7ziAV/KFCK+RlX2Dd03bryPF+w=;
        b=njhcKWYRQhaLhVPNoAj59Ur7vfMeaA7olvF2bUe5vwGAq2m48l7GymJjoQdaX0G2y3
         eSRu0WbVLJkdJoVhhrHnuQO5MNfcKLbIviVl1bYQsXrzAR4BhQHkNZEiQkBPNMmmAfXi
         QuGOaRpoeobhURwg8WVS22OZ/DYNfNJv3qf4aVqEZuLgSSPGozm0UDaKFr06AeB7UO0s
         0V7Fnmlh4FWRIg+XS7SE7bCcmKs9V8PP0pAxqdDsUZ1QRtttm+fPvmgWyAUH9S38YXOe
         CvNGW++dCE2aGhLd2ul4t8/rw/YWhrHLXZ+VyCyOE86CbPZWeHVUwWHVRxoYXIVZc6q2
         eomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3IzI8VC5SlTwuSuEK7ziAV/KFCK+RlX2Dd03bryPF+w=;
        b=EXrEEWF6X6FzvQNNsOs0N7C1YeYHOM3hO7Ea+a5cTB8H3JXoZkOFhRZqgloUaZ83tt
         OnXmblZtDmXDeYTpF+k2uvvgJCfeRY3sEYwEBNG8hyyx32eY4CAofTirU7ICj+aoFIqZ
         iu1VaBhc0NcYu1jTJc9kOWtUA3d7iif9vjoz/zW/aw4CNj03yZqXCQTuuZGtUrW5PYmU
         1URP71HiCGJ1pEN1BtQlznTX0n9zL50hw+GlSXlOMb8rr2GKxYa8CbxKQtrF2eMVyN1a
         kjzjs0y2DMvRIe+DlliomJWmAbBJgN9Rt+dTwBTvMUNmLQAndRBcfYtvO4TCvyL1u3AC
         InLw==
X-Gm-Message-State: AOAM533uSx8F7ckzXUWSLeY3ahsjeLd8m9HYJ0BH7lcb3qgvhyhsjhLN
        aPxIyYUTrWfvmNuQT3pKw5j5PTcUvoKYea4d
X-Google-Smtp-Source: ABdhPJxkTtkjzVKqMjsJuClIk9kyJbfTS/XgB5bN1Sn9678t7ge4ZYfgJMtJkrLus7DeQMMxhYBI+g==
X-Received: by 2002:a92:6706:: with SMTP id b6mr10136537ilc.121.1610035627726;
        Thu, 07 Jan 2021 08:07:07 -0800 (PST)
Received: from google.com ([2601:285:8380:9270::28bc])
        by smtp.gmail.com with ESMTPSA id f3sm4650407ilu.74.2021.01.07.08.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 08:07:06 -0800 (PST)
Date:   Thu, 7 Jan 2021 09:07:04 -0700
From:   Ross Zwisler <zwisler@google.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: xhci problem -> general protection fault
Message-ID: <X/cxqGgHu5NraH+s@google.com>
References: <CAGRrVHwC=3qs00CTzPkrVPzXBnpcxfjRCKjgaYK9Hjt0GRfObg@mail.gmail.com>
 <ee24e656-f898-6b0b-ea91-9875390abb72@linux.intel.com>
 <CAGRrVHwgxtPF89niHV3N58SaDb7q5jWde_g7-yVxGPcKhemsaw@mail.gmail.com>
 <b6eba37b-c78b-fc99-5aca-f9e5856e80ac@linux.intel.com>
 <X8+22DeNDn1A7X+N@google.com>
 <068b49cd-4afa-7adb-572b-634b1728744d@linux.intel.com>
 <X9EdVbO08Y8Ohih5@google.com>
 <f75d6e13-d1f7-0282-f93d-be4693e82e29@linux.intel.com>
 <CAGRrVHyJcMCAEHMzRFbaD7ibZZd1oDbYWzmz-j+=1U5esR8gOw@mail.gmail.com>
 <52b0d136-3fcc-ad7f-8e53-140c077489be@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52b0d136-3fcc-ad7f-8e53-140c077489be@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 07, 2021 at 10:57:19AM +0200, Mathias Nyman wrote:
> On 6.1.2021 20.52, Ross Zwisler wrote:
> > On Wed, Dec 30, 2020 at 5:31 AM Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
> > <>
> >> I was able to reproduce the issue with two USB devices on a different system.
> >>
> >> I saw that the new incorrect dequeue pointer sometimes had the higher 32 bits
> >> incorrect while the lower bits were correct.
> >> So this looks like a memory access order issue.
> >>
> >> The command TRB is 16 bytes. The xhci driver writes it in four 4 byte chunks.
> >> Even if the driver writes the chunk that sets the cycle bit last, handing the TRB
> >> over to the controller, it appears that the actual write order can be different.
> >> The controller ends up reading a command TRB with updated cycle bit but old bogus
> >> values in the "new dequeue pointer" field.
> >>
> >> Adding a write memory barrier before writing the cycle bit solved the issue in my case.
> >>
> >> Whole patch series is updated, added write memory barrier, and rebased on 5.10.
> >> It can be found force-updated in the same rewrite_halt_stop_handling branch:
> >>
> >> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git rewrite_halt_stop_handling
> >> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=rewrite_halt_stop_handling
> >>
> >> Does this work for you?
> > 
> > Yes, it does!!  I verified that I'm able to reproduce the issue in less than
> > 10 seconds with this commit which is the HEAD~1 of your series:
> > 
> > a7d053d207121 xhci: handle halting transfer event properly after endpoint stop and halt raced.
> > 
> > With this commit (the final commit in your series, adding a single patch): 
> > 
> > 96887d191a88c xhci: make sure TRB is fully written before giving it to the controller
> > 
> > I ran cleanly for over 20 minutes and haven't been able to reproduce the
> > issue.  It looks like the wmb() added in that patch makes all the difference!
> > 
> > Thank you for the fix, and you can add this tag to the series:
> > 
> > Tested-by: Ross Zwisler <zwisler@google.com>
> > 
> 
> Great, thanks for testing.
> 
> I think it makes sense to cherry pick that one-liner wmb() patch first to 5.11 and stable,
> then add rest of the rewrite later.
> 
> -Mathias

Makes sense to me.  FWIW I've verified that v5.10 reproduces the issue easily,
and v5.10 with just the wmb() patch does not.

Thanks again for the fix!
