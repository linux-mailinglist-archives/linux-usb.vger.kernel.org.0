Return-Path: <linux-usb+bounces-11368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3890A90AF8D
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 15:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB7C11F2122B
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 13:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991161B29AA;
	Mon, 17 Jun 2024 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQkXQAac"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99F31B1517
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 13:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630539; cv=none; b=efvE5JzeKdO7tBE5nFg4QlFRtK98rsFtn6WQfHrS2TnLS4lLGid03rNyPmOrWJKFc4e7fk+l3acsFnwGQY5R3mY0R8ArhO0TpTLK5W/cuFe+w2tokhDmFYjOkAVC9TeG0qJshijWJx/NXJ5F4MlEzm6RIvX6SCQOMEAmTJWOGgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630539; c=relaxed/simple;
	bh=dc8U02h+MY93ZrRPWh6yGlf4qG/l02XnxeeSQZOuq9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/52wGgHbAhwAPl9vvofuQbvLuvEV26szWQrxPkiJV7+Y0b1a5wUdeV/GYRtrPpWQorZL4nhl5yfS3oRu5RyLBdsoir3RaK132tSvY7hmnW3LAYqJDPCMY0MBh9FqgEIKoSlMbcNpOXbqO6heM1b1VWGD+dT28Cu8pQcZeu8P60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQkXQAac; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718630538; x=1750166538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dc8U02h+MY93ZrRPWh6yGlf4qG/l02XnxeeSQZOuq9I=;
  b=LQkXQAacB/xwO16ehxKeroOFHaiDZsV5IjszRYOtJap4KIMHaYX+VXPg
   MB0pQZ8zr9Z5dCFnA2eWx608w0xUD3gdzikTwQaKKP+Ra0q1qwD/h82tX
   0ll7egk1O6kQlTWyBIExy7+BMXCJda+muB8zz8g5A3AcmEkg0MnmThVw/
   ElSiPvZ71LFOQVRkGiuOu3UY1jzxT6CqNyoGLMSpeTd1E4KZzG2tq7U6b
   G2RHFwzEx4S73B2UOPsXhcROg0wF5fIM8tBlGcf2mgU+pnrG36ullkUoV
   6G613DfKdSwdq3Naw0rlXNoHKtED75ns+OybvkYVzIWOalRjQAoT77rX2
   g==;
X-CSE-ConnectionGUID: rWTFRr5qTtq9PYk6jV9ASg==
X-CSE-MsgGUID: 5EqjfVkiRlqru5wj49lmuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26869785"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="26869785"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 06:22:18 -0700
X-CSE-ConnectionGUID: o4XPBCkpRNSq0zwPDt3gmg==
X-CSE-MsgGUID: xxqfrPdATR+ED26Dn70GHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41658923"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa006.jf.intel.com with SMTP; 17 Jun 2024 06:22:15 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 17 Jun 2024 16:22:14 +0300
Date: Mon, 17 Jun 2024 16:22:14 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: psy: Expose the charge-type property
Message-ID: <ZnA4hhsAIPrUO6pz@kuha.fi.intel.com>
References: <20240617105554.1677285-1-heikki.krogerus@linux.intel.com>
 <2024061701-overeater-purifier-beca@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024061701-overeater-purifier-beca@gregkh>

On Mon, Jun 17, 2024 at 01:39:17PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jun 17, 2024 at 01:55:54PM +0300, Heikki Krogerus wrote:
> > UCSI has this information in the Battery Charging Capability
> > Status, so making it available for the user.
> 
> Make it availble how?  To what user?  Through what api?

This is for the power supply interface. The charge type sysfs
attribute file [1] is hidden with the UCSI power supplies. This would
"unhide" it.

I'll rewrite the commit message.

[1] https://docs.kernel.org/admin-guide/abi-testing.html#abi-sys-class-power-supply-supply-name-charge-type

thanks,

-- 
heikki

