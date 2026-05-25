Return-Path: <linux-usb+bounces-37994-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OIxAxWyE2rdEwcAu9opvQ
	(envelope-from <linux-usb+bounces-37994-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 04:21:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C03D5C5661
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 04:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 446BC30099B5
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 02:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AA5276050;
	Mon, 25 May 2026 02:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzAWbejO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC18276038
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 02:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779675666; cv=pass; b=Xej39nL6B/cDRz/GPh9Mxbtw+VWC3tW1J/hzZyIeNNUpU0YQoCdN1TRZn4cXyT7nFSLY9R93dB7zxad4Db8ybwSBDE2h/QUNeUmlA5GOItMnyG2ca0OyaKp1RlxCi3XGRIjC1+BTOhYG8got3UOW+897ThBFIdmqonuyvPzwuK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779675666; c=relaxed/simple;
	bh=9OF++De0qbfSaGV9kKcaQ7PVSfEbE8hrcqNBVw2etnY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Zzth2uo/J0kDex5PABXoN4DMoWORI/3W0NyVTzJcM/ltT/VJ+7Tim7+7pVifNNx5Q5x2ZHhlWOYceVlPVl8dTvZD0qNTrVQKjw92+NVHKdKW1w/W0rg+X4hrd4pjz54Qo+Gvba1V5+T3LsTTt8ZK0POr3GNVEjxWm0xfxwbhZVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzAWbejO; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e5fe62fc87so2443329a34.1
        for <linux-usb@vger.kernel.org>; Sun, 24 May 2026 19:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779675664; cv=none;
        d=google.com; s=arc-20240605;
        b=WipHNLgC2Htv0MX4YwiUni8iANZdlWlnkDcYPTHh/UHp9qKU/QoDmiHGFqjb4ajfhU
         fBtrvvER7zNQgTK0ZqIxhmyNiItI4sHfxEk/ojhjSU6oVqg8FGfJzTLs4f0Laqbz/h62
         PdAxQFAfzqWnfxyFVs2/Zd1MnYfc5t/azK0b711pIfiZY/qa1qig3GIcMf4DsunW9sox
         qecnIMllzax0med1rkJ2vwXWYkIFMFWO6/e4qoFKdrSIlmjdLyI7qxoKmTNNU9+10Dbd
         Kemreo8XUVTgQWK5+LfpSTf4NALLfupaCXvhGDeVy4+wch/iqVipVG/jQxIgTJauQDHn
         qMCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=aw1fhyGrsU8/wH2/4vYCJYAjvuo5aa1sDViZVMzFnqk=;
        fh=NaM3uOI9IBUL8CouaedBEWnVPCNeqBndwIzF0DzzWOo=;
        b=GDgXIIxVcQ9Hf4XQQmdz9/VrS9vv0EDtKInmtLpKpLv9griHVzL9RiPvIwz0Y/u+s6
         bt1GQI2p1zjQj3qyTxFs41iOlgL7Gzq0UmFaihRMsLTFZc14mzIAHmhZctstuBbCO+ZH
         nF9IgWl1QXC8EvOMo6Tb8B8sFXQe4LhV+ar/o8JnlVBNwMY6KaIaTo3j1KAWddJ0fCYZ
         ShKRbtmALxzswkBwHIAzbNJvHsX7lypYEeDtTYDROujAkUb1dDHK0R8GwsXa9KCNFfLA
         GknGGxlXdgKh4bFhjEyN5YbvRl3pnn0toCOpzqZ0FcdkShT9nqVn5aQluDqAlkkZB40E
         MO0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779675664; x=1780280464; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aw1fhyGrsU8/wH2/4vYCJYAjvuo5aa1sDViZVMzFnqk=;
        b=NzAWbejOlyQtXRCcNbi+JjCoZF1YSI9gz7P0VkyZyMbKiyT0ExzLaDX6xxcskgmcGp
         3qN2GML+rlUHvaO0ImYe3/aX+BRlYqIbZCHRH/9HW4+wK2cjIinbJnpovDA+QIGO02ud
         pVchsJcpc0K//dozybhXY2i60RqFVqarhdjJ3PA5EtagpmjhIKbwL5z0uwd727taasag
         bD0sdT6l/89YSw9KHoqYSeGTj9xrCVz49iDdYbjj9Kafry+6/Snyj54/ntU5Y2Ei7dau
         dRZFSM+H3jMSFMZMSo9CUUI/MjGm13Kb8BOn8pQ3ODggqlKwzpK9umdVdOfJp0b7yyRf
         vOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779675664; x=1780280464;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aw1fhyGrsU8/wH2/4vYCJYAjvuo5aa1sDViZVMzFnqk=;
        b=muvDtaoNx5GKsdE/GcbuZ6qGEZ9xxgzeLSwWDOuJy0fhBDddEPpojqkUHOY3Ek+LiP
         4nsTSThds0RoKjNkmLRIS84igQWn5hZbJUFmx3JlKD+aHjO5lzkVR2263Qos9LMTk6AA
         vcc97mSoXPmE+Szrgv0QCo8eJXJB9eJmFY1/coXXzmL909cC4WPXpWnIrOrs+/8dZYpm
         24O12c3HampF2d0duz/Cfk6QF1pKjgzu4rtcpcar1WFTQ8Wv+kWFBu0f50KlwBc2slhO
         hMirwkZKBMe3IELZ+Xdbb7AdAzNG9mTp1QkF3Kn0dT47485RU3c5F8vL+EA2lru0tzpR
         8lvA==
X-Gm-Message-State: AOJu0YyFdSJcRLj+7fqCdyzsVHkcw7T52kcUcH15ms07MqSQY9DcO+ay
	OeV+0sjMog4xi9TJcLkwq+dXi/DrMhA4BOxw7DE8Ez/i9HK8tP35MzTXngoUm/Xrzqwt87U1Onh
	Yhf7fOzc7JxFOdQZhUAotLnX5+j8WGcpGf1o6TDQ=
X-Gm-Gg: Acq92OGHUdZGsbYePKyD+idR4LrLachikCkm5WJS8vFpxKhR6ZFGaKgFB2zPezBCMAT
	v8XtoWlcU8Rrzv/LNFclY2B9xFSPs7QrYqKU0SPo+9wpMul1BG71PVe7kPNeIYWmmPDfZmDoTbJ
	OwgLlDgGh9sQXLQOlB3LZQpP7HyLCfwXfZ8ujtUO8SRh5jau9DXWJ/N1OAa4rt5SjaM+Y6rH+Bc
	axG3/Wqpbigh22KpMtdjUlvyaeO4ZflMdV6hnPRZa75kK2YhRHn49Kps/UG+TNgDu7YdqWsnsdf
	YDQRmYdlwragg00tEZ4hj6UBmXuUYcMaV0j3Ek0qMkUJZ6X3M869qjQ3RzJhNA8tiK4JbOyCnQ=
	=
X-Received: by 2002:a05:6830:2404:b0:7e5:f831:50a3 with SMTP id
 46e09a7af769-7e5fef1a50cmr7856308a34.17.1779675663643; Sun, 24 May 2026
 19:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Adrian Korwel <adriank20047@gmail.com>
Date: Sun, 24 May 2026 21:20:51 -0500
X-Gm-Features: AVHnY4Kfxoj-dhzRCkEkzc8-pfd6J5A5tN96IQEGMkQHqb1-0MgBCW-JEdx6GJI
Message-ID: <CADgB2mF95N09=gOvBZ+4ePSQ-0wCynx-rbu=aiyQecT=iDdyRw@mail.gmail.com>
Subject: [PATCH] USB: serial: io_ti: fix heap overflows in get_manuf_info()
 and build_i2c_fw_hdr()
To: linux-usb@vger.kernel.org
Cc: johan@kernel.org, gregkh@linuxfoundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37994-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriank20047@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7C03D5C5661
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Two heap overflows exist in this driver:

1. get_manuf_info() reads le16_to_cpu(rom_desc->Size) bytes from the
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

2. build_i2c_fw_hdr() allocates a fixed-size buffer of
   (16*1024 - 512) + sizeof(struct ti_i2c_firmware_rec) bytes, then
   copies le16_to_cpu(img_header->Length) bytes into it without
   validating that Length fits within the available space after the
   firmware record header. img_header->Length is a __le16 from the
   firmware file and can be up to 65535. check_fw_sanity() validates
   the total firmware size but not img_header->Length specifically.

   Fix by rejecting images where img_header->Length exceeds the
   available destination space.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/serial/io_ti.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index cb55370e036f..afe29fdf9536 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -773,6 +773,12 @@ static int get_manuf_info(struct edgeport_serial
*serial, u8 *buffer)
        }

        /* Read the descriptor data */
+       if (le16_to_cpu(rom_desc->Size) > sizeof(struct
edge_ti_manuf_descriptor)) {
+               dev_err(dev, "%s - descriptor too large: %u\n", __func__,
+                       le16_to_cpu(rom_desc->Size));
+               status = -EINVAL;
+               goto exit;
+       }
        status = read_rom(serial, start_address+sizeof(struct ti_i2c_desc),
                                        le16_to_cpu(rom_desc->Size), buffer);
        if (status)
@@ -838,6 +844,11 @@ static int build_i2c_fw_hdr(u8 *header, const
struct firmware *fw)
        /* Pointer to fw_down memory image */
        img_header = (struct ti_i2c_image_header *)&fw->data[4];

+       if (le16_to_cpu(img_header->Length) >
+                       buffer_size - sizeof(struct ti_i2c_firmware_rec)) {
+               kfree(buffer);
+               return -EINVAL;
+       }
        memcpy(buffer + sizeof(struct ti_i2c_firmware_rec),
                &fw->data[4 + sizeof(struct ti_i2c_image_header)],
                le16_to_cpu(img_header->Length));
-- 
2.43.0

