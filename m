Return-Path: <linux-usb+bounces-31076-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D79C990D8
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 21:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 21378345B5F
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 20:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52AF0284896;
	Mon,  1 Dec 2025 20:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LU+y35Ts"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6452C284662
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621455; cv=none; b=PNLxpOA69JtEK4qhJJr63A7dOqGmdv3dk43MpOzWjr1hjlmHKm9He5spboU8vqwiXzlRbrYADXQ2icfVl2dyFkDqNAjZUdrc4LPJZGg4f2oqi3TYOInS2DMBtCvg2fuTxzdzp/85bNyemzV0guUxhlEV8AkCOFPUaNuxF1Nz5FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621455; c=relaxed/simple;
	bh=ulUB8KEvP4vIj0I99RHhhlg9mGtE59OTbz9tn/axA1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3Em7EGJm/hlZYJKbAXfqDmWsHGO4FkE6HcHhVtshIt40bXcpMwgWd0hv7l6k1Wq9AKw+7TfVd2Dbgz0OxnaJztkTDePItsWallPi7lme9PRLu1fafqO6uTvnOECoUtfd2bhSB0uiv1k2QfthXCnP4GJhLRe1aSI48MHuqtuWW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LU+y35Ts; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7ba55660769so3947060b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 12:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621454; x=1765226254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rddN2NbLsRsXaz5nK+hoW97gJimLd5zvIjhD50OcbhQ=;
        b=LU+y35TsBWSwwPs5+lfOPkSxcvVNT7/wpssiCpkLEnNuqk5g7cBZnhB7dOnkrFGBEe
         bjWY0Kin0PwFySH/X3H/uDqoPPWfuGr13KhHE/BkLEGVEV0aYjx1JKf/Qnv5ywoR7Oh6
         k0c/3gXVSzvW0gqDa8G8vQUt4hVP02icqzB2SIHnM5gDtyFrhZCWX+lMOHrupnlFffES
         ajzvPOeiT+HXlF4qUN7ATgfI0OA4rYFme/fJFhr3THxF6PbM+JVPTkcUTmupzzGz7gVP
         /62dGLTJRP1OD/NXdLmfP/byQhRszBcEMkcsnszekYilTXsrzOcyj7OH6le4N171j0yu
         AIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621454; x=1765226254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rddN2NbLsRsXaz5nK+hoW97gJimLd5zvIjhD50OcbhQ=;
        b=dUcxfztIzkQUjSFGz41YAD1r6rJRH70lh4JBNbPzFLPyseyM4+CegB5FEl1fWUNuCP
         ZH4BKYA7ZBnEHT3WOBgTD4a485SVawZQ/R9svrJ8iCdyUZCBng7IcwG8rGNgZE/m8Ev8
         ewQuhx4VoP4RRhp0YMtZXmMxsn5KXI9APhlYOVhBurqdYbI5u7UnK51IwLcQbeqXzzwp
         IIhz/DE/deZkTdc4tvTithHzpFtMO1tZPlphFg0t2Wr7ArMvCzsKnZx/WKycLgMn44VS
         1nKJidQi6jg1kpJ0k5iddogY+z+aytwLzvQv6UziE77J0uSv2ROl5nUCcSOkMTv63Hq8
         maOg==
X-Gm-Message-State: AOJu0YwqUF5FhqJ0EI2XO+G0xldE2iZebUt2dtsS2TC9+2FkWvz5gPkV
	CYkan3cZYJ2h2XT2aDqDRtbOI+Mraz2elFVH+H5NC6DfsIBgP1Wcs/5D
X-Gm-Gg: ASbGncvFf+3nhw5EmCBlPl9mHGK6j5qkljha1585TAwWB4r8yfAXF8xezrkhiA9+4qK
	HZ3Uhs8dDzV3mL/OoRJUJBJsoDhFQIK3MRAXaEvGIjQ3lz+1NdKR4uslsTTPSsFuKNnrEt1WaN+
	NEf9PAWrzRo+d8/oDJTJoV0qEzoIGdRUZhIr7/aWsCieyr7IYorYzLzc0YZVgwHUTekbYNHF4EN
	CLP/FuN8clINxTMPMIP2+Jc/TKbSTS5sSg6iknBwQDSjTDzv5a82m8bfT4YHgPvdWMq8Ey1b+gi
	vx3uY/nl8NcmGNvsjWvrD0kb5YNww+bY1+kJU2DcCBMnsUkSGHD+CqqrO/NRUN/EwafHX0h5aD5
	WdvOUGC91OVDe4XJh6Jy5dxF4U1bkiwPGnxdoqq04jHG5Q4f299evc5D/x3KbTOF9Prg2VRoROX
	9O/pmXv7GKemkuxluUdfgy13xP0/pE2yKo0Z8=
X-Google-Smtp-Source: AGHT+IEEPQo7d9t7c6AjYuQvOyFFo9Jc2FlavWwe6HnggCJaRUGvoTe6BFxCVSmi4BX9k/Ck4u7Kkw==
X-Received: by 2002:a05:6a20:1591:b0:35d:492e:2ed0 with SMTP id adf61e73a8af0-36150f34605mr45146172637.52.1764621453514;
        Mon, 01 Dec 2025 12:37:33 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm13113892a12.3.2025.12.01.12.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:37:33 -0800 (PST)
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
Subject: [PATCH v2 2/6] usb: gadget: dummy_hcd: use 'unsigned int' instead of bare 'unsigned'
Date: Tue,  2 Dec 2025 02:07:11 +0530
Message-ID: <20251201203715.17768-3-clintbgeorge@gmail.com>
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

Use 'unsigned int' instead of 'unsigned' wherever possible to maintain
consistency with the kernel coding style.
---
 drivers/usb/gadget/udc/dummy_hcd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index fadd3d0c6..39b571899 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -506,7 +506,7 @@ static int dummy_enable(struct usb_ep *_ep,
 	struct dummy		*dum;
 	struct dummy_hcd	*dum_hcd;
 	struct dummy_ep		*ep;
-	unsigned		max;
+	unsigned int		max;
 	int			retval;
 
 	ep = usb_ep_to_dummy_ep(_ep);
@@ -1414,7 +1414,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 top:
 	/* if there's no request queued, the device is NAKing; return */
 	list_for_each_entry(req, &ep->queue, queue) {
-		unsigned	host_len, dev_len, len;
+		unsigned int	host_len, dev_len, len;
 		int		is_short, to_host;
 		int		rescan = 0;
 
@@ -1443,7 +1443,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 			/* not enough bandwidth left? */
 			if (limit < ep->ep.maxpacket && limit < len)
 				break;
-			len = min_t(unsigned, len, limit);
+			len = min_t(unsigned int, len, limit);
 			if (len == 0)
 				break;
 
@@ -1624,8 +1624,8 @@ static int handle_control_request(struct dummy_hcd *dum_hcd, struct urb *urb,
 	struct dummy_ep		*ep2;
 	struct dummy		*dum = dum_hcd->dum;
 	int			ret_val = 1;
-	unsigned	w_index;
-	unsigned	w_value;
+	unsigned int	w_index;
+	unsigned int	w_value;
 
 	w_index = le16_to_cpu(setup->wIndex);
 	w_value = le16_to_cpu(setup->wValue);
-- 
2.43.0


