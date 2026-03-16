Return-Path: <linux-usb+bounces-34883-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNcyHLocuGlYZAEAu9opvQ
	(envelope-from <linux-usb+bounces-34883-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 16:07:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 148E429C000
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 16:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00CE13074115
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370DE30214D;
	Mon, 16 Mar 2026 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BSacL2DP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BAE2FFF99
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673386; cv=none; b=jXin3qazCwKRY9SYQcmySIM8YmhgAqA5AtyJnkPz9225mo0W8OkDQfyKJYezTDpixWzXlzLMDAzrhy1Eu43x6OCz5LPc3PiUFEVoPubnViCwFKtZvBg0XZxv86z0ZjTWyctCaVz5TevLi1Z78KmY716BV4yeew/T/pJckMB31zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673386; c=relaxed/simple;
	bh=SMl3Wrxpjqp4zhVjwehql/YPr5mXgBPXeb73M3/+5uw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dfXDuDhEwFy6oWs8Z1I1ADeTiXTlGE0cpNQUzrd2Q9Vc3XF78rrDq04msygsb1zLp/CJ6Q/PyFZK3nugqa5Q1ehhXLjvMgqjgzMrXlqcvZn1qe0rolxW/E0V+PXQd1tZJN3xeaJBupOlw3wYJiYea3j9d4QN77XgebVOJJBxVUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BSacL2DP; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-127337c8e52so87454012c88.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773673384; x=1774278184; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1mIGKHhFEp4UVK+eulXpjau2QaiKJ+LkKKD5Vd3/77g=;
        b=BSacL2DP/inOAv50GSFKBzOMb9PauYWOIwkPz2EH4ZSPbNX6eEP7qZkgPlz4/Y1WA9
         9+W4vt4vBgX8oWTu9blWMbfASRMz5HbdFF8ZP+tksmvdbmvTq8WE87yUYfi9yDieVdH8
         bkrncSCALTKQ3I6nLq7egMFWcnEdFTXE5ibChsZCa9lzBwuGV8HwHnOCXX96T3dOV7DG
         UO40Y/dAZBbdYINm1VLaPSemKndinM1T00Ki53rQTUf01RIZTBxqJD+THfWI0ggaJ/sn
         MtiTFz5oUyq81NeKNjSUQhIS90PPmtgVqbHLcfAHjut4H5kKxEqXzAmQExO20B0/sTLH
         iv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773673384; x=1774278184;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mIGKHhFEp4UVK+eulXpjau2QaiKJ+LkKKD5Vd3/77g=;
        b=TmyiGSllbUtBg1Jtp4mEmUHROyLC693TLWMyuYINqXdo9aKJMPdaBFQn7jXsJy279s
         mUZhl/YcJSYIIy8QgfPnzqfG9CkNJou+8E/tC94sY+Ax1dkXLPuP9st2GGRUHywDOHWg
         dj9WNiffmz2MqUCtIv1S36kJVTsL0i7AhBTiX2FHBMZ8hqoQBMVzpJ99ir7F2kmCTfnO
         msqjLWlnowTaz3oO4inwcrHbMV7iN51wTiQBNwxMPXa6V3GLFQ/ARiXlPP8YuAYugXDs
         GyEhul/pX2QWWhJOQdNHzfqiisYn42bMTlkRCFg6lgM82/XwvJi1kzz+WmdDNqU597Op
         HLBg==
X-Forwarded-Encrypted: i=1; AJvYcCWJG5u4cOb7gnb2/5rucPjUA19QmXjuFBuRojGEmu+mPWGDMPgG5eiIiTQYFk8RbutLCVvddMQVYDE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+6yQL3KH8nEy9UmT9unROsL7kUGc0cO3wzgRVsA34apEpGYQC
	qMQ3H9h5FDd2IE+4QjnwnAlFP8RVZssXDaQnfpTB7jAEs1HeLYmBIBwsWEpWZ8WIQyY6Dl0ywqc
	BNbsJHQ==
X-Received: from dlbtu10.prod.google.com ([2002:a05:7022:3c0a:b0:128:cffb:50d7])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6b98:b0:124:8d7d:2d63
 with SMTP id a92af1059eb24-128f3e24bb3mr6179621c88.35.1773673384259; Mon, 16
 Mar 2026 08:03:04 -0700 (PDT)
Date: Mon, 16 Mar 2026 15:02:58 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260316150301.3892223-1-badhri@google.com>
Subject: [PATCH v2 0/3] Add support for AVS in TCPM
From: Badhri Jagan Sridharan <badhri@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Sunil Dhamne <amitsd@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34883-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[badhri@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 148E429C000
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To facilitate optimum charging USB_PD_R3_2 introduced a SPR AVS
(Standard Power Range Adjustable Voltage Supply) which is a power supply
mode operating within the Standard Power Range (up to 100W). It allows a
Source to offer an output voltage that can be adjusted by the Sink in
fine increments (100mV) within a defined range.

Unlike the Programmable Power Supply (PPS), SPR AVS does not support a
programmable current limit (Current Limit Mode). Instead, it functions
similarly to a Fixed Supply where the voltage is adjustable; the Sink
is responsible for ensuring it does not draw more current than negotiated.

This patch series enables sink to enable and negotiate SPR AVS with an
SPR AVS capable PD source. This allows gs101 to negotiate SPR AVS with
a SPR AVS compatible USB PD port partner. The DTS changes for gs101
will be sent as a separate patch while marking this topic as a
dependency.

This patch series also depends on the "Introduce Sink Cap Extended AMS"
introduced by Amit Sunil Dhamne as it introduces the SPR AVS voltage
tier constants which this patch series relies on.

Depends-on: https://lore.kernel.org/lkml/20260223-skedb-v2-0-60675765bc7e@google.com/
---
Changes in v2:
- Updated Documentation/ABI/testing/sysfs-class-power to address
  Sebastian Reichel's comments
- Added Acked-by tag for patch 3 and patch 1.
- Rebased on top of usb-next which dropped prerequisite-patch-id tags as
  Depends-on patch is now part of usb-next

Link to v1: https://lore.kernel.org/lkml/20260226055311.2591357-1-badhri@google.com/
---
Badhri Jagan Sridharan (3):
  dt-bindings: connector: Add SPR AVS Sink APDO definitions
  power: supply: Add PD SPR AVS support to USB type enum
  tcpm: Implement sink support for PD SPR AVS negotiation

 Documentation/ABI/testing/sysfs-class-power   |   3 +-
 .../bindings/connector/usb-connector.yaml     |   5 +-
 drivers/power/supply/power_supply_sysfs.c     |   2 +
 drivers/usb/typec/tcpm/tcpm.c                 | 611 +++++++++++++++---
 include/dt-bindings/usb/pd.h                  |  18 +
 include/linux/power_supply.h                  |   3 +
 include/linux/usb/pd.h                        |  32 +-
 include/linux/usb/tcpm.h                      |   2 +-
 8 files changed, 565 insertions(+), 111 deletions(-)


base-commit: de6c925db978004703944585e9dd57d58aba0fac
-- 
2.53.0.851.ga537e3e6e9-goog


