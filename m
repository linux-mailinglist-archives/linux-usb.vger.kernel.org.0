Return-Path: <linux-usb+bounces-36826-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DRxEtHd9Gn0FQIAu9opvQ
	(envelope-from <linux-usb+bounces-36826-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:07:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE8A4AE50D
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92982300C32C
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 17:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9074442317D;
	Fri,  1 May 2026 17:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHWvmU+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WBJIreje"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFF94219F9
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 17:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655206; cv=none; b=h4EDPifpNBbYQJIT2oQOUQDdBuCdNzKeu5Q05Js0T7OQK+gUIlZQh5NMNwNYRZFN7QXngurv/nFKQG9HOWt/ZuuWl1Fu9nm/7ezmiJbEwoPMEemmbytnSkij4+6vFTpEXMf8egWmkgY8Jveb0BGkQldsLDftwk4tcaTD0mQfi9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655206; c=relaxed/simple;
	bh=doFJzNLDHQmlXc2pfwFDlVaTkV7lTXB8yqsy53flfY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q168UkjvmRaT167xE/nlsktcL1PLnxatijurRE+uW2Q+YfPNUqkx30dAQNa3b3ekBTsC17vO2nVX0xjWrAta2PxwoEWS0YriY3G/PXSXnzAGgbQLrTx04XsZN3upNbXxDmvqo8pbTG12vkGuFQL1+sNeuJBX33q0Gq6C0GSk9zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHWvmU+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WBJIreje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLRKA2660929
	for <linux-usb@vger.kernel.org>; Fri, 1 May 2026 17:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j0RJQKr0tEf
	FrH8IEW2efNQFcXBtQIOQlSiYqCKVrXw=; b=bHWvmU+jo6wB4u2LZnytLFvHm85
	6RSn3bSkaFiQZrJL8EUpQKSOYW0nP/+za3Xyh1OjrX0GZ2+/3NWT1CBcgRiyaW3H
	IgksOJ9c7TU1Ej4fbxdlxHUbjPLA0jCi2eXX68DHOfsGpZ+WXwp9nGQK6DOZFlkB
	UxQEByIq+MiUl6H7Hc/4Kdia9rFzRleTXlAoz5OcUIVFo+MIHC0E5dUKjdkhBvdw
	hgRqCoG0GccDnab17rlWuf8ckfyY/93iDN/CWDdyzoPe0YcvodSkVrwzWZqJNPvk
	4F0Vvj1j+m6WgoeLIl1pufG7drOnxQpNbb5+vlTeorOiKCKEl2H05LPRhRw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvhbtj98c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 17:06:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so3236656eec.1
        for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 10:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655202; x=1778260002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0RJQKr0tEfFrH8IEW2efNQFcXBtQIOQlSiYqCKVrXw=;
        b=WBJIrejealST25MRBMzniO6s7UXF5KfDfAEHF64EmXijJV37WawNlm6ac5xGIwegVH
         gYRRS1xk5hJV/TazjCT8T+wndvpn+byE27QSUMN/CzFL9zOS0W0awEndUkfoxPCrlrUn
         FwDVNCWU8Juyd7Sn/HNBT+MMFZcQfZ6wXbXBmFGC9nC05LlAEG0/5w9RE+ZDiYYXm4Rg
         YnGJgzFCl/i75v4HF7E2AIYHa8zzbEiqRb10yWbDyfPQK4N3fmkxjzF5vYBUrotkW4vL
         0ndZxGci6UU/yjJne8+MzM4iBopcWq2sum4yk7IqhXV820MbviIXWXA8YAM4bVZkIaBt
         qT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655202; x=1778260002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0RJQKr0tEfFrH8IEW2efNQFcXBtQIOQlSiYqCKVrXw=;
        b=pP7fIcuWl7DKcjx5N72x78MMjJT61NHpW3jbCrb4IrYEVVQfOkXY1x9vtkWP++qieH
         3LOaQvmb3uyRxYpL4rbL+TvzRtKFZtEEmGTcWXnTFcIBpJEtGhnwP9NdcKanwL42Bw69
         Nq3AJOejiQ2AScdI6eKs+U3bdhmZ9R+yD19qJiB2+Hk1Yxd+x1bcF3z1smnhP/1YrQU1
         wLG1GsnFRBvnUkIdoz8YXILRxEYeguPUW1RMJO1MwSWEcKwykeSKY0fIymBjkNe+clgu
         ZNjxcetlwUFRnQzaN4/a14G2P6CibuCOhVjFCsYevy3eL2tkppck2JTvNHH3yRo4Qxcu
         l+TQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3OWDul9N5nWgxZl/ceeQp+MShUmtbE1v+wTd9pOA9DBTuKP8s0Fpncge+hVG8cUS4VmkPyKYA+sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQeOKL7bZo7SDpUe4RXh7atYUapUSRxS+sZ5ywCjz5jbZt+y7+
	DMo7hDrZeYzi2QjtwILCH0GuS0Z++nHvhSVG3qJZ9O2V0HYYXHseseUtbvRDKz0qq/K+/2iy1XU
	/nvuuz1QiRbDrlQZl9m2HeeSs3pmbzjahQOY+LMY+Q4ZaxGSnPRG8bzEdoGLX6UI=
X-Gm-Gg: AeBDiesM7cqkb314Hcml88NS/9pRyvySpYu9G/1iAKY/qS7Up4F42qxOLUKoGEuE4lA
	N/MLW2GmtKhM8gY/w7dpcWciKjaWhxuFpKmhg97fSeBu2ec+Z20iAygpejOilc+vBls/XKhdHrr
	EJ0m1OBiw0es0k4LZZThx6hrWeipBBOwxVApbC4s/QuRTBY32DpP+le9Hunz+8uzj+CleJaccIj
	3j5WvkxH1fLQWXD7RImG1RvHozSMzPwTi9qP67L54W8htLBfRSotV+5e3846CRmopJVj3J4X1kn
	hzBC7M00ihxcGd2/LPePJeBLxKxjR2x9WDBFq5vb0LPttbszLr2/Ny8AMpRjIAPfjm9+4t4oPWf
	cy3baSM6mxUqkKY3SxdggTJUbG10vHWb4iXub1mSoQqnFCaHJuw7Pjmr4OaixqNAUYUC+bKphXk
	XECi78Ui2/BQ==
X-Received: by 2002:a05:7300:a14b:b0:2dd:c066:c02 with SMTP id 5a478bee46e88-2efbaca2796mr85838eec.22.1777655202299;
        Fri, 01 May 2026 10:06:42 -0700 (PDT)
X-Received: by 2002:a05:7300:a14b:b0:2dd:c066:c02 with SMTP id 5a478bee46e88-2efbaca2796mr85821eec.22.1777655201800;
        Fri, 01 May 2026 10:06:41 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:41 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 5/9] usb: misc: qcom_eud: improve enable_store API
Date: Fri,  1 May 2026 10:06:31 -0700
Message-Id: <20260501170635.2641748-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cP7QdFeN c=1 sm=1 tr=0 ts=69f4dda3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=iEam2xx7WbKG8qDqzoQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: GioImLqfLPA6pkijV0zV0wPSmmxNfncl
X-Proofpoint-GUID: GioImLqfLPA6pkijV0zV0wPSmmxNfncl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfXzrH2LmGfJnye
 icJZkn1zgJYL5FIDS6iX59oJaCf3e6swqX4hpEtYbb9gosO6PdwsthkBYWMxz5PagSY2DQEWrr4
 CNuCkc1kR3d4muAPUrj+8oVSEzj9arjVcwdb71AZ4EqpKRcmFNUvKqwNewATeJZ5b0EZgQ/sqEi
 HP4r49qDop069U7achO+sdURru47/35OuwXzyMbsuWx0kZRRbHMShWMSNcesIyfqgEIQ5NW9mzq
 5AfrpXaOeGtw2SMyuL/aPB+HxhU4RV3seDAyljVTaC8/BuvwxF3eo9tn11kAseESmKCIlr9tQYj
 BSSPaTYBTQ4HZ7lX1yIDU3lIICO5TTLpKLAXLzAMy0Smhk2mrOpItaxWbhqV3kNz7uTRALWeguz
 h9+Lw84hNqVVoQ9FlFANmhtEApGCiFNcgBoO/VyqvswEeJiWWswoYptfIoSyEQHlzB29J8tnbDt
 KE+amnpsMZZrK8hxBPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168
X-Rspamd-Queue-Id: 2EE8A4AE50D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36826-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 7fbb74bf1599..f656ffc8818a 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -162,18 +162,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1


