Return-Path: <linux-usb+bounces-36524-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCJKB64o72k38gAAu9opvQ
	(envelope-from <linux-usb+bounces-36524-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:13:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A56DB46FA46
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B557302A1B6
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E633AF650;
	Mon, 27 Apr 2026 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bI3A5t+d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9C53537FF
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777280970; cv=none; b=Xnw7ivi0IxciMQjxExpQOfDudn2vzCcJXt6vF7h6oHDFhFA7EuAe+1ywBUm+0fymgLyh5xayFbNNw4C3MXvghWctn1Ff7jDh0pfdOLWipZdVHoxAqSl9iWOUDVW/zwUc/lK+QDMDrt6HfTEoRA80ntDWOAwYIy2jKqpt71+IDOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777280970; c=relaxed/simple;
	bh=A8WDo7yV3f/r8i86dANzRoNnd0DPzsbpyCoCk3w2r0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilFUoI2O3KgZwP2eq2LiPGn/ywr6XI30McQa8gVbJetE7GhD/8OD6lWWJg2jgHydblbXuvScm1bUeeOjV1fW+u+K3/bXXJmWAEohuZdal+eY8uoJ4kXT5eO5ObWpjJWvv24ZQ/AhIFIJu/n2OZHUMumbvO7LhTz4X+pcRS4JsKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bI3A5t+d; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777280969; x=1808816969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A8WDo7yV3f/r8i86dANzRoNnd0DPzsbpyCoCk3w2r0M=;
  b=bI3A5t+dvXjAW0aGDZxN1PTjT29nGGceg3srZ862QLfmOI0jsQIIKJVA
   s8rm10FcNU7Js+XFoHR4EJPwamD9FVksMUfIfJV0keEVWTzqNFnJw0OJX
   +PmJXW/Thgz9desa3WUIZs4oaeN3132q2Qm6P2LoSDGHXRanTJHHLiZQK
   UnzvLf4IupcTzbowKiTibNmDfQbQP32TrqmuUFiAqkhbY38aO0nfVm4yj
   Et0sY+YUei2LfJpgNvLdWiOyHgYqB2oawRfjEMty6oBZihsRuEcOrSBIB
   K7wF/0p2vPZsj+3w6bMvWo9h5dLFac6squX75BvkTajLdX0RwlLc8FIWF
   Q==;
X-CSE-ConnectionGUID: U2VdyAbDS7SPUsS7WXrU9w==
X-CSE-MsgGUID: QH+hLwGXTn6UcHP50rvwcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77189218"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="77189218"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 02:09:29 -0700
X-CSE-ConnectionGUID: hnuo2RTZQqe00/fPMJjE+A==
X-CSE-MsgGUID: l+axTxy4Rbq/00HDTf7QnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="233469835"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 27 Apr 2026 02:09:28 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8039795; Mon, 27 Apr 2026 11:09:26 +0200 (CEST)
Date: Mon, 27 Apr 2026 12:09:24 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Daniel Dev <daniel.dev@noex.uk>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [BUG] ucsi_acpi: Fails to bind on USBC000 devices, version=0 in
 NVS blocks probe
Message-ID: <ae8nxNSEGd2hGh5T@kuha>
References: <b1Wn_eFvTFShGbd970WWl4CWhge_6P2x7Wb6rab3QHNlE4OJ4p__O-QN3B6I-308ftr5oV5Zr7vywA0vdvmtNw6E0YJnVM2ek_5DcFnkXB0=@noex.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1Wn_eFvTFShGbd970WWl4CWhge_6P2x7Wb6rab3QHNlE4OJ4p__O-QN3B6I-308ftr5oV5Zr7vywA0vdvmtNw6E0YJnVM2ek_5DcFnkXB0=@noex.uk>
X-Rspamd-Queue-Id: A56DB46FA46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36524-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]

Hi Daniel,

On Tue, Apr 21, 2026 at 11:15:56AM +0000, Daniel Dev wrote:
> Hello everyone,
> 
> I am reporting two related issues in ucsi_acpi that prevent it from binding on Lenovo ThinkPad T14 Gen 2a (AMD) platforms. The result is that /sys/class/typec/ is empty and USB-C display hotplug is non-functional unless a manual workaround is applied.
> 
> Hardware:
> - Machine: Lenovo ThinkPad T14 Gen 2a (20XLS10M00)
> - CPU: AMD Ryzen 7 PRO 5850U
> - Kernel: 6.19.12-200.fc43.x86_64 (Reproduced on 6.19.12, 6.19.9, and 6.18.19)
> - Distros tested: Fedora 43, CachyOS (Arch-based), Arch and Kubuntu (Debian-based)
> 
> ---
> 
> ### Bug 1: HID Mismatch (USBC000 vs PNP0CA0)
> The ACPI device uses "USBC000" as its primary HID, with "PNP0CA0" as a Compatible ID (CID).
> ```bash
> $ cat /sys/bus/platform/devices/USBC000:00/modalias
> acpi:USBC000:PNP0CA0:
> ```
> Because ucsi_acpi only matches on PNP0CA0, the ACPI bus does not automatically bind the driver. Adding USBC000 to the acpi_device_id table is required for automatic discovery on these platforms.

This sounds really odd? Why would this become a problem now, and not
before?

I'll see if I can reproduce this.

> ---
> 
> ### Bug 2: UCSI NVS Version = 0x0000 blocks probe
> Even when forced to bind (via driver_override), the probe fails because the BIOS does not populate the VERSION field in the UCSI ACPI NVS region at runtime.
> 
> Actual probe failure log:
> ```text
> Apr 21 11:29:37 fedora kernel: platform USBC000:00: bus: 'platform': __driver_probe_device: matched device with driver ucsi_acpi
> Apr 21 11:29:37 fedora kernel: platform USBC000:00: bus: 'platform': really_probe: probing driver ucsi_acpi with device
> Apr 21 11:29:39 fedora kernel: ucsi_acpi USBC000:00: probe with driver ucsi_acpi rejects match -19
> ```
> 
> Actual Raw NVS Dump (from UCSI region 0xCBC37000):
> ```text
> Apr 21 11:41:28 fedora kernel: ucsi_peek: version=0x0000 cci=0x00000002
> Apr 21 11:41:28 fedora kernel: ucsi_peek: raw NVS dump:
>                                  +00: 00 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00
>                                  +10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>                                  +20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ```

Again with the missing version. Please contact Lenovo. This is a bug
in their firmware. The version field must supply the actual ucsi
version.

thanks,

-- 
heikki

