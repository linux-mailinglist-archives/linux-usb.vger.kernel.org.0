Return-Path: <linux-usb+bounces-32054-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A12F3D02377
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 11:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A53D30041AD
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 10:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF3933C53C;
	Thu,  8 Jan 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HC3mo+ep"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f228.google.com (mail-yw1-f228.google.com [209.85.128.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA95D409FA0
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 09:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863501; cv=none; b=Q/dmzP4N4WFMWEA80CL7d4BHF6SNmYT43iMa7zn/Db/ST2KtRa/2eZOn1QuLPCvIgBfMNID6XBmmbKQXMcGXynbK6Z0HVi0huQ+8OKt40wySAsMOU36IKvvpEYRYSpD+WjIe5hB4SFRncrS1m5bvct6SDM8iqafJ1NcomK6gfNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863501; c=relaxed/simple;
	bh=HQp3oovGDQbXP4Dt+ZR8z/jnBwW7VqtTMHkFskxW8Gw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZYhBqmnGSZoW2RL9hgyCmb20QR85+cGBDmVCk/WQ4aQmXMwKYsJrCM3Uc/VFrFjtXF3se2f8duFisqghqvzXDufAJCMamGTzIObSaksBNkZfJRxtjAhSopHwTIUZKUDQ6hxSPzV0f7CFEyHCOcIY/VyV0HRmQd+HpLFe0OtKNx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HC3mo+ep; arc=none smtp.client-ip=209.85.128.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-yw1-f228.google.com with SMTP id 00721157ae682-78fb7704cb4so29309477b3.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 01:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863487; x=1768468287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIZ8jaVgH+Lp5oUnSioszXqfXxvQ8K6hRpZqt1TpuX4=;
        b=DLjGGctwTWnCr6DEp8MMumCp2sebOQRwIcNbjJtIVCa7o3PX9870cXy1mWqsTWtZuQ
         1CtPRh7BnFR7syFcZXbovaXm7NrjALgANrURra2J6WtBttbYgGQYKDqiCy1X7Lx7uCMH
         dr9eEeE8p61TTA9V3tyUbOG9iX+nQeglcLNBh0c+yJaUjaecGGNvpgoh5WxSeR1VvQVD
         2A3TjAcEP4KdMf1ywjlhVvmhI4b0qz90VqoRx7OcHRorZuVr7WSzB6fThWmEwpHH/ETf
         VgZM5Ul8cen0tq8zrYl4OYf5UbACBvqwK6mFRdAdTbaqrpWXKbIuV65qxcU76Ha3DN1h
         bKUg==
X-Forwarded-Encrypted: i=1; AJvYcCVqHbVag81ix2Hbln4MVbjblvgmVVsufH9b+SpAoPZX7VREio0F+UcW21bKSzbl2S8FeZUOotiYveM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnYRkFZyQ85FA8dlcLCXrpUYQFDDKkAFaWu5eF0u9rb3SlNn8+
	JeAO9gEFOumzA+w/DoOqolOq4FCnz4g80Lqfa1lSNdb6xD6ZwPHi3kYi4X5hVGVhKoQNBlTFc1Z
	ctrfjQRvDU3j8bnEZa49O/O+Q5b3gaavJeRxQt4lDLkeQqxcE3GwPHJ1XW0ZJcy9E0cFLgomN91
	WlMyN/mFdTbRUqebUFNyMT+2l/9ik+mpGAT74M0T9TZE0vI5Fu+BNKU/MOtcrBUvIE7K3vPybSn
	iaWcOMtVeD+SMFa/2F76A==
X-Gm-Gg: AY/fxX7hhzqZffcstrM0ao1VyCl84ijsdXh0G/S6Bj/8C722BvoW6MnCuzigp+Z0TSo
	EiXseFlvHIvycqnEWeWmeA3pQmsq8Q+mERLsF1QFIKb1lpcgiP2AtoqvjQDLehF7dQqQgd8dDUJ
	dJNILc8X9vVFy2/NOOiJyjWjKQ0mA/btdnanaaqJF8+q6NYj+ppneChjTenHwTExY3tKwdoLmzk
	4avVxCDc9o/WuuTa5n/nB+2O2jCjoecfDSEQ+O6WyiEiS9Q/E8+DQo27+z3VGh7DM1jIe6gkQWM
	EpqffotSycLayiVVpXUyjws288DSQHTfSNjx9dTrz0lmJmd5Ot7/YxHTU7Ci6nQ0IK61H5iyiha
	s7mTJXapynJHfsEuHoEE8acnKLo0fLFMoe5hWpU0A6zUy3kjs/83EcU0u+ElWiKmwpZkwXv2T7K
	mIQHq+wI64W5Q1bThxeJqsClglmWQzl8amGu1Ul+hJstnldw==
X-Google-Smtp-Source: AGHT+IFIxuaJDPFNAOo+QhXaoiwOeNPDQX2tJXpvxT8865iV/GGbTewjeWZfW1UfYICucCNYfZ3rECF7qT8G
X-Received: by 2002:a05:690c:3749:b0:788:e74:b277 with SMTP id 00721157ae682-790b58479damr46826137b3.63.1767863486951;
        Thu, 08 Jan 2026 01:11:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-790aa7056e7sm5499817b3.32.2026.01.08.01.11.26
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:11:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11f3d181ef2so12148544c88.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 01:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767863486; x=1768468286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIZ8jaVgH+Lp5oUnSioszXqfXxvQ8K6hRpZqt1TpuX4=;
        b=HC3mo+ep76S+GusBvsFX1GjWxRu5Knf0MdWuyy+p+GYHkIoOEnWE5I9UsiwHAVe5rJ
         XVeHrcpO6Z4EUURtrJArJfo2oJBMiMOx2sTgwvIV4C8P6BKIzOoUMEGQUVPRlV7ttM6o
         lARoBU/dhmn0XLdlO9ZW0jOl+obc31w1csXso=
X-Forwarded-Encrypted: i=1; AJvYcCW/X6cThI0Nu5ISgIob6uD0qYDQvEd2GCZTsry3ZhCPzFbicDMwa5IGWKG7lygGmaLCORErO2OmwmE=@vger.kernel.org
X-Received: by 2002:a05:7022:2522:b0:11e:354:32cb with SMTP id a92af1059eb24-121f8b75fcemr5874333c88.49.1767863485612;
        Thu, 08 Jan 2026 01:11:25 -0800 (PST)
X-Received: by 2002:a05:7022:2522:b0:11e:354:32cb with SMTP id a92af1059eb24-121f8b75fcemr5874296c88.49.1767863484796;
        Thu, 08 Jan 2026 01:11:24 -0800 (PST)
Received: from shivania.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706c503csm10623374eec.15.2026.01.08.01.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:11:24 -0800 (PST)
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Shivani Agarwal <shivani.agarwal@broadcom.com>
Subject: [PATCH 2/2 v6.6] usb: xhci: Apply the link chain quirk on NEC isoc endpoints
Date: Thu,  8 Jan 2026 00:50:21 -0800
Message-Id: <20260108085021.671854-3-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260108085021.671854-1-shivani.agarwal@broadcom.com>
References: <20260108085021.671854-1-shivani.agarwal@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Michal Pecio <michal.pecio@gmail.com>

commit bb0ba4cb1065e87f9cc75db1fa454e56d0894d01 upstream.

Two clearly different specimens of NEC uPD720200 (one with start/stop
bug, one without) were seen to cause IOMMU faults after some Missed
Service Errors. Faulting address is immediately after a transfer ring
segment and patched dynamic debug messages revealed that the MSE was
received when waiting for a TD near the end of that segment:

[ 1.041954] xhci_hcd: Miss service interval error for slot 1 ep 2 expected TD DMA ffa08fe0
[ 1.042120] xhci_hcd: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0005 address=0xffa09000 flags=0x0000]
[ 1.042146] xhci_hcd: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0005 address=0xffa09040 flags=0x0000]

It gets even funnier if the next page is a ring segment accessible to
the HC. Below, it reports MSE in segment at ff1e8000, plows through a
zero-filled page at ff1e9000 and starts reporting events for TRBs in
page at ff1ea000 every microframe, instead of jumping to seg ff1e6000.

[ 7.041671] xhci_hcd: Miss service interval error for slot 1 ep 2 expected TD DMA ff1e8fe0
[ 7.041999] xhci_hcd: Miss service interval error for slot 1 ep 2 expected TD DMA ff1e8fe0
[ 7.042011] xhci_hcd: WARN: buffer overrun event for slot 1 ep 2 on endpoint
[ 7.042028] xhci_hcd: All TDs skipped for slot 1 ep 2. Clear skip flag.
[ 7.042134] xhci_hcd: WARN: buffer overrun event for slot 1 ep 2 on endpoint
[ 7.042138] xhci_hcd: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 31
[ 7.042144] xhci_hcd: Looking for event-dma 00000000ff1ea040 trb-start 00000000ff1e6820 trb-end 00000000ff1e6820
[ 7.042259] xhci_hcd: WARN: buffer overrun event for slot 1 ep 2 on endpoint
[ 7.042262] xhci_hcd: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 31
[ 7.042266] xhci_hcd: Looking for event-dma 00000000ff1ea050 trb-start 00000000ff1e6820 trb-end 00000000ff1e6820

At some point completion events change from Isoch Buffer Overrun to
Short Packet and the HC finally finds cycle bit mismatch in ff1ec000.

[ 7.098130] xhci_hcd: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[ 7.098132] xhci_hcd: Looking for event-dma 00000000ff1ecc50 trb-start 00000000ff1e6820 trb-end 00000000ff1e6820
[ 7.098254] xhci_hcd: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[ 7.098256] xhci_hcd: Looking for event-dma 00000000ff1ecc60 trb-start 00000000ff1e6820 trb-end 00000000ff1e6820
[ 7.098379] xhci_hcd: Overrun event on slot 1 ep 2

It's possible that data from the isochronous device were written to
random buffers of pending TDs on other endpoints (either IN or OUT),
other devices or even other HCs in the same IOMMU domain.

Lastly, an error from a different USB device on another HC. Was it
caused by the above? I don't know, but it may have been. The disk
was working without any other issues and generated PCIe traffic to
starve the NEC of upstream BW and trigger those MSEs. The two HCs
shared one x1 slot by means of a commercial "PCIe splitter" board.

[ 7.162604] usb 10-2: reset SuperSpeed USB device number 3 using xhci_hcd
[ 7.178990] sd 9:0:0:0: [sdb] tag#0 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=DRIVER_OK cmd_age=0s
[ 7.179001] sd 9:0:0:0: [sdb] tag#0 CDB: opcode=0x28 28 00 04 02 ae 00 00 02 00 00
[ 7.179004] I/O error, dev sdb, sector 67284480 op 0x0:(READ) flags 0x80700 phys_seg 5 prio class 0

Fortunately, it appears that this ridiculous bug is avoided by setting
the chain bit of Link TRBs on isochronous rings. Other ancient HCs are
known which also expect the bit to be set and they ignore Link TRBs if
it's not. Reportedly, 0.95 spec guaranteed that the bit is set.

The bandwidth-starved NEC HC running a 32KB/uframe UVC endpoint reports
tens of MSEs per second and runs into the bug within seconds. Chaining
Link TRBs allows the same workload to run for many minutes, many times.

No negative side effects seen in UVC recording and UAC playback with a
few devices at full speed, high speed and SuperSpeed.

The problem doesn't reproduce on the newer Renesas uPD720201/uPD720202
and on old Etron EJ168 and VIA VL805 (but the VL805 has other bug).

[shorten line length of log snippets in commit messge -Mathias]

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Link: https://lore.kernel.org/r/20250306144954.3507700-14-mathias.nyman@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[Shivani: Modified to apply on 6.6.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
---
 drivers/usb/host/xhci.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index cbd8ef1c8db6..849a83e4013c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1785,11 +1785,20 @@ static inline void xhci_write_64(struct xhci_hcd *xhci,
 }
 
 
-/* Link TRB chain should always be set on 0.95 hosts, and AMD 0.96 ISOC rings */
+/*
+ * Reportedly, some chapters of v0.95 spec said that Link TRB always has its chain bit set.
+ * Other chapters and later specs say that it should only be set if the link is inside a TD
+ * which continues from the end of one segment to the next segment.
+ *
+ * Some 0.95 hardware was found to misbehave if any link TRB doesn't have the chain bit set.
+ *
+ * 0.96 hardware from AMD and NEC was found to ignore unchained isochronous link TRBs when
+ * "resynchronizing the pipe" after a Missed Service Error.
+ */
 static inline bool xhci_link_chain_quirk(struct xhci_hcd *xhci, enum xhci_ring_type type)
 {
 	return (xhci->quirks & XHCI_LINK_TRB_QUIRK) ||
-	       (type == TYPE_ISOC && (xhci->quirks & XHCI_AMD_0x96_HOST));
+	       (type == TYPE_ISOC && (xhci->quirks & (XHCI_AMD_0x96_HOST | XHCI_NEC_HOST)));
 }
 
 /* xHCI debugging */
-- 
2.43.7


