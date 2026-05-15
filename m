Return-Path: <linux-usb+bounces-37500-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kD7vN3H7Bmp1qQIAu9opvQ
	(envelope-from <linux-usb+bounces-37500-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 12:54:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E7554DD2B
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 12:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ECDFE305A8AA
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 10:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A578C47884D;
	Fri, 15 May 2026 10:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nuWfEiHN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihPW5uO8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A04478865
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842086; cv=none; b=tLNSmmvHNK3zUFpP92qAQcSWXRfNLvyfa4k4gEJMrZess6WhDWfvX1zmpum+T2wD8D1GE/gZZuswZXp1sdZY+VBCI55ABvcmiEieDyoPwtJxaGy/9oqB05JptZexLC5V3CxNoAbooFCRtJV15RX7U0t7xu8jzwv0Ns9SgNvKLXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842086; c=relaxed/simple;
	bh=+XnnaCjx3RG6qRrENjsVEcqRroWYclHZQYSm4z4YbGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+Qh0zqQT4uNCJRBM4fWylYGJw+qjUsDmkAK4onPtiJdyUDL9G3Xri/zJqcz62pA8z/EDH3Hj0nZ4X5gYYhPmFZQwCc6EqgCpCThgvJxVwOBrIsKfQJUfwYGzY2tvop/G8n0f/pBlTWZ8B8VkLT9HHikm3iiHvgYiMNsFLWyRps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nuWfEiHN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihPW5uO8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F9AhWg1717390
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqmADDkqt5KHGaRm/cbB0jzfZAp0+Ju/seDw/FuUue8=; b=nuWfEiHN9t1HIMzE
	Psj3+VuTIp+gwIku0JfF21Nih3+fXQGYx55Mvfh2QcD4GQ4ye7jQPowZ0QltrWYE
	DhRNqOJqy3unjAfgUVwArjphV0hhOC8GzZaLIZqlox2KNDk56zwwlaLZbPLD2FJp
	lWo/WLF+Zkrmwd8lG+ranrSewEG7Ol+SqxHzkLl3v+SDn2WgLjacxNzsJixGEVtb
	/GD/OVgK0Geg79u5j9sFUrB1KgNQpaXsGMJVupt2HmGJylpS5pjYUJIofFbPPZ3/
	030Df6Tqxylqilb9aHuzCp42++A7oVXDWDGxgU2QOb7Q6TiOfi1wIoJdFKMTv+He
	+1RmXg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxspfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:48:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8024fc7032so4772487a12.1
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 03:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842084; x=1779446884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqmADDkqt5KHGaRm/cbB0jzfZAp0+Ju/seDw/FuUue8=;
        b=ihPW5uO8fJr1oiODknlAnohN6YyRML2heuWl+IQU+ZHIUr+7ijUZK5CGn3XDEFM4M4
         HvD7Sb+RLlNrqN52fzlyWgmnt38LPzuCQpoO4F30O9PIsoGyeTvRFG/VtjtD9ZwBs6au
         CIm1qwR1EPUqUSXp9+OOFHw+zrLdnPhC0pAFoKez4UMeSyf7kIt5UvNi9yf6/xTXC20M
         ii22qmTb6njtgrBhXnMomEqfa4ReZxv3278AqGXGlKKyJBsdUkg+0G8LvoihasVRApt/
         wzRQTDdl8AW8pYgwcH+p3cp0uSrAPLjljQ72DlH/h1sIttngxmGkbis5fb+Su9jsk3pP
         HLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842084; x=1779446884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RqmADDkqt5KHGaRm/cbB0jzfZAp0+Ju/seDw/FuUue8=;
        b=k8ZSaklq6coiz19Db0sTqdJkECKdkEc+qj2zo4VCUFX+sGNWCZhDdh6wOlTGYMv0U5
         rRiZ9zh2wqaemQWU7lzSDMlmwoXoVgmi2eVQUpFLeAvvfBP4J0pKfNGwXUHs6Sj9LMQX
         GPS8n1V0Dk2kQLZ0zveIcKT46NpkzxKTdzetNpJSDJiZZ3GmSSlQ3ZJYf2LDvPpVAQDD
         nHiEFLn2sa69XFn502oE0wXekAYv/z70d2yvjID9k45uHDGEogLDwpRuNzLXXSjs/kIF
         UleURya40sMTdndv8sr6QJVwFi96c+XUU4y14i2ZQ1TD2u9hItCObU2f8NCSuSv7AD+3
         3JFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WpBURIgKvzgtH5XCarGm+bDTGVx07OcnL0+PQzdhCFqYoqEZHGvpblK8CfwVziggY86VRe0sjN7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIgmjqnbyVkK2riawLFhYtxnpTefyQ3rXlSVRSvbNv3HBzLNNX
	98q1/IYcqgolGVN3KrdHJXKsYBmbPXXeKlvGGoGekP/3L4a3fuD1hF3YLJyhWIE5qq2vaQHDz9H
	T80P1xNfXUUKfdqXjqm8Lk/aywJ4LUq7Z+GWiYh5ryDw8CgXHO8YxQzmZqgz6Nsk=
X-Gm-Gg: Acq92OHarsroSumQo/FbjYuPIkGn9/87pRywruCohYgWhztpCh3hxAcRfFkxlPxfWyY
	5JWhtimScfp3HIPGbohYUZ81rCu+lxakLCaylKXA9krF7F3ya8dRJhb2RGCSXLZAgdP025CVIa7
	QK57i4SUzMQ7/GNFFTmJvtkvTGzhkQkCzAbnc4G81WjhuLKOjOf1dSr48MIxZFG7Lpxp+0JV80i
	TZJRDkxZ+xJ3FTLpZe46uP6czkafLphzYRGtVh1w98+WcRwuGFit8aKBF1635L6g6tmq/pY9Q1w
	v6aFKxv5mqzuQa00Hm6vyewkyeddSiSjwpFn3QbvPNE2dukPBAGOMLXJO6juiQp3xtObZUa9I1d
	xUnvLGGZJm08DUcq0Dk/GILP0VgGaknezQIs1Nw2Ad3dqmNanpVnW/esathFGjjlFW+NKBvRDu3
	ilWG6ZhrRlfE1Nze7gfQwlfJ6xya1dLayz9pbnrMcLqTFRKinV2ZEouRKLAoKqTQ==
X-Received: by 2002:a05:6a21:3298:b0:3aa:f9cb:d436 with SMTP id adf61e73a8af0-3b22e67bb98mr3744697637.3.1778842083582;
        Fri, 15 May 2026 03:48:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:3298:b0:3aa:f9cb:d436 with SMTP id adf61e73a8af0-3b22e67bb98mr3744662637.3.1778842083082;
        Fri, 15 May 2026 03:48:03 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:48:02 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:17:44 +0530
Subject: [PATCH 3/5] dt-bindings: usb: qcom,dwc3: Add ipq5210 to USB DWC3
 bindings
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-usb2phy-v1-3-5f8338d466bf@oss.qualcomm.com>
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
In-Reply-To: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a06f9e4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EcSGSXt-TE7RrzoSa2cA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ZPcvb0a-sRHgx57q6sNA3FCFOO3OkAl0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX7ZrNlu+EmRcT
 yuWxd3HsDgo8ZDeqDhziwnRrw0/giL1ZJ2Lph5fGqWkNJHd0cwmSz9dij5l5WAprHFK5olPsSuI
 XzyACEGMZo3fw+0ixHlKmPxJ/8+twz8L1R7iqsKe6ViFH7aMZuxgOFSefJ4JsP19T1fNZW00rRp
 U02zG8Kd0XGsn7a2/pDhn13azdcIvfJStu9U88VhYL3xBlLybxrdYR7lsAcbMTgzZjOJv87Y92u
 MDM+TDFX1yGYQz/SQgRHMhzyfxvARC099HPMr4JpoCmJ8WD3c5Glv19a615k7mJo//Susz9/k70
 jB42yZJju1hBoFr7CcH1LQ7UPbavQscKzV61C1PiBTdgIGi2h1WyXhABOYVp4K+WsKO1y/pVlnU
 6EzziA+hYlWSgjPK1XFR5uQzplh7jnRZ8MvsUaJl8nFIo3mWX+MStgoixRcp/ifdm0RDRctXxmv
 cE1Vvl3ZC+4IIb1gvNw==
X-Proofpoint-GUID: ZPcvb0a-sRHgx57q6sNA3FCFOO3OkAl0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: 83E7554DD2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37500-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Update dt-bindings to add ipq5210 to USB DWC3 controller list.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a7f58114c02e..f8e0819be894 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -26,6 +26,7 @@ properties:
       - enum:
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
+          - qcom,ipq5210-dwc3
           - qcom,ipq5332-dwc3
           - qcom,ipq5424-dwc3
           - qcom,ipq6018-dwc3

-- 
2.34.1


