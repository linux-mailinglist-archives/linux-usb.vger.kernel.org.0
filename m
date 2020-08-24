Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1421724FC6F
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 13:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgHXLVP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 07:21:15 -0400
Received: from mga02.intel.com ([134.134.136.20]:54702 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726187AbgHXLVM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 07:21:12 -0400
IronPort-SDR: C90rIvJoEw8NPZUp9kdHHgb8F7h+1RQDsl49Pg593gTC9xdb8fNHxDCWuKDug46Qr6gh/bQ5q1
 PP963WTPMbsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="143655765"
X-IronPort-AV: E=Sophos;i="5.76,348,1592895600"; 
   d="scan'208";a="143655765"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2020 04:21:09 -0700
IronPort-SDR: Qe4wJjk0l6qTG5Echa7PFmWqTdaP7KaME0sMqJRMDaUyW8U1bawZNVrQy+xRlXi6DxXhMKPHPr
 fPyFSuEETRww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,348,1592895600"; 
   d="scan'208";a="402318672"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 24 Aug 2020 04:21:07 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 24 Aug 2020 14:21:06 +0300
Date:   Mon, 24 Aug 2020 14:21:06 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Zwane Mwaikambo <zwane@yosper.io>
Cc:     linux-usb@vger.kernel.org, zwanem@gmail.com
Subject: Re: [PATCH] Fix array overruns in ucsi.c partner_altmode[]
Message-ID: <20200824112106.GB189773@kuha.fi.intel.com>
References: <alpine.DEB.2.21.2008131842080.26061@montezuma.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2008131842080.26061@montezuma.home>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

The subject line should mention the subsystem:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format

On Thu, Aug 13, 2020 at 06:56:06PM -0700, Zwane Mwaikambo wrote:
> Plugging in a USB type C dock causes an Oops due to an array 
> overrun of ->partner_altmode[].
> 
> con->partner_altmode[i] ends up with the value 0x2 in the call and it's
> because the array has been accessed out of bounds resulting in random 
> contents of memory being checked. The patch was generated and tested 
> against 5.8.0-rc6.
> 
> 
> [  565.452023] BUG: kernel NULL pointer dereference, address: 00000000000002fe
> [  565.452025] #PF: supervisor read access in kernel mode
> [  565.452026] #PF: error_code(0x0000) - not-present page
> [  565.452026] PGD 0 P4D 0 
> [  565.452028] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [  565.452030] CPU: 0 PID: 502 Comm: kworker/0:3 Not tainted 5.8.0-rc3+ #1
> [  565.452031] Hardware name: LENOVO 20RD002VUS/20RD002VUS, 
> BIOS R16ET25W (1.11 ) 04/21/2020
> [  565.452034] Workqueue: events ucsi_handle_connector_change [typec_ucsi]
> [  565.452039] RIP: 0010:typec_altmode_update_active+0x1f/0x100 [typec]
> [  565.452040] Code: 0f 1f 84 00 00 00 00 00 0f 1f 00 0f 1f 44 00 00 55 48 
> 89 e5 41 54 53 48 83 ec 10 65 48 8b 04 25 28 00 00 00 48 89 45 e8 31 c0 
> <0f> b6 87 fc 02 00 00 83 e0 01 40 38 f0 0f 84 95 00 00 00 48 8b 47
> [  565.452041] RSP: 0018:ffffb729c066bdb0 EFLAGS: 00010246
> [  565.452042] RAX: 0000000000000000 RBX: ffffa067c3e64a70 RCX: 0000000000000000
> [  565.452043] RDX: ffffb729c066bd20 RSI: 0000000000000000 RDI: 0000000000000002
> [  565.452044] RBP: ffffb729c066bdd0 R08: 00000083a7910a4f R09: 0000000000000000
> [  565.452044] R10: ffffffffa106a220 R11: 0000000000000000 R12: 0000000000000000
> [  565.452045] R13: ffffa067c3e64a98 R14: ffffa067c3e64810 R15: ffffa067c3e64800
> [  565.452046] FS:  0000000000000000(0000) GS:ffffa067d1400000(0000)
> knlGS:0000000000000000
> [  565.452047] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  565.452048] CR2: 00000000000002fe CR3: 00000001b060a003 CR4: 00000000003606f0
> [  565.452048] Call Trace:
> [  565.452052]  ucsi_altmode_update_active+0x83/0xd0 [typec_ucsi]
> [  565.452054]  ucsi_handle_connector_change+0x1dc/0x320 [typec_ucsi]
> [  565.452057]  process_one_work+0x1df/0x3d0
> [  565.452059]  worker_thread+0x4d/0x3d0
> [  565.452060]  ? process_one_work+0x3d0/0x3d0
> [  565.452062]  kthread+0x127/0x170
> [  565.452063]  ? kthread_park+0x90/0x90
> [  565.452065]  ret_from_fork+0x1f/0x30
> 
> The failing instruction is;
> 
> 0x0000000000000380 <+0>:     callq  0x385 <typec_altmode_update_active+5>
> 0x0000000000000385 <+5>:     push   %rbp
> 0x0000000000000386 <+6>:     mov    %rsp,%rbp
> 0x0000000000000389 <+9>:     push   %r12
> 0x000000000000038b <+11>:    push   %rbx
> 0x000000000000038c <+12>:    sub    $0x10,%rsp
> 0x0000000000000390 <+16>:    mov    %gs:0x28,%rax
> 0x0000000000000399 <+25>:    mov    %rax,-0x18(%rbp)
> 0x000000000000039d <+29>:    xor    %eax,%eax
> 0x000000000000039f <+31>:    movzbl 0x2fc(%rdi),%eax <======
> 0x00000000000003a6 <+38>:    and    $0x1,%eax
> 
> (gdb) list  *typec_altmode_update_active+0x1f
> 0x39f is in typec_altmode_update_active (drivers/usb/typec/class.c:221).
> 216      */
> 217     void typec_altmode_update_active(struct typec_altmode *adev, bool active)
> 218     {
> 219             char dir[6];
> 220
> 221             if (adev->active == active)
> 222                     return;
> 223
> 224             if (!is_typec_port(adev->dev.parent) && adev->dev.driver) {
> 225                     if (!active)
> 
> (gdb) list *ucsi_altmode_update_active+0x83
> 0x12a3 is in ucsi_altmode_update_active (drivers/usb/typec/ucsi/ucsi.c:221).
> 216             }
> 217
> 218             if (cur < UCSI_MAX_ALTMODES)
> 219                     altmode = typec_altmode_get_partner(con->port_altmode[cur]);
> 220
> 221             for (i = 0; con->partner_altmode[i]; i++)
> 222                     typec_altmode_update_active(con->partner_altmode[i],
> 223                                                con->partner_altmode[i] == altmode);
> 224     }
> 
> This oops is for a similar array overrun in ucsi_unregister_altmodes
> 
> [ 4372.429633] usb 1-2.1.4: USB disconnect, device number 16
> [ 4372.523235] usb 1-2.2: USB disconnect, device number 7
> [ 4372.570537] usb 1-2.5: USB disconnect, device number 9
> [ 4373.153246] BUG: kernel NULL pointer dereference, address: 00000000000002f2
> [ 4373.153267] #PF: supervisor read access in kernel mode
> [ 4373.153271] #PF: error_code(0x0000) - not-present page
> [ 4373.153275] PGD 0 P4D 0 
> [ 4373.153284] Oops: 0000 [#2] PREEMPT SMP NOPTI
> [ 4373.153292] CPU: 0 PID: 13242 Comm: kworker/0:0 Tainted: G      D   
>         5.8.0-rc6+ #1
> [ 4373.153296] Hardware name: LENOVO 20RD002VUS/20RD002VUS, BIOS R16ET25W (1.11 )
>  04/21/2020
> [ 4373.153308] Workqueue: events ucsi_handle_connector_change [typec_ucsi]
> [ 4373.153320] RIP: 0010:ucsi_unregister_altmodes+0x5f/0xa0 [typec_ucsi]
> [ 4373.153326] Code: 54 48 8b 3b 41 83 c4 01 e8 9e f9 0c 00 49 63 c4 48 c7 
> 03 00 00 00 00 49 8d 5c c5 00 48 8b 3b 48 85 ff 74 31 41 80 fe 01 75 d7 
> <0f> b7 87 f0 02 00 00 66 3d 01 ff 74 0f 66 3d 55 09 75 c4 83 bf f8
> [ 4373.153332] RSP: 0018:ffffb2ef036b3dc8 EFLAGS: 00010246
> [ 4373.153338] RAX: 000000000000001e RBX: ffff94268b006a60 RCX: 0000000080800067
> [ 4373.153342] RDX: 0000000080800068 RSI: 0000000000000001 RDI: 0000000000000002
> [ 4373.153347] RBP: ffffb2ef036b3de8 R08: 0000000000000000 R09: ffffffff8dc65400
> [ 4373.153351] R10: ffff9426678d7200 R11: 0000000000000001 R12: 000000000000001e
> [ 4373.153355] R13: ffff94268b006970 R14: 0000000000000001 R15: ffff94268b006800
> [ 4373.153361] FS:  0000000000000000(0000) GS:ffff942691400000(0000)
> knlGS:0000000000000000
> [ 4373.153366] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 4373.153371] CR2: 00000000000002f2 CR3: 00000004445a6005 CR4: 00000000003606f0
> [ 4373.153375] Call Trace:
> [ 4373.153389]  ucsi_unregister_partner.part.0+0x17/0x30 [typec_ucsi]
> [ 4373.153400]  ucsi_handle_connector_change+0x25c/0x320 [typec_ucsi]
> [ 4373.153418]  process_one_work+0x1df/0x3d0
> [ 4373.153428]  worker_thread+0x4a/0x3d0
> [ 4373.153436]  ? process_one_work+0x3d0/0x3d0
> [ 4373.153444]  kthread+0x127/0x170
> [ 4373.153451]  ? kthread_park+0x90/0x90
> [ 4373.153461]  ret_from_fork+0x1f/0x30
> [ 4373.153661] CR2: 00000000000002f2
> 
> Signed-off-by: Zwane Mwaikambo <zwane@yosper.io>
> ---
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index d0c63afaf..79061705e 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -218,9 +218,10 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
>  	if (cur < UCSI_MAX_ALTMODES)
>  		altmode = typec_altmode_get_partner(con->port_altmode[cur]);
>  
> -	for (i = 0; con->partner_altmode[i]; i++)
> -		typec_altmode_update_active(con->partner_altmode[i],
> -					    con->partner_altmode[i] == altmode);
> +	for (i = 0; i < UCSI_MAX_ALTMODES; i++)
> +		if (con->partner_altmode[i])
> +			typec_altmode_update_active(con->partner_altmode[i],
> +										con->partner_altmode[i] == altmode);
>  }
>  
>  static u8 ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid)
> @@ -479,7 +480,10 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
>  		return;
>  	}
>  
> -	while (adev[i]) {
> +	for (i = 0; i < UCSI_MAX_ALTMODES; i++) {
> +		if (!adev[i])
> +			break;
> +

for (i = 0; adev[i]; i++)

>  		if (recipient == UCSI_RECIPIENT_SOP &&
>  		    (adev[i]->svid == USB_TYPEC_DP_SID ||
>  			(adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
> @@ -488,7 +492,7 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
>  			ucsi_displayport_remove_partner((void *)pdev);
>  		}
>  		typec_unregister_altmode(adev[i]);
> -		adev[i++] = NULL;
> +		adev[i] = NULL;
>  	}
>  }

So are the two fixes here? If so, then please supply one patch per
fix.


thanks,

-- 
heikki
