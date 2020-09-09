Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A32262E98
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 14:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730168AbgIIMex (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 08:34:53 -0400
Received: from mga18.intel.com ([134.134.136.126]:19338 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbgIIMea (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Sep 2020 08:34:30 -0400
IronPort-SDR: c3pKPumq1Z3l32v2yaxyXlfsAoMWvlhrBGBs/Zzn6BATiTbBmGKlK0a3tC9ZV5GROPhAB6avEC
 8O6rAX6Td9zQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="146034994"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="146034994"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 05:33:59 -0700
IronPort-SDR: YVJTxxldgfjht2lJ70U1M7S/TGap95fdFRjuF+rOOlDceSQFVHUVMEHVQVXuFQIhAHoRSXvDVK
 HUPATy5yW9Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="407436780"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Sep 2020 05:33:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 09 Sep 2020 15:33:55 +0300
Date:   Wed, 9 Sep 2020 15:33:55 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Zwane Mwaikambo <zwanem@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Zwane Mwaikambo <zwane@yosper.io>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 2/2] usb/typec: fix array overruns in ucsi.c
 partner_altmode[]
Message-ID: <20200909123355.GA3627076@kuha.fi.intel.com>
References: <alpine.DEB.2.21.2008271035320.30454@montezuma.home>
 <0013fe6c-c0a2-1759-c769-cda025e5eb38@infradead.org>
 <alpine.DEB.2.21.2008271058220.37762@montezuma.home>
 <alpine.DEB.2.21.2008271131570.37762@montezuma.home>
 <20200828123328.GF174928@kuha.fi.intel.com>
 <alpine.DEB.2.21.2008300220350.37231@montezuma.home>
 <alpine.DEB.2.21.2008300227240.37231@montezuma.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2008300227240.37231@montezuma.home>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

One nitpick below...

On Sun, Aug 30, 2020 at 02:28:39AM -0700, Zwane Mwaikambo wrote:
> This fixes the second array overrun occurrence (similar failure mode to 
> the first), this time in ucsi_unregister_altmodes.
> 
> [ 4373.153246] BUG: kernel NULL pointer dereference, address: 
> 00000000000002f2
> [ 4373.153267] #PF: supervisor read access in kernel mode
> [ 4373.153271] #PF: error_code(0x0000) - not-present page
> [ 4373.153275] PGD 0 P4D 0 
> [ 4373.153284] Oops: 0000 [#2] PREEMPT SMP NOPTI
> [ 4373.153292] CPU: 0 PID: 13242 Comm: kworker/0:0 Tainted: G      D           
> 5.8.0-rc6+ #1
> [ 4373.153296] Hardware name: LENOVO 20RD002VUS/20RD002VUS, BIOS R16ET25W 
> (1.11 ) 04/21/2020
> [ 4373.153308] Workqueue: events ucsi_handle_connector_change [typec_ucsi]
> [ 4373.153320] RIP: 0010:ucsi_unregister_altmodes+0x5f/0xa0 [typec_ucsi]
> [ 4373.153326] Code: 54 48 8b 3b 41 83 c4 01 e8 9e f9 0c 00 49 63 c4 48 c7 
> 03 00 00 00 00 49 8d 5c c5 00 48 8b 3b 48 85 ff 74 31 41 80 fe 01 75 d7 
> <0f> b7 87 f0 02 00 00 66 3d 01 ff 74 0f 66 3d 55 09 75 c4 83 bf f8
> [ 4373.153332] RSP: 0018:ffffb2ef036b3dc8 EFLAGS: 00010246
> [ 4373.153338] RAX: 000000000000001e RBX: ffff94268b006a60 RCX: 
> 0000000080800067
> [ 4373.153342] RDX: 0000000080800068 RSI: 0000000000000001 RDI: 
> 0000000000000002
> [ 4373.153347] RBP: ffffb2ef036b3de8 R08: 0000000000000000 R09: 
> ffffffff8dc65400
> [ 4373.153351] R10: ffff9426678d7200 R11: 0000000000000001 R12: 
> 000000000000001e
> [ 4373.153355] R13: ffff94268b006970 R14: 0000000000000001 R15: 
> ffff94268b006800
> [ 4373.153361] FS:  0000000000000000(0000) GS:ffff942691400000(0000) 
> knlGS:0000000000000000
> [ 4373.153366] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 4373.153371] CR2: 00000000000002f2 CR3: 00000004445a6005 CR4: 
> 00000000003606f0
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
> Fixes: ad74b8649beaf ("usb: typec: ucsi: Preliminary support for alternate modes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zwane Mwaikambo <zwane@yosper.io>
> ---
> v2 addresses both instances of array overrun
> v3 addresses patch submission/formatting issues
> v4 addresses patch submission/formatting issues
> v5 adds and cc to stable
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index d0c63afaf..79061705e 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -479,7 +480,10 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
>  		return;
>  	}
>  
> -	while (adev[i]) {
> +	for (i = 0; i < UCSI_MAX_ALTMODES; i++) {
> +		if (!adev[i])
> +			break;

        for (i = 0; i < UCSI_MAX_ALTMODES && adev[u]; i++) {

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
>  

thanks,

-- 
heikki
