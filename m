Return-Path: <linux-usb+bounces-3100-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E5C7F3055
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 15:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58A441C21B11
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 14:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1918D54F9C;
	Tue, 21 Nov 2023 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOS1oT+A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438EA10C1;
	Tue, 21 Nov 2023 06:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700575740; x=1732111740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S7FWmcXN79Vx+j4cixX7ygbYhrBJf1bmjbAASxLRWaA=;
  b=VOS1oT+AvYN/oyzLTQ65zmwmD7T4jnfU6j1oqG49nU2SEeUhiHwQ1xqT
   Kd/0cKMt8HVt0ccs1uJu1qi1D9h+DnHmoNKiq24kjZcRN/rdTGT1xtl6V
   Ew9K8oevx+nWo6EEtVoP/24ewcPHbvmFYSwG6oyRiqIuQPAoxvi6x6yC+
   Q9gAMyIOcNDoKthF4/mvAuHWeHGSGXTH6dGRlWuzr0vQkzqjvZTtbLb1X
   bpstuLXAw1zXzyhjKmy7LHvm2vXQG3NXu3MTy/OBArTGVdeKuxY8ej3aM
   UwHTQnw1teMFTGrUqPeSZ95BFczekpjJEv83KxxVc+y2ROsamxcxGocNK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="382242013"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="382242013"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 06:08:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="766660042"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="766660042"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga002.jf.intel.com with SMTP; 21 Nov 2023 06:08:57 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 21 Nov 2023 16:08:56 +0200
Date: Tue, 21 Nov 2023 16:08:56 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: Unplugging USB-C charger cable causes `ucsi_acpi USBC000:00:
 ucsi_handle_connector_change: ACK failed (-110)`
Message-ID: <ZVy5+AxnOZNmUZ15@kuha.fi.intel.com>
References: <b2466bc2-b62c-4328-94a4-b60af4135ba7@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2466bc2-b62c-4328-94a4-b60af4135ba7@molgen.mpg.de>

On Tue, Nov 21, 2023 at 12:50:43PM +0100, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> On the Dell XPS 13, BIOS 2.21.0 06/02/2022, with Debian sid/unstable and
> Linux 6.5.10, when unplugging the (Dell) USB Type-C charger cable, Linux
> logs the error below:
> 
>     ucsi_acpi USBC000:00: ucsi_handle_connector_change: ACK failed (-110)
> 
> As this is logged with level error, can this be somehow fixed?
> 
>     drivers/usb/typec/ucsi/ucsi.c: dev_err(ucsi->dev, "%s: ACK failed (%d)",
> __func__, ret);
> 
> Please find the output of `dmesg` attached.

Thanks. The firmware not reacting to the ACK command is weird, but I'm
not sure if it's critical. Does the interface continue working after
that? Do you see the partner devices appearing under /sys/class/typec/
when you plug them, and disappearing when you unplug them?

thanks,

-- 
heikki

