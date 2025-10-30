Return-Path: <linux-usb+bounces-29884-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB4BC20352
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 14:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 173FF1890162
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 13:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A552274643;
	Thu, 30 Oct 2025 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Op3TeOSU";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Op3TeOSU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC8B238C1A
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761830515; cv=none; b=kjkX6wvkWBFlLQMJS+RU9Ukcd70Zt1rdxXAGKeJ51ZlA19H/lFCVn8L/eZkWtCemUj5TIIPAT0qt/CyXe5qXDBQy1gFXrCqHq/kd3NvUH3PKrMz4LeJvSfGCz5q7QZQAaVV0wHj3gjAriDhIKj+4sYf/28J0Aj+nXMX5Vlnunpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761830515; c=relaxed/simple;
	bh=cUhu7OfRBq5lwLTMgUef2F+WRmc10m08/3mYAxUZ50k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7cKD6dqRqbRNEn3omZEPzLMeYfdgdam0d+7vdSc92jULLxXNF5AC5K8N+NVjnl38FwucACu4u76mKOn9N7hY7EnnUV5jqWwkF+tRoMwNvNmEk7UXMGdT0JAkVILmsrtw0NI+s2zvovocXGwJ6oWcWISfHla0NPNIccMqwO49bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Op3TeOSU; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Op3TeOSU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B2C851F7CA;
	Thu, 30 Oct 2025 13:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1761830511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UAoEaA6koO3Fmiw6R0Yi3mg07WfJDv79jirZ2ch6fVg=;
	b=Op3TeOSUe3XN2/pQXZkm2vxcBpvNcQfYqv7FX3Msuo+E2WHAGQLVqDvuAuGY9Q7CJhdEMX
	58ZbH6rcoxBg/gYSB/THNc26bgcMMpdWBoCMAONLNilpaUPN7SXxIt5bsSd6YH5ba5sQ/6
	TsgWRoPk07QS8e2pPQ+0IaSWECEoRkc=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1761830511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UAoEaA6koO3Fmiw6R0Yi3mg07WfJDv79jirZ2ch6fVg=;
	b=Op3TeOSUe3XN2/pQXZkm2vxcBpvNcQfYqv7FX3Msuo+E2WHAGQLVqDvuAuGY9Q7CJhdEMX
	58ZbH6rcoxBg/gYSB/THNc26bgcMMpdWBoCMAONLNilpaUPN7SXxIt5bsSd6YH5ba5sQ/6
	TsgWRoPk07QS8e2pPQ+0IaSWECEoRkc=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9EA4D1396A;
	Thu, 30 Oct 2025 13:21:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AO3hJW9mA2kyXQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 30 Oct 2025 13:21:51 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	gustavo@embeddedor.com,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2 1/1] uapi: cdc.h: cleanly provide for more interfaces and countries
Date: Thu, 30 Oct 2025 14:20:53 +0100
Message-ID: <20251030132149.2575138-1-oneukum@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

The spec requires at least one interface respectively country.
It allows multiple ones. This needs to be clearly said in the UAPI.

V2: following Gustavo's suggestion to use an union

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-acm.c  |  2 +-
 include/uapi/linux/usb/cdc.h | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 73f9476774ae..c272b00b947c 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1475,7 +1475,7 @@ static int acm_probe(struct usb_interface *intf,
 		if (!acm->country_codes)
 			goto skip_countries;
 		acm->country_code_size = cfd->bLength - 4;
-		memcpy(acm->country_codes, (u8 *)&cfd->wCountyCode0,
+		memcpy(acm->country_codes, (u8 *)&cfd->wCountryCode0,
 							cfd->bLength - 4);
 		acm->country_rel_date = cfd->iCountryCodeRelDate;
 
diff --git a/include/uapi/linux/usb/cdc.h b/include/uapi/linux/usb/cdc.h
index 1924cf665448..0208b2f76bf1 100644
--- a/include/uapi/linux/usb/cdc.h
+++ b/include/uapi/linux/usb/cdc.h
@@ -104,8 +104,10 @@ struct usb_cdc_union_desc {
 	__u8	bDescriptorSubType;
 
 	__u8	bMasterInterface0;
-	__u8	bSlaveInterface0;
-	/* ... and there could be other slave interfaces */
+	union {
+		__u8	bSlaveInterface0;
+		DECLARE_FLEX_ARRAY(__u8, bSlaveInterfaces);
+	};
 } __attribute__ ((packed));
 
 /* "Country Selection Functional Descriptor" from CDC spec 5.2.3.9 */
@@ -115,8 +117,10 @@ struct usb_cdc_country_functional_desc {
 	__u8	bDescriptorSubType;
 
 	__u8	iCountryCodeRelDate;
-	__le16	wCountyCode0;
-	/* ... and there can be a lot of country codes */
+	union {
+		__le16	wCountryCode0;
+		DECLARE_FLEX_ARRAY(__le16, wCountryCodes);
+	};
 } __attribute__ ((packed));
 
 /* "Network Channel Terminal Functional Descriptor" from CDC spec 5.2.3.11 */
-- 
2.51.1


