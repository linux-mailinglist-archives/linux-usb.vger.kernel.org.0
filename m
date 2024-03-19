Return-Path: <linux-usb+bounces-8087-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF34A87FD1B
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 12:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 642EE1F22DCB
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 11:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597107EF1D;
	Tue, 19 Mar 2024 11:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b62alnnp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500357EEF6
	for <linux-usb@vger.kernel.org>; Tue, 19 Mar 2024 11:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710848717; cv=none; b=BlGgM1xMF2TUVNlAs31GgLP15nc6MWCKT9nF+j03PNQA5j/rey6vdkwCvGQ6tWrqfo53xEJgdrXIUL5poI0c2Ac/E8R8tnw6jn2Ag2zgI7KvuMi+0fkF4+iIw8n+okAldIUmqs4OzOl6Tv68IiBSCOa4vVkxpviidVG1bKyGm98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710848717; c=relaxed/simple;
	bh=KRwgi/bWopD1nq5ZZYh0oXQ7vaVdwDzerWU57608VaE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=RhWszi3OQu1v6K1UXeO8/WI/+TJUfHSR3r9SoELdiY43iK+wWrnmzxScfc2FFDsrLl1inHuH+hSk6xC0FbsKH8l9w4y3C0jQ7nwYCWJnYkxxWYW4+Hw+dxXmz5TQOAQuTbcwH9x+obdOSpi4qh2WW7JNvBYqpY1nObzwkYUh7Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b62alnnp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710848716; x=1742384716;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=KRwgi/bWopD1nq5ZZYh0oXQ7vaVdwDzerWU57608VaE=;
  b=b62alnnpw6zFF4p+znca5IepVq7fNJLpL+bWpMNU0Kksw0NBoIiKapN4
   ezai2CnEJVgX7ZsPeoh4gPelQr20Q+0pEmhmnSqp6JrCu+R3mL/4u2S+D
   iimXA3faTndeOlQKxqnWaeUcn5aYMsPv6O7BKH/oensahLjPC3Ld3fRy+
   J8Txp5mjT8B58ToppJ9a910WVB6bkvDhMZ463DF6SlqCgxW/2iGs3wLnQ
   U/n+gL/nqJZ1pTx8evY4YQMxNxWYdIsBHOwmYhDxuzqOTaEKfVgVORSyC
   aC6G/WC5MqMAi2OHMrii7jvGrblfLesuFkhqlhnZm1IwTsdyX8MM4ejzG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="8654389"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="8654389"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 04:45:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="937061693"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="937061693"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 19 Mar 2024 04:45:13 -0700
Message-ID: <3818bd2d-2785-76fa-6dc0-8ebf140c2969@linux.intel.com>
Date: Tue, 19 Mar 2024 13:46:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Zhangzhansheng <zhang.zhansheng@h3c.com>
Cc: Ladislav Michl <oss-lists@triops.cz>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Sneeker Yeh <sneeker.yeh@gmail.com>, Wangxiaoqing <wangxiaoqing@h3c.com>,
 Xinhaining <xinhaining@h3c.com>
References: <048702a6438a4bcc87c829ccce599826@h3c.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [Consulting about: whether the usb "hub workqueue" has
 concurrency]
In-Reply-To: <048702a6438a4bcc87c829ccce599826@h3c.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.3.2024 5.52, Zhangzhansheng wrote:
> Mathias：
> 
> I am so sorry to trouble you again.
> 
> The kernel version is 6.7, I recently am confused with the schedule mechanism of usb hub workqueue scheduling mechanism.
> 
> When inserting one KingSton USB3.0 U disk in the host, one workA: “hub_event “had been waken up and the work is corresponding to USB3.0 RootHUB.
> But during the initialization of the KingSton USB3.0 U disk, owing to firstly reading device descriptor timeout, then it disabled the
> USB3.0 RootHUB port which bringing up that the USB3.0 RootHUB port switched to USB2.0 RootHUB port. Then I found that another one workB using the
> same callback function of hub_event is initializing one USB full speed device. And the work of workB is one USB2.0 RootHUB.
> However, the workA has not been completed, another workB has been dispatched. The workA and workB uses the same callback function”hub_event” and different work:
> The work of workA is the pointer address of USB3.0 RootHUB, the work of workB is the pointer address of USB2.0 RootHUB.
> 
> Based on the above phenomenon analysis, I think that workA and workB has the existence of concurrency, am I right?
> Creating the Hub workqueue, the flags is WQ_FREEZABLE. The code is as follow：

Every hub has a hub_wq workqueue.

USB3 hubs, including USB3 roothubs, are special.
They are both USB2 and USB3 hub devices at the same time.

All other devices are enumerated either as a USB3 or as a USB2 (or slower) device.

If a USB3 device detects USB3 terminations it will enumerate as a USB3 device, and only be
visible for the USB3 hub. In some enumeration failure cases the USB3 device might fall back
to USB2, but will then only appear behind the USB2 hub.
This could be what is going on in your case.

There are some cases where we have to worry about USB2 and USB3 ports concurrency.
for example xHC hosts can't address more than one device at a time even if they are
behind different hubs. For this we have the hcd->address0_mutex. Then there is
some port power control that may affect both the USB2 and USB3 side of a connector.

Thanks
Mathias



