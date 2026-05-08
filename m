Return-Path: <linux-usb+bounces-37160-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMa3JpVW/mmupQAAu9opvQ
	(envelope-from <linux-usb+bounces-37160-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 23:33:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 412614FBF0C
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 23:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2328C301F480
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 21:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A659B30AAD8;
	Fri,  8 May 2026 21:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnXIFhwv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ih63e48F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DCF1E5B63
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 21:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275987; cv=none; b=OtFVjup9f4ArQELcMnQ+u8kzuP26by0VESWXCYB6o2vGsg0plC+mZoyvP/bLYPyHaIL2RgOE7UYrvo5kJKCq15qUt6BqvBhVXRtnlD9Qr84z2oHKlyrZyA30kL44LR4BhQM+D5PP/NbtThIrNwa68GXhlAbtG/p3sWgulaHJEZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275987; c=relaxed/simple;
	bh=X7uEJptvwsV3/AC2xW64pXmoB3N2kAk1Hh22xuC50Dw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HjsaqrlCWOtQqvyhfuXqU3UOUMDR7MuZ+9/UVbQl9Ul4niNMDTawtml+5MCdLGITCzLgM3mOFz33D4Bo0Q/tP8FYKo240w+0ZMbzdd77duGpm6PiSZqbeKTvtAW7gerawkDBvSl62W/BezFo8EIwe7buP7gjC44szVd8AbEA0fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnXIFhwv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ih63e48F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GWL8j2335585
	for <linux-usb@vger.kernel.org>; Fri, 8 May 2026 21:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P0+zhgaE3hW
	Bq02LPyDgy1/Pf5uTZKmDwz1w7Oq2yFM=; b=TnXIFhwvCFXHd3NzBoJOuqmulVI
	BsFegiBMN6lDhSECurXZLcl62T/xdKmB0p1j8my8jMFlCmEaq7KY2JTDXJK9Z7va
	TRufFBqVl0VNsRsBcutr5FS3yo2alYwzVItmMhwSMcXFM/2jgLqXDa9MdGg0YAIe
	jR4uY/UG3ZcfZ/C9Y/45OYG3NLIJKiqqt7ZrgcArvm0AkGtyQCNvinKM8L34ESMX
	TqsQ9WuohNxpSdtobFVLFEOkNqyjUVywE7K2uTExMfHylpD7ghjYgorgRvGQds36
	td8SDEGsaFbm0BN3d/TX8qQFgT6GzPPq6oA53P76XY8mJruvGExjt5LOA+w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1keh8xpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 21:33:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f5943ca81aso4227825eec.0
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 14:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275985; x=1778880785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0+zhgaE3hWBq02LPyDgy1/Pf5uTZKmDwz1w7Oq2yFM=;
        b=Ih63e48FFyaXwOpNZCQbnT+wYJ4D5A/wLcGN86ntSwUKTpiUm6TPv+gF8mvwiDyrZq
         qo0YRj75FXnsdPwXrb/3sg87ci8bh2Ar/OC0wibOtSsytBSUEFTtxl7MsFHi/UELJvOM
         Dd6/fyplMWTfM3U0gdXc5q7eZp8CxQuI8rYxfEjWSQ4Mf84RYQqAzAlNS2fEPP7s/Jfa
         V1zQPmCWbRMtZZNtUEuz4v+F1kKaGeJqA493WAwTWOzh5f9y8XT9SrLHAbJFD6QpvvbX
         N74KOwgXJ+DHIMIZvt4AsG5BjH0y5pbo6Ceo5F1QWwatwvaAi2dpK9gLwMr+rXyswStR
         r2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275985; x=1778880785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0+zhgaE3hWBq02LPyDgy1/Pf5uTZKmDwz1w7Oq2yFM=;
        b=LrYDqwsM1HOfL9nm8RzuOjKjJQ3NJgZuN3A1ymLF8FWd/u7TNvRJgFkht7pUEOQFJG
         i3b5DofhGcEjKtyL5NW4y2RgMRWktIE97TkWPBbSyHTFbrrU/aW1a0qUCc7PXaIpEBJV
         ZC2DXWZoUdKsHWMny7yIaAjPyxj/hQvNYuSxL9lmFuuTVceGMp/qCNvG/ZiGuDRgZqce
         2MTf7xOBHxKmwrWV5Y20acFlFlTZEix4xc6LazJagWvkKccDEZyASUpBMqzL4dIQGtZm
         RAwnlpicAAkJfmCoj9kQoZvRMtYelzgt+cOOgqasjMGYAMtuWhWffX1yZE9rCTYRmIxv
         uYUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SnoDe+su95V2ZH9xmopFMGKrNqLSkBtMQPQLr46Gt6zv69YaB4Dpbd35rXuCI77JjueyvxpX/oPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqV50GACJO/XvLpAH+01U/NHYXpH6/1AQ0LE4AC2D3kcyaatSP
	1DLLBUtqB/sZtYVRk32BLje5JFHNZbrLg05uw8Th9PnxnSyXpPthzTsQo6pAU5MizBc0HPiVjT5
	IRLvz1BxsVtrQA07+z86/gGUPT32fWsdfrUE3Jfn8R+A6DsmtTCD+70R3rNLMHd0=
X-Gm-Gg: Acq92OGhz57ngXEm+bpI79oz2uyBnA0jFEjeNFubHJKjDhdzzHu0vL4nEHSohvM8fPB
	IVnPxvsEPMftXGhNFC9wR3HCrAQHA8y5uATbx2bz2cpflN8lRGzeUNaDBHtuiiZgo0H7jS0vQ8c
	qrhn7J5Nl5PC210s3S60ELdEBa5hI6Q8WQn29Ay6u9cCbKd91vMSyJuKE5xTIuazSfi3OhDGXtb
	4Xtgh8McF94cy/9XAO40r+j0rPE03bjf6w1mMC4w376oOy+VJMurklS9LZiR6CvJ4+Z7lXmPPIB
	S2/HAkSQF/SzNm/6gu970ESiLvsm1BEaEQxCnPD3GU/O7PYKc3uiWNZcNIZ6d8YRO8Xi+nVY1T4
	j3+7icDjqK/oqU8yEzRlIUu4KesKE25EqYrgOmShB6wtqvH4J8YKB1z1DIqgRDV+GXCSXyVksEF
	E=
X-Received: by 2002:a05:7301:e101:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-2f55dd323c8mr5114676eec.8.1778275984616;
        Fri, 08 May 2026 14:33:04 -0700 (PDT)
X-Received: by 2002:a05:7301:e101:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-2f55dd323c8mr5114649eec.8.1778275984035;
        Fri, 08 May 2026 14:33:04 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm4871285eec.27.2026.05.08.14.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:33:03 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com
Cc: wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
Date: Fri,  8 May 2026 14:32:31 -0700
Message-Id: <20260508213234.4643-2-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
References: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CJIamxrD c=1 sm=1 tr=0 ts=69fe5691 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=8IMiPDtIn6OAJiDpRukA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 6sfzyym4xWlcw_ucU-W-59SLGXsOwFvp
X-Proofpoint-ORIG-GUID: 6sfzyym4xWlcw_ucU-W-59SLGXsOwFvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMyBTYWx0ZWRfXyzGFQRWQAPKh
 fomRTK1O9yVpEqdOk0TViKW2Nm3eiP29MoNhQS6Lc1maasegpHpWQhPE1uvm/buUDaFjkedhmF9
 8YhxN7D56UBZg4Q+XN0Zpr0LLu2WlfqDmx0hvXm+J8nJebM8PlaNbHFK3f7GA/7d+UP56RB/rTX
 HrdpSvFzmi9JulSdzKt8bRNNwJNIpjiwwx2N3T3KIE+r7yVKf/+G7HMcpsct8U+jnLIet+z6X+e
 MYs+BPdDbYBAHr7pz/jXtopMZjXbUiLHl+z6sGYH2fqmQ0DuRPNcxAiXKDecHdc2qQxLh9yEI5L
 MGSHBY0EQvrJPPB8C47UHocqMlQX/HYk9egxy5NNSIz4eIDbap54xyyHrq/fbuXhGkmkTRo+tTc
 B5luJse8vvjQqA3W7Rse1/+ZKhD4UxIWE75v9+Ndv6/JR/DMQrqlCD1REe0UZ9u2DqwYfDDXy7C
 JLuEuOKM87X4MEgOJdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080213
X-Rspamd-Queue-Id: 412614FBF0C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37160-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the Hawi compatible string for the QMP combo PHY.

Hawi uses a new QSERDES V10 register layout with a new COM AON module
and hardware-specific PHY init sequences compared to previous targets,
requiring a dedicated compatible string.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 3d537b7f9985..7a7059c659be 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,sm8750-qmp-usb3-dp-phy
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
+          - qcom,hawi-qmp-usb3-dp-phy
           - qcom,sar2130p-qmp-usb3-dp-phy
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc7280-qmp-usb3-dp-phy
@@ -205,6 +206,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-qmp-usb3-dp-phy
+              - qcom,hawi-qmp-usb3-dp-phy
               - qcom,sar2130p-qmp-usb3-dp-phy
               - qcom,sc8280xp-qmp-usb43dp-phy
               - qcom,sm6350-qmp-usb3-dp-phy
-- 
2.34.1


