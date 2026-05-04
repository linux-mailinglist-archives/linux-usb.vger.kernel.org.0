Return-Path: <linux-usb+bounces-36885-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JHkJydk+GlJtgIAu9opvQ
	(envelope-from <linux-usb+bounces-36885-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 11:17:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3174BAD27
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 11:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7DC5301A907
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 09:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6BB376BEC;
	Mon,  4 May 2026 09:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2Pjl7Au"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D763370D5E
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886239; cv=none; b=l0j3SeM+pfxQQ1Y8/Br/u2hQpRsEVUAYSLFAYCVWZG/dK2h80OVl6icogwXhi+lvh3wa7VTlPiVqVwRFaWjeq8MlkNReAYogz2N0ifCRdozDMx5I8XW+gVaF6Q8oqRO2fIcFeB03icfKFm67lN9k3F9sW7zQ8xTwuysz/SDHMnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886239; c=relaxed/simple;
	bh=6FrODT2ZjHyBdDyannBtEzjomylqmnCzFA6S+a44xiE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWGbl88QenyAiQBESkVXL+YKJmIrDO0WZdC0vLhUdCOlVS+XdSR9stv95DpQ8Zh/ODHeHHf0W+dFT2QgR3jEeMMBc6KS8TULTMhaN/itI+MtL5fiPxsML96kvwswNZZUeKhI1h7znPmTXpq16Pyhd5QwFwuCnq4wRBlGUX2t2Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2Pjl7Au; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso47995335e9.1
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 02:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777886237; x=1778491037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bDiiYv6DmJYWv+J0npT1YM58b8GYRgLdrDapx8OI3Q=;
        b=D2Pjl7Aux0uMQSI0m0s0FzuWRmMSFYwlXduhhg5g/vj0UlHd/31jB/eR4cLbQCutcw
         SfwhY+e7dHp0ChGUtIq3EbjQPocVdvWVXvVS/o+MyhGqzcA8gQKmQUBKJjEACmEu/JQS
         hLbICu7YW0fNMiI6sXqprhVYUYKW2c4K2CHNNusAaDx3rE1vX+BOz/Pgyxd8xgIBoRBl
         1IBgVJP3ehzUPsMDCouQs4eZ/g4N1tvBPYvcwJlGM3hbT9X+rcc6+Bamyw+G7kg7YSEZ
         xIzl3glhvE3wYv625ERpsvvUW73JdTBVq8ubIdMOWlK7Draf9CSaeLOiqNo4Rw9riekX
         6k3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886237; x=1778491037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2bDiiYv6DmJYWv+J0npT1YM58b8GYRgLdrDapx8OI3Q=;
        b=UfFRjFFF0NVr28fb/is3PurKle5gFnPJnRT31jBD/J4tek6cxpMoFt0ns56RMrcB6x
         T4cLY3C6vhAfmwMHrRJrBnnK78e8gTHgNkyWWsffJMv6pa+IhIY6b1VVbQDY/9wfmr3e
         CYa8tp19wvChXx17JlCisPm1C9l4Xai6paCOrtTAUqEnz2R7gaG1kSHn09CUwfBp3dbR
         wtmtBxiz1e1QzMt412KGxhyp/svF/0j2EuzoJRjsxGgce4QXVGUaF7Hyk/xbpIN2E+mj
         aK5BiwEF1Ix5kVmiECWyyMQkK5mUCIgNuxKYjs9WGfSuTNZ7UT6U7zjbkXR60jsaITdB
         8ECA==
X-Forwarded-Encrypted: i=1; AFNElJ+sWKvObeeWxPeeJ1ewRXV6/QWYJOKRy7kCHYN6D7gbrnb8QPBXnIdihXoKervsw67JMksqXrl7vzU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8einp3Vf80XCqsWfdbIdvSDdv5CA39xTI5rwH1G87g6HCjs1C
	tdBh4qCBVxgSKZ6pkzkRXV+IPmOoQYK/vBEbme6vlBdw6t3g3dTghqLf
X-Gm-Gg: AeBDieuukhj9EkfovrYTeICfkQCGebhbBrK7s+QRd6zakk9ma0LzTx/tiAy01zZc1sF
	RnbVXTKRT8fLMD776bEg3ODJgTpzjJ9UtO0cXgcNz9sY9741r09AOwZ3MoyPxIrBAp/lISlxVQ5
	bDZW2A2+HwDbWsexk1ASIUILLdA+e6Lw8yVc2LBkuFsaufOJQreEA71L/G5hjWKEiYZArt2DyhJ
	or8cSMEOuDxlSGmIkggg3d84WY2hVZr+gB8FJGK4dP7mbaso09tX7Qgviz4SyH0vWuCWBgWqKsY
	Bk+xN6Os22m+dn6wh999nHtoyKAB27GgfJIlN02F0AcYAaqapcmY5RfXhl8fdDxEf9/GDzrTDP1
	tbyhqkAxCVhPXqKhOu50nvjD4bkCRs7Hp4vw3prH4T6YK5rL+n2JyQGaqNSnl+zhiLjj5lTw93A
	mwFM5CVFnLwcwSr2zDoDS9nbKjAGzww+xpJPasWcO/nTnf/g==
X-Received: by 2002:a05:600c:a30a:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-48a98674f9emr105042995e9.24.1777886236451;
        Mon, 04 May 2026 02:17:16 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981dee0bsm24119164f8f.19.2026.05.04.02.17.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 04 May 2026 02:17:16 -0700 (PDT)
Date: Mon, 4 May 2026 11:17:12 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: "Xuetao (kirin)" <xuetao09@huawei.com>, <caiyadong@huawei.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] usb: core: Clean up SuperSpeed/eUSB2 descriptor
 validation logging
Message-ID: <20260504111712.2e3b9fc1.michal.pecio@gmail.com>
In-Reply-To: <20260504111353.55ba2530.michal.pecio@gmail.com>
References: <20260504111353.55ba2530.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4A3174BAD27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36885-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Core usually prints endpoint addresses with 0x%X format.
Change this code to use it too, instead of just %d.
Particularly for IN, 0x83 seems more readable than 131.

While at that, fix checkpatch warnings about multi-line
quoted strings, as well as missing or doubled whitespace
in those strings.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

v2: new patch in series

 drivers/usb/core/config.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 74945cd30cd2..6b718f8a6697 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -56,8 +56,7 @@ static void usb_parse_ssp_isoc_endpoint_companion(struct device *ddev,
 	desc = (struct usb_ssp_isoc_ep_comp_descriptor *) buffer;
 	if (desc->bDescriptorType != USB_DT_SSP_ISOC_ENDPOINT_COMP ||
 	    size < USB_DT_SSP_ISOC_EP_COMP_SIZE) {
-		dev_notice(ddev, "Invalid SuperSpeedPlus isoc endpoint companion"
-			 "for config %d interface %d altsetting %d ep %d.\n",
+		dev_notice(ddev, "Invalid SuperSpeedPlus isoc endpoint companion for config %d interface %d altsetting %d ep 0x%X.\n",
 			 cfgno, inum, asnum, ep->desc.bEndpointAddress);
 		return;
 	}
@@ -91,7 +90,7 @@ static void usb_parse_eusb2_isoc_endpoint_companion(struct device *ddev,
 		size -= h->bLength;
 	}
 
-	dev_notice(ddev, "No eUSB2 isoc ep %d companion for config %d interface %d altsetting %d\n",
+	dev_notice(ddev, "No eUSB2 isoc ep 0x%X companion for config %d interface %d altsetting %d\n",
 		   ep->desc.bEndpointAddress, cfgno, inum, asnum);
 }
 
@@ -115,9 +114,7 @@ static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
 	}
 
 	if (desc->bDescriptorType != USB_DT_SS_ENDPOINT_COMP) {
-		dev_notice(ddev, "No SuperSpeed endpoint companion for config %d "
-				" interface %d altsetting %d ep %d: "
-				"using minimum values\n",
+		dev_notice(ddev, "No SuperSpeed endpoint companion for config %d interface %d altsetting %d ep 0x%X: using minimum values\n",
 				cfgno, inum, asnum, ep->desc.bEndpointAddress);
 
 		/* Fill in some default values.
@@ -141,42 +138,32 @@ static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
 
 	/* Check the various values */
 	if (usb_endpoint_xfer_control(&ep->desc) && desc->bMaxBurst != 0) {
-		dev_notice(ddev, "Control endpoint with bMaxBurst = %d in "
-				"config %d interface %d altsetting %d ep %d: "
-				"setting to zero\n", desc->bMaxBurst,
-				cfgno, inum, asnum, ep->desc.bEndpointAddress);
+		dev_notice(ddev, "Control endpoint with bMaxBurst = %d in config %d interface %d altsetting %d ep 0x%X: setting to zero\n",
+				desc->bMaxBurst, cfgno, inum, asnum, ep->desc.bEndpointAddress);
 		ep->ss_ep_comp.bMaxBurst = 0;
 	} else if (desc->bMaxBurst > 15) {
-		dev_notice(ddev, "Endpoint with bMaxBurst = %d in "
-				"config %d interface %d altsetting %d ep %d: "
-				"setting to 15\n", desc->bMaxBurst,
-				cfgno, inum, asnum, ep->desc.bEndpointAddress);
+		dev_notice(ddev, "Endpoint with bMaxBurst = %d in config %d interface %d altsetting %d ep 0x%X: setting to 15\n",
+				desc->bMaxBurst, cfgno, inum, asnum, ep->desc.bEndpointAddress);
 		ep->ss_ep_comp.bMaxBurst = 15;
 	}
 
 	if ((usb_endpoint_xfer_control(&ep->desc) ||
 			usb_endpoint_xfer_int(&ep->desc)) &&
 				desc->bmAttributes != 0) {
-		dev_notice(ddev, "%s endpoint with bmAttributes = %d in "
-				"config %d interface %d altsetting %d ep %d: "
-				"setting to zero\n",
+		dev_notice(ddev, "%s endpoint with bmAttributes = %d in config %d interface %d altsetting %d ep 0x%X: setting to zero\n",
 				usb_endpoint_xfer_control(&ep->desc) ? "Control" : "Bulk",
 				desc->bmAttributes,
 				cfgno, inum, asnum, ep->desc.bEndpointAddress);
 		ep->ss_ep_comp.bmAttributes = 0;
 	} else if (usb_endpoint_xfer_bulk(&ep->desc) &&
 			desc->bmAttributes > 16) {
-		dev_notice(ddev, "Bulk endpoint with more than 65536 streams in "
-				"config %d interface %d altsetting %d ep %d: "
-				"setting to max\n",
+		dev_notice(ddev, "Bulk endpoint with more than 65536 streams in config %d interface %d altsetting %d ep 0x%X: setting to max\n",
 				cfgno, inum, asnum, ep->desc.bEndpointAddress);
 		ep->ss_ep_comp.bmAttributes = 16;
 	} else if (usb_endpoint_xfer_isoc(&ep->desc) &&
 		   !USB_SS_SSP_ISOC_COMP(desc->bmAttributes) &&
 		   USB_SS_MULT(desc->bmAttributes) > 3) {
-		dev_notice(ddev, "Isoc endpoint has Mult of %d in "
-				"config %d interface %d altsetting %d ep %d: "
-				"setting to 3\n",
+		dev_notice(ddev, "Isoc endpoint has Mult of %d in config %d interface %d altsetting %d ep 0x%X: setting to 3\n",
 				USB_SS_MULT(desc->bmAttributes),
 				cfgno, inum, asnum, ep->desc.bEndpointAddress);
 		ep->ss_ep_comp.bmAttributes = 2;
@@ -199,9 +186,7 @@ static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
 	if (le16_to_cpu(desc->wBytesPerInterval) > max_tx ||
 	    (le16_to_cpu(desc->wBytesPerInterval) < usb_endpoint_maxp(&ep->desc) &&
 	     usb_endpoint_is_int_in(&ep->desc))) {
-		dev_notice(ddev, "%s endpoint with wBytesPerInterval of %d in "
-				"config %d interface %d altsetting %d ep %d: "
-				"setting to %d\n",
+		dev_notice(ddev, "%s endpoint with wBytesPerInterval of %d in config %d interface %d altsetting %d ep 0x%X: setting to %d\n",
 				usb_endpoint_xfer_isoc(&ep->desc) ? "Isoc" : "Int",
 				le16_to_cpu(desc->wBytesPerInterval),
 				cfgno, inum, asnum, ep->desc.bEndpointAddress,
-- 
2.48.1

