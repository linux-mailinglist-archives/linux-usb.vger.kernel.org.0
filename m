Return-Path: <linux-usb+bounces-11366-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4870790AD18
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 13:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB05A283D9A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 11:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1E1194AD4;
	Mon, 17 Jun 2024 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ku4wdtJb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F8F19069A
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 11:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718624361; cv=none; b=sLFpef+iWOigbojkGwrys6DWhP3Z4Eb3uiq4nKmfiV+inHA3MsJp/zPWdO343WyInYx6aocHcBiAyk8cHTea/qlrjgWnq5zeippkRrQD0vSlZ5DnFMoOy9DpK5AHsqXEJPru0K3KG3KxWJPTzvkl/21aoajRRkrcZvzuFn4JJ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718624361; c=relaxed/simple;
	bh=2yx+we9YM63GoJ0nfvvPSBPPr/bM2J9wb9w6B7G7fCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/vsgJ1RQ3Qzz88isgI7jUrzj/UWRqcQ1ypYSiG+6zvuccK09vty21frtLVMmxlTi9tQyGpgskFusJpmnkLrih5R4nB9sf9RnOyzWcu0NbdCyTXrCD5TMlwB6vVs6K6kWuCt4oMENkh4LkdggfXtGa1a0sJSaQIxnwY9F4p17Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ku4wdtJb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF04C2BD10;
	Mon, 17 Jun 2024 11:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718624360;
	bh=2yx+we9YM63GoJ0nfvvPSBPPr/bM2J9wb9w6B7G7fCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ku4wdtJbszNf1uRvu/vk/U/ZPGoCCJMfsLzbUex5R9T/ro1Zle6zVx2ZMKS+dVyJ8
	 pbKpmmcl+Xg8Ns143b5+Hmjt28GWESMC0Fp5CVsyzukFoBKbDZVYmLETvqgc2qk0mf
	 tt/25OkaORKpsK9DoWY+OHDP1mk3RCQlVV/FIgEI=
Date: Mon, 17 Jun 2024 13:39:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: psy: Expose the charge-type property
Message-ID: <2024061701-overeater-purifier-beca@gregkh>
References: <20240617105554.1677285-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617105554.1677285-1-heikki.krogerus@linux.intel.com>

On Mon, Jun 17, 2024 at 01:55:54PM +0300, Heikki Krogerus wrote:
> UCSI has this information in the Battery Charging Capability
> Status, so making it available for the user.

Make it availble how?  To what user?  Through what api?

thanks,

greg k-h

