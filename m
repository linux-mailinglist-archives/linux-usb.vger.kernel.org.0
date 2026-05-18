Return-Path: <linux-usb+bounces-37572-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MsmNfCkCmqu4gQAu9opvQ
	(envelope-from <linux-usb+bounces-37572-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:34:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEBD566513
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C29D301B924
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 05:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C000C3AF65C;
	Mon, 18 May 2026 05:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndBB4n94"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C483AFAFF
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 05:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779082391; cv=none; b=j+mH2CMGuEaSwBO6PWSDFRx1lT09vXehxZ7v2W9MRibyKGPfuZnxoHGBBD2Knrg07g7YqeIYUxxs+m8tT3IyIJqHoFmp+4MFsxy65+pc1LmpbmoRqzTWOVA9riC+rOjmZf/g/UkZdSTIGuvwwQOa/IzDqRVzUEU3IvDd+vrz+gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779082391; c=relaxed/simple;
	bh=Nh15+rjuAdNdNFUVnUCc9NVTlovRLJNB2stEoajO3O4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H3MexqCemZd8kQQDGBM8uScLuP3WNqNfwJ3+xNfjdRHdOsIRUiSlpdLTeHlrF3CiAnYWDNUwnhfWjmsQwDRxxivpZqBcYUHFqYpmW9VNeR9fo93V7Iv0YvoV+7kyucOj3WuFXSa7i+cubKsDvt1a161HU49Uyzfe90H9upQyMFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndBB4n94; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43eb05b1875so807823f8f.3
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 22:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779082381; x=1779687181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYS4lXTDitNv9r/jAYcacHGuHc1isduHlp2DzVkQuhE=;
        b=ndBB4n94xfNA355HZFRx3/xAHUZMXeKBgntsJ/1QpYKVNpU0q8Z7KPDHhOUkLP4teq
         qFt1XG9jd7ugtg/fZM5Ulzfmw++bUAbXjppV4uuvpvMxJRTnjo02ZQeMg3Z3/uIV3CYN
         NecmY8DCx1vhpsC4Rl2YDfCFJnXvzCUu0QWO+wH6G1dn/oJHyWn6cQqtU3vep5kYmZoP
         OxdH3BvWUc9GeEAKSABMdHwWdVOuo50eCMNEuzW47fSViqAX4odaVxlTU0CmlvhjjeQ1
         RX3ERw/OWS5R3jJaaa33k663jHu47ilkA1MpKGYcbxPCVEIVo/ptt1UfgXyjGwDRZ5Sl
         97Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779082381; x=1779687181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HYS4lXTDitNv9r/jAYcacHGuHc1isduHlp2DzVkQuhE=;
        b=lE2huPLmhU0ZHBMmaXNkHOZYafkOB7amjtEXPVFvDvEyWuBMkbkROz8zFjLNV7H0fU
         DYZITVON3T3iML4MEQ4+WRqvQ7GeyZmA3hd9LSk3p6DXEfnCKNbdrCva7bYcqR2Ysbk6
         +pLv10Llyz/I5ll8r3Rl8KtxxpfeQQD/7Os3kgWu9Ueb/jdrUjPaLABdCo3IiStm+kFd
         m8LyYkCk2lnrr+wjkmVc8UcAVsIY1iFdLkprWjlfK/adDONaPKtvSU3CfkqR/FCVdEKQ
         bkpjkcTO/xIN/cWTBj3GfuIlqBc8osC6tUNkQnMyJA5DDIvutN6xxfXoydIEyRQLApAM
         yCpA==
X-Forwarded-Encrypted: i=1; AFNElJ9bEqGBzWd4OZNnhBxq75SUu827uHZ1HDS55vYB/Dmq052D8BgcjJczfKucrS5eTrE1iawru8QnA24=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbXQd2xpzF8FGzz84YGkSWe5K1tZzahy5il9pJnZl/OPTxQJ7A
	T0V37iVVT+luzMTeP2swzcnjqvTeV01yvomKJupG/rh/EGxLnKilgXTZ
X-Gm-Gg: Acq92OHXrwcyft1DCXDuNOKHzgRllf+jgboX6zYaXw1nJ2VvgUnSBvFv3nbOkgQWgn3
	c50PnZ4gKzdi2UED834f1/PuO0MPIjXO3q8YZvxHMbpqN8EYsLEHjmi95NKhnD7Y9iMldofGViV
	lEm/DpMpTXKiKEeSL8MnL3UqLHh5T8Go1q2S+ZYQ3xmySbEDCZ7b3urNyP9d3r9vFNfmbwA+RWU
	iMnoBerl5wL3q5VBV2/kIejxlArZkVINnu9sup34k0uwcDkthDdq3muxHLo84txN3ucXZWr6ghF
	bDdwHA/JACClD21MiYagadhjj55/yqbXGtju1h7oSd1HVoAE1hGk5Gm65UCWyHgIOrMdANGFSAv
	wYmJ9Yf5bQHfoXTfeKt1Y2/SBmRt1HOoSvuRIvlBQofBtWOn8rnDqbZooovGcNhBO+2zwr6VdLn
	9kgyDCLFMuc+BPRiXZwR8/Al2ZycMx7OTb
X-Received: by 2002:a5d:5889:0:b0:45e:5b92:1e45 with SMTP id ffacd0b85a97d-45e5c60d55dmr18816963f8f.40.1779082381480;
        Sun, 17 May 2026 22:33:01 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d0bsm33000275f8f.3.2026.05.17.22.33.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 17 May 2026 22:33:01 -0700 (PDT)
Date: Mon, 18 May 2026 07:32:58 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: "Xuetao (kirin)" <xuetao09@huawei.com>, <caiyadong@huawei.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/3] usb: core: Clean up SuperSpeed/eUSB2 descriptor
 validation logging
Message-ID: <20260518073258.6532bdd5.michal.pecio@gmail.com>
In-Reply-To: <20260518073026.5580bb79.michal.pecio@gmail.com>
References: <20260518073026.5580bb79.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4EEBD566513
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37572-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Core usually prints endpoint addresses with 0x%X format.
Change this code to use it too, instead of just %d.
Particularly for IN, 0x83 seems more readable than 131.

While at that, fix checkpatch warnings about multi-line
quoted strings, as well as missing or doubled whitespace
in those strings.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/core/config.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index d9171bf7bc88..45e20c6d76c0 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -56,8 +56,7 @@ static void usb_parse_ssp_isoc_endpoint_companion(struct device *ddev,
 	desc = (struct usb_ssp_isoc_ep_comp_descriptor *) buffer;
 	if (size < USB_DT_SSP_ISOC_EP_COMP_SIZE ||
 	    desc->bDescriptorType != USB_DT_SSP_ISOC_ENDPOINT_COMP) {
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

