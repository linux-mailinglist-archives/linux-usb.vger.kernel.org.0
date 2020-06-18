Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C791FEDEE
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jun 2020 10:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgFRIkF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 04:40:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:55978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728504AbgFRIkE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Jun 2020 04:40:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0AE3214DB;
        Thu, 18 Jun 2020 08:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592469603;
        bh=QYxFeKxjXrANBe9I55CTo6lMg/Ov9kmOKWOYVnI2XfM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r25RB/OLte1PzD4ORY52u+zRgMa2WS0o2+lxmIk43m3NxtralFnshQObUwdis+jez
         L9T4R/ByA7z278V6tVF86CiMZWcWOe9lYDwVLD9GtWON6jsEFMpwLgK5KZjk/vLbot
         a9g5ApNMqA1J7PkYIAXJvhNh5NlmFLF4XSamalAA=
Date:   Thu, 18 Jun 2020 10:39:56 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     syzkaller <syzkaller@googlegroups.com>,
        USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Kostya Serebryany <kcc@google.com>
Subject: Re: syzbot USB fuzzing update
Message-ID: <20200618083956.GB1073084@kroah.com>
References: <CAAeHK+z3tVrvWLa591rDZpbUFR0e_CicDmcgccco+KWyH9Yy1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+z3tVrvWLa591rDZpbUFR0e_CicDmcgccco+KWyH9Yy1g@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 16, 2020 at 04:28:22PM +0200, Andrey Konovalov wrote:
> Hi,
> 
> As of now all kernel changes required for USB fuzzing have been merged
> into the mainline (the last one during the 5.8-rc1 merge window)
> (woohoo! thanks for everyone's help :), so the USB fuzzing instance
> [1] has been switched to target the Greg's usb-testing tree. As a
> result, testing kernel patches on the USB fuzzing instance now follows
> the same principle as on the mainline instances, with a few caveats
> [2]:
> 
> 1. You may specify any kernel tree for `syz test` as long as it
> includes all mainline patches up to 5.8-rc1 (technically all dummy-hcd
> and raw-gadget patches up to 5.8-rc1). (Specifying commit ids from the
> usb-fuzzer branch still works too, for now.)
> 
> 2. Some of the bugs have reproducers generated on kernel versions with
> an old custom kernel (when fuzzing was performed with in-development
> kernel patches), and therefore those reproducers might not work with
> the mainline kernel. The recommended workflow is to: first, execute a
> `syz test` command on a target tree to make sure that the bug
> reproduces, and then execute a `syz test` command with a fix/debug
> patch.
> 
> On top of that, the USB fuzzing instance now has bisection enabled,
> but it will only work for newly introduced bugs (as the old ones will
> just bisect to raw-gadget patches).
> 
> In time, as we get fresh bugs and reproducers, these issues should go away.
> 
> At this point I think we can consider USB fuzzing support for
> syzkaller completed. There are always some things to be improved of
> course [3], but all the major parts are now in place.

Very nice work, thanks for doing this!

greg k-h
