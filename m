Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD0F6AAAF2
	for <lists+linux-usb@lfdr.de>; Sat,  4 Mar 2023 16:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjCDPvr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Mar 2023 10:51:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCDPvq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Mar 2023 10:51:46 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 64D001E9F0
        for <linux-usb@vger.kernel.org>; Sat,  4 Mar 2023 07:51:45 -0800 (PST)
Received: (qmail 334178 invoked by uid 1000); 4 Mar 2023 10:51:44 -0500
Date:   Sat, 4 Mar 2023 10:51:44 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, Oliver Neukum <oneukum@suse.com>,
        linux-usb@vger.kernel.org, Oliver Neukum <oliver@neukum.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 80/81] usb: uas: Declare two host templates and host
 template pointers const
Message-ID: <4f80df61-98d4-4f27-a095-feea7f657d8f@rowland.harvard.edu>
References: <20230304003103.2572793-1-bvanassche@acm.org>
 <20230304003103.2572793-81-bvanassche@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230304003103.2572793-81-bvanassche@acm.org>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 03, 2023 at 04:31:02PM -0800, Bart Van Assche wrote:
> Improve source code documentation by constifying host templates that are
> not modified.
> 
> Cc: Oliver Neukum <oneukum@suse.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---

For the usb-storage parts:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/image/microtek.c | 2 +-
>  drivers/usb/storage/uas.c    | 2 +-
>  drivers/usb/storage/usb.c    | 2 +-
>  drivers/usb/storage/usb.h    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/image/microtek.c b/drivers/usb/image/microtek.c
> index 874ea4b54ced..8c8fa71c69c4 100644
> --- a/drivers/usb/image/microtek.c
> +++ b/drivers/usb/image/microtek.c
> @@ -620,7 +620,7 @@ static int mts_scsi_queuecommand_lck(struct scsi_cmnd *srb)
>  
>  static DEF_SCSI_QCMD(mts_scsi_queuecommand)
>  
> -static struct scsi_host_template mts_scsi_host_template = {
> +static const struct scsi_host_template mts_scsi_host_template = {
>  	.module			= THIS_MODULE,
>  	.name			= "microtekX6",
>  	.proc_name		= "microtekX6",
> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index de3836412bf3..2583ee9815c5 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c
> @@ -894,7 +894,7 @@ static int uas_slave_configure(struct scsi_device *sdev)
>  	return 0;
>  }
>  
> -static struct scsi_host_template uas_host_template = {
> +static const struct scsi_host_template uas_host_template = {
>  	.module = THIS_MODULE,
>  	.name = "uas",
>  	.queuecommand = uas_queuecommand,
> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
> index ed7c6ad96a74..7b36a3334fb3 100644
> --- a/drivers/usb/storage/usb.c
> +++ b/drivers/usb/storage/usb.c
> @@ -937,7 +937,7 @@ int usb_stor_probe1(struct us_data **pus,
>  		struct usb_interface *intf,
>  		const struct usb_device_id *id,
>  		const struct us_unusual_dev *unusual_dev,
> -		struct scsi_host_template *sht)
> +		const struct scsi_host_template *sht)
>  {
>  	struct Scsi_Host *host;
>  	struct us_data *us;
> diff --git a/drivers/usb/storage/usb.h b/drivers/usb/storage/usb.h
> index 0451fac1adce..fd3f32670873 100644
> --- a/drivers/usb/storage/usb.h
> +++ b/drivers/usb/storage/usb.h
> @@ -187,7 +187,7 @@ extern int usb_stor_probe1(struct us_data **pus,
>  		struct usb_interface *intf,
>  		const struct usb_device_id *id,
>  		const struct us_unusual_dev *unusual_dev,
> -		struct scsi_host_template *sht);
> +		const struct scsi_host_template *sht);
>  extern int usb_stor_probe2(struct us_data *us);
>  extern void usb_stor_disconnect(struct usb_interface *intf);
>  
