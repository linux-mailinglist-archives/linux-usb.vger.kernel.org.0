Return-Path: <linux-usb+bounces-3266-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 574827F6619
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 19:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB341B212DC
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 18:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4762F4B5D5;
	Thu, 23 Nov 2023 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id D0835D65
	for <linux-usb@vger.kernel.org>; Thu, 23 Nov 2023 10:17:05 -0800 (PST)
Received: (qmail 9883 invoked by uid 1000); 23 Nov 2023 13:17:03 -0500
Date: Thu, 23 Nov 2023 13:17:03 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, tj@kernel.org,
  rdunlap@infradead.org, paulmck@kernel.org, linux-doc@vger.kernel.org,
  linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
  erosca@de.adit-jv.com, Martin.Mueller5@de.bosch.com
Subject: Re: [PATCH] usb: hubs: Decrease IN-endpoint poll interval for
 Microchip USB491x hub
Message-ID: <988f4311-a726-4a7e-b0bf-6aeec13d8f23@rowland.harvard.edu>
References: <20231123081948.58776-1-hgajjar@de.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123081948.58776-1-hgajjar@de.adit-jv.com>

On Thu, Nov 23, 2023 at 09:19:48AM +0100, Hardik Gajjar wrote:
> There is a potential delay in announcing downstream USB bus activity to
> Linux USB drivers due to the default interrupt endpoint having a poll
> interval of 256ms.
> 
> Microchip has recommended ignoring the device descriptor and reducing
> that value to 32ms, as it was too late to modify it in silicon.
> 
> This patch aims to speed up the USB enumeration process, facilitating
> the successful completion of Apple CarPlay certifications and enhancing
> user experience when utilizing USB devices through the Microchip Multihost
> Hub.
> 
> A new quirk, USB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL, accelerates the
> notification process by changing the Endpoint interrupt poll interval
> from 256ms to 32ms.

But this is meant to apply only to hubs, right?  So shouldn't it be a 
HUB_QUIRK_32_MS_INTR_INTERVAL macro, used in hub.c's hub_id_table, 
rather than a general USB quirk?

> Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  4 ++++
>  drivers/usb/core/config.c                       |  8 ++++++++
>  drivers/usb/core/quirks.c                       | 11 +++++++++++
>  include/linux/usb/quirks.h                      |  5 +++++
>  4 files changed, 28 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 65731b060e3f..6b0a66f0e6bf 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6908,6 +6908,10 @@
>  					pause after every control message);
>  				o = USB_QUIRK_HUB_SLOW_RESET (Hub needs extra
>  					delay after resetting its port);
> +				p = USB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL (Set
> +					bInterval to a Maximum of 9 to Reduce
> +					default Poll Rate from 256 ms to
> +					32 ms);

256 ms and 32 ms are _periods_ (or intervals), not _rates_.

bInterval=9 corresponds to 32 ms only for High Speed and SuperSpeed* 
devices.  For Low and Full Speed it corresponds to 9 ms.  Explanatory 
comments should strive not to be misleading.

Alan Stern

