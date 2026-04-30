Return-Path: <linux-usb+bounces-36776-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDBMFxBD82kMzAEAu9opvQ
	(envelope-from <linux-usb+bounces-36776-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 13:54:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC56C4A26DC
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 13:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72BEE3027313
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 11:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64708401A1A;
	Thu, 30 Apr 2026 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEPnXFMI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8y1Whe8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2AB3FA5C5
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550007; cv=none; b=qzA6W4+qDA2atveFEyz3b8po5Solmy3VpXq1u8wqI74QSDr+38LWFi4xRmn4/ILkg+j/8HA1TxebUbtx/yH7liXuqMlHBR+tE8ZuMUCsAQ/wGCiKJeCE74aPEQvgsrL07l7LKM1ilgyzwAEaF7WgUq8nPEIgav1i+tgh6BF+bfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550007; c=relaxed/simple;
	bh=vikEhhQAY7TXIp5ES59NCIBAjRtu15zwPhvd55/faCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZ010OMVNL2kqyUOG5hhPixzL24oCv3gDzo7w+xFB5DoLbtt0Yzb0A5zMTd9Q+UBxlPVt2Q1LqQ6KIV3ta03NPXMAxeJNCDxUbOOi8IP0Rr8j6bL+zn3wXiWQ/se+/rM4KUFSpGXo+TC/+7Ijot0+30EcOXBrIvl9ugN14SaFoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEPnXFMI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8y1Whe8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U7a3YJ088818
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVcuG/PRSIM/38eLRkFer673Cx8cl85lQ3sCn5QG5Uw=; b=KEPnXFMIlPrEM5V4
	8nC7tE5zbPzmLnZsJ6z0qw9gb+IWODv2yJ7svR/GP+U0yW+l/Ke9b8S9xG1TTym0
	Mnlw6+Vb1X5JKKIldlgwq2i1XzQzOs7Y45fjVz9tRvr35/2txGkRH6NN/qyjHVLk
	6GOYioCHCwJOaQ54OitlzFaDsdG7gqQAPLXMF9A36utWhmUdnGIYgcPm7Efh0T/c
	++zSBiLbeP2G5uhrONC394/8Fd3VnR57zndQ8S/E0NEB/KaZo+AqUh8x8d3UFJx+
	oMEzxrUBfgg6EKSqtOGNiZiuxcQAFhIaGlwKvQHZ1RV7DjBD17m3OwnxI3uSj/UB
	S7AlGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u415vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so8152565ad.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777550002; x=1778154802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVcuG/PRSIM/38eLRkFer673Cx8cl85lQ3sCn5QG5Uw=;
        b=V8y1Whe8+QiViHO1vn1jyuf1JGnjS7SXRYrz7HnG6vcTOg4uBzJra44ZRj5lX6WZlU
         1Mq+R/JztYOGgBu77hOSkSvqaJG8yLwi2dlM48ibXs1GAEjFV52xAerLAlewp1uQOKml
         +N7xhUwzx7vIMqREfSSW91IA+/2vcPhLN6A40Z6GTnvLAJf1w0ywWor+Llm9HSUBrwlY
         rPt2pfqI5PyZDjrHPy/IYfilK87s4dY9q19T6TysUYLyGnlUhKVB4J6V5WdmjFxXjy2d
         3TmX4lC+pbILVFg5NwC3WvR61vdtw8ki8oYCOnfPDS8/adMFiwmW7JEFiHO3yNd29Ulp
         WEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550002; x=1778154802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QVcuG/PRSIM/38eLRkFer673Cx8cl85lQ3sCn5QG5Uw=;
        b=k1ma3Y2G/O579LnLpDngufqOOaZbw3/tQgHJO5YIWa1Y18HaATnr9ebxydIhXMGsUH
         9vtf9aoSYFFF0qcmgKl9VvNIzB/YWWboZfNq1EuLo+QuiJMMP6JKCltFXpFBZadw2CjM
         0IaTOUqpnTR3oWvfddyXsnUI3BCsoQFGJt4vSndvRcR7yEGFQDFsEnRskRi8QoC6drlo
         3U0bMBOEXpKz62hpO+vBNxkJDUaJE1L4gshMUfiSI9c1/pppcEf8Tnp02EchErUbNPg1
         VvsUq7PcF8HsMjl0IgPv+ZMw98pc9j/ilM50KZHzyoMHKHCOwlXWHUw9ufnXTWuf9ZY0
         LEPQ==
X-Forwarded-Encrypted: i=1; AFNElJ91EFjiO377ZgN8QamCpNf9Z8RxloVjvvI76THhcWK4gdU2Rr5VaXjP6oBZwBT2M5KvGH2E3xT/WfI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx56wwsOXkm6wBV9t6UB9XJyMuv0aWHosaZJkYeflzXRZ1GDXSj
	aPBp8hIbNrBgTVTy/bvLZ3H4eH3+UGskEumdXYfwMFX3FpfWc1KjoDRBLcqOTwyfYQ9rKNDljpG
	0nY1PMhLQstCcQ3R9hMZk1Ce92LHJl5/YKR0ahJ+FwhVLmmTkNycPg83YD+7IgwA=
X-Gm-Gg: AeBDiet39SRrTLtSchrwxigeZNS4OIaDI3D/TSNw/UOYWE8V2caQMlFJef/PDuCqSDB
	D5TcpSawCF8EUDMOThgHsI0EhvQGsK4MpOBLOL2Gmz4xF3CR2IyczEUwDAHS5AjmIqyi/sQKq6p
	FVUWhALIk0MozEutRaGkmRg6I9gs4FtbdrhhKUnyAE3hWax+3u6A5B00GwqzZkLduA3pXVS389u
	8SQuTyPlosZ1QWYtzxHQdNSBA3JHZ84xR4oRMICktipIGe4mFBfTXLZUckgBsXUFvKf3VBYvVKZ
	an5u/OaXiCedOBwXOyNEFMKtjQy1gdZM1PvVNDl0TIOZtJiHLUJ3g6NmGuclhrnmZvcHYeWeBTk
	15E+HjFtSGbfxVycj2SbBSL5tAvK3/Xnc0eV5EZq89n4yPXQ=
X-Received: by 2002:a17:902:b403:b0:2b9:5d18:994a with SMTP id d9443c01a7336-2b9a230481fmr19609525ad.7.1777550002455;
        Thu, 30 Apr 2026 04:53:22 -0700 (PDT)
X-Received: by 2002:a17:902:b403:b0:2b9:5d18:994a with SMTP id d9443c01a7336-2b9a230481fmr19609275ad.7.1777550001996;
        Thu, 30 Apr 2026 04:53:21 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:21 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:20:28 +0530
Subject: [PATCH 3/5] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-usb-v1-3-c9c108536fdc@oss.qualcomm.com>
References: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
In-Reply-To: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=1054;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=zn6uUGX3xthVUxa1M3JyRW75bFS3MIMC78KkLqwsXyM=;
 b=oG97Mr3hq7o3oW4gmpi6A0IpQDxDYkoztOwCzA1dH6PZZWoZb2GXuAJH350pFj451Zs8QlpUu
 9fCN0zdcVp5D9cE3QbLqS+i3qh5eJskM9ww4Qx/h7b0iuU4pwDpsqmZ
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f342b3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ohkS0SODeAR81OU_PL8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ip0FFUSa-Q2Lx1xVoeIVUn6IQgBoXxWt
X-Proofpoint-GUID: ip0FFUSa-Q2Lx1xVoeIVUn6IQgBoXxWt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfX0FcwBZ9SRqGR
 hVtGbgN1PqZ3ElgxZkwpmvmCLC3jM6p1T5dnsczuJ6JQFPAkZBkB/W/eANK05bQxUwm0pGA2onR
 rks7QFhLBTzbzpfyHn3/DnS8ETCNx0/He87xsVGtILKR9J6GFmkmB05Ln9jQ+UtXApQ5BjYgrT5
 rdVJoTn251QJaPVetUFgxifB/t4TK8BuoaesU6q7mrwnpIv52N6AZTAb78ivMEXAxyTmJZbGM62
 /MXeTyZACykaiMQzRI8twYYOEURANcYuXjKkfcazYyhusY+60GKqI+wVhRmfy3AGM/hdGKdY8it
 ughAl+baatQ6zB4oCxpDXmy4MU/INWcgVjJFKf1opf6LXYFy1Eo8V4kY7j7B8rijneNGgFN31Rk
 hXlqNo9JeiWDXN3kxlv/NT0wHi1N+K34/dgu1CvTadAeN0iDsyMfK/a/+agXwU0UwWGKWXKB8Zk
 jQdcI7Z59Pesi4dMScA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300120
X-Rspamd-Queue-Id: CC56C4A26DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36776-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Update dt-bindings to add Shikra to QMP Phy list.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
index 1636285fbe53..8402fe4a96e0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,qcm2290-qmp-usb3-phy
       - qcom,qcs615-qmp-usb3-phy
       - qcom,sdm660-qmp-usb3-phy
+      - qcom,shikra-qmp-usb3-phy
       - qcom,sm6115-qmp-usb3-phy
 
   reg:
@@ -116,6 +117,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qmp-usb3-phy
+              - qcom,shikra-qmp-usb3-phy
               - qcom,sm6115-qmp-usb3-phy
     then:
       properties:

-- 
2.34.1


