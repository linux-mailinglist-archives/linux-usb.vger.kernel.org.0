Return-Path: <linux-usb+bounces-33570-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PjCOWdsnGmcGAQAu9opvQ
	(envelope-from <linux-usb+bounces-33570-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 16:04:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC381786B8
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 16:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10C4E3036AB8
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 15:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3910358D3D;
	Mon, 23 Feb 2026 15:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuP7chNh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340C72376FD;
	Mon, 23 Feb 2026 15:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858972; cv=none; b=q340SxxHEACYVz0azNQit/SRrUhOZf+bYg7M96z8vi2Kg4J74fqSJnsx1cG/LS+br0iXBi45oVluRbDthTo1GriqKb/+TOKNMFo6emm+ZaBm/9ce/QgFipXOw8orpvCwgSBlJOAPv84URRxIubRyYjFkxutjDiSmmRq/0ET2s50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858972; c=relaxed/simple;
	bh=QM+dqiynOi+Uf03mvXlG1xZuAaKjus3L5huhW0c37Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2cVO94A0nDXs467YksjhJP/uIJyg9gULmoPIqCeVQ7H/pAZ9WQK1CkshTgYUxuSkN6aMC31KDEiiSp+r7MpxEgcYmUc1b/d0ZEGc1u8/zwWJWP0gJ9JIa85gYOwlK3LK12xQjslNxTFgxY1IfXjrBIbBc0M88KcUywqMSkncqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QuP7chNh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771858971; x=1803394971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QM+dqiynOi+Uf03mvXlG1xZuAaKjus3L5huhW0c37Vs=;
  b=QuP7chNhG3/PODDh2stczYiQHYZulpS4+tzDuoIJP0F2SwRLagyVFwDB
   o0NZ17VqjRSPfnjKCWUmK+resfZNRt1FaDlhqohGGAxnov4zVnBatpZGM
   5sDo6O8de7L9NDpc0nBu5PAkgyz0ooY0c+Wrzd7KphZHgWhjT8XjtVZEN
   iT0wq3M5XWD0J/+fFq/6FvfJFIVvmxHms54vnYIgc5SMhin+D/7em3wOe
   zjuciP/+QSTNMIaRkjbvjAmbGUuAwOpyrG2X6VMfnEgGanPRvu1AjcV2S
   J72qoWoHSbVY/yjMaVwvwSZxf6kWWesTNpsvT3eQAtiYkFidyigrMlRf9
   A==;
X-CSE-ConnectionGUID: qftU8NtqR1uxwh6FMD3rjw==
X-CSE-MsgGUID: pK+8KZBDR1eNxY0uB8NFjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83566708"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="83566708"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:02:51 -0800
X-CSE-ConnectionGUID: ENQ8WgYoR5uOQqa4/RN/hQ==
X-CSE-MsgGUID: P12SQUAnR7avQGwwjG/n3Q==
X-ExtLoop1: 1
Received: from mdroper-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.222.123])
  by fmviesa003.fm.intel.com with SMTP; 23 Feb 2026 07:02:48 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 23 Feb 2026 17:02:12 +0200
Date: Mon, 23 Feb 2026 17:02:12 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 2/2] usb: typec: mux: avoid duplicated mux switches
Message-ID: <aZxr9DBebcQfsQiP@kuha>
References: <20260213-typec-mux-duplication-fix-v1-0-70076a7c5691@collabora.com>
 <20260213-typec-mux-duplication-fix-v1-2-70076a7c5691@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-typec-mux-duplication-fix-v1-2-70076a7c5691@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33570-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 1FC381786B8
X-Rspamd-Action: no action

Fri, Feb 13, 2026 at 08:23:29PM +0100, Sebastian Reichel wrote:
> Some devices use combo PHYs (i.e. USB3 + DisplayPort), which also
> handle the lane muxing. These PHYs are referenced twice from
> the USB-C connector (USB super-speed lines and SBU/AUX lines)
> resulting in the mux being configured twice. Avoid this by
> dropping duplicates.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/usb/typec/mux.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index db35b7398343..6a394326f236 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -309,9 +309,9 @@ struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode)
>  {
>  	struct typec_mux_dev *mux_devs[TYPEC_MUX_MAX_DEVS];
>  	struct typec_mux *mux;
> +	int i, j, k;
>  	int count;
>  	int err;
> -	int i;
>  
>  	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
>  	if (!mux)
> @@ -333,6 +333,18 @@ struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode)
>  		}
>  	}
>  
> +	/* eliminate duplicates */
> +	for (i = 0; i < count; i++) {
> +		for (j = i + 1; j < count; j++) {
> +			if (mux_devs[j] == mux_devs[i]) {
> +				put_device(&mux_devs[j]->dev);
> +				for (k = j; k < count; k++)
> +					mux_devs[k] = mux_devs[k+1];
> +				count--;
> +			}
> +		}
> +	}

The same should work here. My code snippets probable has to be
modified, but the idea should work. The check should be more simple to
do in typec_switch_match().

Br,

-- 
heikki

