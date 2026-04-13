Return-Path: <linux-usb+bounces-36201-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGcrMdTW3GmcWQkAu9opvQ
	(envelope-from <linux-usb+bounces-36201-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 13:43:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 412733EB71B
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 13:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 133FC3028667
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 11:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623513C4542;
	Mon, 13 Apr 2026 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="uOv7hYX5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8053603F6
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080560; cv=none; b=XnYmgjgeqJBlDLQtVcJPemb/R/sm1qpfAyAXNWgRu/Ub+pC/yOMvOaDya1mzT2lwNeKgKFOxRzOMMo6N/retQBwHTaLLKa9dRjy9i/HT8znyxN5LzApdFyGtpEaBQ8TnayfgHQ4Aoi5RVyVwSKdl5g2Yf62IVXQPNzcvCEFpKUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080560; c=relaxed/simple;
	bh=0qrQDtg/iO+GuWnNTcreS6tqsL6qXGvlukyNO4uPxvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQwFpVioELPICDKrwUXHOCd796+AJBWfI7itCdm/T3X+mXCOCFhEkS0HeE8XtB94Vqp2i4QF9FX4Xen7mT9W0GGYoGzoAGhoeWAvpdJB8c9UktsklN/Hrgvr/p7EMgXnFvxnr17rVSpLr6oTDXeOSl0ALNtx698irVeCv2BsRGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=uOv7hYX5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488d2079582so37831535e9.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1776080557; x=1776685357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IjMTVS/gOBqHrtAqQ1Hrz/YK4AU6mgf/uKtZN6EAfE=;
        b=uOv7hYX5WVZZ4gLwONF1vdUv6S0Es36G1mL7mQzcs5Hu3i4smBGJ31+mwgyxfgIa+x
         xOD9sPbojAS/U3DgMG05UwdhBr9XpN2W66UvM/a9NpQ9ZdUG/AVTAcFSFH9C/anTpleY
         QIB0pU3dJlHCBgvR9t9wfcvNvkh5CWXQz5s1WagvafV/WrNrsEcaLE4ZVkV7TRiE/HLZ
         uBmJ6ngzFmkvOBEXjhHIz09NIraOppJ5Tinki44S2zZqLhiNEcD6TnLM6Yzi5g9vDXZ8
         fzI8+qqOC7K8WZR0qvimEteIKd/u3A0CNqfOtrTvGg5OFHy2zRnVKsibXDxjCEOMg4Wo
         txFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080557; x=1776685357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+IjMTVS/gOBqHrtAqQ1Hrz/YK4AU6mgf/uKtZN6EAfE=;
        b=LJYxvP7iDBa8xju4u8UTAQwZhf/ZkfP+Hrn1ZMxAAhHAgUW7eRhOagFvWd7mCU6rms
         ZdAFOTptrYLzgXaK4iRu1kjFU6OMHo8QjDztzKOAK1ab2aC8A3gCzInKPAp7EmZXS8QP
         TANCKS+nGOaGA3qk5LH6Ags3/0uF5vy4+PV6CXx88PFminYfK+YXie2MC9VoFO99+3Oc
         jXUNVU9F8OAED3RddzBQUDl+tm6rEOTOIYa0WRiE8S9xtwZq0pWG8QrlBAwG3R0r5eKY
         /m6+hJ/0IXUB15SKiyFAjyprKd4SPALVRl6D0r6TQXgvyMiGy3mCwlWW4vPdrmJpRq7s
         NJ/g==
X-Forwarded-Encrypted: i=1; AFNElJ/clZS2gihUHbaoAp1e3niI5k3oMks3U3/m4E1RbENnFMl1kQbWu/vZt9HcUXEgBPPxBKMg2QrmN60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysg2+9KoLxebH7qnmSmILYbSPTF5fM33hjhtKAm2zfXhk0+rfW
	SVc7ghuDexiQ9YPIwqs4oDun05mqdX50c3ozxlndFkDtraUgb31GrGikUd8EYuICFw==
X-Gm-Gg: AeBDiet+zlUjNThJ9elri0UMJbVTBhxkHQLaiSPXlk+hEOwsgekYOawxswRRNgdMsWu
	tBy3P1IW251eEFh+xgcwVk2Ku2cH7uK6HHGYeVnRZ0dnFro90WBZwzVZwYVpQkPZQee7FKXd7sR
	iYuB13ORr7B13/RHo4s5CiI0msH9Qs+kdlXhSyvGtUt4X1pG9/eRvWfpiiVKF2chZba1KpSekYl
	khqHx+Ok956l2MXbxHocwhOtwZF7H2JgfHzHWeMr0UfP+IKi8jEgZ+h2JHNEMa6TmGOnBZuXM77
	O+VhEz6ZXsltgFq6pXkOixqgm7CaTn4bNCYossH7tdH4DLNZIMwTNq5bq0O7DR05hp2d++K4jWd
	+v5U32AbZLuFIpFQDX+pX5oqHf8iz9HG1BgTxekWkAbfmF0qTjr9h4x8gZmPVaj6XjnlMEjJhpB
	Yhvpk5JfWpqrD/RNws3EyphmWYLq5VnU/s9ojz4+CQg8wUdtn9fGcAhaHmFTZqZR5tk9km
X-Received: by 2002:a05:600c:a306:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-488d68607e8mr124377275e9.21.1776080556957;
        Mon, 13 Apr 2026 04:42:36 -0700 (PDT)
Received: from horizon.localdomain ([212.105.128.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67b46ffsm126301165e9.6.2026.04.13.04.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 04:42:36 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Ricky Wu <ricky_wu@realtek.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-usb@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: [RFC PATCH 2/2] rtsx_usb: avoid USB I/O in runtime autosuspend
Date: Mon, 13 Apr 2026 12:42:31 +0100
Message-ID: <00a2cae4c8243a39d254edb329b5a76c24d38373.1776080528.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1776080528.git.sean@starlabs.systems>
References: <cover.1776080528.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[starlabs-systems.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[starlabs.systems : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[starlabs-systems.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36201-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@starlabs.systems,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,starlabs.systems:email,starlabs.systems:mid,starlabs-systems.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 412733EB71B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The runtime autosuspend callback currently queries card status and clears
OCP via USB register accesses.

On some systems this can deadlock runtime PM and leave the USB device
stuck in the "suspending" state.

Avoid issuing USB commands from the runtime autosuspend callback.
Instead, use the last cached card status (updated on successful status
reads) and conservatively assume a card may be present until status is
known.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/misc/cardreader/rtsx_usb.c | 11 +++++++----
 include/linux/rtsx_usb.h           |  3 +++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/cardreader/rtsx_usb.c b/drivers/misc/cardreader/rtsx_usb.c
index c8badd0db87b..727205e84640 100644
--- a/drivers/misc/cardreader/rtsx_usb.c
+++ b/drivers/misc/cardreader/rtsx_usb.c
@@ -336,6 +336,9 @@ int rtsx_usb_get_card_status(struct rtsx_ucr *ucr, u16 *status)
 	if (ret < 0)
 		return ret;
 
+	ucr->card_status_cache = *status;
+	ucr->card_status_valid = true;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(rtsx_usb_get_card_status);
@@ -753,16 +756,16 @@ static int rtsx_usb_suspend(struct usb_interface *intf, pm_message_t message)
 
 	if (PMSG_IS_AUTO(message)) {
 		if (mutex_trylock(&ucr->dev_mutex)) {
-			rtsx_usb_get_card_status(ucr, &val);
+			if (ucr->card_status_valid)
+				val = ucr->card_status_cache;
+			else
+				val = SD_CD | MS_CD;
 			mutex_unlock(&ucr->dev_mutex);
 
 			/* Defer the autosuspend if card exists */
 			if (val & (SD_CD | MS_CD)) {
 				device_for_each_child(&intf->dev, NULL, rtsx_usb_resume_child);
 				return -EAGAIN;
-			} else {
-				/* if the card does not exists, clear OCP status */
-				rtsx_usb_write_register(ucr, OCPCTL, MS_OCP_CLEAR, MS_OCP_CLEAR);
 			}
 		} else {
 			/* There is an ongoing operation*/
diff --git a/include/linux/rtsx_usb.h b/include/linux/rtsx_usb.h
index 54c6ea82bf43..fed695760691 100644
--- a/include/linux/rtsx_usb.h
+++ b/include/linux/rtsx_usb.h
@@ -62,6 +62,9 @@ struct rtsx_ucr {
 	struct usb_interface	*pusb_intf;
 	struct usb_sg_request	current_sg;
 
+	u16			card_status_cache;
+	bool			card_status_valid;
+
 	struct timer_list	sg_timer;
 	struct mutex		dev_mutex;
 };

