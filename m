Return-Path: <linux-usb+bounces-38131-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F7HDrcWGGoAdAgAu9opvQ
	(envelope-from <linux-usb+bounces-38131-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 12:19:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9225F07A1
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 12:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81D633237E16
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 10:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5507A3ABD8E;
	Thu, 28 May 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9kj99X2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB9D376A0D;
	Thu, 28 May 2026 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962925; cv=none; b=nmKOzSjfqcsK57gBaP0DlH3u36Cbb80IUB/OVbvKQjUtlgdZ/ECRmeWuPWQ9GG1fHVHVaf4baPEeoTJANSNW7J0+8J38xSb45YdEk+4yaPf3M8C3KJ9+9k4TMDl8VaAeLmhFrpywF+wIvVlLRX1eHGX5PKjy0bQK+8b68SSeJGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962925; c=relaxed/simple;
	bh=WXlmjDTtNd/pu+i8To0gDPyPyONeGqsh/riOoL2ousY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuTLdjrEsjUi6Joth9nZXXiWgWVcP5qY5uUi99dFMAPlF7VCPw8A08pJkjKP2V9SZhwBy6lrfKeakiLOfYQMo07uI8CWrxa2z/MX7/RZsMZPfhQQoed/G0jz8dnqkUKFti/peTojc/pZlteeshzHf5yY4VE7jYVIPQx5gIZQ0HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9kj99X2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779962924; x=1811498924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WXlmjDTtNd/pu+i8To0gDPyPyONeGqsh/riOoL2ousY=;
  b=D9kj99X26JLN+oo+cgf68/W1hP0QqaYFmVIAgGJf6F8Ku48a1rfkKHo1
   2v/Sn0mtWLL1EdqvvfXiXV6lP3q1ltyuZmWcUSEosI6w6Uex8KnIru/Zu
   STXiYXOvoHI6pZcbi5o39H5rJTdNfGOwz+ggWXQSFpDEHu7zP8tnmq6vt
   yDPKrH2xHF2V6XttGj0/6wDQlSvRxaJhrD1PDXa24PVY8ubVD9/EMmCSk
   hPS8RiC7tfGZnvkvY9vKmS30R/R5gwm6XUniMoaGY5JB3J7TedD0ZzudM
   Q+BjkgZpNyFN9g2FDaW1ZzLAzXP9nPt201VIjJ141wJQ0x00v9U7UZW9B
   g==;
X-CSE-ConnectionGUID: KwAHW/QfQTmf6yOL/HL96w==
X-CSE-MsgGUID: NLRN/fCBTNuiWYiBVU150w==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91488673"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="91488673"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 03:08:43 -0700
X-CSE-ConnectionGUID: MpJ+qXWaRoO/waE/wM3PRA==
X-CSE-MsgGUID: U8VaRr2EQ/2ywlHGPYCxpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="241678226"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 28 May 2026 03:08:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 851B998; Thu, 28 May 2026 12:08:40 +0200 (CEST)
Date: Thu, 28 May 2026 12:08:40 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: prevent XDomain delayed work
 use-after-free on disconnect
Message-ID: <20260528100840.GF3102@black.igk.intel.com>
References: <20260525125736.1268929-1-michael.bommarito@gmail.com>
 <20260527114604.1197561-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260527114604.1197561-1-michael.bommarito@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38131-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 8E9225F07A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, May 27, 2026 at 07:46:04AM -0400, Michael Bommarito wrote:
> tb_xdp_handle_request() runs on system_wq and queues
> xd->state_work via queue_delayed_work() in three request handlers:
> PROPERTIES_CHANGED_REQUEST, UUID_REQUEST (via start_handshake),
> and LINK_STATE_CHANGE_REQUEST.  Similarly, update_xdomain() queues
> xd->properties_changed_work when local properties change.
> 
> Concurrently, tb_xdomain_remove() calls stop_handshake() which does
> cancel_delayed_work_sync() on both delayed works.  Later,
> tb_xdomain_unregister() calls device_unregister() which eventually
> frees the xdomain.  Since commit 559c1e1e0134 ("thunderbolt: Run
> tb_xdp_handle_request() in system workqueue") moved the request
> handler off tb->wq, the handler and the remove path are no longer
> serialized.  If queue_delayed_work() executes after
> cancel_delayed_work_sync() but before the xdomain is freed, the
> delayed work fires on a freed object.
> 
> Add xd->removing that tb_xdomain_remove() sets under xd->lock
> before calling stop_handshake().  Each external queue site holds
> the same lock and checks removing before calling
> queue_delayed_work().  This provides the mutual exclusion needed:
> either the queue site acquires the lock first and queues work that
> the subsequent cancel will see, or the remove path acquires the
> lock first and the queue site observes removing == true and skips
> the queue.
> 
> Fixes: 559c1e1e0134 ("thunderbolt: Run tb_xdp_handle_request() in system workqueue")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> ---
> v2: Rebased onto thunderbolt.git/next per Mika's request. Verified
>     the race persists on next: tb_xdp_handle_request still runs on
>     system_wq, the remove/unregister split does not add
>     synchronization with the queue sites. Updated commit message to
>     reflect that tb_xdomain_unregister() now does the
>     device_unregister (split from tb_xdomain_remove on next).

Thanks Michael! Applied to thunderbolt.git/next. I would like to keep this
one for a while in linux-next and then send it with the rest for v7.2-rc1
where stable folks can then pick it up.

