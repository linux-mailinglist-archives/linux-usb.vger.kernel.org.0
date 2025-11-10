Return-Path: <linux-usb+bounces-30273-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 262D0C469AC
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35C721881794
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6599B30FC2D;
	Mon, 10 Nov 2025 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxYzRAbK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16AC30DEB1
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777857; cv=none; b=MsgAcJ3DbEqmAq27VUZOTOZIqo6AhuoaYkI/zQbXj5jPC9RbvBVdSja8xVEMNRA/lL9u/2oh0LDkV/9quFQ0RQOpXh06AJoLZuUlTTbqW/pCWQWnP0mRsEf2MYHr1p3HN69D1L8m1OclTSRDMHc+MX1hgJaGOkUm0J2o49yx3Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777857; c=relaxed/simple;
	bh=DNlUWzH6GTxrxFOGN7AUrxiuWp15On0l/2qvJUbBX1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DrbFHOdFItDn7hA7Qo2JyVY7yp8Q8fVhMLI8PtTodUYXA+YIW5UEofVceWdfRyil/a1sS8G+hKEQKPSJvu4Se7oa5mDEANzWS38uLrsnWpyAXtBHpD4bJEuwzWL+zui0+WNlQjovKSAJa1OExD/iYd+FtdDdKyYFWyC5uWZp9Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxYzRAbK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777856; x=1794313856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DNlUWzH6GTxrxFOGN7AUrxiuWp15On0l/2qvJUbBX1o=;
  b=hxYzRAbKpaiFitlozaHRuGedLZ9eWcAaAF6fXm8eSvnq90iXFUppY5QY
   exBo2lWwoXVMwCNDHdH65owwX3386IPqqQ0w1E7A+j1BO31sohAMZDqIL
   1rJSgqMsyK624TwmYCZBDCGL6x0MWTEG0mFZHCnEyDl8MPWZJ6fO7d5uj
   Bh2k9QErcaQCkHvJdQNOI2sFnV7KZXyJwlHIRyyCpVxR5MAyRt5W6JeO8
   ZQ/r/oDoAf22ebdYtcnFAwJ4tumcpkiOk4OPPK4hP7WyXRAn9Ck1UI3N6
   hezNo8CE9KmD79kdh7gRS8USbepCqaB7HDBhMYRI9LkwSUqyF1nxzyNMI
   Q==;
X-CSE-ConnectionGUID: FBs23S/RR7SuGfGdjOs8kQ==
X-CSE-MsgGUID: R0fQFtdGQveh4b2o/rKp6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64525615"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64525615"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:56 -0800
X-CSE-ConnectionGUID: qtn7fRtdQoGPBemw1yCB0Q==
X-CSE-MsgGUID: RngojI6ZQgarWcHA/x4Afg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="219387914"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2025 04:30:53 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9DDA0A0; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 11/16] thunderbolt: Fix typos in tb.h
Date: Mon, 10 Nov 2025 13:30:45 +0100
Message-ID: <20251110123050.3959188-12-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
References: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Fix typos in tb.h. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 8e2762ff8d51..e96474f17067 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -308,7 +308,7 @@ struct tb_port {
  * struct usb4_port - USB4 port device
  * @dev: Device for the port
  * @port: Pointer to the lane 0 adapter
- * @can_offline: Does the port have necessary platform support to moved
+ * @can_offline: Does the port have necessary platform support to move
  *		 it into offline mode and back
  * @offline: The port is currently in offline mode
  * @margining: Pointer to margining structure if enabled
@@ -355,7 +355,7 @@ struct tb_retimer {
  * struct tb_path_hop - routing information for a tb_path
  * @in_port: Ingress port of a switch
  * @out_port: Egress port of a switch where the packet is routed out
- *	      (must be on the same switch than @in_port)
+ *	      (must be on the same switch as @in_port)
  * @in_hop_index: HopID where the path configuration entry is placed in
  *		  the path config space of @in_port.
  * @in_counter_index: Used counter index (not used in the driver
@@ -499,9 +499,9 @@ struct tb_path {
  *		    performed. If this returns %-EOPNOTSUPP then the
  *		    native USB4 router operation is called.
  * @usb4_switch_nvm_authenticate_status: Optional callback that the CM
- *					 implementation can be used to
- *					 return status of USB4 NVM_AUTH
- *					 router operation.
+ *					 implementation can use to return
+ *					 status of USB4 NVM_AUTH router
+ *					 operation.
  */
 struct tb_cm_ops {
 	int (*driver_ready)(struct tb *tb);
@@ -1109,7 +1109,7 @@ struct tb_port *tb_next_port_on_path(struct tb_port *start, struct tb_port *end,
 				     struct tb_port *prev);
 
 /**
- * tb_port_path_direction_downstream() - Checks if path directed downstream
+ * tb_port_path_direction_downstream() - Checks if path is directed downstream
  * @src: Source adapter
  * @dst: Destination adapter
  *
@@ -1141,7 +1141,7 @@ static inline bool tb_port_use_credit_allocation(const struct tb_port *port)
 	     (p) = tb_next_port_on_path((src), (dst), (p)))
 
 /**
- * tb_for_each_upstream_port_on_path() - Iterate over each upstreamm port on path
+ * tb_for_each_upstream_port_on_path() - Iterate over each upstream port on path
  * @src: Source port
  * @dst: Destination port
  * @p: Port used as iterator
-- 
2.50.1


