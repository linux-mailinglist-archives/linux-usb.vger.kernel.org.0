Return-Path: <linux-usb+bounces-21318-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E3EA4D642
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 09:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3725B18971B3
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 08:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBD61FAC4B;
	Tue,  4 Mar 2025 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8/wuOFa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B381F583F
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741076855; cv=none; b=Aai+u+1wkcPjFhcNzu+GN+UYAVjIwIx4uDAdAGOrgkgKQPdTMnR2jmqyf/7gNN9+yHr2PgoEZ0x0afJlutHuAIzha5rcJ8b8JZAvujSUzZugN0uQITkQkXDYQDrQI2xgGfXdSyHBIK/fZCU2ZWakzCJO4YpexP6ujkp6Godhwaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741076855; c=relaxed/simple;
	bh=T5J3w/9UrLvKCuYsWxe7JB1JMQzNU3rDOKk3oiG3fGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5wtPYnuNHKfdAmcBujNndwCdvoEA/bkCRUIvo/tolm+o3s7FtEc8c92/MPOEDPLj7ojCQ45CrX+5nQ3sLLiwcGiZS+lpDiVjEg8oPxlBAIg5SndhMRioNBO35GfhYCZCjLQ7LrHvDkj4iSOF0sxObTQMYK6mGtzo7aU/8VOIXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8/wuOFa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741076854; x=1772612854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T5J3w/9UrLvKCuYsWxe7JB1JMQzNU3rDOKk3oiG3fGs=;
  b=f8/wuOFaKM3DEqtNRrrmY/ykxmfj+kusNiv2NiRfjHSIIOEh9+7EeBBk
   kXA0BG0QokrIuHKhfuTOIaQZiNVXEWS8XvQgQw1KJ/46yWKSVXLEq/A/l
   OQgx5e/hs0LIpNvoIOAQmk8kjWYkBl0DU+uEx5nHkR+wYSMh9TzCU1mvE
   l2n+Ye+3Q4xIc4K5wIpdrr6aHm8WUafK0Ja3Y9PY5LxnIxR8GixeHml8Y
   Wnhr2YeQWv+lNOJ08C688D33YLVPeX+AfjJ4+nQnsGUwYim9JsbIXmlsJ
   vU5KmGCzut/ik2sucrbBJZo+eCAszH9XgUrKTrA9mJClGBvP1ujI6iEBj
   A==;
X-CSE-ConnectionGUID: xt4HAgkASMGxOGEw28SU9g==
X-CSE-MsgGUID: Eucw1epcTtet7piH0NPHkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45909309"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="45909309"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 00:27:33 -0800
X-CSE-ConnectionGUID: smmJFFIjTLayWsijZP/Ecg==
X-CSE-MsgGUID: M0arivt0QzGvLvVL0aeGhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="141531588"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2025 00:27:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 78D3618F; Tue, 04 Mar 2025 10:27:31 +0200 (EET)
Date: Tue, 4 Mar 2025 10:27:31 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
Message-ID: <20250304082731.GF3713119@black.fi.intel.com>
References: <20250303132327.GW3713119@black.fi.intel.com>
 <20250303134618.GX3713119@black.fi.intel.com>
 <24ef839c-8fa5-4a19-b9c6-0a267aab84f5@panix.com>
 <20250303140156.GY3713119@black.fi.intel.com>
 <567725a5-f984-4ea1-bd38-8815825c1211@panix.com>
 <20250303142058.GA3713119@black.fi.intel.com>
 <402bcee8-030a-45bf-834b-ea4baf5eed3c@panix.com>
 <20250303175818.GB3713119@black.fi.intel.com>
 <007b005f-a6d1-44a2-9795-036c8f397274@panix.com>
 <48ef4c14-55d5-4baa-b862-f9e7368ed950@panix.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <48ef4c14-55d5-4baa-b862-f9e7368ed950@panix.com>

On Mon, Mar 03, 2025 at 11:44:13AM -0800, Kenneth Crudup wrote:
> 
> On 3/3/25 10:20, Kenneth Crudup wrote:
> 
> > Building now. Fingers crossed!
> 
> So far, so good- tried a variety of suspend/hibernate with/without scenarios
> on none, one and two connected monitors, and I can't get any resume OOPSes.
> Nice!

Okay cool, let me know any findings.

> I did see one anomaly I haven't seen before, but I'm not sure if it's
> related to this patch (or original commit, masked by the OOPS) or not. For
> some reason after resuming from the 2nd or 3rd hibernation cycle my Belkin
> Dock couldn't get authorized by boltd after I'd plugged it in
> post-hibernation-resume. It was indeed authorized the first time
> (post-hibernate) with the new code (was plugged in at the time of resume):
> 
> ----
> 2025-03-03T10:39:34.405568-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] parent is 63ae8780-500c...
> 2025-03-03T10:39:34.406815-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] connected: connected
> (/sys/devices/pci0000:00/0000:00:0d.2/domain0/0-0/0-1)
> 2025-03-03T10:39:34.406995-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] auto-auth: authmode: enabled,
> policy: iommu, iommu: yes -> ok
> 2025-03-03T10:39:34.407094-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] auto-auth: security: iommu+user
> mode, key: no -> ok
> 2025-03-03T10:39:34.407287-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] authorize: authorization
> prepared for 'user' level
> 2025-03-03T10:39:34.408876-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] udev: device changed:
> authorizing -> authorizing
> 2025-03-03T10:39:34.412223-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] udev: device changed:
> authorizing -> authorizing
> 2025-03-03T10:39:34.417191-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] authorize: finished: ok (status:
> authorized, flags: 0)
> 2025-03-03T10:39:34.417414-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] auto-auth: authorization
> successful
> 2025-03-03T10:39:34.419207-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] udev: device changed: authorized
> -> authorized
> 2025-03-03T10:47:42.252854-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] disconnected
> (/sys/devices/pci0000:00/0000:00:0d.2/domain0/0-0/0-1)
> ----
> 
> But after that, it wouldn't get authorized again until I'd rebooted:
> ----
> 2025-03-03T10:47:42.252854-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] disconnected
> (/sys/devices/pci0000:00/0000:00:0d.2/domain0/0-0/0-1)
> 2025-03-03T10:49:24.319123-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] parent is 63ae8780-500c...
> 2025-03-03T10:49:24.320239-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] connected: connected
> (/sys/devices/pci0000:00/0000:00:0d.2/domain0/0-0/0-1)
> 2025-03-03T10:49:24.320320-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] auto-auth: authmode: enabled,
> policy: iommu, iommu: yes -> ok
> 2025-03-03T10:49:24.320368-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] auto-auth: security: iommu+user
> mode, key: no -> ok
> 2025-03-03T10:49:24.320449-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] authorize: authorization
> prepared for 'user' level
> 2025-03-03T10:49:24.320539-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] udev: device changed:
> authorizing -> authorizing
> 2025-03-03T10:49:24.321698-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] udev: device changed:
> authorizing -> authorizing
> 2025-03-03T10:49:24.335697-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] authorize: finished: FAIL
> (status: auth-error, flags: 0)
> 2025-03-03T10:49:24.335817-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] auto-auth: authorization failed:
> kernel error: write error: Cannot allocate memory

This could happen if you unplug the device (or the link goes down) in the
middle of creating PCIe tunnel, it ends up returning -ENOMEM. If you have
dmesg with "thunderbolt.dyndbg=+p" that would help to confirm.

In any other cases (e.g you did not unplug in the middle) this is unexpected.

> 2025-03-03T10:49:59.011121-08:00 xps-9320 boltd[1240]:
> [c2010000-0072-Thunderbolt 3 Dock Core    ] disconnected
> (/sys/devices/pci0000:00/0000:00:0d.2/domain0/0-0/0-1)
> ----
> 
> Oh, and while I couldn't see any of the USB functions of the dock, the DP
> tunnel was working, the external (cable-attached) monitor was on. There were
> no kernel messages from the failure either (but I didn't have TB dyndbg
> turned on).
> 
> Several attempts at reconnecting and a fully-disconnected power-cycle of the
> dock gave the same error until I'd rebooted the laptop. What's interesting
> is my CalDigit dock had no problem being recognized when I'd plugged it in
> during these failures:
> 
> ----
> 2025-03-03T11:03:33.383513-08:00 xps-9320 boltd[1240]: [80a78780-00b3-TS4
> ] parent is 833f8780-3179...
> 2025-03-03T11:03:33.385441-08:00 xps-9320 boltd[1240]: [80a78780-00b3-TS4
> ] connected: connected
> (/sys/devices/pci0000:00/0000:00:0d.3/domain1/1-0/1-1)
> 2025-03-03T11:03:33.385585-08:00 xps-9320 boltd[1240]: [80a78780-00b3-TS4
> ] auto-auth: authmode: enabled, policy: iommu, iommu: yes -> ok
> 2025-03-03T11:03:33.385635-08:00 xps-9320 boltd[1240]: [80a78780-00b3-TS4
> ] auto-auth: security: iommu+user mode, key: no -> ok
> 2025-03-03T11:03:33.385733-08:00 xps-9320 boltd[1240]: [80a78780-00b3-TS4
> ] authorize: authorization prepared for 'user' level
> 2025-03-03T11:03:33.387211-08:00 xps-9320 boltd[1240]: [80a78780-00b3-TS4
> ] udev: device changed: authorizing -> authorizing
> 2025-03-03T11:03:33.389891-08:00 xps-9320 boltd[1240]: [80a78780-00b3-TS4
> ] udev: device changed: authorizing -> authorizing
> 2025-03-03T11:03:34.395468-08:00 xps-9320 boltd[1240]: [80a78780-00b3-TS4
> ] authorize: finished: ok (status: authorized, flags: 0)
> 2025-03-03T11:03:34.395641-08:00 xps-9320 boltd[1240]: [80a78780-00b3-TS4
> ] auto-auth: authorization successful
> 2025-03-03T11:03:34.395943-08:00 xps-9320 boltd[1240]: [80a78780-00b3-TS4
> ] udev: device changed: authorized -> authorized
> ----
> 
> I'll keep an eye out for it if it happens again, but at least it's not
> crashing!

If possible add "thunderbolt.dyndbg=+p" now to your kernel command line so
if this happens again, we hopefully have full dmesg to investigate.
Otherwise it is hard to diagnose.

