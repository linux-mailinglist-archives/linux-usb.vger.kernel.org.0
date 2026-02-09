Return-Path: <linux-usb+bounces-33217-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC8RG3RIimm+JAAAu9opvQ
	(envelope-from <linux-usb+bounces-33217-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 21:49:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 230C511491B
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 21:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73B943025F6D
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 20:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B37385EDF;
	Mon,  9 Feb 2026 20:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G08Ldzh4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GKPC0ywa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EEF339872
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 20:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770670161; cv=none; b=Po4jLIf+zF118Mdv6knMmGBjhOl8cSv1LukRIrFjAV4M4/jhE6e6tAk8VvDbaaFhzC0ScRNVt8hmjHf7mwAPiuCHXbjFzZN/XO0BwDKcuHk+7aM2uBCyt+6Jku+30GXdskZS9KmZtQCtV5KQIeIm14305cCjbiL26PJUMurT2/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770670161; c=relaxed/simple;
	bh=HwnGZ3cKZvOD2FzYP6um9IqcfY3jnwy0Lssknz6kz1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ibufnMbMB9CX7Me1k5mgpZEyPnnlNaZs2/MhO3rXuDkE3YcfY3yQtfYy25ZxANO8Mo33JOT4DPb6hJV//a70xijtfdnNKXWqH3JbbOzntXpOME0ZShCR0FCFYScXFcmjynIYuF0PXW9curMFYChBevaJwhTPaQfjzNRBfbZznVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G08Ldzh4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GKPC0ywa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619IRiAe3454184
	for <linux-usb@vger.kernel.org>; Mon, 9 Feb 2026 20:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xiuvzHoOW/F
	8kB3kHeqD8PEamlh8VCXtCJ3Ykz5i4zg=; b=G08Ldzh42Jozrf/HSU+ysZrTMsB
	NCBcchNiA11/egHMLOXLCwJoFabA8ku6kXKlCSCoUjGhShK38rPzUZA60ifqdF4l
	xFWJo+dPbQXxIrfxPV84EimRuvZ+mZq0y3e2PRLE/8udbP61MvTlBaB4iGVPDAiN
	Nohm9C3DHmZB83/WV4AMatYf6p2bVEXzHwyrJut6OxQ6dIi+ygdzXxxP5xjbIhOc
	xjraJ1PX+RFUbSgE2AO9f+4YDSDleHzOoAfmTQhApI9ABMmZKqIoqWEg1we6VJ7t
	ZNNsCD79463lSLlC3FoZ539KUhEn5DTRedk1DsJnl2LenORXRKIri27cz5w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7e7g9udf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 20:49:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba68ed568bso539921eec.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 12:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770670158; x=1771274958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiuvzHoOW/F8kB3kHeqD8PEamlh8VCXtCJ3Ykz5i4zg=;
        b=GKPC0ywaho+eLAOBo5zbB1j+01XZXqoK9tLnHwqKgP3Ku3wtGo41I/ybqmThH9BqST
         8u97ljsTnXDQW48NL7pSPoPipbOWH3u2Nu8hu18o0/xkM8iK4mnJ1fKes4Bd6eDCfjMR
         HYKEO128W8ngLVkLADHu+pMFEW3gan50pho3G6GWw5in0Trux7TfmDyFntmtD7jmC0a9
         rlcW0Nyqd8yBfXgatuw9PR3PNyOd/d8OYhWjLmaaVcpqnTDBtsVAL332A/oY4vY1ZNeh
         LiHZRnEZQMj/8x+6aYSbPHeNUEBQ4/2i6MWPE7HKIdZqnSIA58XyDZBhvrmez0bYMUC/
         8LnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770670158; x=1771274958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xiuvzHoOW/F8kB3kHeqD8PEamlh8VCXtCJ3Ykz5i4zg=;
        b=jvOqvVJmh9JXydgKvzH6Kd5lCcK7PZHp501BFE8ouTkgr21K7BggPbKUaZUxVO0c5v
         C8iHUWO+CbB9bwQa2afkV37Nm7GYZ97bwVhK149B6EQ4V4K+XAQSpFmk+zAzEetona14
         XIiOfsf9fWP+j1TYOzlFsGHYyT3lv155nnjI9QtEgKiJaTwyqeDtoO7QQLJpBr2Mblil
         hidWfL3D/ECINGHejzWYcoj/MEhuzBqPIyYDML67RU9I8Tw1oJ2ci9YRIL3/f4S1396Z
         zucb5jiCaWxHUn9U9Bgbs9LRnwHJnVGcM3fs9JQIc53S1It29xtTiA8emTGAft7fS1ST
         avNA==
X-Forwarded-Encrypted: i=1; AJvYcCWAwimGfIbzN1+hYorkfKq0jPrfRHFIUAivrgUJ9c7hQ1EdyrLvEpouORWt5stqz1wYE3i8vIz7PlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCpl4SoOhuie4wwIiSgiNGPeNBDAYfc66NPlSUKIweceAOck0z
	zNKtXa/Wyi2ecurTTq/6EjGjM12DrKY83gx22yEAD3zIX0hFF0soI308FAsx+fVCd+VRacfupcX
	niJqx6SFDCipwHnRG2xZtnxoEFRO8UY7cYtVs5//4bfhHav6g5j+zFTULn66IGHc=
X-Gm-Gg: AZuq6aJp+WML1c3bvx5ElUHrM3BwnZcAW+CrApW6IFfvFvnakt9DgaIk6RRryRB34Hs
	0I8wSmTHH5cCAuxD9VZ2tCUXaCL2Vl3+P+eQ1muOV7gKKlfC8zsO/50CJDBw2nLXdzp2sKH9Cs8
	nr+870vyIOY8qc8YHJaWrbWJTH8hkp0o31gWKlZ0ZrTxLQUC0tESKY68W+TL8z4t1irxuXROQRm
	I0blthmO8xXhspbX0ts4rKJPueBiB7AMnwhtGDNwD6qvCV1ZtSS+QVczxOAkO5fMZPytZgdNFy/
	5OOxYPAg01TuOoxce9YA7KeK0H3yVvbO2+HdxorhRPZfLMDSF9UKOpLY4K8f/Id07MdV14zGw15
	7Uf+Gh/y2eNhxu2mccm6nwMPMW5ds0HrPUGyjDqUzfZ4zNO/NPOiWKkGV0IdJQ3cvfgdTIPro
X-Received: by 2002:a05:7300:862b:b0:2b7:4f83:9a84 with SMTP id 5a478bee46e88-2ba89d74668mr36040eec.17.1770670157874;
        Mon, 09 Feb 2026 12:49:17 -0800 (PST)
X-Received: by 2002:a05:7300:862b:b0:2b7:4f83:9a84 with SMTP id 5a478bee46e88-2ba89d74668mr36032eec.17.1770670157306;
        Mon, 09 Feb 2026 12:49:17 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba89ae14c9sm106247eec.29.2026.02.09.12.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 12:49:16 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v5 1/5] dt-bindings: soc: qcom: qcom,pmic-glink: Add Glymur and Kaanapali compatibles
Date: Mon,  9 Feb 2026 12:49:11 -0800
Message-Id: <20260209204915.1983997-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
References: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mXwJDfVVOdXfpoco5d_I0F5Ly17Kx0r2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE3NSBTYWx0ZWRfX6bL+kTSxsB70
 vm6GtFVQIDINkhZqCcQpYOk7sx3fXE67Pi5umLpyvo66MZe5Q620PbwVhQzXN7K8dSsKjW9fVYt
 mfHQ2lRJq6XRQzGKxp3FDZ9jHbmhL7r2hK7gC3O5/+xmsGP/E9Bbx80pcTDJ4c/8B5FQhPv0FMQ
 tGMDCaIPrEF/udlLFoMePLABJR3P6fL//36eFDSSXvk8sROCqWoBGU1Pr7rSzrrIjYH7o6qeBQe
 YRVf/pe4gbRCFsBN2E3M+W5v7su+/THne6tus7obyYcyVXGScJ0gNL4J+nQfJ8msCoawaHe8fPr
 TGivKUe6Z3hlL2QdaSYLnZqtssTgdNi8MwF6EgFhby/bqJ96sJrgQLO7dMOiKeGl6W/2ePUug2K
 /cHfIUu1OcVSdzNISn7GWm27BcSf1fq0wBxOBqyKUsqp5OzlNbVAIhn9PuaNaKkX0Gpp7UP8Z1f
 G642GujL8fyntqwh12A==
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=698a484e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=dzyBTGdPCLdzs2CRRPwA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: mXwJDfVVOdXfpoco5d_I0F5Ly17Kx0r2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[anjelique.melendez@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33217-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 230C511491B
X-Rspamd-Action: no action

Glymur (a recent compute platform) and Kaanapali (a recent mobile
platform) have the charger FW running on a new subsystem SOCCP (SOC
Control Processor) instead of on ADSP like in previous platforms. Because
of this, pmic_glink interface on Glymur and Kaanapali platforms are not
compatible with previous platforms. Hence, add new compatible strings
for Glymur and Kaanapali.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 7085bf88afab..ff01d2f3ee5b 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -23,6 +23,8 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,glymur-pmic-glink
+              - qcom,kaanapali-pmic-glink
               - qcom,qcm6490-pmic-glink
               - qcom,sc8180x-pmic-glink
               - qcom,sc8280xp-pmic-glink
-- 
2.34.1


