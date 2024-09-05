Return-Path: <linux-usb+bounces-14680-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7333D96CEC2
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 07:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BB4D285035
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 05:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB1815884D;
	Thu,  5 Sep 2024 05:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRTA2pq2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC1B14B06A
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 05:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725515616; cv=none; b=gn6nylC1kJqM+VTxUToRu8iSO8dslu993RVKZkeN+oyx6GkRrAMXU/UfMySzfq3NIpHL6gZrxOpzdLTL1CfCcfCss8N4WjQdmuZQJOmVwgNG+QHN87nVDv+2YDHhpqsgcIk0EMDTz319jle5fXjv5wpIOcg5c+UNrx7Dsahqgm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725515616; c=relaxed/simple;
	bh=WjUsQrQFZwZHO6ueCRn6NfRlTQyL87OevTPp35gYVeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deEO+75jxKyw/TQA8BMTpYoM7rY9fMdDzlcLYZCQHIsvJcb0iMmvPwFkMkVUW8dfjONSm3iitPTNrLufN928uPNx/F5A4fSUk+McS9yC/DIGJOqjlVS6NlvTwm1jAnZ0SVR8gGbmOvYH+vJF8RjbfIw+L6iVbAl+g2gtHXseizQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRTA2pq2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725515615; x=1757051615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WjUsQrQFZwZHO6ueCRn6NfRlTQyL87OevTPp35gYVeQ=;
  b=iRTA2pq2Y3PMBMSZe3qG6gHqNEiNuYL7n6BeD09gi2UHlMl5qL8oV2De
   d+koIlVu97MrmkxRoR/j65vB48Gqzrm/fW1PLKWnM6iCCw9KvA/CToPDZ
   rr1lnRXYLjOI/t+VikPuOiYA0QikpPFXqyX4NLe80SoDbaQyeP4ErD1u7
   0GgXlyqrUcte5AGxjIQnCYeuA5zho3PdH5j2lEd4ft0A92Br0I7XVOWBB
   YWeGsgSyZC6c5bXJV4nvsv1k5BvjmhwvH2ihN/R8EevppSLJzfdpbWk95
   JbqAJXHxnn0lbWlMDiP0qz2n5S/S/t0D9Up7F98hx5N53utzgSgsuvGHm
   w==;
X-CSE-ConnectionGUID: 9cq8VEsoTdqAPdXajW4hGw==
X-CSE-MsgGUID: DTBDrphCQvG56wSa95zI6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27960585"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="27960585"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 22:53:34 -0700
X-CSE-ConnectionGUID: UI6ZDcDWSNuf297l7jt5bg==
X-CSE-MsgGUID: x5d8OtTmTyuF4XIwCssjLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="65165132"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 04 Sep 2024 22:53:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id DA98C179; Thu, 05 Sep 2024 08:53:30 +0300 (EEST)
Date: Thu, 5 Sep 2024 08:53:30 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, "Rangoju, Raju" <Raju.Rangoju@amd.com>,
	Sanath S <Sanath.S@amd.com>, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 0/4] Add device links between tunneled USB3 devices
 and USB4 Host
Message-ID: <20240905055330.GH1532424@black.fi.intel.com>
References: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
 <321cf204-cf74-4f51-8ed3-8c5738444359@amd.com>
 <20240904050013.GZ1532424@black.fi.intel.com>
 <7a3fc5cd-1705-40ab-8d93-d9f286009aa7@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a3fc5cd-1705-40ab-8d93-d9f286009aa7@amd.com>

On Wed, Sep 04, 2024 at 12:38:15PM -0500, Mario Limonciello wrote:
> ❯ ls -l /sys/bus/pci/drivers/thunderbolt/*/consumer*
> lrwxrwxrwx 1 root root 0 Sep  4 12:33
> /sys/bus/pci/drivers/thunderbolt/0000:c4:00.5/consumer:pci:0000:00:03.1 ->
> ../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:00:03.1/
> lrwxrwxrwx 1 root root 0 Sep  4 12:33
> /sys/bus/pci/drivers/thunderbolt/0000:c4:00.6/consumer:pci:0000:00:04.1 ->
> ../../../virtual/devlink/pci:0000:c4:00.6--pci:0000:00:04.1/
> ❯ cat /sys/bus/pci/drivers/thunderbolt/*/power/runtime_status
> suspended
> active
> 
> I would have expected the USB4 host router to go back into runtime PM, but
> it doesn't anymore until I reboot the system.

Yes, it should enter runtime suspend after a while. Would you mind
sharing dmesg around this?

I tried on my system and it works as expected (the device-power.sh is
internal script that dumps the device power states, I can share if you
want).

Devices 0d.2/3 are the host routers. 07.[0-3] are the PCIe tunnels (not
really used here but shown for completeness, I don't have PCIe tunnel
enabled to the hub). 0d.0 is the xHCI controller.

Plug in USB4 hub
----------------

# device-power.sh -s
All PCI devices (software state)
...
0000:00:07.0 8086:7ec4 Status: [D3cold] Real status: [    D0] Runtime PM: [suspended]
0000:00:07.1 8086:7ec5 Status: [D3cold] Real status: [    D0] Runtime PM: [suspended]
0000:00:07.2 8086:7ec6 Status: [D3cold] Real status: [    D0] Runtime PM: [suspended]
0000:00:07.3 8086:7ec7 Status: [D3cold] Real status: [    D0] Runtime PM: [suspended]
...
0000:00:0d.0 8086:7ec0 Status: [D3cold] Real status: [    D0] Runtime PM: [suspended]
0000:00:0d.2 8086:7ec2 Status: [    D0] Real status: [    D0] Runtime PM: [   active]
0000:00:0d.3 8086:7ec3 Status: [    D0] Real status: [    D0] Runtime PM: [   active]

Unplug and wait for the autosuspend_delay
-----------------------------------------

# device-power.sh -s
All PCI devices (software state)
...
0000:00:07.0 8086:7ec4 Status: [D3cold] Real status: [D3cold] Runtime PM: [suspended]
0000:00:07.1 8086:7ec5 Status: [D3cold] Real status: [D3cold] Runtime PM: [suspended]
0000:00:07.2 8086:7ec6 Status: [D3cold] Real status: [D3cold] Runtime PM: [suspended]
0000:00:07.3 8086:7ec7 Status: [D3cold] Real status: [D3cold] Runtime PM: [suspended]
...
0000:00:0d.0 8086:7ec0 Status: [D3cold] Real status: [D3cold] Runtime PM: [suspended]
0000:00:0d.2 8086:7ec2 Status: [D3cold] Real status: [D3cold] Runtime PM: [suspended]
0000:00:0d.3 8086:7ec3 Status: [D3cold] Real status: [D3cold] Runtime PM: [suspended]

