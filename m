Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6389B4CDBAF
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 19:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241015AbiCDSCk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 13:02:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241460AbiCDSCc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 13:02:32 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F111C57FA
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 10:01:42 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id yy13so10219771ejb.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Mar 2022 10:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U3rDXhNwmhKvU0fTmdcRMmDJs0CvJk/orYJul4VmUTQ=;
        b=HVyDLO+r9mNzQiZ6wqPVIVbdDrEW8XYhS/ril5ZQuwNpGqOJVvY866ZM0ayLyHEDmj
         j+3R5QVM1IWeVJKlyxBTJwbxmmPM9yRbyRCM4EfQul8OjSAhe8qiFWY67LPwFcFqBxke
         5mj8pH4sAZH3o2UCn/1NTDZplRN60/ZFWwoGlGSSZNwgpQbokBDNcnjMuJhCQX18L/XV
         2lvG8ifbji6A/Xz6G+80UdVBMdocnj0lxyYspJEs9uwGQOxlPf6u39Ulm/VBsB4/D2q7
         G2nZmAoLn761sjbZyt9MJRAe72hF2HiXcpIQFwwkE3BGTUKJ4D+DGwB8Rty1oOXwu5yr
         q3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U3rDXhNwmhKvU0fTmdcRMmDJs0CvJk/orYJul4VmUTQ=;
        b=0QS8gxDl3YqawNQWSnn1k45Znu8fvfEK+4rtT23yV4kxwOPd3KecaUUY42WLdGJtHY
         W2ktvXyNBP4m2YbfUMsqoy9BNAbAFov3VrFHXj2grEChSjo76kdA2W54AQ0k8IuN5Xag
         SsQsA8Blwb848m75w7V10ENCZ7c+9x3aIbiCrT933EFqy5hlS/O059Gt1gwwSxKtLsqX
         AOpCO31bCy8qwDF0VF3+3EWzYCEfNZMMtuEtG9rZ87PeunY4pg2b/OnjmXJHYE1GRKJl
         X0ZKpPihBSSJhjdKUofXPT6Wllsr04pQ+qbnDTfDyzLSt/6rbYTAHRj+Un3x68M75H8F
         tswg==
X-Gm-Message-State: AOAM531KfK0AAc131r0cC8b42NamT36ObvK3Z4xDOgq5i7Uzh33h89zt
        uEwdeUwYEGMCGaan5xSF1FQau6BAqMeqeqLX0Ek=
X-Google-Smtp-Source: ABdhPJwhllR6W7FPA5XiHx9F+oBoHpWCt/9UpsRfv3TUB5qAqypSLJIWXF6P5ZrZGtt1lzBPZ0Xm6J8Vk1/Yst+FvIA=
X-Received: by 2002:a17:906:32d0:b0:6ce:e1cf:3f2e with SMTP id
 k16-20020a17090632d000b006cee1cf3f2emr31256657ejk.214.1646416900288; Fri, 04
 Mar 2022 10:01:40 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5AJ3j0-LUHX9MNdHQotrG+chPhQgB15xiHTm9r9wuvdLw@mail.gmail.com>
 <CAOMZO5A4zQM1dLhL7+Qa2GEW52eb2PbGjBXRKZfvA279k6Pemg@mail.gmail.com>
 <YiIeEHMc+tWE0coi@lunn.ch> <CAOMZO5CioYoddT0kqtf+wOTvvxArm9ipW2bAj84qKM_eQgMcjg@mail.gmail.com>
 <YiIndfh0B87LRYnI@lunn.ch> <CAOMZO5BOREQcH9e5oL=QQsH2VsijQTPPA=pEX0KCjjnveaVppg@mail.gmail.com>
In-Reply-To: <CAOMZO5BOREQcH9e5oL=QQsH2VsijQTPPA=pEX0KCjjnveaVppg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 4 Mar 2022 15:01:28 -0300
Message-ID: <CAOMZO5D_875KnWVK+P+-D8zOQyCTzwKDfoXbZWfi01fSKRSSew@mail.gmail.com>
Subject: Re: smsc9511: Register access happens after unregistration
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Schrempf Frieder <frieder.schrempf@kontron.de>,
        Martyn Welch <martyn.welch@collabora.com>,
        Marek Vasut <marex@denx.de>,
        USB list <linux-usb@vger.kernel.org>, oneukum@suse.com,
        Adam Ford <aford173@gmail.com>, peter.chen@kernel.org,
        Steve Glendinning <steve.glendinning@shawell.net>,
        fntoth@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 4, 2022 at 12:57 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Fri, Mar 4, 2022 at 11:51 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > But why does it return ENODEV? It seems to me, ignoring it is papering
> > over the cracks. Why cannot we access to the PHY?
>
> The -ENODEV is returned by usb_control_msg():
>
> __smsc95xx_read_reg: -19
>          usbnet_read_cmd: -19
>               usb_control_msg: -19

I added a WARN_ON() inside usb_control_msg() that triggers when
usb_control_msg() returns -ENODEV.

Here are the results on two unbind commands:

root@iotgate:~# echo -n "2-1" > /sys/bus/usb/drivers/usb/unbind
[   19.989294] usb 2-1.1: USB disconnect, device number 3
[   19.994484] ********** returning -ENODEV from usb_control_msg
[   20.000555] ------------[ cut here ]------------
[   20.005172] WARNING: CPU: 0 PID: 7 at
drivers/usb/core/message.c:163 usb_control_msg+0x178/0x180
[   20.013970] Modules linked in:
[   20.017028] CPU: 0 PID: 7 Comm: kworker/u8:0 Not tainted
5.17.0-rc6-dirty #581
[   20.024254] Hardware name: CompuLab i.MX8MM IoT Gateway (DT)
[   20.029913] Workqueue: events_power_efficient phy_state_machine
[   20.035842] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   20.042807] pc : usb_control_msg+0x178/0x180
[   20.047080] lr : usb_control_msg+0x178/0x180
[   20.051357] sp : ffff80000965bb10
[   20.054670] x29: ffff80000965bb10 x28: 0000000000000040 x27: 00000000000000a0
[   20.061811] x26: 0000000000000000 x25: 0000000000000114 x24: 0000000000000004
[   20.068955] x23: 0000000080000300 x22: ffff000006812000 x21: ffff000000095400
[   20.076098] x20: 00000000ffffffed x19: ffff00000f26ea80 x18: 0000000000000010
[   20.083242] x17: ffff8000768f5000 x16: ffff800008004000 x15: 000011acfbd3184b
[   20.090385] x14: 0000000000000159 x13: 0000000000000001 x12: 0000000000000000
[   20.097527] x11: 0000000000000000 x10: 00000000000009a0 x9 : ffff80000965b8b0
[   20.104671] x8 : ffff000000095e00 x7 : ffff00007fb70b40 x6 : 0000000000000107
[   20.111814] x5 : ffff00007fb6a998 x4 : 0000000000000000 x3 : 0000000000000027
[   20.118957] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000031
[   20.126104] Call trace:
[   20.128549]  usb_control_msg+0x178/0x180
[   20.132479]  __usbnet_write_cmd.isra.0+0x8c/0xd8
[   20.137098]  usbnet_write_cmd+0x64/0xa0
[   20.140936]  __smsc95xx_write_reg+0x6c/0xc8
[   20.145125]  __smsc95xx_mdio_read+0x78/0x160
[   20.149400]  smsc95xx_mdiobus_read+0x18/0x28
[   20.153674]  mdiobus_read+0x40/0x80
[   20.157167]  lan87xx_read_status+0xe4/0x158
[   20.161355]  phy_check_link_status+0x48/0xc0
[   20.165628]  phy_state_machine+0x1a8/0x228
[   20.169729]  process_one_work+0x1c0/0x338
[   20.173742]  worker_thread+0x50/0x420
[   20.177407]  kthread+0x110/0x120
[   20.180641]  ret_from_fork+0x10/0x20
[   20.184221] ---[ end trace 0000000000000000 ]---
[   20.188952] smsc95xx 2-1.1:1.0 eth1: unregister 'smsc95xx'
usb-ci_hdrc.1-1.1, smsc95xx USB 2.0 Ethernet
[   20.246723] smsc95xx 2-1.1:1.0 eth1: Failed to write reg index
0x00000114: -19
[   20.253972] smsc95xx 2-1.1:1.0 eth1: Error writing MII_ADDR
[   20.259678] ********** returning -ENODEV from usb_control_msg
[   20.265480] ------------[ cut here ]------------
[   20.270099] WARNING: CPU: 0 PID: 257 at
drivers/usb/core/message.c:163 usb_control_msg+0x178/0x180
[   20.279075] Modules linked in:
[   20.282135] CPU: 0 PID: 257 Comm: sh Tainted: G        W
5.17.0-rc6-dirty #581
[   20.290055] Hardware name: CompuLab i.MX8MM IoT Gateway (DT)
[   20.295715] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   20.302681] pc : usb_control_msg+0x178/0x180
[   20.306956] lr : usb_control_msg+0x178/0x180
[   20.311234] sp : ffff800009c3b310
[   20.314546] x29: ffff800009c3b310 x28: 00000000000000c0 x27: 00000000000000a1
[   20.321692] x26: 0000000000000000 x25: 0000000000000114 x24: 0000000000000004
[   20.328837] x23: 0000000080000380 x22: ffff000006812000 x21: ffff00000d950e00
[   20.335982] x20: 00000000ffffffed x19: ffff00000f26ea00 x18: 0000000000000010
[   20.343125] x17: 0000000000000000 x16: 0000000000000000 x15: ffff00000d951280
[   20.350270] x14: 0000000000000169 x13: ffff00000d951280 x12: 00000000ffffffea
[   20.357417] x11: ffff8000094a1b28 x10: ffff800009489ae8 x9 : ffff800009489b40
[   20.364559] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000000001
[   20.371703] x5 : 0000000000000000 x4 : ffff00007fb6a998 x3 : ffff00007fb6da08
[   20.378848] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000031
[   20.385995] Call trace:
[   20.388441]  usb_control_msg+0x178/0x180
[   20.392371]  __usbnet_read_cmd.isra.0+0x8c/0x130
[   20.396993]  usbnet_read_cmd+0x64/0xa0
[   20.400744]  __smsc95xx_read_reg+0x6c/0xd8
[   20.404845]  __smsc95xx_phy_wait_not_busy+0x60/0xc8
[   20.409729]  __smsc95xx_mdio_read+0x54/0x160
[   20.414007]  smsc95xx_mdiobus_read+0x18/0x28
[   20.418282]  __mdiobus_modify_changed+0x44/0xe0
[   20.422817]  phy_modify+0x48/0x78
[   20.426140]  genphy_suspend+0x1c/0x28
[   20.429804]  phy_suspend+0xa8/0xe8
[   20.433210]  phy_state_machine+0x19c/0x228
[   20.437310]  phy_stop+0x5c/0x198
[   20.440542]  phy_disconnect+0x58/0x60
[   20.444207]  smsc95xx_unbind+0x20/0x48
[   20.447958]  usbnet_disconnect+0x40/0xc8
[   20.451887]  usb_unbind_interface+0x74/0x248
[   20.456161]  device_release_driver_internal+0x1fc/0x200
[   20.461395]  device_release_driver+0x18/0x28
[   20.465669]  bus_remove_device+0x128/0x138
[   20.469768]  device_del+0x16c/0x3a8
[   20.473261]  usb_disable_device+0x8c/0x158
[   20.477363]  usb_disconnect+0xb8/0x2a0
[   20.481116]  hub_quiesce+0x78/0xd0
[   20.484523]  hub_disconnect+0x50/0x190
[   20.488276]  usb_unbind_interface+0x74/0x248
[   20.492551]  device_release_driver_internal+0x1fc/0x200
[   20.497781]  device_release_driver+0x18/0x28
[   20.502055]  bus_remove_device+0x128/0x138
[   20.506157]  device_del+0x16c/0x3a8
[   20.509646]  usb_disable_device+0x8c/0x158
[   20.513750]  usb_set_configuration+0x538/0x898
[   20.518202]  usb_generic_driver_disconnect+0x2c/0x40
[   20.523176]  usb_unbind_device+0x30/0x98
[   20.527100]  device_release_driver_internal+0x1fc/0x200
[   20.532333]  device_driver_detach+0x18/0x28
[   20.536524]  unbind_store+0xe0/0x108
[   20.540101]  drv_attr_store+0x24/0x38
[   20.543769]  sysfs_kf_write+0x44/0x58
[   20.547434]  kernfs_fop_write_iter+0x118/0x1a8
[   20.551881]  new_sync_write+0xe8/0x190
[   20.555638]  vfs_write+0x234/0x378
[   20.559048]  ksys_write+0x6c/0x100
[   20.562457]  __arm64_sys_write+0x1c/0x28
[   20.566388]  invoke_syscall+0x44/0x108
[   20.570140]  el0_svc_common.constprop.0+0xcc/0xf0
[   20.574848]  do_el0_svc+0x24/0x88
[   20.578165]  el0_svc+0x20/0x60
[   20.581228]  el0t_64_sync_handler+0xb0/0xb8
[   20.585415]  el0t_64_sync+0x1a0/0x1a4
[   20.589083] ---[ end trace 0000000000000000 ]---
[   20.594738] smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
[   20.601903] smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
[   20.607687] smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
[   20.618737] ********** returning -ENODEV from usb_control_msg
[   20.624562] ------------[ cut here ]------------
[   20.629180] WARNING: CPU: 3 PID: 257 at
drivers/usb/core/message.c:163 usb_control_msg+0x178/0x180
[   20.638154] Modules linked in:
[   20.641213] CPU: 3 PID: 257 Comm: sh Tainted: G        W
5.17.0-rc6-dirty #581
[   20.649133] Hardware name: CompuLab i.MX8MM IoT Gateway (DT)
[   20.654794] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   20.661759] pc : usb_control_msg+0x178/0x180
[   20.666032] lr : usb_control_msg+0x178/0x180
[   20.670311] sp : ffff800009c3b370
[   20.673623] x29: ffff800009c3b370 x28: 00000000000000c0 x27: 00000000000000a1
[   20.680766] x26: 0000000000000000 x25: 0000000000000114 x24: 0000000000000004
[   20.687911] x23: 0000000080000380 x22: ffff000006812000 x21: ffff00000d950e00
[   20.695058] x20: 00000000ffffffed x19: ffff00000f0c6780 x18: 0000000000000010
[   20.702199] x17: ffff80007692e000 x16: ffff8000095e4000 x15: ffff00000d951280
[   20.709345] x14: 00000000000001b4 x13: ffff00000d951280 x12: 00000000ffffffea
[   20.716490] x11: ffff8000094a1b28 x10: ffff800009489ae8 x9 : ffff800009489b40
[   20.723634] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000000001
[   20.730778] x5 : 0000000000000000 x4 : ffff00007fba3998 x3 : ffff00007fba6a08
[   20.737921] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000031
[   20.745068] Call trace:
[   20.747514]  usb_control_msg+0x178/0x180
[   20.751445]  __usbnet_read_cmd.isra.0+0x8c/0x130
[   20.756064]  usbnet_read_cmd+0x64/0xa0
[   20.759816]  __smsc95xx_read_reg+0x6c/0xd8
[   20.763920]  __smsc95xx_phy_wait_not_busy+0x60/0xc8
[   20.768803]  __smsc95xx_mdio_read+0x54/0x160
[   20.773079]  smsc95xx_mdiobus_read+0x18/0x28
[   20.777356]  __mdiobus_modify_changed+0x44/0xe0
[   20.781891]  phy_modify+0x48/0x78
[   20.785210]  genphy_suspend+0x1c/0x28
[   20.788878]  phy_suspend+0xa8/0xe8
[   20.792280]  phy_detach+0x30/0x110
[   20.795686]  phy_disconnect+0x44/0x60
[   20.799349]  smsc95xx_unbind+0x20/0x48
[   20.803102]  usbnet_disconnect+0x40/0xc8
[   20.807030]  usb_unbind_interface+0x74/0x248
[   20.811305]  device_release_driver_internal+0x1fc/0x200
[   20.816535]  device_release_driver+0x18/0x28
[   20.820811]  bus_remove_device+0x128/0x138
[   20.824909]  device_del+0x16c/0x3a8
[   20.828400]  usb_disable_device+0x8c/0x158
[   20.832504]  usb_disconnect+0xb8/0x2a0
[   20.836256]  hub_quiesce+0x78/0xd0
[   20.839663]  hub_disconnect+0x50/0x190
[   20.843416]  usb_unbind_interface+0x74/0x248
[   20.847689]  device_release_driver_internal+0x1fc/0x200
[   20.852921]  device_release_driver+0x18/0x28
[   20.857195]  bus_remove_device+0x128/0x138
[   20.861297]  device_del+0x16c/0x3a8
[   20.864786]  usb_disable_device+0x8c/0x158
[   20.868888]  usb_set_configuration+0x538/0x898
[   20.873340]  usb_generic_driver_disconnect+0x2c/0x40
[   20.878312]  usb_unbind_device+0x30/0x98
[   20.882236]  device_release_driver_internal+0x1fc/0x200
[   20.887469]  device_driver_detach+0x18/0x28
[   20.891658]  unbind_store+0xe0/0x108
[   20.895235]  drv_attr_store+0x24/0x38
[   20.898903]  sysfs_kf_write+0x44/0x58
[   20.902568]  kernfs_fop_write_iter+0x118/0x1a8
[   20.907015]  new_sync_write+0xe8/0x190
[   20.910773]  vfs_write+0x234/0x378
[   20.914181]  ksys_write+0x6c/0x100
[   20.917590]  __arm64_sys_write+0x1c/0x28
[   20.921521]  invoke_syscall+0x44/0x108
[   20.925273]  el0_svc_common.constprop.0+0xcc/0xf0
[   20.929983]  do_el0_svc+0x24/0x88
[   20.933302]  el0_svc+0x20/0x60
[   20.936365]  el0t_64_sync_handler+0xb0/0xb8
[   20.940557]  el0t_64_sync+0x1a0/0x1a4
[   20.944223] ---[ end trace 0000000000000000 ]---
[   20.954744] smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
[   20.961913] smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
[   20.967696] smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
[   20.979207] smsc95xx 2-1.1:1.0 eth1: hardware isn't capable of remote wakeup
[   21.030745] usb 2-1.4: USB disconnect, device number 4


root@iotgate:~# echo -n "2-1" > /sys/bus/usb/drivers/usb/bind
[   48.591950] hub 2-1:1.0: USB hub found
[   48.595909] hub 2-1:1.0: 5 ports detected
root@iotgate:~# [   48.886892] usb 2-1.1: new high-speed USB device
number 5 using ci_hdrc
[   49.002509] smsc95xx v2.0.0
[   49.098891] SMSC LAN8700 usb-002:005:01: attached PHY driver
(mii_bus:phy_addr=usb-002:005:01, irq=POLL)
[   49.110400] smsc95xx 2-1.1:1.0 eth1: register 'smsc95xx' at
usb-ci_hdrc.1-1.1, smsc95xx USB 2.0 Ethernet, 00:01:c0:2f:36:3d
[   49.190808] smsc95xx 2-1.1:1.0 eth1: hardware isn't capable of remote wakeup
[   49.202758] usb 2-1.4: new full-speed USB device number 6 using ci_hdrc
[   49.212264] smsc95xx 2-1.1:1.0 eth1: Link is Down

root@iotgate:~#
root@iotgate:~#
root@iotgate:~# echo -n "2-1" > /sys/bus/usb/drivers/usb/unbind
[   52.302633] usb 2-1.1: USB disconnect, device number 5
[   52.310139] smsc95xx 2-1.1:1.0 eth1: unregister 'smsc95xx'
usb-ci_hdrc.1-1.1, smsc95xx USB 2.0 Ethernet
[   52.319574] ********** returning -ENODEV from usb_control_msg
[   52.325388] ------------[ cut here ]------------
[   52.330016] WARNING: CPU: 1 PID: 257 at
drivers/usb/core/message.c:163 usb_control_msg+0x178/0x180
[   52.338989] Modules linked in:
[   52.342050] CPU: 1 PID: 257 Comm: sh Tainted: G        W
5.17.0-rc6-dirty #581
[   52.349969] Hardware name: CompuLab i.MX8MM IoT Gateway (DT)
[   52.355629] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   52.362595] pc : usb_control_msg+0x178/0x180
[   52.366868] lr : usb_control_msg+0x178/0x180
[   52.371144] sp : ffff800009c3b310
[   52.374456] x29: ffff800009c3b310 x28: 00000000000000c0 x27: 00000000000000a1
[   52.381602] x26: 0000000000000000 x25: 0000000000000114 x24: 0000000000000004
[   52.388747] x23: 0000000080000580 x22: ffff000006814800 x21: ffff00000d950e00
[   52.395892] x20: 00000000ffffffed x19: ffff00000d021d80 x18: 0000000000000010
[   52.403037] x17: 312e312d312e6372 x16: 64685f69632d6273 x15: ffff00000d951280
[   52.410180] x14: 000000000000020b x13: ffff00000d951280 x12: 00000000ffffffea
[   52.417324] x11: ffff8000094a1b28 x10: ffff800009489ae8 x9 : ffff800009489b40
[   52.424470] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000000001
[   52.431612] x5 : 0000000000000000 x4 : ffff00007fb7d998 x3 : ffff00007fb80a08
[   52.438757] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000031
[   52.445904] Call trace:
[   52.448351]  usb_control_msg+0x178/0x180
[   52.452283]  __usbnet_read_cmd.isra.0+0x8c/0x130
[   52.456903]  usbnet_read_cmd+0x64/0xa0
[   52.460654]  __smsc95xx_read_reg+0x6c/0xd8
[   52.464757]  __smsc95xx_phy_wait_not_busy+0x60/0xc8
[   52.469641]  __smsc95xx_mdio_read+0x54/0x160
[   52.473918]  smsc95xx_mdiobus_read+0x18/0x28
[   52.478192]  __mdiobus_modify_changed+0x44/0xe0
[   52.482728]  phy_modify+0x48/0x78
[   52.486050]  genphy_suspend+0x1c/0x28
[   52.489714]  phy_suspend+0xa8/0xe8
[   52.493118]  phy_state_machine+0x19c/0x228
[   52.497218]  phy_stop+0x5c/0x198
[   52.500450]  phy_disconnect+0x58/0x60
[   52.504115]  smsc95xx_unbind+0x20/0x48
[   52.507870]  usbnet_disconnect+0x40/0xc8
[   52.511797]  usb_unbind_interface+0x74/0x248
[   52.516072]  device_release_driver_internal+0x1fc/0x200
[   52.521303]  device_release_driver+0x18/0x28
[   52.525579]  bus_remove_device+0x128/0x138
[   52.529679]  device_del+0x16c/0x3a8
[   52.533173]  usb_disable_device+0x8c/0x158
[   52.537276]  usb_disconnect+0xb8/0x2a0
[   52.541029]  hub_quiesce+0x78/0xd0
[   52.544436]  hub_disconnect+0x50/0x190
[   52.548189]  usb_unbind_interface+0x74/0x248
[   52.552463]  device_release_driver_internal+0x1fc/0x200
[   52.557695]  device_release_driver+0x18/0x28
[   52.561969]  bus_remove_device+0x128/0x138
[   52.566071]  device_del+0x16c/0x3a8
[   52.569561]  usb_disable_device+0x8c/0x158
[   52.573665]  usb_set_configuration+0x538/0x898
[   52.578117]  usb_generic_driver_disconnect+0x2c/0x40
[   52.583088]  usb_unbind_device+0x30/0x98
[   52.587011]  device_release_driver_internal+0x1fc/0x200
[   52.592244]  device_driver_detach+0x18/0x28
[   52.596436]  unbind_store+0xe0/0x108
[   52.600012]  drv_attr_store+0x24/0x38
[   52.603678]  sysfs_kf_write+0x44/0x58
[   52.607349]  kernfs_fop_write_iter+0x118/0x1a8
[   52.611800]  new_sync_write+0xe8/0x190
[   52.615555]  vfs_write+0x234/0x378
[   52.618962]  ksys_write+0x6c/0x100
[   52.622370]  __arm64_sys_write+0x1c/0x28
[   52.626300]  invoke_syscall+0x44/0x108
[   52.630053]  el0_svc_common.constprop.0+0xcc/0xf0
[   52.634763]  do_el0_svc+0x24/0x88
[   52.638080]  el0_svc+0x20/0x60
[   52.641142]  el0t_64_sync_handler+0xb0/0xb8
[   52.645335]  el0t_64_sync+0x1a0/0x1a4
[   52.649001] ---[ end trace 0000000000000000 ]---
[   52.653704] smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
[   52.660885] smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
[   52.666664] smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
[   52.673255] ********** returning -ENODEV from usb_control_msg
[   52.679076] ------------[ cut here ]------------
[   52.683697] WARNING: CPU: 1 PID: 257 at
drivers/usb/core/message.c:163 usb_control_msg+0x178/0x180
[   52.692671] Modules linked in:
[   52.695731] CPU: 1 PID: 257 Comm: sh Tainted: G        W
5.17.0-rc6-dirty #581
[   52.703651] Hardware name: CompuLab i.MX8MM IoT Gateway (DT)
[   52.709311] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   52.716276] pc : usb_control_msg+0x178/0x180
[   52.720551] lr : usb_control_msg+0x178/0x180
[   52.724827] sp : ffff800009c3b370
[   52.728139] x29: ffff800009c3b370 x28: 00000000000000c0 x27: 00000000000000a1
[   52.735285] x26: 0000000000000000 x25: 0000000000000114 x24: 0000000000000004
[   52.742428] x23: 0000000080000580 x22: ffff000006814800 x21: ffff00000d950e00
[   52.749573] x20: 00000000ffffffed x19: ffff00000d021d80 x18: 0000000000000010
[   52.756718] x17: 312d203a34313130 x16: 3030303078302078 x15: ffff00000d951280
[   52.763862] x14: 0000000000000256 x13: ffff00000d951280 x12: 00000000ffffffea
[   52.771005] x11: ffff8000094a1b28 x10: ffff800009489ae8 x9 : ffff800009489b40
[   52.778150] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000000001
[   52.785294] x5 : 0000000000000000 x4 : ffff00007fb7d998 x3 : ffff00007fb80a08
[   52.792440] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000031
[   52.799583] Call trace:
[   52.802030]  usb_control_msg+0x178/0x180
[   52.805960]  __usbnet_read_cmd.isra.0+0x8c/0x130
[   52.810579]  usbnet_read_cmd+0x64/0xa0
[   52.814330]  __smsc95xx_read_reg+0x6c/0xd8
[   52.818432]  __smsc95xx_phy_wait_not_busy+0x60/0xc8
[   52.823312]  __smsc95xx_mdio_read+0x54/0x160
[   52.827589]  smsc95xx_mdiobus_read+0x18/0x28
[   52.831867]  __mdiobus_modify_changed+0x44/0xe0
[   52.836401]  phy_modify+0x48/0x78
[   52.839721]  genphy_suspend+0x1c/0x28
[   52.843389]  phy_suspend+0xa8/0xe8
[   52.846791]  phy_detach+0x30/0x110
[   52.850195]  phy_disconnect+0x44/0x60
[   52.853859]  smsc95xx_unbind+0x20/0x48
[   52.857615]  usbnet_disconnect+0x40/0xc8
[   52.861544]  usb_unbind_interface+0x74/0x248
[   52.865819]  device_release_driver_internal+0x1fc/0x200
[   52.871049]  device_release_driver+0x18/0x28
[   52.875326]  bus_remove_device+0x128/0x138
[   52.879426]  device_del+0x16c/0x3a8
[   52.882918]  usb_disable_device+0x8c/0x158
[   52.887023]  usb_disconnect+0xb8/0x2a0
[   52.890774]  hub_quiesce+0x78/0xd0
[   52.894181]  hub_disconnect+0x50/0x190
[   52.897934]  usb_unbind_interface+0x74/0x248
[   52.902206]  device_release_driver_internal+0x1fc/0x200
[   52.907438]  device_release_driver+0x18/0x28
[   52.911714]  bus_remove_device+0x128/0x138
[   52.915815]  device_del+0x16c/0x3a8
[   52.919304]  usb_disable_device+0x8c/0x158
[   52.923409]  usb_set_configuration+0x538/0x898
[   52.927861]  usb_generic_driver_disconnect+0x2c/0x40
[   52.932832]  usb_unbind_device+0x30/0x98
[   52.936755]  device_release_driver_internal+0x1fc/0x200
[   52.941986]  device_driver_detach+0x18/0x28
[   52.946173]  unbind_store+0xe0/0x108
[   52.949750]  drv_attr_store+0x24/0x38
[   52.953418]  sysfs_kf_write+0x44/0x58
[   52.957086]  kernfs_fop_write_iter+0x118/0x1a8
[   52.961533]  new_sync_write+0xe8/0x190
[   52.965291]  vfs_write+0x234/0x378
[   52.968697]  ksys_write+0x6c/0x100
[   52.972104]  __arm64_sys_write+0x1c/0x28
[   52.976033]  invoke_syscall+0x44/0x108
[   52.979785]  el0_svc_common.constprop.0+0xcc/0xf0
[   52.984498]  do_el0_svc+0x24/0x88
[   52.987818]  el0_svc+0x20/0x60
[   52.990877]  el0t_64_sync_handler+0xb0/0xb8
[   52.995067]  el0t_64_sync+0x1a0/0x1a4
[   52.998736] ---[ end trace 0000000000000000 ]---
[   53.003408] smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
[   53.010584] smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
[   53.016367] smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
[   53.023423] smsc95xx 2-1.1:1.0 eth1: hardware isn't capable of remote wakeup
[   53.059462] usb 2-1.4: USB disconnect, device number 6
