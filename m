Return-Path: <linux-usb+bounces-32050-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B79D020C8
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 11:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DB7330C62DC
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 09:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB32409FAC;
	Thu,  8 Jan 2026 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LTc4sRBn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE62407585
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 09:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863451; cv=none; b=cH/rf9Mg6sOig7NeCyux7vHmAQJILtbRJPsg0ZYBaxd/CLmhBbJK6H1eIcnF6aCNz2+ympAlRwBOP6FM/dsGU+fFEWiX+JtOFlBlcdJUwZ0xGSgg1PFbgrchuAn/QpLzuSmk9sB7MVIT2gAfiWRk9NxVsSbMUaRnbu1a5tbJbwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863451; c=relaxed/simple;
	bh=oMOgFSwY0RAP2ZDnrjutIY7BiKOu+6XtN7G/uaCAPag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=usn8h/TzX1R3TAJscUj9yVx6gyvVsguCBFQUqv77GIa+Ek0EtMyLutbiF3o+F1Ki8YFhSVWe1RIAf0DzvQys5NPp1FeWGFlS8HB9HZC5qlL0YEyQS3XAOt8SNqdf6UjMwUqTFSUbpApg1KP2HJXuzZe2MHXCkcW4FlVOmGnsUak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LTc4sRBn; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2a0d0788adaso22038005ad.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 01:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863434; x=1768468234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9fHKbor+4yAlWDOSfn8eCqOO4MCtVL+l7N/J/f2X+c=;
        b=F3f9l9Tkp213ExRRvXUFhdh8uICdq+olsiG1rJAAG8JYfmiMMZwfK6ezOlRlFzTvxE
         TNkLVOtGCouN+B1eYttqRv2ZK3wHoOmYlfwvSl0Zy0oqheW8w5U6mAxABmzInb/8jZzn
         ZRY1Z/zcJfAGHoEZ4nI/fasQEYCWTfATGjUT0TdA1zq50c2QqiOMm6N8EJUFOQScBiIl
         NZBishGfggPtFTMPCFsV9+CM4V3y8JI3A1HlQDE4XhUR5OkQSpV55b6uSXHEuDq+K58W
         +FmRLWhM9Lhshzr8tcD2W2HowggOy6/0ba0gKMNsf7iNtD/P7GDXAqOWz+OUEf4RnCZG
         JEbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyuBq2JHbIwYbNdT4xWY3ofZj6kZ8JMnvotX91eArlqv84ZHxNIlkFAI/TmSHz6wI8xqfwf7BkdX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWEovlhcv+/vvX9hiPGp5rKrq2FVschl7Z29qRTUS/664L7gQW
	1zWmQxwhVvDq4D1zn28pblISzQK05HSh15J6OK5hQ07OJOqQ4UVnD4NqwPqgZaKKnsk4PCWUVY1
	zqcLYyJq/fBjbbZcR0Ai1p3RVeK8Q8BEmAKkfUuoZWoQUKeL8Gx9LTdYYjWE2FDOl/S8RJpiwdn
	mm82T2zKEozSUDSsRay/DpbfybN42KJqLepQx9LtjIkGjOjxuV8Mv666XDI7/BVdVS7Zszu81DA
	D/tUV27PpTr0F1eCLULpQ==
X-Gm-Gg: AY/fxX6iIM1/5d+0NqvgG9uolbtj1aL5lr7NGQ9atAtKX1s34UitcEwLbvaKhSoTu+w
	XFX75bs+y2pvpfLDyqpG9xMD9693itMOTOwpJpJ2a2leRB+xwkGOFw1xvyTf4ZM2J604mHK5Drs
	GGYQF4AiJnZA1e/jWxP3bO1EvgyqfZ0C/FupwadTsOOyYIhmVPY2uygZjh5AcAmiDu15K5CyT+O
	4RfegsW/9aFui6RV+5EId93bGrxlDQ2OFo8RiUi+nyqZWHuLsdMj49lMd2Q6mzDZGP/GnB77uCM
	x/Mv4zyycfRrehXsbBPkTmu8F8d/gyoih1M4s7NMjRaIXQn0X+MBqH60tePYF+/n4md0p+hKP81
	+hf9U0PFpixN2HrDMWF8pwfrsqx4TSIPselu/U2fH4CFv0ekk62QKVoLCn2h+Av1IAT7sNVual6
	J9NcCIyZMZKf3ukja2QmFVhDM97ovCtslgAHXUM2MdqamhDw==
X-Google-Smtp-Source: AGHT+IFV2gxZTe1+CkP7g6Csts0VQlC0k+h/OviZ7j5jzlZIEF9MLJf1m3HbmhyI+GcpmzUHNafqlBz+atf1
X-Received: by 2002:a17:903:2a8f:b0:297:d764:9874 with SMTP id d9443c01a7336-2a3ee43574amr54030425ad.21.1767863434293;
        Thu, 08 Jan 2026 01:10:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2a3e3cae717sm8600015ad.33.2026.01.08.01.10.33
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:10:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11dd10b03d9so3077634c88.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 01:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767863432; x=1768468232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9fHKbor+4yAlWDOSfn8eCqOO4MCtVL+l7N/J/f2X+c=;
        b=LTc4sRBnTtZ9yqk7JM0Y7eRYHYfbFDOglaOv9zKuY+khG7l+8dG0skbYkvqOaYKs9e
         Xp42MEH0vOWnuKZnOWNl+yIhNTify25qqOu1REg+7GpCe0nkKJA/gKWXyyLbL1ShVnfp
         Nbi6KS4Y2vy9Dsk52Sop/4E4gl0i4LyWg1eLk=
X-Forwarded-Encrypted: i=1; AJvYcCVu5B7Dd+lH3jvfeNv9EoFiKUDqk6DWP2Cu3D8fToS7LjSPamZbfH30XWl3rMMHoTlWUkzXUqrj2Wg=@vger.kernel.org
X-Received: by 2002:a05:7022:6187:b0:122:1e3:535d with SMTP id a92af1059eb24-12201e3552dmr268021c88.26.1767863432117;
        Thu, 08 Jan 2026 01:10:32 -0800 (PST)
X-Received: by 2002:a05:7022:6187:b0:122:1e3:535d with SMTP id a92af1059eb24-12201e3552dmr267999c88.26.1767863431466;
        Thu, 08 Jan 2026 01:10:31 -0800 (PST)
Received: from shivania.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24985d1sm13267619c88.16.2026.01.08.01.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:10:30 -0800 (PST)
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
Subject: [PATCH 2/2 v5.10-v6.1] usb: xhci: Apply the link chain quirk on NEC isoc endpoints
Date: Thu,  8 Jan 2026 00:49:27 -0800
Message-Id: <20260108084927.671785-3-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260108084927.671785-1-shivani.agarwal@broadcom.com>
References: <20260108084927.671785-1-shivani.agarwal@broadcom.com>
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
[Shivani: Modified to apply on v5.10.y-v6.1.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
---
 drivers/usb/host/xhci.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 07591a498b5e..b43e88102200 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1789,11 +1789,20 @@ static inline void xhci_write_64(struct xhci_hcd *xhci,
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


