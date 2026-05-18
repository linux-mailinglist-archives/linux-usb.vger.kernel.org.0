Return-Path: <linux-usb+bounces-37570-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kILOCkekCmqw4gQAu9opvQ
	(envelope-from <linux-usb+bounces-37570-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:31:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB33056641D
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 810FC300F186
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 05:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43053A785D;
	Mon, 18 May 2026 05:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HT7ydulv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6251A3ACEF4
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 05:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779082300; cv=none; b=LdjI0w3SCZeamiGqx0JPaRpjuJ5GsW1xtWOEAWbFXFcOPav/hwPnPK6gNq6wUlfVsHwMgxhV+bO/Pezc90aIV6wADut/IAgmDl3NNTLkE9f4f/xWJ2FDHTkCKUMeBoW+khtR4UzW9+PsqmePH2mITiJOjzqson/YkB32CiGzNZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779082300; c=relaxed/simple;
	bh=EVprCTB8Kh8bPUFs6AGSUyf6j4PF0yXwGYHY9k2BzlA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tdHK87zZXJ7ToeX4EUaKCHo9793Z7O1O8d1dF6abns9tdFFn10NNHMu3zk5lgsRx7NaOtRJ9To4ujsqWG6SIiEBsLnVUWnkOGOcWeWq3V5Cop61YNMlVcbNIfafMm3CKHNfMvzjE8DetflkldEErzZP/a/CocA977AP08OaV0es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HT7ydulv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48d102471a4so13284985e9.2
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 22:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779082285; x=1779687085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19WBiTVxxkWr23n+/H1N3imVfxB1B+HxV4kPuwWDblM=;
        b=HT7ydulvFSvnxJwi3u4PuzOzwRmaw+Yt1K+Bi1S/8PI7zz6a5uzaehs4W+Us3wwOiP
         xPMtqPJW/vZrujA1u9eR5ZKSw0dsrn15/XgtYL8Pwv/w2c3JDMkHVHPN1LbzoMYKhR1Q
         1DgV7JcYMebPg1BKYjDXsF9WY3Yd4vgZ5M0HDck9fWYEiQ7H9macDEohVvBW3LnmOl9m
         bLEgmIWqugAiHnWwOJiY8d/rXX7h2q1WvZxnZOx0DpZmRjQk+zp+F4adqtk6Ukiurz9Y
         AWTklxh3VBVe65XdlpbfH06vF2xTH/Xc5Ku8gXQvUieLbpuvTk7Vlh7k2L0JyOHZmoNM
         QYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779082285; x=1779687085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19WBiTVxxkWr23n+/H1N3imVfxB1B+HxV4kPuwWDblM=;
        b=r8nDCJ4GFRaEyKp9P5NwEVtx1u+8YH2QAMnSAsJzQ2E+Y+8zhni8+g7o8zeFImBloN
         Kiy43QCXXB8FD87IgvDJuc4WyeptL+Ib3XV9Ou88n0rRcGtOcz7aSDSZISeJf28fiuqd
         PLmyrl5ob2qeo3UZFJfOs900AF2iH0WzrqgJSPKjQi7s6q6h80lIYeSPzRxksVDtDRm2
         ktzcfAauk8hXL7zUZrsF1ihmxuuyIRBQgEVX+Wtx6eMVWlpUmod36zytuDOAjhLo3nDe
         3Du7LGAJNIXddua7AACfoufsoJLczb2kYLKA4sPit1gH4qQ+d+LzsIQZraplyop1Rtkl
         wkUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TWIIMjoX4744db1++IMxHW0hiB/hrlyNfNVFsxNKN6dmKjfv9VodYs/w8s4NETe8BfwNE98wUMBY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt6Aly6QN4OPowFrozKN7akbLW1g3febgrOGvRwamg+dKgYL5/
	ZbCPdE1VHNbGaPizuc5VMPL2XxslPxaAcg8a+weeVOCNBObMti5RddWZ
X-Gm-Gg: Acq92OHT+h5dRSuxNTOnJjxxauqHUH7TJURI5txEm0OgLGW+Sr64LP3zac7rEJmiHD7
	SHp1C+tEFiqTbjO0l+DDucmcPM10Y2JigPQpKUcil4qDDD8hxuEOBQ6S0Ck+e8YYmsP+oPu5zsH
	K/6pSGukD0rK2r81Y2sYigaOWGY29o6kl9Oh0Eqt4CxiCccb27fpdwfvZusy6n52/f++fNGP6j/
	DdfWreyx6J+E4Dui0d9P4hbZsVBiUKFI01B/YU3Ar5i+9RrekYlqgBj8TqVoiR7PNY/purWwtEG
	jeIELd+WCHR1MJL8M7yiPnFqazICZP4/fuv5QIuY7IDrvnRHvDiPxcIhTZeVUCg2YyBdV0+Q32/
	MQxug5a5Sw0a4LowzT/WRs7/HmjmfL5jPjigPmVCmLe85+qDY63B/3Z0Zcu4cyjr3pGAPX3ZF85
	h8nQDeMJauz+ToIi3YVGGGCcsil6EbChpv0CspoEE4tLk=
X-Received: by 2002:a05:600c:a11c:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-48fe5fd536amr151451185e9.5.1779082284739;
        Sun, 17 May 2026 22:31:24 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2c96csm76033455e9.2.2026.05.17.22.31.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 17 May 2026 22:31:24 -0700 (PDT)
Date: Mon, 18 May 2026 07:31:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: "Xuetao (kirin)" <xuetao09@huawei.com>, <caiyadong@huawei.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/3] usb: core: Fix SuperSpeed root hub wMaxPacketSize
Message-ID: <20260518073121.7bc1da0f.michal.pecio@gmail.com>
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
X-Rspamd-Queue-Id: AB33056641D
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
	TAGGED_FROM(0.00)[bounces-37570-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

There is no good reason to have wBytesPerInterval < wMaxPacketSize -
either one is too low or the other too high, and we may want to warn
about such descriptors. Start with cleaning up our own root hubs.

USB 3.2 section 10.15.1 sets wMaxPacketSize and wBytesPerInterval of
SuperSpeed hub status endpoints at 2 bytes, so reduce wMaxPacketSize
from its former value of 4, which was derived from USB 2.0 spec and
the kernel's USB_MAXCHILDREN limit. They don't apply because USB 3.2
10.15.2.1 specifies SuperSpeed hubs to have up to 15 ports.

Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/core/hcd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 89221f1ce769..b181b43a35dc 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -328,9 +328,7 @@ static const u8 ss_rh_config_descriptor[] = {
 	USB_DT_ENDPOINT, /* __u8 ep_bDescriptorType; Endpoint */
 	0x81,       /*  __u8  ep_bEndpointAddress; IN Endpoint 1 */
 	0x03,       /*  __u8  ep_bmAttributes; Interrupt */
-		    /* __le16 ep_wMaxPacketSize; 1 + (MAX_ROOT_PORTS / 8)
-		     * see hub.c:hub_configure() for details. */
-	(USB_MAXCHILDREN + 1 + 7) / 8, 0x00,
+	0x02, 0x00, /* __le16 ep_wMaxPacketSize; 2 bytes per USB3 10.15.1 */
 	0x0c,       /*  __u8  ep_bInterval; (256ms -- usb 2.0 spec) */
 
 	/* one SuperSpeed endpoint companion descriptor */
-- 
2.48.1

