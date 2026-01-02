Return-Path: <linux-usb+bounces-31871-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B8DCEE595
	for <lists+linux-usb@lfdr.de>; Fri, 02 Jan 2026 12:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 100C5302E14C
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jan 2026 11:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119CE2F12DF;
	Fri,  2 Jan 2026 11:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sduzlXxE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BF42DECBF;
	Fri,  2 Jan 2026 11:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353246; cv=none; b=XYgnHb2qgwhTZgwHooXLRZd4oqZC4Zzek40k2tQAsaDnjOaCcFM7+5E7y8W1J72feBzIE/zNjtl2a5WH9Ud2FMpN/etlIEt/IYhYuxeTAmmU3R3VMQvzVAaE3xHl3AlSPJZmrcoCem07YY5JfA65BCb1paXREHK4yBxRHVG46lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353246; c=relaxed/simple;
	bh=xbvV5fwRq66P4s5/ppnbu0eZKKjOaSgsshF9SrY4u5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iz0Zp/+AJMqTx6u33PflGRqOPi3sDNmtmqhvYNNyBEnlbk7ER5ji4jPbP2tfhjGEvdYGZW8szD5zilGKpnPwgsclJkDXZo7/NwxhBkrNo7a445WCnSXIyOJwH23QxAFIM67l28f1k00/quWZhg7/rCoKRId+LGiavfnpQ2vQuGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sduzlXxE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649F2C116B1;
	Fri,  2 Jan 2026 11:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767353246;
	bh=xbvV5fwRq66P4s5/ppnbu0eZKKjOaSgsshF9SrY4u5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sduzlXxEBW2JqVGpPpZrolHGVsvT/brBmOzas+7lORK/7/1yALAPxsD2rAVebveE7
	 3lmLCS40qEKj61+MgbMYllqQWDdgGpXzrr9xOFq5zaV24qvTMwwFkvd0mZhcr9mfwH
	 /4mq8fpe4k1qfJhJcrCPScyoITfmWM7ZQfrn/7YiYQFaTiMD4QxD69BLAmrq+smpff
	 4Sr9s8wOgjaOkARj5mnZ7KkhqWbtQk9iisOEFVCHe/RnpXToWb6EsaQ27rZipkbezL
	 CwsN80C7a2ynbR0vEbIhfVdVxKR7G5i5kwgYvuHXqLDxABTYT411Il1idyysP23lCs
	 rcbX8US3aWnXQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vbdJJ-000000004F2-0QBB;
	Fri, 02 Jan 2026 12:27:13 +0100
Date: Fri, 2 Jan 2026 12:27:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	pooja.katiyar@intel.com
Subject: Re: [PATCH] usb: ucsi: Fix null pointer dereference in
 ucsi_sync_control_common
Message-ID: <aVerkZPY-z-NjPPk@hovoldconsulting.com>
References: <20251226223054.5565-1-ivan.orlov0322@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226223054.5565-1-ivan.orlov0322@gmail.com>

On Fri, Dec 26, 2025 at 10:30:53PM +0000, Ivan Orlov wrote:
> Before 'ucsi_acknowledge' calls 'ucsi_sync_control_common', it sets
> 'message_in_size' to 0. However, if 'ucsi_register_device_pdos' was
> called after 'message_in_size' was set to 0, but before
> 
>   if (!ret && ucsi->message_in_size > 0 && *cci & ...)
> 
> condition is evaluated, 'ucsi_sync_control_common' ends up dereferencing
> 'cci' which points to NULL. This is precisely what I'm observing on my
> Framework 16 laptop on the latest mainline kernel build.
> 
> I don't see any synchronization primitives used to protect 'ucsi', so
> I presume just checking that 'cci' is not null here should fix the
> problem. It seems like prior to commit 3e082978c331 ("usb: typec: ucsi: Update UCSI structure to have message in and message out fields"),
> 'data' argument was checked in this condition, and it was always set to
> NULL from 'ucsi_acknowledge'. Thus, this problem did not exist.
> 
> Fixes: 3e082978c331 ("usb: typec: ucsi: Update UCSI structure to have message in and message out fields")
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>

This has been fixed in rc3 by reverting the offending commit:

	https://lore.kernel.org/lkml/20251222152204.2846-1-johan@kernel.org/

Johan

