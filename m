Return-Path: <linux-usb+bounces-38250-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGSUDreNHWrFbwkAu9opvQ
	(envelope-from <linux-usb+bounces-38250-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:48:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9510620427
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50F6F303D4C4
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 13:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF3339E167;
	Mon,  1 Jun 2026 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWn/EzDJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F55F2D7814;
	Mon,  1 Jun 2026 13:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321172; cv=none; b=s5HP/C7Rr5gH27Kq8cOcLqI5zCXMiHOYJSD4lKwGP6D4waEhLz8LThCGmqlt3TzGtBvj6QCTQXRyGhuHraTpOQmvU0Z6RnpxoeXBBszxAwZgIuMd0YOIoWOQ/KdeV7DV1I1XP5LL/OYHMFR6k2685KLrC4GBwOjsg+traonU040=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321172; c=relaxed/simple;
	bh=YmNkK6j9Qw1i1aI73JpybykKkJ4QNrAfix//ohFDPzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWiyqH+kXkZq1AZYthSF9+q1tsqz1M3L0Imq9hq32C7+kAgG2WijuEGGF9lJ6J4TG4rvcs6E2+5f4mEOvtDNFhCxnjsUrQXBCgh/5sdqTC/8Vvoragaj+rkGzVe58+VP5XB5WRpSjVF7ojSGxrLPJOwj3xYkm76AgA6V5DAR+dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWn/EzDJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780321171; x=1811857171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YmNkK6j9Qw1i1aI73JpybykKkJ4QNrAfix//ohFDPzM=;
  b=WWn/EzDJEU4rvVNVCI0i0c+tMun9zamQu0yuArDx69eRh81n/+jUOnBZ
   /iycksqt1Nx1SaMae+i6EIXyuBKknQACBm4/B+1HO692VjNx+mNKd/IM0
   cQIjCWKP4NmBYPfUp29Td9swvFuoD5PHFlFfExpcozPHZdW3k2bSCkeiH
   shogNLjpRYaxfQ9Hp8+67g8KOKQX6NFR36GJ1Jez8wwFuhL3EC7S+3SAr
   aJqo2WCrZdsGc89qe2uK2RnWMn1vJYSrtSE5Hmwa8iNelkarbQOenBn+3
   f02S7xO6GcnpKgmlUSO539Sh82pzA/LcxFsK6tsJpXyjtw322mzcCsZfW
   A==;
X-CSE-ConnectionGUID: 98NCB7VOQwa8MHtXU/fGFQ==
X-CSE-MsgGUID: qfWJjFzSSH2aHjcCLQJx2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="103748296"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="103748296"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 06:39:31 -0700
X-CSE-ConnectionGUID: 6KVpB7eBQRKZmME93/0T0w==
X-CSE-MsgGUID: ahpmbhDTSSiCX2APoUuBog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="267216822"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jun 2026 06:39:29 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 6EE5C95; Mon, 01 Jun 2026 15:39:28 +0200 (CEST)
Date: Mon, 1 Jun 2026 16:39:26 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v2 2/3] usb: typec: tipd: demote missing IRQ message to
 debug
Message-ID: <ah2LjmgIo9XrQF9D@kuha>
References: <cover.1779214249.git.radhey.shyam.pandey@amd.com>
 <7d14634eb5f4f7f2e217cd0080e3288eb63fc940.1779214249.git.radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d14634eb5f4f7f2e217cd0080e3288eb63fc940.1779214249.git.radhey.shyam.pandey@amd.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38250-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A9510620427
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:49:55PM +0530, Radhey Shyam Pandey wrote:
> Operating without an interrupt line and using the driver's polling path
> is valid. So move the log level to debug instead of warning.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes for v2:
> - Suggested by Heikki Krogerus - make it dev_dbg.
> ---
>  drivers/usb/typec/tipd/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index b282366b5326..58cf486c3d68 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -1853,7 +1853,7 @@ static int tps6598x_probe(struct i2c_client *client)
>  						IRQF_SHARED | IRQF_ONESHOT,
>  						dev_name(&client->dev), tps);
>  	} else {
> -		dev_warn(tps->dev, "Unable to find the interrupt, switching to polling\n");
> +		dev_dbg(tps->dev, "no IRQ specified, using polling mode\n");
>  		INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
>  		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
>  				   msecs_to_jiffies(POLL_INTERVAL));
> -- 
> 2.43.0

-- 
heikki

