Return-Path: <linux-usb+bounces-33937-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCmaLhrbp2kRkQAAu9opvQ
	(envelope-from <linux-usb+bounces-33937-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 08:11:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 333C01FB660
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 08:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DDD0302A570
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 07:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F49F36495A;
	Wed,  4 Mar 2026 07:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2NwJowR6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8B631D362
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 07:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772608279; cv=none; b=sGKUeZC0mJ/TFRIWO8L+Ble+DXW0IQsLCZFHCUlG+CL2uMGcmzPTo7kVVc2nmwzsTKFZAVuVqus49Es3dqKOAVhP9tMPJrwUePbJ/GL4g97ad0VmSyvMwfqwXzEOggBqhmgi2zt394pyUIDK3aHWVfNhkGccrruPN+ampoLZycQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772608279; c=relaxed/simple;
	bh=St2BF49wzmMLGTtnLQt60DTg9HQqbvBszXj4UXR+OTI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QtaXm7wYCypJBNRcYCrb87mSEEefg9Uk658UV97PCk8fbF61qFsNXdor1l5gubK1NFutXSI9yCtICwODt2rEWwJbW7L7jS+T/K/6A199FOLxy7p6HyXI7h01+947flpRgclD9aTsZ4Jij+eIpR6+smrVOfJMt/VCbDapcO/aeYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2NwJowR6; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3568090851aso37063876a91.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2026 23:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772608278; x=1773213078; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I0YVADbUhCdrfpICasZYCjEJg5G+lZo1YD9GhDBRVD4=;
        b=2NwJowR6FjIizZprzXHo6Z0ZG+1psMRTdpUzps4n4te+DpmA0AMgoiEV1UF/dikBpf
         PVRGfeNYrw+HQok+earPLpH34SkaS6QEaURUlwA7l8x7Gab78yJ1uyvFTA39ovPamYAP
         MRIQxzT/V42lZ7VHZ1qEc7Ycgt/rwAwHuiY15wtxWmsBEo2pIzs1d2nNEbq+DW98hMbh
         4LbKrXGdRPD+yznLeWkBz9f3qHulkiotlQzdBBnmoSYgHmlb1nwpYoP9TAoEUkyHnGmx
         5GPtpLB7Ai1hTD1KaYivSLM6jYyfFoiFb7wolPdYqeiDsYoTiKhytWbovj9IU+fRBWep
         +oHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772608278; x=1773213078;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0YVADbUhCdrfpICasZYCjEJg5G+lZo1YD9GhDBRVD4=;
        b=UDH7I4PGb3Z+oQ92fnkQiKQ+ZxvrWNtB37cof8WTrYXexACvMahIU1j5GzCrKwvzjn
         YT2ySvy63sSn0kFW2/5HUBMjQD/f/xfHlLY/5PcXmiv729U1TOScnRDpMLZ80WC0Svme
         g41ePZavMklriaPBYkkuEWMVPrIKovuuNj/MEAclHsXjtM9lEz+sqbm4b9GyqKQnHKn9
         wOxj/BgVmpwBtG0WfYvWiyyM6z8fbrT6aqdn1Efi/WExrYs0JwMipQGu1vbuB8DJdB/x
         hAOppL4bRE75qx4BIoGkHn9APmJxL1eNtgwHR/GnrZ9arOUV7VRZKXz2M/xaC8lYECdp
         nj8g==
X-Forwarded-Encrypted: i=1; AJvYcCUx5YTgRoFcRDFsoaKPPb2eLkjebRKif03xnbIU3ZhgVbC/Mc1WnDdWm5lAqQ1Q5b5DMo4GvrO4tuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGeIY63r0cQ4fp7EUFXCpeCK/VRevuJyfRgEWJG4Cgm8WEd1Mn
	JNHZbCvnYatxS1+DStWwF75Yg3E+h/gWcg27C1lvEXulqO0MCXh9WjQI11bm3IoiDoollZ4HhVQ
	RLxD2Og==
X-Received: from pjbmq16.prod.google.com ([2002:a17:90b:3810:b0:359:96a8:84e7])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a45:b0:354:c602:a573
 with SMTP id 98e67ed59e1d1-359a6a53076mr970420a91.27.1772608277231; Tue, 03
 Mar 2026 23:11:17 -0800 (PST)
Date: Wed, 04 Mar 2026 15:10:52 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPzap2kC/x2MQQqAMAzAvjJ6tlCnDPUr4mFopz04ZRMRZH+3e
 AwkeSFzEs4wmBcS35LliAp1ZWDefFwZZVEGS9ZRQy0GjPOOqnK6sO3JO+e5WzyBJmfiIM+/G6d SPqdZRoleAAAA
X-Change-Id: 20260304-f-ncm-revert-490a66ae8da0
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772608275; l=2428;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=St2BF49wzmMLGTtnLQt60DTg9HQqbvBszXj4UXR+OTI=; b=s0vtX79ASslhuw5qkYTLdbtkQGM18ou+nTOKYYTrpq04IYxTHnEvVZiyhnJCy9Xct20Up3qfw
 KDSE8bhmomVDScF58QnUdvvYk/qD6hea1kbXkB3dcZugNr9Z+j35Zh/
X-Mailer: b4 0.14.3
Message-ID: <20260304-f-ncm-revert-v1-0-57c9157b58af@google.com>
Subject: [PATCH 0/6] usb: gadget: Revert deferred network allocation in f_ncm
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Heidelberg <david@ixit.cz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kuen-Han Tsai <khtsai@google.com>, stable@kernel.org
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 333C01FB660
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33937-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ixit.cz:email]
X-Rspamd-Action: no action

This series reverts the recent changes to the f_ncm gadget function that
deferred the allocation of the net_device to the bind() phase.

The deferred allocation causes a regression for userspace tools during
network setup (such as the postmarketOS DHCP daemon). By moving the
allocation out of alloc_inst, configfs returns the name pattern "usb%d"
instead of the actual interface name (e.g., "usb0") when userspace reads
the 'ifname' attribute.

Investigating a fix for this naming issue revealed a deeper
architectural flaw introduced by the series. Deferring the allocation to
bind() means that a single function instance will spawn multiple network
devices if it is symlinked to multiple USB configurations.

Because all configurations tied to the same function instance are
architecturally designed to share a single network device, and configfs
only exposes a single 'ifname' attribute per instance, this 1-to-many
bug cannot be safely patched.

To restore the correct 1:1 mapping and resolve the userspace
regressions, this series reverts the changes in reverse order, returning
the net_device allocation back to the instance level (alloc_inst).

Reported-by: David Heidelberg <david@ixit.cz>
Link: https://lore.kernel.org/linux-usb/70b558ea-a12e-4170-9b8e-c951131249af@ixit.cz/
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
Kuen-Han Tsai (6):
      Revert "usb: gadget: f_ncm: Fix atomic context locking issue"
      Revert "usb: legacy: ncm: Fix NPE in gncm_bind"
      Revert "usb: gadget: f_ncm: align net_device lifecycle with bind/unbind"
      Revert "usb: gadget: u_ether: Add auto-cleanup helper for freeing net_device"
      Revert "usb: gadget: u_ether: use <linux/hex.h> header file"
      Revert "usb: gadget: u_ether: add gether_opts for config caching"

 drivers/usb/gadget/function/f_ncm.c            | 111 ++++++++--------
 drivers/usb/gadget/function/u_ether.c          |  45 -------
 drivers/usb/gadget/function/u_ether.h          |  30 -----
 drivers/usb/gadget/function/u_ether_configfs.h | 168 -------------------------
 drivers/usb/gadget/function/u_ncm.h            |   5 +-
 drivers/usb/gadget/legacy/ncm.c                |  13 +-
 6 files changed, 64 insertions(+), 308 deletions(-)
---
base-commit: 1be3b77de4eb89af8ae2fd6610546be778e25589
change-id: 20260304-f-ncm-revert-490a66ae8da0

Best regards,
-- 
Kuen-Han Tsai <khtsai@google.com>


