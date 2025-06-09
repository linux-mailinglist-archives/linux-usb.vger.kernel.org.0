Return-Path: <linux-usb+bounces-24599-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA9DAD1E0D
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 14:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C9D43A8D7C
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 12:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5782813635C;
	Mon,  9 Jun 2025 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ri+gUFqd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB6229A5
	for <linux-usb@vger.kernel.org>; Mon,  9 Jun 2025 12:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749473229; cv=none; b=SSM6mBiEhoeByz0kMW6ZGKL0zjlvRyx702LQDwiE/+vDBegXGEPBiNalGeCUr83OYRw2xFzXyFw1j5JdmUnV7j9akIbgwF+1517H0PMyXLpmDqlo35dyqqp5tVUrBq6IpNfZ6YSfffV4zOg6/w3j4+WvfIgqPNWocqKiwfJZHcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749473229; c=relaxed/simple;
	bh=963g2f13E6OlJyLAwU3yKrWmt95bk5uhb3xofipL0vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eyMVSsfyxCPJk5zoRh3q6OtE+dTEiDvu+29U1F7sT27r6eLKUhdSW6c4/k8XmrsjUiq8S/szeId2ILuw/tQdsQaMksgPIgK27cNhkhrzYNIB75LqoYZLDeIsS/KYAL9RKYigUGL6HPVwnAGtx8y/p1N71KvRlLc2wJhqL/pvrK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ri+gUFqd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749473229; x=1781009229;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=963g2f13E6OlJyLAwU3yKrWmt95bk5uhb3xofipL0vo=;
  b=Ri+gUFqdOERl5+p3TIUWq66Dl9RYv+gQ6clOv/VaqHUwkC/VcZg+6LeD
   ogeoMDSjMEYIik4ztBhcJoG4SLz6/iIoo5FbV9ZIeh6K7Hj4UZ60V3c5P
   OHRP6FjyIG1SwB1KTc84P68D6tzyVUEhYbg1YQN4G3mnl++8+1XYpvaYV
   N/Jz5bvTLKXPndrq4YzDfl5B/Uhypi6+DQAljzc2J+aOUYNj/1ZVw00qo
   1K0X6bCEJ3HQZUydjcmmFu2zj2/JsFZlH56BBOCEsK/5w/2oV4xXwWl3P
   Na6za2YtvA9q86EaoQUUTWZmVXObwwhY3a0BJuX4tont8UeUrsmHBXYLK
   Q==;
X-CSE-ConnectionGUID: kfXoxF9GTvOCcUuLDN35Og==
X-CSE-MsgGUID: JNIQ8r6jQkmf1Rliib8xpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62201637"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="62201637"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 05:47:08 -0700
X-CSE-ConnectionGUID: UKNxlCn8SuG+VQ4S/fksmQ==
X-CSE-MsgGUID: sHKBQvCkRtKFXTR1rE9pWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="151319540"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2025 05:47:06 -0700
Message-ID: <5659ae54-6b37-4a3c-a85a-03915c3f2736@linux.intel.com>
Date: Mon, 9 Jun 2025 15:47:05 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] usb: xhci: Avoid showing warnings for dying
 controller
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
References: <20250609020223.269407-1-superm1@kernel.org>
 <20250609020223.269407-5-superm1@kernel.org>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250609020223.269407-5-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9.6.2025 4.58, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> When a USB4 dock is unplugged from a system it won't respond to ring
> events. The PCI core handles the surprise removal event and notifies
> all PCI drivers. The XHCI PCI driver sets a flag that the device is
> being removed, and when the device stops responding a flag is also
> added to indicate it's dying.
> 
> When that flag is set don't bother to show warnings about a missing
> controller.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

