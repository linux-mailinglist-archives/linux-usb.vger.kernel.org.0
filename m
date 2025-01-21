Return-Path: <linux-usb+bounces-19551-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3108BA17A1A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 10:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 257353A7DDD
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 09:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63CD1BEF82;
	Tue, 21 Jan 2025 09:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLfoMa34"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1BA1BEF6E;
	Tue, 21 Jan 2025 09:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737451540; cv=none; b=Foz4sLrEg3GHy78h+CguWCmRedI5iGCE+fPivdmQjq0I7h8DNOpv0nYfxBf8nkx8rALWpfBGJ7gHsE4DkgRVKBVil3YUOpppQx8SkOzGoCrJwPB94j6wMgPZGe9RePBN/6Wfr1dkArZsS5NrCdby9FPg0BBMHSpMblwFx2LTK1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737451540; c=relaxed/simple;
	bh=oO1ZFNvab0uP68gIbegJWvEQ3NNp2A9ZlsMF7tfHYas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHkK2QPJdZTTKIpW8+rXm6alWQPyjuCHMiRz4zLNqKv9jyOnxwHaRwKUvZVvAFu8XvOjM2ehpRBtokVqvrOg9blAJgoH2HDHZNqZFhlYYENuQHnZYh4fj2dxVHSRYvczasOmZvkHyCWngDh+CCKXuOZcJIRakXgxS6E5k/QWr9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLfoMa34; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737451538; x=1768987538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oO1ZFNvab0uP68gIbegJWvEQ3NNp2A9ZlsMF7tfHYas=;
  b=kLfoMa34IQYOdcviOXH5jnM/1amJmaXwpOlTjWh4cUfxeGhlYfL7vovP
   9faJ5bIhZsdN3I6nzoamG1WgbSWmw01IhE6gSYqzwksoVksWuIEFtS5Ek
   4XgsingSqDK5VXBZU5b9bm/SxusCkAbO5N4atFTeR/pl4t6TBsMI5xzU/
   Okc0NXSPiHeEguEmYjwJk3s7FRU730AevL7/QXIlkLu2uwT0JVuPrw5SH
   BTX3NHHKSmCuKQCyzlPruUTTnzDXoHLNrmQL80aeG4tQbFPOPATGh6tr/
   fxlv4oniKCbz3SOi2OAg3KH9x1yJMlre7QAoOFuNHJzjB2ew3841+SuQa
   Q==;
X-CSE-ConnectionGUID: QMbuWRJESBagxyfZbdu0yA==
X-CSE-MsgGUID: xFu+V6TLTUyIakPYpZnZ+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="38015059"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="38015059"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 01:25:37 -0800
X-CSE-ConnectionGUID: 3L0iA8C5RTSGxbgUj0Lveg==
X-CSE-MsgGUID: CkI6Y5iEQS+2SUEb5adImQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="106556894"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa006.fm.intel.com with SMTP; 21 Jan 2025 01:25:35 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 21 Jan 2025 11:25:34 +0200
Date: Tue, 21 Jan 2025 11:25:34 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "fengchunguo@126.com" <fengchunguo@126.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Added power_operation_mode_show type check
 when usb slowly detect
Message-ID: <Z49oDurVnITAEdon@kuha.fi.intel.com>
References: <1737442058-240190-1-git-send-email-fengchunguo@126.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1737442058-240190-1-git-send-email-fengchunguo@126.com>

On Tue, Jan 21, 2025 at 02:47:38PM +0800, fengchunguo@126.com wrote:
> From: Gary Feng <fengchunguo@126.com>
> 
> When the type of usb inserted one un-defined power mode, only 90mA
> voltage, system panic sometime.So added the one condition for avioding it.
> 
> Reproduced:
> 1.Inserted usb cable for charging slowly.
> 2.System panic sometimes. The log:
> Unexpected kernel BRK exception at EL1
> msm-dwc3 4e00000.ssusb: DWC3 exited from low power mode
> Internal error: BRK handler: 00000000f2005512 [#1] PREEMPT SMP
> Skip md ftrace buffer dump for: 0x1609e0
> Hardware name:Qualcomm Technologies, Inc. Blair QRD (DT)
> pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : power_operation_mode_show+0x48/0x50
> lr : dev_attr_show+0x38/0x74
> sp : ffffffc015d83c00
> x29: ffffffc015d83c00 x28: ffffff80517212c0 x27: 000000007ffff001
> x26: 0000000000000001 x25: 0000000000000000 x24: ffffff801b9274f0
> x23: ffffff805a9f1cc0 x22: ffffffda7b7a2608 x21: ffffff8050e99000
> x20: ffffffda7c5fb5b0 x19: ffffff801b9274c8 x18: ffffffc01568d070
> x17: 00000000df43c25c x16: 00000000df43c25c x15: 0000000000000000
> x14: 0000000000000000 x13: ffffffa77aadf000 x12: ffffffda7c4a1210
> x11: ffffff8050e99000 x10: 0000000000000000 x9 : ffffffda7ae948ac
> x8 : 00000000fffffffa x7 : 0000000000000000 x6 : 000000000000003f
> x5 : 0000000000000040 x4 : 0000000000000000 x3 : 0000000000000004
> x2 : ffffff8050e99000 x1 : ffffffda7c5fb5b0 x0 : ffffff80858ca008
> Call trace:
>  power_operation_mode_show+0x48/0x50
>  dev_attr_show+0x38/0x74
>  sysfs_kf_seq_show+0xb4/0x130
>  kernfs_seq_show+0x44/0x54
>  seq_read_iter+0x158/0x4ec
>  kernfs_fop_read_iter+0x68/0x1b0
>  vfs_read+0x1d8/0x2b0
>  ksys_read+0x78/0xe8
>  __arm64_sys_read+0x1c/0x2c
>  invoke_syscall+0x58/0x11c
>  el0_svc_common+0xb4/0xf4
>  do_el0_svc+0x2c/0xb0
>  el0_svc+0x2c/0xa4
>  el0t_64_sync_handler+0x68/0xb4
>  el0t_64_sync+0x1a0/0x1a4
> Code: 93407c00 a8c17bfd f85f8e5e d65f03c0 (d42aa240)
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: BRK handler: Fatal exception
> 
> Signed-off-by: Gary Feng <fengchunguo@126.com>
> ---
>  drivers/usb/typec/class.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 4b3047e..f2b0d5d 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -2163,7 +2163,7 @@ void typec_set_pwr_opmode(struct typec_port *port,
>  {
>  	struct device *partner_dev;
>  
> -	if (port->pwr_opmode == opmode)
> +	if ((port->pwr_opmode == opmode) || (opmode < TYPEC_PWR_MODE_USB))
>  		return;
>  
>  	port->pwr_opmode = opmode;

Which port driver is setting negative power opmode?

thanks,

-- 
heikki

