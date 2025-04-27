Return-Path: <linux-usb+bounces-23500-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 694DFA9DFA9
	for <lists+linux-usb@lfdr.de>; Sun, 27 Apr 2025 08:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5763840354
	for <lists+linux-usb@lfdr.de>; Sun, 27 Apr 2025 06:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6560023F27B;
	Sun, 27 Apr 2025 06:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpSMprYI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8C61E98EF
	for <linux-usb@vger.kernel.org>; Sun, 27 Apr 2025 06:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745735445; cv=none; b=rMzrrnHDQEJPXyb3pUJynXxorkvzh872BVbiNHUVk1L1CazvbOCYtIi9eH1NNDt3fViA45N8vTfi/lv2cSGagv+rakwhz1qjOxBRj9bx9PDUMuEknIPluLsBdQzOu9KXDdju1vxHe2aITp8w/oECXdUElrVEyALQBgVGgyFQGtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745735445; c=relaxed/simple;
	bh=UsbX7FlD9YSRnI+OcmqCAyhY8c5AcYpbPCTdKkmIIlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NWSPE2V5TWbghKGc9c5f+YQ+TeQJAH5dpKF/3emW+4GiRuae9eS84q0j+VlaFjepCJTojhCI4lTTpGhEd1mvnhAMtJasDorI2eALha0Mp0L3lbEgjmlMEcWweiZ50Fm/gJvwMx55j+mxMv0VaJvWm8r41Amlp/pi86pOspLr/8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpSMprYI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so3756025f8f.1
        for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 23:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745735442; x=1746340242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dn906f5QkG5k222bAAO/WO9XRi5i4KJ8guqz4NbmmWw=;
        b=HpSMprYIzR8HJocSIb7UpJDHqnjLC4bqaejNn49FqAxbv2DGyYrX+jHBIu+8o6N+7P
         5uIpKFc6XcevN/U8B3z5HmXg5qaz9mGZMEnKnv0Lr7Ag7oSctdSuzgoONO+pvYXgYoRb
         /U5p3gwBYAO+S/i67zzT5GbjFvzwY0YcAqbKiteGAakLbI3Tx24r7p90qNNXIXWd+0lq
         7RUGPUS/IBqZwu41r3syl45uuXKkpDj1mKPUXPNu6kPTCEo1tkH56etIgSOgQK0j8kQm
         vioZC6bDCEwxfel3T/6t4YLsmeMU6wIjQa49kdbAGVCN8FmQGWxDlY8EDotJuridg9cW
         dSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745735442; x=1746340242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dn906f5QkG5k222bAAO/WO9XRi5i4KJ8guqz4NbmmWw=;
        b=C/f2fXss/apOAv4P5iD28pBa50GDDZeLobL6wxt3nmwmbRrTkl3fSywbJBOPR4LHiq
         Gcw6fWRqaRvyOkVYqt5uo7UU6c+xYSy7g4XxQUmAgStLYqhquGr1uY7aE5sOa6V4ushW
         KUtB9f9rYybgb3VkczXHV9p7+jtVgtnPDYppsTUu9uqeJpywx8eB3xMfxxKGXCkLbNBT
         k1FEdRbl2ELA0EgY7ayVizrKan4pyI2KTdpmTpvZ5QwCO7pbg0NdwGt4l5QsbxlIQTtc
         +35ZT6lKx+5sDyLflGNnHaVgeIzI1MgMdomblZBfZuNBbPTXtR1+0Jg8/zNBfT53d2Ec
         UaWw==
X-Forwarded-Encrypted: i=1; AJvYcCXqjRI5s55TIERKr2kaY5/NxXttSBCkdmqweCTGmwOObX/n9OBI/DFJTP8cRPZPjGo0eKqJkmLa80E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHN79qYAgbuYf1AebCQfCXQrKx5wNsXLA5B8z4T6fIGzoOVxed
	eYt4kU3ZUv/T044/sYsS83JOtZWopm7JfmI3c2A3xSPXOqFiLmoK
X-Gm-Gg: ASbGncsjSBM4m71LYmzKAEBfWxik3S/O+4oFd5anLhRTQj0tpccXKNK03Uz0Px96wRE
	gPYoWovCmoj46+oG9NHn9uDgo7LIrUMueVY1EZs/zajkiUepbV5kFjrrrr5sBl7LiHC7zRupBoM
	TYxEKmwz7OgYFs7UZHGh0MQinCGYyGp9qSDcZi+KE+hqX98q4+39Otcq1/v/ESowsPM9f8WRlRl
	01OZonhMmx7MiXAi41M47zW3ZYXydn+22E3nhB7SMO6FweJ/y/LKgXzhxaaJ9XvOTGTZXfD8Mxl
	eLR3YP9MzSVAjHGr0fWssdTCdW6zv9zNCaQezByCOi2RPRmz8wsWcHVj4FiULnTR9mH9SKET+gA
	V+QqYJxU8T/U=
X-Google-Smtp-Source: AGHT+IGLthBwpgqxLYfYjioQctRoQ/k/cR1Xar+bGZpEuSyzrF+Iixoig6GOlsM1De244NAow7nwdA==
X-Received: by 2002:a05:6000:2207:b0:3a0:839b:f52c with SMTP id ffacd0b85a97d-3a0839bf543mr18745f8f.0.1745735442084;
        Sat, 26 Apr 2025 23:30:42 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8d60asm7711761f8f.18.2025.04.26.23.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 23:30:40 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: guido.kiener@rohde-schwarz.com,
	Dave Penkler <dpenkler@gmail.com>,
	Michael Katzmann <vk2bea@gmail.com>
Subject: [PATCH 1/3 V2] usb: usbtmc: Fix erroneous get_stb ioctl error returns
Date: Sun, 27 Apr 2025 08:30:36 +0200
Message-ID: <20250427063036.22530-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wait_event_interruptible_timeout returns a long
The return was being assigned to an int causing an integer overflow when
the remaining jiffies > INT_MAX resulting in random error returns.

Use a long return value and convert to int ioctl return only on error.

When the return value of wait_event_interruptible_timeout was <= INT_MAX
the number of remaining jiffies was returned which has no meaning for the
user. Return 0 on success.

Reported-by: Michael Katzmann <vk2bea@gmail.com>
Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488 READ_STATUS_BYTE operation.")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
Change V1 -> V2
  Correct commit message wrongly stating the return value on success was from
  usb_control_msg
  
 drivers/usb/class/usbtmc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 34e46ef308ab..e24277fef54a 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -482,6 +482,7 @@ static int usbtmc_get_stb(struct usbtmc_file_data *file_data, __u8 *stb)
 	u8 *buffer;
 	u8 tag;
 	int rv;
+	long wait_rv;
 
 	dev_dbg(dev, "Enter ioctl_read_stb iin_ep_present: %d\n",
 		data->iin_ep_present);
@@ -511,16 +512,17 @@ static int usbtmc_get_stb(struct usbtmc_file_data *file_data, __u8 *stb)
 	}
 
 	if (data->iin_ep_present) {
-		rv = wait_event_interruptible_timeout(
+		wait_rv = wait_event_interruptible_timeout(
 			data->waitq,
 			atomic_read(&data->iin_data_valid) != 0,
 			file_data->timeout);
-		if (rv < 0) {
-			dev_dbg(dev, "wait interrupted %d\n", rv);
+		if (wait_rv < 0) {
+			dev_dbg(dev, "wait interrupted %ld\n", wait_rv);
+			rv = wait_rv;
 			goto exit;
 		}
 
-		if (rv == 0) {
+		if (wait_rv == 0) {
 			dev_dbg(dev, "wait timed out\n");
 			rv = -ETIMEDOUT;
 			goto exit;
@@ -539,6 +541,8 @@ static int usbtmc_get_stb(struct usbtmc_file_data *file_data, __u8 *stb)
 
 	dev_dbg(dev, "stb:0x%02x received %d\n", (unsigned int)*stb, rv);
 
+	rv = 0;
+
  exit:
 	/* bump interrupt bTag */
 	data->iin_bTag += 1;
-- 
2.49.0


