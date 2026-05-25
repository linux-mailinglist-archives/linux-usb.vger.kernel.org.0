Return-Path: <linux-usb+bounces-38025-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNooNrJjFGoxNAcAu9opvQ
	(envelope-from <linux-usb+bounces-38025-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 16:58:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 423555CBFFD
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 16:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32E1030138A2
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 14:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA5538423D;
	Mon, 25 May 2026 14:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YivPG8Uo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A45387566
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 14:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779721136; cv=none; b=RqDv3hcoYLVw8LIAxsJl6inIkMtLaI3IBUVh4NRz5l8Ah20BTUjYchVEqg+mL813Exk0w/A7A+maWtDueVLOAI+vl6IzXfukygi/Oz/hlWZKAjziO9maED7JKYzQ54j8vkj2xvPPYPvHd4OdgdFiMEEOG9mfJEgzoEsfKhxQt8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779721136; c=relaxed/simple;
	bh=1G9xTvbWN4zhQVAulm3EMPJCyftvg/OHp6rmyal2nv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxHYhzHtA8L5EiPZRcKZNOUZVCpNZc6FlH+wriDrI5JoBEKgqYBys4Hl9kwX1P+kcm2DyXW8ViQ3QzXqB5WjV36HPJ9vvKIVa4flDTica7kT5omezqgmT+TGCuDtW//+xvTVjGnMtl4r34W/IVaqOvZ2mKCJoXVkBg3LI/+K/Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YivPG8Uo; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-43a86d544c2so4582901fac.0
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779721134; x=1780325934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpJ6gjVoHQOCUdI1c6bQp+ts9mCjVdeuH8wkuVrl/+I=;
        b=YivPG8UoemGJh2Sm7mKT2QkdGUpB4ZdFT8EGuhnk+RYU14/WVO7WQYoXp8bIrKWmVP
         Vt6bDdkzCf1awdJyXFtbnUPmMNtlnEenmLEcwONzSixGfzi9ajAFRQY90MK1Xb5ScMMm
         v1KDSyGzqNfRKorT46dBKOVqAeccPyOuQat0FHCDcARX2NG/vbccNAPGwbPFbE44ajaF
         uvwTl2iKEmwAz4Exa6k4grL1UGsTMz54DpDN7EDKxcEnFH2hSjDtZKFcj+nCVAt8U9dU
         Uv3A4ta02UpRA98ykWriqaUZhl3kVts4O8qn+AFHQRRaeXebb5JFHLVCcdCpuomlRqIQ
         o/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779721134; x=1780325934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fpJ6gjVoHQOCUdI1c6bQp+ts9mCjVdeuH8wkuVrl/+I=;
        b=mDNmtjm5305/ytrmfYwrl5gFEZGeAwrBBbbLp71bIGTNd5yBP3koyjh5Vse/N5n461
         rCmEOU9SDNCfh6KqX/XEwPp8uAA5p251fpuI3ueM/JWgOwakidZoYIogNeQ3E5z1Fyw3
         KUHVYcfwv+yWfS1x3LUZqHvcQB1S5gu/sNFf+feW4mocf/4NckDX2a+NALrhnKbHFDaz
         FFR+YHJS4qXUqjq1xJXEEzPY4xOtwm7lomCtwm0vLnlhq1A++GmZq6VkTpr30tsi6mj1
         /+6N+tuxF95RCO5s4G8bqLoIFPPs557R9JErcfvIC7K8gpGrSWyTM1z91cgCg38r7hT5
         Eezg==
X-Gm-Message-State: AOJu0YxP2RR7dSDvZvdz2kK6kKCIG6M5/kFz4i+j1ndX+rFvzVcS9fA0
	u+nv0dX1YhhZg9S6la4VBDKVlzb7h7I3QVS1dCHW7W0QoNN3UQX6EfIFDQDlf9oAoX0=
X-Gm-Gg: Acq92OGUDNjIN3dB4UzdPvmTdnHg0mROHM6pbAB1nr3W4iJedO3dcRBFScdgpKtlMM7
	sfvjUtSe6JKEw2RV7C+YSaEvY9dkthbUSS5WtqAswP2904hZiGXsjPHY1jihbS6jhy9AkYoB2Hk
	EU5zaKsLI2Qc3iI+NS86pU91Tj9hGqbDNSyhXF60kTTXiTrM+ASyQaeBjrXH1GTx87lzNAhP9gF
	9htH2bZyc6EUud65e4xBPADQBhvSnNXIvmUNicPwliLx2EkHGQ8SJP2AgGa9zVLLjWyoGeygmBk
	OOUUnziV5rILUQ+MmUKmuI9U1TBE4TsdNcjaX5+OMQ3cBCahz6zXF+KmaitEOkWbiYNEY9TO/dr
	ApRFbiGEDMexd07QpxH8+FDHcxQ4qPSLTAYyTjkloH2YjICyOVHRzqklFxuzVrRqvBRvh+9/VK6
	rGKCuTqN7hTcWBK9tDfDeavx6DOqY1PZR+7irZfEFbJA2av4Wn8o8c+eFMUmDG2WXomTD316xgr
	RBepHaMRru2HPb/JCegImes3vFEAR9niMZoI6etpfHJVrd15pAHaY1vmFJJtHf2M7oz
X-Received: by 2002:a4a:e902:0:b0:69d:a2f1:e0f1 with SMTP id 006d021491bc7-69da2f1e1a7mr3937673eaf.49.1779721133662;
        Mon, 25 May 2026 07:58:53 -0700 (PDT)
Received: from DESKTOP-J47FREO.mynetworksettings.com (171.sub-75-196-24.myvzw.com. [75.196.24.171])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d836c6d9bsm5294101eaf.2.2026.05.25.07.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:58:53 -0700 (PDT)
From: Adrian Korwel <adriank20047@gmail.com>
To: linux-usb@vger.kernel.org
Cc: johan@kernel.org,
	gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	Adrian Korwel <adriank20047@gmail.com>
Subject: [PATCH 1/2] USB: serial: io_ti: fix heap overflow in get_manuf_info()
Date: Mon, 25 May 2026 09:58:31 -0500
Message-ID: <20260525145832.2941-1-adriank20047@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026052525-devotee-reclaim-7673@gregkh>
References: <2026052525-devotee-reclaim-7673@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-38025-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriank20047@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 423555CBFFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

get_manuf_info() reads le16_to_cpu(rom_desc->Size) bytes from the
device I2C EEPROM into a buffer allocated with kmalloc_obj(), which
is sizeof(struct edge_ti_manuf_descriptor) = 10 bytes.

The Size field comes from the device and is only validated to fit
within TI_MAX_I2C_SIZE (16384 bytes), not against the destination
buffer size. A malicious USB device can therefore set Size to any
value up to 16383, causing a heap overflow of up to 16373 bytes
when plugged into a host running this driver.

valid_csum() is called after read_rom() and also iterates
buffer[0..Size-1], compounding the out-of-bounds access.

Fix by rejecting descriptors larger than the destination struct
before calling read_rom().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/serial/io_ti.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index cb55370e036f..a35409bd766c 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -773,6 +773,12 @@ static int get_manuf_info(struct edgeport_serial *serial, u8 *buffer)
 	}
 
 	/* Read the descriptor data */
+	if (le16_to_cpu(rom_desc->Size) > sizeof(struct edge_ti_manuf_descriptor)) {
+		dev_err(dev, "%s - descriptor too large: %u\n", __func__,
+			le16_to_cpu(rom_desc->Size));
+		status = -EINVAL;
+		goto exit;
+	}
 	status = read_rom(serial, start_address+sizeof(struct ti_i2c_desc),
 					le16_to_cpu(rom_desc->Size), buffer);
 	if (status)
-- 
2.43.0


