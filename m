Return-Path: <linux-usb+bounces-3697-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30301803914
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 16:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0275B20BE3
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 15:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7B92C87D;
	Mon,  4 Dec 2023 15:45:02 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id CFA2AC1
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 07:44:57 -0800 (PST)
Received: (qmail 384740 invoked by uid 1000); 4 Dec 2023 10:44:57 -0500
Date: Mon, 4 Dec 2023 10:44:57 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, corbet@lwn.net,
  linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
  erosca@de.adit-jv.com, tj@kernel.org, paulmck@kernel.org,
  Martin.Mueller5@de.bosch.com
Subject: Re: [PATCH v3] usb: hub: Add quirk to decrease IN-ep poll interval
 for Microchip USB491x hub
Message-ID: <caa5c2c8-7aa7-4ad0-9ad4-a58d1eceea37@rowland.harvard.edu>
References: <20231201144705.97385-1-hgajjar@de.adit-jv.com>
 <39f334d2-abe6-4b4d-a48c-b22a907c6ea6@rowland.harvard.edu>
 <2023120437-opposite-juiciness-e0dd@gregkh>
 <20231204152543.GA115715@vmlxhi-118.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231204152543.GA115715@vmlxhi-118.adit-jv.com>

On Mon, Dec 04, 2023 at 04:25:43PM +0100, Hardik Gajjar wrote:
> On Mon, Dec 04, 2023 at 08:02:50AM +0100, Greg KH wrote:
> > And why not use BIT() as that's what these are.
> > 
> > thanks,
> > 
> > greg k-h
> 
> I am considering aligning with existing quirks.
> Is it advisable to use something like HUB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL BIT(2)? 
> I'm thinking to submit two patches – one to replace hard values with BIT() in existing quirks and a second patch containing my changes.

That's a good idea.

Alan Stern

