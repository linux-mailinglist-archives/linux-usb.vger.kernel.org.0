Return-Path: <linux-usb+bounces-2881-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CB87EB3D3
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 16:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 808D9B20AAA
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 15:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0392041764;
	Tue, 14 Nov 2023 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D0641A85
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 15:33:58 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 621F9D5C
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 07:33:55 -0800 (PST)
Received: (qmail 1225582 invoked by uid 1000); 14 Nov 2023 10:33:55 -0500
Date: Tue, 14 Nov 2023 10:33:55 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Peter Chen <peter.chen@kernel.org>, gregkh@linuxfoundation.org,
  linux-usb@vger.kernel.org
Subject: Re: [PATCH] initialize struct otg_fsm earlier
Message-ID: <f05f2890-74a1-4e29-99fc-7fc4f22437f1@rowland.harvard.edu>
References: <20231113173125.23696-1-oneukum@suse.com>
 <20231114072757.GB64573@nchen-desktop>
 <1501d722-d193-4440-b5ea-a9586fca9a2b@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501d722-d193-4440-b5ea-a9586fca9a2b@suse.com>

On Tue, Nov 14, 2023 at 10:44:36AM +0100, Oliver Neukum wrote:
> Hi,
> 
> On 14.11.23 08:27, Peter Chen wrote:
> > On 23-11-13 18:31:20, Oliver Neukum wrote:
> > > The earlier fix bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list
> > > corruption") in effect hid an issue with intialization.
> > 
> > Typo, hit an issue with initialization.
> 
> No, it hides an issue.

The typo was in the last word of the line, not the fourth word.  That is:

	s/intial/initial/, not s/hid/hit/.

Peter had a typo in his correction.  :-)

Alan Stern

