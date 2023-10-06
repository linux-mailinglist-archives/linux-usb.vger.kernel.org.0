Return-Path: <linux-usb+bounces-1215-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 899B77BBF16
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 20:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B60E01C2096F
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 18:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2900B38FB2;
	Fri,  6 Oct 2023 18:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA93926E04
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 18:53:41 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id AD7B71A7
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 11:53:39 -0700 (PDT)
Received: (qmail 54323 invoked by uid 1000); 6 Oct 2023 14:53:38 -0400
Date: Fri, 6 Oct 2023 14:53:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Milan Broz <gmazyland@gmail.com>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
  linux-scsi@vger.kernel.org, linux-block@vger.kernel.org, oneukum@suse.com,
  jonathan.derrick@linux.dev
Subject: Re: [RFC PATCH 5/6] usb-storage,uas,scsi: allow to pass through
 security commands (OPAL)
Message-ID: <2a6a819a-899d-4431-95ef-cbf3c75a49e7@rowland.harvard.edu>
References: <20231006125445.122380-1-gmazyland@gmail.com>
 <20231006125445.122380-6-gmazyland@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006125445.122380-6-gmazyland@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Oct 06, 2023 at 02:54:44PM +0200, Milan Broz wrote:
> This patch enables pass-through OPAL command for USB-attached storage
> (which does not support UAS or SCSI security commands).
> All common USB/SATA or USB/NVMe adapters I tested need this patch.
> 
> USB mass storage devices that do not support SECURITY IN/OUT SCSI
> commands can support ATA12 pass-thru command.
> 
> Internal kernel implementation for OPAL interface currently supports
> only SCSI SECURITY IN/OUT wrapper.
> USB mass storage also turns off SCSI command enumeration, so SECURITY
> IN/OUT in the SCSI layer will be disabled.
> 
> Note: sedutils and some other OPAL tools already use ATA-12 pass-thru.
> 
> This patch
>  - enables SCSI security flag for USB mass storage and UAS device by default.
> 
>  - adds an optional wrapper to the SCSI layer for the ATA-12 pass-thru
>    command as an alternative if SECURITY IN/OUT is unavailable.
> 
> In short, the patch runs these steps:
>   1) USB drives (mass-storage, UAS) enables security driver flag by default
>      if not disabled by quirk
>   2) SCSI device enumerates SECURITY IN/OUT support. If detected,
>      SECURITY ON/OUT wrapper is used (as in the current code).
>      If not, new ATA12 pass-thru wrapper is used instead.
>   3) SED OPAL code tries OPAL discovery command for device. If it receives
>      correct reply, OPAL is enabled for the device.
> 
> With the changes above, the TCG OPAL support works with USB adapters
> that support the ATA-12 command. As kernel OPAL code runs discover
> commands on initialization, on devices that do not support pass-through,
> OPAL remains disabled.

You don't explicitly mention what will happen with devices that don't 
support ATA-passthrough.  Presumably the ATA12 commands will simply be 
rejected and OPAL will not be enabled.

> The patch also adds a quirk flag to disable security commands for particular
> devices if firmware is buggy.
> 
> Signed-off-by: Milan Broz <gmazyland@gmail.com>
> ---

I think it might be better to split this into two patches: One adding 
the security driver flag in the USB drivers and one for the SCSI changes 
-- those can be added separately through the SCSI tree after the USB 
changes have been merged.

I'm not going to try to review the SCSI changes.

> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
> index f3a53c3eeb45..04211ac803e4 100644
> --- a/drivers/usb/storage/usb.c
> +++ b/drivers/usb/storage/usb.c
> @@ -478,7 +478,7 @@ void usb_stor_adjust_quirks(struct usb_device *udev, u64 *fflags)
>  			US_FL_INITIAL_READ10 | US_FL_WRITE_CACHE |
>  			US_FL_NO_ATA_1X | US_FL_NO_REPORT_OPCODES |
>  			US_FL_MAX_SECTORS_240 | US_FL_NO_REPORT_LUNS |
> -			US_FL_ALWAYS_SYNC);
> +			US_FL_ALWAYS_SYNC | US_FL_IGNORE_OPAL);
>  
>  	p = quirks;
>  	while (*p) {
> @@ -567,6 +567,9 @@ void usb_stor_adjust_quirks(struct usb_device *udev, u64 *fflags)
>  		case 'y':
>  			f |= US_FL_ALWAYS_SYNC;
>  			break;
> +		case 'z':
> +			f |= US_FL_IGNORE_OPAL;
> +			break;
>  		/* Ignore unrecognized flag characters */
>  		}
>  	}

You need to add a corresponding entry to the usb-storage.quirks entry in 
Documentation/admin-guide/kernel-parameters.txt.

Alan Stern

