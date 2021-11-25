Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7014045D4D2
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 07:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347983AbhKYGeX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 01:34:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:45342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347902AbhKYGcV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 01:32:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A57260524;
        Thu, 25 Nov 2021 06:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1637821750;
        bh=1+VigkL2C+Zs+aen+tKbyBA8ztgbccWOer7lEwp1dLY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eKlOf1ZAwYCVd4OoGbI0GhQXhR5l57HO8K1L1nykb9XLXxyTMid0f1VoxZarS20/c
         KVn5MPFhPhdSnwx575q0VRsPVUAbhvxc3DVu4SgU1sbSGIdCIwt/T+2vdaYpBO0olI
         hcKtQpeldtsckR4iMVW4nCmFUXdo87nwswQJc1ao=
Date:   Thu, 25 Nov 2021 07:29:07 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jupiter <jupiter.hce@gmail.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: Kernel 5.10 USB issues
Message-ID: <YZ8tM5PSEM8WABHm@kroah.com>
References: <CAA=hcWTukyvM0Hz-VgW_NG7Whc3i7GLGySzJ0iGHvxo3O1f5vQ@mail.gmail.com>
 <YZ3j9XKE0WjfkcsI@kroah.com>
 <CAA=hcWQ+u5QcqJd-ZqZfZd93K0j0f7prxna0yhVi=AWQrxa_UA@mail.gmail.com>
 <YZ4QL5CARZAVnaEE@kroah.com>
 <CAA=hcWQ-Tr5Sn9mmpBoK0Rs0Vgk2fM3X5DaWwXT_dLJWd8ZiGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=hcWQ-Tr5Sn9mmpBoK0Rs0Vgk2fM3X5DaWwXT_dLJWd8ZiGA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 25, 2021 at 05:03:33PM +1100, Jupiter wrote:
> Hi Greg,
> 
> Thanks for your patience, here is what I did. I thought I followed the
> instructions, any useful information?
> 
> > Start working on the "master" branch and do:
> 
> $ git bisect start
> 
> $ git bisect good v4.19
> 
> $ git bisect bad v5.10
> 
> Bisecting: 91917 revisions left to test after this (roughly 17 steps)
> [386403a115f95997c2715691226e11a7b5cffcfd] Merge
> git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> 
> $ git bisect good
> Bisecting: 46699 revisions left to test after this (roughly 16 steps)
> [2e63f6ce7ed2c4ff83ba30ad9ccad422289a6c63] Merge branch
> 'uaccess.comedi' of
> git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
> 
> $ git bisect good
> Bisecting: 23349 revisions left to test after this (roughly 15 steps)
> [0f5d0a4c01cc1b7b0590baa18809a96d45a1e278] thermal: don't make
> THERMAL_NETLINK 'default y'
> 
> $ git bisect good
> Bisecting: 12085 revisions left to test after this (roughly 14 steps)
> [726eb70e0d34dc4bc4dada71f52bba8ed638431e] Merge tag
> 'char-misc-5.10-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
> 
> $ git bisect good
> Bisecting: 6064 revisions left to test after this (roughly 13 steps)
> [c8b5e2600a2cfa1cdfbecf151afd67aee227381d] io_uring: use type
> appropriate io_kiocb handler for double poll
> 
> $ git bisect good
> Bisecting: 2856 revisions left to test after this (roughly 12 steps)
> [e533cda12d8f0e7936354bafdc85c81741f805d2] Merge tag 'armsoc-dt' of
> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> 
> $ git bisect good
> Bisecting: 1423 revisions left to test after this (roughly 11 steps)
> [64b609d6a60c8a54ff9c43819803e6a7861e7ed1] Merge tag
> 'perf-urgent-2020-11-15' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> 
> $ git bisect good
> Bisecting: 724 revisions left to test after this (roughly 10 steps)
> [80e1e1761d1a9eefda4d1545f8b6c0a2e46d4e3f] Merge tag 'scsi-fixes' of
> git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
> 
> $ git bisect good
> Bisecting: 362 revisions left to test after this (roughly 9 steps)
> [d4e904198c5b46c140fdd04492df6ec31f1f03a5] Merge tag
> '5.10-rc6-smb3-fixes-part2' of git://git.samba.org/sfrench/cifs-2.6
> 
> $ git bisect good
> Bisecting: 225 revisions left to test after this (roughly 8 steps)
> [9fca90cf28920c6d0723d7efd1eae0b0fb90309c] Merge tag 'for-linus' of
> git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
> 
> $ git bisect good
> Bisecting: 115 revisions left to test after this (roughly 7 steps)
> [ba9c1201beaa86a773e83be5654602a0667e4a4d] mm/hugetlb: clear
> compound_nr before freeing gigantic pages
> 
> $ git bisect good
> Bisecting: 62 revisions left to test after this (roughly 6 steps)
> [1de5d12b769017f7354e7151ce1c26eb1d9ba2e4] Merge tag 'mmc-v5.10-rc4-2'
> of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc
> 
> $ git bisect good
> Bisecting: 27 revisions left to test after this (roughly 5 steps)
> [7b1b868e1d9156484ccce9bf11122c053de82617] Merge tag 'for-linus' of
> git://git.kernel.org/pub/scm/virt/kvm/kvm
> 
> $ git bisect good
> Bisecting: 9 revisions left to test after this (roughly 4 steps)
> [d2360a398f0b68722641c59aeb2623e79bd03e34] Merge tag
> 'block-5.10-2020-12-12' of git://git.kernel.dk/linux-block
> 
> $ git bisect good
> Bisecting: 4 revisions left to test after this (roughly 2 steps)
> [29ac40cbed2bc06fa218ca25d7f5e280d3d08a25] x86/mm/mem_encrypt: Fix
> definition of PMD_FLAGS_DEC_WP
> 
> $ git bisect good
> Bisecting: 2 revisions left to test after this (roughly 1 step)
> [190113b4c6531c8e09b31d5235f9b5175cbb0f72] x86/apic/vector: Fix
> ordering in vector assignment
> 
> $ git bisect good
> Bisecting: 0 revisions left to test after this (roughly 1 step)
> [ec6f5e0e5ca0764b4bc522c9f9d5abf876a0e3e3] Merge tag
> 'x86-urgent-2020-12-13' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> 
> $ git bisect good
> 2c85ebc57b3e1817b6ce1a6b703928e113a90442 is the first bad commit
> commit 2c85ebc57b3e1817b6ce1a6b703928e113a90442
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Dec 13 14:41:30 2020 -0800
> 
>     Linux 5.10
> 
> :100644 100644 9ec53d947628d4dd919f84f348ab8223ef69b4e3
> e30cf02da8b892f3fc95492635f426b8383e5980 M  Makefile

This looks odd.  git seems to think that the Makefile change caused the
problem.

You did build/boot these kernels properly, right?

I don't know what to suggest anymore, sorry.

greg k-h
