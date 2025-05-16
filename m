Return-Path: <linux-usb+bounces-24024-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E56AB96EB
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 09:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6764DA01505
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 07:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7523B22DF82;
	Fri, 16 May 2025 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXLNPQPs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6BF22ACD3
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747381963; cv=none; b=e/Zve890r+a0hRL3rs02qsVgptI2VMD9lCdq3Fh5zYwvOqj01/GV6K3DYUE8TxkBsx6YDrQk9psOoLwVFLtLc0vEAvs3XA8IdMRdpIM7ACA9aeCGF5jKyl8mVaSNaqA9tg4IOTo2QFWX9hayILiJ85C1RhzwO6OMq6e2s9mUPCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747381963; c=relaxed/simple;
	bh=9bp3+/dLtXcLrNFNRpJG7Qm8n89dMqnYYLs/E95z+lc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bKvqcVSf0UGlui0Kd2BjH4DVSC2HQm79N4/5vb7zGbsLvE7OpDo7lmFgjX3utX1RrwC3hxs0KMJ8JPuqXMN3Sk0E/Txe9jYdze+L2PPEx80tvtZ7t5z/rlc48wNSoB04oHJ/hbJ3pTq6KPiQ2Ra0oRCfGknB6+FQhZT7Woy77Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXLNPQPs; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72a4793d4e2so1549381a34.2
        for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 00:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747381960; x=1747986760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HU/iFedIL6SKDZLCTi7zcWWyb1XrUafF6XzReJbzvr8=;
        b=OXLNPQPsUtVmS23BOeO2ntoEDVAzhTkCcSGyHjDzhqC1RIVi7bMS0y0cOlwndn5OYr
         HMTb/O3mxwUkq9dQEn85+yD6KWWceh9qt3d0UDE+xtyBGtyAVyKa7Bym6AAr+DCufZGu
         teJk53q2lyIbKTiaVMf5iGimKs5lcHpn9tkGbS+mhoABwJaXwR+nIkWnM3yPf4X6R/Y9
         /3zCqm4OhR4WkxVdu1vCBHZ9JM57GuywfFONtZEEoA/OYQ9tVJDSeZl0QORtHaWuBFln
         D4ALs1r/UwChmIuNFbay3Kl0J+muif+BwM4fps2qQ9bjpo3ZeoJkNrYIn78ED8oqqFfC
         YbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747381960; x=1747986760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HU/iFedIL6SKDZLCTi7zcWWyb1XrUafF6XzReJbzvr8=;
        b=k31fGW4qd1nJM45isFPupNkGSB8NviRQAGKJHjT6X9IYR54iicRWuGEGy6api1c8je
         S3JKtkjTuXguluSvNjTNgQG4+xrdhhTFCmGE0Itx/t/HuNanLKO07lSqX1BE9+Z80xj2
         /R14+VkU4sB0FHkKDuBthxynOF+2I4JgpDmBaf97z70EldNRzT+sAXiOTjEzS5za40M2
         9ca4Y41tBpvb1pABUSizGOVdR8DlCCLt1/fmct+TATt9jK5at4jveb7cJytQktThwcoT
         zRlIP8tLYucFzoGp5A2HAIvVPegEL9M4TC3f7KlQn1fQ834IDE0fL7Ti9lCu6LEUqFZS
         NF8g==
X-Forwarded-Encrypted: i=1; AJvYcCX7XOxsV6LEc6CYdtqxHvEMnxbT2Y3UqViMMQwd8XY21tWvH1KbjQNTlxirZjGDqk9pjdJf6cTFqTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvMasoqoZtvedEND2QZmTYJ6ua6t4RiCwGJVqfE/AWu10usSCb
	4g/VJkcJ+GFtlQbvKjpxNCC+z0whMnpTY2uYUBDIxLD87BsqrFpd4TJxmv9cb7o8
X-Gm-Gg: ASbGncuqaviheJ1Vx+H0Pr0x1Hy6NOye5UIP+fdefkowAVm61bpwSTEPOk1zlX7pZTp
	Im5FuDHqZWwMeKz0QPNbnpv1lThBK2XyrsHn3Q5qZfmPcnTj1KtYTB7Xcp1JL6xpfe33TYYwvWp
	as3DtWlB+KNrPY/6cnO3cbbAm09FTdJJpZ8Nr+qwt/yDa9KXGAoe/ucfe6BwZMG3Ig1XSxetv/v
	1P0nqC5EJJ7TMCs+UEmRV+gElujhFh1j8OEC8hSyc7GBX/7yl8tT2gg5eXRwLSZm7k6XYKNnW9V
	BU+17wCyCRX001Fk3F+qu2uu3Pv0KyIZP4KMtcp+IqI=
X-Google-Smtp-Source: AGHT+IE6t2Kp2tDEzBaG+9zEoq2qKzxW65vWFTTqNW0T7DOgbcf90YpE79z0227c9a6Xq3cri8gzhw==
X-Received: by 2002:a05:6e02:b4a:b0:3da:7cbe:f47b with SMTP id e9e14a558f8ab-3db843348fbmr30575395ab.21.1747381949751;
        Fri, 16 May 2025 00:52:29 -0700 (PDT)
Received: from dell.. ([185.223.112.22])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4aa6cfsm281438173.113.2025.05.16.00.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 00:52:29 -0700 (PDT)
From: Vadym Hrynchyshyn <vadimgrn@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	linux-usb@vger.kernel.org
Cc: Vadym Hrynchyshyn <vadimgrn@gmail.com>
Subject: [PATCH 1/3] [1/3] usbipd: enable SO_KEEPALIVE socket option for accepted connection
Date: Fri, 16 May 2025 10:52:02 +0300
Message-ID: <20250516075204.7950-1-vadimgrn@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    - If usbip client does not close a TCP/IP connection to a daemon
      gracefully, the daemon will keep this connection open indefinitely.

    - The issue is that the client cannot attach this device again
      until the device will be rebinded on server side by commands:
      usbip unbind -b X-Y
      usbip bind -b X-Y

    - usbip client enables tcp keepalive by calling
      usbip_net_set_keepalive from usbip_net_tcp_connect.
      usbip daemon now enables this socket option too
      for accepted connection.

Signed-off-by: Vadym Hrynchyshyn <vadimgrn@gmail.com>
---
 tools/usb/usbip/src/usbipd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
index 48398a78e88a..d89633d8f799 100644
--- a/tools/usb/usbip/src/usbipd.c
+++ b/tools/usb/usbip/src/usbipd.c
@@ -119,6 +119,7 @@ static int recv_request_import(int sockfd)
 	if (found) {
 		/* should set TCP_NODELAY for usbip */
 		usbip_net_set_nodelay(sockfd);
+		usbip_net_set_keepalive(sockfd);
 
 		/* export device needs a TCP/IP socket descriptor */
 		status = usbip_export_device(edev, sockfd);
-- 
2.43.0


