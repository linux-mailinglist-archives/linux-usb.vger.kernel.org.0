Return-Path: <linux-usb+bounces-19752-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE37A1C5E2
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jan 2025 00:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA3EB3A7D78
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jan 2025 23:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC0820A5FD;
	Sat, 25 Jan 2025 23:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pen.gy header.i=@pen.gy header.b="Wk/bnWmX"
X-Original-To: linux-usb@vger.kernel.org
Received: from ci74p00im-qukt09081901.me.com (ci74p00im-qukt09081901.me.com [17.57.156.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6493F20A5D7
	for <linux-usb@vger.kernel.org>; Sat, 25 Jan 2025 23:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.57.156.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737849290; cv=none; b=X0QJmyc+BbFUz7hJM3oAIEODDbDJkG9ODTxzUwyGnPw+wtgop4p1i87PZLf9N35UEhwnx1zrYQ3CsK977nRy/ds7VwBG/nZ7oFu546haMqirIMqIMhr4WflQtpi/fEghqOxcXHzwJ1AE64Q5R+IlvkqS68Arf1uuZJ5npzII83U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737849290; c=relaxed/simple;
	bh=ByQoRGwpNFwth3ZZx17pvWQtfSy2ycPI/iHTO8xVcfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tJmMheNo02AssJyxWo2LjBiclxXOniM6otfBoLvUaTo+hoyXAWSj/Rv4IefcOoBBI9FiNUsk9xX5ZSPXZPSWUMbHmOJKw6C8pdEiF3kRt2OdLAFNjMr6A5SUcJdr87hA4A3xRVTNU3wqCeRWNsR5v4pPtwWem2KaOc5yuqp+b5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pen.gy; spf=pass smtp.mailfrom=pen.gy; dkim=pass (2048-bit key) header.d=pen.gy header.i=@pen.gy header.b=Wk/bnWmX; arc=none smtp.client-ip=17.57.156.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pen.gy
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pen.gy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pen.gy; s=sig1;
	bh=hxAqtiK/pZshS4jUbncXOLS1RWrFRFfUAspaw326iwU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=Wk/bnWmXWFwBWJsgtFCIr0KZWh8NBpI9szMr+qsHHZa4rj4lBp2fcn4K//I2u3GCZ
	 S/XqQkNK51j9kHR2vY3oFJxsVcKQGdldvhpqVHKN9UBB9CtpJBSQ5eIwRM7pjzbvkl
	 mcUcCzaRwpfrHpRwlyiSR4+6Gjy9cUlS67/VjFIOMR52pe08o9PL8BxfoYGpbKo4Z7
	 OsTaH4Y4swYcDT3jg3kF06wEquyYCKLieFlsSjU2u9ycWnvrom8aDG67gbc7y/287N
	 i9pV6Av89Twj/h9asriKr5fIWAQ7NzAEYT+P1LXNB5sYu6Q1fJbDtRWRjlLrsM6yxu
	 KpOIbAJy1iDKQ==
Received: from fossa.se1.pen.gy (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
	by ci74p00im-qukt09081901.me.com (Postfix) with ESMTPSA id EC6605AC016E;
	Sat, 25 Jan 2025 23:54:43 +0000 (UTC)
From: Foster Snowhill <forst@pen.gy>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Georgi Valkov <gvalkov@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH net v5 2/7] usbnet: ipheth: check that DPE points past NCM header
Date: Sun, 26 Jan 2025 00:54:04 +0100
Message-ID: <20250125235409.3106594-3-forst@pen.gy>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250125235409.3106594-1-forst@pen.gy>
References: <20250125235409.3106594-1-forst@pen.gy>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QSFwQVc-PMvtKRSKL4UX3Ei0qjbiNcJl
X-Proofpoint-GUID: QSFwQVc-PMvtKRSKL4UX3Ei0qjbiNcJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-25_11,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=455 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1030
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2501250183

By definition, a DPE points at the start of a network frame/datagram.
Thus it makes no sense for it to point at anything that's part of the
NCM header. It is not a security issue, but merely an indication of
a malformed DPE.

Enforce that all DPEs point at the data portion of the URB, past the
NCM header.

Fixes: a2d274c62e44 ("usbnet: ipheth: add CDC NCM support")
Cc: stable@vger.kernel.org
Signed-off-by: Foster Snowhill <forst@pen.gy>
Reviewed-by: Jakub Kicinski <kuba@kernel.org>
---
v5:
    No code changes. Added Cc to stable and Reviewed-by Jakub tags.
v4: https://lore.kernel.org/netdev/20250105010121.12546-4-forst@pen.gy/
    No change since v3.
v3: https://lore.kernel.org/netdev/20241123235432.821220-3-forst@pen.gy/
    Split out from a monolithic patch in v2 as an atomic change.
v2: https://lore.kernel.org/netdev/20240912211817.1707844-1-forst@pen.gy/
    No code changes. Update commit message to further clarify that
    `ipheth` is not and does not aim to be a complete or spec-compliant
    CDC NCM implementation.
v1: https://lore.kernel.org/netdev/20240907230108.978355-1-forst@pen.gy/
---
 drivers/net/usb/ipheth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
index 45daae234cb8..1ff5f7076ad5 100644
--- a/drivers/net/usb/ipheth.c
+++ b/drivers/net/usb/ipheth.c
@@ -242,7 +242,8 @@ static int ipheth_rcvbulk_callback_ncm(struct urb *urb)
 	dpe = ncm0->dpe16;
 	while (le16_to_cpu(dpe->wDatagramIndex) != 0 &&
 	       le16_to_cpu(dpe->wDatagramLength) != 0) {
-		if (le16_to_cpu(dpe->wDatagramIndex) >= urb->actual_length ||
+		if (le16_to_cpu(dpe->wDatagramIndex) < IPHETH_NCM_HEADER_SIZE ||
+		    le16_to_cpu(dpe->wDatagramIndex) >= urb->actual_length ||
 		    le16_to_cpu(dpe->wDatagramLength) > urb->actual_length -
 		    le16_to_cpu(dpe->wDatagramIndex)) {
 			dev->net->stats.rx_length_errors++;
-- 
2.45.1


