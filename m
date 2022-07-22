Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424E757E394
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jul 2022 17:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235655AbiGVPOd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jul 2022 11:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiGVPOb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jul 2022 11:14:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995999A5C0
        for <linux-usb@vger.kernel.org>; Fri, 22 Jul 2022 08:14:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 51989B827C3
        for <linux-usb@vger.kernel.org>; Fri, 22 Jul 2022 15:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C5BC341C6;
        Fri, 22 Jul 2022 15:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1658502868;
        bh=L1N8fwBwGXcrzcc/JhkUDH8xJ8ucwVeGdEyoQ/AafFc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aZYFi4nd0uOb9VM8QSaQmf0yru1lzabPzmipLiOhhbRp7zRnZNLG9z4Gwf0A+mth+
         g7WcBIkpv7f+dQLdQc9EzlWMyjmjGB+bo2/YzvipEpb9Lx0XMs95axc7RnPQLZT/ts
         4HJXwJuKwVlLAxBR8E9+fuLzh/n/qY+XHW/pLpYE=
Date:   Fri, 22 Jul 2022 17:14:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alexey Sheplyakov <asheplyakov@basealt.ru>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH] usb: xhci_plat_remove: avoid NULL dereference
Message-ID: <Ytq+xiPgH64fnCnh@kroah.com>
References: <20220722141700.1271439-1-asheplyakov@basealt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722141700.1271439-1-asheplyakov@basealt.ru>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 22, 2022 at 06:17:00PM +0400, Alexey Sheplyakov wrote:
> Since commit 4736ebd7fcaff1eb8481c140ba494962847d6e0a ("usb: host:
> xhci-plat: omit shared hcd if either root hub has no ports")
> xhci->shared_hcd can be NULL, which causes the following Oops
> on reboot:
> 
> [  710.124450] systemd-shutdown[1]: Rebooting.
> [  710.298861] xhci-hcd xhci-hcd.2.auto: remove, state 4
> [  710.304217] usb usb3: USB disconnect, device number 1
> [  710.317441] xhci-hcd xhci-hcd.2.auto: USB bus 3 deregistered
> [  710.323280] xhci-hcd xhci-hcd.2.auto: remove, state 1
> [  710.328401] usb usb2: USB disconnect, device number 1
> [  710.333515] usb 2-3: USB disconnect, device number 2
> [  710.467649] xhci-hcd xhci-hcd.2.auto: USB bus 2 deregistered
> [  710.475450] Unable to handle kernel NULL pointer dereference at virtual address 00000000000003b8
> [  710.484425] Mem abort info:
> [  710.487265]   ESR = 0x0000000096000004
> [  710.491060]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  710.496427]   SET = 0, FnV = 0
> [  710.499525]   EA = 0, S1PTW = 0
> [  710.502716]   FSC = 0x04: level 0 translation fault
> [  710.507648] Data abort info:
> [  710.510577]   ISV = 0, ISS = 0x00000004
> [  710.514462]   CM = 0, WnR = 0
> [  710.517480] user pgtable: 4k pages, 48-bit VAs, pgdp=00000008b0050000
> [  710.523976] [00000000000003b8] pgd=0000000000000000, p4d=0000000000000000
> [  710.530961] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [  710.536551] Modules linked in: rfkill input_leds snd_soc_simple_card snd_soc_simple_card_utils snd_soc_nau8822 designware_i2s snd_soc_core dw_hdmi_ahb_audio snd_pcm_dmaengine arm_ccn panfrost ac97_bus gpu_sched snd_pcm at24 fuse configfs sdhci_of_dwcmshc sdhci_pltfm sdhci nvme led_class mmc_core nvme_core bt1_pvt polynomial tp_serio snd_seq_midi snd_seq_midi_event snd_seq snd_timer snd_rawmidi snd_seq_device snd soundcore efivarfs ipv6
> [  710.575286] CPU: 7 PID: 1 Comm: systemd-shutdow Not tainted 5.19.0-rc7-00043-gfd8619f4fd54 #1
> [  710.583822] Hardware name: T-Platforms TF307-MB/BM1BM1-A, BIOS 5.6 07/06/2022
> [  710.590972] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  710.597949] pc : usb_remove_hcd+0x34/0x1e4
> [  710.602067] lr : xhci_plat_remove+0x74/0x140
> [  710.606351] sp : ffff800009f3b7c0
> [  710.609674] x29: ffff800009f3b7c0 x28: ffff000800960040 x27: 0000000000000000
> [  710.616833] x26: ffff800008dc22a0 x25: 0000000000000000 x24: 0000000000000000
> [  710.623992] x23: 0000000000000000 x22: ffff000805465810 x21: ffff000805465800
> [  710.631149] x20: ffff000800f80000 x19: 0000000000000000 x18: ffffffffffffffff
> [  710.638307] x17: ffff000805096000 x16: ffff00080633b800 x15: ffff000806537a1c
> [  710.645465] x14: 0000000000000001 x13: 0000000000000000 x12: ffff00080378d6f0
> [  710.652621] x11: ffff00080041a900 x10: ffff800009b204e8 x9 : ffff8000088abaa4
> [  710.659779] x8 : ffff000800960040 x7 : ffff800009409000 x6 : 0000000000000001
> [  710.666936] x5 : ffff800009241000 x4 : ffff800009241440 x3 : 0000000000000000
> [  710.674094] x2 : ffff000800960040 x1 : ffff000800960040 x0 : 0000000000000000
> [  710.681251] Call trace:
> [  710.683704]  usb_remove_hcd+0x34/0x1e4
> [  710.687467]  xhci_plat_remove+0x74/0x140
> [  710.691400]  platform_remove+0x34/0x70
> [  710.695165]  device_remove+0x54/0x90
> [  710.698753]  device_release_driver_internal+0x200/0x270
> [  710.703992]  device_release_driver+0x24/0x30
> [  710.708273]  bus_remove_device+0xe0/0x16c
> [  710.712293]  device_del+0x178/0x390
> [  710.715797]  platform_device_del.part.0+0x24/0x90
> [  710.720514]  platform_device_unregister+0x30/0x50
> [  710.725232]  dwc3_host_exit+0x20/0x30
> [  710.728907]  dwc3_remove+0x174/0x1b0
> [  710.732494]  platform_remove+0x34/0x70
> [  710.736254]  device_remove+0x54/0x90
> [  710.739840]  device_release_driver_internal+0x200/0x270
> [  710.745078]  device_release_driver+0x24/0x30
> [  710.749359]  bus_remove_device+0xe0/0x16c
> [  710.753380]  device_del+0x178/0x390
> [  710.756881]  platform_device_del.part.0+0x24/0x90
> [  710.761598]  platform_device_unregister+0x30/0x50
> [  710.766314]  of_platform_device_destroy+0xe8/0x100
> [  710.771119]  device_for_each_child_reverse+0x70/0xc0
> [  710.776099]  of_platform_depopulate+0x48/0x90
> [  710.780468]  __dwc3_of_simple_teardown+0x28/0xe0
> [  710.785099]  dwc3_of_simple_shutdown+0x20/0x30
> [  710.789555]  platform_shutdown+0x30/0x40
> [  710.793490]  device_shutdown+0x138/0x32c
> [  710.797425]  __do_sys_reboot+0x1c4/0x2ac
> [  710.801362]  __arm64_sys_reboot+0x30/0x40
> [  710.805383]  invoke_syscall+0x50/0x120
> [  710.809146]  el0_svc_common.constprop.0+0x68/0x124
> [  710.813950]  do_el0_svc+0x3c/0xcc
> [  710.817275]  el0_svc+0x60/0x12c
> [  710.820428]  el0t_64_sync_handler+0xc0/0x13c
> [  710.824710]  el0t_64_sync+0x18c/0x190
> [  710.828386] Code: a9025bf5 f942c420 f9001fe0 d2800000 (b943ba62)
> [  710.834498] ---[ end trace 0000000000000000 ]---
> [  710.875958] pstore: crypto_comp_compress failed, ret = -22!
> [  710.895047] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [  710.902757] Kernel Offset: disabled
> [  710.906255] CPU features: 0x800,00004811,00001082
> [  710.910971] Memory Limit: none
> [  710.927474] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> 
> To avoid the problem check for NULL in usb_remove_hcd.
> 
> Signed-off-by: Alexey Sheplyakov <asheplyakov@basealt.ru>
> Fixes: 4736ebd7fcaf ("usb: host: xhci-plat: omit shared hcd if either root hub has no ports")
> ---
>  drivers/usb/core/hcd.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 06eea8848ccc..41dcd41e550c 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -3033,9 +3033,15 @@ EXPORT_SYMBOL_GPL(usb_add_hcd);
>   */
>  void usb_remove_hcd(struct usb_hcd *hcd)
>  {
> -	struct usb_device *rhdev = hcd->self.root_hub;
> +	struct usb_device *rhdev;
>  	bool rh_registered;
>  
> +	if (!hcd) {
> +		pr_debug("%s: hcd is NULL\n", __func__);

This is a device, you should always use dev_dbg(), but yes, you don't
have a pointer here.

But, you never need a __func__ for dev_dbg() or pr_debug(), it is there
automatically if you need it.

But really, why is hcd NULL at all?  Are you sure that is allowed here?
What caused this to be called for a NULL device?

thanks,

greg k-h
