Return-Path: <linux-usb+bounces-30948-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA94C88E4E
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 10:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E2FA34E33D2
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 09:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F45E2D23B8;
	Wed, 26 Nov 2025 09:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+UJv/4r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38668276028
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764148526; cv=none; b=BLFiUQovmj5fJx8Tv5cExjhV9GRp0Ckid5fadPtXLyeZsv7fFlg7g5z+v+v8sZQtexEKT/67AMNEUoZ3FIhT03HUqLKYmagHrHVRRZehPkSveqTcz0T9azxXkegETbrwkmEo08nRJW3J7KjIy9Y7QQ71TFLmRQCWpUJSrRsUx6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764148526; c=relaxed/simple;
	bh=nianUayu567CnXE5ZGCgyj5/EKkuOZm2xuRGP+hVrXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rda8A6nZucPpNzmzFLbLG03KjUb5WzT8P65p8UlNw5M5m2TxAJdT8JsuwFaTOaGsVeyse47YOFXM65zy9Pqohdc/Ru+Oot0cPt/Kn7syV2HeHMBBpIjvylKxtNngcfZiewEmXP4kmt316Pbtk74SbYcVEoNliibxVgrccyE/G1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+UJv/4r; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764148526; x=1795684526;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nianUayu567CnXE5ZGCgyj5/EKkuOZm2xuRGP+hVrXM=;
  b=f+UJv/4rMdYq8P4pt76yIv+M8T6kFIxML9wI4xfu3kr37Ats4Xhmtq65
   /G7mC+DKsh/mTBynBSLhffgjdYWm3mZOkVHLo9oM0XRArmBZy2qXzud/Q
   kDKpm+dwbcA+7Wil/NBqMg8zXp43XMUj6164/dSQgupB+LXFiQDfW0GZN
   7jv1J8vfGlT7VNjaWmfVydk7wgdYIvgYR2dqJSBt9jAXDeyqHYWGk3MLR
   9vtP8/z70lDKepUZNJ1n1lUxK5Dv5+LT3xHXV/rY4jBgTiofvvADjBozp
   SYX3g6VECjxTKRhdCi0uzaQYpu+l5DJHXu68sK48S1piu6TivZKIagWUk
   Q==;
X-CSE-ConnectionGUID: g7i9tq64Tm+0cNex4jmyGw==
X-CSE-MsgGUID: y/3sM//lQQ6MHydkDwdAWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66137507"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66137507"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:15:21 -0800
X-CSE-ConnectionGUID: EFx2x2mmRKO97HKFZRP90g==
X-CSE-MsgGUID: +4ELEEOjQcuUtcp0F/M0Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="223605279"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.124]) ([10.245.245.124])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:15:19 -0800
Message-ID: <e7e984f4-4aa7-4428-8da4-b48d55f32098@linux.intel.com>
Date: Wed, 26 Nov 2025 11:15:16 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xhci: dbgtty: fix device unregister: fixup typo
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>
References: <20251125142532.2550612-1-ukaszb@google.com>
 <2025112616-gestate-disperser-c055@gregkh>
 <CALwA+NYBSH01FVcggf9nNbW83sRp0GH-4jKL0ByYNTM7vz-pHg@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CALwA+NYBSH01FVcggf9nNbW83sRp0GH-4jKL0ByYNTM7vz-pHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/26/25 09:58, Łukasz Bartosik wrote:
> On Wed, Nov 26, 2025 at 8:15 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Tue, Nov 25, 2025 at 02:25:31PM +0000, Łukasz Bartosik wrote:
>>> From: Łukasz Bartosik <ukaszb@chromium.org>
>>>
>>> When DbC is disconnected then xhci_dbc_tty_unregister_device()
>>> is called. However if there is any user space process blocked
>>> on write to DbC terminal device then it will never be signalled
>>> and thus stay blocked indefinitely.
>>>
>>> This fix adds a tty_vhangup() call in xhci_dbc_tty_unregister_device().
>>> The tty_vhangup() wakes up any blocked writers and causes subsequent
>>> write attempts to DbC terminal device to fail.
>>>
>>> Fixes: dfba2174dc42 ("usb: xhci: Add DbC support in xHCI driver")
>>> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
>>> Link: https://patch.msgid.link/20251119212910.1245694-1-ukaszb@google.com
>>>
>>> Fix typo indifinitely->indefinitely
>>>
>>> --
>>> 2.52.0.460.gd25c4c69ec-goog
>>>
>>
>> I see no patch here :(
> 
> Hi Greg,
> 
> The typo I fixed was in the commit message indifinitely->indefinitely.
> 
> Would you please elaborate what is your expectation for a fixup in this case ?
> 

A fixup patch is just a new patch that is applied on top of the first.

If the typo was in the commit message then it can't be helped.

I still think we need a fixup patch for the missing null check

-	tty_vhangup(port->port.tty);
+	if (port->port.tty)
+		tty_vhangup(port->port.tty);

or just use tty_port_tty_vhangup()

Remember to add Jiri Slaby and stable to CC, and a new Fixes tag
Fixes: 1f73b8b56cf3 ("xhci: dbgtty: fix device unregister")

Thanks
Mathias



