Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE7C74CD3CC
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 12:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237597AbiCDLxR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 06:53:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234628AbiCDLxQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 06:53:16 -0500
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A5A1DA6A;
        Fri,  4 Mar 2022 03:52:27 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 3149CE01B2;
        Fri,  4 Mar 2022 03:52:27 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7O4kloNyIJsJ; Fri,  4 Mar 2022 03:52:26 -0800 (PST)
Message-ID: <4c1f1852832843198945fdb9ed01d90190a31b81.camel@puri.sm>
Subject: Re: [PATCH] usb: xhci: make XHCI_STOP_EP_CMD_TIMEOUT a module
 parameter
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     kernel@puri.sm, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 04 Mar 2022 12:52:22 +0100
In-Reply-To: <20220304113057.1477958-1-martin.kepplinger@puri.sm>
References: <20220304113057.1477958-1-martin.kepplinger@puri.sm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, dem 04.03.2022 um 12:30 +0100 schrieb Martin Kepplinger:
> On the Librem 5 imx8mq system we've seen the stop endpoint command
> time out regularly which results in the hub dying.

sorry this is pretty useless information. We see this on an internal
USB2642 USB 2.0 Hub by Microchip.

> 
> While on the one hand we see "Port resume timed out, port 1-1: 0xfe3"
> before this and on the other hand driver-comments suggest that the
> driver
> might be able to recover instead of dying here, Sarah seemed to have
> a
> workaround for this particulator problem in mind already:
> 
> Make it a module parameter. So while it might not be the root cause
> for
> the problem, do this to give users a workaround.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  drivers/usb/host/xhci-ring.c | 2 +-
>  drivers/usb/host/xhci.c      | 8 +++++++-
>  drivers/usb/host/xhci.h      | 3 +--
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-
> ring.c
> index d0b6806275e0..e631d408e6b2 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -1133,7 +1133,7 @@ static void xhci_handle_cmd_stop_ep(struct
> xhci_hcd *xhci, int slot_id,
>                                 xhci_stop_watchdog_timer_in_irq(xhci,
> ep);
>  
>                         mod_timer(&ep->stop_cmd_timer,
> -                                 jiffies + XHCI_STOP_EP_CMD_TIMEOUT
> * HZ);
> +                                 jiffies + xhci->stop_ep_cmd_timeout
> * HZ);
>                         xhci_queue_stop_endpoint(xhci, command,
> slot_id, ep_index, 0);
>                         xhci_ring_cmd_db(xhci);
>  
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index a1c781f70d02..37fd05e75dcf 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -37,6 +37,11 @@ static unsigned long long quirks;
>  module_param(quirks, ullong, S_IRUGO);
>  MODULE_PARM_DESC(quirks, "Bit flags for quirks to be enabled as
> default");
>  
> +static unsigned int stop_ep_cmd_timeout = 5;
> +module_param(stop_ep_cmd_timeout, uint, S_IRUGO | S_IWUSR);
> +MODULE_PARM_DESC(stop_ep_cmd_timeout,
> +                "Stop endpoint command timeout (secs) for URB cancel
> watchdog. default=5");
> +
>  static bool td_on_ring(struct xhci_td *td, struct xhci_ring *ring)
>  {
>         struct xhci_segment *seg = ring->first_seg;
> @@ -1849,7 +1854,7 @@ static int xhci_urb_dequeue(struct usb_hcd
> *hcd, struct urb *urb, int status)
>                 }
>                 ep->ep_state |= EP_STOP_CMD_PENDING;
>                 ep->stop_cmd_timer.expires = jiffies +
> -                       XHCI_STOP_EP_CMD_TIMEOUT * HZ;
> +                       xhci->stop_ep_cmd_timeout * HZ;
>                 add_timer(&ep->stop_cmd_timer);
>                 xhci_queue_stop_endpoint(xhci, command, urb->dev-
> >slot_id,
>                                          ep_index, 0);
> @@ -5288,6 +5293,7 @@ int xhci_gen_setup(struct usb_hcd *hcd,
> xhci_get_quirks_t get_quirks)
>                 xhci->hcc_params2 = readl(&xhci->cap_regs-
> >hcc_params2);
>  
>         xhci->quirks |= quirks;
> +       xhci->stop_ep_cmd_timeout = stop_ep_cmd_timeout;
>  
>         get_quirks(dev, xhci);
>  
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 8a0026ee9524..80c9ced4a276 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1674,8 +1674,6 @@ struct urb_priv {
>  #define        ERST_NUM_SEGS   1
>  /* Poll every 60 seconds */
>  #define        POLL_TIMEOUT    60
> -/* Stop endpoint command timeout (secs) for URB cancellation
> watchdog timer */
> -#define XHCI_STOP_EP_CMD_TIMEOUT       5
>  /* XXX: Make these module parameters */
>  
>  struct s3_save {
> @@ -1899,6 +1897,7 @@ struct xhci_hcd {
>  #define XHCI_BROKEN_D3COLD     BIT_ULL(41)
>  #define XHCI_EP_CTX_BROKEN_DCS BIT_ULL(42)
>  
> +       unsigned int            stop_ep_cmd_timeout;
>         unsigned int            num_active_eps;
>         unsigned int            limit_active_eps;
>         struct xhci_port        *hw_ports;


