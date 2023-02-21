Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB98269E166
	for <lists+linux-usb@lfdr.de>; Tue, 21 Feb 2023 14:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbjBUNgv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Feb 2023 08:36:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbjBUNgv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Feb 2023 08:36:51 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA10E23334
        for <linux-usb@vger.kernel.org>; Tue, 21 Feb 2023 05:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676986609; x=1708522609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zQ7onYGUpxBwTvek1OzzRATE7OOcqXUeplQh1YFN5uo=;
  b=KqqWGVx3Bel4At1QuewhZn3DqSj+wGSCklfB/ysVDGqP+BzrT0LY++Gv
   UXvJYOKyoduRK5n3CVVVImuEe9tUqCKlaG89g8VY/VQ/Z0f3LZMWuUt2i
   g5HIxg12ba3EMStfITFj0h2gtgO0CSNk+T0qqkaY+F5PEdI86LyPiMP6a
   s5XSnuI6eXqGwga/GbPUjBjXvrTCzshW8kLPzZx8UNh3mREiioxqiHiEx
   rz7+Rq8V7DAdDoNTi6+Mfx06udVBfWG8KrL2DOBFJjUhzEviCv7Gp0X6m
   DLW4vNY36EJKBojaoAgrTcbpsyG7v0tncG7BhNvZBbH4cMu+L5R0u9g8j
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="320762301"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="320762301"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 05:36:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="814507785"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="814507785"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Feb 2023 05:36:46 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 21 Feb 2023 15:36:45 +0200
Date:   Tue, 21 Feb 2023 15:36:45 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: typec: tcpm: fix warning when handle
 discover_identity message
Message-ID: <Y/TI7bPbAe2w+6Rs@kuha.fi.intel.com>
References: <20230216031515.4151117-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216031515.4151117-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 16, 2023 at 11:15:15AM +0800, Xu Yang wrote:
> Since both source and sink device can send discover_identity message in
> PD3, kernel may dump below warning:
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 169 at drivers/usb/typec/tcpm/tcpm.c:1446 tcpm_queue_vdm+0xe0/0xf0
> Modules linked in:
> CPU: 0 PID: 169 Comm: 1-0050 Not tainted 6.1.1-00038-g6a3c36cf1da2-dirty #567
> Hardware name: NXP i.MX8MPlus EVK board (DT)
> pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : tcpm_queue_vdm+0xe0/0xf0
> lr : tcpm_queue_vdm+0x2c/0xf0
> sp : ffff80000c19bcd0
> x29: ffff80000c19bcd0 x28: 0000000000000001 x27: ffff0000d11c8ab8
> x26: ffff0000d11cc000 x25: 0000000000000000 x24: 00000000ff008081
> x23: 0000000000000001 x22: 00000000ff00a081 x21: ffff80000c19bdbc
> x20: 0000000000000000 x19: ffff0000d11c8080 x18: ffffffffffffffff
> x17: 0000000000000000 x16: 0000000000000000 x15: ffff0000d716f580
> x14: 0000000000000001 x13: ffff0000d716f507 x12: 0000000000000001
> x11: 0000000000000000 x10: 0000000000000020 x9 : 00000000000ee098
> x8 : 00000000ffffffff x7 : 000000000000001c x6 : ffff0000d716f580
> x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> x2 : ffff80000c19bdbc x1 : 00000000ff00a081 x0 : 0000000000000004
> Call trace:
> tcpm_queue_vdm+0xe0/0xf0
> tcpm_pd_rx_handler+0x340/0x1ab0
> kthread_worker_fn+0xcc/0x18c
> kthread+0x10c/0x110
> ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> 
> Below sequences may trigger this warning:
> 
> tcpm_send_discover_work(work)
>   tcpm_send_vdm(port, USB_SID_PD, CMD_DISCOVER_IDENT, NULL, 0);
>    tcpm_queue_vdm(port, header, data, count);
>     port->vdm_state = VDM_STATE_READY;
> 
> vdm_state_machine_work(work);
> 			<-- received discover_identity from partner
>  vdm_run_state_machine(port);
>   port->vdm_state = VDM_STATE_SEND_MESSAGE;
>    mod_vdm_delayed_work(port, x);
> 
> tcpm_pd_rx_handler(work);
>  tcpm_pd_data_request(port, msg);
>   tcpm_handle_vdm_request(port, msg->payload, cnt);
>    tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
> --> WARN_ON(port->vdm_state > VDM_STATE_DONE);
> 
> For this case, the state machine could still send out discover
> identity message later if we skip current discover_identity message.
> So we should handle the received message firstly and override the pending
> discover_identity message without warning in this case. Then, a delayed
> send_discover work will send discover_identity message again.
> 
> Fixes: e00943e91678 ("usb: typec: tcpm: PD3.0 sinks can send Discover Identity even in device mode")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changelogs:
> v2: modify some code format and commit message
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 7f39cb9b3429..1ee774c263f0 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1445,10 +1445,18 @@ static int tcpm_ams_start(struct tcpm_port *port, enum tcpm_ams ams)
>  static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>  			   const u32 *data, int cnt)
>  {
> +	u32 vdo_hdr = port->vdo_data[0];
> +
>  	WARN_ON(!mutex_is_locked(&port->lock));
>  
> -	/* Make sure we are not still processing a previous VDM packet */
> -	WARN_ON(port->vdm_state > VDM_STATE_DONE);
> +	/* If is sending discover_identity, handle received message first */
> +	if (PD_VDO_SVDM(vdo_hdr) && PD_VDO_CMD(vdo_hdr) == CMD_DISCOVER_IDENT) {
> +		port->send_discover = true;
> +		mod_send_discover_delayed_work(port, SEND_DISCOVER_RETRY_MS);
> +	} else {
> +		/* Make sure we are not still processing a previous VDM packet */
> +		WARN_ON(port->vdm_state > VDM_STATE_DONE);
> +	}
>  
>  	port->vdo_count = cnt + 1;
>  	port->vdo_data[0] = header;
> @@ -1948,11 +1956,13 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  			switch (PD_VDO_CMD(vdo_hdr)) {
>  			case CMD_DISCOVER_IDENT:
>  				res = tcpm_ams_start(port, DISCOVER_IDENTITY);
> -				if (res == 0)
> +				if (res == 0) {
>  					port->send_discover = false;
> -				else if (res == -EAGAIN)
> +				} else if (res == -EAGAIN) {
> +					port->vdo_data[0] = 0;
>  					mod_send_discover_delayed_work(port,
>  								       SEND_DISCOVER_RETRY_MS);
> +				}
>  				break;
>  			case CMD_DISCOVER_SVID:
>  				res = tcpm_ams_start(port, DISCOVER_SVIDS);
> @@ -2035,6 +2045,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  			unsigned long timeout;
>  
>  			port->vdm_retries = 0;
> +			port->vdo_data[0] = 0;
>  			port->vdm_state = VDM_STATE_BUSY;
>  			timeout = vdm_ready_timeout(vdo_hdr);
>  			mod_vdm_delayed_work(port, timeout);
> -- 
> 2.34.1

-- 
heikki
