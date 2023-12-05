Return-Path: <linux-usb+bounces-3749-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 262AF805D32
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 19:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3372281F62
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 18:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EF168B8E;
	Tue,  5 Dec 2023 18:22:15 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 133081706
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 10:22:09 -0800 (PST)
Received: (qmail 425674 invoked by uid 1000); 5 Dec 2023 13:22:09 -0500
Date: Tue, 5 Dec 2023 13:22:09 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org, erosca@de.adit-jv.com, tj@kernel.org,
  paulmck@kernel.org, Martin.Mueller5@de.bosch.com
Subject: Re: [PATCH v5 2/2] usb: hub: Add quirk to decrease IN-ep poll
 interval for Microchip USB491x hub
Message-ID: <1773e17b-a94e-4101-8881-54e33fb700d6@rowland.harvard.edu>
References: <20231205181829.127353-1-hgajjar@de.adit-jv.com>
 <20231205181829.127353-2-hgajjar@de.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205181829.127353-2-hgajjar@de.adit-jv.com>

On Tue, Dec 05, 2023 at 07:18:29PM +0100, Hardik Gajjar wrote:
> There is a potential delay in notifying Linux USB drivers of downstream
> USB bus activity when connecting a high-speed or superSpeed device via the
> Microchip USB491x hub. This delay is due to the fixed bInterval value of
> 12 in the silicon of the Microchip USB491x hub.
> 
> Microchip requested to ignore the device descriptor and decrease that
> value to 9 as it was too late to modify that in silicon.
> 
> This patch speeds up the USB enummeration process that helps to pass
> Apple Carplay certifications and improve the User experience when utilizing
> the USB device via Microchip Multihost USB491x Hub.
> 
> A new hub quirk HUB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL speeds up
> the notification process for Microchip USB491x hub by limiting
> the maximum bInterval value to 9.
> 
> Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> ---
> changes since version 1:
> 	- Move implementation from config.c and quirk.c to hub.c as this is hub
> 	  specific changes.
> 	- Improve commit message.
> 	- Link to v1 - https://lore.kernel.org/all/20231123081948.58776-1-hgajjar@de.adit-jv.com/
> 
> changes since version 2:
>     - Call usb_set_interface after updating the bInterval to Tell the HCD about modification
> 	- Link to v2 - https://lore.kernel.org/all/20231130084855.119937-1-hgajjar@de.adit-jv.com/
> 
> changes since version 3:
>     - Change HUB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL value from 0x08 to 0x04
> 	- Link to v3 - https://lore.kernel.org/all/20231201144705.97385-1-hgajjar@de.adit-jv.com/
> 
> changes since version 4:
> 	- change quirk hardcoded value to BIT() Macro
> 	- Link to v4 - https://lore.kernel.org/all/20231204073834.112509-1-hgajjar@de.adit-jv.com/
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

