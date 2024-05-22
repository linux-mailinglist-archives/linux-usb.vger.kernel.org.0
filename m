Return-Path: <linux-usb+bounces-10406-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 031518CC389
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2024 16:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1E51281F54
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2024 14:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4F61CAA6;
	Wed, 22 May 2024 14:50:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id E7E99224CC
	for <linux-usb@vger.kernel.org>; Wed, 22 May 2024 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716389435; cv=none; b=XEUBUZzaoqw02L0BVfQvp55q6e1w6KgyWauVaan3O+FfVpVXA6hD+cJCxZ+nebT2DBWQ6azQzquZqqozHNs/6RhPcO0CkxKQ9oc1f9Et+GIkNENv/K2Ba2DaNBxcrLXcvfJoyKmnq8ZLBoTAjW6JVqhIEOd265VuWCqaiwMDE8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716389435; c=relaxed/simple;
	bh=4piNjUZg8oisXddgDB5LOyPhZdAPw5encIVgKKhsD/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONFfWeoSIAF/qj2LSmXlDxZ5k1GoA2B9+3usZdni7fsAm/n8MRCcfBj2CD920RTXMv8XW3f90EsdI+x6T6Ucxp5Z3BwNqA5VdyTCqukGuhRaU/a4IYRnIzdG+lKteqHSLOud8LYdwXJdAhXYNmXFofLJrBIqrOj1BwtnDGLhMr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 500064 invoked by uid 1000); 22 May 2024 10:50:31 -0400
Date: Wed, 22 May 2024 10:50:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Michael Grzeschik <mgr@pengutronix.de>,
  Avichal Rakesh <arakesh@google.com>,
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Daniel Scally <dan.scally@ideasonboard.com>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Jayant Chowdhary <jchowdhary@google.com>,
  "etalvala@google.com" <etalvala@google.com>,
  Michael Riesch <michael.riesch@wolfvision.net>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] usb: gadget: uvc: allocate requests based on frame
 interval length and buffersize
Message-ID: <3f404a27-50e8-42c5-a497-b46751154613@rowland.harvard.edu>
References: <ZiWga5Kqno1ICv97@pengutronix.de>
 <dcad0089-4105-44bc-a2b4-3cfc6f44164b@google.com>
 <ZifEvUi9-E8M4dp8@pengutronix.de>
 <17192e0f-7f18-49ae-96fc-71054d46f74a@google.com>
 <20240424022806.uo73nwpeg63vexiv@synopsys.com>
 <ZkE-O0yJ33T9hWa0@pengutronix.de>
 <20240517014359.p2s44ypl4bix4odm@synopsys.com>
 <Zk03Ys1rA0I5yiZy@pengutronix.de>
 <20240522014132.xlf7azgq2urfff2d@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522014132.xlf7azgq2urfff2d@synopsys.com>

On Wed, May 22, 2024 at 01:41:42AM +0000, Thinh Nguyen wrote:
> On Wed, May 22, 2024, Michael Grzeschik wrote:
> > On Fri, May 17, 2024 at 01:44:05AM +0000, Thinh Nguyen wrote:
> > > For isoc endpoint IN, yes. If the host requests for isoc data IN while
> > > no TRB is prepared, then the controller will automatically send 0-length
> > > packet respond.
> > 
> > Perfect! This will help a lot and will make active queueing of own
> > zero-length requests run unnecessary.
> 
> Yes, if we rely on the current start/stop isoc transfer scheme for UVC,
> then this will work.

You shouldn't rely on this behavior.  Other device controllers might not 
behave this way; they might send no packet at all to the host (causing a 
USB protocol error) instead of sending a zero-length packet.

On the other hand, it may not make any difference.  The host's UVC 
driver most likely won't care about the difference between no packet and 
a 0-length packet.  :-)

Alan Stern

