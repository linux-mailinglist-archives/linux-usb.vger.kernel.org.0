Return-Path: <linux-usb+bounces-26835-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72249B25F04
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 10:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A00B01C81721
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 08:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82ACA2E975E;
	Thu, 14 Aug 2025 08:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eG6d/Wtq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA0F2E8E1D
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755160384; cv=none; b=GwaMgr/aOUXoHNvy04Cc/l5wceaSj+P36myAPpVzCrL4iw5T2YdAckALqR4poo5X2UX+G61px8LJIShYxUd+4llxRnciWiW/hQSuJtSBciZIPg83QRE5rr7WlFSGAVYmjNVjjfR98kv1o7lJgHmxZatZKfJ1/6Wq2Z0/elwZaq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755160384; c=relaxed/simple;
	bh=fOE4+FuGxAeI07oKZyLfHL9Fbc1CtVHng0E03UzPqU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mT81V2HPOnoEjFJvC7fROfeuooEvzgrd30+pf5chzfz2PaC9xjZ30w4dTvoWdPhSDO2QjVqJzkWCbFykXPAvBYG6vUb8TaFgs3AV1NDFXNY9tPgB10SIZAYGCJFoIThHsEaHf0zjfd79gr8WSN+tFF6vho1bEAoGfhT+iptE8NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eG6d/Wtq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755160383; x=1786696383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fOE4+FuGxAeI07oKZyLfHL9Fbc1CtVHng0E03UzPqU0=;
  b=eG6d/WtqAcINxkMa59NYHSomBlPanH7Uc++9N2mMPIxyvVYRmR8BaemL
   zFIFYmFVl6dupc6C+7e269Vtj7N+i1U+0gPgrAYCazDZv8Bvwl4swP/j+
   SHZWMtgzNR0AjQGnZEBCFTRnpdizpoUSUFxHYMLFfjzz+brxmGuHqCiSk
   Pc3bsvEI4n8OHpJEp25h9AgywKo3A5ESQAD0oABRLWHd7TqNJxTTTMqnx
   GMle90+dgfPsJLM7KzGUxdhneVPzECIWKU/YGAfacAeXVn2TrghKS3mYQ
   aKUQ9kZP1DiYnGDkcyn5wYQg/68vfEz3/HVJk0UD1H3tRgXUavQxZulTA
   g==;
X-CSE-ConnectionGUID: F7/Q4x72RfWJE1nxvPDw/A==
X-CSE-MsgGUID: uLEWu6KSSPSVfJ603oNMhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57186991"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57186991"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 01:33:02 -0700
X-CSE-ConnectionGUID: 53oBSir2TDKuPF0MQlKLlA==
X-CSE-MsgGUID: ji88j3hCRV+ZE6FfL1SCgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="197559349"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2025 01:33:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2B69493; Thu, 14 Aug 2025 10:32:59 +0200 (CEST)
Date: Thu, 14 Aug 2025 10:32:59 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: En-Wei WU <en-wei.wu@canonical.com>
Cc: westeri@kernel.org, michael.jamet@intel.com, andreas.noever@gmail.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Subject: Re: Thunderbolt call trace occurs on hot-plug
Message-ID: <20250814083259.GE476609@black.igk.intel.com>
References: <CAMqyJG2QceTyAONn_5m956zF_rpHLpognYYWnivm7J+w6Cw=RQ@mail.gmail.com>
 <20250728063329.GR2824380@black.fi.intel.com>
 <20250808064313.GM476609@black.igk.intel.com>
 <CAMqyJG3b5KsBjF=wW_+pB6MaSO0PQmq-iiAJ9aONZ6mZ1UtUNA@mail.gmail.com>
 <CAMqyJG1yK5B7w5Vp=LQNcWHDCdbWGiiuA0jru_U6zJ6WhUc5PQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMqyJG1yK5B7w5Vp=LQNcWHDCdbWGiiuA0jru_U6zJ6WhUc5PQ@mail.gmail.com>

Hi,

On Thu, Aug 14, 2025 at 04:21:36PM +0800, En-Wei WU wrote:
> I just ran a test using a different cable, and the issue remains.
> 
> One thing I've noticed is that no matter which cable and whether there
> is a call trace on that hot-plug event, there is always the message:
> 
> thunderbolt:tb_cfg_ack_plug:842: thunderbolt 0000:00:0d.2: acking hot
> unplug event on 0:1

That means the USB4 link went down at that point and the driver cannot do
anything else except start tearing down the devices from that point.

We could try to look bit deeper what is happening there. However, if this
is PD/cable issue then there is little we can do on software side. Anyways,
I wonder if you can repro with tracing enabled?

There is info how to do that (let me know if any questions):

  https://github.com/intel/tbtools/wiki/Useful-Commands#tracing

Can you then provide me either the merged log or dmesg and trace
separately? I can try to see if there is something suspicious happening
prior that unplug.

