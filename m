Return-Path: <linux-usb+bounces-31077-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5534DC990E1
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 21:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 502BB4E20B9
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 20:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D5D285CBA;
	Mon,  1 Dec 2025 20:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNlSNMjg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFC3285058
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 20:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621459; cv=none; b=vEexgnR4wGZjlXVHMgkGwsoGpNC8hQUsJtv6YzUVPye3xT94nweClOgmbfg7fn7SJW6Xyl4Y+K23cpTxlNl9b8nP0ySPR1H7VYu0da6TyFNlCaXVXovklGh8dqJwO2WVbEk8OGdUr4Uh/HMOxISz5VK+eK9hhL+v8QKtHlGGBbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621459; c=relaxed/simple;
	bh=2OV1vA17nQisqkFji+r6uSJUsr6kObVd34VeE1DNE2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T6gszWLjnbSK+bHENNDmLVJJ5OSX1UbqIU4IbFseFcR1zA4BAuGybSDSO2Gm6j7Xyvqk8r8Qf1MPihSZdtp44N1WVB1cKswWwuLCAuM6IBJvN5rBxLFPTFniDqdpYMjmcDsvwukz8iGlHzpmG8rOwGd71WPS+qjr8BBunqz8UrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNlSNMjg; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-343f52d15efso4280587a91.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 12:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621458; x=1765226258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4ycNkEEiF97kKkbGcrEYiUPA5+jyVCF2v146XXFMKA=;
        b=bNlSNMjg4YDYwU/jXa4+cZlC+XrevH9T736uZnRHk1YEbFZ4q1uALsnS57pPkQ3rSm
         hDahBbaydd168LkoXId46cOHE0XMQvPnH7gKocTeq1zrtD5q929MOUfXAV8xqT16W/aY
         K4zfrmA4h1zpcphYiHcneY9ewDC9eUd9ukDwc78+2hphxCoWBf2AycbCWoVGwkhYzh+o
         CrpCZ8s18A6YtXSgYrHR3S4fqejNTuD2XzwG9isujdWtRFvIZL9fC0MXAg5f/Nn8MklE
         w7vodh5efNBx//d9dsrRa8OSgJcLzxs9puAFFwmcqqH6KbnrpczEoWUxGlThNXKLibc+
         FXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621458; x=1765226258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F4ycNkEEiF97kKkbGcrEYiUPA5+jyVCF2v146XXFMKA=;
        b=acWFknMu9+N7k+tSRdfAcJB3aJs+g2qlR2r7ULGua1W1PbM2NX/SZ3udzfFb0D3e7V
         U/jRrTQx+1hfa4uOTbONCkZFb5K9gdRP+74NuxKiHW7s/PrA2zlM6mX6wEmRdfRs36FR
         A5/zhYQWy0dCvT8YkTQPex0YTi+ATwdFs5EqP/ZNMAp/Upe+46ITdogoQb4WM6MI5f5b
         Zv+ewlN6j3X8BpOpBfZXZuPlKUnGzqqohuQFcfP2mIyN4xBxzhlExMQEhJrXyK76+4T2
         ryr45mHMGjUMOirc0F7t3ZjdDzGTJ8+/ChMbAcCGvCKEyy5E5xwzCWYQrEPchN7Kmsfw
         CMBQ==
X-Gm-Message-State: AOJu0YxMQExiRN1hoX3NH+K20Tkk88D2Aa89FYkRSDbBh0/I00aSl65w
	fQN1Ch3f92kA5NEqfXiBbVVqFttNTFNj4AMt+nEsUxxK6WvhvC0rq596
X-Gm-Gg: ASbGncv2xqnPglpC1tJRsR/HbYkaVBEUgGsHGgsyRT5fFuSI/mZUOMXBgOOv1lGF5dg
	oa8D+QCTqHFyq/VrJMa4HG71LDrbcZULw/ARjCcgiQoOA/l7YfM+rbK3uQZkElU77GseSrfXX0B
	yKCfAh+ZCTNB4qOvJ+DU7ZIBrXdOi2AbpkCH48ihw2/xa8ESeo4iuVFWGwNRqy5FIbqW4q20FmY
	KBZagoLMq9act4xmhuINS34eVOV57y1A9DLr1aCybbDn3Pe+a0BySRfrHlSrhxvEe0M41rYa3vv
	kT/AOh4RkFTjPOKKQ/Za0dmizoi9mRR9ThWfbwhsY/PMi5XuL16z/vmp+qY8MhH/cOq3IKTV/Wj
	1HSwN+84wVoYKQwRab/JmcXSTnDNTSEf17U15BylVa1klrcnv/560H8Py/XbDyhYw2jHy1vS84w
	LU4Om37/IbfofIFQ2bj+S2p7mxD8ae3SsHwMBPDaWIKmIUxQ==
X-Google-Smtp-Source: AGHT+IEtZwyJ1h84xNpSd8cwSnswEJ6N/+iIfdUSDQxIm5UJsYL1XcBZqW6zMMJ2pg+7syQbAsGqDA==
X-Received: by 2002:a17:90b:2547:b0:341:88c9:ca62 with SMTP id 98e67ed59e1d1-3475ed6a904mr28534111a91.31.1764621457573;
        Mon, 01 Dec 2025 12:37:37 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm13113892a12.3.2025.12.01.12.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:37:37 -0800 (PST)
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
Subject: [PATCH v2 3/6] usb: gadget: dummy_hcd: document ISO endpoint allocation pattern
Date: Tue,  2 Dec 2025 02:07:12 +0530
Message-ID: <20251201203715.17768-4-clintbgeorge@gmail.com>
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

Remove commented-out ISO definition and add relevant comment documenting
the ISO endpoint allocation pattern.
---
 drivers/usb/gadget/udc/dummy_hcd.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 39b571899..e4124838e 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -151,35 +151,23 @@ static const struct {
 	EP_INFO("ep2out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
 /*
-	EP_INFO("ep3in-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
-	EP_INFO("ep4out-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
+ *	If dummy-hcd supported isochronous transfers:
+ *	- Endpoints 3 and 4 would be ISO IN/OUT respectively
+ *	- Endpoints 8 and 9 would be ISO IN/OUT respectively
+ *	- Endpoints 13 and 14 would be ISO IN/OUT respectively
+ */
 	EP_INFO("ep5in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep6in-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep7out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
-/*
-	EP_INFO("ep8in-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
-	EP_INFO("ep9out-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
 	EP_INFO("ep10in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep11in-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep12out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
-/*
-	EP_INFO("ep13in-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
-	EP_INFO("ep14out-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
 	EP_INFO("ep15in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 
-- 
2.43.0


