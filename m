Return-Path: <linux-usb+bounces-31647-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FDDCD28AC
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 07:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30BEF3019B7D
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 06:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816852BE02C;
	Sat, 20 Dec 2025 06:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3k9VYsH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9atG+os"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8CB255F2C
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 06:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766212562; cv=none; b=kfg+CreqJ+bmFU1zzQqvP3R9CK7gdI37mdYjPC9iU/M0JOXVgqaT4WIxBPsmD3kHduto95AAEl3sXUICgxqArWbc7r/jgpHDqtokaO0yfNACmTJvm8HHmCSn5H1VtV677dSJCX8HWXMtiE0QdyqkJCz6UoZqpgJWDNtAGqjdtqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766212562; c=relaxed/simple;
	bh=67ymz0uRLQ8a2OT6HWVGovN4SzX+mkpGMz6xQOlw8nM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C9unEdWvOzJ5Z2D6pQxwfUY92ma8QPqzOJZ/4j4p0wVhLxA6F1ePY+FcqF/M5IlaWekyDB7fvVmwYhtK/tuZS9PxRG45V1Ltg5XOhuwzTAgFzprl1yHtEj+LNG1ASraEmlrGs6gfCneniO1Og3On2ybYPVjPP+18w+bmAb1TmnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3k9VYsH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9atG+os; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BK4lR752415602
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 06:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XCo9ZKvzhnx
	n8uP/rP/f7ZO5TI60FzE+bvF7TjfCOwc=; b=D3k9VYsHxcVgnfsU3yG7qqDVKGG
	8xbR4Ym4J/LGld6ynwWzCj++Ra+FLYVnDdVMnSHf8JC9qjuNNhjkfDx3sFkUJeSh
	Ulpk2GDdduMoERfCfDrPbjP96Qf2GvqTgnd1iB+fvbuqMFYIIuU++MDhg0bYxBbg
	ldBptek0oAP12pcWuHKJgxFITlsvRTw4S+e+njr5i0wZbg+XdEgXJXeCHMsIVTmn
	AjXNJjVvz6JNY9dj9d58ozLOBjgBugE4MFXgblnXTs6+QE5NbM3e24rBhXi0p/ZA
	tl3KS7sLH+oKKJ45Uu2e8yk+B83nKxoC5mS9XHyxbjBdDnpxdwEpoZ+KBcg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5n36g515-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 06:35:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ab459c051so6877904a91.0
        for <linux-usb@vger.kernel.org>; Fri, 19 Dec 2025 22:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766212559; x=1766817359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCo9ZKvzhnxn8uP/rP/f7ZO5TI60FzE+bvF7TjfCOwc=;
        b=U9atG+os5svpqAoNJsfinjFMzplFIDv13mnLbpuPo/KWteK+pboGUboFVNFkB20OkV
         +T/vM9FPFMd1xGnLtFdZCfBuK4XmIS7+joOMDwLFH9dzAI6PyIo9+ztiOCY+CoLtolOV
         pI+i+lnpvMNdxtRFQVX8pytdwGMEU8dW1EpvAvTwGrSdDSx+zSekFjcPPmKptYrNxaFb
         whm45eIF4/mqNe5pbbIOuaptpukQ/dxZY8toPdKgz14VKCru/4PbqoDfHMyEMFV59gtq
         n/NG504hFIQqvr/YJATHVAycdl36HdypuHF7srGUPYdnutg+KNunwUcA2/qWUMFrWMrs
         735A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766212559; x=1766817359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XCo9ZKvzhnxn8uP/rP/f7ZO5TI60FzE+bvF7TjfCOwc=;
        b=FuWEz8DRuUd9D/rgrDNkv7caPKr552j2J8cOT7Sp8o2MNLn6gyeRCd3QHIySjNZnpg
         TBJOTyuaF/9FQ7sa6xUHVwNGcD02JaWd3BDelwWGzzxYviSUhGhYBlPfW7cp9K6M0ppv
         PolgEk7Z7y3EtNPYVP7Fswma/Vf2R/5xgsZuLaILQbbiwAR664lbpSIwKXv+iC/TtFtv
         wf/qaSjxBRbKRS9l7Rn68b0eFSCyamQ7MmC4zUuyHmtAt/TOXXMnyOvaio/FX7yLAXs5
         CfSDKAMPCJ/XVjgP37yj4cvo5UOrIgEA+EfOX9s7ubDlNch6eoCzi6jWiPhWJjxhiKeV
         R/Wg==
X-Gm-Message-State: AOJu0YxPxLxS++rdUXZqB5BDeH53o+2vfzlKYCa3hh0OE7Q+XzW6xcrz
	yf5g+okf5CmjzsrZ0wESGGiJNK3vvjZrwjL8/oXFNIi+KY4CgcUm2EdHyNVgDPm0pU9h0JXlUZu
	aZRi204FYd4nQztChVVX0i9y7p3uC6lPqM6o116qcUpbtNKvi2wF98GVQisAopfQ=
X-Gm-Gg: AY/fxX7UPusLpOpmJWiL3+zhTUMk8Nf0tB6bpM6CEnpS715SWZA6nAZGWx8RscVdK+7
	5w1xOE7O+3x3bqBAFpA7Fq8zq4UigZh2Ictpt0jj6EkoT3veVGFj1ES4QkPs4xlR2fF+OQUq3qw
	HAu+er0pHvAAF7+FlxXe/j3srFaq8b2/e1LZDayNfE+Fj3P9Eb+ceD/GFax3ZgFur7+MufxgLbf
	w04mVuXkLWZDzT3/YJAx5QfNFAxI+yMLW8MRoR6dYjfyZtILq8AFCfvq1js1TUGkGdO099LRrEw
	GGJrC+JjQnoQgooPw5OCUWA5FZt+8v+AiC+uHT4GgNwzBMw4LS0TwJQ1yvGBycYItv7iwhBUaVW
	vMb6Qc6kGc4dfRDSg0ba8Ns0xh2yvkRTc+qbASJCJeqU=
X-Received: by 2002:a17:90b:548c:b0:343:60ab:ca8e with SMTP id 98e67ed59e1d1-34e921bec08mr5128313a91.17.1766212559064;
        Fri, 19 Dec 2025 22:35:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAz0kDlHXa6b2CJrtkRwIoFM+vRVXnlz5QSmNbZCl+uxK97syHgH+dC6pp+LY93l/ciCy2Pw==
X-Received: by 2002:a17:90b:548c:b0:343:60ab:ca8e with SMTP id 98e67ed59e1d1-34e921bec08mr5128285a91.17.1766212558566;
        Fri, 19 Dec 2025 22:35:58 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7723b3a8sm2847143a91.3.2025.12.19.22.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 22:35:58 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v3 1/4] dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
Date: Sat, 20 Dec 2025 12:05:34 +0530
Message-Id: <20251220063537.3639535-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDA1MCBTYWx0ZWRfX41Or8e3vZzD5
 VUCy8uieByol62eyrM3a+op9xomgCZrhhYrEAjWb5+cuuFE74VEwA9TbhL7BYLX6Zx/ZnfMFrBB
 v69Wci/j9d/mSse0PfbHNaAvdqf4AjLwLsGITtPg23+H81e9kASL/NOnh2F3Fjdc8s+9+kOZ02v
 z0hC7KO+VwS03swzBaW74iedP859FHFU8AwU30J+V2H7nBm8D6NBoWwLlYXo4sorPmifm12FdrK
 0Y81GTh29ujnnE9CuJX2dJIqi+6R81xGJrBgA3qejXz7jBFAerMllYRqlWXiqch8c14uVzZHvT+
 N1tu/vMkMJ7IQajroWd3pX4YmEEYvKsTC+2dAcUWM6SwYaPpKrxZZ+l6IVSQwDCegj+CEhWjTJ3
 ysCZfI4vKzWnZrteyY8vepH6Aa73ChBsBW82+djOLX/2ENOsE6kjya59e61TO8A4roCuvO9x8/P
 9lJHYd0VMLHrgpkPdPg==
X-Proofpoint-GUID: F-h2Jy6BIXMOVcbeO_5qQzg67n7firaB
X-Proofpoint-ORIG-GUID: F-h2Jy6BIXMOVcbeO_5qQzg67n7firaB
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=694643cf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hRDnhHrYu6Pt9KVU6J8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_01,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200050

Add the binding for the USB3.2 Genesys Logic GL3590 hub.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/genesys,gl850g.yaml      | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index 9a94b2a74a1e..a184e1074c7c 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -15,6 +15,7 @@ properties:
       - usb5e3,608
       - usb5e3,610
       - usb5e3,620
+      - usb5e3,625
       - usb5e3,626
 
   reg: true
@@ -69,6 +70,17 @@ allOf:
         peer-hub: true
         vdd-supply: true
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,625
+    then:
+      properties:
+        peer-hub: true
+        vdd-supply: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


