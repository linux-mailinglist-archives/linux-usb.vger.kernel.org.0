Return-Path: <linux-usb+bounces-14375-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0A89661D0
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 14:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9F5AB26980
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 12:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B0B19995A;
	Fri, 30 Aug 2024 12:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a/5dX5XK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DBD56440
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 12:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725021139; cv=none; b=oOEKw/aKEMSPNIhfvDL4l8k11PRgzTwFp+Ln8ZIUMqUd0tHRtJ4afbBjyhJP4qvlglkhE2AY3PzNyl/qabAPC2zlC8jSEhQcUtLl3b8E/EL+esJpEb3xcBNJA4lotLfXmiUqpfWKe9p1VZVJsEkf6ozEk6xnQxVV4t/RnLC3u2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725021139; c=relaxed/simple;
	bh=dTr4R7Y/6pfCQtUaVEHZxYBTMm7UG3cMLTqOe+sWlKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViNa60IY1NMUipXBBVWbOV03WHX+sZKrkKd94fcOAsgTRoGFxvVQMIAGHJ70N0Jb1n6Q0XUM9UTLOx6hYvW7NSQVv9PogivypL5bRwcqWr6BMGaCW3kCfH/9GBe1FoDTJAzmdOdM+JK2ZWh1T9ZuHrCM9hDNt8asAyeVl/DKA3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a/5dX5XK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B97EC4CEC7;
	Fri, 30 Aug 2024 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725021138;
	bh=dTr4R7Y/6pfCQtUaVEHZxYBTMm7UG3cMLTqOe+sWlKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/5dX5XKFGHFY4KEFElkULkYPqI0F9fd+c10NYy35oCOzQc0qgSQeHrKyK/icD6rM
	 HLpPEmX6yfWRMfwrfASLktQI0/GE9qP44SxCeRplXRZiCqFWh92k01HFhGcw0iilSS
	 oUC0i7pnOkZcF98PfPn965ggXmey6Ik5iRN66Dg0=
Date: Fri, 30 Aug 2024 14:32:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eyal Lebedinsky <eyal@eyal.emu.id.au>
Cc: linux-usb@vger.kernel.org
Subject: Re: Understanding 'lsusb -t'
Message-ID: <2024083057-charger-lustrous-d434@gregkh>
References: <63d4782a-1d83-4252-a0ca-a9b50e6074f0@eyal.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63d4782a-1d83-4252-a0ca-a9b50e6074f0@eyal.emu.id.au>

On Fri, Aug 30, 2024 at 10:14:20PM +1000, Eyal Lebedinsky wrote:
> I assume that the generated list is a tree, so each leaf (Device/If) is on only one point.
> 
> I note this output:
> 
> $ lsusb -tv
> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/16p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
> [trimmed]
>     |__ Port 004: Dev 004, If 0, Class=Hub, Driver=hub/4p, 480M
> [trimmed]
>     |__ Port 005: Dev 006, If 0, Class=Hub, Driver=hub/4p, 480M
> [trimmed]
>     |__ Port 006: Dev 019, If 0, Class=Hub, Driver=hub/4p, 480M
>         ID 2109:2817 VIA Labs, Inc.
> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 10000M
> [trimmed]
>     |__ Port 006: Dev 006, If 0, Class=Hub, Driver=hub/4p, 5000M
>         ID 2109:0817 VIA Labs, Inc.
> 
> I removed some content that is not relevant to my question.
> 
> Note the Bus 001.Port 006 and Bus 002.Port 006 entries.
> 
> I verified that both are for the same (one) device. They do not show when I disconnect it.
> The device is an external 4-port USB3.0 hub. It is listed once as 480M and once as 5000M.
> Nothing is plugged into any of the four ports.
> 
> Is this correct? Why does this device show twice in the list?

That's odd, as the same device shouldn't be on multiple busses.  Busses
are a "root port" on the system (i.e. a new PCI controller device), so
are you sure you just don't have multiple devices with the same
device/vendor id?

What is the diff between running the command before and after removing a
single device?

thanks,

greg k-h

