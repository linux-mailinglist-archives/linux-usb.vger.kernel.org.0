Return-Path: <linux-usb+bounces-1351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2E47BF8FE
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 12:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 552111C20BBD
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 10:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68A9DF69;
	Tue, 10 Oct 2023 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB4CA34
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 10:50:05 +0000 (UTC)
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 037A7B4;
	Tue, 10 Oct 2023 03:50:03 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
	by hi1smtp01.de.adit-jv.com (Postfix) with ESMTP id BB0DC520587;
	Tue, 10 Oct 2023 12:50:02 +0200 (CEST)
Received: from vmlxhi-118.adit-jv.com (10.72.93.77) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.32; Tue, 10 Oct
 2023 12:50:02 +0200
Date: Tue, 10 Oct 2023 12:50:02 +0200
From: Hardik Gajjar <hgajjar@de.adit-jv.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Hardik Gajjar <hgajjar@de.adit-jv.com>, <mathias.nyman@intel.com>,
	<gregkh@linuxfoundation.org>, <yangyingliang@huawei.com>,
	<jinpu.wang@ionos.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <erosca@de.adit-jv.com>
Subject: Re: [PATCH v2] usb: core: hub: Add quirks for reducing device
 address timeout
Message-ID: <20231010105002.GB107162@vmlxhi-118.adit-jv.com>
References: <--in-reply-to=20231006153808.9758-1-hgajjar@de.adit-jv.com>
 <20231009161402.104224-1-hgajjar@de.adit-jv.com>
 <66f874d3-b480-4748-8732-d0cdce3ab4b7@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <66f874d3-b480-4748-8732-d0cdce3ab4b7@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.72.93.77]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 09, 2023 at 03:16:25PM -0400, Alan Stern wrote:
> On Mon, Oct 09, 2023 at 06:14:02PM +0200, Hardik Gajjar wrote:
> > Currently, the timeout for the set address command is fixed at
> > 5 seconds in the xhci driver. This means the host waits up to 5
> > seconds to receive a response for the set_address command from
> > the device.
> > 
> > In the automotive context, most smartphone enumerations, including
> > screen projection, should ideally complete within 3 seconds.
> > Achieving this is impossible in scenarios where the set_address is
> > not successful and waits for a timeout.
> 
> What will you do about scenarios where the Set-Address completes very 
> quickly but the following Get-Device-Descriptor times out after 5 
> seconds?  Or any of the other transfers involved in device 
> initialization and enumeration?

This issue occurs when the device first enumerates as full speed and then
as a high-speed device.

It appears that the set_address request is issued as soon as the device is
detected as full speed. However, during the progress of the set_address
request, the device changes its state from full speed to high speed, causing
the set_address request to become stuck until it times out.

Stress testing of USB devices indicates that the problem is specific to the
set_address request. Other requests, such as device descriptor requests,
consistently fail immediately with a protocol error in almost all cases.

> 
> > The shortened address device timeout quirks provide the flexibility
> > to align with a 3-second time limit in the event of errors.
> > By swiftly triggering a failure response and swiftly initiating
> > retry procedures, these quirks ensure efficient and rapid recovery,
> > particularly in automotive contexts where rapid smartphone enumeration
> > and screen projection are vital.
> > 
> > The quirk will set the timeout to 500 ms from 5 seconds.
> > 
> > To use the quirk, please write "vendor_id:product_id:p" to
> > /sys/bus/usb/drivers/hub/module/parameter/quirks
> > 
> > For example,
> > echo "0x2c48:0x0132:p" > /sys/bus/usb/drivers/hub/module/parameter/quirks"
> > 
> > Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> > ---
> > changes since version 1:
> > 	- implement quirk instead of new API in xhci driver
> > ---
> >  drivers/usb/core/hub.c       | 15 +++++++++++++--
> >  drivers/usb/core/quirks.c    |  3 +++
> >  drivers/usb/host/xhci-mem.c  |  1 +
> >  drivers/usb/host/xhci-ring.c |  3 ++-
> >  drivers/usb/host/xhci.c      |  9 +++++----
> >  drivers/usb/host/xhci.h      |  1 +
> >  include/linux/usb/hcd.h      |  3 ++-
> >  include/linux/usb/quirks.h   |  3 +++
> >  8 files changed, 30 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 3c54b218301c..975449b03426 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -54,6 +54,9 @@
> >  #define USB_TP_TRANSMISSION_DELAY_MAX	65535	/* ns */
> >  #define USB_PING_RESPONSE_TIME		400	/* ns */
> >  
> > +#define USB_DEFAULT_ADDR_DEVICE_TIMEOUT		(HZ * 5) /* 5000ms */
> > +#define USB_SHORT_ADDR_DEVICE_TIMEOUT		125  /* ~500ms */
> 
> That number, 125, is meaningless.  It's in units of jiffies, which vary 
> from one system to another.  If you want the timeout to be about 500 ms, 
> you should write it as (HZ / 2).

Good Point, Thanks, I will update in patch v3

> 
> Alan Stern

