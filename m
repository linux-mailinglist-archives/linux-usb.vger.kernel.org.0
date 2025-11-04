Return-Path: <linux-usb+bounces-30054-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C79E2C32218
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 17:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57E924E3700
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 16:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86468336EFA;
	Tue,  4 Nov 2025 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOBqWljJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A716A1C3BE0
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762274952; cv=none; b=p/is3pctQtDXW9Ip18doE241MBpqwgtrDXn6cJq1QZMKdpveLjbsQ152Vk9uIuMxqW9omUXwznCdYyP3crASSq2znyymmCxFVPyNmRN5U3aVELB9328EyV4gkfX4xLOE9KBL2pgxBZMRrBGwLTufceVnDrgnnUqMD/6aiDMW+0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762274952; c=relaxed/simple;
	bh=Iayg8NfZD5P8SOlhFmx2l5GOCKjidJK2z3fPfNqfG/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUS3jjL+6XErxi4ytYEEawAbyMngf8ZlzYcGDYdpgDzLd/pvlemhRkdKTPOudTjavOLevc4232LB4ssjxum4yHHlCo88luPmbLAf42/ZEfbdMe6ExN9crFN5zvlkpBustOv09gCSsHV5Kv/J+sn1HRuiXJgApD8ytFyaB2VuURU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOBqWljJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77f67ba775aso7110331b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Nov 2025 08:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762274950; x=1762879750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVQvxU3MtJVRDiiE8O+W/LOs2kVr8LBYlBC4MjCsxUQ=;
        b=bOBqWljJ4/h6wgp4rGUnlsx3R5ZkihhbF/E+8jpnXFWrbrqMfb6CrpAjc4soBZkcZJ
         RLKkTxzKCrj63IxOgY4+2jqiR2XbcFdom18PDrMPcxPtknCHDYGmSqHi6qJdpJK/pTnw
         A5+8HUFaUV7ivz46wZD6e4yq3HQ1kNlPU3RfhfC0oYbe7g/KYHD26J7o6cVkFZFxPzng
         N53cB50/mHx2ZX9jFvrWFrWws+zG91d/F768jbGgKt8vT2wYrjLdP5v9SnJdl6YgS8nw
         ontWbsdrvacg9TZR8jZc+KKFu90Rc83QCQIS6bg2sEid11a7ZrMz5gtfD50FyXqwKABn
         ebqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762274950; x=1762879750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVQvxU3MtJVRDiiE8O+W/LOs2kVr8LBYlBC4MjCsxUQ=;
        b=L+K2Ws9J4bRTN7zyMCby7TbIIXqVnzwptJWGiVd8An3/AJFXT9o+/CiRsTu2AYbe53
         YxgxeO/CZaTUN3CQxQNxqfu+wrh3849AjucAS19n5kIFauY8mwMeeHgzzFdv01kUJEA8
         lzjcWuQcqy3Cxv99m5f47WDGZXSLAKyjcNFtFBtFmsar0VFWccxAPKdm7YUrhzyXMsNC
         DVHwX1BRLQDsYBCh7w4h8bqkt3sSVKZhEiR9XiAsnrfceN+yh0n6dV8lgmkoxeWjOQ7b
         WEFks8XWPD7q+fi0IGJtkC2nJPkob81WgakO8o2yIcQpmf8wso8+BeOk1U1Naq95qN3f
         frfw==
X-Gm-Message-State: AOJu0YyQLECaH9ogXDzxu9CdAGiFbpqWAmdmbtX+ptglXHakUNKdyrdW
	LoPrp4ea3kZ8BJiFnCcyYWL1qGgxFkQt7STaxtrWfsTAR8HGiWfJlaZH
X-Gm-Gg: ASbGncsQCMqfNNprA9HMH4uk34yLef5VrGRN3ZARRxZZIcmsYBylt1qId5DwAMqpSxv
	ue9VBIcTJkNIIz1LkC4lCOTtIeSZSrPQ0CoXXE+p7qjAlE4e+mhq8RKZBlyyJS3fDnlhvIuiJb4
	yUZOCdUWOLfGyn7HpivTdLjyoKY0YP8x/rZxiNvAfNTcFCGnnTfvEMc5YHlRfiHWUUPbUBK12IX
	QWzE4KFBLJPTfKcIzqPyHh5/nhKOrYn/uMFLKETkvesnw0u+yglL21JB9i03hE1lNZHVzdY64g6
	10wyIW5Ibo+RnxuIc24G225Uev2vc2cMuJWwb3mql/6N5Fds68z0LDnyo6yz4CKatwsSJBbcnM3
	Fx8JFU2hMbNpPWerBvEtNJFijwFg6M8Yf2dRhvWnLrnYwR6AZymcJBCix6BGxTbcRuC0DXmJbqE
	UnG6f1woC3a//X28E/nCV9CjM=
X-Google-Smtp-Source: AGHT+IG8EtSNccEfEHoN5wPq1nif+fDSJNpx9FhAwF6GN3xbTpgq1XKsfZyuQ7gXmi1x7mHezjbmJQ==
X-Received: by 2002:a05:6a00:3d10:b0:7aa:bc48:abbb with SMTP id d2e1a72fcca58-7aabc57f860mr10347708b3a.3.1762274949789;
        Tue, 04 Nov 2025 08:49:09 -0800 (PST)
Received: from localhost.localdomain ([157.51.50.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd38299b8sm3508686b3a.20.2025.11.04.08.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 08:49:09 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	syzbot+b4d5d8faea6996fd55e3@syzkaller.appspotmail.com,
	Dharanitharan R <dharanitharan725@gmail.com>,
	syzbot+b4d5d8faea6996fd@syzkaller.appspotmail.com
Subject: [PATCH] [PATCH] usb: rtl8150: Initialize buffers to fix KMSAN uninit-value in rtl8150_open
Date: Tue,  4 Nov 2025 16:48:37 +0000
Message-ID: <20251104164838.17846-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202508272322.b4d5d8faea6996fd@syzkaller.appspotmail.com>
References: <202508272322.b4d5d8faea6996fd@syzkaller.appspotmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KMSAN reported an uninitialized value use in rtl8150_open().
Initialize rx_skb->data and intr_buff before submitting URBs to
ensure memory is in a defined state.

Reported-by: syzbot+b4d5d8faea6996fd@syzkaller.appspotmail.com
Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
 drivers/net/usb/rtl8150.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 278e6cb6f4d9..f1a868f0032e 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -719,14 +719,15 @@ static netdev_tx_t rtl8150_start_xmit(struct sk_buff *skb,
 
 static void set_carrier(struct net_device *netdev)
 {
-	rtl8150_t *dev = netdev_priv(netdev);
-	short tmp;
+    rtl8150_t *dev = netdev_priv(netdev);
+    short tmp;
 
-	get_registers(dev, CSCR, 2, &tmp);
-	if (tmp & CSCR_LINK_STATUS)
-		netif_carrier_on(netdev);
-	else
-		netif_carrier_off(netdev);
+    /* Only use tmp if get_registers() succeeds */
+    if (!get_registers(dev, CSCR, 2, &tmp) &&
+        (tmp & CSCR_LINK_STATUS))
+        netif_carrier_on(netdev);
+    else
+        netif_carrier_off(netdev);
 }
 
 static int rtl8150_open(struct net_device *netdev)
@@ -741,6 +742,10 @@ static int rtl8150_open(struct net_device *netdev)
 
 	set_registers(dev, IDR, 6, netdev->dev_addr);
 
+	/* Fix: initialize memory before using it (KMSAN uninit-value) */
+	memset(dev->rx_skb->data, 0, RTL8150_MTU);
+	memset(dev->intr_buff, 0, INTBUFSIZE);
+
 	usb_fill_bulk_urb(dev->rx_urb, dev->udev, usb_rcvbulkpipe(dev->udev, 1),
 		      dev->rx_skb->data, RTL8150_MTU, read_bulk_callback, dev);
 	if ((res = usb_submit_urb(dev->rx_urb, GFP_KERNEL))) {
@@ -749,6 +754,7 @@ static int rtl8150_open(struct net_device *netdev)
 		dev_warn(&netdev->dev, "rx_urb submit failed: %d\n", res);
 		return res;
 	}
+
 	usb_fill_int_urb(dev->intr_urb, dev->udev, usb_rcvintpipe(dev->udev, 3),
 		     dev->intr_buff, INTBUFSIZE, intr_callback,
 		     dev, dev->intr_interval);
@@ -759,6 +765,7 @@ static int rtl8150_open(struct net_device *netdev)
 		usb_kill_urb(dev->rx_urb);
 		return res;
 	}
+
 	enable_net_traffic(dev);
 	set_carrier(netdev);
 	netif_start_queue(netdev);
-- 
2.43.0


