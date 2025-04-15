Return-Path: <linux-usb+bounces-23081-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DF1A89DEF
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 14:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E51BF173B18
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 12:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A0A2973A7;
	Tue, 15 Apr 2025 12:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bovoXKuU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0FE296D2E
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719734; cv=none; b=Eif9SlDr0eVBMAjoPz7PnRoVnsAHNRrmAifA6PWFVpjEHrK0+2j92BN3uGJeXgchLeP8DpVU6nnNLeP0WfBfp3AlGO/trng3rM55qQXu01BuTCgbWuylmtWDJ6V6Rspn0ZPnCqvHOkKeA/aZqOvEv2t59xPY3YtOxF832w3+9aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719734; c=relaxed/simple;
	bh=1m18NB9/m8mvGj8yiFiUTzxSLnDtlwdNgaFHcbv9pIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLtnCJGDlPMdbUiapUDgvhUojFbwnMSXGM8fvEkjiKV13692/LlDJRfXUCrYYyiaE4McRpxDBGW7im12dkpmbZyI0KGYz6dgOOXfRQvitD3lnKdj/LsTmvvjw4P3AEakEHkfQXYRN807nXnQ48jtUW2hkkh9qMKgEoiZDTyCMpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bovoXKuU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC6DC4CEE5;
	Tue, 15 Apr 2025 12:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744719733;
	bh=1m18NB9/m8mvGj8yiFiUTzxSLnDtlwdNgaFHcbv9pIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bovoXKuUsOxe8X5vMNCFt4GWzsBYnoBaNIkbXTK4sEbFD6Rs6trbsJX0oCmFUh4Oz
	 dwT9ojR+E8OSLvNV+BK+bY7irhaNF7YFdXrc7+owK6qmu7SzS6KqMQxQLM2f11xumU
	 JownkmwtAjTatX17TvgukSExz+DKnqNdLDW613ng=
Date: Tue, 15 Apr 2025 14:22:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	linux-usb@vger.kernel.org, mika.westerberg@linux.intel.com,
	andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com
Subject: Re: [PATCH 0/3] Introduce Thunderbolt/USB4 <-> USB Type-C port
 mapping
Message-ID: <2025041557-jot-compel-75ec@gregkh>
References: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>
 <2025041421-snowbound-lullaby-3450@gregkh>
 <Z_4nm3x6TvgkO4Rl@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_4nm3x6TvgkO4Rl@kuha.fi.intel.com>

On Tue, Apr 15, 2025 at 12:32:11PM +0300, Heikki Krogerus wrote:
> Hi Greg,
> 
> On Mon, Apr 14, 2025 at 09:03:42PM +0200, Greg KH wrote:
> > On Mon, Apr 14, 2025 at 07:55:51PM +0200, Alan Borzeszkowski wrote:
> > > Hello everyone,
> > > 
> > > This patch series introduces the creation of symlinks between
> > > Thunderbolt/USB4 ports and their corresponding USB Type-C ports. The
> > > primary goal is to provide users with clear visibility into which USB4
> > > port is connected via a specific Type-C port. This provides the same
> > > functionality that is already present in Chromebooks.
> > 
> > "mapping" in what way?  sysfs links?  If so, care to add
> > Documentation/ABI/ updates?
> 
> It is already there:
> https://docs.kernel.org/admin-guide/abi-testing.html#abi-sys-bus-thunderbolt-devices-usb4-portx-connector
> 
> The link is already created on Cromebooks like Alan explained, because
> there each USB4/TBT port has a device node in the ACPI tables with the
> appropriate _PLD (Physical Location of Device), but on systems
> targeted primarily for Windows, that is not the case. There ports do
> not have device nodes, so we can't make the link based on _PLD.
> 
> This series makes that same link by taking advantage of the
> "usb4-host-interface" _DSD device property [1] that we always have on
> those Windows platforms. That same device property that we also use in
> drivers/usb/code/usb-acpi.c, and probable some other places too.
> 
> [1] https://www.usb.org/sites/default/files/D1T2-2%20-%20USB4%20on%20Windows.pdf

Thanks for the information, sorry I had missed that it was already
there.

greg k-h

