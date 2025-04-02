Return-Path: <linux-usb+bounces-22465-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E84A7893E
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 09:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C527616F7BF
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 07:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6C223371F;
	Wed,  2 Apr 2025 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZmKMwCJT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D918523370F
	for <linux-usb@vger.kernel.org>; Wed,  2 Apr 2025 07:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743580612; cv=none; b=RdNLnm98po0CH4UNzZsWT8CzypFdtcrTEl/QhL5zXHqr62vrHywNxgiRL/Q7ZMEQrcfx1D27adp+zeGmN7TDkTucmjT8DOPFY1J4PzHRmO5Q4mibg0OtMgSuw9joxzEkMsw7/qiEaEg2ePJB9Frs8Ll+QhZ/VS4uDzmXUdc5g+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743580612; c=relaxed/simple;
	bh=H3OGg0kIMQeP8qdswAbf7cM6Ad/dIbr73ph7rC/fcCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VvDlCG4c6f4GqjA3GmR/dwaEKecr/3w4H3r7Z9i3z98zVPLrTATO2GZHaD4VMuT/xjQbZ0VB6NWvwv3lpurYX8nxSOwnrXRXlfphEf66+eRG2mAzRJxXuuN2b2wd+hM9Ahjzqw99mfOubYlWvunMiKHXQ/loO9kKn2CFqFRVm5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZmKMwCJT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso29811295e9.3
        for <linux-usb@vger.kernel.org>; Wed, 02 Apr 2025 00:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743580608; x=1744185408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+jxuGPpn8UhWBOA8tKb7Urwo73VrCOpJOvnus8QvT0=;
        b=ZmKMwCJT/LgmNU0R+H2loe3AlMHOZUHKagqjn2Kvwg2QdIv7vcDS91z/VJm5hGg4JG
         2ehtPcS5OiaHIfjBQ9E5L237EImcMTKEbA6G4hSOuAKpKhpAmDhcZcH/kvHEA6Q/UaZ6
         soRJxoLQOKYFsMdEEWs0nuv9iWIij2xu+9ALGJm33TL58nZ2D4O7BwUnXVllBApgfMqx
         L5s/3r1nI05kY/ik+brWgPv8PBVK0qlAC43xcN3phm0ta8QdJMu1DCWJew8rpbhW9KBZ
         xfPonZ/aJp8E1D663qYw9+WyfCFyCrXCfPhy21ddrRx66HcKJnJgV8jMhNXXJ3TOe3cv
         09oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580608; x=1744185408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+jxuGPpn8UhWBOA8tKb7Urwo73VrCOpJOvnus8QvT0=;
        b=E1SugQvtM3ER4vr3o3d3HURQClIpz/7tSJ+GnWUUcODQpc+i0q360czcWYHbcK1PE+
         LvCRPhyprbq4mSWBW7f91mpQex1kqq9Kz+yqQUu1AdZQk1UWxxtddo3Sk2/sTScP07Hz
         eri7I8oDfa24vNpaZRLvGZPuFR0sR0nO2Ab37gAjT6QbIzcpZhhsoWOCSxn0tHoNFn7i
         nPAPDIA+GC/npjjNDw8TLjwN43/3CO4cCT1rDssZa7W5EsYjY6MivqE6k3TyGmwR7Pbt
         2rx6ubwtw8Z605ZSc0wJZHNWvQWMlpLQymmkcesh/aSEiR1onCfKnkPyInlaQl7cyBS7
         YRBQ==
X-Gm-Message-State: AOJu0YxBv11010tmyJBFGxuPEuobD+XD+9NiFY/afa6fhxyhkuq4yVXe
	VehSyFIH+q0mlYomLAD0lQRC0oyTjVQm4Y5GBHyUOONG6YXRuVgg6wkxvMRVWZrB3/OXOR2LKJF
	yXAk=
X-Gm-Gg: ASbGnct0JKXXl/7/m8OTdKXWYXIHDYuKkNKYhjFt1MXeP0hwq5Ir15b/5eSI61atr0/
	unesXPiZrbMLGbbeCU5s49g0p8rWXgAC2+iyH2JbTquV/SlkZrDU+NlCBitkouqPsfR/W0yNv/5
	WcNrLRyljRlcphTfVMc2vpVmlo7SaApkhd5pI4gU2xFm8NcmOhROODnsUbhiHBzhXsX/XXphqQ8
	JKD/hSj1nq6tuRY7ynHexMZm8fz2eaCr9EoTGYsd74ne9njLpZ0h5AmX4jU80dtAo+shXJ9xEwK
	g84MT7Dnmzj3ZvxFpAKwXnPfnY0N3vFDIK26xXc8UgCR7RJDB/XrcZ98TXRSrg==
X-Google-Smtp-Source: AGHT+IHvTxuEMCGhj1rQb/thcgAqbETdIYWBUjTq1KzR8rsfmgOFTJotr6HWFaZUMQBRcG3NuehSow==
X-Received: by 2002:a05:600c:190b:b0:43d:224:86b5 with SMTP id 5b1f17b1804b1-43db61d75c8mr143982905e9.4.1743580607807;
        Wed, 02 Apr 2025 00:56:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm12336445e9.29.2025.04.02.00.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:56:46 -0700 (PDT)
From: Frode Isaksen <fisaksen@baylibre.com>
To: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	krishna.kurapati@oss.qualcomm.com,
	Frode Isaksen <frode@meta.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] usb: dwc3: gadget: check that event count does not exceed event buffer length
Date: Wed,  2 Apr 2025 09:53:27 +0200
Message-ID: <20250402075640.307866-1-fisaksen@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frode Isaksen <frode@meta.com>

The event count is read from register DWC3_GEVNTCOUNT.
There is a check for the count being zero, but not for exceeding the
event buffer length.
Check that event count does not exceed event buffer length,
avoiding an out-of-bounds access when memcpy'ing the event.
Crash log:
Unable to handle kernel paging request at virtual address ffffffc0129be000
pc : __memcpy+0x114/0x180
lr : dwc3_check_event_buf+0xec/0x348
x3 : 0000000000000030 x2 : 000000000000dfc4
x1 : ffffffc0129be000 x0 : ffffff87aad60080
Call trace:
__memcpy+0x114/0x180
dwc3_interrupt+0x24/0x34

Signed-off-by: Frode Isaksen <frode@meta.com>
Fixes: ebbb2d59398f ("usb: dwc3: gadget: use evt->cache for processing events")
Cc: stable@vger.kernel.org
---
v1 -> v2: Added Fixes and Cc tag.
v2 -> v3: Added error log
v3 -> v4: Rate limit error log

 drivers/usb/dwc3/gadget.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 89a4dc8ebf94..b75b4c5ca7fc 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4564,6 +4564,12 @@ static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer *evt)
 	if (!count)
 		return IRQ_NONE;
 
+	if (count > evt->length) {
+		dev_err_ratelimited(dwc->dev, "invalid count(%u) > evt->length(%u)\n",
+			count, evt->length);
+		return IRQ_NONE;
+	}
+
 	evt->count = count;
 	evt->flags |= DWC3_EVENT_PENDING;
 
-- 
2.49.0


