Return-Path: <linux-usb+bounces-13456-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC48951BCD
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 15:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B94FB262D4
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 13:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670661B1418;
	Wed, 14 Aug 2024 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ak5hSjPH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339391879
	for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2024 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723642003; cv=none; b=eFHf0+dT/FdCTReSQPXa75H6dlBOlX+fIy27jzexMZXE0aWE3pTYYv5WvionO9Ihs/VC4XHMPhzb6BVm0Ie91mLqUIKxj/RsNC+b9nozrRlXYVhqVl9mXoD7sn+tqlOkRXnJUM0KHuTpLyfsBuWALvYDreloEdnK28WIN7Vk2Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723642003; c=relaxed/simple;
	bh=/c8Vs3yH/l/FD6ixA1GJXPEuFXw4w7/pQyriXaTYtOY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=GAeQqVVSZSHx4Ex9ZbhZFqvrMGd8QNz7xhUwPLiF0DknxaMvjB+1+QVylGi3ssyFaqurTsk0blOzTzCtXaSTivkk4D/r2JLMVldDE/BOvQcnCP7iSEvQaufsw2c79vzvVUmwjX2oQiumV4NYfXsCtTwNIYVBd7NrhJcM6dJFANo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ak5hSjPH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723642001; x=1755178001;
  h=message-id:date:mime-version:subject:from:to:references:
   in-reply-to:content-transfer-encoding;
  bh=/c8Vs3yH/l/FD6ixA1GJXPEuFXw4w7/pQyriXaTYtOY=;
  b=ak5hSjPHxEFxFTA0M3K/qZKPjnt81+/tUbBZgYxCWAludp4Vm9v/cVMv
   Jq+bDlCwZFG9l1pCTbJvGegbap4hr4LbJpjYdww3A34xl5Ml5NHzYnekv
   cOKUqke5njmUj2F9qAHpQ3maHjywEt3ixW3458Y6KHeer+1JYw3rApOsr
   BNLVj8T09lG/OXCDi+UhKhPq041DfGmGDd3eqhdi2d/nuVyrrNKigqaHl
   36+ZCyIdriPQswUWKsB5KCqjvoKrozDMXZ1kG1QD8QalA2+8/p5405197
   4ij/4B1o7TOKqiS4i+Vlcx7R9hUr/EBW1es25PzZ1JUAGosw0QhERoMod
   Q==;
X-CSE-ConnectionGUID: 2Cv/4CpeRLi38+IC6f4rNg==
X-CSE-MsgGUID: XiAJgPunQ8OZDRsfHjtQZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="25661296"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="25661296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 06:26:40 -0700
X-CSE-ConnectionGUID: CV9sBSMPTcuzc5mgudZZ/A==
X-CSE-MsgGUID: Yn4xMzp7QpyGwWLdTDC/sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="63898400"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa005.jf.intel.com with ESMTP; 14 Aug 2024 06:26:39 -0700
Message-ID: <bb8ca342-a975-4e87-ae8d-7c0d703a89af@linux.intel.com>
Date: Wed, 14 Aug 2024 16:28:43 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] USB xHCI driver NULL pointer dereference
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: Karel Balej <balejk@matfyz.cz>, linux-usb@vger.kernel.org
References: <D3CKQQAETH47.1MUO22RTCH2O3@matfyz.cz>
 <9f3d0886-51cb-4ec4-a060-ed0f52f7e656@linux.intel.com>
Content-Language: en-US
In-Reply-To: <9f3d0886-51cb-4ec4-a060-ed0f52f7e656@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13.8.2024 14.49, Mathias Nyman wrote:
> On 11.8.2024 1.11, Karel Balej wrote:
>> Hello,
>>
>> my machine crashed twice in the past week, the second time I have been
>> able to recover the log output (including the stack trace run through
>> scripts/decode_stacktrace.sh) which seems to suggest a bug in the xHCI
>> driver:
>>
>>     [44193.556677] usb 2-1-port5: disabled by hub (EMI?), re-enabling...
>>     [44193.556692] usb 2-1.5: USB disconnect, device number 6
>>     [44193.558532] cdc_ncm 2-1.5:1.0 enp0s29u1u5: unregister 'cdc_ncm' usb-0000:00:1d.0-1.5, CDC NCM (NO ZLP)
>>     [44193.739545] usb 2-1.5: new high-speed USB device number 7 using ehci-pci
>>     [44193.819628] usb 2-1.5: New USB device found, idVendor=18d1, idProduct=d001, bcdDevice= 6.10
>>     [44193.819637] usb 2-1.5: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>>     [44193.819641] usb 2-1.5: Product: Samsung Galaxy Core Prime VE LTE
>>     [44193.819644] usb 2-1.5: Manufacturer: Samsung
>>     [44193.819646] usb 2-1.5: SerialNumber: postmarketOS
>>     [44193.842472] cdc_ncm 2-1.5:1.0: MAC-Address: [...]
>>     [44193.842770] cdc_ncm 2-1.5:1.0 usb0: register 'cdc_ncm' at usb-0000:00:1d.0-1.5, CDC NCM (NO ZLP), [...]
>>     [44193.845829] cdc_ncm 2-1.5:1.0 enp0s29u1u5: renamed from usb0
>>     [46253.017991] perf: interrupt took too long (2506 > 2500), lowering kernel.perf_event_max_sample_rate to 79000
>>     [46709.344533] usb 3-1: new full-speed USB device number 3 using xhci_hcd
>>     [46709.458560] usb 3-1: device descriptor read/64, error -71
>>     [46709.679562] usb 3-1: device descriptor read/64, error -71
>>     [46709.895544] usb 3-1: new full-speed USB device number 4 using xhci_hcd
>>     [46710.009563] usb 3-1: device descriptor read/64, error -71
>>     [46710.231579] usb 3-1: device descriptor read/64, error -71
>>     [46710.333629] usb usb3-port1: attempt power cycle
>>     [46710.713538] usb 3-1: new full-speed USB device number 5 using xhci_hcd
>>     [46710.713699] usb 3-1: Device not responding to setup address.
>>     [46710.917684] usb 3-1: Device not responding to setup address.
>>     [46711.125536] usb 3-1: device not accepting address 5, error -71
>>     [46711.125594] BUG: kernel NULL pointer dereference, address: 0000000000000008
>>     [46711.125600] #PF: supervisor read access in kernel mode
>>     [46711.125603] #PF: error_code(0x0000) - not-present page
>>     [46711.125606] PGD 0 P4D 0
>>     [46711.125610] Oops: Oops: 0000 [#1] PREEMPT SMP PTI
>>     [46711.125615] CPU: 1 PID: 25760 Comm: kworker/1:2 Not tainted 6.10.3_2 #1
>>     [46711.125620] Hardware name: Gigabyte Technology Co., Ltd. To be filled by O.E.M./Z77-D3H, BIOS F18 08/21/2012
>>     [46711.125623] Workqueue: usb_hub_wq hub_event [usbcore]
>>     [46711.125668] RIP: 0010:xhci_reserve_bandwidth (drivers/usb/host/xhci.c:2392 drivers/usb/host/xhci.c:2758) xhci_hcd
> 
> Thanks for the report.
> 
> You have a unlucky setup here.
> This could only happen when a full speed device fails enumeration while connected to a
> Pantherpoint xHC.
> 
> Only Pantherpoint xHC (PCI_ID 0x1e31) does bandwidth calculation in software and
> calls xhci_reserve_bandwidth(). In this case we unintentionally end up calling it
> after a failed  address device attempt when usb core re-inits endpoint 0 before retry.
> At this point the xhci side of the device isn't properly allocated or set up so
> we hit a NULL pointer dereference.
> 
> I'll look into it more.

The following code should resolve this issue, any chance you could try it out?

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 9a8627e42898..a69245074395 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2837,7 +2837,7 @@ static int xhci_configure_endpoint(struct xhci_hcd *xhci,
                                 xhci->num_active_eps);
                 return -ENOMEM;
         }
-       if ((xhci->quirks & XHCI_SW_BW_CHECKING) &&
+       if ((xhci->quirks & XHCI_SW_BW_CHECKING) && !ctx_change &&
             xhci_reserve_bandwidth(xhci, virt_dev, command->in_ctx)) {
                 if ((xhci->quirks & XHCI_EP_LIMIT_QUIRK))
                         xhci_free_host_resources(xhci, ctrl_ctx);
@@ -4200,8 +4200,10 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
                 mutex_unlock(&xhci->mutex);
                 ret = xhci_disable_slot(xhci, udev->slot_id);
                 xhci_free_virt_device(xhci, udev->slot_id);
-               if (!ret)
-                       xhci_alloc_dev(hcd, udev);
+               if (!ret) {
+                       if (xhci_alloc_dev(hcd, udev) == 1)
+                               xhci_setup_addressable_virt_dev(xhci, udev);
+               }
                 kfree(command->completion);
                 kfree(command);
                 return -EPROTO;

Thanks
Mathias

