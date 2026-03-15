Return-Path: <linux-usb+bounces-34823-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O6/NTmetmntEQEAu9opvQ
	(envelope-from <linux-usb+bounces-34823-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 12:55:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4140D290922
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 12:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B050302496C
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 11:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D99B33B95E;
	Sun, 15 Mar 2026 11:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5ti6TGw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2822A33A6F8
	for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773575711; cv=none; b=swSpiXA+NgX0uCuXOxyGXQm68GykXr1DfVBWouyLz8EHk5a9yluJuIPZhbvp5+XRaIwZaOFNm7G+rYaXqTtrzeH/88Kw2aJa86ukWIUMkhjdHkyHQtfLQopgfgFz+XC5XqAhtZr7K1pnY8zBOFti6xImvXzI3+bHtxT/DL1+298=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773575711; c=relaxed/simple;
	bh=bcZKlzzXwwY0EJtmDoUOqgBEwQ5NCQTilsLXeIa/wss=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=e50JtZ8M7BZHqyWnPxidqt8gdFC4EdD9jnQEcIGWK5dGGUUVv6AmkqpNHraVof1uSGucmVDf0oRtKpqEK1IU+S3URubpst/wIwQ/p+hCR0OGl1y4WRhYBEP2ApMix5P9wtF+ZSuNHd4x9CejJVmb00mr97yp505FaAfk1Zf+Wyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5ti6TGw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so43250105e9.2
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773575708; x=1774180508; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDKnJT0wYCQGOysz22h2bC3jeqtbf0HHcGTBrmEn6hA=;
        b=T5ti6TGwXmE0br6mUCi0AQzzW4rR97FKomaAbVRY7LXeHGN7/FJd/qz6QIc9WSV43t
         W+uLyzV4OQTUDPFqw0miRAZPMjEaUBHpfrJLKew7Xq7bCJbxG5L687SC/gg9+nVWW/Tc
         5sCCP0g1NBZ9DPXL9XVtlmnRcvEpQB+ym2KbEQ1quycOxztnZrJHXNhNnFuAq+uNpWed
         KPnuKq5B1kzzcdwcDgm62xEWdFEt8HzmbLCVHCjB7lwiN5yDnijyhLon+bj6aoyH6xfJ
         oZun+wWwmN2NJzg7qgfV1FrVbYwG4IbjldzjMNpgWpe+nxWlNaR2ukrGjxz6cPKUBHOK
         481Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773575708; x=1774180508;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vDKnJT0wYCQGOysz22h2bC3jeqtbf0HHcGTBrmEn6hA=;
        b=avN78lszoDuWjrda/MVDao5TiTbPlBcEg+gkBjixc3lzKGitoTPVxTCyPhU5qg5fss
         AqXQ2pyTYmLf1PhT+y9KTASUHXfB6hZ6lve4MG0VjjMNIExdSrBhfdb/v4NCnryaldTC
         MOK/JD6iIxfbM2bnNCJEmBYw0IAO+04KJZJZzCm6yoe5CGPMs6SJVHPVbD3CHCoi/sBC
         lHECa7cnkuYH+wmFjw7x6F6mZyjJGX05YbtPLCQteElLsirJemVZ43NUuo+Xg43Az+sZ
         3Db32POCof+YEQ4A/QStpf3H1WaqlN5TBicGLUKSOGXO/E74NC9E3XP7gf2Sf/ik3Ajh
         6dIQ==
X-Gm-Message-State: AOJu0YxEWWEioBxuYk//WZOyXOA0dzOL7llAz0A6QqNmyFUicWJcp4HW
	1+qd1bOfu2qd5iZj/84nC/bU4sN7K7rJ3NE7XfH8+PL1oDL+v7onTYAF
X-Gm-Gg: ATEYQzzxSOAL8rYozhwksULVlWp/537hnn+jxKQ1q7apnKPYvfMwDmCmHpI0607zXml
	FhD3+l6ISQGHzXAIqglLjCseikIQp/qkvkkzD3KFerXwSkLOUqEuBJX1W97OANv+VDRXmMR7eDG
	72uKTZ8o0pUxtpinpWKuWL807Y+QkwGZUm+SAD9Uc+fUS2D3MDUFkj9FyqhgYdwx91OO+LxlJfo
	/meFB88mjtpTaPHXcZW/fK5BoW6b0WMNXXoZHdq+ea8CBrmCHPS8MteA2y4NnJh4YqYbnF51rjN
	HiBxzQoat3xwWD/M87Ez2MdBUEl3UEGTZP/hstVLZz596MQ0pZ/hfVTgRnDVHoN08OpMB9VLp7z
	2It+1waegRGduD360pIFrfa5SiwK7AaE9eqBAhsMKSeuDorOi4PvLVsbU0NcQFQXhbwzYqozs7S
	QhCqFHCvaQ3Wa7wKScGEfZXUynVqR94HlMZeaPPnJVIawxpmhN506Zk51DToHLl9jErsC6MXzqf
	L1EuG6DvCW8/lwqWtI5qhjgsEsfGIJxuvhhgXwCbcDKSUEBa+Jof29v
X-Received: by 2002:a05:600c:1388:b0:485:3a03:cee1 with SMTP id 5b1f17b1804b1-48556711f7fmr153392075e9.33.1773575708365;
        Sun, 15 Mar 2026 04:55:08 -0700 (PDT)
Received: from smtpclient.apple (dynamic-2a00-1028-83a2-5386-5c13-9ccd-a54b-eed2.ipv6.o2.cz. [2a00:1028:83a2:5386:5c13:9ccd:a54b:eed2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b6756e4sm401505845e9.15.2026.03.15.04.55.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Mar 2026 04:55:08 -0700 (PDT)
From: =?utf-8?Q?Michal_Babi=C4=8Dka?= <michal.babka@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Subject: [BUG] Apple Mac mini 2018 + Thunderbolt 3 eGPU: PCI bridge window /
 BAR allocation failure prevents NVIDIA and AMD GPUs from initializing 
Message-Id: <FCEB17D3-3DC5-49C8-8C56-8051C875E2F9@gmail.com>
Date: Sun, 15 Mar 2026 12:54:56 +0100
Cc: linux-usb@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
To: linux-pci@vger.kernel.org
X-Mailer: Apple Mail (2.3864.400.21)
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_SPACES(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34823-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalbabka@gmail.com,linux-usb@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4140D290922
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Subject: Apple Mac mini 2018 + Thunderbolt 3 eGPU: PCI bridge window / =
BAR allocation failure prevents NVIDIA and AMD GPUs from initializing

Hardware / platform:
- Host: Apple Mac mini 2018
- Connection: Thunderbolt 3
- eGPU enclosure: Razer Core X Chroma
- Tested GPUs:
  - NVIDIA Quadro P400
  - NVIDIA Quadro P4000
  - AMD Radeon Vega 64

Linux distributions / kernels tested:
- Ubuntu-based systems
- Zorin OS 18 Pro
- Multiple kernels tested, including 6.12.x and 6.17.x

Problem summary:
On Apple Mac mini 2018, an external GPU connected through Thunderbolt 3 =
in a Razer Core X Chroma enclosure is detected and enumerates on the PCI =
bus, but GPU initialization fails because PCI bridge windows / BAR =
resources are not assigned correctly.

This is reproducible across different Linux installations and with GPUs =
from different vendors, which strongly suggests a =
platform/topology-level PCIe resource allocation problem rather than a =
bug in one specific GPU driver.

Observed behavior:
- The Thunderbolt enclosure is detected correctly.
- boltctl shows the enclosure as connected / authorized.
- The GPU appears in lspci.
- The kernel loads the vendor driver module.
- GPU initialization then fails.

For NVIDIA, nvidia-smi reports:
  "NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA =
driver."

Relevant NVIDIA kernel messages include:
- "BAR 1 [mem size 0x10000000 64bit pref]: can't assign; no space"
- "BAR 3 [mem size 0x02000000 64bit pref]: can't assign; no space"
- "This PCI I/O region assigned to your NVIDIA device is invalid"
- "BAR1 is 0M @ 0x0"
- "RmInitAdapter failed"
- in some attempts also:
  "fallen off the bus and is not responding to commands"

With NVIDIA Quadro P4000, the same general failure pattern was observed:
- the GPU is detected on the PCI bus,
- the NVIDIA kernel module loads,
- initialization fails,
- and the logs again point to invalid / missing BAR assignments and =
resource allocation problems behind the Thunderbolt PCIe bridge =
hierarchy.

For nouveau, the failure is visible as BAR/resource allocation failure =
as well, for example:
- "bar: one-time init failed, -12"
- "init failed with -12"
- "Device allocation failed: -12"

With AMD Radeon Vega 64 installed in the same enclosure on the same =
host, the same fundamental problem occurs:
- the enclosure is detected,
- the GPU enumerates,
- initialization fails,
- and the overall behavior indicates the same lower-level PCI resource / =
bridge window allocation issue.

This strongly suggests the issue is not NVIDIA-specific.

Thunderbolt state:
boltctl reports the Razer Core X Chroma enclosure as =
connected/authorized correctly, for example:
- type: peripheral
- generation: Thunderbolt 3
- status: authorized
- rx speed: 40 Gb/s
- tx speed: 40 Gb/s

Important conclusion:
Thunderbolt authorization itself appears to work.
PCI enumeration also works.
The failure happens later, at PCI resource assignment / bridge window =
sizing / BAR allocation time.

Key dmesg patterns observed:
- multiple "can't assign; no space" messages for PCI bridges and BARs
- BAR1 / BAR3 of the GPU not assigned
- bridge windows under the Thunderbolt hierarchy not large enough
- reassignment attempts that still leave required windows unassigned or =
invalid
- vendor driver subsequently failing device initialization

Examples of affected topology in logs:
- 0000:00:01.1
- 0000:05:00.0
- 0000:06:01.0
- 0000:0b:00.0
- in other boots, the same problem may appear under a different BDF =
address after Thunderbolt re-enumeration

Representative log excerpts:
- pci 0000:0b:00.0: BAR 1 [mem size 0x10000000 64bit pref]: can't =
assign; no space
- pci 0000:0b:00.0: BAR 3 [mem size 0x02000000 64bit pref]: can't =
assign; no space
- pci 0000:06:01.0: bridge window [mem size 0x10000000]: can't assign; =
no space
- pci 0000:05:00.0: bridge window [mem size 0x20200000]: can't assign; =
no space
- NVRM: BAR1 is 0M @ 0x0
- NVRM: RmInitAdapter failed
- NVRM: The NVIDIA GPU ... has fallen off the bus and is not responding =
to commands
- nouveau ... Device allocation failed: -12

Kernel command line options already tested:
The following boot parameters were tested in various combinations:
- pci=3Drealloc=3Don
- pci=3Dhpbussize=3D0x33,hpmemsize=3D256M,hpiosize=3D2M
- pcie_aspm=3Doff
- pci=3Dnommconf
- pci=3Dnoaer

These mitigations did not resolve the issue.

Why this looks platform/topology specific:
- The same Thunderbolt eGPU enclosure is recognized correctly.
- The same failure pattern appears with NVIDIA Quadro P400, NVIDIA =
Quadro P4000, and AMD Radeon Vega 64.
- The common denominator is Apple Mac mini 2018 + Thunderbolt PCIe =
topology under Linux.
- The failure mode is centered around PCI bridge window sizing / BAR =
placement, not around one vendor-specific driver alone.

Expected behavior:
The Thunderbolt eGPU should receive valid PCI bridge windows and valid =
BAR assignments so that the GPU driver can initialize the device =
successfully.

Actual behavior:
The GPU is visible on the bus, but bridge windows and BAR resources are =
not fully assigned, which leaves the device unusable and prevents the =
driver from completing initialization.

Request:
Please investigate PCI resource allocation / bridge window sizing for =
Thunderbolt eGPU topologies on Apple Mac mini 2018 under Linux, =
especially where large GPU BARs must be assigned behind multiple =
Thunderbolt / PCIe bridges.

Cross-vendor reproducibility on the same enclosure and same host =
strongly suggests that the root cause is in PCIe/Thunderbolt resource =
allocation on this platform rather than in a specific NVIDIA or AMD =
driver.=

