Return-Path: <linux-usb+bounces-21288-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C207A4CA8B
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 18:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22F4E18840C4
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 17:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99199217F35;
	Mon,  3 Mar 2025 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/HC7kTU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCE0215169
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 17:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741024706; cv=none; b=djzZa6id+C031ZO/hofTm+joCj6d5xYIqsS3u1zr6lzTSd8r6/ZYwHHYHQ0Y9DDeidKXs31gHAlfvllEJ5hrzdzmLjkX7J06ejZ/Zo7UQEYuuody7f7l0LdHwxjmXEJjwIZERvJXFeJ1fZE4SYMrBe7CUwM7xhe/cIlLTZaHS7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741024706; c=relaxed/simple;
	bh=XwOAcTmTgvAyUHhFTDok1Uh5LQrIZkAcjXfwd8t05Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zzm4fWsORymP0Pzt9OevqYbDEz78x2Z7ucmyLIDIfwV+xkHVljNVPSvDPc2vseibunrbYpoqiqqRABF1O2C2gFzWEVDzvUMeYkZXCZL+mEhY1cFoxWdCkLPMyAre2zmvE2S3x2CaIScOeueoqQgLXs7AssNk7uvnFlQmKA1jDJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/HC7kTU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741024704; x=1772560704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XwOAcTmTgvAyUHhFTDok1Uh5LQrIZkAcjXfwd8t05Sc=;
  b=C/HC7kTU6uHmX2OftZyvUJ/3j0WwlY0VftinTsONqa6ojyyOF60J/1wG
   NulzBDAjNydSXhKVVcX6pwo23pzDO8DC1Jju90rfc6EmHIhiLW7HVI0bG
   Wow6qPmmUo3TfbmaalQkDhP/7S3XmCTgGDxAKUm8CMJTL+8l+pZxb1X9L
   vXlWlYfcQETXh6+x1xK5Lfw6oG4u6vfpnrV+Fft2lHz+TO3PQLL7zxx1o
   MmLfKWMVTQPWpemY48qSs06DWSvD1cxoMISNjkROEl0AOT97kN4GhuWmK
   Dno1dlkY/ztYFZ/mIPk+/Jarh0oc03MTm01fmRedTj3R9y1HYT/wbR6pg
   A==;
X-CSE-ConnectionGUID: PJABIHXHT6KlplZEnRCB5w==
X-CSE-MsgGUID: akSdS+/GQ5CqfC0J1nP09w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41805511"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="41805511"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 09:58:20 -0800
X-CSE-ConnectionGUID: bwJvniXeSqKUFbL0EKX6rA==
X-CSE-MsgGUID: SHV+MASfQIS8HJU0cqeqpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="123118160"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Mar 2025 09:58:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 4445A156; Mon, 03 Mar 2025 19:58:18 +0200 (EET)
Date: Mon, 3 Mar 2025 19:58:18 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
Message-ID: <20250303175818.GB3713119@black.fi.intel.com>
References: <68cec31a-0132-43bd-8a61-29e0ac23b326@panix.com>
 <20250303131359.GV3713119@black.fi.intel.com>
 <744090aa-074e-443f-8a94-567dadff4c7d@panix.com>
 <20250303132327.GW3713119@black.fi.intel.com>
 <20250303134618.GX3713119@black.fi.intel.com>
 <24ef839c-8fa5-4a19-b9c6-0a267aab84f5@panix.com>
 <20250303140156.GY3713119@black.fi.intel.com>
 <567725a5-f984-4ea1-bd38-8815825c1211@panix.com>
 <20250303142058.GA3713119@black.fi.intel.com>
 <402bcee8-030a-45bf-834b-ea4baf5eed3c@panix.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <402bcee8-030a-45bf-834b-ea4baf5eed3c@panix.com>

On Mon, Mar 03, 2025 at 06:33:06AM -0800, Kenneth Crudup wrote:
> 
> On 3/3/25 06:20, Mika Westerberg wrote:
> 
> > Actually just managed to reproduce this with hibernate \o/ so debugging
> > now.
> 
> OK, this is good ... but now you've got me wondering if I indeed saw it
> during suspend cycles as well (I usually suspend only, then systemd will
> initiate a hibernation after 4H so just going back/forth to the office
> shouldn't trigger this).
> 
> Waiting to see what you find,

Okay, I think I figured out what is going on. Indeed d6d458d4 is buggy but
not the way I thought it was ;-) What actually happens is that once we
resume from hibernate we discover the tunnels created by the boot kernel
and tear them down. For discovery we never start the DPRX negotiation but
we still ended up calling tb_dp_dprx_stop() which does tb_tunnel_put() and
this releases the tunnel object. All accesses after this and up touching
already freed memory!

I've played with the below patch for a while and I have not seen that issue
anymore. Can you try it out on your end too?

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 8229a6fbda5a..717b31d78728 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1009,6 +1009,8 @@ static int tb_dp_dprx_start(struct tb_tunnel *tunnel)
 	 */
 	tb_tunnel_get(tunnel);
 
+	tunnel->dprx_started = true;
+
 	if (tunnel->callback) {
 		tunnel->dprx_timeout = dprx_timeout_to_ktime(dprx_timeout);
 		queue_delayed_work(tunnel->tb->wq, &tunnel->dprx_work, 0);
@@ -1021,9 +1023,12 @@ static int tb_dp_dprx_start(struct tb_tunnel *tunnel)
 
 static void tb_dp_dprx_stop(struct tb_tunnel *tunnel)
 {
-	tunnel->dprx_canceled = true;
-	cancel_delayed_work(&tunnel->dprx_work);
-	tb_tunnel_put(tunnel);
+	if (tunnel->dprx_started) {
+		tunnel->dprx_started = false;
+		tunnel->dprx_canceled = true;
+		cancel_delayed_work(&tunnel->dprx_work);
+		tb_tunnel_put(tunnel);
+	}
 }
 
 static int tb_dp_activate(struct tb_tunnel *tunnel, bool active)
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 7f6d3a18a41e..8a0a0cb21a89 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -63,6 +63,7 @@ enum tb_tunnel_state {
  * @allocated_down: Allocated downstream bandwidth (only for USB3)
  * @bw_mode: DP bandwidth allocation mode registers can be used to
  *	     determine consumed and allocated bandwidth
+ * @dprx_started: DPRX negotiation was started (tb_dp_dprx_start() was called for it)
  * @dprx_canceled: Was DPRX capabilities read poll canceled
  * @dprx_timeout: If set DPRX capabilities read poll work will timeout after this passes
  * @dprx_work: Worker that is scheduled to poll completion of DPRX capabilities read
@@ -100,6 +101,7 @@ struct tb_tunnel {
 	int allocated_up;
 	int allocated_down;
 	bool bw_mode;
+	bool dprx_started;
 	bool dprx_canceled;
 	ktime_t dprx_timeout;
 	struct delayed_work dprx_work;

