Return-Path: <linux-usb+bounces-31079-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A87C990E7
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 21:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A9AE7341042
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 20:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C118F27E05E;
	Mon,  1 Dec 2025 20:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5DBXuTN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80472877E8
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621467; cv=none; b=jZNJs/2BzAfgYlgDo5UyVm+H0LQrtLB1Jn2MWAm5U9GETLgaR414j/vgSfFnuGe7gQt5fIcgdIEyPhdGDGUOJKA5rRVvquejN4N4gBElvO7l7frXFe6/6OhpnSY8RtYiwswpaGTsQzyi2VeSpol4gKQLCJTusdmv+Hbnx2DfPhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621467; c=relaxed/simple;
	bh=+z7MJUYb60LpP3DCrX45OA1BaY4HMzD8WKTvs9ZysQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pfmnhRUjUEbyPmMJ4SIYd7hYTYZHnn1TmXk0UCgr6ePjeLw0xR/gq34Q8DEjNV4GrGpPRUT/wByfcFz48VlOUwJUL9JG2mfbzQ/Fu/JWx5kGbPn5PlYUnZEwwzYmDjE3jbsuWAFJ+SRb7NzlQnvBJSL5DsNEnhu5ZG6Fw8xjlt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5DBXuTN; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso4050008b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 12:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621465; x=1765226265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gma2nwegmLLD/sSpOFo/G4SpxpRQHV3w21+ECcPjv/8=;
        b=Z5DBXuTNNYvkyXwG1eq5HLl5fW92P1FZxBFqrceVUFlLWy5cZXYtochDEvn2dYts88
         /ob12QdIjofpU3clC7NqjUbCq1Mg1n/xwo2nWFgV+RrCXGHwZH0tBwdMQdIf3Byc/z1g
         8OlfiGU3PdvZQZvOEEjGIbYv4vp6iXBdsMGmJWJlS61DZjChnBa2nX4ysj6YeIO5c9cl
         jE5K88sbML9zW4tD7NTRDE5E1LwiKsUtHI3f4quMhVMXl0jK8G1zdkY9tFBOTEH1PkCx
         OEqci3/1YBv6Ng53eC0/1gcc89ZnHHvAJJnhC6zzmy9cvs8X6+obWGtWA9f8ZWcSSHVj
         gEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621465; x=1765226265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gma2nwegmLLD/sSpOFo/G4SpxpRQHV3w21+ECcPjv/8=;
        b=UWZNlPOzF0jiE3emB5Okbegu0m9AY+ViX4PNY1Lxob6NdEPIgVXJ1dldjFGYcp+Flq
         sCOXGuAwb+YS26QnjJaWdDnHnpHmQwgi5ScNbq4r/ZcPm7JOl7x3USe5bXFbn7c+WXVq
         yEn2ZbCo5UP/QpmX5zASf+KR7gA20Sm1FOSGjmSTrrrTobvDsGS/pOeqi73hYi6tnwm4
         x1Ewnz5CAliY7E6Mk2+VJbGkvlg8v9WLsrEcu9OFI2wX+/D06Df26h23sXRZmcU/tF3O
         xjYyTaDNc0KUZ5q4K7qbAYsZDaWEHButstPt2MtBvaW08+XZfp3gBp6sqElW/D9eJkaQ
         SgUw==
X-Gm-Message-State: AOJu0Yy2/sSIfQSCEIpQkNu/uk3ffA96kfWAVSDiukH6420KsBxa4jtr
	BlB8PoE7lLQiTtqzQ1oi+ic4GtfPf7KvJrU6aNSA0eh7JViKH6a8D420
X-Gm-Gg: ASbGncs0AKtxsNUaHmkQy21FRQhEJ502NuBoEzIdH3BY/DN9zbafGcEt+NfSKknlXgc
	QGeSjEAEr9p6ud5aBlo/cpUi8PaIMUM0B8FDRk3SCW+iI0nMnym3zXh5HdoZfV92BvATsieeBzm
	W4lB+fZyZpQOH30havWvrU4NjwSN6mS7alA49FN+3YocZQTCtksaKn48JXx/3MImegcUY/Odt+7
	MkmJn1/lVKBj9/1DIGHiV9O6nsPS/52PKxJ7z927HTSk6zMLmmHsTjV/lAMzIvY+KH6nd9BY5re
	PGTBJhkt96pg3s6AxyhX1dm1HAz8jIxWqyKPXU1P5I//TpL/Kdgp8MlZ65BCgCTvdaSPIcP9e8q
	RC+J/J1PHerxtJdnlRD1nozRKmEYBr9aF9MdaazEPLuScPyT85QpQzpccG9kECD6+YIFyMop7hJ
	huxQIAnMh1ExOSv+L2xO7caWQshIMIC1Kubk4=
X-Google-Smtp-Source: AGHT+IEv6qggrkagHbHFmeDaBh6PQo2B1iDXMGqdGjyVpT30HqcEFvZQJvlPoYcmGYPdnYgzjepe8Q==
X-Received: by 2002:a05:6a20:3d85:b0:341:6c8a:5218 with SMTP id adf61e73a8af0-36150f3539bmr46099057637.56.1764621465159;
        Mon, 01 Dec 2025 12:37:45 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm13113892a12.3.2025.12.01.12.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:37:44 -0800 (PST)
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
Subject: [PATCH v2 5/6] usb: gadget: dummy_hcd: remove unnecessary parentheses
Date: Tue,  2 Dec 2025 02:07:14 +0530
Message-ID: <20251201203715.17768-6-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201203715.17768-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the extra parentheses around the if-statement conditions to make
the code more readable.
---
 drivers/usb/gadget/udc/dummy_hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index cbf9dbf2a..67b453620 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1407,7 +1407,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 		int		rescan = 0;
 
 		if (dummy_ep_stream_en(dum_hcd, urb)) {
-			if ((urb->stream_id != req->req.stream_id))
+			if (urb->stream_id != req->req.stream_id)
 				continue;
 		}
 
-- 
2.43.0


