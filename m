Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6344DD82D
	for <lists+linux-usb@lfdr.de>; Sat, 19 Oct 2019 12:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbfJSKhz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Oct 2019 06:37:55 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:41266 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbfJSKhz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 19 Oct 2019 06:37:55 -0400
Received: from [84.135.228.213] (helo=[192.168.178.51])
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <ben@besd.de>)
        id 1iLm7N-0008Mg-OQ; Sat, 19 Oct 2019 12:37:53 +0200
Subject: Re: [USB EHCI DRIVER] [Regression] EHCI no longer working in 5.4
 series kernel
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, hch@lst.de
References: <Pine.LNX.4.44L0.1910171830550.4074-100000@netrider.rowland.org>
From:   Benedikt Schemmer <ben@besd.de>
Message-ID: <4c0b469f-771b-8709-45db-0cedef78a10a@besd.de>
Date:   Sat, 19 Oct 2019 12:37:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.1910171830550.4074-100000@netrider.rowland.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Con-Id: 150997
X-Con-U: 0-ben
X-Originating-IP: 84.135.228.213
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Alan, hello Christoph,

>> I recently started compiling the 5.4. kernel starting with rc3 and noticed that both my keyboard and mouse aren't working
>> when connected to the motherboards USB ports (they work fine when connected to an xhci extension card) and they work fine
>> with the 5.3 series up to 5.3.6

finally:

249baa54790171438524ba97e8e0485dd6aa2762 is the first bad commit
commit 249baa54790171438524ba97e8e0485dd6aa2762
Author: Christoph Hellwig <hch@lst.de>
Date:   Tue Aug 6 15:01:38 2019 +0300

    dma-mapping: provide a better default ->get_required_mask

    Most dma_map_ops instances are IOMMUs that work perfectly fine in 32-bits
    of IOVA space, and the generic direct mapping code already provides its
    own routines that is intelligent based on the amount of memory actually
    present.  Wire up the dma-direct routine for the ARM direct mapping code
    as well, and otherwise default to the constant 32-bit mask.  This way
    we only need to override it for the occasional odd IOMMU that requires
    64-bit IOVA support, or IOMMU drivers that are more efficient if they
    can fall back to the direct mapping.

    Signed-off-by: Christoph Hellwig <hch@lst.de>

:040000 040000 99ba74322d98c2a8dc96fb03bf9cbb0bc20bff42 ad137a4ff5f2b810b71f12e0ad053c91e318ed25 M	arch
:040000 040000 0e0709ea4d18cefbd5dd6bddc9731aea71513e0f 46cd62afd5ffdc15187311fe33238e1ca743b9a5 M	kernel

Cheers,
Benedikt


git bisect log
git bisect start
# bad: [bc88f85c6c09306bd21917e1ae28205e9cd775a7] kthread: make __kthread_queue_delayed_work static
git bisect bad bc88f85c6c09306bd21917e1ae28205e9cd775a7
# good: [4d856f72c10ecb060868ed10ff1b1453943fc6c8] Linux 5.3
git bisect good 4d856f72c10ecb060868ed10ff1b1453943fc6c8
# good: [81160dda9a7aad13c04e78bb2cfd3c4630e3afab] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
git bisect good 81160dda9a7aad13c04e78bb2cfd3c4630e3afab
# bad: [a703d279c57e1bfe2b6536c3a17c1c498b416d24] Merge tag 'clk-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
git bisect bad a703d279c57e1bfe2b6536c3a17c1c498b416d24
# good: [29d9d76a72ce0d8485796c0f930007444684bff0] Merge tag 'drm-intel-next-2019-08-22' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
git bisect good 29d9d76a72ce0d8485796c0f930007444684bff0
# bad: [3c2edc36a77420d8be05d656019dbc8c31535992] Merge tag 'pinctrl-v5.4-1' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
git bisect bad 3c2edc36a77420d8be05d656019dbc8c31535992
# good: [7a0d796100daa8e75cda2c166c85d57775704fd4] Merge tag 'for-linus-5.4-ofs1' of git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux
git bisect good 7a0d796100daa8e75cda2c166c85d57775704fd4
# bad: [a9f8b38a071b468276a243ea3ea5a0636e848cf2] Merge tag 'for-linus-5.4-1' of git://github.com/cminyard/linux-ipmi
git bisect bad a9f8b38a071b468276a243ea3ea5a0636e848cf2
# bad: [671df189537883f36cf9c7d4f9495bfac0f86627] Merge tag 'dma-mapping-5.4' of git://git.infradead.org/users/hch/dma-mapping
git bisect bad 671df189537883f36cf9c7d4f9495bfac0f86627
# good: [c9fe5630dae1df2328d82042602e2c4d1add8d57] Merge tag 'configfs-for-5.4' of git://git.infradead.org/users/hch/configfs
git bisect good c9fe5630dae1df2328d82042602e2c4d1add8d57
# good: [7a01ee42209c00e551c7cfb581be7a207a376f00] dma-mapping: remove the dma_mmap_from_dev_coherent export
git bisect good 7a01ee42209c00e551c7cfb581be7a207a376f00
# bad: [a8e6d950cdc1012aede8a84d85f902a53d895174] xen/arm: use dev_is_dma_coherent
git bisect bad a8e6d950cdc1012aede8a84d85f902a53d895174
# bad: [512317401f6a337e617ec284d20dec5fa3a951ec] dma-mapping: always use VM_DMA_COHERENT for generic DMA remap
git bisect bad 512317401f6a337e617ec284d20dec5fa3a951ec
# good: [d9295532d5725e5926d76470acdfd239c8d2aad3] dma-mapping: remove the dma_declare_coherent_memory export
git bisect good d9295532d5725e5926d76470acdfd239c8d2aad3
# bad: [fe9041c245196c6c61091ccc2c74b73ab9a5fc50] vmalloc: lift the arm flag for coherent mappings to common code
git bisect bad fe9041c245196c6c61091ccc2c74b73ab9a5fc50
# bad: [249baa54790171438524ba97e8e0485dd6aa2762] dma-mapping: provide a better default ->get_required_mask
git bisect bad 249baa54790171438524ba97e8e0485dd6aa2762
# first bad commit: [249baa54790171438524ba97e8e0485dd6aa2762] dma-mapping: provide a better default ->get_required_mask


Am 18.10.19 um 00:31 schrieb Alan Stern:
> On Thu, 17 Oct 2019, Benedikt Schemmer wrote:
> 
>> Hi all,
>>
>> I recently started compiling the 5.4. kernel starting with rc3 and noticed that both my keyboard and mouse aren't working
>> when connected to the motherboards USB ports (they work fine when connected to an xhci extension card) and they work fine
>> with the 5.3 series up to 5.3.6
> 
> Can you use git bisect to track the problem down to a particular commit?
> 
> Alan Stern
> 
