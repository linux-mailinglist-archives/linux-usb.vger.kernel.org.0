Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029742C6063
	for <lists+linux-usb@lfdr.de>; Fri, 27 Nov 2020 08:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392691AbgK0HPp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Nov 2020 02:15:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:53412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389420AbgK0HPo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Nov 2020 02:15:44 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5634E21D81;
        Fri, 27 Nov 2020 07:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606461343;
        bh=lOqC+mdPesw2LThaxCyaW/UZEKX1KxHRlAUnQR0PIi0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=scL+IZ+0zwuISXGfOEW/zk6UC4nX1vQt0SaxrgB07yF8PW5YBXBDe5dNOi0DCJzlN
         8auT2y1wNNYeWco2OBHbQsR/ad5nWFf27cS9PblBhexlE9g4zoR2SHBe7AuHdPBvi0
         T56MxjSgjKXcnpE93uy8ota50E0Vjoweu25402z8=
Date:   Fri, 27 Nov 2020 08:16:53 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     lijiazi <jqqlijiazi@gmail.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jiazi Li <lijiazi@xiaomi.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: add sanity check for opmode
Message-ID: <X8Cn5dg5pnNFBHL0@kroah.com>
References: <1606456643-31913-1-git-send-email-lijiazi@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606456643-31913-1-git-send-email-lijiazi@xiaomi.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 27, 2020 at 01:57:23PM +0800, lijiazi wrote:
> From: Jiazi Li <lijiazi@xiaomi.com>
> 
> If usb drivers set a invalid value, for example, a negative
> value. then a userspace task
> cat sys/class/typec/port0/power_operation_mode, will cause a
> panic issue:
> [154325.262827] Unable to handle kernel paging request at virtual
> address ffffff980aad8b68
> [154325.262838] Mem abort info:
> [154325.262843]   ESR = 0x96000005
> [154325.262849]   Exception class = DABT (current EL), IL = 32 bits
> [154325.262855]   SET = 0, FnV = 0
> [154325.262860]   EA = 0, S1PTW = 0
> [154325.262865] Data abort info:
> [154325.262870]   ISV = 0, ISS = 0x00000005
> [154325.262875]   CM = 0, WnR = 0
> [154325.262880] swapper pgtable: 4k pages, 39-bit VAs, pgdp =
> 000000001cae9c14
> [154325.262884] [ffffff980aad8b68] pgd=0000000000000000,
> pud=0000000000000000
> [154325.262891] Internal error: Oops: 96000005 [#1] PREEMPT SMP
> [154325.262896] Modules linked in: rmnet_perf(O) rmnet_shs(O)
> wlan(O) sla(O) exfat(O) machine_dlkm(O) tfa98xx_dlkm(O)
> cs35l41_dlkm(O) wcd938x_slave_dlkm(O) wcd938x_dlkm(O)
> wcd9xxx_dlkm(O) mbhc_dlkm(O) tx_macro_dlkm(O) rx_macro_dlkm(O)
> va_macro_dlkm(O) wsa_macro_dlkm(O) swr_ctrl_dlkm(O)
> bolero_cdc_dlkm(O) wsa881x_dlkm(O) wcd_core_dlkm(O) stub_dlkm(O)
> hdmi_dlkm(O) swr_dlkm(O) pinctrl_lpi_dlkm(O) pinctrl_wcd_dlkm(O)
> usf_dlkm(O) native_dlkm(O) platform_dlkm(O) q6_dlkm(O)
> adsp_loader_dlkm(O) apr_dlkm(O) snd_event_dlkm(O)
> q6_notifier_dlkm(O) q6_pdr_dlkm(O) [last unloaded: rmnet_perf]
> [154325.262939] Process usb@1.2-service (pid: 2501, stack limit
> 		= 0x00000000cb0343ac)
> [154325.262946] CPU: 5 PID: 2501 Comm: usb@1.2-service Tainted:
> G S      W  O      4.19.113-perf-g0307705d321bc #1
> [154325.262950] Hardware name: Qualcomm Technologies, Inc.
> xiaomi cas (DT)
> [154325.262955] pstate: 80400005 (Nzcv daif +PAN -UAO)
> [154325.262967] pc : power_operation_mode_show+0x34/0x58
> [154325.262971] lr : power_operation_mode_show+0x34/0x58
> [154325.262974] sp : ffffffc1376bf990
> [154325.262977] x29: ffffffc1376bf990 x28: ffffffc195aede58
> [154325.262981] x27: ffffffc195aede48 x26: ffffff9008c55638
> [154325.262986] x25: ffffffc05a44b300 x24: 0000000000001000
> [154325.262990] x23: ffffffc19a340018 x22: ffffffc19a340018
> [154325.262994] x21: ffffff900bb10038 x20: ffffff980aad8b68
> [154325.262998] x19: ffffffc05a44b300 x18: 0000000000000000
> [154325.263002] x17: 0000000000000000 x16: 0000000000000000
> [154325.263006] x15: 0000000000000000 x14: 00000000080a38f8
> [154325.263010] x13: ffffff880b489860 x12: 0000000000000000
> [154325.263014] x11: 0000000000000000 x10: 1ffffff30155b16d
> [154325.263018] x9 : 0000000000000000 x8 : 0000000000000007
> [154325.263022] x7 : 0000000000000000 x6 : 000000000000003f
> [154325.263026] x5 : 0000000000000040 x4 : 0000000000000000
> [154325.263030] x3 : 0000000000000004 x2 : ffffffc05a44b300
> [154325.263034] x1 : ffffff900bb10038 x0 : ffffff980aad8b68
> [154325.263039]
> [154325.263039] SP: 0xffffffc1376bf910:
> [154325.263043] f910  00001000 00000000 5a44b300 ffffffc0
> 08c55638 ffffff90 95aede48 ffffffc1
> [154325.263052] f930  95aede58 ffffffc1 376bf990 ffffffc1
> 09024b5c ffffff90 376bf990 ffffffc1
> [154325.263060] f950  09024b5c ffffff90 80400005 00000000
> 376bf9c0 ffffffc1 083cdf64 ffffff90
> [154325.263067] f970  ffffffff 0000007f 376bfd80 ffffffc1
> 376bf990 ffffffc1 09024b5c ffffff90
> [154325.263075] f990  376bf9b0 ffffffc1 08c55678 ffffff90
> 0bb10048 ffffff90 5a44b300 ffffffc0
> [154325.263082] f9b0  376bf9e0 ffffffc1 085075e0 ffffff90
> 0a5d43f8 ffffff90 9a9d9f00 ffffffc1
> [154325.263090] f9d0  95aede48 ffffffc1 95aede58 ffffffc1
> 376bfa30 ffffffc1 08506248 ffffff90
> [154325.263097] f9f0  95aede40 ffffffc1 00000000 00000000
> 00000001 00000000 9a9d9f00 ffffffc1
> [154325.263106] Call trace:
> [154325.263111]  power_operation_mode_show+0x34/0x58
> [154325.263116]  dev_attr_show+0x40/0x80
> [154325.263123]  sysfs_kf_seq_show+0x110/0x1c0
> [154325.263127]  kernfs_seq_show+0x80/0x98
> [154325.263133]  seq_read+0x2d8/0x778
> [154325.263136]  kernfs_fop_read+0xa4/0x2a8
> [154325.263142]  __vfs_read+0xd4/0x2e8
> [154325.263145]  vfs_read+0xe0/0x1b0
> [154325.263149]  ksys_read+0xdc/0x170
> [154325.263153]  __arm64_sys_read+0x44/0x58
> [154325.263158]  el0_svc_common+0xd8/0x1d0
> [154325.263162]  el0_svc_handler+0x90/0xb8
> [154325.263166]  el0_svc+0x8/0xc
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Jiazi Li <lijiazi@xiaomi.com>
> ---
> Changes in v2:
>  - return -EINVAL when opmode invalid
> ---
>  drivers/usb/typec/class.c | 8 ++++++--
>  include/linux/usb/typec.h | 3 ++-
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index cb1362187..3f55182 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1559,13 +1559,15 @@ static int partner_match(struct device *dev, void *data)
>   * Type-C specification, and "USB Power Delivery" when the power levels are
>   * negotiated with methods defined in USB Power Delivery specification.
>   */
> -void typec_set_pwr_opmode(struct typec_port *port,
> +int typec_set_pwr_opmode(struct typec_port *port,
>  			  enum typec_pwr_opmode opmode)

But now no one is checking this return value :(

