Return-Path: <linux-usb+bounces-37605-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LkkOK8GC2rt/QQAu9opvQ
	(envelope-from <linux-usb+bounces-37605-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 14:31:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0C456CB30
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 14:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 616A3302D50F
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD3B3FD157;
	Mon, 18 May 2026 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CguV5PHv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCF4403144;
	Mon, 18 May 2026 12:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106924; cv=none; b=Z8wONXLqx1a4UnUWUYdAovxnWdaKPIQb5gWySZp6ipFtNEyqFt/WaI5n9bwE84/hiVxq/D1V1sRMESr7uRjV+n9C/7vT5LIaHFxOf7cX8JBRt17BzcRPUxYKMO0Y4y9Vvrtbc4oE/OZI5ssLj2XnT+2wa1uCQwr4FAZS67EFDHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106924; c=relaxed/simple;
	bh=vQyl/qXUgBx956UZOg/JPbguDtwFUGMYjwCPdtQ4Hk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2pHfAN7kC0mlNt1KaQ9aTd2QtEGIuUiWffCV/bme+D0xAgMzLn/rbtYsQzh4ost9eNTRdMYnVfArB+4SHrEHUTw51PAWiMp7vypH0Wza4vaOFByuCybUK6q5ZUksilCDRtSENOouS1vD/nlEq2VBN8VROYVr6qN/1Tzatr1Eeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CguV5PHv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779106922; x=1810642922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vQyl/qXUgBx956UZOg/JPbguDtwFUGMYjwCPdtQ4Hk4=;
  b=CguV5PHv2BSLoVzRf33uxzlZTt+dmCdA+IwlwqKCPXU2eEff2LjnoWYd
   SrkWeCUhpiLmPTiyr1MZkT/zEmoL7OePn3yBCKaLk9q65356Ww8zgOgss
   FNSThAgfiuBnCap/Kr8pVbhUm48/hS14ViKxXGAcZrZ5aCe0OYiKq2vNI
   3VeOkRh1G0jT14zeBX2ycwbSlRACrdZ+pzJjkG9GBPH4WF5oQ6iao9tSu
   M0Pt42VlFSMfVufD8JNOz0xcFQRTWmXWjOmKxJY4NhxaPb9G3gOK2Covf
   3sowjJCGM12JJ077Zbv4hVvxcoOatm2bhw0e9RdLcXSzvprD5j3ht36cV
   w==;
X-CSE-ConnectionGUID: 0rfQJkebRW2w2M3rcxw5rQ==
X-CSE-MsgGUID: xBHs58GATZ6ckNlgHY8JtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79937156"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79937156"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 05:22:02 -0700
X-CSE-ConnectionGUID: psxmjEP7Rc+CIdmtFs9tiw==
X-CSE-MsgGUID: aEyDKY3XSuayYqa0GtpOQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="244385760"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 18 May 2026 05:22:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8B6DD95; Mon, 18 May 2026 14:21:59 +0200 (CEST)
Date: Mon, 18 May 2026 15:21:57 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: split connector lock classes
Message-ID: <agsEZXOBMNayudR9@kuha>
References: <20260515060042.136083-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515060042.136083-1-senozhatsky@chromium.org>
X-Rspamd-Queue-Id: 4B0C456CB30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37605-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 03:00:30PM +0900, Sergey Senozhatsky wrote:
> Lockdep detects a possible recursive locking scenario during
> ucsi init:
> 
> [    5.418616] ============================================
> [    5.418634] WARNING: possible recursive locking detected
> [    5.418706] --------------------------------------------
> [    5.418725] kworker/4:1/82 is trying to acquire lock:
> [    5.418759] ffff888119a34648 (&con->lock){+.+.}-{3:3}, at: ucsi_init_work+0x1a78/0x2eb0 [typec_ucsi]
> [    5.418801]
>                but task is already holding lock:
> [    5.418835] ffff888119a34080 (&con->lock){+.+.}-{3:3}, at: ucsi_init_work+0x1a78/0x2eb0 [typec_ucsi]
> [    5.418884]
>                other info that might help us debug this:
> [    5.418904]  Possible unsafe locking scenario:
> 
> [    5.418937]        CPU0
> [    5.418956]        ----
> [    5.418991]   lock(&con->lock);
> [    5.419013]   lock(&con->lock);
> [    5.419033]
>                 *** DEADLOCK ***
> 
> [    5.419387] Call Trace:
> [    5.419406]  <TASK>
> [    5.419425]  dump_stack_lvl+0x61/0xa0
> [    5.419448]  print_deadlock_bug+0x4a6/0x650
> [    5.419483]  __lock_acquire+0x62b6/0x7f50
> [    5.419507]  lock_acquire+0x11b/0x390
> [    5.419654]  __mutex_lock+0xbc/0xcd0
> [    5.419741]  ucsi_init_work+0x1a78/0x2eb0
> [    5.419785]  ? worker_thread+0xf53/0x2bc0
> [    5.419819]  worker_thread+0xff4/0x2bc0
> [    5.419842]  kthread+0x2a7/0x330
> [    5.419863]  ? __pfx_worker_thread+0x10/0x10
> [    5.419896]  ? __pfx_kthread+0x10/0x10
> [    5.419916]  ret_from_fork+0x38/0x70
> [    5.419936]  ? __pfx_kthread+0x10/0x10
> [    5.419969]  ret_from_fork_asm+0x1b/0x30
> [    5.419991]  </TASK>
> [    5.420009] ---[ end trace 0000000000000000 ]---
> 
> The problem is that all connector locks belong to the same
> lockdep lock class, so the following loop:
> 
> 	for (i = 0; i < ucsi->cap.num_connectors; i++)
> 		ucsi_register_port(connector[i])
> 			mutex_lock(&connector[i]->lock)
> 
> looks like a recursive acquire of the same mutex.  Put each connector
> lock into a dedicated lock class so that lockdep doesn't see it as a
> possible recursion.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 8 ++++++++
>  drivers/usb/typec/ucsi/ucsi.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 5b7ad9e99cb9..43da7512dea0 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1642,6 +1642,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  	INIT_WORK(&con->work, ucsi_handle_connector_change);
>  	init_completion(&con->complete);
>  	mutex_init(&con->lock);
> +	lockdep_set_class(&con->lock, &con->lock_key);
>  	INIT_LIST_HEAD(&con->partner_tasks);
>  	con->ucsi = ucsi;
>  
> @@ -1887,6 +1888,9 @@ static int ucsi_init(struct ucsi *ucsi)
>  		goto err_reset;
>  	}
>  
> +	for (i = 0; i < ucsi->cap.num_connectors; i++)
> +		lockdep_register_key(&connector[i].lock_key);
> +
>  	/* Register all connectors */
>  	for (i = 0; i < ucsi->cap.num_connectors; i++) {
>  		connector[i].num = i + 1;
> @@ -1916,6 +1920,9 @@ static int ucsi_init(struct ucsi *ucsi)
>  	return 0;
>  
>  err_unregister:
> +	for (i = 0; i < ucsi->cap.num_connectors; i++)
> +		lockdep_unregister_key(&connector[i].lock_key);
> +
>  	for (con = connector; con->port; con++) {
>  		if (con->wq)
>  			destroy_workqueue(con->wq);
> @@ -2166,6 +2173,7 @@ void ucsi_unregister(struct ucsi *ucsi)
>  		usb_power_delivery_unregister(ucsi->connector[i].pd);
>  		ucsi->connector[i].pd = NULL;
>  		typec_unregister_port(ucsi->connector[i].port);
> +		lockdep_unregister_key(&ucsi->connector[i].lock_key);
>  	}
>  
>  	kfree(ucsi->connector);
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index cff9ddc2ae21..51f6c3c0d365 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -517,6 +517,7 @@ struct ucsi_connector {
>  
>  	struct ucsi *ucsi;
>  	struct mutex lock; /* port lock */
> +	struct lock_class_key lock_key;
>  	struct work_struct work;
>  	struct completion complete;
>  	struct workqueue_struct *wq;
> -- 
> 2.54.0.563.g4f69b47b94-goog

-- 
heikki

