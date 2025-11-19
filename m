Return-Path: <linux-usb+bounces-30696-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D869DC6EDE3
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3FC7C4FF726
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 13:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35055366DC1;
	Wed, 19 Nov 2025 13:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbbohEz1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232CD36655C
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 13:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557753; cv=none; b=tfZ7rXWUeBGBxWmUPL8t7JXr93J4iJh6xFZ3hAVN0JYaMvB08fT2hNGdj8RiMYL2AeDwFUkreNPhV5/C6z4FZ1HBNo44YK6Dcup7f27n2jTWmHiJ0poofJnwWL7aLEiIA0wOvF5iJndOxaSFwlewbVBxxPioIU860dmlypMDUtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557753; c=relaxed/simple;
	bh=PrZRUUyTCW3e5F7Tub3IHjfsyp91NTQ3XS/2sGiYIU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JEFDFhJKJFZitpEqh4VX5RygXn35ZX1ytBh+ym9XU/yttB5RBX7ndsKtIDzHfY/Dw4vjpJYW0YPJi36DjpiVKcSihFcym5D/pKTTfbtWiIvCHJ+0EbNHBUif6w64wDmYBvGYNmZzt52CpOV7P9Xhx/m+e094pFN3eF8+R/1vmO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbbohEz1; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso3261817b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 05:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557751; x=1764162551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkCQIdAzhDVpx+Df25ROecYMMLKgKqXNwwF079CDyCM=;
        b=ZbbohEz19HBGLgskMfYtFFsnzJKo/M1v238+OP/FyyvU5IZ0f43L6g8G2LT67kch7a
         a1dAIvOafAkOUpmhCfCXtOZAtP+6T4t+Kw9bBLi1xZoK8+d9m74d9qJ2UAACRKwHk9IX
         eCn0LRneXB1lakYPkVbu5QP67rug3o7kxexQnEc1xxswlGiK7NEVJGghqzZFeXWDRG36
         bt59LbZRpsz0X5r3o0TuF9Iw/w6Y8F+10w2PZqNtZFfmQBJKXUFT7GOZOsg8FGgdGGuX
         1zDCv8bSYbla7TLr50647Z+AhdPtYv+0hV1+UDPim8Cv3JTZl3paagJ7lZnZjuGkep5J
         9eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557751; x=1764162551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mkCQIdAzhDVpx+Df25ROecYMMLKgKqXNwwF079CDyCM=;
        b=U0qL6Jnr4H9xLEu7k4mCFtvBMizetXVgTEL2HiVnvybpIELI/ez3Bqg5aM/fWW9fyK
         4d26jyn5Cs3CRejrYjvJTAE5o1J2bOPKUubPQuomWcvvPT3Kuxf7ZW9k1aMYGnHka/jF
         bFXxva9DFhbSUoaJ4T0LnuIaBER7TmtDMtQFyD0Q0YzPqavDsSx73a3dh7Q/JwLSHmi/
         0X4RaSuJsEESEi8EkxeZe7NevobDZTNmClz4tRbAGMOKG0r0c8vXUjmwrKskzF6ckvzh
         UGeHHMtVWBTfWGJSh3TY7ypyjzzMAQpc8to8WNR7aU8qZWQuo4AtakjUS7xrhQOzBMAU
         oAAg==
X-Gm-Message-State: AOJu0YxZEa0z6M8nICOvVuBCzQvYZU98cSMaQltiQ6MAX/zkBTVhOCxY
	iQWSUAMvn72nhExDca9bTS77xwtcOwbAzn6Zbj8jGIM23Qppr0n8Qa/j
X-Gm-Gg: ASbGncsNLPUA17utRrcUyLSBIwn0RIW9c0e9lyyKRzXuzJJF8cZTJs0kx+nWuul9L4/
	ctBghjaIWzGVVUZYWZp3PRoaYW0has/IZK3NNgl1dL5xGQT6ItddVtqo4Q8AcU1ujimZ9NySigJ
	17fMBeO4zq4+WZFE2MHO+5bHKMiTI7p/LVV4uu23ZGupKNe8H136Rl0NGAEkPQBwIAPlXo+ndFr
	jcPsyRme5zk9XDDhHuQjZwK41udFltxWcnAxhmbGO5Ez4FFkZsMRMRmheAb74ha9eMTxVT4Cwfm
	APy9Ww8l3owLcm/CQC5lTtjL+mUbIlPXvTXGqoNgUDscpFrbshTr5q4oy53lMFht1i+x+Oyk8gl
	M2vREwwUShJldfVrWo3FcKIjcfEgMGaV3ixYZDdl0wYbGBznuIgMk42hnrKdrY7GDyZnrf+zt13
	mtilPD+S0OEnaY47tUE/5GuP+xjbCcxJyeoBJ7k7ec9MAUVQ==
X-Google-Smtp-Source: AGHT+IGOZoPr6lgFqZ3pubmZ547ZRImFpqA3tk7lcyuqLmzsU5M4QPECrXxxfbjSMiWNkxT9Tdebcw==
X-Received: by 2002:a05:6a20:244c:b0:35e:f436:ffb9 with SMTP id adf61e73a8af0-35ef446b99emr13775623637.4.1763557751189;
        Wed, 19 Nov 2025 05:09:11 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:09:10 -0800 (PST)
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
Subject: [PATCH 5/8] usb: gadget: dummy_hcd: merge multi-line quoted strings into one line
Date: Wed, 19 Nov 2025 18:38:37 +0530
Message-ID: <20251119130840.14309-6-clintbgeorge@gmail.com>
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

Merge multi-line quoted strings into a single line to improve readability
and comply with kernel coding style. This reduces unnecessary line
breaks in string literals and makes the code easier to follow.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index d4b2dcbc4..1363de6fe 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -2133,8 +2133,7 @@ static int dummy_hub_control(
 		case USB_PORT_FEAT_SUSPEND:
 			if (hcd->speed == HCD_USB3) {
 				dev_dbg(dummy_dev(dum_hcd),
-					 "USB_PORT_FEAT_SUSPEND req not "
-					 "supported for USB 3.0 roothub\n");
+					 "USB_PORT_FEAT_SUSPEND req not supported for USB 3.0 roothub\n");
 				goto error;
 			}
 			if (dum_hcd->port_status & USB_PORT_STAT_SUSPEND) {
@@ -2174,8 +2173,7 @@ static int dummy_hub_control(
 				(wLength < USB_DT_SS_HUB_SIZE ||
 				 wValue != (USB_DT_SS_HUB << 8))) {
 			dev_dbg(dummy_dev(dum_hcd),
-				"Wrong hub descriptor type for "
-				"USB 3.0 roothub.\n");
+				"Wrong hub descriptor type for USB 3.0 roothub.\n");
 			goto error;
 		}
 		if (hcd->speed == HCD_USB3)
@@ -2247,8 +2245,7 @@ static int dummy_hub_control(
 		case USB_PORT_FEAT_LINK_STATE:
 			if (hcd->speed != HCD_USB3) {
 				dev_dbg(dummy_dev(dum_hcd),
-					 "USB_PORT_FEAT_LINK_STATE req not "
-					 "supported for USB 2.0 roothub\n");
+					 "USB_PORT_FEAT_LINK_STATE req not supported for USB 2.0 roothub\n");
 				goto error;
 			}
 			/*
@@ -2261,8 +2258,7 @@ static int dummy_hub_control(
 			/* TODO: add suspend/resume support! */
 			if (hcd->speed != HCD_USB3) {
 				dev_dbg(dummy_dev(dum_hcd),
-					 "USB_PORT_FEAT_U1/2_TIMEOUT req not "
-					 "supported for USB 2.0 roothub\n");
+					 "USB_PORT_FEAT_U1/2_TIMEOUT req not supported for USB 2.0 roothub\n");
 				goto error;
 			}
 			break;
@@ -2270,8 +2266,7 @@ static int dummy_hub_control(
 			/* Applicable only for USB2.0 hub */
 			if (hcd->speed == HCD_USB3) {
 				dev_dbg(dummy_dev(dum_hcd),
-					 "USB_PORT_FEAT_SUSPEND req not "
-					 "supported for USB 3.0 roothub\n");
+					 "USB_PORT_FEAT_SUSPEND req not supported for USB 3.0 roothub\n");
 				goto error;
 			}
 			if (dum_hcd->active) {
@@ -2298,8 +2293,7 @@ static int dummy_hub_control(
 			/* Applicable only for USB3.0 hub */
 			if (hcd->speed != HCD_USB3) {
 				dev_dbg(dummy_dev(dum_hcd),
-					 "USB_PORT_FEAT_BH_PORT_RESET req not "
-					 "supported for USB 2.0 roothub\n");
+					 "USB_PORT_FEAT_BH_PORT_RESET req not supported for USB 2.0 roothub\n");
 				goto error;
 			}
 			fallthrough;
@@ -2347,8 +2341,7 @@ static int dummy_hub_control(
 	case GetPortErrorCount:
 		if (hcd->speed != HCD_USB3) {
 			dev_dbg(dummy_dev(dum_hcd),
-				 "GetPortErrorCount req not "
-				 "supported for USB 2.0 roothub\n");
+				 "GetPortErrorCount req not supported for USB 2.0 roothub\n");
 			goto error;
 		}
 		/* We'll always return 0 since this is a dummy hub */
@@ -2357,8 +2350,7 @@ static int dummy_hub_control(
 	case SetHubDepth:
 		if (hcd->speed != HCD_USB3) {
 			dev_dbg(dummy_dev(dum_hcd),
-				 "SetHubDepth req not supported for "
-				 "USB 2.0 roothub\n");
+				 "SetHubDepth req not supported for USB 2.0 roothub\n");
 			goto error;
 		}
 		break;
@@ -2601,8 +2593,7 @@ static int dummy_alloc_streams(struct usb_hcd *hcd, struct usb_device *udev,
 			goto out;
 		}
 		if (max_stream < ret_streams) {
-			dev_dbg(dummy_dev(dum_hcd), "Ep 0x%x only supports %u "
-					"stream IDs.\n",
+			dev_dbg(dummy_dev(dum_hcd), "Ep 0x%x only supports %u stream IDs.\n",
 					eps[i]->desc.bEndpointAddress,
 					max_stream);
 			ret_streams = max_stream;
-- 
2.43.0


