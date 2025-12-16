Return-Path: <linux-usb+bounces-31484-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8676CC419A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 17:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9BEE43031FB2
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 16:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74BA3587C7;
	Tue, 16 Dec 2025 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iSLdp/M/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="O2Rp3LTE"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F26B35772B
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898060; cv=none; b=U1jYBl55P6ByQ9Q5OZpE+mXKGRnuZGXqzKVSsPFhnvMGiDjVHc2ayUMfdxRnRCc43WvTR5PlYobU2dKnGGp++I8c4TbxvVJqTWBK3H/GOd48SDc9Z1cpbxSrkGV0ikHrHwqaQbJa63hTXyr4i6zwYnS9EcOh6Vk2HhnqDzIj2VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898060; c=relaxed/simple;
	bh=l3aFcFIb/rETTTHoywtwScOBMd14d3C/McfXoy+MH7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fFYFTJ29kt/hf71uiNTmgzIsyt3hqSi+CPAv3/ZnnvlfMf0perV94zcQerC8qGniarP5g7HsUxmKZL5GOEnUpg/a9sUlS5JkIRWkLm7kHrRowC3LJlf+3uyD/Ps2Gls92Wd1kHRHylvW0h6DdxLpVK/IeEfXhHqPYCjlu6Lf3b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iSLdp/M/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=O2Rp3LTE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765898057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KGroo1FRQJLcCV21iN/HVdCn1Y2Qr7NjzdMpGVOhIKQ=;
	b=iSLdp/M/yZA/QDdLjwC6OIgbJXuZWv5pkYdUiGl20ijtFgbnMNoIccJpsIxiYzZolGGJT6
	Ii7EhmkBqQmy6Ra8sWKvg1+2PZlKiGGjMjB+JHrXNMib79yl/Ytblv7EYD+S0EYYnJkrG8
	41yvKPX4OmkH9D3QJcMD/TVTVHOrZqA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-HJNt36HGMY-9zHv9vSiWlQ-1; Tue, 16 Dec 2025 10:14:15 -0500
X-MC-Unique: HJNt36HGMY-9zHv9vSiWlQ-1
X-Mimecast-MFC-AGG-ID: HJNt36HGMY-9zHv9vSiWlQ_1765898054
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29da1ea0b97so120293695ad.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 07:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765898054; x=1766502854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KGroo1FRQJLcCV21iN/HVdCn1Y2Qr7NjzdMpGVOhIKQ=;
        b=O2Rp3LTEPAPHfbrnLQhN/g4LZBnNRN/U/p1rPmAb4+C+7HuX5CbY9P4LsbxtY1LrN9
         h5nHwT17bgW0pQbhmd0lZE/l9ZZSGtqLFduV8pOpReyFegvHW1cGmFf/euuyTmIXc9Ow
         ++wWt1yqoywvVzDf4QAGY+DoFFXudpJRcKzC+XHJPlnEVs/4h3FLL0tktoTYmtOpPelf
         LeLST5uf4L02LKFkg9fNkvaeZvirQoOF35MGTQ+ZwVojGQAF68cdSLcKKfsVDNmgp+JO
         Ky9yICpi3zlrRV/PbtgkCQlPTN3eY70mrKGr/iWB2sgbhanVxbMYORfkEkmfMrG1/3Ri
         SlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765898054; x=1766502854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGroo1FRQJLcCV21iN/HVdCn1Y2Qr7NjzdMpGVOhIKQ=;
        b=ruzNVT2zTyPlrAgUkyC8hzPwlYOcfG4E6GXHd8mkyIBBB1f7qEFLVjGoWZnJqSNttB
         aMY7rW/v/XyVv7YP3O2RgIjg4omwmJME+ye2pes4l2adaJW+WJjxgf+4gsoZ8GBN7kzu
         8NTSoDw+r6DHOfQS6Op8Em9YQMyTm4y5YW20R1XxqJbJfdLBFJ/NYv2poEd7pn2uRQ12
         seUZCHMyKvxjKBdbABG/AetMG3fi2mZgxxLSVK0RQhdo0QrSArCUq548SkwiNA/eaMyc
         xBJvOfmypzyor5uwTHlHtzexZDVXBqHbfd+DDcRDfMHVr7VcdpG75Ckha98FlCCG/INF
         zdZg==
X-Forwarded-Encrypted: i=1; AJvYcCX/dzksUfX2EfFSCEPHhXZ7TQWmO1zLK9JBLYonh0WBFuc1XEqC6/ICl6FyWbK5y9IgCyLj+K0Q6r0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqaaXbHN+EEUaDhLIYQQo44aMNsSkRpTax3f8ZPdbor269G8/2
	KvUPtrNf+HszCJON8N6ZoHZuir5VYibWmOE8u3CbEoi/LPQpttA4MzoZmoxFXym3MPAZbA14SzY
	qEu/YwcHwBAuPmhWT5AC9jCHEl374JDdVJi24Fhi/kbTLbPTSUt9+u3+reHld
X-Gm-Gg: AY/fxX7DSJygYZzYX2ULsAnRVlNsPx3imjmb5bKXDFCtMIPHUb6rxk5EXSD1ELUwd02
	1P+KNdmyxSVR4wrT6cPhI2rYJDRAn44Z16RRxOAj70Okmr39CU0JxnWIR5bH22FWz0+/Eulj0os
	proxL4s/WEi2jFTGIRfAiPGqhUUQjIKGQ1BrduwDYMLqQIY+y8ryKel719pm3v7e/y8CBI5Qibr
	SjlBqA0kYn5zoQkPESmX9jBO83a1tT2BoQWbreBt3uY3gn1wxXkRA+u659DNrSaxAb8Th1GzuH6
	m+qYzT+DCFaOXY/ZfBvMZkMXyVjinOerx3EvrvzFA/JpoXULPVoA0Ny+gxX+OMbO6xCQFv20ALm
	P2cQUqz3BQt9wsKlOJBoaY/L5CdH//sX+MihWKA==
X-Received: by 2002:a17:902:e947:b0:2a0:f488:24e with SMTP id d9443c01a7336-2a0f488039cmr72598925ad.28.1765898054339;
        Tue, 16 Dec 2025 07:14:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHreRegPQkGmWbCVch5XFt0fM9KZJ4HiBSvqPfGMq3/Z86mPrICGllWYxJgnaXN7I+HROG0mA==
X-Received: by 2002:a17:902:e947:b0:2a0:f488:24e with SMTP id d9443c01a7336-2a0f488039cmr72598365ad.28.1765898053897;
        Tue, 16 Dec 2025 07:14:13 -0800 (PST)
Received: from dkarn-thinkpadp16vgen1.punetw6.csb ([2402:e280:3e0d:a45:3861:8b7f:6ae1:6229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29f177ff327sm137688045ad.101.2025.12.16.07.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:14:13 -0800 (PST)
From: Deepakkumar Karn <dkarn@redhat.com>
To: petkan@nucleusys.com,
	netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8dd915c7cb0490fc8c52@syzkaller.appspotmail.com,
	Deepakkumar Karn <dkarn@redhat.com>
Subject: [PATCH] net: usb: rtl8150: fix memory leak on usb_submit_urb() failure
Date: Tue, 16 Dec 2025 20:43:05 +0530
Message-ID: <20251216151304.59865-2-dkarn@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  In async_set_registers(), when usb_submit_urb() fails, the allocated
  async_req structure and URB are not freed, causing a memory leak.

  The completion callback async_set_reg_cb() is responsible for freeing
  these allocations, but it is only called after the URB is successfully
  submitted and completes (successfully or with error). If submission
  fails, the callback never runs and the memory is leaked.

  Fix this by freeing both the URB and the request structure in the error
  path when usb_submit_urb() fails.

Reported-by: syzbot+8dd915c7cb0490fc8c52@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8dd915c7cb0490fc8c52
Fixes: 4d12997a9bb3 ("drivers: net: usb: rtl8150: concurrent URB bugfix")
Signed-off-by: Deepakkumar Karn <dkarn@redhat.com>
---
 drivers/net/usb/rtl8150.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 278e6cb6f4d9..e40b0669d9f4 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -211,6 +211,8 @@ static int async_set_registers(rtl8150_t *dev, u16 indx, u16 size, u16 reg)
 		if (res == -ENODEV)
 			netif_device_detach(dev->netdev);
 		dev_err(&dev->udev->dev, "%s failed with %d\n", __func__, res);
+		kfree(req);
+		usb_free_urb(async_urb);
 	}
 	return res;
 }
-- 
2.52.0


