Return-Path: <linux-usb+bounces-24248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5966FAC1F53
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 11:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78F0DA43FBB
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 09:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DBE139CFA;
	Fri, 23 May 2025 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+qJ+24q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FC31E7C32
	for <linux-usb@vger.kernel.org>; Fri, 23 May 2025 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991290; cv=none; b=qVCljcKEHH/hyY46ydi/coOuPZpk3/+k2yIwJPsZB19pv+04IDq/jWGtCcRQVAjZYh3o+5LhuA0qjClb0lKoyX8pmD3EgX6cWljdHjTL9l6yRTCnmCZzfD/8V53HCjrsfe9+1ZaIBmsJXKsZA6Nso3H6ahAN38kIuF7l0GCe2tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991290; c=relaxed/simple;
	bh=k1dqZ0kFB+LOVqkoEiNlvqrKaBdWzq2c3C2pwLckiRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bIoUYoSPu9uShpWYZ1VZatSiqIQtBnC2UdGMHlJxeoMR7AVyOcFrYAGk8f2KR3QANmugVCnmpYQZctHiJh923cIdCvOmyLDBJqpJ9OHx8EkOszq4a2acnU9vvWZFK7xzOvE5jwX7/UwcCWURjQJhlDbnk5X475dJ2kd2moUQ/XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+qJ+24q; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54acc0cd458so11660382e87.0
        for <linux-usb@vger.kernel.org>; Fri, 23 May 2025 02:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747991287; x=1748596087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQVeZLzFfLaFmKmQnzAoUlM0L/vwewHzFvrSLVi6Xyg=;
        b=c+qJ+24q7rwJ/HEf5lBQe1Scl2pIxcm6B6joLz0jjlLg5pDAfpwpLgLgaxcjM7rOmr
         QfEOPohRXh3QBCX79LOKHH8w0oZnp1+V/tns7G8+YfRlBevBB6jGy11Vy9UaWnuuS1j+
         f9jpIUbCfXpJb2VCsvzFQvzuyfvh9hHjl0RCsA5OwJ+LrmcMBmy0Xn4ikx/H8a/lwTh5
         KkIzQAAzzzDStLo7ZQx/XZi5euKnZxJrKRbCIhmyyAuOdzSK3ywMWAhHB/W64K3+Qrov
         FaovZEtx9t8nKOK46HU0xL3r3hD/iB+mfit6CAG4OFvbg1Lrmi9/MHp7K+WbMPaj8Ise
         i29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747991287; x=1748596087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQVeZLzFfLaFmKmQnzAoUlM0L/vwewHzFvrSLVi6Xyg=;
        b=QeLqLsKATSE8EL8cVubYggDZId7ozVVkp9fDY6ZtQC8n3RQtcJX6OshbLMrxB5ojrd
         ACaggYaRGpaVrW1CA8Cy/ZnnKjEuImzQrOHGl2wyIdLwH6gk6sgABmFaNajAI5JcKvD4
         dHCfhY7UBu4k/u96Fkizc+CrSHpwDbzfirVqk69qBQtVDQtNdHDWAM8ZPw7xn6j7yVb+
         rt/pF7v9joEUsOsU/oL4/Smab7kIpKFMI0cHUta/03GUxJL+huyyve6o0ZMfIxYE4g7n
         hGgPU3CNzgK53PcBVrqXds42EO5I+LaDzx+mv/4llel63rF8zlyaa7b30TzKN0PaaVRg
         UFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxbP3Uy5q+O/XJ8yE3wAIoih6S9A56mW34flHoJ2CJy0EZG90hLkP7ZSxzSMYooOaAVapQjw0fiBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMJD5QcWaGMLYIaeVDPL4VnugFDddMICUnzsLJ7NMg+5n8cpuk
	O4uEwgasklnmt3YbM+WNbF+iqCmbk6O+XTZO2NxCVSn6pbrnkjbe4FDODcBXHy65
X-Gm-Gg: ASbGncuANkn+GckUnz0+BI/tyz+V43JZuFTkom1BuhIhZQ+w4ebX9QxhrYT8OvQe7O0
	Yui5R5K39qNV3XsAl9zYrR8zhGM7NOb5OERF2ikMB62RVpjppMifH7rvmsItfmCiX3nIhdTAwIY
	1yYrfntBcbb7wZj/IsH1JJYl1TYfppu8VYnPiZN+wyJ75d+c6YTQ93JaQU3pTOb4nJpkvgXnkn9
	ShqYr1nOegEH18tDqAqOw1y6jYoPPj15tAzt02xh3Lw+p/2VbqGnpztXK1m7mAZ4h6iARdNi8Cz
	M0argkUBbayaosyE+G+byVmlH7Qdri1+fPJRIoQr
X-Google-Smtp-Source: AGHT+IGcBUij0C4PQIAAvUZYcOoCJx7DD4I8Kw7yeUjLualHAm54Qa3q1VL75mWq/cLLikQhjcdxaA==
X-Received: by 2002:a05:651c:2214:b0:30c:518e:452 with SMTP id 38308e7fff4ca-3280771e0c9mr101751271fa.13.1747991286480;
        Fri, 23 May 2025 02:08:06 -0700 (PDT)
Received: from dell.. ([193.0.218.35])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085f64a0sm35318391fa.114.2025.05.23.02.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:08:06 -0700 (PDT)
From: Vadym Hrynchyshyn <vadimgrn@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	linux-usb@vger.kernel.org
Cc: Vadym Hrynchyshyn <vadimgrn@gmail.com>
Subject: [PATCH v2 1/3] usbipd: enable SO_KEEPALIVE socket option for accepted connection
Date: Fri, 23 May 2025 12:07:23 +0300
Message-ID: <20250523090802.17987-2-vadimgrn@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523090802.17987-1-vadimgrn@gmail.com>
References: <20250523090802.17987-1-vadimgrn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If usbip client does not close a TCP/IP connection to a daemon
gracefully, the daemon will keep this connection open indefinitely.

The issue is that the client cannot attach this device again
until the device will be rebinded on server side by commands:
usbip unbind -b X-Y
usbip bind -b X-Y

usbip client enables tcp keepalive by calling usbip_net_set_keepalive
from usbip_net_tcp_connect. usbip daemon now enables this socket option
too for accepted connection.

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


