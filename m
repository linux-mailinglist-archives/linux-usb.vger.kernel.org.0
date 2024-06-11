Return-Path: <linux-usb+bounces-11156-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3053E90443D
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 21:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8607DB211CA
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 19:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AA37B3FE;
	Tue, 11 Jun 2024 19:09:37 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 1A1AF171A5
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 19:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718132976; cv=none; b=Ab/bomnAfIaRRDjkPgYwxc1C/y0f3d2Sr0y3a1OVN3XCL0KjxU2dqDW44dbzCcg0+WidHGAT4DUMza/6r1dU7G/QgZyAIVRfGwrTwozrn3OR0pbbhvS56ckwXYUNTiOBMYv6xDsQ2fsM3tS9vyoDzQD3KvS6X5Kw/6YeWuJOECw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718132976; c=relaxed/simple;
	bh=v6LByni6kAtvWPrg1ZOYn+LhMj8+SSW8/aSyPRed+Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRbb6zLUk7rtBQekI2FCqv46eUTYlQsHsuYN9AGzI88UgHEiutsF5XGw0MV6KlHXYqSZoXiX49zioNZU5yyCnAKC12VIJWK4jz1chF10kg/kVv+YXRt5ACmd0asnlIc4gCaPbCIZBMoLObYCxC3JHjn1TWSV5qD8WXgGlS14e74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 198521 invoked by uid 1000); 11 Jun 2024 15:09:32 -0400
Date: Tue, 11 Jun 2024 15:09:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: USB Denial Of Service
Message-ID: <a09c0dfc-1cdc-445b-a524-305c3f5f3d79@rowland.harvard.edu>
References: <40dfa45b-5f21-4eef-a8c1-51a2f320e267@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40dfa45b-5f21-4eef-a8c1-51a2f320e267@rowland.harvard.edu>

On Tue, Jun 11, 2024 at 10:35:12AM -0400, Alan Stern wrote:
> Greg, Oliver, or anyone else:
> 
> Questions:
> 
> If a broken or malicious device causes a USB class driver to add a 
> thousand (or more) error messages per second to the kernel log, 
> indefinitely, would that be considered a form of DOS?
> 
> Should the driver be fixed?
> 
> What is an acceptable rate for an unending stream of error messages?  
> Once a second?  Once a minute?
> 
> At what point should the driver give up and stop trying to communicate 
> with the device?
> 
> (These are not moot questions.  There are indeed drivers, and probably 
> not just in the USB subsystem, subject to this sort of behavior.)

Along those lines, what do you think of the following patch for handling 
-EPROTO, -EILSEQ, or -ETIME status values for the interrupt URB in the 
cdc-wdm driver?  After one of those errors, the URB is immediately 
resubmitted, so the error is likely to occur again no more than a 
millisecond later.  Changing dev_err() to dev_dbg() prevents log 
spamming.

Alternatively, the driver could avoid resubmitting the URB when one of 
those errors occurs.  This is perhaps less appropriate, because these 
kinds of errors can be transient (although that is normally rare).

Alan Stern



Index: usb-devel/drivers/usb/class/cdc-wdm.c
===================================================================
--- usb-devel.orig/drivers/usb/class/cdc-wdm.c
+++ usb-devel/drivers/usb/class/cdc-wdm.c
@@ -266,14 +266,14 @@ static void wdm_int_callback(struct urb
 			dev_err(&desc->intf->dev, "Stall on int endpoint\n");
 			goto sw; /* halt is cleared in work */
 		default:
-			dev_err(&desc->intf->dev,
+			dev_dbg(&desc->intf->dev,
 				"nonzero urb status received: %d\n", status);
 			break;
 		}
 	}
 
 	if (urb->actual_length < sizeof(struct usb_cdc_notification)) {
-		dev_err(&desc->intf->dev, "wdm_int_callback - %d bytes\n",
+		dev_dbg(&desc->intf->dev, "wdm_int_callback - %d bytes\n",
 			urb->actual_length);
 		goto exit;
 	}


