Return-Path: <linux-usb+bounces-33443-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKVCImYflmldagIAu9opvQ
	(envelope-from <linux-usb+bounces-33443-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 21:21:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC68C159670
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 21:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FE193037EE5
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 20:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855FD349AF2;
	Wed, 18 Feb 2026 20:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATEfDOCQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B2E2FD697
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 20:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771446084; cv=none; b=XSVvxuTA2y/ia8EtcfF4m8EKBTf/L2pBp0CS3u/B6s+Bd91guNxtt1bqJNlJq0w082rXnWkCqUPkH9JXzoWNvWh7BPy9QLieSJhDcWmsJ50/t1MmZK2+Gf86ArviW6tbYSMtLySx5nqI+5IoQMblf/ruqNEdSUK5Z0IR6TaTjlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771446084; c=relaxed/simple;
	bh=stUEdsfxtc4bnSAii8le9q2fiTOR/peX46/VHKirbPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UMCUNxg/xcpopY9PM2xKPf4jWJcKJ5bDTAXPQu/fkFY6DIKVvfIWcXnIQo6xULpHE0Y7S4tVWagHLMcbCEMLbnJLyByk12p3P6G2B+vMOsvuwHt3D7mOYXoEq9Ho7o1XCzn1taQhgphrGkYuV0fHc/yPgPtGr36TpUX191hiXXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATEfDOCQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so2039275e9.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 12:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771446080; x=1772050880; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WkBH3Pq8yF91vpQwDAd3nKXebRuZ5X1TEOAqkn6IWvw=;
        b=ATEfDOCQKyHY2Ckd+ikF6BFAXA7476mJOXiwv+Xgb4fDW0AU0eBSoJEWgxT+dci7+f
         oMAPj8Blosr4c06Ez9SIr7SloAVHnUe3ilxWYs5NFP9wZbnvAlrZDIlBq2jVAOci9zp5
         Cvknbu5rZs7C58YAMwD+hs7dEgbU7lkQgP1QsDkrqPv7abbIChiEMvH+tD7HcOt1hh17
         cXGV0Q8PmphfHoN1POLOiL/9+d8VXxDiwTcSR0kYH8S82vrq1gnJ3EcWQperbYc7KJKp
         g7GeKRgbFhWsSRwB6SBXB4cMQVmCZOHZsUVQHcAWRXK5YO+caSnzZN0jBi0gXMHY9Mdp
         ZaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771446080; x=1772050880;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkBH3Pq8yF91vpQwDAd3nKXebRuZ5X1TEOAqkn6IWvw=;
        b=C9EE/2ZvChjAqSYo1kmeej5fvKd1McjEB8a2TSqmjm2jihBiv2htQhaZFHFKejJpnY
         GmQ4cefp7IYALDprzIGx383UDZTyDPW6+C2Ejce3H8V0quVQfcGS2YsPQq3uQV8Gv7p6
         yo1ISNm/qtivHhDX55Z1fbPCno8yrPddrxNnwIEb22pL4JogoBe31vkl7ynpufeie0fq
         ScPGGsfqsjyBvzY4ximeNn2+Co91mKrwSQMrId9z5Ysw3ISVgIo5Poott3fVJVtx9LSr
         mXDOgwr4DI5JH2vfLznIPVgAYpLaJmxymQy9bot8XTNbAdmnmZVmU0L3gQHQDpmOXeQ2
         bLHg==
X-Gm-Message-State: AOJu0YwSLDOUwHwjInuAjWh5UM5FIqzbariIjYvAiD3xUK3MipcNh6Kl
	8KacOeMdWB/UQZzFEmSTnsHIpCpY8Nvhvyq1OXRmyqe8JSBEZaAJ0apXafnApw==
X-Gm-Gg: AZuq6aLlA1IzmPBmBSie42qr5JNNDpoLtH1vnjxdlSqwTh4uDsHYlLFnr+EuxEZYNUx
	0D6HTkvrSlLYRaJqjqbmmO14+CGIN6k+f02PjHxQteM0nMc8ZY8CL7fy9caDtdjOrTm+YEmVJTa
	5hcImuQi7w4/Sdav1UyiP95s2ACxZ+gBUnuA/1oDi8FyjX0RonuJBvJhI9Guqef7WH2Dg/ywc5m
	1GuEZpA/WvXeo/F0ue7aJZPWqqwuNSCW02TCFfbByoVMsLLeZu0nwcUEIJpHDVM1h1X1MM+3vLj
	yG2RUV0ca3mbO3nTom5s9IdKosbdNecgUXKn7YmL9BCGrynfcmtBTkcYiidEEL3DJkvcS6467th
	8VMjJEzrLNbhQ0QV38C5xiy/mpnLNl7WrfuhR23qvgISPP+c4TJcTKipptqZx/6LxFlqm7QZRbt
	VXTHNEe7oJAt5v7r5U0U7y8v1D/1EFVVuCDlZbXm5rSGieRoI166/n
X-Received: by 2002:a05:600c:1986:b0:483:71f9:37ef with SMTP id 5b1f17b1804b1-483739ff8f5mr330227005e9.8.1771446079805;
        Wed, 18 Feb 2026 12:21:19 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-439567aad3csm9911973f8f.36.2026.02.18.12.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 12:21:19 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 18 Feb 2026 21:21:07 +0100
Subject: [PATCH] usb: core: don't power off roothub PHYs if phy_set_mode()
 fails
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-usb-phy-poweroff-fix-v1-1-66e6831e860e@gmail.com>
X-B4-Tracking: v=1; b=H4sIADIflmkC/x2MywqAIBAAfyX23EJaSfQr0UFtzb2kKL2I/j3pO
 AMzD2RKTBnG6oFEB2cOWwFRV2C93lZCXgqDbKRqpBhwzwajvzGGk1JwDh1faNu+M8po0UkLJY2
 Jiv630/y+H+tA0KBmAAAA
X-Change-ID: 20260218-usb-phy-poweroff-fix-c354b6ba142c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33443-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j4g8y7@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DC68C159670
X-Rspamd-Action: no action

Remove the error path from the usb_phy_roothub_set_mode() function.
The code is clearly wrong, because phy_set_mode() calls can't be
balanced with phy_power_off() calls.

Additionally, the usb_phy_roothub_set_mode() function is called only
from usb_add_hcd() before it powers on the PHYs, so powering off those
makes no sense anyway.

Presumably, the code is copy-pasted from the phy_power_on() function
without adjusting the error handling.

Cc: stable@vger.kernel.org # v5.1+
Fixes: b97a31348379 ("usb: core: comply to PHY framework")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/usb/core/phy.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
index faa20054ad5a1c3f704cb9f70b5049cefdab804e..4bba1c2757406a35bf19eb7984a2807212374d18 100644
--- a/drivers/usb/core/phy.c
+++ b/drivers/usb/core/phy.c
@@ -200,16 +200,10 @@ int usb_phy_roothub_set_mode(struct usb_phy_roothub *phy_roothub,
 	list_for_each_entry(roothub_entry, head, list) {
 		err = phy_set_mode(roothub_entry->phy, mode);
 		if (err)
-			goto err_out;
+			return err;
 	}
 
 	return 0;
-
-err_out:
-	list_for_each_entry_continue_reverse(roothub_entry, head, list)
-		phy_power_off(roothub_entry->phy);
-
-	return err;
 }
 EXPORT_SYMBOL_GPL(usb_phy_roothub_set_mode);
 

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260218-usb-phy-poweroff-fix-c354b6ba142c

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


