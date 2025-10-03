Return-Path: <linux-usb+bounces-28883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FADCBB5FE3
	for <lists+linux-usb@lfdr.de>; Fri, 03 Oct 2025 08:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2650919C403D
	for <lists+linux-usb@lfdr.de>; Fri,  3 Oct 2025 06:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A9C207A32;
	Fri,  3 Oct 2025 06:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="ta9b7IjI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEFA219E8C
	for <linux-usb@vger.kernel.org>; Fri,  3 Oct 2025 06:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759473907; cv=none; b=ikdc43IPivp9QYC3kPUxHIajrlVOfoDVcHOgJghdjA+1wwtbAmACe5GskS9CISvOBrPnykkoI0O/O8OsILlq2e1ED3V1cFy5MNz07FVkxDeFX2iMzkbBEvIGGr07huNNJSKM9R6cwISpInhPUOHhgK+NzR9UFqCBM54UA56YSl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759473907; c=relaxed/simple;
	bh=Xs0k+T2nk6ZBx6NYfGOdqbhVdwWIomTm+4Fy9nW1fjI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NylpUuoa+pWUJd+hbCW6HFpvpssYTMGgiwCqGqbF4kHHdBgbnVSMUoQbTIzUOZhW/EfhlJbOhtEvLDIjkzHPpkr/26PG9Pn5t/CShi0F/XrtGvgtYtarCiA2YUwFGIN15oneFbvSKt7tTQbrQjBQGIkJUAKgBjOJYl8CsWo2kYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=ta9b7IjI; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0CADE41965
	for <linux-usb@vger.kernel.org>; Fri,  3 Oct 2025 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1759473886;
	bh=cZ71oTLvaYFmCM9yGlV1PXF0f/l2eYKhSwYaCMTQsJg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=ta9b7IjI9rdR3tuv9sqLHQtcFr5Bn/AHfFAXHDzyakEAnjD/5kRAy0UXICHG0urzG
	 ao0rdIcCyKkxz5IwAch1Tcbxmft1xBmxaBf2W1kCrrl0+wsZ/BZt2xpJamT15K83BV
	 mHtWX0q21umQIv9SlD38IBdv8qK/U9GhVZTpnikjacF5QZUGWBoc0ROaO4Xmw2n03C
	 JLitbIU9RibV7CHjQtdm02vJ8m/6LeT1JMGJOKIc5q86eUrqcjd0vFI5JhVbGMbNjJ
	 rhufAP8MMHXXdaYRtV1xAcJCLa3oRp4AEB16E1Z6mdO2c87N93nlRrznbCQ/fiY9Gk
	 Oq83+X1hfMwQNqzGbTloUJ9EKhsxFY+C74qJQXC3mc8+Kvdozx2zN/tsHRKiW28n3Z
	 yP/gqJHKicSbWqa3CnyV0Oxw+W/rTMcIK5SdDetl83Bv5qdUm/vO8gLR6d3CMHlJF6
	 whGEBsu1zCfaGt1kPzO8q6Uw7fuUDWBp1rEgI3/Gz6Bd6jp3BlgBD5Ld2uPc9Q66Tr
	 fZGIprsUKAmZFCTZrsThABqPRL8HtyVmZqN1r5RxZ4V0a+Y3vL2uAC7PVXAJ+5yuZ/
	 0nc7qfAc+UchdHuS2nJ+w+Z35uJlA4eZq9JFIoKTVHeWFuOJfz9Nr0VinkRtnKwxuS
	 16criDCpoc+270HPlpJjpDKo=
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-781253de15aso3465961b3a.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Oct 2025 23:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759473882; x=1760078682;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cZ71oTLvaYFmCM9yGlV1PXF0f/l2eYKhSwYaCMTQsJg=;
        b=B/JU1idfIi1YTjVyOZ18v1Vfa/76FtEgYo+1EGeyQZ7okiYuOVZBPAhfqMXv3vb+G9
         THhYNw43tUbjF5ToChQyD0TSf+jX8BzUs/cPYk0/RBy9DDbbDPJni7b0cneQTSUD0Z4J
         3+C5DKoai62gKcT0vNHuQgOqE83H0Ndd+kOmkm9vIVb2MfS94A8idlxZfgX5tx6KugYC
         Mh3gYV6LNNiOlBumga69JZhMULTgaymJNnBgEt0M3IkDfnREL0+Xrc7tU8crmXlTt5zE
         KKTXkhtsf/a+ZQXC5ynw6AAPQ7tEN8gdV0s4Wm9HrmnabEnOv4yQ9qiUUYumwk+Wy+4F
         19TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWADqb3DNKQulpvwKmRy5Z+yEK95rvZvkboE+p0KaVxqTzhaTCoybdBqXrmgEf+Vx8BeLvGD3bCtm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRz62mLmf7HCsPrw76/5ZQo2naivdhpSucaqmRp+Xkbt84D2r9
	eswFM3iThxScmiK7H3VPLMSRTksEbLdIYyvj7CBifOgHh+rjRMyFxc2lhcRvlWhFyxezuv/2bZV
	pnH25i+R2/R+KCi7kCaxQDHVx/92ijHWbsFfggSlk6UtMzJzNBWlFWP0xv/RzlXYRTGsd9U7Cxx
	RonA==
X-Gm-Gg: ASbGnctTgRCFDC8dc62UCi/Y24fBgosF8LbC/p2BK+qrz33pM5TZ3tVmpW+H5NlPbGY
	avqdc8dJXTI4rBy1a48zfO5oE1m8n+/EfLL/uhn/b79sNZZC6ktg4p+UD/C3Fj0y8deig/LhPX+
	UHq2qleddSLLWk01cyLy22HHHk/dPdRRP6uXTMZIFx/Ws2WR9ApdUobqgQd76evmudgenHsnrSx
	vUGTOaRTDJeHj0LvwjAJfXi29EvnotPQsEUQE/aW+M2SpDN1PqUuNn5soEC/aIvtQQQvxw/pIhp
	OBippCQZdjYcTo47mQE8+V58jT31rwR1yNFBmuYK4I6UiBld9aM3Fw==
X-Received: by 2002:a05:6a00:b54:b0:781:9f2:efb1 with SMTP id d2e1a72fcca58-78c98caeeb6mr2454606b3a.15.1759473882566;
        Thu, 02 Oct 2025 23:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYRkc7pb2nOTbZ7c8Dj/UDGkoclrgPKazpbVxg/HFecHLgQfgRUlOOrOmAjbI4kVsd3bmTfQ==
X-Received: by 2002:a05:6a00:b54:b0:781:9f2:efb1 with SMTP id d2e1a72fcca58-78c98caeeb6mr2454586b3a.15.1759473882134;
        Thu, 02 Oct 2025 23:44:42 -0700 (PDT)
Received: from acelan-precision5470 ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9a3f1sm3837742b3a.12.2025.10.02.23.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 23:44:39 -0700 (PDT)
Date: Fri, 3 Oct 2025 14:44:22 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Fix workqueue destruction race during
 connector cleanup
Message-ID: <iexpu4kyyq4hwqwtgerihxumdxn5wx2mytqleagmhiogp7g2lp@cismgnobnik6>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Andrei Kuchynski <akuchynski@chromium.org>, 
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>, Venkat Jayaraman <venkat.jayaraman@intel.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251002013026.4095030-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002013026.4095030-1-acelan.kao@canonical.com>

On Thu, Oct 02, 2025 at 09:30:26AM +0800, Chia-Lin Kao (AceLan) wrote:
> During UCSI initialization and operation, there is a race condition where
> delayed work items can be scheduled but attempt to queue work after the
> workqueue has been destroyed. This occurs in multiple code paths.
> 
> The race occurs when:
> 1. ucsi_partner_task() or ucsi_poll_worker() schedule delayed work
> 2. Connector cleanup paths call destroy_workqueue()
> 3. Previously scheduled delayed work timers fire after destruction
> 4. This triggers warnings and crashes in __queue_work()
> 
> The issue is timing-sensitive and typically manifests when:
> - Port registration fails due to PPM timing issues
> - System shutdown/cleanup occurs with pending delayed work
> - Module removal races with active delayed work
> 
> Fix this by:
> 1. Creating ucsi_destroy_connector_wq() helper function that safely
>    cancels all pending delayed work before destroying workqueues
> 2. Applying the safe cleanup to all three workqueue destruction paths:
>    - ucsi_register_port() error path
>    - ucsi_init() error path
>    - ucsi_unregister() cleanup path
> 
> This prevents both the initial queueing on destroyed workqueues and
> retry attempts from running workers, eliminating the timer races.
> 
> Fixes: b9aa02ca39a4 ("usb: typec: ucsi: Add polling mechanism for partner tasks like alt mode checking")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 50 ++++++++++++++++++++++-------------
>  1 file changed, 31 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 5ba3a6c81964..1f71c9983163 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -283,6 +283,33 @@ static void ucsi_poll_worker(struct work_struct *work)
>  	mutex_unlock(&con->lock);
>  }
>  
> +/**
> + * ucsi_destroy_connector_wq - Safely destroy connector workqueue
> + * @con: UCSI connector
> + *
> + * Cancel all pending delayed work and destroy the workqueue to prevent
> + * timer races where delayed work tries to queue on destroyed workqueue.
> + */
> +static void ucsi_destroy_connector_wq(struct ucsi_connector *con)
> +{
> +	struct ucsi_work *uwork, *tmp;
> +
> +	if (!con->wq)
> +		return;
> +
> +	/* Cancel any pending delayed work before destroying workqueue */
> +	mutex_lock(&con->lock);
> +	list_for_each_entry_safe(uwork, tmp, &con->partner_tasks, node) {
> +		cancel_delayed_work_sync(&uwork->work);
> +		list_del(&uwork->node);
> +		kfree(uwork);
> +	}
> +	mutex_unlock(&con->lock);
It introduces a deadlock here.
  - ucsi_destroy_connector_wq() holds con->lock and calls cancel_delayed_work_sync()
  - ucsi_poll_worker() (the work being cancelled) also tries to acquire con->lock

I'll submit a v2 to fix this issue.

[  246.874552] INFO: task kworker/17:0:125 blocked for more than 122 seconds.
[  246.874565]       Not tainted 6.14.0-2014-oem #14
[  246.874569] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  246.874571] task:kworker/17:0    state:D stack:0     pid:125   tgid:125   ppid:2      task_flags:0x4208060 flags:0x00004000
[  246.874577] Workqueue: events_long ucsi_init_work [typec_ucsi]
[  246.874592] Call Trace:
[  246.874594]  <TASK>
[  246.874598]  __schedule+0x2cf/0x640
[  246.874605]  schedule+0x29/0xd0
[  246.874608]  schedule_timeout+0xfb/0x110
[  246.874611]  __wait_for_common+0x91/0x190
[  246.874614]  ? __pfx_schedule_timeout+0x10/0x10
[  246.874617]  wait_for_completion+0x24/0x40
[  246.874620]  __flush_work+0x86/0xe0
[  246.874624]  ? __pfx_wq_barrier_func+0x10/0x10
[  246.874629]  cancel_delayed_work_sync+0x76/0x80
[  246.874633]  ucsi_destroy_connector_wq.part.0+0x61/0xd0 [typec_ucsi]
[  246.874638]  ucsi_init+0x27a/0x330 [typec_ucsi]
[  246.874643]  ucsi_init_work+0x18/0x90 [typec_ucsi]
[  246.874647]  process_one_work+0x178/0x3d0
[  246.874650]  worker_thread+0x2de/0x410
[  246.874653]  ? __pfx_worker_thread+0x10/0x10
[  246.874657]  kthread+0xfb/0x230
[  246.874659]  ? __pfx_kthread+0x10/0x10
[  246.874662]  ret_from_fork+0x44/0x70
[  246.874665]  ? __pfx_kthread+0x10/0x10
[  246.874667]  ret_from_fork_asm+0x1a/0x30
[  246.874672]  </TASK>

> +
> +	destroy_workqueue(con->wq);
> +	con->wq = NULL;
> +}
> +
>  static int ucsi_partner_task(struct ucsi_connector *con,
>  			     int (*cb)(struct ucsi_connector *),
>  			     int retries, unsigned long delay)
> @@ -1798,10 +1825,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  out_unlock:
>  	mutex_unlock(&con->lock);
>  
> -	if (ret && con->wq) {
> -		destroy_workqueue(con->wq);
> -		con->wq = NULL;
> -	}
> +	if (ret)
> +		ucsi_destroy_connector_wq(con);
>  
>  	return ret;
>  }
> @@ -1921,8 +1946,7 @@ static int ucsi_init(struct ucsi *ucsi)
>  
>  err_unregister:
>  	for (con = connector; con->port; con++) {
> -		if (con->wq)
> -			destroy_workqueue(con->wq);
> +		ucsi_destroy_connector_wq(con);
>  		ucsi_unregister_partner(con);
>  		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
>  		ucsi_unregister_port_psy(con);
> @@ -2144,19 +2168,7 @@ void ucsi_unregister(struct ucsi *ucsi)
>  	for (i = 0; i < ucsi->cap.num_connectors; i++) {
>  		cancel_work_sync(&ucsi->connector[i].work);
>  
> -		if (ucsi->connector[i].wq) {
> -			struct ucsi_work *uwork;
> -
> -			mutex_lock(&ucsi->connector[i].lock);
> -			/*
> -			 * queue delayed items immediately so they can execute
> -			 * and free themselves before the wq is destroyed
> -			 */
> -			list_for_each_entry(uwork, &ucsi->connector[i].partner_tasks, node)
> -				mod_delayed_work(ucsi->connector[i].wq, &uwork->work, 0);
> -			mutex_unlock(&ucsi->connector[i].lock);
> -			destroy_workqueue(ucsi->connector[i].wq);
> -		}
> +		ucsi_destroy_connector_wq(&ucsi->connector[i]);
>  
>  		ucsi_unregister_partner(&ucsi->connector[i]);
>  		ucsi_unregister_altmodes(&ucsi->connector[i],
> -- 
> 2.43.0
> 

