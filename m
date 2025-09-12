Return-Path: <linux-usb+bounces-27983-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EABB53F88
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 02:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F0B768577A
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 00:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE52134CB;
	Fri, 12 Sep 2025 00:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDluwVGW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AD622097
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 00:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757638129; cv=none; b=H/EZqr5nBZAbBRACFUntI01lhOKZFdRqZiSxhfCLHS6pQnL56IZMIrqGMOLVlMsAW2jCSY9aYxNx4cKEhE4TOnFbnE8dabsLSrrCzSh8FviPy9JEBPqyOgsMAo82fbA4z3atvaM2Lc00RoGZTEL0qh/4BgOoLjsNlJEV+EL+w9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757638129; c=relaxed/simple;
	bh=HNtYC4ks5hj9ZhgfxRXgRfKrDt9fIEKs0EDHJ3/kwHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiWd0OUnGoIRRZdMk8OXfMxRnP5x/I842Pxn9IwqROaEXrRDK0aOQNvkqh9XpmLVoXHG2mlEia32o6RN+VjNSqopF3iQotqtkusirao3rg45sQXgzggjEL9YNtI2s+xxX3f3ywqXM79qwKpd1xs6/HsmKCZP3iGQBGTF3RKxpYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDluwVGW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA99C4CEF0;
	Fri, 12 Sep 2025 00:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757638128;
	bh=HNtYC4ks5hj9ZhgfxRXgRfKrDt9fIEKs0EDHJ3/kwHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDluwVGWNPopIm0YySsgbY7q2m1GY7WaKamgYfNJBulA/dhOvzTmm9MC6+AFD16Kd
	 dkYbNL7CXKHxQIl0HnScCJkK5ulOwRQb9n1+6bj8PsHulC4HVhmXEf8bWB5kHcGm70
	 5P/oSBOSZci1jlC+xHMIgFZG4qEHlCIaOVovUjv4ptHIP1X7y57MoEPDqs73jDvBGi
	 EVX5feltk/Nf/OzKcxHq0zAKU4/KO1ZpvLJOCuR1+ZKLtMzinEznEzDa09PMuIHvos
	 uw1TWdtkp79rsQuaJJ8Tz39k2N6DK/w5hW3C2ZVwsmrC1+ge75Zk3qxE7XJCk2+rCB
	 o1vViFiThOXkA==
Date: Fri, 12 Sep 2025 08:48:45 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 7/7] usb: xhci: rename Port Register Set pointer in
 struct 'xhci_port'
Message-ID: <20250912004845.GA2794807@nchen-desktop>
References: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
 <20250904154221.2314596-8-niklas.neronin@linux.intel.com>
 <20250905024003.GB2473920@nchen-desktop>
 <70cf1755-bc20-4703-b812-cce89ef2ef1a@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70cf1755-bc20-4703-b812-cce89ef2ef1a@linux.intel.com>

On 25-09-10 10:24:37, Neronin, Niklas wrote:
> 
> 
> On 05/09/2025 5.40, Peter Chen (CIX) wrote:
> > On 25-09-04 17:42:20, Niklas Neronin wrote:
> >> Rename the Host Controller USB Port Register Set pointer in the 'xhci_port'
> >> struct from "addr" to "port_reg". This new name accurately reflects the
> >> purpose of the pointer.
> >>
> > 
> > I am also implementing a wrapper that needs to cover all PORTSC
> > registers access, it is used to cover the controllers which have some
> > problems to access PORTSC when the USB PHY switches to DP for USB/DP
> > altmode scenario, current USB core and xHCI core access USB3 PORTSC
> > at some places (detail could see the changes you do below) if controller
> > supports both USB2 and USB3, even the USB3 connection is not there.
> > 
> > I am thinking is it possible you add a wrapper like
> > xhci_port_readl/xhci_port_writel for all PORTSC access, otherwise I
> > also need to change all places you make.
> > 
> 
> Yes, I will add a read PORTSC functions, in version 2.
> I am on vacation this week, so v2 will be ready next week.
> 

Thanks, it is also a good place if we would like to track LTSSM change.

-- 

Best regards,
Peter

