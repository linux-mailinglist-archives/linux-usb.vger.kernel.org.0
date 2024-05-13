Return-Path: <linux-usb+bounces-10248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 709D98C39CE
	for <lists+linux-usb@lfdr.de>; Mon, 13 May 2024 03:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FBDF1F2129F
	for <lists+linux-usb@lfdr.de>; Mon, 13 May 2024 01:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2131BAD31;
	Mon, 13 May 2024 01:14:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 0D342A935
	for <linux-usb@vger.kernel.org>; Mon, 13 May 2024 01:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715562898; cv=none; b=UdW48SbPPgHnc3gGAR0UnNROdW7c9D2OMET+OLD9bvxoIr8qWZcmraxJFMqtbWGOOmji9byM49FQ6aWLGFH7lUom1WoxDsQ81c62vwYCq4eOVvPq5yhzQCDAiHjTVzTIK0BiQGGAiOBRZXpe/4CqxZKHrdBwKpp9e31FkjCNDQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715562898; c=relaxed/simple;
	bh=qWyqhx6Ze5M7ksjzghQiW71vMakBvcaFS+zvhK4oxC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzLPPkEkW0nqFId7ikT0lA1alB63olVeNmhKIOcJLetCT5m9HHtrY8P3MvbgN4sXQZbWfhO15Wmv0YmIiBAfkhkPQhjyCi/aqGiXcJTJ6kOKoI9NNmdzzr+x/OY0DNpxdIad+cUXafGl+GqLktBYmkBW9kuUhq1sUW+A0Q7KbOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 128017 invoked by uid 1000); 12 May 2024 21:14:55 -0400
Date: Sun, 12 May 2024 21:14:55 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Ethin Probst <ethindp@pm.me>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Assistance getting the Universal Audio Apollo Solo USB to work
 with Linux
Message-ID: <a04e5fcb-f5f9-4331-bbf6-b0f141d36073@rowland.harvard.edu>
References: <DJiA8anOC3V1gHoj0H-8pmsXujLNu7IlZvNmvUEoDfnjC5VIzZ3YsoTgnUD-zVTsnhgln5BzEsy1n4YkoqkEd_pvTF9oZaukzUoyL-pDfRs=@pm.me>
 <ab4d0394-0d71-45a7-a79b-02e3c90f8ac8@rowland.harvard.edu>
 <8fcVwO4QZdKndXMug6gtJOMJ7bCUM0dk3lfyiKsUSR1QFvQeQ1SdRkQUUTJd73wI_dgxAULH_oTBA64hdSb3JYiwAyejHLM7RccUgY1m4sM=@pm.me>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fcVwO4QZdKndXMug6gtJOMJ7bCUM0dk3lfyiKsUSR1QFvQeQ1SdRkQUUTJd73wI_dgxAULH_oTBA64hdSb3JYiwAyejHLM7RccUgY1m4sM=@pm.me>

You should use Reply-to-All so that your message goes to the mailing 
list as well as to me.

On Sun, May 12, 2024 at 11:22:44PM +0000, Ethin Probst wrote:
> On Sunday, May 12th, 2024 at 09:13, Alan Stern <stern@rowland.harvard.edu> wrote:
> > Most likely, Windows sends some firmware to the device (which it needs
> > in order to run properly) and then restarts the device.
> 
> Is there some way I can check for this?

The only way I can think of is to compare the data in your captured 
packets with the contents of the firmware file.  If they agree then you 
have your answer.

>  There are some unusually large
> transfers in the capture (e.g. frame 24) but there are also some
> truncated frames (e.g. frame 3), I'm not positive if I can fix that or
> not -- I don't think VirtualBox allows me to modify the packet maximum
> length. If I'm the only one on this list with one of these devices I
> wouldn't mind doing the debugging/tests, even though that may increase
> the amount of time all of this takes... The devices are a bit expensive
> (but not ridiculously so), still within the (hopefully decently
> affordable) range.

Unfortunately, I'm too busy now to spend much time helping you with this 
for a while.

Alan Stern

