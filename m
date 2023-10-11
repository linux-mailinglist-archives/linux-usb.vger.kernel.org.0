Return-Path: <linux-usb+bounces-1441-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE337C4E82
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 11:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9150C2822B4
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 09:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C191C2A9;
	Wed, 11 Oct 2023 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b4jF+Xmr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A9A1A27A
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 09:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA638C433C8;
	Wed, 11 Oct 2023 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697016321;
	bh=H6hczvEGO5lDOEmW4bdM01igMaYzI5yA6f/BcJPMAOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4jF+XmrdukufeT4JGseh7EHMH6K0d+at2C4b79eGN8CrJEVqPMRB2aPfVMqoIx0l
	 1l1IccuQR6q6lzkyWVW4m27Z27pw0oos2Bo0m4+vbiFdvp8ELn+4Z9CDM0Ki6CUWWE
	 Xix480nXqB+7mo6GSwQo30yokMLEsDc+E80INVt8=
Date: Wed, 11 Oct 2023 11:25:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: wsa@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexander.Deucher@amd.com, Richard.Gong@amd.com,
	kai.heng.feng@canonical.com, sebastian.reichel@collabora.com,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v3] usb: typec: ucsi: Use GET_CAPABILITY attributes data
 to set power supply scope
Message-ID: <2023101102-pointless-causing-2269@gregkh>
References: <20231009184643.129986-1-mario.limonciello@amd.com>
 <ZSUOcdtWQ/AlAH+c@kuha.fi.intel.com>
 <1e8c1db9-5d52-4b39-8bdf-7d7d70ed1157@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e8c1db9-5d52-4b39-8bdf-7d7d70ed1157@amd.com>

On Tue, Oct 10, 2023 at 12:49:35PM -0500, Mario Limonciello wrote:
> On 10/10/2023 03:42, Heikki Krogerus wrote:
> > On Mon, Oct 09, 2023 at 01:46:43PM -0500, Mario Limonciello wrote:
> > > On some OEM systems, adding a W7900 dGPU triggers RAS errors and hangs
> > > at a black screen on startup.  This issue occurs only if `ucsi_acpi` has
> > > loaded before `amdgpu` has loaded.  The reason for this failure is that
> > > `amdgpu` uses power_supply_is_system_supplied() to determine if running
> > > on AC or DC power at startup. If this value is reported incorrectly the
> > > dGPU will also be programmed incorrectly and trigger errors.
> > > 
> > > power_supply_is_system_supplied() reports the wrong value because UCSI
> > > power supplies provided as part of the system don't properly report the
> > > scope as "DEVICE" scope (not powering the system).
> > > 
> > > In order to fix this issue check the capabilities reported from the UCSI
> > > power supply to ensure that it supports charging a battery and that it can
> > > be powered by AC.  Mark the scope accordingly.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: a7fbfd44c020 ("usb: typec: ucsi: Mark dGPUs as DEVICE scope")
> > > Link: https://www.intel.com/content/www/us/en/products/docs/io/universal-serial-bus/usb-type-c-ucsi-spec.html p28
> > > Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > 
> > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Thanks!
> 
> Greg, this behavior is pretty awful with the hang at bootup on these OEM
> systems, do you think this can come into one of the 6.6-rcX or should it
> wait until 6.7?

I'll queue it up for 6.6-final, thanks.

greg k-h

