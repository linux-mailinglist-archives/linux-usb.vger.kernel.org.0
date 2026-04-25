Return-Path: <linux-usb+bounces-36477-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAYhGmxn7Gn9YQAAu9opvQ
	(envelope-from <linux-usb+bounces-36477-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 09:04:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2867465549
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 09:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20E843047E78
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 07:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C073A31F9A1;
	Sat, 25 Apr 2026 07:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6/Tg3KP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PCXFGSoy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11E5315D53
	for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777100422; cv=none; b=asuLqEDzDTbfSw2Y1SGikIYj0QleRu7/Qhwz/2lnyATUNldwfPwIFFotvZIL0mxUh6VIeFuDU3K0J1NzVDJinO2kbeWjeEiElzqVEV1f4q7LSqbX6L8FL1tNTp0ExD92zJa+9AZNM0bApeizj6D+Lz7zf5ERwBNSnxYe6+GOnxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777100422; c=relaxed/simple;
	bh=VhEbUk1qn4YDvonKrVyzLLile8oLTXo5Zt+QFXASqso=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T7upQgKRVoLIEWbr3g3cdBZapn+rk+wPNpUDqa3V7igrpviUaRtI1tvdU/EcJ0bcOKUyyzoHijucPIElRhjohr1TgKuug9oxjvIyc773OF8p8GelBxxkUa1ysB2VX4FUCKq3ixRS8Cv9bxXwteFiymRxbTNHMHcNpufdmAiXPcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6/Tg3KP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PCXFGSoy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3JQeJ1727122
	for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 07:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uwC5mL1xfh1
	AHGE2caBgkXGnAkeW6s6MztU7SU+1oKE=; b=K6/Tg3KPq68RgCj77DQeBvg8LTk
	msfFsI/az+anqAs3FcDle+P9aOX12+UqxonBvoCdZugzhGPxHwNUDr2N1A83+WXB
	INAW7jkJI7zsUzCfArQKZLTkpF4GRSrX2EQA/N3zWL5DU1x0QO1g/d9UcyF63jZx
	MmZtvPE0q3Xa79Oc8s0f5UOAewaZ8TEcsGiyhl4FJp4ioVyjFi+rKfoujkQDATRk
	Asu62rHjwcz6QJILTZBmjneaoJe12azmSxj0icc484Qn09xrbdU1HdYWFOfQ995u
	quzNWi28WH2+NqTBVaZejixG7WUf0YB58z3RtKVVSKz5T58YAjlgBrCGbpQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkx8c6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 07:00:16 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-126e8ee6227so8515326c88.0
        for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 00:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777100415; x=1777705215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwC5mL1xfh1AHGE2caBgkXGnAkeW6s6MztU7SU+1oKE=;
        b=PCXFGSoyObjnuSvmMiS/NPkaVcBZ0m7njFUT61UxiPcM5rbUIhLD5d7iSvA/ribrTj
         yOCvU76dtZu5wk7FlmIP2b2wIRSd/RApL3wH58VPSN2BkbekQZBkZfRwScSKTrCT9CE9
         2DeaMSetVgoLwSTaQzsMOEjCMAdqCag6FummlwIRl0uSJzgqKnrO+O2Z1y1ThnYo/RNQ
         9lqOMQ5TqNN/iUk18EliVZ11lmjdizIQsVQ9Z08ciJr/kNIfinSEMyxF4poX4C/ohnDz
         etM/Os3+RjnKYSeK3p0iR/f6icFNs76Xuur2W9pyQKdn9bOmx459HkaMDZLytFFpLSAa
         I/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777100415; x=1777705215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uwC5mL1xfh1AHGE2caBgkXGnAkeW6s6MztU7SU+1oKE=;
        b=EpansIdbMocgBdiSwnWwsgORsZKJefnZykIaR61EUMsJVGsRL9Prhz5LPXxAFE6dyG
         4HCWE7/6/CNSsNjLOandgZo1f6Ft+47iMMVGpFjxFnNxTpR4YwyaxzeK3CFXjBrR5bip
         x6i1SZV4aGiFccs0u+BJQWXpSUzpggaFkLFaAwZ9WIKmUgI7iElPUuEQSb/ZI7KoJlnw
         T7tXUPP6eCZmlGIPU+AuXISTguvxsdGdjpp19CQl475BWYB4jVTF83qBMk2z95cPFsfB
         O2PnVuEnqIL99EOVqfxWW+WBJXsQFyMM+o6Nbvjv9HNMbkG9dXYfp6SVwNxfXsmXvRZo
         hHzw==
X-Forwarded-Encrypted: i=1; AFNElJ+epPGsfP1aPfVfbNJiHs9IeLEDC3BkhW8VyZu2nsjPZY2pVl1vGuGHncx0hVr5IBpzB+O19cjjAoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFcWLAK8uibUl+3hJAZ7zGD2x9sc1PtYDtP2imhEBYf3mkLYu
	nQfQLUSR0eymciitBon0gA7mSeR4Yvp2XKjYh9+E5zIOaRVLmgy038Mbu47wTz84HZfi1eKUjJU
	WQRES0eAHVrJ/Yz1FdPuxBYi+4UU0sXlMlGQt0FLsNE9fkj+g8IWItXYgNI3+mJE=
X-Gm-Gg: AeBDiev91KBSfn91yKBRRHCaBble9dGH4rpAEqOd46BJjo6LNVadUMWXXY+H1AYz4yQ
	o1vxoc+pa6Ne5UfNb5ofy+PyjJIlsyxJp9kIuiNSXhvyTvVncnWZdx7BtaaNzvwBWUgfSoWDCTs
	p9JQ3qE/AH3jzIrPpRro4wbDUYetq1r+hHbOGFhe68yYDMmSRBNdvMR+zqjW3czKeF7KLBWsjXg
	KhFMsmLTkY1YcnwFiXunI1p6R3/5SYfsl8AW8Ym6/lEzQDSd0MPGvGqlWh5QKLvftfkF6mekTu5
	EKvF6JwPXske7nUPn97bbPW+w48Rj2Cy154N8dbc91Ry6NXmVkYy8MBk5b3qovzVHe7cjUakUeX
	vAZ4CyX3iM5JC6EAknsEkUO7G5U1AZolZn0QaWXTR3gTspITjETVtG1JLSpCT7jNT33OQLaQ3WK
	SoPlJDo5xDlw==
X-Received: by 2002:a05:7022:1282:b0:122:33e:6d41 with SMTP id a92af1059eb24-12c73f975e0mr15319076c88.23.1777100415261;
        Sat, 25 Apr 2026 00:00:15 -0700 (PDT)
X-Received: by 2002:a05:7022:1282:b0:122:33e:6d41 with SMTP id a92af1059eb24-12c73f975e0mr15319055c88.23.1777100414748;
        Sat, 25 Apr 2026 00:00:14 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc2dfad8csm9430630c88.3.2026.04.25.00.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 00:00:14 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Date: Sat, 25 Apr 2026 00:00:01 -0700
Message-Id: <20260425070002.348733-4-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
References: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gWNUvd8ZXwJ4YjfXlMVb9OavDAWr7_3-
X-Proofpoint-ORIG-GUID: gWNUvd8ZXwJ4YjfXlMVb9OavDAWr7_3-
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ec6680 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6lSwUGAo5LeF7p0M46YA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA2NSBTYWx0ZWRfX3g+CjxruZcny
 eRTDYDXmgpSbIq+trAP32Mp/PH65Yn3yRQJs4Q4//p8YCgsAJuCIDo/WXx2Q7ZdfGLEbi0NZWwc
 UbmyDxQ5Y85NnKeeKlJ29keI8d3MzAlUIH98yvnpgGChK3ZbJpqce7C7eZiLIx16dnUTqTwrMKd
 AWsZmNhEYieI/4NJEkeJMfIrun6FaHX4GHBBIZ73bKKIxYPaJy3Mt31bij6ZOvKvS4jf+/bOBtp
 kIdX31Yn7ZpBBfwVImNeMWZsD1bcFaFiLwpej9YPeId/QP8SPhkhVUiMk8vOvWldk5bXuBRhLiN
 FBQV1KnmAYIXVyXSPwaJfTqQrwszN4rEnygk1xM4VurTK0WLIHAydQs4lsJYkzfdkgFOUNuiKG4
 GJLVcpY5ccPy+ocSaXJ77zLnuN0w0m5WOWZOPZmOqWcBTnO+S2tlbqyyg6NidoYFfrCvfE0aEZA
 3HzU7OnQ9TbdJFMwBlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250065
X-Rspamd-Queue-Id: C2867465549
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36477-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the Synopsys DWC3 USB controller found on the Hawi platform.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..2d10994f7b44 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5332-dwc3
@@ -203,6 +204,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
@@ -540,6 +542,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.34.1


