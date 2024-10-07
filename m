Return-Path: <linux-usb+bounces-15803-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E98C8992A03
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 13:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B12C1F23304
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 11:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DBC1D1E60;
	Mon,  7 Oct 2024 11:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFrxji2Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6836315D5C1
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728299269; cv=none; b=VbLOU4L3IELPUwwRANXWBeX1xWWfCpBAUzPK6zNuOVo9cuFTjOU0zgjI1KSPhpE69Y1skbacpP7orOsp+C90NBNmgdrYr1ZqYSokd2ONWnZ3HD0ycYvxvCiNA0fKIUQl21sdCHIofio5YexkJe7yd6CDPeOSySZCkMJu8sI9GRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728299269; c=relaxed/simple;
	bh=YW90FSZ4UY5tSvoqFC3mldRX7nQg6V+fe0nqQQUr6NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXuQ6oxAMygZkX2fWab7DUxWAj+LRo30kZdI33iVp4Sk3gRhYwsiQi5fRvilbIXbyetg8tuIIKaeL8PbvkkofFihtCuH392ZJgeNeqZUlvHbqf4dvf1oxEqCSYUAqKSXYHnbOuC3vqZMoHOkKrd+RhoR0jjUkzrkaOoJfhmDrwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFrxji2Y; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728299268; x=1759835268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YW90FSZ4UY5tSvoqFC3mldRX7nQg6V+fe0nqQQUr6NA=;
  b=oFrxji2YK15NyHTSFw1E71NNzjaJ/qYRE0CQYnjIpMp9mcJXb1La/LAf
   lnAvaiPGUfiUABZ47pa62u8eiwMAjjt39+HXnPbRX02AExrd3Q4GZs04/
   kff7MwziFjQ5zN7rijsb7F0vNFnrKj7ytsMAwRz0/McyVbdMPUoawKyin
   OaGTbpdiNGqFu8Au0gZXFTDQVabYoc9XLcPrSl/cmnXHmVTO9rm/aM39m
   Qt+P3OnMEWtx5MNoYvb9hSw5haNJT/lQA8KaY6H7vOO9mOZrmQu4kWFJd
   WLfiWhIV+URJ/+BMT4sjfsmkrLXT74xXoarviZ9dH9o41hJozV3fIRHpO
   g==;
X-CSE-ConnectionGUID: wI9OE+rVST2FQRsLF2yL7g==
X-CSE-MsgGUID: xzZekjMcSzmkdC1iAdMSDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27531349"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27531349"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 04:07:47 -0700
X-CSE-ConnectionGUID: 3SnrUSgtS3apHNhgJkljaQ==
X-CSE-MsgGUID: THfgEiCWSaOyx+A5oAWOcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="106188025"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa001.fm.intel.com with SMTP; 07 Oct 2024 04:07:45 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 07 Oct 2024 14:07:43 +0300
Date: Mon, 7 Oct 2024 14:07:43 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel-dev@igalia.com
Subject: Re: [PATCH] usb: typec: altmode should keep reference to parent
Message-ID: <ZwPA_5_8URgb2ekl@kuha.fi.intel.com>
References: <20241004123738.2964524-1-cascardo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004123738.2964524-1-cascardo@igalia.com>

On Fri, Oct 04, 2024 at 09:37:38AM -0300, Thadeu Lima de Souza Cascardo wrote:
> The altmode device release refers to its parent device, but without keeping
> a reference to it.
> 
> When registering the altmode, get a reference to the parent and put it in
> the release function.
> 
> Before this fix, when using CONFIG_DEBUG_KOBJECT_RELEASE, we see issues
> like this:
> 
> [   43.572860] kobject: 'port0.0' (ffff8880057ba008): kobject_release, parent 0000000000000000 (delayed 3000)
> [   43.573532] kobject: 'port0.1' (ffff8880057bd008): kobject_release, parent 0000000000000000 (delayed 1000)
> [   43.574407] kobject: 'port0' (ffff8880057b9008): kobject_release, parent 0000000000000000 (delayed 3000)
> [   43.575059] kobject: 'port1.0' (ffff8880057ca008): kobject_release, parent 0000000000000000 (delayed 4000)
> [   43.575908] kobject: 'port1.1' (ffff8880057c9008): kobject_release, parent 0000000000000000 (delayed 4000)
> [   43.576908] kobject: 'typec' (ffff8880062dbc00): kobject_release, parent 0000000000000000 (delayed 4000)
> [   43.577769] kobject: 'port1' (ffff8880057bf008): kobject_release, parent 0000000000000000 (delayed 3000)
> [   46.612867] ==================================================================
> [   46.613402] BUG: KASAN: slab-use-after-free in typec_altmode_release+0x38/0x129
> [   46.614003] Read of size 8 at addr ffff8880057b9118 by task kworker/2:1/48
> [   46.614538]
> [   46.614668] CPU: 2 UID: 0 PID: 48 Comm: kworker/2:1 Not tainted 6.12.0-rc1-00138-gedbae730ad31 #535
> [   46.615391] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1 04/01/2014
> [   46.616042] Workqueue: events kobject_delayed_cleanup
> [   46.616446] Call Trace:
> [   46.616648]  <TASK>
> [   46.616820]  dump_stack_lvl+0x5b/0x7c
> [   46.617112]  ? typec_altmode_release+0x38/0x129
> [   46.617470]  print_report+0x14c/0x49e
> [   46.617769]  ? rcu_read_unlock_sched+0x56/0x69
> [   46.618117]  ? __virt_addr_valid+0x19a/0x1ab
> [   46.618456]  ? kmem_cache_debug_flags+0xc/0x1d
> [   46.618807]  ? typec_altmode_release+0x38/0x129
> [   46.619161]  kasan_report+0x8d/0xb4
> [   46.619447]  ? typec_altmode_release+0x38/0x129
> [   46.619809]  ? process_scheduled_works+0x3cb/0x85f
> [   46.620185]  typec_altmode_release+0x38/0x129
> [   46.620537]  ? process_scheduled_works+0x3cb/0x85f
> [   46.620907]  device_release+0xaf/0xf2
> [   46.621206]  kobject_delayed_cleanup+0x13b/0x17a
> [   46.621584]  process_scheduled_works+0x4f6/0x85f
> [   46.621955]  ? __pfx_process_scheduled_works+0x10/0x10
> [   46.622353]  ? hlock_class+0x31/0x9a
> [   46.622647]  ? lock_acquired+0x361/0x3c3
> [   46.622956]  ? move_linked_works+0x46/0x7d
> [   46.623277]  worker_thread+0x1ce/0x291
> [   46.623582]  ? __kthread_parkme+0xc8/0xdf
> [   46.623900]  ? __pfx_worker_thread+0x10/0x10
> [   46.624236]  kthread+0x17e/0x190
> [   46.624501]  ? kthread+0xfb/0x190
> [   46.624756]  ? __pfx_kthread+0x10/0x10
> [   46.625015]  ret_from_fork+0x20/0x40
> [   46.625268]  ? __pfx_kthread+0x10/0x10
> [   46.625532]  ret_from_fork_asm+0x1a/0x30
> [   46.625805]  </TASK>
> [   46.625953]
> [   46.626056] Allocated by task 678:
> [   46.626287]  kasan_save_stack+0x24/0x44
> [   46.626555]  kasan_save_track+0x14/0x2d
> [   46.626811]  __kasan_kmalloc+0x3f/0x4d
> [   46.627049]  __kmalloc_noprof+0x1bf/0x1f0
> [   46.627362]  typec_register_port+0x23/0x491
> [   46.627698]  cros_typec_probe+0x634/0xbb6
> [   46.628026]  platform_probe+0x47/0x8c
> [   46.628311]  really_probe+0x20a/0x47d
> [   46.628605]  device_driver_attach+0x39/0x72
> [   46.628940]  bind_store+0x87/0xd7
> [   46.629213]  kernfs_fop_write_iter+0x1aa/0x218
> [   46.629574]  vfs_write+0x1d6/0x29b
> [   46.629856]  ksys_write+0xcd/0x13b
> [   46.630128]  do_syscall_64+0xd4/0x139
> [   46.630420]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   46.630820]
> [   46.630946] Freed by task 48:
> [   46.631182]  kasan_save_stack+0x24/0x44
> [   46.631493]  kasan_save_track+0x14/0x2d
> [   46.631799]  kasan_save_free_info+0x3f/0x4d
> [   46.632144]  __kasan_slab_free+0x37/0x45
> [   46.632474]  kfree+0x1d4/0x252
> [   46.632725]  device_release+0xaf/0xf2
> [   46.633017]  kobject_delayed_cleanup+0x13b/0x17a
> [   46.633388]  process_scheduled_works+0x4f6/0x85f
> [   46.633764]  worker_thread+0x1ce/0x291
> [   46.634065]  kthread+0x17e/0x190
> [   46.634324]  ret_from_fork+0x20/0x40
> [   46.634621]  ret_from_fork_asm+0x1a/0x30
> 
> Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

I tried to go through the code and the logs, but I did not really find
any explanation why we couldn't keep the device release order in sync
for all devices that need it. I'll see if we can improve that somehow
in the core, but we can fix this one in the meantime.

But this is a case of use-after-free, so shouldn't this go to the
stable trees?

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

thanks,

-- 
heikki

