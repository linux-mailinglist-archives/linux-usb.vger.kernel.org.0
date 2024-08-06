Return-Path: <linux-usb+bounces-13153-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBF89496C3
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 19:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47D8C289924
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 17:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A577780043;
	Tue,  6 Aug 2024 17:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pen.gy header.i=@pen.gy header.b="Td7vNzJJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from qs51p00im-qukt01072501.me.com (qs51p00im-qukt01072501.me.com [17.57.155.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C786CDAB
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 17:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.57.155.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722965339; cv=none; b=LOpb4uR3cYjjaz9/qaf0k6a4cO9IN2OuIVsKRY7FZ4oim2wb7Ds/SR6R3+8BlEftJ3b8IekRcCDNmAm1EdIpecXpaeaFO6sPH7qJvGFU9L1DtmScwghH4TgjIOwKW2It7K71mv4n7BG/nGkLuqINal0fV3TG6QwBp9LMdLQebRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722965339; c=relaxed/simple;
	bh=r4jM7/1IkEKgY0ungXA8jhjmM/hIg/PFpvVBx8rVmvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S22t0a4PHepKT+fcwoUE6N/TAJB0ClF6gus6JRUK7P6dMqhOhk9mLQm/hxSvMFZJb7gmnNFjjmRNc0nkPaGzAbl1MUyap/b/wCpnlqfN3Ind7Zx2u+VsBKTfvKqAasnvVF24QhssJbAVmZBgiOjQq7P2/zupH9VUf2S6Uu0ztno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pen.gy; spf=pass smtp.mailfrom=pen.gy; dkim=pass (2048-bit key) header.d=pen.gy header.i=@pen.gy header.b=Td7vNzJJ; arc=none smtp.client-ip=17.57.155.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pen.gy
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pen.gy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pen.gy; s=sig1;
	t=1722965336; bh=VYwjQRXhlxuRj7b+rabVq90p4y0SQRs2I21vJahw3z0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Td7vNzJJRabIU3z0E3fdgtaMGaboeWSTGO/8x5gat6n09AggZTEgd3+QPapD7opKL
	 HdwF/F8dS5Glqrcg3YFjvq47wL3zVkUtoaCPOGkO5R667aav2s4DCpPMpYKKIKFtHL
	 fySZ/LIgSG2Y739LARbPK/tV/R5yhVejaRtcN9UuP/+oq55676RxZBbFdlx2U11JQr
	 dYbYWCgNnMj7H5+dN0QO/Bw5H3x208Y5Ge+XE6gz7MLyHGlA1Pfei8Zr1W2GyC3Pir
	 pMZP2K4JajA2OJvs/WELvnQ4pNgMT6Uv9IO2xuRlsIN3YJO/vU4bMwoc6sAjnlvqkw
	 aK7BI9t2rWycg==
Received: from fossa.se1.pen.gy (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01072501.me.com (Postfix) with ESMTPSA id 9A9524404E2;
	Tue,  6 Aug 2024 17:28:53 +0000 (UTC)
From: Foster Snowhill <forst@pen.gy>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Georgi Valkov <gvalkov@gmail.com>,
	Oliver Neukum <oneukum@suse.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH net-next 4/5] usbnet: ipheth: do not stop RX on failing RX callback
Date: Tue,  6 Aug 2024 19:28:08 +0200
Message-ID: <20240806172809.675044-4-forst@pen.gy>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240806172809.675044-1-forst@pen.gy>
References: <20240806172809.675044-1-forst@pen.gy>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: irkqZg7NrJqhCrB9s7yj9Ymb6A6RzsT_
X-Proofpoint-ORIG-GUID: irkqZg7NrJqhCrB9s7yj9Ymb6A6RzsT_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_14,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=380 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2408060123

RX callbacks can fail for multiple reasons:

* Payload too short
* Payload formatted incorrecly (e.g. bad NCM framing)
* Lack of memory

None of these should cause the driver to seize up.

Make such failures non-critical and continue processing further
incoming URBs.

Signed-off-by: Foster Snowhill <forst@pen.gy>
---
 drivers/net/usb/ipheth.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
index f04c7bf79665..cdc72559790a 100644
--- a/drivers/net/usb/ipheth.c
+++ b/drivers/net/usb/ipheth.c
@@ -308,7 +308,6 @@ static void ipheth_rcvbulk_callback(struct urb *urb)
 	if (retval != 0) {
 		dev_err(&dev->intf->dev, "%s: callback retval: %d\n",
 			__func__, retval);
-		return;
 	}
 
 rx_submit:
-- 
2.45.1


