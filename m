Return-Path: <linux-usb+bounces-36015-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CSkA8/M02nomAcAu9opvQ
	(envelope-from <linux-usb+bounces-36015-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 17:10:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0916C3A4930
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 17:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F1C430055EB
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2026 15:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F35E38654D;
	Mon,  6 Apr 2026 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H2weZsAB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F24386541
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488194; cv=none; b=fbcfDwp2k9I9TBX8QDtGPZAjd11Btd4pWCVHiZTNCy7ksa4CyepnY1WTFSW8TIPKAdkAzZZbNx4Ju0H2UCXv0UlUHY5dss6wosu5rGtp6aHuE24PC8poxsseotefgc9SPu7nOvjBWlH8X6mMStU3Ed9YuKMfeEdifawC3e9ALFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488194; c=relaxed/simple;
	bh=HN1InGl/ybVpzih+kyD2f+O6r2KPalvpbECx3EebIpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lA6JcxgAs57pxFw767OpThOou2hhKv0TWalvFUmPksb+L5l5OBdrx9558iS0rOCX4xVlvb7B/IGtnhm/AEk7p2J0c5ZbtKtcwt5FA8ZQ5H8jUcOBJdN5OQ7a741STwROfg83/gP7IzQnxthNb90DlqojCVbY/CjH9z5OIzsnNx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H2weZsAB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1335DC4CEF7;
	Mon,  6 Apr 2026 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775488193;
	bh=HN1InGl/ybVpzih+kyD2f+O6r2KPalvpbECx3EebIpU=;
	h=From:To:Cc:Subject:Date:From;
	b=H2weZsABZaOO8tD2Lq5BR0gEG9itJbF1OmC7v2aULhZ8KM/38p3Mv+dVi85/KlqB2
	 QXmDMfBO+RlXqfGAvBB7GH+mNIwD9xlGyLFWvG1PQOT5zXR6t7d7+DA1EjhmKChLmX
	 W+7EWlzEDkdZlsdRVD7oc/ZD2fIRRHCb8FFcLQws=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable <stable@kernel.org>
Subject: [PATCH] usb: gadget: renesas_usb3: validate endpoint index in standard request handlers
Date: Mon,  6 Apr 2026 17:09:48 +0200
Message-ID: <2026040647-sincerity-untidy-b104@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 44
X-Developer-Signature: v=1; a=openpgp-sha256; l=1788; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=HN1InGl/ybVpzih+kyD2f+O6r2KPalvpbECx3EebIpU=; b=owGbwMvMwCRo6H6F97bub03G02pJDJmXz+xmf6kiNOPYhztLb4h8W7ubf2P5SzeVqZ8a5i7ns wv9v20KW0csC4MgE4OsmCLLl208R/dXHFL0MrQ9DTOHlQlkCAMXpwBMxPANw4IFXQLfvn9UEGx4 wWP25Dqr9t2O67MY5pkbWsw4eDiA81NEFduxnkuVZ17aNgAA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-36015-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0916C3A4930
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The GET_STATUS and SET/CLEAR_FEATURE handlers extract the endpoint
number from the host-supplied wIndex without any sort of validation.
Fix this up by validating the number of endpoints actually match up with
the number the device has before attempting to dereference a pointer
based on this math.

This is just like what was done in commit ee0d382feb44 ("usb: gadget:
aspeed_udc: validate endpoint index for ast udc") for the aspeed driver.

Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesas USB3.0 peripheral controller")
Cc: stable <stable@kernel.org>
Assisted-by: gregkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index b0b264d34919..2c9c3e935a5e 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -1669,6 +1669,10 @@ static bool usb3_std_req_get_status(struct renesas_usb3 *usb3,
 		break;
 	case USB_RECIP_ENDPOINT:
 		num = le16_to_cpu(ctrl->wIndex) & USB_ENDPOINT_NUMBER_MASK;
+		if (num >= usb3->num_usb3_eps) {
+			stall = true;
+			break;
+		}
 		usb3_ep = usb3_get_ep(usb3, num);
 		if (usb3_ep->halt)
 			status |= 1 << USB_ENDPOINT_HALT;
@@ -1781,7 +1785,8 @@ static bool usb3_std_req_feature_endpoint(struct renesas_usb3 *usb3,
 	struct renesas_usb3_ep *usb3_ep;
 	struct renesas_usb3_request *usb3_req;
 
-	if (le16_to_cpu(ctrl->wValue) != USB_ENDPOINT_HALT)
+	if ((le16_to_cpu(ctrl->wValue) != USB_ENDPOINT_HALT) ||
+	    (num >= usb3->num_usb3_eps))
 		return true;	/* stall */
 
 	usb3_ep = usb3_get_ep(usb3, num);
-- 
2.53.0


