Return-Path: <linux-usb+bounces-19974-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA51A25278
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 07:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 697AF1883C78
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 06:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CE11D86E6;
	Mon,  3 Feb 2025 06:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="Z7yLRfX5";
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="HbFTB/e0"
X-Original-To: linux-usb@vger.kernel.org
Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294F5111AD
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 06:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738564438; cv=none; b=VssSasXQ2Bpq/FTSzj1j2i5huSTjVw2NaCgoJg4bMHtnfKzFy4M0K959R9svM4QB8lqrNvWpERqfWnk2J3ULtswRWvZC49d9wZDgbHlDahUdLKSiMeo3nVRJoTMGaj6oIg+4KcfCpbJKcme4wuIiJqXU9SPc6/sNHz9FY0xoUYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738564438; c=relaxed/simple;
	bh=NyyLlfGGKp2WMyAP4kO6XZqyeNb8IGXzBeCYo4639nY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iI8qUmZa3+Sj1wwUJDP+rP4IPmgU68xapVvzig6JxElF5KMAh3qumoXlmCincuR1STfNy11DEAiV0Sr1GfWskgcZdQMMWT6WE8R+Bw0uxsnPI0RwQoi/Ca3aOxTS9iIac6fKgGN1qt4g5nB44tEkh+PqhL1HrCSbmU2E0kmQvB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=Z7yLRfX5; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=HbFTB/e0; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1738564436;
	bh=NyyLlfGGKp2WMyAP4kO6XZqyeNb8IGXzBeCYo4639nY=;
	h=From:Date:Subject:To:Cc:From;
	b=Z7yLRfX5q+zcKS6xNaxs4zsWHablGBhBtz97a0mPaHHlx19orBCuNvy/8I9+QBU8N
	 fOv+TPJ4xwOJSD+L5EXtyTvRRf5hpQ27jWq1FTB3kRWxNQp5WQVFqFBQFK7v8kTjkz
	 AT5vAII2Hx+8GUa+b+CGSaE0h8WTf6DZiDhpoqe3Fe7ByfHQN/U4iVnvmvhvY5KeFA
	 SU3GT7b9kFmfGPYGrxorGIypnwHPtPu+ydUpubc9S0w/u3gwgVodQLsexa4tS5WOBZ
	 LAz+BRIN7OV7S4HpGIJn9PGSLJiqr901wOq+0/bHnzjLsLwmRQavswP4QFVxcjnWuK
	 G1IDBLHSPJlBQ==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 20BBA370
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 15:33:56 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=HbFTB/e0;
	dkim-atps=neutral
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 7CE4D370
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 15:33:55 +0900 (JST)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2162f80040aso83872805ad.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Feb 2025 22:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1738564434; x=1739169234; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x2QS07A4S9jTptdRzayiylbpiM6aCKrztjCii/J98D0=;
        b=HbFTB/e0FxRYNKnIOoVvqdn62EHV/pSUoo3OBpnteyE3t0z31W+GW5AVNU7Xp6p4Zr
         5nBdMK71XXLleALodPabHNwIMCseNkq8oerVBJgENhXqqrK4OTYslteSCukbmhGVm0vn
         BdsLmFvdlIZLxs39TNUENgcmPi+6EJqQNR389rP1Nmtt8TkjCo5VDueNkkAsbOrICbuH
         GF35KfXsrEImBwOgYHzMw2IRN/2+oyFnz1nt0r7TNanMknNQpN9o8hvudH410ag1hgYX
         wNlVinYYFQbhUg/7mmLMkun+YzWFXFT3lEUWjV22KXtMrd0xaTrTKW/jHxuJ9M1bxDrH
         wjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738564434; x=1739169234;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2QS07A4S9jTptdRzayiylbpiM6aCKrztjCii/J98D0=;
        b=BWhxpLUZXDmDUnPCDYN1GNM/SkNm1ncjHP6Tdz1+suairFRIxVhl9MsD44PAx7nY79
         XJjpc1g5o8ouahHg8vQhJ49DatCsUL06a+sybbjIRb0gjWC2yuF9zNY50xJYD4g0EloL
         0jxjnmKlzlUr20d0W1T9yMnvs8Map4fiLjokQ7R2AxIa315HrD++r0K6oJMJ5+nVXMSw
         lhsz6eSeYhFCXZCPS7NSVHtO9/qqgrBQqkhB/9PA650afBKq0rlTWfeG1Y8FWvPDHAwT
         821QZkXDJ8GmZS4xttH/Op8YNpxBhAIWDANXWextS9TAwqew2ETTy5ztDh/Ev1XpxHgb
         vGhA==
X-Gm-Message-State: AOJu0YzyRtvINLkSxZrxFLXgnyT5UKrwfTGbpxtNH8rSaiZCoW4y1Lnc
	sLTZdGkszRxU02EPx1Zk+YYnzBQz1x3lgfdFKQulHYkRx8cVx3ZNOA9K0mVDoZqbsKJEYosRv9m
	hc+JhlXeRlPeKfXX8Y1PUAe8/Z/VCREc8Dm5dm9wAqKSs0nwDwiIDF24Qyi5YVqvVGo4=
X-Gm-Gg: ASbGnctOL/2X96qtK7LI16bvdOMA1ab1DV8yPNeipW8n3QPt7IYeGs6A3wHQsSdJK1A
	ZgBmX3ZtS4PzNLD8Ei3CY+MuKynXhgJKsjFRi5LUJc9WDCI/gRtkk0lquNfh6+w6VEUxCuL/ktS
	QBTFC754ke/n9LOhNl/5RVaNIwQkRbsWdpKT/JBj0bN1jv92xZaEXuYd97b24Qv/UYkY2UskeZ+
	9x38cJZHuPi1R99lxZ9ubcK2Rv2NM2eiyWmetwKBLldtly8pXjS2X1ZNMy9fRqN7Faki1UIO8h8
	Q+UTMITpn3t8LjkBFjxHHLPmUDULAVr+4au+URqLeP7vR6Lq/Nmg6UGhoQftYURK
X-Received: by 2002:a17:903:2990:b0:216:527b:5413 with SMTP id d9443c01a7336-21dd7d7bea8mr321391945ad.26.1738564434511;
        Sun, 02 Feb 2025 22:33:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsaiCMJVKFBD3vmYAtNcDjDoJe6oVNc4pxxqNDmNdxCM1zjrnyp/Lky5JFY5rQBO4RM+YL6A==
X-Received: by 2002:a17:903:2990:b0:216:527b:5413 with SMTP id d9443c01a7336-21dd7d7bea8mr321391665ad.26.1738564434151;
        Sun, 02 Feb 2025 22:33:54 -0800 (PST)
Received: from localhost (162.198.187.35.bc.googleusercontent.com. [35.187.198.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf9499fsm10365776a91.33.2025.02.02.22.33.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:33:53 -0800 (PST)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Mon, 03 Feb 2025 15:33:49 +0900
Subject: [PATCH v2] usb: usb251xb: silence EPROBE_DEFER error on boot
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-defer_usb1-v2-1-eba405ebee2c@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIAExjoGcC/23MSw7CIBSF4a00dywGUHx05D5MY3hchJiCASSah
 r2LHTv8T3K+BTImjxnGYYGE1WcfQw++GUA7Ge5IvOkNnHJBOd0RgxbT7ZUVI1zs6ZEadtL6DP3
 wTGj9e8WuU2/nc4nps9qV/da/TGWEEXtQSnaQM2EusswyPUhB7ULc6jjD1Fr7AjGfoTesAAAA
X-Change-ID: 20250203-defer_usb1-254070d18cc9
To: Richard Leitner <richard.leitner@linux.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=NyyLlfGGKp2WMyAP4kO6XZqyeNb8IGXzBeCYo4639nY=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBnoGNPldkjLVvesDXhQhcN0CNqSws7SdpJuvAu9
 rRYO3rSa9eJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCZ6BjTwAKCRDyimB/1oxx
 B0RlD/0W8AaS50+8/SEB7mUaS4N6RFRnftETBPeAsGkO8IA/CGCln6pzz0DvOdKQsHbDc2FHUjg
 qAP6KmvTzeu0EC8SdgNebhKHgS6WT4NLA9Xua2mu3eYnQvCNVouYYQlBkNUydL3+Gu2sGRjflau
 cBLw/e0+ysdXLM2p/SHvlv7Vk1aSI5cIhS+3GE6y1hkpDJfgsz2a4YMAb3XcNK5lT0qDLveFuXR
 D7wjZ45HyykZmiyrsmfIw2I/9LFzwNSlvkLjevpYs2UD+TRUaPcBV0hS98wA+6f0lDF0gmYLGJV
 UT568cbzOxJ8bhMqWyBnfkX7xNIRFzSVLfOpIFg1OX7FU9p4sdoU5o+gCYPRyj64UTG3UN+swd9
 F9d3B9CM6WpcCxvq+wJQgwVV9PRwojYjPXQJd0VQSPSPG+ENMEqJpzyDIttx6a0YKms97F+Tx+F
 xkAaqQw/DPzOtcqN0SAe25B0jnlMsG4zW6ysxfIyFsDpGNw68Z4r5JGI+k9Q2y2sak2gPvPBsd/
 VTM8Mr2s2+Cv9tDE3ohznejfyPuR4GkSd8PU+OHS+N1Vq11G6tS4DbIunDaq/E39gSWfsK+SJ6R
 a1TbCMb4csRYt5keh4p0y6Z2j9GP7eK39lEqAeFmRn0sApAihu/yv1csrUBQCt82YsKuuUhFkDv
 q8ZKobcKCzsiL3w==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107

Use dev_err_probe to silence EPROBE_DEFER error on boot:
[    0.757677] usb251xb 1-002c: failed to get ofdata: -517

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
Changes in v2:
- removed redundant error code in message and brace
- Link to v1: https://lore.kernel.org/r/20250203-defer_usb1-v1-1-f6bba254215d@atmark-techno.com
---
 drivers/usb/misc/usb251xb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index e24cdb667307802b9eee856e20744ebf694395e8..4fb453ca545013f8b89c43d3bb5cc6d1c53b39c9 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -636,10 +636,8 @@ static int usb251xb_probe(struct usb251xb *hub)
 
 	if (np && usb_data) {
 		err = usb251xb_get_ofdata(hub, usb_data);
-		if (err) {
-			dev_err(dev, "failed to get ofdata: %d\n", err);
-			return err;
-		}
+		if (err)
+			return dev_err_probe(dev, err, "failed to get ofdata\n");
 	}
 
 	/*

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-defer_usb1-254070d18cc9

Best regards,
-- 
Dominique Martinet <dominique.martinet@atmark-techno.com>



