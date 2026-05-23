Return-Path: <linux-usb+bounces-37965-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLGNIOplEWr7lQYAu9opvQ
	(envelope-from <linux-usb+bounces-37965-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:31:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 429655BDE71
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D24E301A162
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 08:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20001364032;
	Sat, 23 May 2026 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjqg9z0F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA513624A3
	for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525043; cv=none; b=OEuBbpPCWMBDvkxis8zEXw+LhYZjR/Y6/Kxn9JHLJ2JE6icvnJBhdq9LJ1ZgNsaHgc59Q9iNyDCTmfOKT8lJIi0aNv56ruvFRFnebEFtpj7pC9WU+f3kI7u1NYpoD6niseG00vBKss9Mfdk2LbFJsl4T7kUnCEdrK8LY57TmCsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525043; c=relaxed/simple;
	bh=b4zUqL1Ke9Cs6I32xqzsUT0DCZF3QkH23uPT8sySGAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDPv4YKmNJdj8gbmvZX3v6JtNjFWr8d1GsbXRkAlL4um5NwhbnwlZrhCZUbxrs/3FJoQf5rnZ3RGcWTXGRLc1KnaGzfktOknCAUC+L+CxsFjC2hOUyUTrS/lIVsld6Rfv1TMfyrkR9FMq+yZ5sJElKDh7wlMs8trEXdEFcTIAfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjqg9z0F; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bd6460b0d11so1432561466b.1
        for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 01:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779525040; x=1780129840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6p+M6SIjzcIcxd3MTES1MZkiaQb7Dr/HC9nyX3iDS8=;
        b=pjqg9z0FRTFWOuubUxmbZQzuonL3Ld0EMv+22tPnGPy/3yg1zS2z5zYYujAOoCmLom
         qXZqIYR3fHZnSjkM7YhU4PuwPoCTJlnQE4aT0Jc+E3KovC7H3jYsQntqSgsx/flPJbVg
         A7g+pg7mX9UH961QTOOvkcIU0eej4wOfnbd9sstKhMCuH/ewLMvPoq9aFWH47Aml+guC
         /Pm5NNjWjoeVqbM5a4VRaHWoI5C5PHR7kKF+pSM3ZYo5120MX16/Nk7VbIggH1edwPKu
         hVpoVMjYC1DIKounLREek5RP8EDslzt95E69mZY9J8tGljAipPJy21hlf8MlF6jfDxuo
         sTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779525040; x=1780129840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F6p+M6SIjzcIcxd3MTES1MZkiaQb7Dr/HC9nyX3iDS8=;
        b=m+tzue4tMp7pqVZrz1ZWYLgrTzyU1Fb6m09LOe2LK0fPj8w6Licmch1CJ+MtrW0llU
         w0Eo+VdTZQw+eQFrJ1CVXNGhR9dxz6mXitPU5F532dI9BuuQedt3lFxGsYiaL+Uld9x6
         WJ9XadjjSetKGb9VUAq2RHmBu5YEdmulS+mKt0yrDHpa8F11zwGwah5kGnFfP0p7xN6R
         icTIZF90ufu2nVo/23JUvidV0wiiBOorUzchzKUHf4smcdqQVzjY6/E9UUPqhxO8STnc
         +cFZ8TJcjVcVaPVlEPCgiER4OteR6+/cj3aSAlNCE4wxZ+GUyXoljBg9boNCq80Ij32/
         a4/A==
X-Gm-Message-State: AOJu0Yx/ipVNUFPckeCBDOlTHgKs1e62e4uAwfU1RZiQW3cYRad/VHZx
	z+nXLGbRd42emEkB/6P6t+8LSp/sx8Rs7376JhwwvonkNbQdv/zEA2l4
X-Gm-Gg: Acq92OElmVmMTXgrtmo6NFYc8n7rfVXpG/uSTXHzyr977Ys35wR5MzjGL6cOHeRBRdX
	AxYHSYPpgiVDOU0cs9NkuQQMYwoo9rHYD2GaHxDPKkYXmt4rlD9w3SJ+rI4GVN09a4a6dtJqFLV
	k73IkfoIvLJvnSI8g3w5K6AO61heYfzqZMMvdpBcdwIAy9nz7ZyZJySl7GVlHjtKhoXVxUJo+tx
	qO+63GpKzNWhZrabBTOvxe1sTDoBzyxF93udoB6PH69lZL+przzp8LH6GOlx2E7o8E5XHrkZG7o
	wv8A1Nqtp1mZAvH8KBTPRDv8JgWeww4Yg+YuPKmwd3jEXHcqnjj/qwwkUNUKoW1KemQvhnUrwcc
	RdXjCwQ4+BrpysL2zMFhbkYMabYakcemyX8L90jDX8Xh+fczzQg6xznxge9WF414r/Bu77VXPGb
	aqlKMnZjLKP93P
X-Received: by 2002:a17:907:74a:b0:bcf:5de8:567f with SMTP id a640c23a62f3a-bdd2580c412mr414994766b.28.1779525040277;
        Sat, 23 May 2026 01:30:40 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1651856a12.30.2026.05.23.01.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:30:38 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] dt-bindings: usb: chipidea,usb2-tegra: Document nvidia,external-control property
Date: Sat, 23 May 2026 11:30:10 +0300
Message-ID: <20260523083013.46372-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523083013.46372-1-clamor95@gmail.com>
References: <20260523083013.46372-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37965-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,nvidia.com,gmail.com,nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.969];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 429655BDE71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the nvidia,external-control property required, for example, for
USB lines in HSIC mode connected to a modem, where the modem requires
precise control over the USB bus to properly enumerate all its stages and
intermediate devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/usb/chipidea,usb2-tegra.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
index 78046f8a63ad..d99a18900b5a 100644
--- a/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
@@ -40,6 +40,13 @@ properties:
     type: boolean
     deprecated: true
 
+  nvidia,external-control:
+    description:
+      Indicates that the controller is configured externally and that the host
+      should not attempt to access it. This is usually used by a modem that
+      requires precise bus configuration.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.51.0


