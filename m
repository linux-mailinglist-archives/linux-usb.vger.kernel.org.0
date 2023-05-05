Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3746F8321
	for <lists+linux-usb@lfdr.de>; Fri,  5 May 2023 14:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbjEEMjv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 08:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbjEEMjs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 08:39:48 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id D5F8719D5D
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 05:39:46 -0700 (PDT)
Received: (qmail 444470 invoked by uid 1000); 5 May 2023 08:39:46 -0400
Date:   Fri, 5 May 2023 08:39:46 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Maxime Bizon <mbizon@freebox.fr>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb-storage: fix deadlock when a scsi command timeouts
 more than once
Message-ID: <0adeb198-3b88-419b-9946-8797b79d84d7@rowland.harvard.edu>
References: <20230505114759.1189741-1-mbizon@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505114759.1189741-1-mbizon@freebox.fr>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 05, 2023 at 01:47:59PM +0200, Maxime Bizon wrote:
> With faulty usb-storage devices, read/write can timeout, in that case
> the SCSI layer will abort and re-issue the command. USB storage has no
> internal timeout, it relies on SCSI layer aborting commands via
> .eh_abort_handler() for non those responsive devices.
> 
> After two consecutive timeouts of the same command, SCSI layer calls
> .eh_device_reset_handler(), without calling .eh_abort_handler() first.
> 
> With usb-storage, this causes a deadlock:
> 
>   -> .eh_device_reset_handler
>     -> device_reset
>       -> mutex_lock(&(us->dev_mutex));
> 
> mutex already by usb_stor_control_thread(), which is waiting for
> command completion:
> 
>   -> usb_stor_control_thread (mutex taken here)
>     -> usb_stor_invoke_transport
>       -> usb_stor_Bulk_transport
>         -> usb_stor_bulk_srb
> 	  -> usb_stor_bulk_transfer_sglist
> 	    -> usb_sg_wait
> 
> Make sure we cancel any pending command in .eh_device_reset_handler()
> to avoid this.
> 
> Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: linux-usb@vger.kernel.org
> Link: https://lore.kernel.org/all/ZEllnjMKT8ulZbJh@sakura/
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/scsiglue.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
> index 8931df5a85fd..c54e9805da53 100644
> --- a/drivers/usb/storage/scsiglue.c
> +++ b/drivers/usb/storage/scsiglue.c
> @@ -406,22 +406,25 @@ static DEF_SCSI_QCMD(queuecommand)
>   ***********************************************************************/
>  
>  /* Command timeout and abort */
> -static int command_abort(struct scsi_cmnd *srb)
> +static int command_abort_matching(struct us_data *us, struct scsi_cmnd *srb_match)
>  {
> -	struct us_data *us = host_to_us(srb->device->host);
> -
> -	usb_stor_dbg(us, "%s called\n", __func__);
> -
>  	/*
>  	 * us->srb together with the TIMED_OUT, RESETTING, and ABORTING
>  	 * bits are protected by the host lock.
>  	 */
>  	scsi_lock(us_to_host(us));
>  
> -	/* Is this command still active? */
> -	if (us->srb != srb) {
> +	/* is there any active pending command to abort ? */
> +	if (!us->srb) {
>  		scsi_unlock(us_to_host(us));
>  		usb_stor_dbg(us, "-- nothing to abort\n");
> +		return SUCCESS;
> +	}
> +
> +	/* Does the command match the passed srb if any ? */
> +	if (srb_match && us->srb != srb_match) {
> +		scsi_unlock(us_to_host(us));
> +		usb_stor_dbg(us, "-- pending command mismatch\n");
>  		return FAILED;
>  	}
>  
> @@ -444,6 +447,14 @@ static int command_abort(struct scsi_cmnd *srb)
>  	return SUCCESS;
>  }
>  
> +static int command_abort(struct scsi_cmnd *srb)
> +{
> +	struct us_data *us = host_to_us(srb->device->host);
> +
> +	usb_stor_dbg(us, "%s called\n", __func__);
> +	return command_abort_matching(us, srb);
> +}
> +
>  /*
>   * This invokes the transport reset mechanism to reset the state of the
>   * device
> @@ -455,6 +466,9 @@ static int device_reset(struct scsi_cmnd *srb)
>  
>  	usb_stor_dbg(us, "%s called\n", __func__);
>  
> +	/* abort any pending command before reset */
> +	command_abort_matching(us, NULL);
> +
>  	/* lock the device pointers and do the reset */
>  	mutex_lock(&(us->dev_mutex));
>  	result = us->transport_reset(us);
> -- 
> 2.34.1
> 
