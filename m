Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CECA1E5778
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 08:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgE1GUB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 02:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbgE1GUA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 02:20:00 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 370E0C05BD1E
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2020 23:19:59 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id nr22so14400965ejb.6
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2020 23:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=JKlHOwEgq5eJ0w9NxH5XWvwuDgHzplW8LYsyksqwZ2c=;
        b=rWHw8o9GJ0oWApntPkgSALsExnW9GF16U8uXjh/tVXu89ZjGy8/AKmFxe1C+a0VfeZ
         tBciXVDj2wKMs3FqOidwSENkg9egyjFJgxe9/Z8mrYyiWsSo9eikJoI/SRH6yO47+BKF
         TgRxsH2xQ3NplYzsY2SVZYRUAoSXbXa0mgUubHXvYQiXe7Fa9RoOFieWNddEiO5pTLNn
         fttqQhXOz4qm3yhM1gdhQ9Hzw6BnCSCrazCtlmYS7q/zCHGE/oksQboKxlVPnLikhchE
         aG0/J2OHzAUWRoCC3PmDJS448saCeYaikkL/iCpG9FWA0XY8xLvUOcx/epCQ77Wr7GJz
         7+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=JKlHOwEgq5eJ0w9NxH5XWvwuDgHzplW8LYsyksqwZ2c=;
        b=O2VpHYG4xSVzb02N0tDnXY4ouUCpQbSf5ovvhUg2v27r4uuNk/JkErBb1tKtyOSzXc
         YVv/eActT3n9enP9+tG9BQvCFo1riIKRx994HKIJbugHqgzjwPIGKoNJ++KTGjeoUjq+
         x4cf3rM5hk/h5k5mxN2jgx+NJn1Z7K3hzQpQN35ESXxA6imO++o3M0Rzw+rIWKFnyeqV
         hZ2GCOL3V0y+8VA5HwhTJ3G8trTxljsWiVkRKxQds8jbr8SPpTDlD+Ott2Yy69tL4BtC
         h1ORaskwU8m+gR52LVfyWY5/POTLsDKW9IvUZa8L7D+sDC8Mh2Ekzl1Uwl131vQfpB1o
         egFA==
X-Gm-Message-State: AOAM5324syEMlglLCmALHV7xdZIcSn7C7+geuzIZKZW4OnqkK8CDkaT0
        /0jn1MF3ZpHcNWM9bkdP4HJyCOdNgMSAqWgsslOClYd6maI=
X-Google-Smtp-Source: ABdhPJwZ0pMkw3CFxLjowbCbmTWFxGwISxUQ+m/vNd+F3W2cWJyKajdSkWgrumlHRArVyjqdvmAiZuPXqd44XYeaqgU=
X-Received: by 2002:a17:906:938a:: with SMTP id l10mr1558131ejx.186.1590646797626;
 Wed, 27 May 2020 23:19:57 -0700 (PDT)
MIME-Version: 1.0
From:   Belisko Marek <marek.belisko@gmail.com>
Date:   Thu, 28 May 2020 08:19:46 +0200
Message-ID: <CAAfyv37cFWsvoprz2jZ=jkdiTqxjPSYr_c6w5YYiaKWUe_-V1A@mail.gmail.com>
Subject: usb raw gadget impossible to sent buffer bigger than 3MB
To:     Linux USB Mailing List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

we're using USB RAW gadget for communicating with PC application. We
have created loopback test which send file (any size) from PC to
device and then same data are sent back to PC to verify roundtrip time
(using bulk data transfer). Everything works fine up to 3MB file size.
If we sent bigger file like e.g. 5M we can receive file on device but
when we want to write to output endpoint we got:

WARNING: CPU: 0 PID: 12299 at /kernel-source//mm/page_alloc.c:3725
__alloc_pages_nodemask+0x1b0/0xde4
[<c010fa08>] (unwind_backtrace) from [<c010c45c>] (show_stack+0x20/0x24)
[<c010c45c>] (show_stack) from [<c04cc0d4>] (dump_stack+0x20/0x28)
[<c04cc0d4>] (dump_stack) from [<c01324ac>] (__warn+0xec/0x108)
[<c01324ac>] (__warn) from [<c0132598>] (warn_slowpath_null+0x30/0x38)
[<c0132598>] (warn_slowpath_null) from [<c021ccb8>]
(__alloc_pages_nodemask+0x1b0/0xde4)
[<c021ccb8>] (__alloc_pages_nodemask) from [<c023b888>]
(kmalloc_order+0x2c/0x48)
[<c023b888>] (kmalloc_order) from [<c023b8d0>] (kmalloc_order_trace+0x2c/0xd4)
[<c023b8d0>] (kmalloc_order_trace) from [<c0261c24>] (__kmalloc+0x40/0x264)
[<c0261c24>] (__kmalloc) from [<bf039bc4>] (ffs_epfile_io+0x13c/0x570
[usb_f_fs])
[<bf039bc4>] (ffs_epfile_io [usb_f_fs]) from [<bf03a0c0>]
(ffs_epfile_write_iter+0xc8/0x120 [usb_f_fs])
[<bf03a0c0>] (ffs_epfile_write_iter [usb_f_fs]) from [<c02734bc>]
(new_sync_write+0xc8/0xec)
[<c02734bc>] (new_sync_write) from [<c027351c>] (__vfs_write+0x3c/0x48)
[<c027351c>] (__vfs_write) from [<c02749a0>] (vfs_write+0xcc/0x158)
[<c02749a0>] (vfs_write) from [<c02756ac>] (SyS_write+0x50/0x88)
[<c02756ac>] (SyS_write) from [<c0107a20>] (ret_fast_syscall+0x0/0x54)
---[ end trace fe5f79fe415b9881 ]---

and write ends up with: write /run/ffs/ep1: cannot allocate memory

When checked free command there should be plenty of available memory.
Is there some limitation when writing to endpoint? We tried to split
buffer to e.g. 3M and sent it and this works but looks like there is
penalty when sending bigger files (100MB file received in 5secs whicle
sending back it took 2minutes). Thanks for ideas and hints.

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
