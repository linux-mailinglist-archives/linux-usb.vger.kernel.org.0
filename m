Return-Path: <linux-usb+bounces-1213-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FB17BBDDE
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 19:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 130631C209EE
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 17:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C31328CA;
	Fri,  6 Oct 2023 17:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DB828DCF
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 17:36:00 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 43A33AD
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 10:35:57 -0700 (PDT)
Received: (qmail 52300 invoked by uid 1000); 6 Oct 2023 13:35:56 -0400
Date: Fri, 6 Oct 2023 13:35:56 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Milan Broz <gmazyland@gmail.com>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
  linux-scsi@vger.kernel.org, linux-block@vger.kernel.org, oneukum@suse.com,
  jonathan.derrick@linux.dev
Subject: Re: [RFC PATCH 3/6] usb-storage: use fflags index only in
 usb-storage driver
Message-ID: <a81f4e04-fecf-4e04-9253-5dedec20c580@rowland.harvard.edu>
References: <20231006125445.122380-1-gmazyland@gmail.com>
 <20231006125445.122380-4-gmazyland@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006125445.122380-4-gmazyland@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Oct 06, 2023 at 02:54:42PM +0200, Milan Broz wrote:
> This patch adds a parameter to use driver_info translation function
> (which will be defined in the following patch).
> 
> Only USB storage driver will use it, as other drivers do not need
> more than 32-bit quirk flags.
> 
> Signed-off-by: Milan Broz <gmazyland@gmail.com>
> ---

Apart from the one issue noted below,

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
> index d1ad6a2509ab..72b48b94aa5f 100644
> --- a/drivers/usb/storage/usb.c
> +++ b/drivers/usb/storage/usb.c
> @@ -574,7 +574,7 @@ EXPORT_SYMBOL_GPL(usb_stor_adjust_quirks);
>  
>  /* Get the unusual_devs entries and the string descriptors */
>  static int get_device_info(struct us_data *us, const struct usb_device_id *id,
> -		const struct us_unusual_dev *unusual_dev)
> +		const struct us_unusual_dev *unusual_dev, int fflags_use_index)
>  {
>  	struct usb_device *dev = us->pusb_dev;
>  	struct usb_interface_descriptor *idesc =
> @@ -590,6 +590,7 @@ static int get_device_info(struct us_data *us, const struct usb_device_id *id,
>  			idesc->bInterfaceProtocol :
>  			unusual_dev->useTransport;
>  	us->fflags = id->driver_info;
> +
>  	usb_stor_adjust_quirks(us->pusb_dev, &us->fflags);
>  
>  	if (us->fflags & US_FL_IGNORE_DEVICE) {

Extraneous whitespace change.  This doesn't belong in the patch.

Alan Stern

