Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA43497EB9
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jan 2022 13:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238462AbiAXMNM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 07:13:12 -0500
Received: from mga01.intel.com ([192.55.52.88]:51564 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238013AbiAXMNL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Jan 2022 07:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643026391; x=1674562391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FDLjf9AuxqRNz5YGg8+pGXTenu323pVfjKYIhm8qlXM=;
  b=glYvFI1VgFWDRpMWesQV9KQ31BX05OVeya8m3NDSQP4LrusF/w1gCS4O
   qhx4Q4Up1XmBEIMwIdxIZcbFQ0J3XKan2l1/txVE81z91tWRZmGHEkrO7
   tWQZtS9cA6/wfGMZmaclLUtm2Gj4bw+Gb290K1FaHPa4V4vFWbB1/gZ6I
   42PCGOUHlywYTUIgFlciptjGwc8BmwKy0Wht1RiOzX+pFDHWrgEISQH76
   qCwHw3To8f1IrwpLZGn0NeZSx9UIc7K1ElqcGA2w+0FYylbO7i5MEkRgG
   emZeU2vletbW4fh8gM8Ud8vi2RaBQ98JazW+vxz8nDsJmI9vCCUHWBVXP
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="270465955"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="270465955"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 04:13:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="673607729"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 24 Jan 2022 04:13:07 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 24 Jan 2022 14:13:06 +0200
Date:   Mon, 24 Jan 2022 14:13:06 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Alexandru Elisei <alexandru.elisei@arm.com>
Cc:     heiko@sntech.de, rafael.j.wysocki@intel.com,
        gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [BUG] rockpro64-v2: NULL pointer dereference when booting
Message-ID: <Ye6X0lgBBsk4Sd1X@kuha.fi.intel.com>
References: <Ye6S1PBAHtWj1lRp@monolith.localdoman>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ye6S1PBAHtWj1lRp@monolith.localdoman>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 24, 2022 at 11:51:48AM +0000, Alexandru Elisei wrote:
> Hi,
> 
> When booting a rockpro64-v2 with a kernel built from commit dd81e1c7d5fb
> ("Merge tag 'powerpc-5.17-2' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux"),
> which was the latest commit when ran the tests, I encounter a NULL pointer
> dereference:
> 
> [..]
> [    0.000000] Kernel command line: root=PARTUUID=7f4aab92-69d8-47f3-be10-624da40a71f9 rw earlycon rootwait
> [..]
> [    3.396944] hub 7-0:1.0: USB hub found
> [    3.397575] hub 7-0:1.0: 1 port detected
> [    3.406086] ohci-platform fe3e0000.usb: Generic Platform OHCI controller
> [    3.406932] ohci-platform fe3e0000.usb: new USB bus registered, assigned bus number 8
> [    3.408530] ohci-platform fe3e0000.usb: irq 38, io mem 0xfe3e0000
> [    3.476869] hub 8-0:1.0: USB hub found
> [    3.477501] hub 8-0:1.0: 1 port detected
> [    3.483278] rk808 0-001b: chip id: 0x0
> [    3.498495] random: fast init done
> [    3.509322] rk808-regulator rk808-regulator: there is no dvs0 gpio
> [    3.510143] rk808-regulator rk808-regulator: there is no dvs1 gpio
> [    3.569278] OF: graph: no port node found in /i2c@ff3d0000/typec-portc@22
> [    3.573471] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [    3.574466] Mem abort info:
> [    3.574800]   ESR = 0x96000004
> [    3.575163]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    3.575770]   SET = 0, FnV = 0
> [    3.576204]   EA = 0, S1PTW = 0
> [    3.576580]   FSC = 0x04: level 0 translation fault
> [    3.577140] Data abort info:
> [    3.577482]   ISV = 0, ISS = 0x00000004
> [    3.577927]   CM = 0, WnR = 0
> [    3.578279] [0000000000000000] user address but active_mm is swapper
> [    3.579065] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    3.579586] Modules linked in:
> [    3.579880] CPU: 5 PID: 7 Comm: kworker/u12:0 Not tainted 5.16.0-rc6-00081-g730b49aac426 #244
> [    3.580667] Hardware name: Pine64 RockPro64 v2.0 (DT)
> [    3.581135] Workqueue: events_unbound deferred_probe_work_func
> [    3.581689] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    3.582335] pc : component_master_add_with_match+0x20/0xfc
> [    3.582850] lr : typec_link_ports+0x58/0x8c
> [    3.583244] sp : ffff800013093980
> [    3.583553] x29: ffff800013093980 x28: ffff80001212b000 x27: ffff00000041d00d
> [    3.584223] x26: ffff0000063e85e0 x25: ffff800012fcb290 x24: ffff000001386820
> [    3.584891] x23: ffff000006c2e808 x22: ffff800011416670 x21: ffff000006c2e808
> [    3.585558] x20: 0000000000000000 x19: ffff000006c2e800 x18: ffffffffffffffff
> [    3.586224] x17: 000000040044ffff x16: 00400034b5503510 x15: 0000000000005ff9
> [    3.586890] x14: 0000000000000000 x13: 0000000000000003 x12: ffff0000063e8080
> [    3.587557] x11: 0000000000000005 x10: ffff800012c13a60 x9 : 0000000000000000
> [    3.588224] x8 : 0000200000000000 x7 : 0000000000000038 x6 : 000000000000004b
> [    3.588892] x5 : 0000000000000000 x4 : ffff000000711800 x3 : ffff800010cd6390
> [    3.589558] x2 : 0000000000000000 x1 : ffff800011416670 x0 : ffff000006c2e808
> [    3.590224] Call trace:
> [    3.590457]  component_master_add_with_match+0x20/0xfc
> [    3.590938]  typec_link_ports+0x58/0x8c
> [    3.591299]  typec_register_port+0x1ac/0x300
> [    3.591705]  tcpm_register_port+0x62c/0x90c
> [    3.592099]  fusb302_probe+0x260/0x430
> [    3.592453]  i2c_device_probe+0x338/0x370
> [    3.592835]  really_probe.part.0+0x9c/0x30c
> [    3.593229]  __driver_probe_device+0x98/0x144
> [    3.593639]  driver_probe_device+0xc8/0x160
> [    3.594033]  __device_attach_driver+0xb8/0x120
> [    3.594450]  bus_for_each_drv+0x78/0xd0
> [    3.594810]  __device_attach+0xd8/0x180
> [    3.595171]  device_initial_probe+0x14/0x20
> [    3.595565]  bus_probe_device+0x9c/0xa4
> [    3.595926]  deferred_probe_work_func+0x88/0xc4
> [    3.596351]  process_one_work+0x288/0x6e0
> [    3.596729]  worker_thread+0x220/0x464
> [    3.597081]  kthread+0x17c/0x190
> [    3.597392]  ret_from_fork+0x10/0x20
> [    3.597737] Code: aa0203f4 a9025bf5 aa0003f5 aa0103f6 (a9400440) 
> [    3.598301] ---[ end trace 823a8d1795013b55 ]---
> 
> The full log can be found at [1]; config file can be found at [2]. All
> pastebins expire after 6 months.
> 
> I tried bisecting the bug and the first bad commit is 730b49aac426 ("usb:
> typec: port-mapper: Convert to the component framework"). I tried to double
> check that the patch is indeed responsible by reverting it from master, but
> I got this build error:
> 
> drivers/usb/typec/port-mapper.c: In function 'typec_link_ports':
> drivers/usb/typec/port-mapper.c:256:15: error: implicit declaration of function 'usb_for_each_port'; did you mean 'usb_for_each_dev'? [-Werror=implicit-function-declaration]
>   256 |         ret = usb_for_each_port(&con->dev, each_port);
>       |               ^~~~~~~~~~~~~~~~~
>       |               usb_for_each_dev
> 
> I tried building and booting from the bad commit, and I got the same NULL
> pointer dereference error. When building from the last good commit
> (8c67d06f3fd9 ("usb: Link the ports to the connectors they are attached
> to")), the board boots just fine. The log when booting from the good commit
> can be found at [3].
> 
> I can help with debugging and testing, but I'm not familiar enough with the
> USB subsystem to fix it myself.
> 
> [1] https://pastebin.com/w4tMNhve
> [2] https://pastebin.com/SiUuLeMs
> [3] https://pastebin.com/Pcm9xmL7

There is already a fix pending:
https://lore.kernel.org/linux-usb/20220124090228.41396-3-heikki.krogerus@linux.intel.com/

thanks,

-- 
heikki
