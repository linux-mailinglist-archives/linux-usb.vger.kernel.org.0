Return-Path: <linux-usb+bounces-38100-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HpQEbb+FmoJ0QcAu9opvQ
	(envelope-from <linux-usb+bounces-38100-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 16:24:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B300C5E5D25
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 16:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 302AB30932AD
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 14:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CCB410D0F;
	Wed, 27 May 2026 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3rrHUpw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F590341057;
	Wed, 27 May 2026 14:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779891699; cv=none; b=Yx5/Hmhnm0tUjOL8jHRLvzJi7op1ZMR1bLtPdWxFHSkA9C7uqaIgYaXAjaWKUqqt8rvdivrSDPQCMESeXglLcGJXUMIXX5088f2PF4rx4fIa4BwDEFGL+qUBLpbo+TjyA0ZABfuURvWbEeXd7osIfnz7pkuCzG3HdwSRtMd/LHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779891699; c=relaxed/simple;
	bh=iJzYdVZEnCbrdzpe1lcSn2GKplITdK0Mf1UHiXiJLdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deFb8CPgyOlLNrgg2CjD37brAI0NrXJnO17bxjahslZy3KZ1X9wyREi92OZSiUA/jzaGcWY+rKjs8DWuJ83M2670z7qNTB7ANRTtuUWiYAv0jkUALb42vDroFewzg15A6dVFXaqgAFsn8xV0tr8KPjl4YeqJSx1x4NJzkWPITnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3rrHUpw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3005C1F000E9;
	Wed, 27 May 2026 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779891696;
	bh=ANDedZ88UDoS2DCptby4vnta2saKo5cQ6BlVu2FmU78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N3rrHUpweBiRQUm5OWI7xxO+TBntkWo9t0sOE+q7LobC1n5tRh5euCN/inw2gilnD
	 ZyrVuneoZtqPJCI1qOHs84GGmGVROmOmysws45d9mpvMBOnfpf/f4jDMEg16YqSPSx
	 IhHkMYhdb1Fdbg0ldlncLTSB7R23MVP9JB/SQ7Wg6kGgw99jxETPH87K0/osmkVeMP
	 fk9rjjL+9EmfMXFExj0KB993gUtuStv6W7jBwOdCaL0898Nxocb6vvYqJ0Z+aNcr9Z
	 tINemi4dMtDaLvwdcfeeyqWhyawXcnnEKAA1Mv4XCg42y9Db2cRjkCgeiuspOShcNO
	 MU4UzkmEG3XeA==
Date: Wed, 27 May 2026 16:21:33 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <longman@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Kuen-Han Tsai <khtsai@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vratislav Bendel <vbendel@redhat.com>
Subject: Re: [PATCH] usb: hub: Make usb_hub_wq type depend on
 isolcpus/nohz_full setting
Message-ID: <ahb97cx_4dqPayDW@localhost.localdomain>
References: <20260521170659.984284-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521170659.984284-1-longman@redhat.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38100-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frederic@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,localhost.localdomain:mid]
X-Rspamd-Queue-Id: B300C5E5D25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le Thu, May 21, 2026 at 01:06:59PM -0400, Waiman Long a écrit :
> A Red Hat customer reports a kernel stability problem where hung tasks
> are reported with occasional kernel panics. Analysis of the core dump
> indicates that USB work items are running on isolcpus+nohz_full cores
> competing with RT-class tasks running on those core while holding
> usb_hub device mutex transitively blocking other kworkers waiting for
> the same mutex leading to hung_task reports.
> 
> As the usb_hub_wq uses the WQ_PERCPU flag, it will run the work items on
> the same CPU that queues them. For many use cases, it is a more efficient
> setup leading to higher throughput as it reduces cacheline bouncing.
> 
> It is a different story if the system needs to run latency sensitive RT
> workload on dedicated isolated CPUs. Having the kworkers processing work
> items on the same set of isolated CPUs will likely break the low latency
> requirements of the RT tasks. As the RT tasks have higher priority,
> not much CPU time will be left running the kworkers to process work
> items which, in turn, will block other tasks that have dependency on
> the completion of those work items. In this case, using a WQ_UNBOUND
> workqueue to avoid running on isolated CPUs will be more beneficial.
> 
> One solution to get the best of both worlds is to make the workqueue
> type depending on whether the "isolcpus" or "nohz_full" boot command
> line options have been specified. If at least one of those options are
> present, usb_hub_wq will be created as an unbound workqueue. Otherwise,
> it will remain as a percpu workqueue.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  drivers/usb/core/hub.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 24960ba9caa9..f79e5edd627a 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -33,6 +33,7 @@
>  #include <linux/random.h>
>  #include <linux/pm_qos.h>
>  #include <linux/kobject.h>
> +#include <linux/sched/isolation.h>
>  
>  #include <linux/bitfield.h>
>  #include <linux/uaccess.h>
> @@ -6066,6 +6067,8 @@ static struct usb_driver hub_driver = {
>  
>  int usb_hub_init(void)
>  {
> +	unsigned int wq_flags;
> +
>  	if (usb_register(&hub_driver) < 0) {
>  		printk(KERN_ERR "%s: can't register hub driver\n",
>  			usbcore_name);
> @@ -6077,8 +6080,17 @@ int usb_hub_init(void)
>  	 * USB-PERSIST port handover. Otherwise it might see that a full-speed
>  	 * device was gone before the EHCI controller had handed its port
>  	 * over to the companion full-speed controller.
> +	 *
> +	 * Create WQ_UNBOUND workqueue instead of WQ_PERCPU if either isolcpus
> +	 * or nohz_full boot option is specified.
>  	 */
> -	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE | WQ_PERCPU, 0);
> +	if (housekeeping_enabled(HK_TYPE_DOMAIN) ||
> +	    housekeeping_enabled(HK_TYPE_KERNEL_NOISE))

HK_TYPE_DOMAIN is supposed to be a subset of HK_TYPE_KERNEL_NOISE anyway so
the first should be enough.

> +		wq_flags = WQ_UNBOUND;
> +	else
> +		wq_flags = WQ_PERCPU;
> +
> +	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE | wq_flags, 0);

But then what happens if no isolcpus= is passed but later cpuset creates
an isolated partition?

Tejun and Marco thought about introducing a WQ_PREFER_PERCPU flag that would
do what you want above. And the workqueue code should also handle dynamic
isolation, that is switch from per-cpu workqueues to unbound ones or vice-versa
dynamically.

Marco is working on it.

Thanks.

>  	if (hub_wq)
>  		return 0;
>  
> -- 
> 2.54.0
> 
> 

-- 
Frederic Weisbecker
SUSE Labs

