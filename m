Return-Path: <linux-usb+bounces-35227-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNdZJpv0vGms4wIAu9opvQ
	(envelope-from <linux-usb+bounces-35227-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 08:17:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BFF2D6803
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 08:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B7A830E6F11
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 07:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0CD309EF2;
	Fri, 20 Mar 2026 07:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrEpdPEP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EAE1DDE5;
	Fri, 20 Mar 2026 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773990969; cv=none; b=r1lHWC6cFGNp1p7RdzZ+CME3PepVZN0tafAso+OvOUtipxH3BgW/fdKb8TX1n/DuMHcUoGU94NzW8SbFtrvc2ojj1OUfVNKLTEF3tK5H13u7WGXEFE+8VUSit62+IlIwA/kybew2bLXLrGOgPkIPLCwfDbuxp+SMsGIFs5jadhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773990969; c=relaxed/simple;
	bh=uwZVnODgMG45JU6Yv5E76ubyYRFZJjdJgmzpPJ0euLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BWq+KfodfQvTmh665E5ioPTpybUS5xZZTMCtwj8OlTyO9an5HsSwf52FxiV70mmI+N02/5sByCGQvPAzqf3TB23nIxx/H5j5X3TL/LI79lBk0KM0fRVibUguGfd82QQboV5GqBE+9O4spIFmQXDJ/uIg8wDF6tBBmyR5gLTgR9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrEpdPEP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED3BC4CEF7;
	Fri, 20 Mar 2026 07:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773990966;
	bh=uwZVnODgMG45JU6Yv5E76ubyYRFZJjdJgmzpPJ0euLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FrEpdPEPxtsF8JUFp3ia71jsEcAY+IG4zPq1h1lqRay6yZTm4wGwlloaTkaXCua3V
	 3XCMNMue8hHcM9dUblSeaw878aDsjLtEDCIuCgTZvz5tlpOSpiBQnnHDE9Yg4GhHPT
	 AY9EjwZyyQ6cE/orONktioJ9Th/t6tG5tkGvnC4wP9MZ5+FDj/26NlVr/pq6uJwVCZ
	 sZg9bvfXVshLJrQC4LqoaMigvgJY2vMfCHKCn79XH3DK2XligSOx6AyyZdvDp62dzT
	 /9PsaPlSshKZO7JjmAeZNFWattR6gaLnQ/4+sunIlZHu6f5xkwNfVXR9H6KXZRDuUE
	 S44nkhZCBAtUg==
From: Yixun Lan <dlan@kernel.org>
Date: Fri, 20 Mar 2026 07:15:38 +0000
Subject: [PATCH v2 2/2] usb: dwc3: dwc3-generic-plat: spacemit: add support
 for K3 SoC
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-02-k3-usb20-support-v2-2-308ea0e44038@kernel.org>
References: <20260320-02-k3-usb20-support-v2-0-308ea0e44038@kernel.org>
In-Reply-To: <20260320-02-k3-usb20-support-v2-0-308ea0e44038@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Junzhong Pan <junzhong.pan@spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=856; i=dlan@kernel.org;
 h=from:subject:message-id; bh=uwZVnODgMG45JU6Yv5E76ubyYRFZJjdJgmzpPJ0euLY=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpvPQmOFxwzZBI8PVNThFFbSRrHn3UyFMGboiFj
 AR+sHudp3SJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabz0JhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1b3A//V9yooInUPnDEnA9zUVopFpPUygIVe8+FyIpuVffaXUyiG6thQzjTF
 M7SPaVRMCXvvaqHfrFWYy5Zi4nenPOKJ45eCnsW6V6S57K+cd50fZ1qddb19qmmt5CUR2rJ/TIh
 7mY+IANnbVA69jJMCGRRe8Sz006SbDtxnqCLc6kgRXIA8B2K0de8Fs4JXWC4PamqSdzOLrlEhO6
 5HrESGXvQEGQYTibjLouk6+3Ihslfg1AoJxXwKEKV7E2gr7A4mKGga1YJ7XjF5eopzwi7pm2/ip
 Iiqoy/3KVZXzQj2fPmjZclfe1x460PGnQbcgeaO5Wzsz6EPG/yeIOdH7fj1bwT+1Tc+QTD/77wy
 SQSRRMNKhO43SpI/fwm2OWqC3hFXdJLqj4HDuc8WqzEWp0jiymiymEMAUbUUFJ1+4Jv9zuiLgp0
 bno5aaJFUhU45v86mwNG/4OpJEb9uxH0LEbAtHvtPWWfGsIdmnWzv2bFmFMbWXBVlsjFh4Vtd3O
 bZjeN4AXaPOGLvhPQtXx9S/l00z4vLcXDQKgSD9vyhAScZ/TMIJ6bWx0bwmZQUyzABzV2wrhLK0
 4ycu1wrrmCfRK0pWMJsE7gwhPxcz4DN3iuE1O6Efey0e8sRVDI2J4qbtjq01baU48WEOH7M0uHS
 oyO7ZqiuE3z3oRe62apCd/BAqrpEs8=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35227-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[esmil.dk,spacemit.com,gmail.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F3BFF2D6803
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the DWC3 USB controller which found in SpacemiT K3 SoC.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index e846844e0023..28219968b8b0 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -212,6 +212,7 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 
 static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "spacemit,k1-dwc3", },
+	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ /* sentinel */ }

-- 
2.53.0


