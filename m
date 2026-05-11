Return-Path: <linux-usb+bounces-37242-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOKoJTKvAWrXiAEAu9opvQ
	(envelope-from <linux-usb+bounces-37242-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3898C50BE0D
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F7953020ED8
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 10:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E7D3D6CCE;
	Mon, 11 May 2026 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d446p4tp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7688F3D75A1
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 10:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495272; cv=none; b=NGgSy93anMm0LMtwqQ+dgEBQ7Zb9mtMQAnS5A9GkiN8n4nJOcejVO7P/WWCJkN6CqhJbCCr6DzBKtixkM5kvlcIYXEyxmXN2J7ZLi2jtxlmQCWVDkI3Oo1dt9FwWpWqHhVRr/6I3K7r/dEAqLUHzsQjAc245WrP8nncnulGwphg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495272; c=relaxed/simple;
	bh=9w1s0GSZ8lBDCEK5RYzM2BL7nidRmRgwbuDAON/KaiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bdEZiQ8Kgz0RWySGyVmV6Eva7eikKPENc6UQWhUKUwaLzxhuZgenOn9LKoINJHrWGfEssExK9odm4kXt6mgNImeAGYoYkziV+funneT7m1xIq5o4FTXmmPvrhKR6l0H5t+4PB2UdGckiHXznbu+kjq3AZFmL0gZBdwjZwnTbcqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d446p4tp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778495271; x=1810031271;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9w1s0GSZ8lBDCEK5RYzM2BL7nidRmRgwbuDAON/KaiU=;
  b=d446p4tpjrlveVnptTznDMbgkib+C13V5u+iheLoCYYTb1DYaZISJyHO
   Gx/QfJF45ac+UoU+RNNGp8RbKWv3Y0dvdv9+chjliDWN4fetzrsLA1WJS
   0Q6pAEgc2oHxNVZhTJrpScjsqSGyH2P2HGdT3mj/I1f8FBzDQ++tm5Xcp
   dexIJZV6nou3P54+frBmbzyqk7q93OjRrS0BVO2L0sk7CvpvcWmsvs9t5
   2vs9H5fye6oHAgnKc+ERgQ1C7WaHm/brarQ4TUzk0sXddjBgVRnUTT6bF
   YcrJxP2PwuhP3Jvf3WI86vrpfmoCOV/j3EEckAnx5e1gM6mBNdW8CQwh0
   g==;
X-CSE-ConnectionGUID: dzM0BaSqTTCXvKG0x/3yTA==
X-CSE-MsgGUID: ImO6XkZ6RlCBkCbqOzPz1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79479087"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79479087"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 03:27:48 -0700
X-CSE-ConnectionGUID: qd0TLIsUQnaWToOYecYCIg==
X-CSE-MsgGUID: l20nlUxYTPyr0WaVjCVMQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="234358529"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 11 May 2026 03:27:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8B1E495; Mon, 11 May 2026 12:27:44 +0200 (CEST)
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
Subject: [PATCH v2 00/10] thunderbolt: Introduce USB4STREAM
Date: Mon, 11 May 2026 12:27:34 +0200
Message-ID: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3898C50BE0D
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
	TAGGED_FROM(0.00)[bounces-37242-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.983];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Action: no action

Hi all,

This series adds support for a new protocol over USB4/Thunderbolt cable
called USB4STREAM. The protocol is super-simple and basically just
transfers raw packets from one host to another. It is documented as part of
the thunderbolt_stream driver.

The driver exposes /dev/tbstreamX devices on each side of the link that can
be used to transfer data using regular filesystem operations such as
read(2) and write(2):

  host1 # cat /dev/tbstream0
  host2 # echo hello > /dev/tbstream0

This can be useful in cases where network tooling is not available or just
for existing applications like 'dd' and 'cat' that do not support sockets.

thunderbolt_stream can be used at the same time with thunderbolt_net so
they don't rule each other our. 

thunderbolt_stream allows multiple streams to be created, for example one
stream for control traffic and another for data (there are some limitations
in the core USB4/Thunderbolt driver due to dedicated flow control scheme
but this is likely change in the future). Each stream is bi-directional
tunnel over the fabric.

There are a couple of additional usage examples in the last patch that adds
the driver itself.

Previous version of the series is avaiable here:
  
   https://lore.kernel.org/linux-usb/20260428072209.3084930-1-mika.westerberg@linux.intel.com/

Changes from the previous version:

  * Dropped module parameter from the network driver.
  * Convert stream driver to use miscdevice instead.
  * Add documentation how to use stream to admin guide.

Mika Westerberg (10):
  thunderbolt: Add tb_property_merge_dir()
  thunderbolt: Add KUnit test for tb_property_merge_dir()
  thunderbolt: Allow service drivers to specify their own properties
  thunderbolt / net: Move ring_frame_size() to thunderbolt.h
  thunderbolt / net: Let the service drivers configure interrupt throttling
  thunderbolt: Add helper to figure size of the ring
  thunderbolt: Add tb_ring_flush()
  thunderbolt: Add support for ConfigFS
  thunderbolt: Add support for USB4STREAM
  docs: admin-guide: thunderbolt: Add instructions how to use USB4STREAM

 .../ABI/testing/configfs-thunderbolt_stream   |   83 +
 Documentation/admin-guide/thunderbolt.rst     |   61 +
 drivers/net/thunderbolt/main.c                |   20 +-
 drivers/thunderbolt/Kconfig                   |   15 +
 drivers/thunderbolt/Makefile                  |    4 +
 drivers/thunderbolt/configfs.c                |   61 +
 drivers/thunderbolt/dma_test.c                |    5 +
 drivers/thunderbolt/domain.c                  |    2 +
 drivers/thunderbolt/nhi.c                     |   86 +-
 drivers/thunderbolt/nhi_regs.h                |    3 +-
 drivers/thunderbolt/property.c                |  154 +-
 drivers/thunderbolt/stream.c                  | 1698 +++++++++++++++++
 drivers/thunderbolt/tb.h                      |    8 +
 drivers/thunderbolt/test.c                    |   82 +
 drivers/thunderbolt/xdomain.c                 |   95 +-
 include/linux/thunderbolt.h                   |   44 +-
 16 files changed, 2326 insertions(+), 95 deletions(-)
 create mode 100644 Documentation/ABI/testing/configfs-thunderbolt_stream
 create mode 100644 drivers/thunderbolt/configfs.c
 create mode 100644 drivers/thunderbolt/stream.c

-- 
2.50.1


