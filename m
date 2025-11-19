Return-Path: <linux-usb+bounces-30699-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D755EC6ED74
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4CA083A74BB
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 13:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BFA36998A;
	Wed, 19 Nov 2025 13:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbhI+mwU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A021D369224
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557766; cv=none; b=NAecd/OxI/LVOvxTsOEjWP8h+7UZQzDT9DK0DXy0xBizNyNK2EkhhhRkd+CpnTaPn5lYD/5Bwn/r+Gct6wvGEEHARM7WBD6uaXCJTfZ0wuPToTDgTd3fIhFiJm+/iJJOO027pZDsebX8z2lk16RZcN94FZK9UGu8MJqnVCyQADU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557766; c=relaxed/simple;
	bh=NENJ76xybs+hvpDu5LJAnhejEWZeDsuvfrEqnXX6oVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPcB5EwsQctG8sO+/wbaI4bh5BAFywDrOSbgWKXcff6RkKzDMMKyFeTKkTUH2E0SAo+j5A67JuqFeWSaM1moGetn+wUAef6Dv0bon4PV7jwLAxomquSoHmZBrRkFpel4wd9dv6xThnjXgoyaqlO8dK1PzPHfUADqJN/8tPKpSm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbhI+mwU; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so5795667b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 05:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557764; x=1764162564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fC/QdmI3jNw4W9z6Eomd9eORRY4agyuexEsQOqxsWWA=;
        b=bbhI+mwUuGBcooA/n4+Z4FViS+xACvHQE+brpNTVo7ISsZCGlwmOwQAE4fH4Spj8o0
         xQtGS74aEAH5Frzrh/uRmonwksR/R7nR7zHf/Dqjmi31szei4MOpeHc+jXu/LW918gzl
         Pn4PyXE2G9tSwrxRy+2BIJX8c6XpzqdNXwgjL2mhIcnMd2jtF8UEDsSJjSWLrSKJ91BR
         Dgb+TYnpHApzy0LmLTH7C6hhpNf+Bh8D2y1Y8gLD9EnbnlBWApc/P7wZ2UcDTY17VhQV
         RUPHick36gqCsAaZOeLWkb79QecQzDtpEFPyHQU4U5qqSUBvQM+j8Zjt4q5Etz6kjlOq
         47aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557764; x=1764162564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fC/QdmI3jNw4W9z6Eomd9eORRY4agyuexEsQOqxsWWA=;
        b=X5IyeGgN9PeRKltY4+Uw8UVb7oUDz/mH7JuII+nC+HYWyJQfSDhS1ODsEmzZwWdmv/
         h5mtqgDjPprxLx3ZC3KYAuMsSSo6OV343k3W9ypf+u88kpnxerIpYIk+85i61M9GAdOO
         dYal18QJZSY0MPGx/hezC1iuGa0c61b/hKrbZvynU8uYgZQsiDdR+q8JD3aQdrqzjnYe
         2SA7nBhI0eiZzVyR+abIDf0ZP8m3+dYUBuCTXBj2iH5nHlS8pDya3R+WAlNYqhTNmUuv
         vuy1cFo+taKCV1Jw3YnZ6nH7YYqGS/TNoeyMqzIt9MviuH+rZGyOfbs8q/Jg5kYKfY2Q
         YetQ==
X-Gm-Message-State: AOJu0YzXPcbK7Vy9t0KH3GneKmcYQIgxJMkjBOvbvEsec0JS5OgG5A6a
	GybaaQsbskn7Yx/zk0q/Prt5Vjwl32R1yRjyHGKomiAIXIZYisHw6i3M
X-Gm-Gg: ASbGncuFursexTRkqsmnxfurSKiZv/XYAqnM88BvmllOwRPQ8J3qaOUEppHVi6Kj/5Z
	Mg5xu0VUkGGFGSxep30CUj7QpRxz7DW+DaiZUjSi38WbjsLjgJq1fKys7XBNv2MrFKFKskyu9PZ
	CEdWbetgu7qMSrGpFLy7OQf8LEHZeQfZ7v0x+og0xNA2b7ujD7JkFYF84LZSCUAjn2kIyr4jara
	j7gQZMVXIJA84XG6VH+Xg4T8Ai6/3lViSptU4tjaeWC3dN1xmLT+rxIcyramb7+KndjPfquPSka
	NIJxBbhE6+KuQdIYmpbaaKxpDxdgaPihtmY2lw490nxToMw99bgrGlirmtax5CrypMfbqQh7HcE
	i2cul05zgZNLQMB+iC1b5msHrE+0JA4FRwkCIKT7WnV6KbESSaJk6w9xgu9I3fHqGmlpERIiwHP
	mK8lFNEgQV2v3f4Lb6xmZBzAV6Ml4jdxXCnDgmpnDDplkhQg==
X-Google-Smtp-Source: AGHT+IGGI52YQzm3rmkb0PCKU2qx/iGnZ4itIPwV6h00f9wx34QXLSkuVhuOMBARGGuXkrKrRWhFng==
X-Received: by 2002:a05:6a20:6a1f:b0:35f:fafa:a198 with SMTP id adf61e73a8af0-35ffafaa648mr14108360637.10.1763557763956;
        Wed, 19 Nov 2025 05:09:23 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:09:23 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH 8/8] usb: gadget: dummy_hcd: fix miscellaneous coding style warnings
Date: Wed, 19 Nov 2025 18:38:40 +0530
Message-ID: <20251119130840.14309-9-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch addresses several minor coding style warnings in dummy_hcd.c:

- Avoid multiple line dereference (e.g, ep0->maxpacket)
- Remove unnecessary parentheses
- Remove unnecessary line continuations (\)

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 33 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 1114dfe61..5b791ce2e 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1423,7 +1423,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 		int		rescan = 0;
 
 		if (dummy_ep_stream_en(dum_hcd, urb)) {
-			if ((urb->stream_id != req->req.stream_id))
+			if (urb->stream_id != req->req.stream_id)
 				continue;
 		}
 
@@ -2222,8 +2222,7 @@ static int dummy_hub_control(
 						      USB_PORT_STAT_HIGH_SPEED;
 						break;
 					case USB_SPEED_LOW:
-						dum_hcd->dum->gadget.ep0->
-							maxpacket = 8;
+						dum_hcd->dum->gadget.ep0->maxpacket = 8;
 						dum_hcd->port_status |=
 							USB_PORT_STAT_LOW_SPEED;
 						break;
@@ -2434,20 +2433,20 @@ static inline ssize_t show_urb(char *buf, size_t size, struct urb *urb)
 			break;
 		 } s; }),
 		ep, ep ? (usb_urb_dir_in(urb) ? "in" : "out") : "",
-		({ char *s; \
-		switch (usb_pipetype(urb->pipe)) { \
-		case PIPE_CONTROL: \
-			s = ""; \
-			break; \
-		case PIPE_BULK: \
-			s = "-bulk"; \
-			break; \
-		case PIPE_INTERRUPT: \
-			s = "-int"; \
-			break; \
-		default: \
-			s = "-iso"; \
-			break; \
+		({ char *s;
+		switch (usb_pipetype(urb->pipe)) {
+		case PIPE_CONTROL:
+			s = "";
+			break;
+		case PIPE_BULK:
+			s = "-bulk";
+			break;
+		case PIPE_INTERRUPT:
+			s = "-int";
+			break;
+		default:
+			s = "-iso";
+			break;
 		} s; }),
 		urb->actual_length, urb->transfer_buffer_length);
 }
-- 
2.43.0


