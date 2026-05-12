Return-Path: <linux-usb+bounces-37324-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEqGL+QdA2pD0gEAu9opvQ
	(envelope-from <linux-usb+bounces-37324-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:32:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6C752030A
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC3BA3021B6E
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 12:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC0625B096;
	Tue, 12 May 2026 12:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3cXJbBW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E2395AD6
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 12:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589017; cv=none; b=St1HwpBztb8fKExZ2aWM5va8IgH0nY9A0yFCPE/33EePVE1nc+EDysZ7lgJNjkJJkhJNWndBxGjrsQ6eckb3KhRPLcPK8FfxJgWev+jXd0aOXQw6Vig94DkvOlpThY9r79QNqcM7VRoqSUFHBvtxlpOfWXJIGoje6idjPF4enl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589017; c=relaxed/simple;
	bh=rb7KCOnpVwX06eQ+syyZaPSxvMH8p6awcjmQwIASAag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vt0Qs3UiU7HdbXbevD5L4WpmYnMj29bt6VLXPTURnpkqtMaCL0ZVI29+wtBMPX12sim9M1dPb/FO4VXRr60MhR3RR9MY0BgTsk81u40O/H0FOlPBgg9FSYjHzKGj1n5LY0dDkym3sCj1dT4MNuevlKaf4C3U70okISZBBGC7ueA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3cXJbBW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778589013; x=1810125013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rb7KCOnpVwX06eQ+syyZaPSxvMH8p6awcjmQwIASAag=;
  b=W3cXJbBWepeEbetNJoUJyqtxCpi5qD0syqUBW1w2f8P6+fpj7YVzKyp2
   YR9+cTD2xqYTBRnSz79Kh3f5C4WXsAh19L6TBgzpI7Vj1q63rGuzATNdT
   /ltAjPBjl40jLFEpNMW+rxsb7tAjKiNCVaZPl6eRHkYOEGFkSIwX52k+X
   0P+SUOoBL0I8CYvBoCknE1yrQ1D3PIQ0AJiJsZv7wXBYHPpsxsqZKqsKK
   FcWBpAouHy57lE+sNm7DDawP18+ZPRzMZfV6HXLIGiGWvHr30GjuPf3LC
   kTUyNyMiydvKAEgdVpMuH2qfjpgtvB8O2IhFNZYI0Cx1D3JuHUdoJlgma
   Q==;
X-CSE-ConnectionGUID: O7YMeSw+Q0mfFXPGSBapZw==
X-CSE-MsgGUID: +6+ee41MSI62IUoQDRBmrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950594"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="104950594"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:29:59 -0700
X-CSE-ConnectionGUID: c5b1g4V8SCmihbBLTellHw==
X-CSE-MsgGUID: R7GKhmhfQWS/qjBkHwKg+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="234692669"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2026 05:29:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B783795; Tue, 12 May 2026 14:29:55 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/8] thunderbolt: Improve multi-display DisplayPort tunnel allocation
Date: Tue, 12 May 2026 14:29:48 +0200
Message-ID: <20260512122955.271688-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260512122955.271688-1-mika.westerberg@linux.intel.com>
References: <20260512122955.271688-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BE6C752030A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37324-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

When 3 monitors are connected through Thunderbolt dock to the system at
once, one of the monitors might fail to establish DisplayPort tunnel.
This happens during DP bandwidth negotiation - each monitor takes
maximum bandwidth that is supported and there might not be enough for
3rd display. In this case Thunderbolt driver drops DP tunnel and
'forgets' about it but with DP bandwidth allocation mode, that comes in
later, some bandwidth might be freed.

Make Thunderbolt driver check again if DP tunnel can be established
after DP bandwidth consumption changed.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index a9d26a2ec259..72a0dd27937e 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2849,6 +2849,9 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 
 		/* Update other clients about the allocation change */
 		tb_recalc_estimated_bandwidth(tb);
+
+		tb_dbg(tb, "checking if more DP tunnels can be established now\n");
+		tb_tunnel_dp(tb);
 	}
 
 put_sw:
-- 
2.50.1


