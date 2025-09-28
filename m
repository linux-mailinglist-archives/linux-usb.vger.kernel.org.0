Return-Path: <linux-usb+bounces-28747-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A605BA7672
	for <lists+linux-usb@lfdr.de>; Sun, 28 Sep 2025 20:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 568317AA0DA
	for <lists+linux-usb@lfdr.de>; Sun, 28 Sep 2025 18:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0502725A2B4;
	Sun, 28 Sep 2025 18:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b698gJ5I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0CF1C5D44
	for <linux-usb@vger.kernel.org>; Sun, 28 Sep 2025 18:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759085784; cv=none; b=P5KVCbFEA6m6YgITG7CMUyfTvDgffhNvDFhnCZWJZv4arTw9nWvikoHexbBJxvH4X3Q7L+XdJG4h6GH0lAas1Ax6GGmKe5ofmAXrseTyUpX3i4io8XDs2axEBMKHuRYYDdeqRuWQlxkPWT2h9JbzTLksZ/hizuRm6FVeY7P7E50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759085784; c=relaxed/simple;
	bh=IIY+gMYsuba/+4OqTyDx5xayTLYKf0LOx4iot1O/PPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KUtZifG5XWQal/gFdNz77paDRgemgud77t1zu2p7wMLlYw55m6sYqc1eG1qSor4jQKS+o4A+tcS7GxFs/ozme1oILBqVYie80lHcbeiFgaGPkFtTaFlZLTvYIaD6c5DJayZaqSwIrBotrr/HVfx5GVAtcMfAdZuuxFGRgGkJbiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b698gJ5I; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-85b94fe19e2so378439185a.3
        for <linux-usb@vger.kernel.org>; Sun, 28 Sep 2025 11:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759085782; x=1759690582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TGLyWOkC4KUmwBoD05Lz2YatWCzChawGrCPkfQ6WKFE=;
        b=b698gJ5IS30ELAY9ioADCMK2pnnEfO85a92ngmjDhYa0r2ZsyIptKrRT7b9tysfFtH
         5JBv7WzmBDxvxVxLhTtss6trERiGGSyKznzfD6mN+YnmZVWZzIcv9q8T/yecBdTgSjI+
         pzGk0CxuLCJQ5W3U0hBPn7RZTJhIVCwlQJXyrk0+CsyXE89Y0FFhS5nxC1UCd6snELbY
         m/ViQJP7fZfs7AldvtPTtmXz6GRFRjcOIpaoZ0qRYGGKA9vRGLWXp6Tvr7uyiohCAU76
         VA472dyw+7GucCK/xXY/OU3FEu4tK2RwMzRp12FFzMsJgGH78WL4C9T96TI14MYBrKht
         Cq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759085782; x=1759690582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGLyWOkC4KUmwBoD05Lz2YatWCzChawGrCPkfQ6WKFE=;
        b=ouWlIjXN/SEQa27YzmYTSYY78HFKHuaJOmULf5wLxzM9mDFbdCvY3KdnBf52OK8fs9
         OBtbLv6wnAjBBBqbV4d6fUcKKI1AtfHK5z6eLW1boZBaL0iUiybKQ9tZ+G+Gp3EdSe2P
         Ga3GO4+dg2zbHcdu1FFsWmplSvLm9gBPKRG5KECNV4vAGlKLJfxTlmEfos3l+UjBxbsT
         ImGzgFrTkG7KqiHziUoEnQOavoGgGUlHgB6bTeLLoEJdvrR0B0LXo5SJyKRAqVf7i3XM
         ReIZpryPjI24PWWtF5wmhJsY9ImHCqMp3iWH+WHVgQqjas/RFj8pXFGxp1Uc5VsGWxTl
         QUKw==
X-Forwarded-Encrypted: i=1; AJvYcCUse5N0GBF+hj83xqdzqF8L9GQbZo95TxMJ248HPPMwiW+9SXnd4z0RDANBjn4vkFgrY2jVYmA6c+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMlLX2y8snKE2iN0IOfKjWD93QdiYeZJJOc3/CdRxOXZuAORJs
	O4lOdzeTKA0o/Ve6+OTkpc4uLvDm7st1Y27SaS+PmdLaHGYYgJcs6eJ16XSjln+8
X-Gm-Gg: ASbGncshov7DHsi0C3vNH47NMrQ8Wd5jxv1a9RpBblYh1fdTIIW5xtTTypMt0kFlztS
	nWG11LOb0cYMnJ6Bj2yyTIZwLtmFgAV3FXDTrJPH/yXRgP0woe519QyZ1r195gOzvJJcpr64CrY
	qKCfDqnJrCuM+GmjeS0LUYNqStS/7PwD3QeZu1gMfg228qWBfK4Zu9OYMy1mWJM239FJf4AIwCB
	xwDyEnOzIXfMk+suBIgxELU+o/3MPV2QslECaDAMn0Z2gJYbC/X5muw8WMYpQ3iiBApHsXqcutL
	cSty8A3DK2YBI5M7CEWlcPiTTkYlH292gkGllK7ydBhQ8GFIadV43PNBaAZr7L+vxzCpT8WyFZk
	mupLzjqIAOBDvzzYCP8nJ1wDRrjL2fKN0ka1fDn04x92tZoZrVMi3hcOl5/YxqzTmC9/zLOxHDI
	S1CRheWS56Nxl5BOxb1qIIdIHTYhY6hekM3cGqQqKowY6Q+EMqESq6ZuUXPC95MMaU5z8TUm8=
X-Google-Smtp-Source: AGHT+IGCienOOAXPOzXv0RjWDI8W0f9AevwWnxU/CqqiD/Gq8WdLhiXtiD5kKW8ENAGc5zFV0rlHkQ==
X-Received: by 2002:a05:620a:f07:b0:81a:a1a7:763 with SMTP id af79cd13be357-85ae156a7b4mr1812596985a.37.1759085781806;
        Sun, 28 Sep 2025 11:56:21 -0700 (PDT)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.81])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c306b5f64sm630686485a.32.2025.09.28.11.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 11:56:21 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: Fix descriptor count when handling invalid MBIM extended descriptor
Date: Sun, 28 Sep 2025 14:56:11 -0400
Message-ID: <20250928185611.764589-1-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Seungjin Bae <eeodqql09@gmail.com>

In cdc_parse_cdc_header(), the check for the USB_CDC_MBIM_EXTENDED_TYPE
descriptor was using 'break' upon detecting an invalid length.

This was incorrect because 'break' only exits the switch statement,
causing the code to fall through to cnt++, thus incorrectly
incrementing the count of parsed descriptors for a descriptor that was
actually invalid and being discarded.

This patch changes 'break' to 'goto next_desc;' to ensure that the
logic skips the counter increment and correctly proceeds to the next
descriptor in the buffer. This maintains an accurate count of only
the successfully parsed descriptors.

Fixes: e4c6fb7794982 ("usbnet: move the CDC parser into USB core")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 drivers/usb/core/message.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index d2b2787be409..6138468c67c4 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -2431,7 +2431,7 @@ int cdc_parse_cdc_header(struct usb_cdc_parsed_header *hdr,
 			break;
 		case USB_CDC_MBIM_EXTENDED_TYPE:
 			if (elength < sizeof(struct usb_cdc_mbim_extended_desc))
-				break;
+				goto next_desc;
 			hdr->usb_cdc_mbim_extended_desc =
 				(struct usb_cdc_mbim_extended_desc *)buffer;
 			break;
-- 
2.43.0


