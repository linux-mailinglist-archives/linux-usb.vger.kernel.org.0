Return-Path: <linux-usb+bounces-24335-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD2FAC5BD3
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 23:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CFE63BF9C4
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 21:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F46211283;
	Tue, 27 May 2025 21:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyTIxGaN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B742620E6ED
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379898; cv=none; b=H3Sz5pZ1AjjSGmCYIAC5+ccXGxfUhYCrYKMgyPoqDbYPKlfHxrjA4nCUGlqGLvZW/m/0p8nEBYzeq4ozeJCfPhwOWn9bsTV/HiF1R0I4pa3iUkkJQX4XrOaV/tm0T1wmh89lhcnvVxXJJg2aONIl9hP5rl3ALoytJB3j7Is8FW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379898; c=relaxed/simple;
	bh=5FExpQUZ/FHZEchRY6UIA2qfjFJXzxNKpcsVYOWNwso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQJl9RVzmIbSDLWPvfGEkY6n77+P6eciulLxw0MdCWrTdLvb9jGVcgxl2UxrB9yciLADFl4Gp6vafCs7g5tTA2iri0VT1rF4fPRV1x/9TolC1G9axHK4UE8h8HJrXQ8RARB/LkV0eiH1VA4XaOAFCw/j85FOObDPvY+gT3WLKoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyTIxGaN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCGsiV022698
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=; b=OyTIxGaN6HeRDMcx
	xggCgzI1x739zuaZPZkK/Z17fZFI0xZzNM/YZTFgTheQtJbDdNXhYKBxKf+W5MN2
	DX8XrPOieMGaVw9TjzUVF4PkLqbtw5/UOSGvxncP4jZB4c+ONewBgvuoXu/L4LMS
	RsVbMLBofHwDTxffM9mQV2K24JGIDxD8dXqbpYoYLqfHpWrJmehsl1O5ZhwyHgI+
	PAnUyDcepMBh4K5Xs0pqa6+UZZCPwpClbD1RYn9hv8bOjITC9PG6585FidoNAWSK
	aSzs98QMYwA0XAQESPVxSAqKW1RLbIFbSw7z7WslNtOr+t5ckkJkntlD807oyV0f
	Y6Qzjw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjr8tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:04:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7401179b06fso3047127b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 14:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379895; x=1748984695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=;
        b=PI5duezGKqSfpZg5ONOC0M73Brs8T0e6cuQKO4dv8QrhcjmJo2y90daWiaxFE0MR7J
         zon9XfETafQZtGKXAW9oxvluwudqvXtkjclB1fKhMh0ALRrqBidbOVwenKJW3z4at0BL
         dHXIEW7myoaOScALI9oMN1mcn5TMyEsy0pnhyUMfC2acX3YOsAPoPXQSdeGESiyUfZQh
         wG2T7NJaf+qjOAlN7LP5BlNzZlRLc+30RAmHqURt6YwIHD8CZzh6NMJigcwIQyRMetEO
         r0bi06b2/MRnxXRefvtmC4xFNiD0s+1dMZX8TeDhn4AnT2J5rPujg43iWbLY6dDbV1+2
         3RlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXkpMH8V9k69dF8vj2OW5easSICeawGQvlowJItxZxggtmGyO65G/UprbZLjQnuoLeqdff0ugudCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnXz8ukBb8WCaPdEiyGu80Kb45qGybDguOTpLcByuPdEayPgS7
	x05/R9KS2PmsHbnGImJbWIFb2b5sIlXXjsaODNbppw0q9tLq2Ma2F+rJwwa03y7po41ot29G5XA
	GK+YgFmphFuIajmwWFWQ64W1VD1WNKufnUQv/K8UTBqQuHhTEFRfTsmS1jAk0eY4=
X-Gm-Gg: ASbGnctD0xVqo0AFi/7sHRrpNzknBw9IimVf54jRjVQrSQlSbou14c/bbKnmHOdnlMO
	UwmLc6r2JAuXyRK59QB63vL+rtRp1Txl/lrB2/Vt9EyAYgDCrEtbHLN07ovUMIbYeiG9AV6QjWg
	i0Dx5qi1PdheOSbfrOTXT7SnxYZYJqSN176O5WSyWpWdXdllSPghk6BpIiDuZm2qDUYEpf5zBj5
	c5ln+lObrhfU38qbwO5Xk7HE6LeNB/HtO8uhGeLItjyF+ZXhe87+1rkhPPdMqMeU4gub4zvCFHV
	Xbqawn9A3eGRTzAZzdY4Bl92QOQ1tuPFedH4MstcDx9wTK7qoSBKFHR4shPVYbhMYb8=
X-Received: by 2002:a05:6a00:a22:b0:742:a82b:abeb with SMTP id d2e1a72fcca58-745fdf3f47amr20526690b3a.2.1748379894988;
        Tue, 27 May 2025 14:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVTU4ArnKS3XUx/KYBpdSClXfXaPefEciMMvAQUuS6TJ1WcP5QX4l+NUAEE9Sq/8WhMbuLTw==
X-Received: by 2002:a05:6a00:a22:b0:742:a82b:abeb with SMTP id d2e1a72fcca58-745fdf3f47amr20526638b3a.2.1748379894549;
        Tue, 27 May 2025 14:04:54 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:04:54 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:37 -0700
Subject: [PATCH v6 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add SM8750 to QMP PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-1-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1370;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=8DqyV8lJU3L/SgQ/5n/G4b54XOO0JVKsEdNPv+HKEao=;
 b=o1YRULItzlopd45+R1RF7yTgwH4zsRX84NLJyscueOAZIq8dR/2R1drH5MEiKT449uZdTpeo/
 nk9NUMT8WM6A2HSBqhs2UW4zZJSmRT2pJUyfWqLzvb98NRmaK1BG1O9
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=683628f7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=bbY3M6C_flAL0yJJl3cA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FcoMb84Ahg0I4LVw8-Lgnm16q1Nd9LEx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX9PcJ/pLvCwvY
 QsYkkEmn9MEZvrCw0lbRENzwcUyFskbsx6eJ6QlRkfRrk8iZGsPDsa2csdlCxTMqdpliwAjkmpV
 vS+SuZNsOMs6q/H1peiioQ9YT/DG3YCbaxNKYZLCDx/95KsUxiX8Poq5YtynMaegja3Ap744IRg
 i8l72EwJxXtz3RZ2kTLdLknpbJ8bOcsFGq4dJMYpYgvmRQy9Qp+KQwrbOiODVk1YSZLhLD9t3c/
 jkk6usiYvh+98XN4LRIJ0PP9gA7mIvJWo891LiYyxqPpUh/pxIOqaAaZSDEsrzkJ4NJzk6XVLfW
 05DVOGNxiU7sZa558tUSXPaTTpLscmKe/YhS9V7WMo9IW3acFEAOJ/fNKCKaKnqD0ITTmsocMpa
 JnY4djit6cQoB3BCJuDKC95FjFac5G+i0Qn4xj4R6ouer7nkL26FaEDhialwPDxGMHjkjMjL
X-Proofpoint-GUID: FcoMb84Ahg0I4LVw8-Lgnm16q1Nd9LEx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=838 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270178

From: Wesley Cheng <quic_wcheng@quicinc.com>

Add an entry to the compatible field for SM8750 for the QMP combo PHY.
This handles the USB3 path for SM8750.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 358a6736a951ca5db7cff7385b3657976a667358..38ce04c35d945d0d8d319191c241920810ee9005 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -29,6 +29,7 @@ properties:
       - qcom,sm8450-qmp-usb3-dp-phy
       - qcom,sm8550-qmp-usb3-dp-phy
       - qcom,sm8650-qmp-usb3-dp-phy
+      - qcom,sm8750-qmp-usb3-dp-phy
       - qcom,x1e80100-qmp-usb3-dp-phy
 
   reg:
@@ -133,6 +134,7 @@ allOf:
             - qcom,sm6350-qmp-usb3-dp-phy
             - qcom,sm8550-qmp-usb3-dp-phy
             - qcom,sm8650-qmp-usb3-dp-phy
+            - qcom,sm8750-qmp-usb3-dp-phy
             - qcom,x1e80100-qmp-usb3-dp-phy
     then:
       required:

-- 
2.48.1


