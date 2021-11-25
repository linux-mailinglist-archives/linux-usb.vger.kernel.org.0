Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB70745D489
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 07:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346812AbhKYGJW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 01:09:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347371AbhKYGHV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Nov 2021 01:07:21 -0500
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B09C061761
        for <linux-usb@vger.kernel.org>; Wed, 24 Nov 2021 22:04:10 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id w23so10091507uao.5
        for <linux-usb@vger.kernel.org>; Wed, 24 Nov 2021 22:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DJL+Xmr/xtvMIOg5A1gUuotHs+rRTpHtCDUBApw0ET8=;
        b=F7Ev1DwONZahXtU007KF1QgII7kS8DbU+1qZRFyUBanv6w7BkLfBYQgRuSL3TRAdhP
         MxgPXdc9cyyFo+hVZ4ybEjKRO+NzDkRo5gMa3n/U96Z65UZIbNkufMMDcmN1Jw+M9Nnk
         1COa64/5F0iJ1I/08eqQ707iik2uX6YMTM/dATFx5sCPsTzHZ5GWd+GW6mpI39l/gTdk
         hCLu+oFAecj/JOPphWYSDRUb2p+0CUj2cR+DQAsqY4CJynW0jWh0b8VL7DgrR5Cq0GRh
         I0eMRV3mOAXb5cde0XXskjX66MA8E/TiYdmh5L0y6ofcLJ980zoHskriof8uGgpFxTrw
         Nq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DJL+Xmr/xtvMIOg5A1gUuotHs+rRTpHtCDUBApw0ET8=;
        b=yX90SOVO4GoDomRCGjlZAPrOY9uLx5fpF2QrEhH7yZS3tq6r1R/oEHssejZ1FGhxgw
         o40LBa3JI2NeFBXn1tU91AgoVKGHqQwCBWk5G1gH++wKVBJ70dMWp8zKKN/rndKV5trP
         3EqgXO1dgpRbTwNo84uPdmzEfkbVzi5GPayhFgWUg6pPtVrLNYxv0kwqB+dsV2zJrqK9
         x5gskZJE9TW+lvRxxcF4b6NsS3Wd1Fd6g+HpyV7ImvVkE6uJdLlznW6uGSi8MHt3a+08
         3Wwz1/tDXIscionWUDXMaZunG0XCQXbwwNcAzEIFGqCH4C3cDxS7U8+Do125wF0Igr4H
         xq5Q==
X-Gm-Message-State: AOAM530Mbo43aBDYxHTIoNen0oRN6VQyBErGU8EuivOlF7wSYySbwyZ/
        dhfSx6ZdYlPLhHkl0yNmCgb9bYG13DsWRuNqAWiypvB5
X-Google-Smtp-Source: ABdhPJx+X1TFtXqK0m3HN82auHBu7jw0tYELtHoLOL3PJ7/knuWix8Ja1dfxaTexYqS+ghLZbLAzOw+uMybfn3BKnQg=
X-Received: by 2002:a05:6102:c10:: with SMTP id x16mr5671283vss.38.1637820250039;
 Wed, 24 Nov 2021 22:04:10 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWTukyvM0Hz-VgW_NG7Whc3i7GLGySzJ0iGHvxo3O1f5vQ@mail.gmail.com>
 <YZ3j9XKE0WjfkcsI@kroah.com> <CAA=hcWQ+u5QcqJd-ZqZfZd93K0j0f7prxna0yhVi=AWQrxa_UA@mail.gmail.com>
 <YZ4QL5CARZAVnaEE@kroah.com>
In-Reply-To: <YZ4QL5CARZAVnaEE@kroah.com>
From:   Jupiter <jupiter.hce@gmail.com>
Date:   Thu, 25 Nov 2021 17:03:33 +1100
Message-ID: <CAA=hcWQ-Tr5Sn9mmpBoK0Rs0Vgk2fM3X5DaWwXT_dLJWd8ZiGA@mail.gmail.com>
Subject: Re: Kernel 5.10 USB issues
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Thanks for your patience, here is what I did. I thought I followed the
instructions, any useful information?

> Start working on the "master" branch and do:

$ git bisect start

$ git bisect good v4.19

$ git bisect bad v5.10

Bisecting: 91917 revisions left to test after this (roughly 17 steps)
[386403a115f95997c2715691226e11a7b5cffcfd] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next

$ git bisect good
Bisecting: 46699 revisions left to test after this (roughly 16 steps)
[2e63f6ce7ed2c4ff83ba30ad9ccad422289a6c63] Merge branch
'uaccess.comedi' of
git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs

$ git bisect good
Bisecting: 23349 revisions left to test after this (roughly 15 steps)
[0f5d0a4c01cc1b7b0590baa18809a96d45a1e278] thermal: don't make
THERMAL_NETLINK 'default y'

$ git bisect good
Bisecting: 12085 revisions left to test after this (roughly 14 steps)
[726eb70e0d34dc4bc4dada71f52bba8ed638431e] Merge tag
'char-misc-5.10-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc

$ git bisect good
Bisecting: 6064 revisions left to test after this (roughly 13 steps)
[c8b5e2600a2cfa1cdfbecf151afd67aee227381d] io_uring: use type
appropriate io_kiocb handler for double poll

$ git bisect good
Bisecting: 2856 revisions left to test after this (roughly 12 steps)
[e533cda12d8f0e7936354bafdc85c81741f805d2] Merge tag 'armsoc-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc

$ git bisect good
Bisecting: 1423 revisions left to test after this (roughly 11 steps)
[64b609d6a60c8a54ff9c43819803e6a7861e7ed1] Merge tag
'perf-urgent-2020-11-15' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip

$ git bisect good
Bisecting: 724 revisions left to test after this (roughly 10 steps)
[80e1e1761d1a9eefda4d1545f8b6c0a2e46d4e3f] Merge tag 'scsi-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi

$ git bisect good
Bisecting: 362 revisions left to test after this (roughly 9 steps)
[d4e904198c5b46c140fdd04492df6ec31f1f03a5] Merge tag
'5.10-rc6-smb3-fixes-part2' of git://git.samba.org/sfrench/cifs-2.6

$ git bisect good
Bisecting: 225 revisions left to test after this (roughly 8 steps)
[9fca90cf28920c6d0723d7efd1eae0b0fb90309c] Merge tag 'for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma

$ git bisect good
Bisecting: 115 revisions left to test after this (roughly 7 steps)
[ba9c1201beaa86a773e83be5654602a0667e4a4d] mm/hugetlb: clear
compound_nr before freeing gigantic pages

$ git bisect good
Bisecting: 62 revisions left to test after this (roughly 6 steps)
[1de5d12b769017f7354e7151ce1c26eb1d9ba2e4] Merge tag 'mmc-v5.10-rc4-2'
of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc

$ git bisect good
Bisecting: 27 revisions left to test after this (roughly 5 steps)
[7b1b868e1d9156484ccce9bf11122c053de82617] Merge tag 'for-linus' of
git://git.kernel.org/pub/scm/virt/kvm/kvm

$ git bisect good
Bisecting: 9 revisions left to test after this (roughly 4 steps)
[d2360a398f0b68722641c59aeb2623e79bd03e34] Merge tag
'block-5.10-2020-12-12' of git://git.kernel.dk/linux-block

$ git bisect good
Bisecting: 4 revisions left to test after this (roughly 2 steps)
[29ac40cbed2bc06fa218ca25d7f5e280d3d08a25] x86/mm/mem_encrypt: Fix
definition of PMD_FLAGS_DEC_WP

$ git bisect good
Bisecting: 2 revisions left to test after this (roughly 1 step)
[190113b4c6531c8e09b31d5235f9b5175cbb0f72] x86/apic/vector: Fix
ordering in vector assignment

$ git bisect good
Bisecting: 0 revisions left to test after this (roughly 1 step)
[ec6f5e0e5ca0764b4bc522c9f9d5abf876a0e3e3] Merge tag
'x86-urgent-2020-12-13' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip

$ git bisect good
2c85ebc57b3e1817b6ce1a6b703928e113a90442 is the first bad commit
commit 2c85ebc57b3e1817b6ce1a6b703928e113a90442
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Dec 13 14:41:30 2020 -0800

    Linux 5.10

:100644 100644 9ec53d947628d4dd919f84f348ab8223ef69b4e3
e30cf02da8b892f3fc95492635f426b8383e5980 M  Makefile

$ git bisect bad
ec6f5e0e5ca0764b4bc522c9f9d5abf876a0e3e3 was both good and bad
