Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D08BCDCFE4
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 22:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395356AbfJRUSz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 16:18:55 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:36568 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387517AbfJRUSz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Oct 2019 16:18:55 -0400
Received: from [84.135.228.213] (helo=[192.168.178.51])
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <ben@besd.de>)
        id 1iLYi4-0000HU-Tq; Fri, 18 Oct 2019 22:18:52 +0200
Subject: Re: [USB EHCI DRIVER] [Regression] EHCI no longer working in 5.4
 series kernel
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.1910171830550.4074-100000@netrider.rowland.org>
From:   Benedikt Schemmer <ben@besd.de>
Message-ID: <1d266aa2-990c-d304-ccb0-4d222567134a@besd.de>
Date:   Fri, 18 Oct 2019 22:18:52 +0200
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

Hi Alan,

of course I can. It just takes ages on the machine I'm using.
The problem seems to be with one of the commits in
671df1895378 ("Merge tag 'dma-mapping-5.4' of git://git.infradead.org/users/hch/dma-mapping", 2019-09-19)
right at the beginning of 5.4 before rc1

I will have the exact commit tomorrow.

Cheers,
Benedikt

Output of git bisect log as of now:
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
