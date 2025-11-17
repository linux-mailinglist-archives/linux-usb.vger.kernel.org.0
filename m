Return-Path: <linux-usb+bounces-30548-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E53FC62E40
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 09:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 466DB350EA5
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 08:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2194331B80B;
	Mon, 17 Nov 2025 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSzWhLOZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C229A316182;
	Mon, 17 Nov 2025 08:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763368085; cv=none; b=Ou37CxvI+U7ZUcbqtL5Kyns7ZqNIOpmyDR/M0QKNR4FYg9mioCraJItBxnR5gUNKEdgnQeSn6b7xjrpl+ADqpgavNbS8ifQIX8dxs6aZKWFTrPXZ/1TzhJwFqZtcpA9h4tjRL7I71xD3/6CiYZNmTQsQQoP5dS6EcBIdQI1Adr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763368085; c=relaxed/simple;
	bh=/++Tep52gchXUy6anvjCW2G9qMqyPgyOCsuExjrCFgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJv3N65cga6s6FOIijE2Ltjku7KzcDMBfyLffcn/oY67G4vF19HX8vfRsUZ8bZFPCrBxmSvumPSASaANN/xoxLSHImfvl2j0H1rheT87GelyAoPIWteap4Eo+Ia3So7PN4dJRoWoiFe3nfbkvZKXcc2jK7+6A8kTn+3/tT8JhDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSzWhLOZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763368084; x=1794904084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/++Tep52gchXUy6anvjCW2G9qMqyPgyOCsuExjrCFgk=;
  b=gSzWhLOZ/IBGXhSiTUHND0MZnQtYWMU58NwN3poODT8YCNUprmHHrqk8
   oMNqySnI8+uLZBBneTBQ9YIsPsatEPfiQFlLxmUqZuH/FqV8z2AB/S+TF
   2O0RwOgMBEvQ8NMxkscvWSjarhDF4BRI3imVhYmuocObAHk+oG/mgchys
   iaZrgAHlPdQKlAsXxJuJksiRVXsTr+OlFjbDFWVXZitjdCXNLV3+poYim
   JHpiI+nQ3txgT02C95ST/f6iWKqWbz//zhfTyuFFpLcMhBdPtJCb/6jaP
   lcOI52hwpq9laLEdgh6QOkP58pb1V1L1tAGvTewbJ5UOFyO1kHoT0ue2B
   w==;
X-CSE-ConnectionGUID: zEDKuru5SsC+lGlv1Nonvw==
X-CSE-MsgGUID: tH9eeN39TvqJTwC2CKk3Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65397388"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65397388"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 00:28:03 -0800
X-CSE-ConnectionGUID: xnrm9HvyRaSQJeM74onvrg==
X-CSE-MsgGUID: wRIlIeVhRq66KkOtgC6oNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190549916"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.220.176])
  by orviesa008.jf.intel.com with SMTP; 17 Nov 2025 00:28:00 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 17 Nov 2025 10:27:56 +0200
Date: Mon, 17 Nov 2025 10:27:56 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] usb: typec: anx7411: add WQ_PERCPU to
 alloc_workqueue users
Message-ID: <aRrcjCIeu6cjE6Og@kuha.fi.intel.com>
References: <20251107153737.301413-1-marco.crivellari@suse.com>
 <20251107153737.301413-3-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251107153737.301413-3-marco.crivellari@suse.com>

Fri, Nov 07, 2025 at 04:37:31PM +0100, Marco Crivellari kirjoitti:
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
> 
> alloc_workqueue() treats all queues as per-CPU by default, while unbound
> workqueues must opt-in via WQ_UNBOUND.
> 
> This default is suboptimal: most workloads benefit from unbound queues,
> allowing the scheduler to place worker threads where they’re needed and
> reducing noise when CPUs are isolated.
> 
> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
> 
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> This change adds a new WQ_PERCPU flag to explicitly request
> alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
> 
> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
> must now use WQ_PERCPU.
> 
> Once migration is complete, WQ_UNBOUND can be removed and unbound will
> become the implicit default.
> 
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/anx7411.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index 0ae0a5ee3fae..2e8ae1d2faf9 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -1516,8 +1516,7 @@ static int anx7411_i2c_probe(struct i2c_client *client)
>  
>  	INIT_WORK(&plat->work, anx7411_work_func);
>  	plat->workqueue = alloc_workqueue("anx7411_work",
> -					  WQ_FREEZABLE |
> -					  WQ_MEM_RECLAIM,
> +					  WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
>  					  1);
>  	if (!plat->workqueue) {
>  		dev_err(dev, "fail to create work queue\n");
> -- 
> 2.51.1

-- 
heikki

