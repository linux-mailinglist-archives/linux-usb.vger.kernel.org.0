Return-Path: <linux-usb+bounces-33368-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8h1eAYcRkmm/qAEAu9opvQ
	(envelope-from <linux-usb+bounces-33368-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Feb 2026 19:33:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B03113F659
	for <lists+linux-usb@lfdr.de>; Sun, 15 Feb 2026 19:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C52C83003818
	for <lists+linux-usb@lfdr.de>; Sun, 15 Feb 2026 18:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2727C233721;
	Sun, 15 Feb 2026 18:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzOlScUQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sb1vqEiw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AF01E1A17
	for <linux-usb@vger.kernel.org>; Sun, 15 Feb 2026 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771180420; cv=none; b=YY1WSU0FPBhSuq4QGe1yQ0WJpSKl9mQOoZVU0NSIJg+rVcx2mywCsleLWe6bGnFL0050UbVbYh4Sk+hMvB79N6RmKg8oovmrUEgdAHL7k8u2OxkbS3gIyDxupGkVDbuo4b7M+0IPWKm3aDUx1JXLayvFAEBNEhP3nnVfszxr578=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771180420; c=relaxed/simple;
	bh=1zQqEUKVytjO3fXoWk9bZkP1zJln3nhYt7OsCSJbvXw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AdApsJFSBRxDtLM59+P+iS4S1ZJB8ZDAoOn41UklnA3ed4GbYFEpY+qJYf+UidZKE1y9nJonYb2uppZGLlbhTwrHTflsv2Eqb14lzkViI8KBEnWj0YoFhVrzJi/TKF4V8HnTTBj0EZRo3d6pm7apr6Cm/TcXLTku6gosl2Ia3sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzOlScUQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sb1vqEiw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61F5iVk6309658
	for <linux-usb@vger.kernel.org>; Sun, 15 Feb 2026 18:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Zu9DnuLLdKt7ycUHmuRUrm83WHsj11keTyu
	MlQeQOdY=; b=OzOlScUQr8jH0RBbIe+rR9gv3U6g/uwfd6ajjkiuHdgNzdfoCFC
	R/Qbze7t1GWW004BbXB6zOiVjy+qeRX8jJYz7hS5YWVtRhVqCdgl5D4copzGIekU
	RnTTWlf5uzQy8HAhf0rUWDY42hyYAJw8f97A9ilgWvYbXInjzdcejxUXIoqoUmlZ
	MxdrhgYwVJo9d/C+ZvfCm2ev5y+gOKv9CT0MJlO3orK8CF+DzMmGgta2ceerts85
	mbGL7XdFg+lCgV6q3nIVJ6bV2UfE7xrGcSqZpyb0gxXwSEGPe77J8Vwd6lfHJQFs
	Bo0anOj4X0PMw6YeEsmpQ/VqArHXUcfBEPA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf2say-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 15 Feb 2026 18:33:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6de18907a0so1631645a12.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Feb 2026 10:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771180417; x=1771785217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zu9DnuLLdKt7ycUHmuRUrm83WHsj11keTyuMlQeQOdY=;
        b=Sb1vqEiw1v7NmwkeJNVU72asTApjb/NqkqeKyb20TTv1mmVAdd9eHJfdVobtKuG6pW
         Eq1c9HjV1twLTuDZ6bHZzIoEGXlbLu7huHOJ38anjxuYfwbPG5EB8bqDV0m0k4omW38G
         KOWblSg5T1FSWG9zJQh7b5ApfvrPb8LtQ5j48wIlRpHjeArQ4d/Qogude4c/+ETufnNV
         l2AN9nQO7FB60Ibw3XFNI9+3mraXiZWJ5uwU0AvUdJYUWZSEW1Gk8dOSLmQiZfrZQf41
         wuqyN1vf6ZoK6/wrCEmwiXSYE+FG4vhXh6ZAEi8oyQWgdRVj9JdP9b7TKV2Shv+1OvKe
         6aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771180417; x=1771785217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zu9DnuLLdKt7ycUHmuRUrm83WHsj11keTyuMlQeQOdY=;
        b=Dq+mU3AhWnne8VL98K97yRatAleGLQ2j1xO3wXvmcaDoj09SJQxL13OPObZfOeKdko
         FVe+OhP5UhuTdCeafKOfPUZUIFW3/5bMFSy2ujDOuwxcOaTyp3k2jhaBkU2neOQoCsoP
         EMafExL2dmd+wT5Nd8cee0EkStGoyi1qEKQsTB2jo7gjkfHIYGXbagJ4Q+u5PI4c/De0
         4TL/932HSHAlJalkAm4rM9sTNAhRqjc3y4LxuTc+c0kU3s1W1A6quJMd8habQR+3vtNw
         6EVUvsjAQC2G5uH5lBp92VY1BLVeMWTKAHNzmN8g+978imLzvSg95sydeLnbLrqTQh3L
         An2Q==
X-Gm-Message-State: AOJu0YyOXQOmJqAmNvKSm2KytxyCu66aa6AkCC0MwFs137z6Yovj2Znf
	K4wdpvekmFCCU8kj5ggIDvLZHOljIQigV6Ryqe00V4gztJM1Ylv60ZC7AxeZOW9XfjmxC+d4ZSN
	SpRzmFzXeRDCmQh0ZuNvmZwEo4M9jq4sOTNu5VYOU7/0K4ll+Dx5mesJbT8911vs=
X-Gm-Gg: AZuq6aJRE4J3zPW2UFCmSZnFO7Gs0B4H9MXClq7kFjHe+DXVmHKi76sNbblO6locq37
	lOvlABW7t+hh9dTsuYAptte7qrm5/WZ66MAB7N44N6ne2Npxv+QJFcoABeFBn7GdpWMxdoyVja2
	dFQk+L9v2FjjPR2JyaDwcTCCvVkWlWETeBmUkgBgeiIbF69JsLZlXC6XGq0/hlw66mdxMDk1P/b
	yls5RAqc9Tir+YYAM5B8Xejv29f24EIDXkqcy2JiVrW3P3+Ll9nf9Xy1VrHAKalBLIFvjMwdQfm
	OA48wlgRug52w6Cq4od+Q4UNnPYlVK1gbvEoblL5x5OgRwdpGSDVXGDLdV9QO65KmnRPLT8+jrs
	snDOCbESrQERw+SdTTvZESgsewCG80jOvio2+45yzv2zPrhzS/8BfJmI=
X-Received: by 2002:a05:6a00:1746:b0:81e:dcb2:52cb with SMTP id d2e1a72fcca58-824c94471bcmr7170580b3a.2.1771180416701;
        Sun, 15 Feb 2026 10:33:36 -0800 (PST)
X-Received: by 2002:a05:6a00:1746:b0:81e:dcb2:52cb with SMTP id d2e1a72fcca58-824c94471bcmr7170560b3a.2.1771180416254;
        Sun, 15 Feb 2026 10:33:36 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2afeesm9560875b3a.2.2026.02.15.10.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 10:33:35 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [RFC PATCH 0/2] Add wakeup support from system suspend
Date: Mon, 16 Feb 2026 00:03:23 +0530
Message-Id: <20260215183325.3836178-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2NJNyN_6aw7N-oi9-RAu-9ZdBpHqfSsz
X-Proofpoint-ORIG-GUID: 2NJNyN_6aw7N-oi9-RAu-9ZdBpHqfSsz
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=69921181 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=IzbIpCLcpPedZRU0gO0A:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDE1NSBTYWx0ZWRfX6NpMvAwBO3Iu
 orFBW4hechgDuRp1WDmefQtLkPVSLJzBVUA3yWy/CPZhF32aTYUchg3+iU9hCZuISceS799hbHM
 gtbW2vFjaBCCNXYvEz9xu+QpGf18qeqoVEy76OykQS8CA3g0L1IuwI4w3KuvrkAs2mVpMKPKVkR
 4XdLgvvgGJZdb8kGdDNFmuoGgcf8RXT7UeO6ZlbJsQOU8JjpXlzhq5qCkH7YOE74KtANLz1kctd
 zSyk1wzXKNz8Z46Hshy508osaHwi6bPJta+7JSAo7/8drjYGckvzNJbO7kCh7ZFBDx7bQp9CDgr
 6oxdpGwf/ovkO+GJWjBoFw145FFApqqoOibGY7ACU/pQkKXti8aP1uLI1hmohvhXitVJ7t8LIO+
 htBpJlR9xQA4ktQzVnxR7ewcqVrjmpqumVwaxm6YpeiqALh2ydGbHOwdzX9xhb8Abh0tB1UuaZa
 yukiS5qvzF+fTzYKSvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_06,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602150155
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33368-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B03113F659
X-Rspamd-Action: no action

Add wakeup support from system suspend for primary USB controller on lemans
EVK platform by making interrupt wakeup capable for HD3ss3220 port
controller.

Swati Agarwal (2):
  usb: typec: hd3ss3220: Add wakeup support from system suspend
  arm64: dts: qcom: lemans-evk: Enable wakeup for primary USB controller

 arch/arm64/boot/dts/qcom/lemans-evk.dts |  2 ++
 drivers/usb/typec/hd3ss3220.c           | 35 +++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.34.1


