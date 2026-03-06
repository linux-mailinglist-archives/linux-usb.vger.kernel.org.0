Return-Path: <linux-usb+bounces-34141-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAwVEeaZqmkxUQEAu9opvQ
	(envelope-from <linux-usb+bounces-34141-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 10:09:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 994B121DA3B
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 10:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4868830ABF49
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 09:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702D033D50F;
	Fri,  6 Mar 2026 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRW28Q8b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F22A33B975
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772788035; cv=none; b=oH32WoNc4W8jdq332vmtwAa05WIKk8juKXLcIvJuXr/n0VAXloSiaGKNHusMRJZ9bYJnnxWTJJaONjXIBbkq6Q6+6jmaOZqH/pdgpreOR0kH8bJAo/90n/1jeuOja33mH397fLf/NfeonP3a4V6EkWbXImmQzLHn/r3LcuaJSrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772788035; c=relaxed/simple;
	bh=fmpuIUrjXVvpSnWsUCR4SK8dYfNMcvPYl9aPlUXcjko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=be1iWPMFyIShErFaI58Rd/1ZKDlne87tVNHqkl7Ew2OyTy11eSMqCjvX1nVFQRtTCx2QLIYGiz/n9RH2BCv5+QOZ/kwHajRmD0CwZzy/X79xtHzWlzznt3yLVoZGr+QztkTlI4fC8CfQCX/YOYmMmBnYnqTgzglf7ZQJY3Tp7gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRW28Q8b; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-82984c077b2so951965b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Mar 2026 01:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772788030; x=1773392830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/XkAPBi7k7ykpD0UT2uW0E/tNzSIZSxb+xSJZFxgiA=;
        b=eRW28Q8b8+QLiZXkM3PiX+EjJM4BhtHblqUajEJQAGu7nzbb/N9pmtssQjq2dzC8yp
         vdh7xultLyYq+NiPjd4GUpihOpo/w53r8RodSVUq1D5ki7ogPwXM5QxKLEzA3XncHHIy
         alWIz7Xa5NHdIP8JuAj5zwu+vuhuPkLXEVB78R5iJPFj9d5AJPPopmMfpp6ljphyM86d
         +LhWQJN2ssqUuGvjxHTA3795HYKKQ8qocANBOx2nGxrCOQlghze9h4G6r0mph/LxRB9K
         KLTHg0HfgRoubLBHWbL5zVx+JucDL3DStADLDywGba+yUl29PGRtHGWvZIvyEdd7CB5X
         1AGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772788030; x=1773392830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/XkAPBi7k7ykpD0UT2uW0E/tNzSIZSxb+xSJZFxgiA=;
        b=vUEPSrUFEnIzfp4iCMYSsexgJd8Zf0UG7H+LfrhnantX1CTTIUpnadKYCbkb8/lqiv
         TENWCsVZte5v6JjlBoU2CwnXPcEByul+mQcucovA79dNHag8iQUBnKwwc/Fxlan3bFY7
         QytFcCE+MM4WX0+cXD3kM9zgy7EJtsEcsxe+omW8UjgsF5C5C6nAyHERg1fdzLQQdxl9
         TZr9R0H2Rx2QTyQZCndj4XZfJEKLz0UNSfBYM/4mc+pV5CNVodLsDee5vRgWlskceuNV
         xetDg9NVZaxLBjfGYkeRaSBRKxETJ+gH14PhAvlQhs7u8FhTKLNvzUlptry11R12e+B8
         h9qg==
X-Forwarded-Encrypted: i=1; AJvYcCVgizxCK6TWzhtoMptgu+hGOAuPNPcrVO0mcbJVJ0ElDUk5S2YQqvigb7T0ke+aHBJ9J+sDOIA3MR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq73i/cBgK7lNjMoW7B/dy3RvI5uXQu2oDlrKd1J0Azo2qxqix
	4wecGTdbU5geeZ1DVpfqSjluSJLdlnTAyjQIZSnJ01KLoX+NT6eh8iTU
X-Gm-Gg: ATEYQzwtW8mS6QcyeHqqIwE6/n1U3U15P/qj9k5bqxrCyMU3/Y9bvqzmm9u85mkOOIZ
	irR4i5U6uvXNTIj/x14CAJtcjGvDdGtX5Rp2LyvOxWT17xV/s4nmI6fN+pBTNa7bkX4aL/71ny8
	bin1N40PLxgDO267o18EaY8LLJAcnaq8qBmkTL+zF9roxDWkQwWSP5vF9c75fToICwuW85FTkUu
	CCmGyor1UzbEaiYorgREuw26sNSo/Ya0D0bwUvdQMwPHAnbZSnc22a/nXziUiH5sGjjqmq79+nA
	+/AezlQiesg5XcNFnEqFPI7heqxcU8DsYul7yHU5aAZkWui2XgGsidsI/4Z3zWXwUq5Ho+9oJ1B
	LGWIzvbq+1TY5U9fy4anxmGgw2xfEst8VbEO66Xj8qICrQxYsYOozgVRn7WNNI+1M9rzD4/3yUC
	2RSM5AHyd+4HXH8M+0+x/+spKAq48VvfRFqbolwR581VP45KB9njSbJAzAAJEGo5hKgaJN
X-Received: by 2002:a05:6a00:1943:b0:829:91f6:e533 with SMTP id d2e1a72fcca58-829a30d8953mr1341268b3a.63.1772788030538;
        Fri, 06 Mar 2026 01:07:10 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4867e54sm1166142b3a.35.2026.03.06.01.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 01:07:09 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-usb@vger.kernel.org,
	smatch@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH] usb: dwc3: gadget: use explicit 0 for success in __dwc3_gadget_kick_transfer()
Date: Fri,  6 Mar 2026 14:06:43 +0500
Message-ID: <20260306090643.47383-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 994B121DA3B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34141-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zeeshanahmad022019@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Action: no action

Smatch warns that __dwc3_gadget_kick_transfer() might be missing an
error code when returning 'ret' at line 1691.

While 'ret' is guaranteed to be 0 at this point, returning an explicit 0
improves readability by removing a level of indirection and clarifies
the intent that this is a successful "no-op" path. This change also
silences the Smatch warning.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
Link: https://lore.kernel.org/linux-usb/CAPBWGpEi77+sksNLazw=dtyA3d6fBn-r10917k1rEzwzT3M=gA@mail.gmail.com/T/#t

 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 0a688904ce8c..3d4ca68e584c 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1688,7 +1688,7 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 	 * transfer, there's no need to update the transfer.
 	 */
 	if (!ret && !starting)
-		return ret;
+		return 0;
 
 	req = next_request(&dep->started_list);
 	if (!req) {
-- 
2.43.0


