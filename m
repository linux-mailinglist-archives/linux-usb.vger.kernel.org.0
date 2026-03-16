Return-Path: <linux-usb+bounces-34888-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC/0BUokuGk8ZgEAu9opvQ
	(envelope-from <linux-usb+bounces-34888-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 16:39:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E029C94D
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 16:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C91730F3104
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CB13A0B1D;
	Mon, 16 Mar 2026 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8fPj7/Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2634F275
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675015; cv=none; b=NU+Y38ES/gUTGnt010e9IZdPbI0RBjWbf3mVZP/wP0uHAGjSwQE5LCYy3ugwilMEEKFVqoUfwtZR48Q/+EFR3T2O7kMihsqkxjrAlPHSo/r6ejcSmhZOJWSdppWMIhNwgmy/0dN73CfaTHV7pbKeQyuF+dY8B0xtDoksVyzV7ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675015; c=relaxed/simple;
	bh=M9kVaC+3Cr459HgO4DubNcbQRmLEGq9666e5ZHFrwxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YIhQcjERgzi7PGEB4jAdozABxvuSxNh3HBCrA4qN6cLN8VFIOHdBzcMx5pEf/ZbRYoCnnFS3OgIHUQA2fGDzVS0StSLbAtB9SssQgTsQsKDpQe2kRBnpzIaAS6eg1EeM3ssnp7Clpfl+YT2uwt/5M9SUSvCUStjbzhfbFp2NiCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8fPj7/Q; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so1644878a12.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 08:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773675014; x=1774279814; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aiYHquvove0P0QSfsD4NZMy/bqp6mn9Ek+dpN0QYTm0=;
        b=T8fPj7/Q9iBc8vAcLciiP1ugBuQhcv1gmhhlHwIzdP6WV2vLilp3azaiPGECYjtpo3
         GcMP+QdCpFXUDzYO2z7OtJOmrGpByv+nduS28a5hVvharX+6MgRodeBeeRLGwoMOY1e2
         u0nuZ0QzJAxi2wp8LpSFE/2ORYkWm/4hJNG+lJu+tPcKdzZim6mb6YfQM2QUqoMwe8sd
         /QGzQZOBmfaBk/byTTaiRiBuPqKHlRhrbBeU0OqJygQ8Ud70EwGHL3am9jv1umFSmjLG
         bn4qXGhqU1ojEbTt2cO94SygwqtH+G4Y7AycGniKt3fHHX0e5UxVcAYwBFOG4U4N1Pcz
         QrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773675014; x=1774279814;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiYHquvove0P0QSfsD4NZMy/bqp6mn9Ek+dpN0QYTm0=;
        b=sMx1deg0+9QUnYLcfvVsekrKI3LjX0NnucgxJp82GCAQEE0KO3zUqqCyL9eAb2CUxV
         PrD5hwLmQkalsnJwcySfex/EN0OxKz/xF4PHqAhWiEoKHB340ARljkLO72aWW3hc9jEg
         5vAc1EXpsbqZSIYEKvGQIsHWeny78bWUCCDtQJxkp0mu3xk+Wzi2E3EjnUE6qolulwBS
         u95uWiaSuXA6LOBuomvTqQ3Zn9IWKTn4ZdWseZWyLhMUFvTqhupQHb71Heo84rVP0Ui+
         nEYtZDR+AhImQ+RnQL3/Eze4BCkP8P+gKqJ3Eb3NOFefDAoVi/Owyd9/3gPmSVKAWTz4
         XWZw==
X-Forwarded-Encrypted: i=1; AJvYcCWW7841KlgrOfUJ3Z8Q5BRC5v7quxzxUK0XXMv3j8r8Ca8bGXfjkiyM3VIsA+yLUhfL9PvD5i7AgHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQmp1v9apVg77N6ZElmgtnl+2nxIYOq8/BMi25p9PdUKcRd2DW
	jzUkBNehI3LZvd3Q/USfy9fAvXQMhBRNpQre9YClipfCe0LZj2unpNUc
X-Gm-Gg: ATEYQzzhn4ReCFMZ6hTcmaciHBgVAvqgJUMc/9j6ZvYexMav0OuFcV1ohlfJWXlWA2t
	+/nqepC7DyCEgj5ZJCz17tL0QQX83lx/0n/sQBtQyJy/10sxXwO9NWDXyH7H1Q1QHIn5jeG8AdM
	vO4b/eW0xFVQ3hV1Gqun57xrBTyRcCkwKoNHEFKs/UwSvtLrHb0eGycMfyK9bxP8DizC89/6WSV
	POgcDsHp2vMVMfCjjubtiEG4MF4m5ARns8adfejGAshsze0g3adCzA0XerzyueGiuC8nwt6IKQg
	ecZgIaAvVJZfPH5+7it6e9ghaTqxcNa3N9boQDURW4zjBP3YYeP14iJdmVh5vTK2kuu0citUEFe
	4wP3wgT2kUDpTm3n5SumOmZ/SbpbVpdUsP6p8q9YUlZ+KY3HlUtH0zzCSSAEYY2c6td7nXdTr0t
	I2pNf530nUDgVNvgVpOIdUF0Nw9qwz2pmQJ9BC
X-Received: by 2002:a05:6a21:7a97:b0:398:9379:d04d with SMTP id adf61e73a8af0-398ecadb5a2mr12165818637.24.1773675013707;
        Mon, 16 Mar 2026 08:30:13 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb996257sm9392478a12.9.2026.03.16.08.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:30:13 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 16 Mar 2026 23:30:06 +0800
Subject: [PATCH] dwc3: google: Fix PM domain leak in dwc3_google_probe()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-dwc3-google-v1-1-c9bde1b02f62@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP4huGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mz3ZTyZGPd9Pz89JxU3bQUM0PzJOMUQ8s0UyWgjoKi1LTMCrBp0bG
 1tQARqXqVXQAAAA==
X-Change-ID: 20260316-dwc3-google-fd617b3d19f5
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Joy Chakraborty <joychakr@google.com>, Roy Luo <royluo@google.com>, 
 Naveen Kumar <mnkumar@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773675009; l=1291;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=M9kVaC+3Cr459HgO4DubNcbQRmLEGq9666e5ZHFrwxQ=;
 b=xHLSPpZk8SHQGjWfG7//LJvvpOEyszCJ6PrI6sz+mE35M4OL3AD0FVkQB0UX0IaWqxHIQQNTy
 1FneRQRqG+nCC6L0vSU1H/byaZtGy+/ZuQ8rHdQkf3v+SDoHlMMHEt2
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34888-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C5E029C94D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When syscon_regmap_lookup_by_phandle_args() fails, the function was
returning directly without cleaning up the power domain initialized
earlier by dwc3_google_pm_domain_init().

Fix by jumping to err_deinit_pdom to properly clean up resources.

Fixes: 8995a37371bf4 ("usb: dwc3: Add Google Tensor SoC DWC3 glue driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/usb/dwc3/dwc3-google.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
index 2105c72af753..4ca567ec01d0 100644
--- a/drivers/usb/dwc3/dwc3-google.c
+++ b/drivers/usb/dwc3/dwc3-google.c
@@ -385,8 +385,9 @@ static int dwc3_google_probe(struct platform_device *pdev)
 						     "google,usb-cfg-csr",
 						     ARRAY_SIZE(args), args);
 	if (IS_ERR(google->usb_cfg_regmap)) {
-		return dev_err_probe(dev, PTR_ERR(google->usb_cfg_regmap),
-				     "invalid usb cfg csr\n");
+		ret = dev_err_probe(dev, PTR_ERR(google->usb_cfg_regmap),
+				    "invalid usb cfg csr\n");
+		goto err_deinit_pdom;
 	}
 
 	google->host_cfg_offset = args[0];

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-dwc3-google-fd617b3d19f5

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


