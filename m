Return-Path: <linux-usb+bounces-38081-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNVwMN6YFmrmngcAu9opvQ
	(envelope-from <linux-usb+bounces-38081-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 09:10:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4A85E03EA
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 09:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AEDC302517F
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 07:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C963B83F0;
	Wed, 27 May 2026 07:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="fBzkwYhM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AAD3B8930
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779865657; cv=none; b=pkFeEsbWeElnlI2ctiU+DDKm+YCtDIoRuR/pEaSuJO/XspeERMYaFKTnPaR1boSKsasGJ3kW3OlIRVSk1uqF9I1yW6GUqrmsRWmH05dINdTpED45hMF3Bo68q8DOnv2kanC9M0ZAb362lZug94ZhhQsbBws85NpvmTJqjEu321s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779865657; c=relaxed/simple;
	bh=m5goscpeg84832Fvcal53LdG1ESZgYQo6V2f44ZYvVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=UwRF7CC4kEJnAa+1lvEWPz/hiThrSphhvePwnVzBq+/DHo2zNAMz+S+YMSwDGQoCE7eQBSEYmMu/h6injJYb96rWPdgjzWqa+HNb7PsDKmmNRrFNbqAutBdNxeKv9ZvfT92k9FeIZ1k0z2uJa7ji5CEHEXetrhLGWPV+x4OGj9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=fBzkwYhM; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D30533F7D2
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1779865652;
	bh=8IZOxdphirHc/3FMKXQVS0k58ciDFxJSnjwDXGDUxBM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
	b=fBzkwYhMyT1aTclVNq5TcdF3le+4eAU6gX+A5GSClE69uOR2Rq+zFPR/1otLuGmwJ
	 xJKDYIaxjJ6lkJrnJMrwWFmWFu4uqmb99nEjcg6Thf7Odev8iLv7I/J4XqzkphrDwx
	 sDc6uDeN7PGzUvnCB34vgWpBXFeVBsvWmb3GDmBtIcIT3676ugfGb8XWr/3U4h3yyI
	 uC+LM85WjCOd5/ZvJo83+XP/w7ybHAxjm60cZ140/yb5JUtAft5a/khHMNi+FvpTV5
	 c+yNIguXmIxx0o/ExK/zPU2MBYOFLpYcS/Qx1HdXitF4RwGCytImD0sHvF6nZEj3IP
	 Jpkoy20F56EjhQOtIwgJRKLdv7iKFOsNWgEvMVJSVp/jjDUC225M7wSy7Ai1h/3sVP
	 r91+sUD5VbPZWZ4Gjp8mJHM3HNvn/GXgBPwTGYXR9VxSXufIFSCgElSH+AaUAaxWU2
	 8Jik2vn0NKXDTaieCDF691dHRMg48+vaa5d/pBukvDi2Br+h5ImHLEk7l8045kFbUS
	 gszXhdSjzEsyRxJYiPepJOO41NXg/BPw0swLCe+QVosoItdJXZKCCask2u8YG1gEK9
	 y3KM/jIZQ8ddjwVswacMa/BkXh4hFQKwmmK2t3knLqI4MwlawNWC6kpKL7xDwuT8Ca
	 L61J94Ts5OADNMVU43YAZm8M=
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd9b0e68fdso29845515ad.3
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 00:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779865651; x=1780470451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IZOxdphirHc/3FMKXQVS0k58ciDFxJSnjwDXGDUxBM=;
        b=j/zy8OqJSWCNnCoLwCYQzUWfaluPzkF3QXMwDFtYKlOxo7sK++3/LuTAdlxFvmVT4W
         X8oRLzhX3WOkFEYdBmt0YQOQm4QdBQ5XYPkYMdPIv/fWcy2+bB6BcXoO9sRxGiLN/etG
         tTIT5hIIO1FwuLc8Xmjhzkm0gdWLeMozA94QauC8w9XxHYxPehhtbw5ZX5JGVoAEfy9y
         6iTO8ugkd7vvyGwXxcoxBTALKpv08zXb7iFmJsx2J56ySm0zTY0gsiBvdB1F98tYVZUT
         bXTMY1GTqy4kZ10d7+b6RH7cZPrHBVYkR1Qsuy9766WMWLDmpnRFwPvYL6kOweqMX2WP
         r0Mw==
X-Forwarded-Encrypted: i=1; AFNElJ/aeYG8rBpHtu5sy++aamb+YvUVRmoPYXZijIQVSqUnhFnxBDhGMKhm+4w/olacuRl8YdYAEqy3U8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzZj12PYcP4mKVInpDeGcncNjBi28EEAfiJ3caHjhcBrU5gqDF
	fj0AhvamTX9K5EfyL65M5K6vZf30QeNg3JIpGQ1Cm5vdKcRjTdhY5E5gMV9BI/PqnZNWnymumQu
	JqmiPZnU3BX+k9RxgYL5h+vu5WNlDVKrOh/iHMsJ6XpWYBfn1ciQI45zUzySLNNrJNrMrU3n77w
	xK+cvsMHDnXg==
X-Gm-Gg: Acq92OHrYOOihW0G+bnbEu9VqiUArdvOa0fuCD434Ux8u03A/fJgqpyW8gwnxSckkuV
	FrP8cTXKngVMudvHDaosD8nPeXqRJcnFJH8UtG0wolKPbqqbf+NhrHD0dbHNJU78I2v4PFaq27Q
	GWUhzErgnbCEcTYCQjUVONygjAtrF0wjzMJA49OEtR9CwIFTvyvaq2WU+WhXA3I5hLMB13jr8/q
	5TQC6vAWPT7ZmRM4eHu+oQXtPvVIcCwzPeNs52wqIRaFJTQlCsENZVtMGCLB1+8nLlU1M7bX369
	zzql8Sx5qImoFSoLJq/XzvKb+/FTfm+07jmCBCWD5W93ZGTzF3Hc6q0z23zOOBZ1ErClIswn53F
	0dGem/aNuAjhP0Aw0zYgnXpJh39P1LOgkQz1wNz3dV26RUBpe8uIzZLE3VAS+oftkCkbZt7Jj25
	5GW18XIJ/RB8k2QiU/ga6eTJf0HeMUT63gVGdUYsHfjOixL/9RNkVw3Vg1yavPT7aeB+aqHoTTx
	XUisd3N
X-Received: by 2002:a17:902:ccce:b0:2b0:ac1e:972e with SMTP id d9443c01a7336-2beb06e73a8mr125595545ad.8.1779865651298;
        Wed, 27 May 2026 00:07:31 -0700 (PDT)
X-Received: by 2002:a17:902:ccce:b0:2b0:ac1e:972e with SMTP id d9443c01a7336-2beb06e73a8mr125595485ad.8.1779865650890;
        Wed, 27 May 2026 00:07:30 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-658f-4fd7-7372-71f3-d446.dynamic-ip6.hinet.net. [2001:b011:2008:658f:4fd7:7372:71f3:d446])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm184029595ad.6.2026.05.27.00.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 00:07:30 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: mika.westerberg@linux.intel.com
Cc: andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] thunderbolt: Defer DP tunnel teardown until display driver is ready
Date: Wed, 27 May 2026 15:06:29 +0800
Message-Id: <20260527070630.175538-1-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38081-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[an.wu@canonical.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,canonical.com:mid,canonical.com:dkim]
X-Rspamd-Queue-Id: 3B4A85E03EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mika,

We encountered an issue where an external monitor connected through a
Thunderbolt dock (Dell SD25TB5) fails to display when the laptop boots
with the dock already connected and the lid closed.

Problem
=======

When the Thunderbolt driver loads early during boot (from initramfs at
~T+1s), it discovers the BIOS-established DP tunnel and begins polling
the DPRX_DONE bit to verify the tunnel is active. This polling has a
12-second timeout (TB_DPRX_TIMEOUT).

However, DPRX_DONE is only set after the display driver (e.g. i915)
loads and reads the monitor's DPCD via the AUX channel. On systems with
Full Disk Encryption (LUKS), the GPU driver does not load until the
passphrase is entered — often 60-90 seconds after boot. By that time,
the DPRX timeout has long expired and the DP tunnel is torn down via
tb_dp_resource_unavailable(), which permanently removes the DP IN port
from the dp_resources list. Recovery requires a physical re-plug.

This is a driver load ordering issue: the Thunderbolt driver assumes the
display driver is available within 12 seconds, but with FDE that
assumption does not hold.

Solution
========

This patch adds a PCI bus notifier that watches for display driver bind
events (PCI base class 0x03). When the DPRX timeout expires:

  - If a display driver is already bound: tear down as before (the
    tunnel is genuinely broken).
  - If no display driver has bound yet: call
    tb_deactivate_and_free_tunnel() to free the tunnel resources, but
    keep the DP IN port in the dp_resources list so it remains available
    for retry.

When a display driver eventually binds, the PCI bus notifier fires and
schedules work to call tb_tunnel_dp(), which re-establishes the DP
tunnel. Since BUS_NOTIFY_BOUND_DRIVER fires after the driver's probe()
has succeeded, the display engine is already initialized and DPRX_DONE
is set — the retry succeeds immediately.

Considerations
==============

We considered several alternative approaches:

  1. Increasing dprx_timeout: problematic with FDE since the passphrase
     wait time is unbounded. Any fixed timeout could be insufficient.

  2. Loading the GPU driver in initramfs: works but impractical as a
     general solution — it would require including every possible GPU
     driver in every initramfs image.

  3. Cross-driver notification from each GPU driver: requires modifying
     every GPU driver, which is not scalable.

The PCI bus notifier approach is self-contained within the Thunderbolt
driver, covers all PCI display devices (VGA, XGA, 3D controller, and
other display controllers under class 0x03xx), and handles the
unbounded delay case gracefully.

Testing
=======

Tested on Dell Pro Max 14 (MC14250) with Intel Meteor Lake GPU and Dell
SD25TB5 Thunderbolt 5 Dock, Ubuntu kernel 6.17.0-1023-oem, Secure Boot
enabled, LUKS Full Disk Encryption.

  - Without patch: DP tunnel torn down at T+14s, external display
    remains blank after i915 loads at T+84s. Only physical re-plug
    recovers.

  - With patch (i915 artificially delayed by 30s to simulate FDE):
    "not active, deferring until display driver loads" at T+14s,
    i915 loads at T+188s, PCI notifier triggers retry, DP tunnel
    re-established, external display lights up successfully.

  - With patch (normal boot, no delay): no behavioral change, display
    works as expected.

Changes in v2:
  - Fixed patch numbering (now [PATCH v2 1/1])

ChunAn Wu (1):
  thunderbolt: Defer DP tunnel teardown until display driver is ready

 drivers/thunderbolt/tb.c | 96 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 88 insertions(+), 8 deletions(-)

-- 
2.34.1


