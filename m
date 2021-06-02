Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3475539877F
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 12:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhFBLB1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 07:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbhFBLBN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Jun 2021 07:01:13 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B125AC0613ED
        for <linux-usb@vger.kernel.org>; Wed,  2 Jun 2021 03:59:27 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id x15so2198164oic.13
        for <linux-usb@vger.kernel.org>; Wed, 02 Jun 2021 03:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n1/HGUsMWK+5b95hU94acKCVw7QYzF0L7PEe50Yla7w=;
        b=dpAU/Cj0jYKW9ks7rS+KtyGM8D76l7XBXTvC1V+ExvxNu6XVM3/I6LH0LfxHADfGbD
         VM9AaI364E7f3xZqrpR/9FZXnVTVUQ+hV32Xpn0BD1+eE1nbPpP8zu18r+wxDSZfbteY
         nCgSJrDYlYudwz6R6nMtIcUIPb5b7SL2dJEmrXWwB++gFmc0O5kbnihhtAye5VPGvpq7
         IzZnMsGITyI05xJt2S9MVzJ06xbe8DRBwZ2nK2KoifA8wcWvpIfGa6J84CzyXcbK67cg
         qlr7Qm6rDzNhdvvqeRTIQytKH95HcpLL8DJDYT+VnhdBE/fOJMw6Bkj0djueoqaqX5V8
         qaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=n1/HGUsMWK+5b95hU94acKCVw7QYzF0L7PEe50Yla7w=;
        b=JxcPVWJ7TO0AcIQSxW92KASsr+xd+OOF9ym8n2E3eRyVfz+wjkV6/kIogi9UZ548GF
         VbMvXX1gzFhi3/gVs7OyffRaY5SlelHmeJKrevf9VenoDIXQRjcUUZGx05sDvES8Zzyu
         6VG4tZKp7mgqDxDcIbzMvSxQghRUP+WgR9JI1XKVwPrwQzTNxZjBIax6QrSpxpPvRl8E
         nUuKkAxnol8BjnaTBeToRq7uTPQVtdqaM58+7vIXM0vnJjymqNChddxrfextEPH1+8S3
         XjWnsKwdotPjfx5PZ1YD18SW1Jlb6ZhnPV7sW8FJQ5GsZ79Pd0ZI2FmIqOMUxA3NiZ0B
         xtMg==
X-Gm-Message-State: AOAM532y6Y06xUaych8dFe7Fa3XAWlgw/mYX6GQOBvImhTyQ6aaDBv3+
        TWTowvWnhDHBmHGNVSCYjQg=
X-Google-Smtp-Source: ABdhPJxsvhPgHp5BUZMUJ3RE8zj7l8KJcwqMWqxuFzW+6SugedHCYv3Zu4L/ywdzdUzNOF8LhXvSCw==
X-Received: by 2002:aca:ab50:: with SMTP id u77mr21131110oie.153.1622631567096;
        Wed, 02 Jun 2021 03:59:27 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v22sm4009326oic.37.2021.06.02.03.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 03:59:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Jun 2021 03:59:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Li Jun <jun.li@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: typec: tcpm: cancel vdm and state machine
 hrtimer when unregister tcpm port
Message-ID: <20210602105925.GG1865238@roeck-us.net>
References: <1622627829-11070-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622627829-11070-1-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 02, 2021 at 05:57:07PM +0800, Li Jun wrote:
> A pending hrtimer may expire after the kthread_worker of tcpm port
> is destroyed, see below kernel dump when do module unload, fix it
> by cancel the 2 hrtimers.
> 
> [  111.517018] Unable to handle kernel paging request at virtual address ffff8000118cb880
> [  111.518786] blk_update_request: I/O error, dev sda, sector 60061185 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [  111.526594] Mem abort info:
> [  111.526597]   ESR = 0x96000047
> [  111.526600]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  111.526604]   SET = 0, FnV = 0
> [  111.526607]   EA = 0, S1PTW = 0
> [  111.526610] Data abort info:
> [  111.526612]   ISV = 0, ISS = 0x00000047
> [  111.526615]   CM = 0, WnR = 1
> [  111.526619] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000041d75000
> [  111.526623] [ffff8000118cb880] pgd=10000001bffff003, p4d=10000001bffff003, pud=10000001bfffe003, pmd=10000001bfffa003, pte=0000000000000000
> [  111.526642] Internal error: Oops: 96000047 [#1] PREEMPT SMP
> [  111.526647] Modules linked in: dwc3_imx8mp dwc3 phy_fsl_imx8mq_usb [last unloaded: tcpci]
> [  111.526663] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.13.0-rc4-00927-gebbe9dbd802c-dirty #36
> [  111.526670] Hardware name: NXP i.MX8MPlus EVK board (DT)
> [  111.526674] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO BTYPE=--)
> [  111.526681] pc : queued_spin_lock_slowpath+0x1a0/0x390
> [  111.526695] lr : _raw_spin_lock_irqsave+0x88/0xb4
> [  111.526703] sp : ffff800010003e20
> [  111.526706] x29: ffff800010003e20 x28: ffff00017f380180
> [  111.537156] buffer_io_error: 6 callbacks suppressed
> [  111.537162] Buffer I/O error on dev sda1, logical block 60040704, async page read
> [  111.539932]  x27: ffff00017f3801c0
> [  111.539938] x26: ffff800010ba2490 x25: 0000000000000000 x24: 0000000000000001
> [  111.543025] blk_update_request: I/O error, dev sda, sector 60061186 op 0x0:(READ) flags 0x0 phys_seg 7 prio class 0
> [  111.548304]
> [  111.548306] x23: 00000000000000c0 x22: ffff0000c2a9f184 x21: ffff00017f380180
> [  111.551374] Buffer I/O error on dev sda1, logical block 60040705, async page read
> [  111.554499]
> [  111.554503] x20: ffff0000c5f14210 x19: 00000000000000c0 x18: 0000000000000000
> [  111.557391] Buffer I/O error on dev sda1, logical block 60040706, async page read
> [  111.561218]
> [  111.561222] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [  111.564205] Buffer I/O error on dev sda1, logical block 60040707, async page read
> [  111.570887] x14: 00000000000000f5 x13: 0000000000000001 x12: 0000000000000040
> [  111.570902] x11: ffff0000c05ac6d8
> [  111.583420] Buffer I/O error on dev sda1, logical block 60040708, async page read
> [  111.588978]  x10: 0000000000000000 x9 : 0000000000040000
> [  111.588988] x8 : 0000000000000000
> [  111.597173] Buffer I/O error on dev sda1, logical block 60040709, async page read
> [  111.605766]  x7 : ffff00017f384880 x6 : ffff8000118cb880
> [  111.605777] x5 : ffff00017f384880
> [  111.611094] Buffer I/O error on dev sda1, logical block 60040710, async page read
> [  111.617086]  x4 : 0000000000000000 x3 : ffff0000c2a9f184
> [  111.617096] x2 : ffff8000118cb880
> [  111.622242] Buffer I/O error on dev sda1, logical block 60040711, async page read
> [  111.626927]  x1 : ffff8000118cb880 x0 : ffff00017f384888
> [  111.626938] Call trace:
> [  111.626942]  queued_spin_lock_slowpath+0x1a0/0x390
> [  111.795809]  kthread_queue_work+0x30/0xc0
> [  111.799828]  state_machine_timer_handler+0x20/0x30
> [  111.804624]  __hrtimer_run_queues+0x140/0x1e0
> [  111.808990]  hrtimer_interrupt+0xec/0x2c0
> [  111.813004]  arch_timer_handler_phys+0x38/0x50
> [  111.817456]  handle_percpu_devid_irq+0x88/0x150
> [  111.821991]  __handle_domain_irq+0x80/0xe0
> [  111.826093]  gic_handle_irq+0xc0/0x140
> [  111.829848]  el1_irq+0xbc/0x154
> [  111.832991]  arch_cpu_idle+0x1c/0x2c
> [  111.836572]  default_idle_call+0x24/0x6c
> [  111.840497]  do_idle+0x238/0x2ac
> [  111.843729]  cpu_startup_entry+0x2c/0x70
> [  111.847657]  rest_init+0xdc/0xec
> [  111.850890]  arch_call_rest_init+0x14/0x20
> [  111.854988]  start_kernel+0x508/0x540
> [  111.858659] Code: 910020e0 8b0200c2 f861d884 aa0203e1 (f8246827)
> [  111.864760] ---[ end trace 308b9a4a3dcb73ac ]---
> [  111.869381] Kernel panic - not syncing: Oops: Fatal exception in interrupt
> [  111.876258] SMP: stopping secondary CPUs
> [  111.880185] Kernel Offset: disabled
> [  111.883673] CPU features: 0x00001001,20000846
> [  111.888031] Memory Limit: none
> [  111.891090] ---[ end Kernel panic - not syncing: Oops: Fatal exception in interrupt ]---
> 
> Fixes: 3ed8e1c2ac99 ("usb: typec: tcpm: Migrate workqueue to RT priority for processing events")
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 0db685d5d9c0..f47685e7923d 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -6328,6 +6328,9 @@ void tcpm_unregister_port(struct tcpm_port *port)
>  {
>  	int i;
>  
> +	hrtimer_cancel(&port->vdm_state_machine_timer);
> +	hrtimer_cancel(&port->state_machine_timer);
> +
>  	tcpm_reset_port(port);
>  	for (i = 0; i < ARRAY_SIZE(port->port_altmode); i++)
>  		typec_unregister_altmode(port->port_altmode[i]);
> -- 
> 2.25.1
> 
