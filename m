Return-Path: <linux-usb+bounces-4129-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 513BB8119D5
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 17:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDBAD1F218B7
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 16:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220C8364B3;
	Wed, 13 Dec 2023 16:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OikvGNj6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A6A2FC42
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 16:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C16C433C9;
	Wed, 13 Dec 2023 16:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485791;
	bh=wYZoxRzv7f2lUWGVcUrdQYjqojzH2JSBWrtkL9KlpB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OikvGNj6sd0jUETMSWlDSLI5ZF/U+uXbQ8cVDaFNlkARUf5qtCOPFz/y3XWqThSt8
	 cEuyEzZacvtERUMB5wriCrNSxDOFQtiDQjRRTxmdNqT4jo0SCEsVbcIY82OKRdZhoH
	 HM3VYJzdSXnumn5UpTJomk69ro5yyp6jl7AOUaWDuuP+JqilQ2Ux4CVJ6q9s2iGbFC
	 Mztob5uy85eoJrWtcOrBgI8hOAMk+iahwGDNv38hzfGSXFeILsO2PIfr1PGFEoWQ6o
	 8k9KL+WzlfxAxmaxUjYswgOY4eP+iOTNwsQj6Sn+XvHB0Id3BUw94U00TfCDWIDGN6
	 DcKnJuEBEW5tQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Cristian Birsan <cristian.birsan@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/12] usb: host: max3421-hcd: Replace snprintf() with the safer scnprintf() variant
Date: Wed, 13 Dec 2023 16:42:36 +0000
Message-ID: <20231213164246.1021885-8-lee@kernel.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231213164246.1021885-1-lee@kernel.org>
References: <20231213164246.1021885-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a general misunderstanding amongst engineers that {v}snprintf()
returns the length of the data *actually* encoded into the destination
array.  However, as per the C99 standard {v}snprintf() really returns
the length of the data that *would have been* written if there were
enough space for it.  This misunderstanding has led to buffer-overruns
in the past.  It's generally considered safer to use the {v}scnprintf()
variants in their place (or even sprintf() in simple cases).  So let's
do that.

Link: https://lwn.net/Articles/69419/
Link: https://github.com/KSPP/linux/issues/105
Cc: Cristian Birsan <cristian.birsan@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/host/max3421-hcd.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index d152d72de1269..9fe4f48b18980 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1158,12 +1158,12 @@ dump_eps(struct usb_hcd *hcd)
 		end = dp + sizeof(ubuf);
 		*dp = '\0';
 		list_for_each_entry(urb, &ep->urb_list, urb_list) {
-			ret = snprintf(dp, end - dp, " %p(%d.%s %d/%d)", urb,
-				       usb_pipetype(urb->pipe),
-				       usb_urb_dir_in(urb) ? "IN" : "OUT",
-				       urb->actual_length,
-				       urb->transfer_buffer_length);
-			if (ret < 0 || ret >= end - dp)
+			ret = scnprintf(dp, end - dp, " %p(%d.%s %d/%d)", urb,
+					usb_pipetype(urb->pipe),
+					usb_urb_dir_in(urb) ? "IN" : "OUT",
+					urb->actual_length,
+					urb->transfer_buffer_length);
+			if (ret == end - dp - 1)
 				break;	/* error or buffer full */
 			dp += ret;
 		}
@@ -1255,9 +1255,9 @@ max3421_handle_irqs(struct usb_hcd *hcd)
 			end = sbuf + sizeof(sbuf);
 			*dp = '\0';
 			for (i = 0; i < 16; ++i) {
-				int ret = snprintf(dp, end - dp, " %lu",
-						   max3421_hcd->err_stat[i]);
-				if (ret < 0 || ret >= end - dp)
+				int ret = scnprintf(dp, end - dp, " %lu",
+						    max3421_hcd->err_stat[i]);
+				if (ret == end - dp - 1)
 					break;	/* error or buffer full */
 				dp += ret;
 			}
-- 
2.43.0.472.g3155946c3a-goog


