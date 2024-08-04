Return-Path: <linux-usb+bounces-12927-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C26A946EF7
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 15:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 077051F21DFE
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 13:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3FA3A28B;
	Sun,  4 Aug 2024 13:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wJCVmHZg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF76A953
	for <linux-usb@vger.kernel.org>; Sun,  4 Aug 2024 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722777566; cv=none; b=aXbv6TG79nB/L4jrfNLqODxUpIJeRNPHF22KDJLYrrwRTvSFV0yGlIC6vtv+DDZTeWKQvfEvw1muaEOH2mO1fcaEjM8CAKTDumMv30n6Jw7MlDclgFlWAgRV5HdKCMRnr9WJJv3UWvxtnPN5rJk7cpJX9aQ5sl3l9tTG0+OM6Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722777566; c=relaxed/simple;
	bh=0lSOCT28puWz49eZmtpz6shYwdvynJYz3ZfkbF/nLZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZ/gC3ipqJW/EGiHxTs/SAA0vzBZjDReu2HQ3PFO7QRi8vogaSHA55xrmL9lXdMv7FgDxt27yK70f6bpuP4KLGJKbbKgyN1NmS1CZOKpnhLaH+WvWM+tAACQAJjxjYAPMJHlxcoRa+sQ9i2LcXIaE90ritLEkbXejOcCSVLyC6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wJCVmHZg; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7093ba310b0so3932334a34.2
        for <linux-usb@vger.kernel.org>; Sun, 04 Aug 2024 06:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722777563; x=1723382363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=edX9Ba4BSN7CS/7knLBMNGx9UgcpC3R81PoEaYxjO9Y=;
        b=wJCVmHZgoOJH6HzqWv3YRR3LwqxrsPjTsBEBULXskfF/5BUP3vFv4JFK+LFm4CfQF3
         OtMPoa/bmg6ZqBXSI+0vhXTQIeo3c9JaWWGGlYQTaZENCL5Gyy1mfqLn6hdySjznS/6k
         xz+iSmDoA+06rSpZ/ogQnd0LfHdRwVms8ZGpmZJVlW9ampsuVy5ZlTFQLmuMGibLQjHl
         nBaZB/VPshgea9B/abeeNuOlwRMHVvZt/zgMs3oykau6hImOy0Pp1qz5pHJKJJLUPIBp
         KCSRetLDVd3MMw47gr/ZedXQSpP1ecY3vLqK3RpDySLltl3WRgV/AYO4DCmIIxznqlw0
         0M1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722777563; x=1723382363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edX9Ba4BSN7CS/7knLBMNGx9UgcpC3R81PoEaYxjO9Y=;
        b=qgzyt/ujHRMtC1sdjZpVJP9XeXGOsI50g2hp1KyODN3hfGWKUe0c1L70ze7IRrDFUW
         sIW8QN2KyDS/fMDMZwNr4d2GKATgSCESwS+OFMU1RiADUsoqBKdazAggKW+5LFTH0hRR
         NHEcsbO+WMHaYbrkxvIhxISH9TkMGLdX0sYd4mPeZuCkZHB+2+qenIuV+qudNTjdwCf4
         R/jsx0CCKl1axyuRlNJpMbrIcUCVvYYO8mn+e9ssbNO9me7PsrgzhOsiS8PvAwKmYfvU
         cpZMXwN50CoXLwsRsopynan9gRVeXfvlsTa1kB8VCvieoq2CsOsi1lLFSoXdXUhT1xoP
         w3iw==
X-Forwarded-Encrypted: i=1; AJvYcCXpONWvHSG1TpWzZDAknrbcy1PNnId2j6Qp4n12Hivb+hKdLnKzAYCEKx5xqhNFlT1SBUmJ7lXb4YN05sOLnU8ge96AlvOWJopx
X-Gm-Message-State: AOJu0Ywac5c8ux+oK9sv6KNADxBHVu6gIflteRwUsc25twd7/XTnNnvP
	tC6Vxjq5ZXVpHO/zs1CKkBkC2k7xW657LBxHJpwVS4q+pUqad6EevoU5cxRmGg==
X-Google-Smtp-Source: AGHT+IEJxyYjuGbQO/IjK0L71ztzEGzwaOCcO1pth8hGxP50oJC/IllyijhVU/fEVnTckhFezU3ImQ==
X-Received: by 2002:a05:6830:6105:b0:703:5ab9:b0bc with SMTP id 46e09a7af769-709b322a747mr14461650a34.11.1722777563444;
        Sun, 04 Aug 2024 06:19:23 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::3ed1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4518a75a5easm21976461cf.78.2024.08.04.06.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 06:19:23 -0700 (PDT)
Date: Sun, 4 Aug 2024 09:19:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: hub_port_reset: Remove extra 40 ms reset
 recovery time
Message-ID: <3ec64ec7-5e10-4d24-bc6b-f205154f2cf8@rowland.harvard.edu>
References: <20240724111524.25441-1-pmenzel@molgen.mpg.de>
 <c7c299e7-605c-4bd6-afad-dfbfe266aa7e@rowland.harvard.edu>
 <f1e2e2b1-b83c-4105-b62c-a053d18c2985@molgen.mpg.de>
 <3d3416cd-167f-4c50-972b-0eb376a13fdf@rowland.harvard.edu>
 <cee9630e-781e-49b1-82c5-9066552f71b1@molgen.mpg.de>
 <8e300b0b-91f8-4003-a1b9-0f22869ae6e1@rowland.harvard.edu>
 <712dee24-e939-4b1b-b2ea-0c0c12891a62@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <712dee24-e939-4b1b-b2ea-0c0c12891a62@molgen.mpg.de>

On Sun, Aug 04, 2024 at 09:15:34AM +0200, Paul Menzel wrote:
> [To: +Heikki]
> 
> 
> Dear Alan, dear Heikki,
> 
> 
> Am 26.07.24 um 19:48 schrieb Alan Stern:

...

> > It's probably an xHCI thing -- the hardware may stop providing power to
> > the ports during S3 suspend, or something like that.  The xHCI people
> > may have a better idea of what's going on.
> 
> Heikki, can you confirm this. I am attaching the logs with

You should be asking Mathias, the xHCI maintainer.

>     echo 'file drivers/usb/* +p' | sudo tee
> /sys/kernel/debug/dynamic_debug/control

...

> [  149.185600] usb 1-3: usb suspend, wakeup 0
> [  149.185642] xhci_hcd 0000:00:14.0: Cancel URB 000000003e45896a, dev 4, ep 0x81, starting at offset 0x102ef1010
> [  149.185661] usb usb2: usb auto-resume
> [  149.185664] xhci_hcd 0000:00:14.0: // Ding dong!
> [  149.185736] xhci_hcd 0000:00:14.0: Stopped on Transfer TRB for slot 2 ep 2
> [  149.185745] xhci_hcd 0000:00:14.0: Removing canceled TD starting at 0x102ef1010 (dma) in stream 0 URB 000000003e45896a
> [  149.185753] xhci_hcd 0000:00:14.0: Set TR Deq ptr 0x102ef1020, cycle 1
> 
> [  149.185757] xhci_hcd 0000:00:14.0: // Ding dong!
> [  149.185763] xhci_hcd 0000:00:14.0: xhci_giveback_invalidated_tds: Keep cancelled URB 000000003e45896a TD as cancel_status is 2
> [  149.185770] xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq = @102ef1020
> [  149.185775] xhci_hcd 0000:00:14.0: xhci_handle_cmd_set_deq: Giveback cancelled URB 000000003e45896a TD
> [  149.185780] xhci_hcd 0000:00:14.0: Giveback URB 000000003e45896a, len = 0, expected = 116, status = -115
> [  149.185788] xhci_hcd 0000:00:14.0: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
> [  149.185810] hub 2-0:1.0: hub_resume
> [  149.185816] usb 1-4: usb suspend, wakeup 0
> [  149.185840] hub 1-0:1.0: hub_suspend
> [  149.185865] usb usb1: bus suspend, wakeup 0
> [  149.185894] xhci_hcd 0000:00:14.0: port 1-4 not suspended
> [  149.185899] xhci_hcd 0000:00:14.0: port 1-3 not suspended

I have to wonder why xhci-hcd says ports 1-3 and 1-4 are not suspended,
when only a few lines earlier the log says that devices 1-3 and 1-4
have gone into USB suspend.

Alan Stern

