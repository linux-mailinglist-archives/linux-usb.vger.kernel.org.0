Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91E1377621F
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 16:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjHIOMU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Aug 2023 10:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjHIOMT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Aug 2023 10:12:19 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id D7FED1FC2
        for <linux-usb@vger.kernel.org>; Wed,  9 Aug 2023 07:12:18 -0700 (PDT)
Received: (qmail 197637 invoked by uid 1000); 9 Aug 2023 10:12:18 -0400
Date:   Wed, 9 Aug 2023 10:12:18 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com
Subject: Re: [PATCH] usb: host: ehci-sched: try to turn on io watchdog as
 long as periodic_count > 0
Message-ID: <2776e1bb-cc83-43e5-b8c9-c3e908e7e2f1@rowland.harvard.edu>
References: <20230809065327.952368-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809065327.952368-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 09, 2023 at 02:53:27PM +0800, Xu Yang wrote:
> If initially isoc_count = 0, periodic_count > 0 and the io watchdog is
> not started (e.g. just timed out), then the io watchdog may not run after
> submitting isoc urbs and enable_periodic(). The isoc urbs may not complete
> forever if the controller had already stopped periodic schedule.
> 
> This will try to call turn_on_io_watchdog() for each enable_periodic() to
> ensure the io watchdog functions properly.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/host/ehci-sched.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
> index bd542b6fc46b..7e834587e7de 100644
> --- a/drivers/usb/host/ehci-sched.c
> +++ b/drivers/usb/host/ehci-sched.c
> @@ -490,13 +490,14 @@ static int tt_no_collision(
>  static void enable_periodic(struct ehci_hcd *ehci)
>  {
>  	if (ehci->periodic_count++)
> -		return;
> +		goto out;
>  
>  	/* Stop waiting to turn off the periodic schedule */
>  	ehci->enabled_hrtimer_events &= ~BIT(EHCI_HRTIMER_DISABLE_PERIODIC);
>  
>  	/* Don't start the schedule until PSS is 0 */
>  	ehci_poll_PSS(ehci);
> +out:
>  	turn_on_io_watchdog(ehci);
>  }

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
