Return-Path: <linux-usb+bounces-24177-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53385ABF607
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 15:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 334324E699B
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 13:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66903272E5E;
	Wed, 21 May 2025 13:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIfoq1SG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B634CB5B
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833877; cv=none; b=ZK1Whi2GnqjxJ9/8lOb1i/K9lfSDxjcGyXsSVv4KYVytV94m9ulUFRx4oO/XYY7lAk33yXt1RunS/d4c9fQpgy3XE1A7X8WT39J0wgPkvuTrtuEAOZuVpFjMF80xBrs7BksxkkSJXcr2XWGftEWdGbYyRQE8szsne/uXuJMiwL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833877; c=relaxed/simple;
	bh=k0qbgKoGA/cLo/DJ7K5sz+nno6c383upNoAXZhFrwLw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GSlKrifuSTnD/OXdXvbKXJIni0ycvR08Wv4icKarKcOoMA+jqS/7qUE6Sa7piWZU7cED3U4UMuBuE9kXexx+q+fhHw7lwnyDGqJ/+ejiRgk+mmwxFZY2xT7IqzaRbBq0UjMzZg7xsblW7alYBr2LGOjdxY9/Dq0hPkARHrjm9m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIfoq1SG; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30dfd9e7fa8so8226367a91.2
        for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 06:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747833876; x=1748438676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LH9dew/GOdcZZ8B8ILvk60OTDgQSO4PAw2t5j0DXz5s=;
        b=lIfoq1SGGlfLXVWu4scHI+BkJzF27BgurvPqVaGQw9wt2oU5d8eZT/3Q2DMIZlqknc
         b4g6csZnfPSt8Dldopd+XtP3t6Tb32PQxrChcWlGuxyDbYukWS+OZPtdqi36MyZ9Ufnf
         r24MliTQd7lmsmXEdYbY2vkAK/MWOMl/QRouODJU+hQ+mfoY/KSroBqZrPwUpsn5pFQb
         PVqDeb8FNvJUDTVUiT/3iSzXF7IuTdn0FoSomMBTDoJwri3RorR86FlVYoamgFKE2ugK
         j7iXBw1YFZqN6UfTxMmN4dPtoCTd0+HPG4yYLG68JAMN9htPYihpAszdDgE7Hm0QKdH9
         cqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747833876; x=1748438676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LH9dew/GOdcZZ8B8ILvk60OTDgQSO4PAw2t5j0DXz5s=;
        b=TSEGWU1nditQUh9ziJKLfv8JDKdiNKKWRYqmLZoYqGNdGFsVmbIQHs1qYmGeL+HAh6
         2f2Y6whrNOB6v2pg7kUkaEQjl5ZXpo4H6uFsQpQaAM4+q0Xw4/oXbHEr/kMow9zE9OLQ
         3zdvCn4Kuz+/Sc0GerhoBOM8Mopd6vjG2qitoDHbI2MX3NLML9/AsHn7p41mH9hbW6w4
         Xrcc/ZEKj6Irp88/TPb/mKZkscQaUk8f4pe108sEz5DwU6cUX+VRMk2KuHg/owv1htgJ
         jSqzrRVtVGkQcGSzrxNgJQFWprrwhJEx5rtnaaRgwoQBX5sqLJ2pnhU24WjKGFjaqHFq
         LjMg==
X-Forwarded-Encrypted: i=1; AJvYcCX2mm4i0Oq6elqXHWyvvU8t5LHQ8Nxosk6+eeXlYahX6HjHdPT8n5B6ChVMoxT9wXZEcEV+PuC619Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZpQmGbJr/V2CwmmM9DSqhoDZWmTkc/twFq2lfCaIBYji3I9KG
	RiJs/DuRZH6lC2OJXNOQ+StDgkvvyPfe9EcljzkFS4PIdGxKcKTWT+qEIDwQE49Z
X-Gm-Gg: ASbGncsl8zAHE0y7CYMD+UzumMOS/fHDTYrlaMAEulDGJ1XNIQ+h5TM5Olv4rsGt/AX
	Dq1/o3KpYobyQ6QUp9pJPr4YhxLZf2mN7UNXjQr6HAe76Ivw5Fu2qdhkNjTqIPZp1LwoxJKoP3z
	HCQ0+t2cBhj0NBUTeR3fT6EysYx9gNrdEy5zaZEJzsnGxfCbBXAODDLAaWxkU0RjV5+j+uK60Fd
	fgWh3+K1sX8/yv9oksrw+NTAec4kBbLnwZ1H6cOyra4GI47lmcw+IZeTgQnJCNEkQExWS2hviJS
	sRdbjBArpGeYENQY6z7cnDxgMoL9vqUf73GMXPx2mlkiMUKsWyvi+7B3gVqg0eraOSWd6mAXp4z
	0K9v1BxTMZ0GWTVNMMd6uhjWwL/YUxs98UhTmHd+g8bTNZEabl6LEfqGJxcAXCuwpD2sg0kh4Y/
	jp
X-Google-Smtp-Source: AGHT+IHXGWbFrmw4pezRZgJlJvllnwNQlkt1vp2t6x1K+XVN6ImTGiQmKk08pTU6+H7cYZ3CkW40YA==
X-Received: by 2002:a17:90b:1dc2:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-30e8322593dmr30513947a91.27.1747833875616;
        Wed, 21 May 2025 06:24:35 -0700 (PDT)
Received: from localhost.localdomain (2001-b011-381b-1984-f1b7-fd3e-8a1c-51a9.dynamic-ip6.hinet.net. [2001:b011:381b:1984:f1b7:fd3e:8a1c:51a9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f3650008bsm3627803a91.32.2025.05.21.06.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:24:34 -0700 (PDT)
From: Charles Yeh <charlesyeh522@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	linux-usb@vger.kernel.org
Cc: charles-yeh@prolific.com.tw,
	joy-yeh@prolific.com.tw,
	Charles Yeh <charlesyeh522@gmail.com>
Subject: [PATCH] Add Proliic new chip: PL2303GC-Q20 & PL2303GT-2AB
Date: Wed, 21 May 2025 21:23:54 +0800
Message-Id: <20250521132354.1104-1-charlesyeh522@gmail.com>
X-Mailer: git-send-email 2.32.0.windows.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new bcd(0x905) to support PL2303GT-2AB (TYPE_HXN)
Add new bcd(0x1005) to support PL2303Gc-Q20 (TYPE_HXN)

Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
---
 drivers/usb/serial/pl2303.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 010688dd9e49..22579d0d8ab8 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -458,6 +458,8 @@ static int pl2303_detect_type(struct usb_serial *serial)
 		case 0x605:
 		case 0x700:	/* GR */
 		case 0x705:
+		case 0x905:	/* GT-2AB */
+		case 0x1005:	/* GC-Q20 */
 			return TYPE_HXN;
 		}
 		break;
-- 
2.48.1


