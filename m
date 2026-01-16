Return-Path: <linux-usb+bounces-32438-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDF6D389CF
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 00:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5DF430FFB13
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 23:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F47032938A;
	Fri, 16 Jan 2026 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjrCbHT9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHQfUpUW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F3531AF31
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605680; cv=none; b=nTEUU8pkeAYKdpUJ3r+dJiHEgPsmr7PITFh5xLFRBLcdbgGBv1oz/C/05jukWbDlT0Wxdg+cEDb1+mHsDKf8iEgZFTEyNScsQbQInh3FD2urAqApklZxxWRdYVS6JvgREBBEPvJZtsh5GZeWW1mZXu18kdokfWrnhfNUPesrUp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605680; c=relaxed/simple;
	bh=9B1FnLaHALjYfJ8RPCg5eOxKik1XLzUO5cKu4vZ+ZZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eyFBPgfvIDLf9vfJObxhPvjPMtf1nx5z4iKQI7jXgYzv7sQo7RqQ+mTjMImobRp7PjdCSkHkalwH+sLf4GG/x+mSISj/E5z1Y5WxPXycFwQv4uzekgwQfEFJObiIJBwNjcsIx5Tt3VqT53jApBKExZcyJ/2aBs67HZAePJtMqK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjrCbHT9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHQfUpUW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNCs5x3031495
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1qylKAN4jaI
	gqx7JT64dI6YQstiaPDg+rYzw4T90x1I=; b=jjrCbHT9ad7FMPlIIlaPJ/C0/BM
	1AFKriWmjUFqj8IAXFfDlJ10BpXqzgzVn0RruFWXNtwlku1CyvhMuJgzRVC6/271
	plk4aJE1pOO06jIEmInlKZ682VWu01dZHtAwVkJsMsoROXeGHCkcyKr578YLeBnE
	6dtBUgnMapH/gKopOTdhTC+TiuXX3W2/7FRDL0HQ7+LSok8ugNIkmZwfoaXY63RO
	JBzwGBiSIJCmo1LSq8jUQ2dJq9MuOifcp+PS4jNqZ8phB1xXvLAiAAFNZqoNEvRP
	e16YNkzyBjzKWQp2UTNW69iSURciaBEunHkFxNoKQNAQn2gSuC8cr4nmsSQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvhsgabc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:12 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12338749ea9so3315139c88.0
        for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 15:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605672; x=1769210472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qylKAN4jaIgqx7JT64dI6YQstiaPDg+rYzw4T90x1I=;
        b=WHQfUpUWxIdb22saXBmXZw4MzbPDOsuxZzHtvpievIPTwcCyqgXxgE/Xxi0qsD2piJ
         //Sf3UsK6OIxoFG8pjbcc/AS5ZB3asWQhTG9RZQrB8i/BjEstIuzDB1WMbe1ZGl4Lb+Z
         kTsVVUVBLvIogvlhLCi/N1yx+jlSkIQ2m7T177BIHe+SPm3XcQT9DrU2cYmS9YSZrMdd
         Iwa8jciQOtWyECwbUvH7dmyFCokyz0JfjEeeMgJ62pFO3XeU2fgD/Tc0mLla3VbvOq4t
         rNppMopCIrzjfFl2hH+hs/GDySiq7MmVb03gCpZGu3Z+qs5uTirhgQGXLNkf4HIo65Zm
         0r9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605672; x=1769210472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1qylKAN4jaIgqx7JT64dI6YQstiaPDg+rYzw4T90x1I=;
        b=WLD0n7GzzFEbcoWKVb3MtwOUqR9FHXkU50ii33T7v+5zyfaBXRjvAbr7wv+xPrEIbM
         fbs1UUz+Byem8Txo66SHKDEvLUr4PyxTTUiMBjEl7hc4q1TgVx5MoL7wFRVrZhPWmJMH
         Evvr0fdoa1cReLbP5J6zV8frQdJX1TK5xo1NEECG5LkuUKt/NC/uLHt1ekWA1tq5Tg5d
         cVNXIFbKe4voGF8PBRV5t4svX6srwWZBDL1z4TlhjrUkcsHWVWVlULHSnybvKYW/9NR/
         iRobHGUIIP9O3ngXQmJvuByypBKsB+2V1p+p54D+xIIwnbUP+l34NZf/uQbynrR2ymsK
         8prQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkbhMaVvY8YZ49sEkPKX4vKift8jXUA3vtu6u3tzv7tw2GNSbNbgejaRv6gGiNNxFVcT9bTtMiAh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YySFqULfZEOFvHLyLjCE2TXCttmYC1h3ABmZQL9z0oX5ftOKCZB
	M46XYec3ynw46m0038RjM7BwmsSN2pyc+nkigEIXZL9b54t9OSzWFIPNrGbGEZpoSQ+lwP3zPEg
	WwH8Sazdka3ygIZ6J11a2leqdpo9mwpL/bucbTT/+KJscgVyEq7OTWejYUWFNKXg=
X-Gm-Gg: AY/fxX6dKhwN/oQZF5stat/MsNpY3TZmmPuQIUCqJFuxHe2F7jb/iFq/C8lZ4RA3kSH
	nRMl6im9HBB2bArSFZMxlPDUjgDShtj7Mux7n6TnHuLCuKcSkaaSrQhtHy4wL5byc0WoVUUk4qK
	yEIIZaEvRc2N07Gu8NB5s91xvCxorjnn725Z2OcGH8y3SJil6TZaFq1sRBvyDvHVjJhzRBuRXrQ
	O/J0MFvvdLspP8HFp3wME4fqkbAjQjSHVPZjvu18cvRPjFdUGeVVtsyrmCWWvgXki/9ILMhNfIG
	CP64bzzNUN/gYX8fVUiuZRJbl1ttUplidY61jAEq28p69gHRhz9WHNtXJ+LGwtdGkxQsg+xu/1n
	DeNwIZWYHDd4hxNAtxqrGYhGcdrcPNAxiXiOGSMNhH7Vswepa0rV3J/XNDzTiIjA=
X-Received: by 2002:a05:7022:6081:b0:11b:c1fb:89a with SMTP id a92af1059eb24-1244b35f486mr3286734c88.32.1768605671983;
        Fri, 16 Jan 2026 15:21:11 -0800 (PST)
X-Received: by 2002:a05:7022:6081:b0:11b:c1fb:89a with SMTP id a92af1059eb24-1244b35f486mr3286723c88.32.1768605671499;
        Fri, 16 Jan 2026 15:21:11 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:11 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] usb: misc: qcom_eud: improve enable_store API
Date: Fri, 16 Jan 2026 15:21:02 -0800
Message-Id: <20260116232106.2234978-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UOvQ3Sfy c=1 sm=1 tr=0 ts=696ac7e8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: TknKKAjKXa2bFzPyAViILZDkUVUvOuEd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfXwPGLCqyvumzd
 17ZuvQn78HhYAfRzhW90mboxnxc08P6MeOqOJoWGJ3sFoOtzGLbNEa5h6lzLs/GVpfNgAiki9H8
 +upUFqwM5z+Ms0eTpapXorksYa6NlHfvdrdt6gxIzP2L5cuCkFjdu750vbPRLxFKQEGKiqE932P
 7ILsNtmknZ2hOIM62+vcvKgXYFhvndULmC8pO78acfleQQZjxwiJHwFZGTpnBQoHVRqo2JLqIp6
 aHLqjnmDUCHC1OSirRQHQP7HkKGm3/L0IUsUwe0FA4dueTMk8gsJAseUw/RDUSf2s+iTcAE1BC5
 9MogNj/OQ4rD28EIMqH6/7YuGUiYvlvZNGC/irXY18C0/ajMY1BS67ZcU98osj1doTQ+toflFP2
 XWwr0hz6Ah/haj3fYPoTo/Mty72z1tp6/Zk05Od0JHexGnX9xsgnndtV3fBQhnLg7InDdvmHHyY
 sN17njX9ByZ+OfY3FYQ==
X-Proofpoint-ORIG-GUID: TknKKAjKXa2bFzPyAViILZDkUVUvOuEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601160175

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index a58022f50484..0ea6491f963c 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -168,18 +168,27 @@ static ssize_t enable_store(struct device *dev,
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


