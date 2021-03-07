Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510083302DC
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 17:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbhCGQCk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 11:02:40 -0500
Received: from netrider.rowland.org ([192.131.102.5]:37741 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232390AbhCGQC3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Mar 2021 11:02:29 -0500
Received: (qmail 104315 invoked by uid 1000); 7 Mar 2021 11:02:28 -0500
Date:   Sun, 7 Mar 2021 11:02:28 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Aaron Dewes <aaron.dewes@web.de>
Cc:     hdegoede@redhat.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] Add unusal uas devices reported by Umbrel users
Message-ID: <20210307160228.GC103559@rowland.harvard.edu>
References: <20210307154124.41651-1-aaron.dewes@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307154124.41651-1-aaron.dewes@web.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 07, 2021 at 04:41:24PM +0100, Aaron Dewes wrote:
> This patch adds more unusual UAS devices.
> All these devices were reported by users of Umbrel,
> and applying this patch fixed the issues.
> 
> Signed-off-by: Aaron Dewes <aaron.dewes@web.de>
> ---
>  drivers/usb/storage/unusual_uas.h | 70 +++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index f9677a5ec31b..a67ed2b527fa 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -28,6 +28,27 @@
>   * and don't forget to CC: the USB development list <linux-usb@vger.kernel.org>
>   */
> 
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x04e8, 0x4001, 0x0000, 0x9999,
> +		"Samsung",
> +		"SSD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),

With the IGNORE_UAS flag set, the uas driver will ignore these
devices.  In particular, it will ignore the NO_REPORT_OPCODES flag.
So there's no reason to put that flag in these new entries.

Alan Stern
