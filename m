Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C57F3B774
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 16:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403920AbfFJOcv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 10:32:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:34122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403915AbfFJOcv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jun 2019 10:32:51 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58B1D20862;
        Mon, 10 Jun 2019 14:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560177169;
        bh=aHxNWHdJf6peMpy8lSH5D7no8bfhXLLdokyzawcegKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wr+Lp1iAtH2gkM6AEDzJRTPm9mI/i0deFzP+Kikqbm8F0YeXNAqQx0SUCSZm9WtxS
         PSiVqdhDi03eH9E8lpLuJa5ER8xB0T0/rHYe+c8srAJTFBBr9dK0jBfoZnkWNATAGQ
         1AvjcG91MRE7U2ox1OwlmHAEXbJlM0vOP32HcsnM=
Date:   Mon, 10 Jun 2019 16:32:47 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Vladimir Yerilov <openmindead@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: kernel NULL pointer dereference, ucsi bug
Message-ID: <20190610143247.GB23343@kroah.com>
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
 <20190603131258.GA10397@kroah.com>
 <CAB31r6VK12FXoPh6eNfE1v_Tgjv917Nh7699=TZpm4SkCVMm-w@mail.gmail.com>
 <20190604054045.GD1588@kroah.com>
 <CAB31r6WAkDPKyvY31Up=OAGXvhQgS23uW5YYQs601zUaaNaELg@mail.gmail.com>
 <20190605165857.GA23286@kroah.com>
 <CAB31r6X7g_ZqfDUYBh=eFZftA7dc2GppMeWtPxMJCg-X7BGxUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB31r6X7g_ZqfDUYBh=eFZftA7dc2GppMeWtPxMJCg-X7BGxUA@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 07, 2019 at 02:58:51AM +1000, Vladimir Yerilov wrote:
> Finally I can name the first bad commit:
> 
> git bisect good
> ad74b8649beaf1a22cf8641324e3321fa0269d16 is the first bad commit
> commit ad74b8649beaf1a22cf8641324e3321fa0269d16
> Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Date:   Tue Apr 23 17:21:48 2019 +0300
> 
>    usb: typec: ucsi: Preliminary support for alternate modes
> 
>    With UCSI the alternate modes, just like everything else
>    related to USB Type-C connectors, are handled in firmware.
>    The operating system can see the status and is allowed to
>    request certain things, for example entering and exiting the
>    modes, but the support for alternate modes is very limited
>    in UCSI. The feature is also optional, which means that even
>    when the platform supports alternate modes, the operating
>    system may not be even made aware of them.
> 
>    UCSI does not support direct VDM reading or writing.
>    Instead, alternate modes can be entered and exited using a
>    single custom command which takes also an optional SVID
>    specific configuration value as parameter. That means every
>    supported alternate mode has to be handled separately in
>    UCSI driver.
> 
>    This commit does not include support for any specific
>    alternate mode. The discovered alternate modes are now
>    registered, but binding a driver to an alternate mode will
>    not be possible until support for that alternate mode is
>    added to the UCSI driver.
> 
>    Tested-by: Ajay Gupta <ajayg@nvidia.com>
>    Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> :040000 040000 f19a610d131d6d3e6397934562dd6112e78b2415
> 76df0e463eeacf57157adba0291fc9577c7d5145 M      dr
> ivers
> 
> git bisect log
> git bisect start
> # bad: [132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a] Merge tag
> 'usb-5.2-rc1' of git://git.kernel.org/pub/scm/
> linux/kernel/git/gregkh/usb
> git bisect bad 132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a
> # good: [86dc59e39031fb0d366d5b1f92db015b24bef70b] net: dsa: sja1105:
> Make 'sja1105et_regs' and 'sja1105pq
> rs_regs' static
> git bisect good 86dc59e39031fb0d366d5b1f92db015b24bef70b
> # good: [80f232121b69cc69a31ccb2b38c1665d770b0710] Merge
> git://git.kernel.org/pub/scm/linux/kernel/git/dav
> em/net-next
> git bisect good 80f232121b69cc69a31ccb2b38c1665d770b0710
> # good: [5d438e200215f61ca6a7aa69f3c4e035ac54d8ee] usb: typec: ucsi:
> ccg: add get_fw_info function
> git bisect good 5d438e200215f61ca6a7aa69f3c4e035ac54d8ee
> # bad: [6f6a407a591ebe3e4c6bd2329b29862b3980a3ca] Merge tag
> 'usb-serial-5.2-rc1' of https://git.kernel.org
> /pub/scm/linux/kernel/git/johan/usb-serial into usb-next
> git bisect bad 6f6a407a591ebe3e4c6bd2329b29862b3980a3ca
> # bad: [e823d948b7e53dc982c867ac4ce7877fc0418897] usb: musb: dsps: Use
> dev_get_drvdata()
> git bisect bad e823d948b7e53dc982c867ac4ce7877fc0418897
> # bad: [6fee3787ea7aebf25fecdce325ee9b2150c5727b] dt-bindings:
> usb-xhci: Add r8a774c0 support
> git bisect bad 6fee3787ea7aebf25fecdce325ee9b2150c5727b
> # bad: [cf28369c634fafb5f4e81750cba6988cdb4b4490] usb: typec: Add
> driver for NVIDIA Alt Modes
> git bisect bad cf28369c634fafb5f4e81750cba6988cdb4b4490
> # bad: [ad74b8649beaf1a22cf8641324e3321fa0269d16] usb: typec: ucsi:
> Preliminary support for alternate mode
> s
> git bisect bad ad74b8649beaf1a22cf8641324e3321fa0269d16
> # good: [5c9ae5a87573d38cfc4c740aafda2fa6ce06e401] usb: typec: ucsi:
> ccg: add firmware flashing support
> git bisect good 5c9ae5a87573d38cfc4c740aafda2fa6ce06e401
> # first bad commit: [ad74b8649beaf1a22cf8641324e3321fa0269d16] usb:
> typec: ucsi: Preliminary support for a
> lternate modes
> 
> Best regards,
> Vladimir


Heikki, any thoughts?

Vladimir, can you post the oops message again?  I don't see it here in
the email thread anymore.

thanks,

greg k-h
