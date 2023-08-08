Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA658773EB7
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 18:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbjHHQex (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 12:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232957AbjHHQeA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 12:34:00 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id DD2224C3A
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 08:52:19 -0700 (PDT)
Received: (qmail 162593 invoked by uid 1000); 8 Aug 2023 11:25:03 -0400
Date:   Tue, 8 Aug 2023 11:25:03 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com
Subject: Re: [PATCH 1/2] usb: ehci: add workaround for chipidea PORTSC.PEC bug
Message-ID: <b0e64bd2-b4fa-4570-97ed-c2ab5898ede5@rowland.harvard.edu>
References: <20230808102959.479264-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808102959.479264-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 08, 2023 at 06:29:58PM +0800, Xu Yang wrote:
> Some NXP processor using chipidea IP has a bug when frame babble is
> detected.
> 
> As per 4.15.1.1.1 Serial Bus Babble:
>   A babble condition also exists if IN transaction is in progress at
> High-speed SOF2 point. This is called frame balle. The host controller

s/balle/babble/

> must disable the port to which the frame babble is detected.
> 
> The USB controller has disabled the port (PE cleared) and has asserted
> USBERRINT when frame babble is detected, but PEC is not asserted.
> Therefore, the SW didn't aware that port has been disabled. Then the

s/didn't/isn't/

> SW keeps sending packets to this port, but all of the transfers will
> fail.
> 
> This workaround will firstly assert PCD by SW when USBERRINT is detected
> and then judge whether port change has really occurred or not by polling
> roothub status. Because the PEC doesn't get asserted in our case, this
> patch will also assert it by SW when specific conditions are satisfied.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/host/ehci-hcd.c |  5 +++++
>  drivers/usb/host/ehci-hub.c | 10 +++++++++-
>  drivers/usb/host/ehci.h     | 10 ++++++++++
>  3 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> index a1930db0da1c..d6b276c354db 100644
> --- a/drivers/usb/host/ehci-hcd.c
> +++ b/drivers/usb/host/ehci-hcd.c
> @@ -762,6 +762,11 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
>  		bh = 1;
>  	}
>  
> +	/* Force to check port status */
> +	if (ehci->has_ci_pec_bug && (status & STS_ERR)
> +			&& !(status & STS_PCD))
> +		status |= STS_PCD;

Suggestion for minor improvement: First, you don't really need the 
(status & STS_PCD) test, because if the bit is already set then turning 
it again on won't matter.  Second, after that test has been removed you 
can merge this code with the INCR(ehci->stats.error) line above, 
removing the (status & STS_ERR) test.

The rest of the patch looks okay.

Alan Stern
