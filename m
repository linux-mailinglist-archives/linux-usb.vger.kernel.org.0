Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF5EA2D6008
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 16:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390730AbgLJPjx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 10:39:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:49478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390789AbgLJPjn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Dec 2020 10:39:43 -0500
X-Gm-Message-State: AOAM5308WrQ8OtEbC+nmfYk9bdvpoq4nd4Bm08xPBGkX+zqym/nFB2sD
        EXx3IyF/4+RuFz6voDHr2+qW4B0Rl6Usl1NVPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607614742;
        bh=ejzljwcLGzknlUGnBI4RDXdJuWBr5pEqPY0gDZhsl1A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=r9DnCf5ON8cA5IMNV8nLnKbv6qAt0ix0Z7NWl1+gtrlDbhQgyL3UNvUbEw0UBfhC5
         z2LqIYQTQc138c+xFEkBDX8AZOgldz+LerrZEy9fn+K0nOxBQtQQPjCdPxvlBOKk7f
         dKVg62fOZ9Vt4IWKrAhui3FjxkRA5Pvt7zAP18F8WcGcZtO/diRX5szwu54qiAoIjq
         TtpwC/idDj2a/nIKCLARRaznrUhl5W2gwn41s5KjVnmOSSZFYgL7aEH2Ov3JKLZw4Z
         Jjwp9f+xZMtE7Oa0+0O3FtKeSgQVRxBb8+1msUtFZwKnDE/uxfCSLtxMken858zO5B
         C85Um01VdutEQ==
X-Google-Smtp-Source: ABdhPJyK9qZsI7MZWqelNbUIIHerGwvErNvdNBy3qleotTG0Tipf/xUBx9PfzaTSXd1s7UQwtWYm0p4RuLoRSnyh0do=
X-Received: by 2002:a05:620a:4056:: with SMTP id i22mr10032120qko.364.1607614741399;
 Thu, 10 Dec 2020 07:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20201210134215.20424-1-peter.chen@kernel.org>
In-Reply-To: <20201210134215.20424-1-peter.chen@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 10 Dec 2020 09:38:49 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKxcWjdxVHSSHKKRtshwOXeodjQWCYt6G7asJYjjuoWQQ@mail.gmail.com>
Message-ID: <CAL_JsqKxcWjdxVHSSHKKRtshwOXeodjQWCYt6G7asJYjjuoWQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] of: platform: introduce platform data length for auxdata
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@ti.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Frank Li <frank.li@nxp.com>, devicetree@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 10, 2020 at 7:42 AM Peter Chen <peter.chen@kernel.org> wrote:
>
> From: Peter Chen <peter.chen@nxp.com>
>
> When a platform device is released, it frees the device platform_data
> memory region using kfree, if the memory is not allocated by kmalloc,
> it may run into trouble. See the below comments from kfree API.
>
>          * Don't free memory not originally allocated by kmalloc()
>          * or you will run into trouble.
>
> For the device which is created dynamically using of_platform_populate,
> if the platform_data is existed at of_dev_auxdata structure, the OF code
> simply assigns the platform_data pointer to newly created device, but
> not using platform_device_add_data to allocate one. For most of platform
> data region at device driver, which may not be allocated by kmalloc, they
> are at global data region or at stack region at some situations.

auxdata is a "temporary" thing for transitioning to DT which I want to
remove. So I don't really want to see it expanded nor new users. We've
got about a dozen arm32 platforms and 5 cases under drivers/.

> It fixed below oops during module unload process at imx8qxp mek platform
> for Cadence USB3 driver.
>
> log1:
> [  333.501593] Unable to handle kernel paging request at virtual address 000000000004ae48
> [  333.509558] Mem abort info:
> [  333.512369]   ESR = 0x96000006
> [  333.515476]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  333.520847]   SET = 0, FnV = 0
> [  333.523986]   EA = 0, S1PTW = 0
> [  333.527193] Data abort info:
> [  333.530124]   ISV = 0, ISS = 0x00000006
> [  333.534004]   CM = 0, WnR = 0
> [  333.536988] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000885d73000
> [  333.543497] [000000000004ae48] pgd=0000000000000000, p4d=0000000000000000
> [  333.550354] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> [  333.555936] Modules linked in: fsl_jr_uio caam_jr caamkeyblob_desc caamhash_desc caamalg_desc crypto_engine rng_core authenc libdes crct10dif_
> ce mxc_jpeg_encdec phy_mxs_usb phy_cadence_salvo imx8_media_dev(C) caam error [last unloaded: cdns3]
> [  333.577484] CPU: 3 PID: 168 Comm: kworker/3:38 Tainted: G         C        5.10.0-rc4-04454-gd479340c061 #30
> [  333.587313] Hardware name: Freescale i.MX8QXP MEK (DT)
> [  333.592471] Workqueue: rcu_gp srcu_invoke_callbacks
> [  333.597359] pstate: a0000005 (NzCv daif -PAN -UAO -TCO BTYPE=--)
> [  333.603373] pc : kfree+0x78/0x3a0
> [  333.606690] lr : platform_device_release+0x28/0x58
> [  333.611481] sp : ffff8000135bbc20
> [  333.614800] x29: ffff8000135bbc20 x28: ffff800012146000
> [  333.620125] x27: ffff00083fa06470 x26: ffff800010108cb0
> [  333.625442] x25: 0080000000000000 x24: ffff80001240f000
> [  333.630767] x23: ffff0008012ef000 x22: ffff800010875478
> [  333.636093] x21: ffff8000092b90c8 x20: ffff000804bf1b00
> [  333.641418] x19: 000000000004ae40 x18: 0000000000000000
> [  333.646735] x17: 0000000000000000 x16: 0000000000000000
> [  333.652052] x15: 0000000000000000 x14: 0000000000000000
> [  333.657368] x13: 0000000000000002 x12: 0000000000000000
> [  333.662685] x11: 0000000000000040 x10: 0000000000000a00
> [  333.668000] x9 : ffff800010875478 x8 : fefefefefefefeff
> [  333.673319] x7 : 0000000000000018 x6 : ffff00080101006c
> [  333.678644] x5 : ffff00083fa5c300 x4 : 0000000000000000
> [  333.683969] x3 : 0000000000000002 x2 : 0000000000000000
> [  333.689286] x1 : 0000000000000030 x0 : fffffdffffe00000
> [  333.694605] Call trace:
> [  333.697059]  kfree+0x78/0x3a0
> [  333.700027]  platform_device_release+0x28/0x58
> [  333.704476]  device_release+0x38/0x90
> [  333.708144]  kobject_put+0x78/0x208
> [  333.711633]  __device_link_free_srcu+0x50/0x78
> [  333.716082]  srcu_invoke_callbacks+0xf4/0x168
> [  333.720445]  process_one_work+0x1c8/0x480
> [  333.724460]  worker_thread+0x50/0x420
> [  333.728124]  kthread+0x148/0x168
> [  333.731355]  ret_from_fork+0x10/0x18
> [  333.734940] Code: b26babe0 d34cfe73 f2dfbfe0 8b131813 (f9400660)
> [  333.741049] ---[ end trace 9a41d9fcbc0885e6 ]---
> [  333.745671] Kernel panic - not syncing: Oops: Fatal exception in interrupt
> [  333.752551] SMP: stopping secondary CPUs
> [  333.756485] Kernel Offset: disabled
> [  333.759979] CPU features: 0x0240002,20002008
> [  333.764251] Memory Limit: none
>
> log2:
> [  160.400179]  kfree+0x78/0x3a0
> [  160.403147]  platform_device_release+0x28/0x58
> [  160.407595]  device_release+0x38/0x90
> [  160.411264]  kobject_put+0x78/0x208
> [  160.414753]  klist_children_put+0x1c/0x28
> [  160.418766]  klist_next+0xac/0x128
> [  160.422172]  device_for_each_child+0x4c/0xa8
> [  160.426453]  cdns_imx_remove+0x2c/0x40 [cdns3_imx]
> [  160.431251]  platform_drv_remove+0x30/0x50
> [  160.435353]  device_release_driver_internal+0x114/0x1e8
> [  160.440580]  driver_detach+0x54/0xe0
> [  160.444163]  bus_remove_driver+0x60/0xd8
> [  160.448087]  driver_unregister+0x34/0x60
> [  160.452013]  platform_driver_unregister+0x18/0x20
> [  160.456726]  cdns_imx_driver_exit+0x14/0x478 [cdns3_imx]
> [  160.462042]  __arm64_sys_delete_module+0x180/0x258
> [  160.466837]  el0_svc_common.constprop.0+0x70/0x168
> [  160.471631]  do_el0_svc+0x28/0x88
> [  160.474950]  el0_sync_handler+0x158/0x160
> [  160.478961]  el0_sync+0x140/0x180
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/of/platform.c       | 29 +++++++++++++++++++++--------
>  include/linux/of_platform.h |  8 ++++++--
>  2 files changed, 27 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index b557a0fcd4ba..4afb775779f3 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -157,7 +157,8 @@ EXPORT_SYMBOL(of_device_alloc);
>   * of_platform_device_create_pdata - Alloc, initialize and register an of_device
>   * @np: pointer to node to create device for
>   * @bus_id: name to assign device
> - * @platform_data: pointer to populate platform_data pointer with
> + * @platform_data: platform_data pointer from device driver
> + * @platform_data_length: the length of platform_data
>   * @parent: Linux device model parent device.
>   *
>   * Returns pointer to created platform device, or NULL if a device was not
> @@ -167,6 +168,7 @@ static struct platform_device *of_platform_device_create_pdata(
>                                         struct device_node *np,
>                                         const char *bus_id,
>                                         void *platform_data,
> +                                       int platform_data_length,
>                                         struct device *parent)
>  {
>         struct platform_device *dev;
> @@ -183,16 +185,22 @@ static struct platform_device *of_platform_device_create_pdata(
>         if (!dev->dev.dma_mask)
>                 dev->dev.dma_mask = &dev->dev.coherent_dma_mask;
>         dev->dev.bus = &platform_bus_type;
> -       dev->dev.platform_data = platform_data;
> +       if (platform_data_length) {
> +               if (platform_device_add_data(dev, platform_data, platform_data_length))
> +                       goto err_put_device;
> +       } else {
> +               dev->dev.platform_data = platform_data;
> +       }
> +
>         of_msi_configure(&dev->dev, dev->dev.of_node);
>
> -       if (of_device_add(dev) != 0) {
> -               platform_device_put(dev);
> -               goto err_clear_flag;
> -       }
> +       if (of_device_add(dev) != 0)
> +               goto err_put_device;
>
>         return dev;
>
> +err_put_device:
> +       platform_device_put(dev);
>  err_clear_flag:
>         of_node_clear_flag(np, OF_POPULATED);
>         return NULL;
> @@ -211,7 +219,7 @@ struct platform_device *of_platform_device_create(struct device_node *np,
>                                             const char *bus_id,
>                                             struct device *parent)
>  {
> -       return of_platform_device_create_pdata(np, bus_id, NULL, parent);
> +       return of_platform_device_create_pdata(np, bus_id, NULL, 0, parent);
>  }
>  EXPORT_SYMBOL(of_platform_device_create);
>
> @@ -353,6 +361,7 @@ static int of_platform_bus_create(struct device_node *bus,
>         struct platform_device *dev;
>         const char *bus_id = NULL;
>         void *platform_data = NULL;
> +       int platform_data_length = 0;
>         int rc = 0;
>
>         /* Make sure it has a compatible property */
> @@ -378,6 +387,9 @@ static int of_platform_bus_create(struct device_node *bus,
>         if (auxdata) {
>                 bus_id = auxdata->name;
>                 platform_data = auxdata->platform_data;
> +               platform_data_length = auxdata->platform_data_length;
> +               if (platform_data && !platform_data_length)
> +                       pr_warn("Make sure platform_data is allocated by kmalloc\n");

Isn't this going to warn on the majority of users as static data is the norm.

>         }
>
>         if (of_device_is_compatible(bus, "arm,primecell")) {
> @@ -389,7 +401,8 @@ static int of_platform_bus_create(struct device_node *bus,
>                 return 0;
>         }
>
> -       dev = of_platform_device_create_pdata(bus, bus_id, platform_data, parent);
> +       dev = of_platform_device_create_pdata(bus, bus_id, platform_data,
> +                                       platform_data_length, parent);
>         if (!dev || !of_match_node(matches, bus))
>                 return 0;
>
> diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
> index 84a966623e78..c3b02236b110 100644
> --- a/include/linux/of_platform.h
> +++ b/include/linux/of_platform.h
> @@ -18,11 +18,14 @@
>   * @phys_addr: Start address of registers to match against node
>   * @name: Name to assign for matching nodes
>   * @platform_data: platform_data to assign for matching nodes
> + * @platform_data_length: the length of platform data
>   *
>   * This lookup table allows the caller of of_platform_populate() to override
>   * the names of devices when creating devices from the device tree.  The table
> - * should be terminated with an empty entry.  It also allows the platform_data
> - * pointer to be set.
> + * should be terminated with an empty entry. The platform_data_length should be
> + * given if the platform_data is existed and is not allocated by kmalloc, it
> + * could avoid potential kfree issue when the platform_data is freed by
> + * platform_device_release.
>   *
>   * The reason for this functionality is that some Linux infrastructure uses
>   * the device name to look up a specific device, but the Linux-specific names
> @@ -39,6 +42,7 @@ struct of_dev_auxdata {
>         resource_size_t phys_addr;
>         char *name;
>         void *platform_data;
> +       int platform_data_length;
>  };
>
>  /* Macro to simplify populating a lookup table */
> --
> 2.17.1
>
