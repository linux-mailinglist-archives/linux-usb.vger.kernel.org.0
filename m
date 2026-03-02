Return-Path: <linux-usb+bounces-33879-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E1EGiXGpWkZGAAAu9opvQ
	(envelope-from <linux-usb+bounces-33879-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 18:17:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E27CF1DDABA
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 18:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B53EE30CEC0E
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 17:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7675423170;
	Mon,  2 Mar 2026 17:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BemmueE+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GqdNMgxu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F990428838
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 17:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471422; cv=none; b=Xe0MO8hdi80cZDgM/PrjQd7klYZD3+xCAsmIynlllrp7sZ3b2W5CfbNsDU4s0unOgc3b62+tAm17GofPo49dJU/BKx5SXrHLLdV4GKl8+zWLtXKk6AbaXr8gPJ6cCRS28x01VvtKqdlddYRbGCjVaSpOuNkwFLjeRiuZ6nn9eBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471422; c=relaxed/simple;
	bh=EoCXFpUebrCB3eLLljmtB175b7eB89tb2C5XolScFBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IyCg36QbzJmXRCbCU2ZB2Wbn1qdgO1jwGCNczDEUnq58eEEh9VBuQWA44AOEgTk7Cu9JFnV9G54I76emod55/p7LvSTW9XvuA2RbWKEtxNaEw8sZLNMf5lUySDuN50UAa2DXAEGD7RXr5bYuazTBoxgCqLTCxOnZHD9o42RsAC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BemmueE+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GqdNMgxu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622ECamZ662204
	for <linux-usb@vger.kernel.org>; Mon, 2 Mar 2026 17:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDiLwnIohKXOcQY98meskBFzx6LAACu/bhd80+16XyI=; b=BemmueE+uLhZnm7n
	hBXKuEERFiKnldI9vKrDC8SlscBsGxiTvTJ034J3NJSjra4dTkpn2XsktBRtVQGE
	oN7YOK3fSM2JqReVPUL4531MlqV45bkIPZ+lz+QCMZu56ZjiUUlOYvz1rvYJF+6N
	gJZG8sHY4zAtnwYo+vXrNV125ixvHeZfzy2WlQneU6B94WOzsyOu3jbrfg/Fmftr
	zhWyJFzq1hx95EGbRn0VjNtIVKB5MYpBibFoma77ZVPuesWkbnFg/Qx2uW6VRw4J
	4P+EYhNvox1RarEDdKXfuudXcwlBZtlXH5ho/6rJZdJcvcFrJ/rTFyOa30+6eWnt
	mXTVqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2sy81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2026 17:10:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3b6b37d8so3164380385a.3
        for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2026 09:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772471419; x=1773076219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDiLwnIohKXOcQY98meskBFzx6LAACu/bhd80+16XyI=;
        b=GqdNMgxuNZSIH+nS3A5dxUTy0v214/yN/U0Ejc2Giqz30UMNQ3dqSEfFf2Y64CamBo
         g7nQEUsYIeedMLK3D+UAeIZ2qd7L/PKYHUeWFdbJmNZUWhPUJS7neb/ww2quuIfAPjNl
         hYvDz1fsnYwtwZV6rAkfXxpSGsXZVhrPEVsWl89kGC5yD8DL99BETWsxvdNzc7huISi0
         AWZimWUxwZHZBh34lckjAWT61F14Xbin5kqxUhnRQyKBFJvkL2H+A3YN8lsj2DnoWbuw
         mL9tmouSA5jljybyUIyEjDLjCMeR+PxkVstZNaXg4kR9MLTxzkQT1PjFXEkN5h1daW/A
         J51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772471419; x=1773076219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HDiLwnIohKXOcQY98meskBFzx6LAACu/bhd80+16XyI=;
        b=nq5zeGT4ZcboJc8+JqG4PvhI6MzhYlxHp/nxQig/NFWxnZLcded7+Dkcs2FUiphN7y
         ZcCgrOmXHQtwc8GnGCxOpw2PrsrDfHzY5MIJrLljnITJIO67Xi10m/V0S5GSV2JdylP8
         GIXvw6hanAHnWF7Tf2VFz05SFPBoKV18ah+1Z/glFDtZRPk+7gQ3cvkv/rOb0N3C2V01
         H+KHcePr1N7QhhtFuToZYOQen5XpuvVq+7t7bl29Ey0z+i+3nS1S8IV+IlVgEAcsMJdH
         bJ8SWoh/Pt0JUVpQv+5pWXdCFU+yin+hsDdNQtlZoigStNGaxKBkL7pJCKAVsDF6C4/E
         r4PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpVP4s31TrW/zVCTiADm/oNWsWLJ6EhK9L+msM7HzDZSjKw+eo9MQsk/BX961Spc1VkxFv+UtO1U8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjDWhMQNW1CBr6tp7qTNMmXyHdHkzQThYQyZq4hfw9dtSvGETB
	kGOiyvovD0tXCc5nz7O+dxhIUfNf5b0MKJg3Yh9Xrz3n7uFa/TnsWtQMfKkFruawMOh/KYnfd7n
	JG3sbvkcK1X9Q7v9k/jo1Nx3pzNdkjTRVmfAZZRZVQ78oGIx3YILx3FX/ikAO9Y4=
X-Gm-Gg: ATEYQzwcW/AmCW30l6BWLA8MtGsJ3KSS/JED/IVqH8osJCnLWrr/5MGydWDUbgXPGdY
	Zh7VVhYO8hYtjhFVrXdUmslRtPe0oA7PCQZTD+3gjjW3Nj18TWE4O/nDPTLcJJmYc5hvZ2RTxEr
	ZeYxC85eal2s1V1XmQ/wFAGoa7OAaJMd0BktYqsIa3L/rB+w3uo5c8VC8GUtjjti3djv+Jpi9i2
	z0OXUvGGwK/2uSSSIByU4CXngInPEi93tWTXn58qglpOnnklgopEuEaOGz/r60RFoHlKnfJOKgC
	CgBHclFEvRAJZNgob2FAc7JjOVZp/QksKE8WiNAZlJSSgNy3+c6F4Osw+lB1wnlgX0+CsmRiPPI
	NDzfIlyLfgAe2I+hCvFG1BKuRv81NvQ==
X-Received: by 2002:a05:620a:29c9:b0:8cb:4cc2:c5d3 with SMTP id af79cd13be357-8cbc8e19a98mr1572877685a.73.1772471419237;
        Mon, 02 Mar 2026 09:10:19 -0800 (PST)
X-Received: by 2002:a05:620a:29c9:b0:8cb:4cc2:c5d3 with SMTP id af79cd13be357-8cbc8e19a98mr1572857885a.73.1772471416856;
        Mon, 02 Mar 2026 09:10:16 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4175fd2sm12824083f8f.14.2026.03.02.09.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:10:15 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 19:09:52 +0200
Subject: [PATCH RFT v3 1/3] dt-bindings: usb: qcom,dwc3: Allow high-speed
 interrupt on Glymur, Hamoa and Milos
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-dts-qcom-glymur-add-usb-support-v3-1-883eb2691a0d@oss.qualcomm.com>
References: <20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com>
In-Reply-To: <20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EoCXFpUebrCB3eLLljmtB175b7eB89tb2C5XolScFBU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppcRxNtJcfd0D54Evk7OMYI3bITnHP5x0lY5SF
 S8gvBXUPuaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaXEcQAKCRAbX0TJAJUV
 VnP2D/9aaAraGTvBu5gFso3EVw1gjmwHfYI+iKJ51fZdDH1dgSUe6RIQEtAmiprkpne3yed8x/w
 OzzME/qpVOo4tPjf0hQux9gpUjFSpKYYXNPwHVpFOTSSKUmA8uLpcQs+252fkGVmUs1eEHfSMym
 CzdM9o4SMFfLXEFcENGCZuRgMpz4n1WDNKHaYaoWTHjVPqejMnO9auqMpe0CsCAEQBhu68MbRBG
 HOMGSm+d5qxHLC68d7Hdrtroz2+SL71IuS3KUa+MD51clFN/tsJkvz55D/oEQzZY76fJXcqwNd9
 02kMOPB2nSKXqZatCr8fpGWqJZE+xajbgRuzGOFEHS7h3N05I3R9OFRPsJz8J9j0zl9rRaiikn6
 nZKImbJaJhusgoEKzV/vtFJPt4IxccgLdaBJfotAV++ifsI29zg309h8AAB/sCuaX5toWsgO3Jp
 S6sC3El1KLc6mKU6Kn4c5QcdXGmvAdVFuB90ZPuFLMbB7GaTY35u39GIwnfesC1IsqeEs1pwK8M
 vjCyC5rBeIYFIutNAb1jd7XErSHlGtcE1dwc3JeCBXRUgDgz3Rn+hIdY6q/EFjfEAd6CcIzarjh
 6usd2cbaIwxHwlXo52Z7WuV2JNkID+Onh6Jui45MRma1ictOO7iZmEUNd0f9xsfwi45U3TP8Qhx
 xY/Q3wOGwWBz8bg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: FmFZYXMEyO_0G36LV2Di2TBHDKBs65JJ
X-Proofpoint-ORIG-GUID: FmFZYXMEyO_0G36LV2Di2TBHDKBs65JJ
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a5c47c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vx3hbeaYKRubAM7LXykA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE0MCBTYWx0ZWRfX3mFJAFJvQwC2
 Uq3JRqks7wyL5o035+d2/09L870N+6RNf5JwYmPM3pH43OKqS3iPD8ob0mLpKNod0oeNPWgf2Ef
 A8zin9TTX5ck9uHDqGjlbDyGmOxEoxzZzZKHczlImw0a5R10FSAzl1SvOQ1KOO9ahY26uIUBUpN
 3wFnxo8B9Dzy7xJh6a9Km/yvzl+TuzmJprPxIVWa8RrsgxiBdAHepEB4q32BA+QmfSpspJFl9pC
 Au34yewOSs3Ezmy+rnUtiHqQN99TpqRga7WqOVSDIbtE/DiCabxuM6DoeHIca1y8ikdGs5gMBbd
 Rn+7IVhBN4R4Uck7JJjLMx1LvGpTagVFEcVY29U44RhAsQthZvYGvrzxUJUbmrSG1x2Z9fkfXUw
 GSxbuB55eJt4UuJSfI30bQS0cqBpp7TIgsEahExzLhsmdkex/Z9qu3XC2KV3H4apqdbvLb2YEcp
 pX+3YHs0PdHAa1Jq/Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_04,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020140
X-Rspamd-Queue-Id: E27CF1DDABA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33879-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Some of the controllers found of these platforms can be tied up to a
single high-speed PHY, basically rendering them as USB 2.0 controllers.
So in this case, the interrupt to the Synopsys DesignWare Core is coming
from the high-speed PHY, so allow the interrupt to reflect that.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 7d784a648b7d..f879e2e104c4 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -500,7 +500,7 @@ allOf:
             - const: pwr_event
             - const: dp_hs_phy_irq
             - const: dm_hs_phy_irq
-            - const: ss_phy_irq
+            - enum: [hs_phy_irq, ss_phy_irq]
 
   - if:
       properties:

-- 
2.48.1


