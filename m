Return-Path: <linux-usb+bounces-15806-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B917992D9A
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 15:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE06DB2256E
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 13:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2A51D359A;
	Mon,  7 Oct 2024 13:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="RDdeIify"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7F714AD17
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728308550; cv=none; b=Ho52S5kg4WqQQoLPJEgSU5ofQCrOxmzJd4WcJgenpOyqgzE7E2BLEuJIlAGbd+yVLjm1hHcIrUGGNusl8uwBnuXmKFuChVPqoZFBbCA0hrAR9v6gM1ojjxN3WyabF1DlkgaGCPDuZqh4oiMt97s38LWP2L7cX6eQonITjLG3SYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728308550; c=relaxed/simple;
	bh=lIMqxwrhN71b751Drczv519BdGje7foITAD8EREFCp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otY6TIzHROtlkBkodiKn8D6bzPJ3mFwBSsAtuo1IWZvZktko7D7sD7jkmk5HUh7JAENG5sll5PJcp494ttlHst8o9Sd1ZDAVK1VKApw4MCeUIrX3YQlKLPdM3HPAsvnpHWzAVzTVt10u8s+CCoTcqFr4aSUb7IpwGhuJGsbgtpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=RDdeIify; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jubWh9O6J+2Fsa6nIDdHWTIXL7FTXun5xZ4nlsw3wdg=; b=RDdeIifyVw0YRaXOKAM1PXEu6j
	55QyiAnWDWxqw3678YEk4HhfcgP9V0BXXheyEkwa3Oi+8E7+TTWXBdBhCdQ5aJXaTqHWENgbFEjqp
	0r8a4Lx+9NwQmnxp5nU0UnMFIfW/SoZL+58X5Qp6E9LenIICqy2vwJfmvvrxG8dr7ireujyG41w4+
	KV1Vkov6WvagXYjpnXKq60jv5wo6e9FM9TlaMWFC8NgUYJSGZXzbOpyCqx9Mw39OIZZAIHVfaA50g
	ZDQYpVBk6pOueYzR1py5R7KWptfSaRnrnlA50i5ebWffY+DNGiGnpdAqTS0AtFJ2lzUIzgjLlKIeG
	HyCdTWoA==;
Received: from 179-125-64-236-dinamico.pombonet.net.br ([179.125.64.236] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1sxo0E-0069Xy-Bq; Mon, 07 Oct 2024 15:42:22 +0200
Date: Mon, 7 Oct 2024 10:42:18 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel-dev@igalia.com
Subject: Re: [PATCH] usb: typec: altmode should keep reference to parent
Message-ID: <ZwPlOrQ+8FYe/lto@quatroqueijos.cascardo.eti.br>
References: <20241004123738.2964524-1-cascardo@igalia.com>
 <ZwPA_5_8URgb2ekl@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwPA_5_8URgb2ekl@kuha.fi.intel.com>

On Mon, Oct 07, 2024 at 02:07:43PM +0300, Heikki Krogerus wrote:
> On Fri, Oct 04, 2024 at 09:37:38AM -0300, Thadeu Lima de Souza Cascardo wrote:
> > The altmode device release refers to its parent device, but without keeping
> > a reference to it.
> > 
> > When registering the altmode, get a reference to the parent and put it in
> > the release function.
> > 
> > Before this fix, when using CONFIG_DEBUG_KOBJECT_RELEASE, we see issues
> > like this:
> > 
> > [   43.572860] kobject: 'port0.0' (ffff8880057ba008): kobject_release, parent 0000000000000000 (delayed 3000)
> > [   43.573532] kobject: 'port0.1' (ffff8880057bd008): kobject_release, parent 0000000000000000 (delayed 1000)
> > [   43.574407] kobject: 'port0' (ffff8880057b9008): kobject_release, parent 0000000000000000 (delayed 3000)
> > [   43.575059] kobject: 'port1.0' (ffff8880057ca008): kobject_release, parent 0000000000000000 (delayed 4000)
> > [   43.575908] kobject: 'port1.1' (ffff8880057c9008): kobject_release, parent 0000000000000000 (delayed 4000)
> > [   43.576908] kobject: 'typec' (ffff8880062dbc00): kobject_release, parent 0000000000000000 (delayed 4000)
> > [   43.577769] kobject: 'port1' (ffff8880057bf008): kobject_release, parent 0000000000000000 (delayed 3000)
> > [   46.612867] ==================================================================
> > [   46.613402] BUG: KASAN: slab-use-after-free in typec_altmode_release+0x38/0x129
> > [   46.614003] Read of size 8 at addr ffff8880057b9118 by task kworker/2:1/48
> > [   46.614538]
> > [   46.614668] CPU: 2 UID: 0 PID: 48 Comm: kworker/2:1 Not tainted 6.12.0-rc1-00138-gedbae730ad31 #535
> > [   46.615391] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1 04/01/2014
> > [   46.616042] Workqueue: events kobject_delayed_cleanup
> > [   46.616446] Call Trace:
> > [   46.616648]  <TASK>
> > [   46.616820]  dump_stack_lvl+0x5b/0x7c
> > [   46.617112]  ? typec_altmode_release+0x38/0x129
> > [   46.617470]  print_report+0x14c/0x49e
> > [   46.617769]  ? rcu_read_unlock_sched+0x56/0x69
> > [   46.618117]  ? __virt_addr_valid+0x19a/0x1ab
> > [   46.618456]  ? kmem_cache_debug_flags+0xc/0x1d
> > [   46.618807]  ? typec_altmode_release+0x38/0x129
> > [   46.619161]  kasan_report+0x8d/0xb4
> > [   46.619447]  ? typec_altmode_release+0x38/0x129
> > [   46.619809]  ? process_scheduled_works+0x3cb/0x85f
> > [   46.620185]  typec_altmode_release+0x38/0x129
> > [   46.620537]  ? process_scheduled_works+0x3cb/0x85f
> > [   46.620907]  device_release+0xaf/0xf2
> > [   46.621206]  kobject_delayed_cleanup+0x13b/0x17a
> > [   46.621584]  process_scheduled_works+0x4f6/0x85f
> > [   46.621955]  ? __pfx_process_scheduled_works+0x10/0x10
> > [   46.622353]  ? hlock_class+0x31/0x9a
> > [   46.622647]  ? lock_acquired+0x361/0x3c3
> > [   46.622956]  ? move_linked_works+0x46/0x7d
> > [   46.623277]  worker_thread+0x1ce/0x291
> > [   46.623582]  ? __kthread_parkme+0xc8/0xdf
> > [   46.623900]  ? __pfx_worker_thread+0x10/0x10
> > [   46.624236]  kthread+0x17e/0x190
> > [   46.624501]  ? kthread+0xfb/0x190
> > [   46.624756]  ? __pfx_kthread+0x10/0x10
> > [   46.625015]  ret_from_fork+0x20/0x40
> > [   46.625268]  ? __pfx_kthread+0x10/0x10
> > [   46.625532]  ret_from_fork_asm+0x1a/0x30
> > [   46.625805]  </TASK>
> > [   46.625953]
> > [   46.626056] Allocated by task 678:
> > [   46.626287]  kasan_save_stack+0x24/0x44
> > [   46.626555]  kasan_save_track+0x14/0x2d
> > [   46.626811]  __kasan_kmalloc+0x3f/0x4d
> > [   46.627049]  __kmalloc_noprof+0x1bf/0x1f0
> > [   46.627362]  typec_register_port+0x23/0x491
> > [   46.627698]  cros_typec_probe+0x634/0xbb6
> > [   46.628026]  platform_probe+0x47/0x8c
> > [   46.628311]  really_probe+0x20a/0x47d
> > [   46.628605]  device_driver_attach+0x39/0x72
> > [   46.628940]  bind_store+0x87/0xd7
> > [   46.629213]  kernfs_fop_write_iter+0x1aa/0x218
> > [   46.629574]  vfs_write+0x1d6/0x29b
> > [   46.629856]  ksys_write+0xcd/0x13b
> > [   46.630128]  do_syscall_64+0xd4/0x139
> > [   46.630420]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [   46.630820]
> > [   46.630946] Freed by task 48:
> > [   46.631182]  kasan_save_stack+0x24/0x44
> > [   46.631493]  kasan_save_track+0x14/0x2d
> > [   46.631799]  kasan_save_free_info+0x3f/0x4d
> > [   46.632144]  __kasan_slab_free+0x37/0x45
> > [   46.632474]  kfree+0x1d4/0x252
> > [   46.632725]  device_release+0xaf/0xf2
> > [   46.633017]  kobject_delayed_cleanup+0x13b/0x17a
> > [   46.633388]  process_scheduled_works+0x4f6/0x85f
> > [   46.633764]  worker_thread+0x1ce/0x291
> > [   46.634065]  kthread+0x17e/0x190
> > [   46.634324]  ret_from_fork+0x20/0x40
> > [   46.634621]  ret_from_fork_asm+0x1a/0x30
> > 
> > Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> 
> I tried to go through the code and the logs, but I did not really find
> any explanation why we couldn't keep the device release order in sync
> for all devices that need it. I'll see if we can improve that somehow
> in the core, but we can fix this one in the meantime.
> 
> But this is a case of use-after-free, so shouldn't this go to the
> stable trees?

Agreed. I am fine if Cc: stable@vger.kernel.org get added when this is
applied. But otherwise, I can keep track in case the Fixes line does not
trigger its inclusion.

Thanks.
Cascardo.

> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> thanks,
> 
> -- 
> heikki
> 

