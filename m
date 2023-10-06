Return-Path: <linux-usb+bounces-1216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C377BBF63
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 20:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6746B28218A
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 18:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B7B38FB8;
	Fri,  6 Oct 2023 18:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C30328C3
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 18:57:22 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 5CB0DFA
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 11:57:19 -0700 (PDT)
Received: (qmail 54422 invoked by uid 1000); 6 Oct 2023 14:57:18 -0400
Date: Fri, 6 Oct 2023 14:57:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Milan Broz <gmazyland@gmail.com>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
  linux-scsi@vger.kernel.org, linux-block@vger.kernel.org, oneukum@suse.com,
  jonathan.derrick@linux.dev
Subject: Re: [RFC PATCH 6/6] usb-storage,uas: Disable security commands
 (OPAL) for RT9210 chip family
Message-ID: <e9aad1d3-1aa1-4f09-955f-6d9f6f604600@rowland.harvard.edu>
References: <20231006125445.122380-1-gmazyland@gmail.com>
 <20231006125445.122380-7-gmazyland@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006125445.122380-7-gmazyland@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Oct 06, 2023 at 02:54:45PM +0200, Milan Broz wrote:
> Realtek 9210 family (NVME to USB bridge) adapters always set
> the write-protected bit for the whole drive if an OPAL locking range
> is defined (even if the OPAL locking range just covers part of the disk).
> 
> The only way to recover is PSID reset and physical reconnection of the device.
> 
> This looks like a wrong implementation of OPAL standard (and I will try
> to report it to Realtek as it happens for all firmware versions I have),
> but for now, these adapters are unusable for OPAL.
> 
> Signed-off-by: Milan Broz <gmazyland@gmail.com>
> ---
>  drivers/usb/storage/unusual_devs.h | 11 +++++++++++
>  drivers/usb/storage/unusual_uas.h  | 11 +++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index 20dcbccb290b..b7c0df180e5d 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -1476,6 +1476,17 @@ UNUSUAL_DEV( 0x0bc2, 0x3332, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_WP_DETECT ),
>  
> +/*
> + * Realtek 9210 family set global write-protection flag
> + * for any OPAL locking range making device unusable
> + * Reported-by: Milan Broz <gmazyland@gmail.com>
> + */
> +UNUSUAL_DEV( 0x0bda, 0x9210, 0x0000, 0xffff,
> +		"Realtek",
> +		"",

Doesn't Realtek have some sort of product name you can put here?

> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_OPAL),
> +
>  UNUSUAL_DEV(  0x0d49, 0x7310, 0x0000, 0x9999,
>  		"Maxtor",
>  		"USB to SATA",
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 1f8c9b16a0fb..71ab824bfb32 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -185,3 +185,14 @@ UNUSUAL_DEV(0x4971, 0x8024, 0x0000, 0x9999,
>  		"External HDD",
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_ALWAYS_SYNC),
> +
> +/*
> + * Realtek 9210 family set global write-protection flag
> + * for any OPAL locking range making device unusable
> + * Reported-by: Milan Broz <gmazyland@gmail.com>
> + */
> +UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0xffff,
> +		"Realtek",
> +		"",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_OPAL),

This entry is not in the right position.  The file is supposed to be 
sorted by vendor ID, then product ID.

Alan Stern

