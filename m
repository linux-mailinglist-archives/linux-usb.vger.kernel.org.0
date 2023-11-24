Return-Path: <linux-usb+bounces-3297-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3C57F7708
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 15:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFCCCB21856
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 14:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B721A2D799;
	Fri, 24 Nov 2023 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 3EA0E10CA
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 06:57:15 -0800 (PST)
Received: (qmail 33955 invoked by uid 1000); 24 Nov 2023 09:57:14 -0500
Date: Fri, 24 Nov 2023 09:57:14 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, tj@kernel.org,
  rdunlap@infradead.org, paulmck@kernel.org, linux-doc@vger.kernel.org,
  linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
  erosca@de.adit-jv.com, Martin.Mueller5@de.bosch.com
Subject: Re: [PATCH] usb: hubs: Decrease IN-endpoint poll interval for
 Microchip USB491x hub
Message-ID: <66137982-c6a4-48c8-860f-c87cc6e01101@rowland.harvard.edu>
References: <20231123081948.58776-1-hgajjar@de.adit-jv.com>
 <988f4311-a726-4a7e-b0bf-6aeec13d8f23@rowland.harvard.edu>
 <20231124145005.GA72525@vmlxhi-118.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124145005.GA72525@vmlxhi-118.adit-jv.com>

On Fri, Nov 24, 2023 at 03:50:05PM +0100, Hardik Gajjar wrote:
> On Thu, Nov 23, 2023 at 01:17:03PM -0500, Alan Stern wrote:
> > On Thu, Nov 23, 2023 at 09:19:48AM +0100, Hardik Gajjar wrote:
> > > There is a potential delay in announcing downstream USB bus activity to
> > > Linux USB drivers due to the default interrupt endpoint having a poll
> > > interval of 256ms.
> > > 
> > > Microchip has recommended ignoring the device descriptor and reducing
> > > that value to 32ms, as it was too late to modify it in silicon.
> > > 
> > > This patch aims to speed up the USB enumeration process, facilitating
> > > the successful completion of Apple CarPlay certifications and enhancing
> > > user experience when utilizing USB devices through the Microchip Multihost
> > > Hub.
> > > 
> > > A new quirk, USB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL, accelerates the
> > > notification process by changing the Endpoint interrupt poll interval
> > > from 256ms to 32ms.
> > 
> > But this is meant to apply only to hubs, right?  So shouldn't it be a 
> > HUB_QUIRK_32_MS_INTR_INTERVAL macro, used in hub.c's hub_id_table, 
> > rather than a general USB quirk?
> 
> Thank you, Alan, for the feedback. To confirm my understanding, are you suggesting
> moving all implementations to hub.c, adding the hub-specific quirk, and using the
> same quirk to update the bInterval value parsed by usb_get_configuration() in
> usb_enumerate_device()?"

Basically, yes.  The update should be performed in the hub_probe() 
routine if the quirk flag is set, before hub_configure() is called.  It 
might be necessary to add a usb_set_interface() call as well, in case 
the old bInterval value has already been cached by the host controller 
driver.

Alan Stern

