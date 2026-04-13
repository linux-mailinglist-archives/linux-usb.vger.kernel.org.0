Return-Path: <linux-usb+bounces-36176-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEuUJw2e3GkEUgkAu9opvQ
	(envelope-from <linux-usb+bounces-36176-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 09:41:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A853E85E6
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 09:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA957305D1C7
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 07:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5918394483;
	Mon, 13 Apr 2026 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrGwaFqy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128123921EC
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065775; cv=none; b=HZPV08nNYmbwSUdDbCduDe27qVigvzkHJ/LLGJd9omHLytkkgpIn7kfmOl5H+qks5TXVMtDubD2yW1tEvA65mqhU468Jiv9TTEal27eIneNf4XkOu4UYPqOx8j4iu2bojje4DRETN7L9tWvjH8nnJ/qR+BLz1wLAHw1mA3xRU/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065775; c=relaxed/simple;
	bh=z+GbI1Hi7HQ37EBywPZVYlS4GBPotKdTEHob6lKuBdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=krU2RqRaGAaT4ZdqrPPorvhdrAyUD9c3a4KQgsdC5N1SW7deVFjR5ZaE6uly1H6Nog80D7vFhgUGUeqxX+yMnEIobdXzu6E+N8o6fiW10jap5JUlVh52VjLW2nAMNpnSbSRFHHVUlAJbvHGfr/UUV2okxt5MU2MIHlxyKnZ2SOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrGwaFqy; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35fb0bb27e7so562258a91.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 00:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065773; x=1776670573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFGrbwczSOoLilTCGKun4cKWo780pH2iZgTthq1aaeg=;
        b=LrGwaFqy+C5+BKNRrm14RVtzgoLYiczStXNBmA8/G7nfJD8KDt+gWqx88gAzqm5uNm
         swuHu+ugB3vSde9Q70WrbYB24KaFO1G0DZVHI5q+RQqi6DnpTY6wwwIuGi+NuuasE+ng
         CNMXQtv4NLZAETvALiCt1XwqEfOKmid/g0k+aUaMmL+E4yKREEM/SpQ9JjP3NHR36+Db
         NxMXgmagCfdJsaO/Qu89pXWVo1l3U1zP6ZaKjqvoXH5O5JmewU7ZMWP5Nu6xTnDV1PcG
         EGPmqSF0WIMoEZUzxxLkJwNILRX/1a4EsWIw+V6yDmCuBRgL0SbaQ5TNLgVdJWqKhE1g
         IAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065773; x=1776670573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFGrbwczSOoLilTCGKun4cKWo780pH2iZgTthq1aaeg=;
        b=sq7Z4cUoFHCqW9LZGMP5O4anTDkqw1JNSXNg5oLiMX6MVGgq75MrS3ikJiVhHYl2/S
         31mhnv1KioUpirUuj+XlW1LCE3sSZ8EVrm/zcvjiAm58PzrCdlswHJ78tLMd+iKxDfny
         UYd1HKMg9O3pY/59zPL0iAsyIQcIlln2fp/APYCEvu5nrONJDSj32+DqGhIUdtgLwR8H
         PDQOIJpP7Cjosl+yMuMJeUNpWPNCaqH5splK2M8TfmQOrVcaiyoXzbPBPMnoRwJ2dkyX
         pdE2xueSElCEpbeXWZrgrfOIihBIoszsSJ8koklUY4R0JqhzIKQ9geXjsq++mhj+Uwcf
         5i5Q==
X-Gm-Message-State: AOJu0YzBthZEY9bojHUrEdFMPIZGw5BM3g4o4MaDnBFh3SoKb4spGL3v
	8JuAhs0naqOPK7Pemy5jaThF1nuj5TtUoP1EEtn+z7tY67YvNrla1jEu
X-Gm-Gg: AeBDievbmeMw3gJioaFv71qNpcKg50vxRkEp0GGrhBU+0APTXo9wUuE1JU/7YQZ6U9r
	3LFSSeUsZrdFWnWNq2dJ8FXybkHBRE6BnVCb1x/FpO1RGvWlCs4/3gMoz1ma+J1InmAfzqrebn0
	BfkLBzsVWFRX9f+NP3J53qs7mJ3AR+cFkduYTaYW/57kPwx36WEiG/b03M9YoBhEd/n+qGL346X
	ESmhXVzx63rbgJ1Wz4kthX9WfwI+K6Trnl24uRRp7taORLclE+OUqprk7DN9nm7r+ufc+Ew49sC
	Ws6ijXVGtRGPBBWi4AlxnYeKS8U6LNqH5Sn2+KZcKtDXVqPeDPSJmS0TyP+ERY4gyKMKCO7PAHv
	aMx5iOd0tlszDqPIP8oyIPW4bwi838BMiP8NEEadbX+PSjMk034eNH5fjCcX+FUJwHbyj8y/SuO
	BQt5DxAw==
X-Received: by 2002:a17:90b:2fd0:b0:359:d54:846f with SMTP id 98e67ed59e1d1-35e4275f708mr13214200a91.7.1776065773438;
        Mon, 13 Apr 2026 00:36:13 -0700 (PDT)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fb37d6e36sm3248823a91.16.2026.04.13.00.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:36:12 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jameson Thies <jthies@google.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] usb: typec: ucsi: Add duplicate detection to nvidia registration path
Date: Mon, 13 Apr 2026 15:35:50 +0800
Message-ID: <20260413073552.894395-2-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413073552.894395-1-acelan.kao@canonical.com>
References: <20260413073552.894395-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.84 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36176-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,canonical.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Queue-Id: 06A853E85E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the duplicate altmode detection to ucsi_register_altmodes_nvidia()
which is used when a driver provides the update_altmodes() callback.

This ensures all drivers benefit from duplicate detection, whether they
use the standard registration path or the nvidia path with update_altmodes
callback.

Without this fix, drivers using the nvidia path (like yoga_c630) would
still encounter duplicate altmode registration errors from buggy firmware.

Fixes: a79f16efcd00 ("usb: typec: ucsi: Add support for the partner USB Modes")
Cc: stable@vger.kernel.org
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
--
v4. rebase
---
 drivers/usb/typec/ucsi/ucsi.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index eebbb80fae566..43389fc7e13f2 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -619,19 +619,25 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 
 	/* now register altmodes */
 	for (i = 0; i < max_altmodes; i++) {
-		memset(&desc, 0, sizeof(desc));
-		if (multi_dp) {
-			desc.svid = updated[i].svid;
-			desc.vdo = updated[i].mid;
-		} else {
-			desc.svid = orig[i].svid;
-			desc.vdo = orig[i].mid;
-		}
-		desc.roles = TYPEC_PORT_DRD;
+		struct ucsi_altmode *altmode_array = multi_dp ? updated : orig;
 
-		if (!desc.svid)
+		if (!altmode_array[i].svid)
 			return 0;
 
+		/*
+		 * Check for duplicates in current array and already
+		 * registered altmodes. Skip if duplicate found.
+		 */
+		if (ucsi_altmode_is_duplicate(con, recipient, altmode_array, i,
+					      altmode_array[i].svid,
+					      altmode_array[i].mid, i))
+			continue;
+
+		memset(&desc, 0, sizeof(desc));
+		desc.svid = altmode_array[i].svid;
+		desc.vdo = altmode_array[i].mid;
+		desc.roles = TYPEC_PORT_DRD;
+
 		ret = ucsi_register_altmode(con, &desc, recipient);
 		if (ret)
 			return ret;
-- 
2.53.0


