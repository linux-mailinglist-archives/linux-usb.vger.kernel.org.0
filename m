Return-Path: <linux-usb+bounces-32066-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C8D0393D
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 15:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C61FE3007E51
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 14:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C9D40FDA2;
	Thu,  8 Jan 2026 13:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFOq2qgX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA23032AAA0;
	Thu,  8 Jan 2026 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880609; cv=none; b=QUQpe9GxJw0l83l1bvw/tisWRplwm4wbbfUn4j6juGaZIQI7nXLnz5hg1G7YKink8k/JsfL9odbLwTpgG8kWIdEg+NFT0pZ57NixTOMyZvkzv8BqC1zXcqudujc5NfsJREVEqAlH2MHa3C9ywfvQcfnHyGIZsGdBsj6VYyjRKik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880609; c=relaxed/simple;
	bh=Y6CiyDsF8bKK3ZLle7/uZFiHR3HSaNrzCIcZHZ84ies=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lixOwWh/CsO3TCT9wSUzNyI0/xRsuuiSCDTxKpnBYj7I2jszFlqGsfd0v2VnTzba5O+pmjarK3iFYXaC7CBKI+tTz8YuI/8j90K4y9PDgtMRf5gwaSN5aJkHmWyPA2SQhczEcqPiUW2jHocO31sCJcefcWI5T8giWQBVxy+sXSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFOq2qgX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767880607; x=1799416607;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Y6CiyDsF8bKK3ZLle7/uZFiHR3HSaNrzCIcZHZ84ies=;
  b=DFOq2qgX2aoKdlwWXaFMTI+rA5ljDoRUFeAlbJtzzJiVFIlhfxEP+DrI
   wp+2DGLVkXHpUZeriAdm9Kn2f6KvTaqeu/oBY67shxUX+PxmGlONOqAyd
   0Ce/YFeRQwllOxk7QuxGVw+csqXXCUPItMiXxIaOrBK2Hx4Li72sSoE/r
   8WbhXoFy3LEEmbXnk3SIw88DpkLZd90omwkUtR6LPh3byt5z3D/b6gt/g
   8HGrQ4c4fOKdFy7Bq7XqrNi+viBcZQ/YqzQrlAGN5ojyuwrufC2YJfYue
   eHePiYXPMnfFwt0NFj0+8YkOYoaGRrsrjyt/cP4O6ef3dfwdBoJHGzoZQ
   w==;
X-CSE-ConnectionGUID: JByv2MkDQjeCbOQUx7hAag==
X-CSE-MsgGUID: Zkd2TKawTWqq/NchizFHcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80704101"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="80704101"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 05:56:44 -0800
X-CSE-ConnectionGUID: aYx/kB64QwKYEfoKZoWJSw==
X-CSE-MsgGUID: HAodNLeOT5mq+4YUpGnaZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203644517"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.252]) ([10.245.245.252])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 05:56:41 -0800
Message-ID: <b1e908f2-8dfa-4d1e-8059-5e421145d154@linux.intel.com>
Date: Thu, 8 Jan 2026 15:56:39 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogQ29uc3VsdGF0aW9uIG9uIHRoZSBpc3N1ZSBvZiBk?=
 =?UTF-8?Q?igital_headphones_freezing?=
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TYUPR06MB6217B105B059A7730C4F6EC8D2B9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <f2c03c5d-d667-4398-9267-77d7f6aaf6b3@linux.intel.com>
 <TYUPR06MB62174179E2B4210E229872A0D287A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <TYUPR06MB6217745344E7E2EF5DAC6746D284A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <TYUPR06MB6217745344E7E2EF5DAC6746D284A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lianqin

On 1/7/26 12:08, 胡连勤 wrote:
> Hi  Mathias:
> 
>>>> [192165.107937][    C0] xhci-hcd xhci-hcd.3.auto: Error: Failed finding new dequeue state
>>>> [192165.107946][    C0] xhci-hcd xhci-hcd.3.auto: Failed to clear cancelled cached URB 000000002d756eab, mark clear anyway
>>>> [192165.108387][T17454] usb 1-1: reset full-speed USB device number 2 using xhci-hcd              --> 1st  reset
>>>> [192165.225904][T17454] usb 1-1: device descriptor read/64, error -71
>>>> [192165.442224][T17454] usb 1-1: Device not responding to setup address.
>>>> [192165.642107][T17454] usb 1-1: Device not responding to setup address.
>>>> [192165.845879][T17454] usb 1-1: device not accepting address 2, error -71
>>>> [192165.846031][T17454] usb 1-1: WARN: invalid context state for evaluate context command.
>>>> [192165.957927][T17454] usb 1-1: reset full-speed USB device number 2 using xhci-hcd             --> 2st reset
>>>> [192165.958032][T17454] xhci-hcd xhci-hcd.3.auto: ERROR: unexpected setup context command completion code 0x11.
>>>> [192165.958040][T17454] usb 1-1: hub failed to enable device, error -22
>>>> [192165.958165][T17454] usb 1-1: WARN: invalid context state for evaluate context command.
>>>> [192166.070623][T17454] usb 1-1: reset full-speed USB device number 2 using xhci-hcd            --> 3st reset
>>>> [192166.070728][T17454] xhci-hcd xhci-hcd.3.auto: ERROR: unexpected setup address command completion code 0x11.
>>>> [192166.273835][T17454] xhci-hcd xhci-hcd.3.auto: ERROR: unexpected setup address command completion code 0x11.
>>>> [192166.473788][T17454] usb 1-1: device not accepting address 2, error -22
>>>> [192166.473943][T17454] usb 1-1: WARN: invalid context state for evaluate context command.
>>>> [192166.585802][T17454] usb 1-1: reset full-speed USB device number 2 using xhci-hcd           -->  4st reset
> 
> Upon checking the exception log again, four device reset operations were observed.
> Analyzing the code flow, after each of the four resets, the `xhci_free_endpoint_ring` function is called,
> setting `ep->ring` to null.
> 
> The specific call is as follows:
>> usb_reset_device
>> ->usb_reset_and_verify_device
>> ->->usb_hcd_alloc_bandwidth
>> ->->->hcd->driver->check_bandwidth(hcd, udev)
>> ->->->->xhci_check_bandwidth
>> ->->->->->xhci_free_endpoint_ring
> 
> void xhci_free_endpoint_ring(struct xhci_hcd *xhci,
> 		struct xhci_virt_device *virt_dev,
> 		unsigned int ep_index)
> {
> 	xhci_ring_free(xhci, virt_dev->eps[ep_index].ring);
> 	virt_dev->eps[ep_index].ring = NULL;     ---> ep->rings = NULL
> }
> 
> static int usb_reset_and_verify_device(struct usb_device *udev)
> {
> ...
> 	-> The device will undergo four reset operations here.
> 	for (i = 0; i < PORT_INIT_TRIES; ++i) {
> 		if (hub_port_stop_enumerate(parent_hub, port1, i)) {
> 			ret = -ENODEV;
> 			break;
> 		}
> 
> 		/* ep0 maxpacket size may change; let the HCD know about it.
> 		 * Other endpoints will be handled by re-enumeration. */
> 		usb_ep0_reinit(udev);
> 		ret = hub_port_init(parent_hub, udev, port1, i, &descriptor);     ----> reset devices
> 		if (ret >= 0 || ret == -ENOTCONN || ret == -ENODEV)
> 			break;
> 	}
> ...
> }

Ok, looks like we don't call xhci_sideband_notify_ep_ring_free() in all places we should.

That being said, to solve this crash we need to make xhci_sideband_remove_endpoint() work
in cases where device is being reset or disconnected, and endpoint is being dropped.

Looks like xhci_initialize_ring_info(ep->ring) was added to xhci_sideband_remove_endpoint()
in v8 of the original patch series due to a comment about leaving the endpoint in a messy state.

https://lore.kernel.org/linux-usb/20231011002146.1821-1-quic_wcheng@quicinc.com/

Calling  xhci_initialize_ring_info() does not really clean up anything, it just sets the
software dequeue and enqueue pointers to the beginning of the ring. The xHC hardware
dequeue pointer is still untouched, and the whole ring buffer is still uncleared.

I think we can drop xhci_initialize_ring_info() call completely here.
The class driver still needs to set up and reinit the endpoint properly if it wants to continue
using it after it is removed from sideband usage.

We do want to make sure endpoint is stopped when removing it, but take into account that endpoint
might be stopped, disabled or already dropped by then.

Does the code below solve your crash?

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index a85f62a73313..2bd77255032b 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -210,7 +210,6 @@ xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
  		return -ENODEV;
  
  	__xhci_sideband_remove_endpoint(sb, ep);
-	xhci_initialize_ring_info(ep->ring);
  
  	return 0;
  }
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a148a1280126..4161c8c7721d 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2891,16 +2891,25 @@ int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int
  			    gfp_t gfp_flags)
  {
  	struct xhci_command *command;
+	struct xhci_ep_ctx *ep_ctx;
  	unsigned long flags;
-	int ret;
+	int ret = -ENODEV;
  
  	command = xhci_alloc_command(xhci, true, gfp_flags);
  	if (!command)
  		return -ENOMEM;
  
  	spin_lock_irqsave(&xhci->lock, flags);
-	ret = xhci_queue_stop_endpoint(xhci, command, ep->vdev->slot_id,
-				       ep->ep_index, suspend);
+
+	/* make sure endpoint exists and is running before stopping it */
+	if (ep->ring) {
+		ep_ctx = xhci_get_ep_ctx(xhci, ep->vdev->out_ctx, ep->ep_index);
+		if (GET_EP_CTX_STATE(ep_ctx) == EP_STATE_RUNNING)
+			ret = xhci_queue_stop_endpoint(xhci, command,
+						       ep->vdev->slot_id,
+						       ep->ep_index, suspend);
+	}
+
  	if (ret < 0) {
  		spin_unlock_irqrestore(&xhci->lock, flags);
  		goto out


