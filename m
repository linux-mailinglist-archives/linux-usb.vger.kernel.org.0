Return-Path: <linux-usb+bounces-37245-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLxMIUKvAWrXiAEAu9opvQ
	(envelope-from <linux-usb+bounces-37245-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C45950BE29
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36F033026C8E
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 10:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62EE3D7D98;
	Mon, 11 May 2026 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eggct4mM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64E83D75D1
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495274; cv=none; b=qSIZ4ZPWCLoiYFeTgcpplnyJXW3ZraVM1oJuo6n9Yy/iZ5ybMReI7fxOFg+P3M+QBB3NHsZSfvr+H0Q/dFAeEff48sRzq4y47hTGYKuVImFmtNgeVyDFFp3qgX9mdbxBh/ZMwzpKsxniaM+4Df4gAa3OarUseYbf7WbRLcOq9Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495274; c=relaxed/simple;
	bh=ZEbVhd/eY4nIrE0894be0mDfvxPmr8b2jj/blx5JMbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MA3JV9F8cCwGBKPUr4eb1nBkl2CNmFtJXgLdQb4gsvxu037d2MvH55UiGTsORg1s5Yg4C3UpAVWbH+HPXXvZJIr0TmVrwfs+CHFTKbxxmisUp7O7SA+lEOqoi8PkU3lmmNXupuY+voCQQW7JlgRkobB6o65HE90ef1lgD6+yznw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eggct4mM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778495273; x=1810031273;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZEbVhd/eY4nIrE0894be0mDfvxPmr8b2jj/blx5JMbk=;
  b=eggct4mM+wYYM+MPRUoFF9G2PHPQV536FyW9gHfC41qO+zE+fyytpAUi
   epcpbn01fAmm+aLgmBaxwtDDzU6SapfYuoty2a+xEXxha06OvwSAvVxk/
   eRWViNxUIhQMNtJM5bLwRfVXnslO2HAH0/nGdIfeJojgXP0wFsfx8F7NO
   /8ZdQEod9AdDsrvThK8RKhwD9i3WNX6El+g5Q+lEiY2l+e8OHwpUb2oJK
   eAulz/4Q6Ua2VuHayQxYqsYzzoxGKQJpXHIFTRyqcWH/2LK81NP85FcFY
   cw6o1sStHVVXiDo59E3Z2Yo30U6AuJsWWnEUE5RQ8dkm4j9LmngN+LwUO
   g==;
X-CSE-ConnectionGUID: 9XcKqH6ASS6P1z6mWsSsRQ==
X-CSE-MsgGUID: 71XczW/nQbKr95CQbYBXvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79479108"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79479108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 03:27:52 -0700
X-CSE-ConnectionGUID: BBcX4CqvS36lsW5ud7uDCg==
X-CSE-MsgGUID: VBl911FeTXiWRECdjKASmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="234358552"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 11 May 2026 03:27:49 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id ACA10A6; Mon, 11 May 2026 12:27:44 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 10/10] docs: admin-guide: thunderbolt: Add instructions how to use USB4STREAM
Date: Mon, 11 May 2026 12:27:44 +0200
Message-ID: <20260511102744.1867485-11-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
References: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3C45950BE29
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,lunn.ch,lwn.net,linuxfoundation.org,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37245-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

Add instructions how USB4STREAM can be configured and used.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 Documentation/admin-guide/thunderbolt.rst | 61 +++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
index 89df26553aa0..91a6cb109988 100644
--- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -373,6 +373,67 @@ port which are named like ``thunderbolt0`` and so on. From this point
 you can either use standard userspace tools like ``ip`` to
 configure the interface or let your GUI handle it automatically.
 
+Streaming data directly over Thunderbolt cable
+----------------------------------------------
+In addition to Thunderbolt networking (aka. USB4NET) Linux supports
+streaming data directly over a cable as well (aka. USB4STREAM). This is
+possible through ``thunderbolt-stream`` driver.
+
+Similarly to ``thunderbolt-net`` you load the driver first on one end::
+
+  host1 # modprobe thunderbolt-stream
+
+Then you configure it via ``ConfigFS``::
+
+  host1 # cd /sys/kernel/config/thunderbolt/stream
+  host1 # mkdir -p 0-1.0/data
+  host1 # cd 0-1.0
+  host1 # echo -1 > data/in_hopid
+  host1 # echo -1 > data/out_hopid
+
+This information is automatically announced to the other side via
+XDomain properties so if you have cable connected the other side knows
+that there is a stream named ``data`` available and can configure it for
+you automatically::
+
+  host2 # cd /sys/kernel/config/thunderbolt/stream
+  host2 # mkdir -p 0-3.0/data
+
+Here we used auto-configuration but you can configure it manually too.
+In that case you need to fill ``in_hopid`` and ``out_hopid`` accordingly.
+If you set them to ``-1`` the next available HopID is used which is
+typically what we want.
+
+Once they are configured you can use ``/dev/tbstreamX`` on both sides to
+transfer data::
+
+  host2 # cat /dev/tbstream0
+  host1 # dmesg > /dev/tbstream0
+
+Once you are done with the stream you can remove them::
+
+  host2 # cd /sys/kernel/config/thunderbolt/stream
+  host2 # rmdir -p 0-1.0/data
+  host1 # cd /sys/kernel/config/thunderbolt/stream
+  host1 # rmdir -p 0-3.0/data
+
+Since streams are essentially files you can use any existing application
+that supports ``read(2)`` and ``write(2)`` in some form.
+
+It is possible to have more than one stream and you can have both stream
+and ``thunderbolt-net`` in use simultaneously. For example we can create
+two streams with name ``control`` and ``data`` like this::
+
+  host1 # cd /sys/kernel/config/thunderbolt/stream
+  host1 # mkdir 0-1.0
+  host1 # cd 0-1.0
+  host1 # mkdir control
+  host1 # mkdir data
+
+Then you have ``/dev/tbstream0`` for ``control`` and ``/dev/tbstream1``
+for ``data``. Before you can use them you need to configure them as
+shown above for the one stream case.
+
 Forcing power
 -------------
 Many OEMs include a method that can be used to force the power of a
-- 
2.50.1


