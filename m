Return-Path: <linux-usb+bounces-38266-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAKHF70THmrugwkAu9opvQ
	(envelope-from <linux-usb+bounces-38266-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 01:20:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAE66264BA
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 01:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 319A630CDF38
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 23:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2353539184A;
	Mon,  1 Jun 2026 23:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXlGpQhx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A913C384CEF
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355766; cv=none; b=aYjuBQFnXaJY8CbVM0+mPA8pVOj6omErRAckaH0AkMi3g7rup8Rw4SfkYD23A5mey7Qtx3V453j/wKvhTosSt28XTb2Okrki1q9ZwIwLLPK61l8Enq53paV583/2zAhd1yPooHtrIk70QEtOSLUdNgnLJ8BNo1LlA7aRyyURw3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355766; c=relaxed/simple;
	bh=qVUeQWS/7OtGofvve8QyxJxwmCBOhgxcSSPO4Frh6Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sa1sqRaRGGbNT7tYOu2E3W3GLhb1wP5QZJnGBI6TIWYei8fhyOLuEuxvGqMsXZQaNgKpqmUiPmGvOZGQRNTkoD4FTfd+uP85OHq/vY8itWRhOoteaEMoyQ+e34J9stj79E4G1X+x8i/LEHF2fglXhSLat/nXo5e8rDzL521SV6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXlGpQhx; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so1245041a91.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 16:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780355765; x=1780960565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ozxx9tq3sAfLk06YmZpKiSWd0rtmuUYU/mrvthF8nNs=;
        b=hXlGpQhxNQdWiCaI8N1fRglEohxieF4dhummgfPtcbcUTQ6dxhjCz2aPb9W5D0FjyU
         vGB7yWsvlNZ+Jirq6I8huFjHrYBWJTU2X1zkt+koK8WWVpDBdvkozcKz0xUQ1pr/tt8C
         MvwZR8xwkmKxNDHmSwVQ9T5DZ+CtG/lojl0N6BxKa4YEW0Aqxt2zc75ULVkR9DdMgQXH
         BBqloJ4F3/nn7x1nCOcTgmI+ppn/zA+SS3Ssb/AHi1Iz3S3EqQK6qnr6FNySKCAZN50n
         96xGIlxSRveE1oGimfVI5ikF7RmLk1ltUf6rX4lmtiKrtQP+63U0DTJvWN/CKEl4V1Nt
         dDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780355765; x=1780960565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ozxx9tq3sAfLk06YmZpKiSWd0rtmuUYU/mrvthF8nNs=;
        b=q1xHdhFn7R5xhsv1CQIDxrHWPzwxauL6ilVeUF4ff7hv4h7pCr7tca9em+2vqLPWti
         9CwqtQ3YuKlsxljVkveH7UfiKyaSXpuYU5bGYqGyQVLprO1LtqQYUqrJHcipgYSeteEB
         NexvEPknJW6kS4kB3qt1pLlEjoSeDly4HnxrzKj5NgvsXFIIoJnaK7VW6hxn1QEP2tnS
         RhRcGWJLVZUl6FAJM6rk7VSnsksrXDjE/w6g/MiWusnCIyo2ULrfgeY048OFFI1CP3wI
         HFJzhJjwVKUJo8ouZlSXYZPTDBiNlOl77S0Sla7RTOCeyoyN6HIr/JaIz5CalFXTbnHP
         K/Lw==
X-Forwarded-Encrypted: i=1; AFNElJ8AqUcPXJLh2p6Kb2Ps+c6GqR9Wn9OQzRWK6NHz9rnh0BRaPB2zlb2PtOaxGX+SBUkDSglB8BSKBsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsvFFFF2i9eb2sHKd28OYBBRBlJTductPQz9GyKX3ZQ3LSCNHt
	RjrmMO2c6YD7My0cuOSnZT1Zoylg8Yfxii1tPlYDFGqkhDVmRjtQcCxU
X-Gm-Gg: Acq92OEjTOWl0//1hGzsGe+gFGfdOWbpB7zL+g/zza6h38oIubVHgOd6xilmwhEN+FM
	nXBS2upQP+43Dv42GXuoPaZ59KwM5+CO4EE37gonzI3e/Fi3UYXgiWh7C/EwOL08t7QB/Wbn4rh
	DpjYsUKgZI5Jp3m/YIwX/qBRvusy3N26U2KQ3KIq/XOuzXghtsSYm9ikvJWeweRNvrLG5c1BzjF
	yLFYK29LLtX3AEER9aQ0ZssSBB5q2Xl4iNO2rwpv8d9A9zzJjO+AkAcOfMd2UfK+Mo1UiG5EBFm
	G+WMuogCldipbeTI9EJMbAahbtU8jqnufG0jaXYw7JFoFOH7daaQ9iPo/Icnktqqaj3t04aoWxZ
	6+2yvQ/FNGETcKYb/ddQfB8L3O0boq4ZNSc4yDJ0EDdzCfcskc+qB4nWGfq897NUzslBlucfZEA
	imhEqm97t4edwAI6nB4egkSVV7XA67wntDltDOSHZmYVWn1y6FwkG2dGI7lDw8aagWUInR+Tax6
	b3O1egTsyHHFcnIsdMX
X-Received: by 2002:a17:903:1b68:b0:2c0:bcff:e18c with SMTP id d9443c01a7336-2c0bcffe26dmr93746255ad.37.1780355764824;
        Mon, 01 Jun 2026 16:16:04 -0700 (PDT)
Received: from tomriddle.canterbury.ac.nz ([202.36.179.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd24fsm143815355ad.20.2026.06.01.16.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 16:16:04 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>,
	Oliver White <oliverjwhite07@gmail.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100-microsoft-romulus: add phy-reinit-on-resume
Date: Tue,  2 Jun 2026 11:12:36 +1200
Message-ID: <20260601231236.20402-4-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601231236.20402-1-oliverjwhite07@gmail.com>
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-38266-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oliverjwhite07@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DCAE66264BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Surface Laptop 7 gates the USB2 PHY power domain during deep sleep, causing the PHY register state to be lost. When the DWC3 multi-port controller resumes via the fast path (device_may_wakeup), the PHY is not re-initialized and USB2 devices (such as the wired keyboard on the USB-A port) may exhibit corrupted signalling, e.g. stuck modifier key reports.

Enable the 'snps,reinit-phy-on-resume' quirk to force a full PHY re-initialization cycle on resume.
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 4356cb88e2bd..2de244ffb54d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1731,6 +1731,10 @@ &usb_mp {
 	status = "okay";
 };
 
+&usb_mp_dwc3 {
+	snps,reinit-phy-on-resume;
+};
+
 &usb_mp_hsphy0 {
 	vdd-supply = <&vreg_l2e>;
 	vdda12-supply = <&vreg_l2j>;
-- 
2.53.0


