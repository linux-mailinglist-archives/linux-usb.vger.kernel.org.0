Return-Path: <linux-usb+bounces-32172-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8218D11609
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 10:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48792304484A
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 09:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58488346E6C;
	Mon, 12 Jan 2026 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxTiHQSC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRcR9Q3X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3DA30EF6C
	for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768208522; cv=none; b=DE1mFfsczNRiVm7wZmCWvnpuyRZ58schGLPmI5m1ai8OxbNtNtER7bDhezKJTgZBFnhjbeck0qQ7x6S9PZcGi44aXWnlqcy7ulLRJbhejOBviX8ens1QwYxS5dT6CTyMWQowW84Rp98NPoz3EinmjtJtWpEgW/m925SfWIaOEsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768208522; c=relaxed/simple;
	bh=BLROFHNZKkkPGtWZHyLHCOUejGGnOYD9zfyf1eBR4TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IFy5CtaVTR8iCxGocYz8KYP44jOhffQAptL86bja3/R5azHjk5E696BBJrT+jzRRUUv2Sl3cSebUd9iTVmyhsphYFq/Ha0SN5K5YDhaZOEJZyVviHBhlnndZWkeTRyMDFJNQaqCSsGdEy/gwZYeuCxZEdWnsdIIXXOvqPApydyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxTiHQSC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRcR9Q3X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C75Eg72443039
	for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 09:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mgdaUWwr6+5woyi1qG/Wu6i0aaAM89h66Ju
	4UFAfius=; b=GxTiHQSCksTcmDJztqiOLptF7wXWTj/F5x1u5mkmGLpsSIyYXJz
	HTSmMXbHC5usKCaG3dN49VzCigIi9qnYntwylsTUXVRivuh2WYdsfUhMV90f6K1Q
	XY0OA53kKw4yUo4qxu6fn7boJD88pMoKLzxvBywjEztH8J0xCfI1xr79aMIY4oIf
	GLZsFlb1YTApi3ztWqv27zNkYyqcPQtS3Y6ckXLdlVTMOUjy3nSqVBDdUL6oWlmg
	cGJMUeSe5x7PxeUHdmCCvY/uBvr1bWSNvlVhdDkKbJ2EbgKG+e7Vgj0XfqBgi42u
	EDSy0YImkbqFvptPq80L+QOaW/dvxoAKlzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf57c9cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 09:01:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c2a3a614b5so1419390185a.0
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 01:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768208518; x=1768813318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mgdaUWwr6+5woyi1qG/Wu6i0aaAM89h66Ju4UFAfius=;
        b=JRcR9Q3XU8S3ydsqn3RvhjhzACV8gJxGksFStJd/8reeNt1kAnKwfZO/VQ/qQIUFN+
         jNKiFz+40g0/YtxNG2hg+aGv6TovFllznd3dqlIO6Ur0bc+YT5sxtHkiFhOqBgXXMTZo
         myfQSigq7iHYQkHiKc5w6jbCsEAkUMbDwFP0qTEEnxN1tMpB9cRDnD/1g0mrKLiC8qtx
         jH5Pgqpu0DrqPO2Y9iMstcou7oPsYgQcAfk0HrTUsr6GJixtIccUi6mFBfTuKPQfAOr4
         bOrGxM2uQEFbmrT4BAuj2ELncXgo0qMmwaXxGtqSLXPbAUrM0ZPaHRALzbYVn/sAjNo/
         InXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768208518; x=1768813318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgdaUWwr6+5woyi1qG/Wu6i0aaAM89h66Ju4UFAfius=;
        b=UlNOxaM4I8CiCRik/+qf5GwgrGTB25m7UctMOCUNVhyYb4fgqQaU4lHkuHEt6ICu0B
         hI1KsUNSxdYlRD1M24OdecVqA0gslNLTS6asb7CaIomTLBFxxS0pnD1Cqupwt9sgosNl
         7zJhAcE5Ja+nthi8soBlgqdj8YyXS3Rmu2tt+EG4UyUwotXZ073hn2jbJToMkdNRwlaA
         yV/FgFuhn0KJd2I3cSBJRMqgjCPR1RxZEfJV2WtalbLEzoX1qRce3LGPIOvTyiV9JyJZ
         ozU+zCgLIGc9tn3gxfkqcysh72TfnDdRyi9mEDpZVnWymIustHfn5JcxvdP/6o1WYHlI
         Z5zA==
X-Forwarded-Encrypted: i=1; AJvYcCUOV7tkHqjNgWmnWL2qbaTjb0GAF2u35SWvEMKfIt5+1UHvOBXuQMyVbyBm4Kdj6a1c/oaIigo/B/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7gTc0INy6KKCcQiQow/MIRWF50j34cz8lqEeXJT/M2W1yrOnm
	h5KHIFX4u4AACFmRcmrqGZI5rnhSdDlnQq0GQkcL/49xjQuKR+9lGfo74Fuj/LscQvc9plrizuV
	fF0oCb67K+RpQbpiutfF0FoZb5xDOJuR/0VkDg2YPUPw97Q4AuGXFxsFbNUdlK1E=
X-Gm-Gg: AY/fxX6JygDS2C+sdi5Y2viX3x6nyYOiUkobW3WaK1hDF7/14oc6xyuPinuIEPjiebX
	rEUIa/GS8uYawuoA3k627Vb8//UgSzEoti+/o4m+2AMgmvb04LF19u2/EOKyW775r6p5WmTMCZb
	FDY10e7kLP4iafMjtLrKAZfiQFJFVhNfovPVrx9zozwJ0dEFDLjYVds603i3YdGuNc4cn0De8tR
	gcj9Eea2oOUUZe3BxmyYpGqCC9TdK4u8f2fqa3/mEgho6tDwg2gQxk+CAM2sXGo5eYBRNiR2C+q
	OVhNHOUMH1Nqs2Er6Zs6SjUPX2v8AzAZN6Q19VlugNPOEfbOBzR/4D7PFAUwkW0A/YvL5Hmg8Sr
	LDMOXh0btYbHHOZv12DaOQN+E4Q==
X-Received: by 2002:a05:620a:4806:b0:8b2:63ae:6343 with SMTP id af79cd13be357-8c37f51e983mr3207142785a.28.1768208518523;
        Mon, 12 Jan 2026 01:01:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFv2cFfIDCeSZvf2r+blH1IRTUYxe0FVYEo/QkHo4cqy3mqlaDuTBCyzrOK+uVMGyKaf3Oapw==
X-Received: by 2002:a05:620a:4806:b0:8b2:63ae:6343 with SMTP id af79cd13be357-8c37f51e983mr3207139685a.28.1768208518080;
        Mon, 12 Jan 2026 01:01:58 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6ef885sm337980525e9.9.2026.01.12.01.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:01:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: usb: parade,ps5511: Disallow unevaluated properties
Date: Mon, 12 Jan 2026 10:01:50 +0100
Message-ID: <20260112090149.69100-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1787; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BLROFHNZKkkPGtWZHyLHCOUejGGnOYD9zfyf1eBR4TQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZLh+DfsOlKCOYKsIcvmjoVyQYl914CcaDIxe6
 XJ6tReNcz2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWS4fgAKCRDBN2bmhouD
 168ZD/4hrbO1vbTlaDZ0+JeJkXrtmzvD0/OeFYwPoI6GhN/G6gEqZJ/sXe87tG+G3IV8cVtW7ea
 NNaiW2murRhNiTtQoyvufSh44Bk3eHbbvANR4aNbFLdInbhkK5qzBVhKzM63+IH6FtFNsemJRd0
 Oqogql0kttnp0OnN6W9sMVWzsLtl+hrNkj6R8l0nYQNoxFCceWG/7HNdqfzNKtjhZ4j+Ba175b3
 XQPc//HzN0S2GsvkU1FUPZiDNrq6nBg8856CdfrczOgZSTlTVXF7jjazMskny5MapPvDQ/BAY/d
 ZIf9j0vm3pnQ53hQFxUOkeLuuc0jW0dezGMGOadIXSy75FfkhT2AO8BIzZbnmuRbR36dynA3mlW
 i54APdisb23RRLLqCnBNc2dPqj0PXJ8HPdKUB+MUCtXRc59yWqtPEJ8RRhfgGx29z7qxjXdSNnJ
 rWsWW6e52M9OwGGc/0lJVhHOcKEouQl98FQHZBkPRilgU2vEngT3nO0witthm0QGu1Y1Oq5fvjg
 zlFbDmDhpXrGuY9XEKIN6D0BANq551zrR8c5FyEY7C2nHA8HXXLcDuSF8h000kvsmON7t9CtDS1
 z4j0fwNgqinmjwAQ5koF7ESbCdAddONN9Ew2M4HmNHTmrWRLcpVt0c6dOH7MwKta6OqYhpOQPTe bnC/2ycdCsaGCQQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6964b887 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=II4pLX60nxjcN9S5XbQA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3MCBTYWx0ZWRfX6JlSuoamyr96
 dWy/RLuSsAffhuA/QjivpK2dqC4z1+dbFiMWKW6fgDNA/rsQ9nkB8WZWoPW0Dmy4x40lnYiBIJJ
 XOli5X1cwvBNuBjbFVmBsO0MoOBK/sDH1bIigUJZB1SJC+zyipNFTBGEwn7aHj+DdBQFpnvex7L
 iipbDHRoa3swjvkw1VQgTy49apJ3GahehbNnN8WSi5Qx0UXbCa5M4wZpwPL3IGz7pN8hR0DtIF6
 BKPIbBotqRAOCdidlUe1mwXlqptjBWOGvM9pFTfuQejwXQ+JSsX50Owuvx8ZeDsw7IcUuQ1xVb9
 FRPcU5cBK+0OK5qvOdmoUboVCpwYle2NRdWV2HrDNWstLcDgLqhqM3EQ8iklT3F1/AVW5trWisJ
 JNdwemHLCAOO/q12sE0mio+haI8pwBBSvHhucGh+AZ7amRZzwGTJu6y6aX3ZHDbVupivX/CdoP5
 zuuqhv98mif4s8g8t4g==
X-Proofpoint-GUID: 7MwqpLVyUK2azmcOKaxmWvSuJ1NmN4wC
X-Proofpoint-ORIG-GUID: 7MwqpLVyUK2azmcOKaxmWvSuJ1NmN4wC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120070

Review given to v2 [1] of commit fc259b024cb3 ("dt-bindings: usb: Add
binding for PS5511 hub controller") asked to use unevaluatedProperties,
but this was ignored by the author probably because current dtschema
does not allow to use both additionalProperties and
unevaluatedProperties.  As an effect, this binding does not end with
unevaluatedProperties and allows any properties to be added.

Fix this by reverting the approach suggested at v2 review and using
simpler definition of "reg" constraints.

Link: https://lore.kernel.org/r/20250416180023.GB3327258-robh@kernel.org/ [1]
Fixes: fc259b024cb3 ("dt-bindings: usb: Add binding for PS5511 hub controller")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/parade,ps5511.yaml       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/parade,ps5511.yaml b/Documentation/devicetree/bindings/usb/parade,ps5511.yaml
index 10d002f09db8..154d779e507a 100644
--- a/Documentation/devicetree/bindings/usb/parade,ps5511.yaml
+++ b/Documentation/devicetree/bindings/usb/parade,ps5511.yaml
@@ -15,6 +15,10 @@ properties:
       - usb1da0,5511
       - usb1da0,55a1
 
+  reg:
+    minimum: 1
+    maximum: 5
+
   reset-gpios:
     items:
       - description: GPIO specifier for RESETB pin.
@@ -41,12 +45,6 @@ properties:
             minimum: 1
             maximum: 5
 
-additionalProperties:
-  properties:
-    reg:
-      minimum: 1
-      maximum: 5
-
 required:
   - peer-hub
 
@@ -67,6 +65,8 @@ allOf:
       patternProperties:
         '^.*@5$': false
 
+unevaluatedProperties: false
+
 examples:
   - |
     usb {
-- 
2.51.0


