Return-Path: <linux-usb+bounces-3443-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3907FC780
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 22:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35D5C2856BC
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 21:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693D650241;
	Tue, 28 Nov 2023 21:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ug55uamL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8F344386;
	Tue, 28 Nov 2023 21:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D64C43391;
	Tue, 28 Nov 2023 21:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701205784;
	bh=ufztbDtBSQtsoxAnadZ77JmsyESQ62yN8ZKhHL8Z4Bk=;
	h=From:To:Cc:Subject:Date:From;
	b=Ug55uamLYd6Irx1L4LTJskUKbwwCv1kyMOsQN6IA6pLR9WiM1SuK6JY3Qrd6DIYDG
	 sBv2lxsd9cKo7Egk8ECoyWEV1z2YY12yPvIPIosdCCOhjIJctGXv92L4GUVVIRwsVf
	 Zx+Nerjm2Tmf1b/D7cQYhwbFet0e88mvsdRyr34QOSFMjjTxc/DcR2xAB30wo+6VXW
	 rBz7cnm579mftV2m/xEPZ+40/LfpDPk25N1J80/8WmlNU/0x5gUrmkVUStyPY2/z0e
	 8WPj15Gj71au3UmXoF0ydiMZcGx+OgTM8v2iAr3jv9sOK8jLGBha21mKTfjdFst5Gr
	 T6xTDG3Bg9+bQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>,
	"David S . Miller" <davem@davemloft.net>,
	Sasha Levin <sashal@kernel.org>,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 01/11] usb: aqc111: check packet for fixup for true limit
Date: Tue, 28 Nov 2023 16:09:25 -0500
Message-ID: <20231128210941.877094-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.262
Content-Transfer-Encoding: 8bit

From: Oliver Neukum <oneukum@suse.com>

[ Upstream commit ccab434e674ca95d483788b1895a70c21b7f016a ]

If a device sends a packet that is inbetween 0
and sizeof(u64) the value passed to skb_trim()
as length will wrap around ending up as some very
large value.

The driver will then proceed to parse the header
located at that position, which will either oops or
process some random value.

The fix is to check against sizeof(u64) rather than
0, which the driver currently does. The issue exists
since the introduction of the driver.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/aqc111.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/aqc111.c b/drivers/net/usb/aqc111.c
index 68912e266826b..892d58b38cf5b 100644
--- a/drivers/net/usb/aqc111.c
+++ b/drivers/net/usb/aqc111.c
@@ -1079,17 +1079,17 @@ static int aqc111_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 	u16 pkt_count = 0;
 	u64 desc_hdr = 0;
 	u16 vlan_tag = 0;
-	u32 skb_len = 0;
+	u32 skb_len;
 
 	if (!skb)
 		goto err;
 
-	if (skb->len == 0)
+	skb_len = skb->len;
+	if (skb_len < sizeof(desc_hdr))
 		goto err;
 
-	skb_len = skb->len;
 	/* RX Descriptor Header */
-	skb_trim(skb, skb->len - sizeof(desc_hdr));
+	skb_trim(skb, skb_len - sizeof(desc_hdr));
 	desc_hdr = le64_to_cpup((u64 *)skb_tail_pointer(skb));
 
 	/* Check these packets */
-- 
2.42.0


