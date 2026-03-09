Return-Path: <linux-usb+bounces-34296-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KFzLmO4rmlIIQIAu9opvQ
	(envelope-from <linux-usb+bounces-34296-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 13:09:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EB52387A4
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 13:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F120630512BF
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 12:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DC53A8727;
	Mon,  9 Mar 2026 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0Lpm0BGQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FB23A782B
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057920; cv=none; b=k+VezvEXhe7u1Mr4O8/Cno2BFmXtlKkRkicXzuVqSDyWRBLmeO1wnp42xbhDsw2zkfSYw74mXARmpHkXoWR6Ib1YjsiiZntmgdIXHHugOj1u7j9RNej76FASCEBxDc0hxycQ1T08LeoLklzLXEgFyAphdQVDsJsbpup1OcSsEI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057920; c=relaxed/simple;
	bh=RVsYDsCZmC3FgVru9fjR8o33BuHu9fkICkZ74ZUJ1hk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TMxykKbsu7zI4R8nA7WV5MossmZdBWulU0SxidIeC7azBY2MsLj/Bbw5jgveMLI8tDn5bAlrRFMhtZsxVNMdNQiDIQY/JR110JnXdQZzTPLQJlbIS6zocOqJgZoQWAN/BmXJI0QvmnGV1L6B4JC10+KnUBNk8xdmHD9ILXWtlVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0Lpm0BGQ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ae49080364so66391305ad.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773057916; x=1773662716; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZW58/Pl2Sq+I7sc4XO4eZyZGX+Qi5iOeGztEkVLEFQ8=;
        b=0Lpm0BGQJhbc/Y/8PbANZeJ7Cdy12GPSarD7vN4V3PNI9aF/uLfAoSBRe9CnJwveAy
         dtt8RYHoJLWrvLMfGR3pfQQ7O3p3wWGw/ONpyjreEFayoDWm20Hr/73zyA6MmDQkD03Y
         Fsn8xHbEAJMOQLluexQJ/OpZheBRBmtT1VvWDWhnGAhnY4BvARXzlNo36dXhaJhAhC+m
         3Aft8dPGPZQqlC9mC9YXElzA+4MLluim4RUuEKfhAb91xNQSc7FJDdWH1JE1Q4eg4B3Y
         Ugj/WXV2q3bkZu88URi437v6QkYmvLGHiO+85/3z9oUry6svqOz8Q+wcF3Ji62ssUIdP
         b2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773057916; x=1773662716;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZW58/Pl2Sq+I7sc4XO4eZyZGX+Qi5iOeGztEkVLEFQ8=;
        b=GkrKmLU8lBXY9pF0dn5MCI9fyjh8yr9IjpK6hm21KK26K8EpfXJTw6/b7gzAd9zKNO
         y91IqvRT9Ph/Ngu4F/yuVm0J2mGJ+Bw1qm6/eqM6XnoA9/lB9VVNnBsnWaUrstyXybt7
         7GKsJf1srHUxPS2Ta+xsSoaULbSqdd5lJxvUcrWT8Jgn4JwAB5tt/pTlfq8/fJOdkVcA
         jjH4BR7oTnUBbxIKFyr1VW9hYwaxzHfolSDjBhCGkQNR4Dnq8d2i3UoG10ztB/jHhYsJ
         vNyaVgAz1wwce9m3mIwE9l29yAeQdeiPtRUmymyJaHROo9JjFIraWxzt3cFmMkwd3pgA
         0wpA==
X-Forwarded-Encrypted: i=1; AJvYcCVM2n+xifXfuIoJEejA1M60xEVi1UzBaD+scAtl7a81kzhRecFx2afA37fClpIwxD8EPIVzadRnrN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhjdUS2u/aHx1IFRqn9iIVOEfk85n2tqkcYiIrbKNAwX26qmFY
	LR06aXeWy7D8Q904DImB69jYpBhAYu6XDD06Bj31DQbN/h0Nyi8xE3+ilg2iU161JxkStXRCSAJ
	h4jc/Kg==
X-Received: from pliy14.prod.google.com ([2002:a17:903:3d0e:b0:2ae:42de:7ed4])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:ac5:b0:2ae:4a6b:68ea
 with SMTP id d9443c01a7336-2ae82466961mr99050085ad.43.1773057915984; Mon, 09
 Mar 2026 05:05:15 -0700 (PDT)
Date: Mon, 09 Mar 2026 20:04:45 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAF23rmkC/3WMwQ7CIBAFf6XZs2sAC209+R+mB6QLJbHFQEM0D
 f8u9u5xXt7MDomipwTXZodI2Scf1gri1ICZ9eoI/VQZBBOKXViLFlezYL1S3LAdmFZKUz9pBlV 5RbL+feTuY+XZpy3Ez1HP/Lf+CWWODGVnBi67h+y1vbkQ3JPOJiwwllK+M7Ups6kAAAA=
X-Change-Id: 20260304-f-ncm-revert-490a66ae8da0
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773057914; l=4284;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=RVsYDsCZmC3FgVru9fjR8o33BuHu9fkICkZ74ZUJ1hk=; b=Z0a4qOLpsoE6BP4lXxCy7rvOj/FCf0KmRb7qOJ0mBUnenfQkLs2VvcV9fFcQpozWG3TiQAEvK
 d/aDEm7/eRICnEzeW5xeXNHxhduk3ExMDRrGpb1WRoS+npscf9nfcg0
X-Mailer: b4 0.14.3
Message-ID: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
Subject: [PATCH v2 0/7] usb: gadget: Fix net_device lifecycle with device_move
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Heidelberg <david@ixit.cz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Jon Hunter <jonathanh@nvidia.com>, LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@kernel.org
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 65EB52387A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34296-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.932];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ixit.cz:email]
X-Rspamd-Action: no action

PROBLEMS
--------
The net_device in f_ncm is allocated at function instance creation
and registered at bind time with the gadget device as its sysfs parent.
When the gadget unbinds, the parent device is destroyed but the
net_device survives, leaving dangling sysfs symlinks and a NULL pointer
dereference when userspace accesses the orphaned interface:

Problem 1: Unable to handle kernel NULL pointer dereference
 Call trace:
   __pi_strlen+0x14/0x150
   rtnl_fill_ifinfo+0x6b4/0x708
   rtmsg_ifinfo_build_skb+0xd8/0x13c
   ...
   netlink_sendmsg+0x2e0/0x3d4

Problem 2: Dangling sysfs symlinks
 console:/ # ls -l /sys/class/net/ncm0
 lrwxrwxrwx ... /sys/class/net/ncm0 ->
 /sys/devices/platform/.../gadget.0/net/ncm0
 console:/ # ls -l /sys/devices/platform/.../gadget.0/net/ncm0
 ls: .../gadget.0/net/ncm0: No such file or directory

BACKGROUND & THE REVERTS
------------------------
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

THE NEW SOLUTION
----------------
Use device_move() to reparent the net_device between the gadget device
tree and /sys/devices/virtual across bind/unbind cycles. On the last
unbind, device_move(NULL) moves the net_device to the virtual device
tree before the gadget device is destroyed. On rebind, device_move()
reparents it back under the new gadget, restoring proper sysfs topology
and power management ordering. 

The 1:1 mapping between function instance and net_device is maintained,
and configfs always reports the resolved interface name.

A bind_count tracks how many configurations reference the function
instance, ensuring device_move fires only on the first bind.
__free(detach_gadget) ensures the net_device is moved back to virtual
if bind fails after a successful device_move, preventing dangling
sysfs on partial bind failure.

Reported-by: David Heidelberg <david@ixit.cz>
Link: https://lore.kernel.org/linux-usb/70b558ea-a12e-4170-9b8e-c951131249af@ixit.cz/
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
Changes in v2:
- Introduce a new solution
- Link to v1: https://lore.kernel.org/r/20260304-f-ncm-revert-v1-0-57c9157b58af@google.com

---
Kuen-Han Tsai (7):
      Revert "usb: gadget: f_ncm: Fix atomic context locking issue"
      Revert "usb: legacy: ncm: Fix NPE in gncm_bind"
      Revert "usb: gadget: f_ncm: align net_device lifecycle with bind/unbind"
      Revert "usb: gadget: u_ether: Add auto-cleanup helper for freeing net_device"
      Revert "usb: gadget: u_ether: use <linux/hex.h> header file"
      Revert "usb: gadget: u_ether: add gether_opts for config caching"
      usb: gadget: f_ncm: Fix net_device lifecycle with device_move

 drivers/usb/gadget/function/f_ncm.c            | 129 +++++++++++--------
 drivers/usb/gadget/function/u_ether.c          |  67 ++++------
 drivers/usb/gadget/function/u_ether.h          |  56 ++++-----
 drivers/usb/gadget/function/u_ether_configfs.h | 168 -------------------------
 drivers/usb/gadget/function/u_ncm.h            |   5 +-
 drivers/usb/gadget/legacy/ncm.c                |  13 +-
 6 files changed, 127 insertions(+), 311 deletions(-)
---
base-commit: 1be3b77de4eb89af8ae2fd6610546be778e25589
change-id: 20260304-f-ncm-revert-490a66ae8da0

Best regards,
-- 
Kuen-Han Tsai <khtsai@google.com>


