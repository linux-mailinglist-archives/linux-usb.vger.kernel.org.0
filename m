Return-Path: <linux-usb+bounces-3878-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8666180924A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 21:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7A0B1C20AF9
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 20:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C1551009;
	Thu,  7 Dec 2023 20:28:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 007C910F9
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 12:28:36 -0800 (PST)
Received: (qmail 18693 invoked by uid 1000); 7 Dec 2023 15:28:36 -0500
Date: Thu, 7 Dec 2023 15:28:36 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Tasos Sahanidis <tasos@tasossah.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
  martin.petersen@oracle.com
Subject: Re: [PATCH] usb-storage: Add quirk for incorrect WP on Kingston DT
 Ultimate 3.0 G3
Message-ID: <1d2cb947-8fb2-43e7-83bf-4386df35badd@rowland.harvard.edu>
References: <20231207134441.298131-1-tasos@tasossah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207134441.298131-1-tasos@tasossah.com>

On Thu, Dec 07, 2023 at 03:44:41PM +0200, Tasos Sahanidis wrote:
> This flash drive reports write protect during the first mode sense.
> 
> In the past this was not an issue as the kernel called revalidate twice,
> thus asking the device for its write protect status twice, with write
> protect being disabled in the second mode sense.
> 
> However, since commit 1e029397d12f ("scsi: sd: Reorganize DIF/DIX code to
> avoid calling revalidate twice") that is no longer the case, thus the
> device shows up read only.
> 
> [490891.289495] sd 12:0:0:0: [sdl] Write Protect is on
> [490891.289497] sd 12:0:0:0: [sdl] Mode Sense: 2b 00 80 08
> 
> This does not appear to be a timing issue, as enabling the usbcore quirk
> USB_QUIRK_DELAY_INIT has no effect on write protect.
> 
> Fixes: 1e029397d12f ("scsi: sd: Reorganize DIF/DIX code to avoid calling revalidate twice")
> Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/unusual_devs.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index 20dcbccb290b..fd68204374f2 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -1305,6 +1305,17 @@ UNUSUAL_DEV(  0x090c, 0x6000, 0x0100, 0x0100,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_INITIAL_READ10 ),
>  
> +/*
> + * Patch by Tasos Sahanidis <tasos@tasossah.com>
> + * This flash drive always shows up with write protect enabled
> + * during the first mode sense.
> + */
> +UNUSUAL_DEV(0x0951, 0x1697, 0x0100, 0x0100,
> +		"Kingston",
> +		"DT Ultimate G3",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_WP_DETECT),
> +
>  /*
>   * This Pentax still camera is not conformant
>   * to the USB storage specification: -
> -- 
> 2.25.1
> 

