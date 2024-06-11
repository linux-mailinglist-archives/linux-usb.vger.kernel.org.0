Return-Path: <linux-usb+bounces-11146-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5F6903F03
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 16:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B93E1C22D05
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 14:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4503117DE02;
	Tue, 11 Jun 2024 14:42:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9ED1217D8B9
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718116958; cv=none; b=QsrEEkJ+yHASFFb2rQL0zzAF7XV+pTj5DY8EmYjf9CrA2SSiwvK2+yXNTLhJCN5dLxxE0ujVe7XkhMYSpfny2aub6rNB4Iz0fQepk3R7Yhz7J0p1Wi+/I1dRoh68phVKIHxhl6vzoIhwKRll+6HRzPVAS3Qp7eRL58xrHfP9ER8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718116958; c=relaxed/simple;
	bh=lpL6QNJjXCBFbtv3R8mkFrzu5fnUyyaC2qtaiWa87M8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q7UsXdUcSTuMqbTo441rTwKEu7Ue95YedXt+oUPxdVkpT9pJNZN1mivDPYnauC0uLDJ7zKxMynaoFMRH24NSCOVIVTCONuM87omlEp11LmJRFmlkkmPa6tm/ejcT78wNtc0v4w0Sob68zsso3rWUNhEoLfuANQ3Lm+rVPIhVbTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 187946 invoked by uid 1000); 11 Jun 2024 10:35:12 -0400
Date: Tue, 11 Jun 2024 10:35:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>, Oliver Neukum <oneukum@suse.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>,
  Kernel development list <linux-kernel@vger.kernel.org>
Subject: USB Denial Of Service
Message-ID: <40dfa45b-5f21-4eef-a8c1-51a2f320e267@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Greg, Oliver, or anyone else:

Questions:

If a broken or malicious device causes a USB class driver to add a 
thousand (or more) error messages per second to the kernel log, 
indefinitely, would that be considered a form of DOS?

Should the driver be fixed?

What is an acceptable rate for an unending stream of error messages?  
Once a second?  Once a minute?

At what point should the driver give up and stop trying to communicate 
with the device?

(These are not moot questions.  There are indeed drivers, and probably 
not just in the USB subsystem, subject to this sort of behavior.)

Alan Stern

