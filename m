Return-Path: <linux-usb+bounces-21113-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A75EEA46FED
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 01:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3982B188D036
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 00:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60211EA6F;
	Thu, 27 Feb 2025 00:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FX40ak52"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23A14C62
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 00:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740615112; cv=none; b=dtBD6FIsdgJqFnA5gZ/y1TqSiC34MqL9PQumJ95v02XPuzcKwRlwNquidT2ql9PH/Q31bDmvqXwvZBYnhqADy8Jeslz6eB0s4jMDsVY7IwO7bDcYO4DksZN19MNZMnReYGIVTbItzDHLY31trshJzLW1p14qTP7eBW01eiG5g7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740615112; c=relaxed/simple;
	bh=OYiQ0Ca9ME8RsPSmprTC2XbZ0QI0xz6X7pxB3R5yxGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dcGU6QYUQTBkoX7QgPGlqMLEex7qMHa5ocEi3NZMhQSm4feFnZuYxTPi7wKZBBSTquNBEI+Ccxg6WbuBWvKhpc5Wz+3Ql01ntn4wMlOhoOWDafIFO0wywtOZhn5rMQbMNkP4D0F3ZrpHu6uK+b/VVkIU+TVrVUoxTnx6VQ7V3Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FX40ak52; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QKenvI011930
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 00:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0nqxAOKrAWpmrpIRkIYOJ+sLGDjdQ9XNnKAOzfYCy4=; b=FX40ak52QUKzGWB/
	Wj8X24gIiTMLsquJujJyP54NH6jHwfSDGiJqhwh1t1INTivjvGBCJikLs2rhPFwJ
	CBpbA0K0AqGO5qjGkSEOggge8ZuHuq6bsHXmL6zKuTFVi7OM5qHtm4nJ3SI3f06r
	T+37Qz/cXIQXNxqPHp2awVwjd/r2JviTCDC+O+R+C5AOhZk5u7LgPwLmuFHHudx5
	UiEgpg/oGQHCDeBi64VnTlvfd23qavx+C40FXRfCZgAyAifCswvGVJK8hjQl3pr4
	EGPJA17wK65oEPoxD0mutfysYuHQVSoyp5GKvFPp2O1ukOOx1V1uaZgKh+b8TgGb
	soUCoQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prkbp48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 00:11:49 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3f40bc5d597so370313b6e.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 16:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740615108; x=1741219908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0nqxAOKrAWpmrpIRkIYOJ+sLGDjdQ9XNnKAOzfYCy4=;
        b=GVvLYkl2aTPlbl5eIDnWhDK2BUyEuCVRuTq4cbnEcVt4uGkzIfDn65E21ZYPWP6mTe
         dRH+yEofHpv/VNMhQDyXdZye03cBtooHF1ufu7Zya2QUlCfeBF6iMIy+XM3FyTtzAPCI
         QQphwVU26ha40Yurs1m6TwoWpO7RRBDXKzJVaefpzG4vS7+MU0/nuzuug9GtmCgH5YPI
         HgFjTOPqdfnBff5fW+Dda+Y4rxOHe6qDV1oGdz7P2a00LYkb2K+rN7/8Gtl9onxn16xd
         RmVpdCv7ojwe0q2IIJowF/2lilt2Zzxg394ydbi1uF9Bwlc9t+jP2VaB67n6lBmGAej2
         XUXg==
X-Forwarded-Encrypted: i=1; AJvYcCXQXzh87R5yngfHn63Qp4P8gjzmJUt5MmX8qNo/pcf5f9HSsrbj1yx4/pPLJkGzwsLZCnINkxG1/x4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj3HnzdTUxbM8hV3RXE/ZR2JxXMu5Wd6rMq+gjFJZGiBHgD0Ez
	HOAzc7HY2pnjjRXs+i85cY+94hVluRukxEHAMiqoBAmpxYiq50UzHik1hbKOKs88a2FMM2mVqV6
	r4ukMr7fcgIcK8Zozeuj+oAVsMDhrdJWXpANMtndOClKxaNm9m4cVBYlKwBE=
X-Gm-Gg: ASbGncv8n0o0eDlPAKVAmim+1L6vfdQ4TiCOe33CkGQRKN+7u+YCLQ+Fqtd3VbkSJDL
	8v9VPX/qRNxY5KdzvfeLvlCliO7Dcdl0qPNhhuPfsNzcZqT16xzSFELKFDggrvfndHQvzUkwTc+
	3CLarodv13zTsFSpvoSBgg9oacCVJHeFcVLrTb5WAzNXBlU5/4ve5EbObugAmZnb0S5h8TU4YPW
	Q51TpRX6pYBmtEFpkO5uy19LmCoRiMCS8+9abpttwUfEX1ko3heuRLtTFN3mZeXMxMfCuTmjqn8
	vgARMw1pWWqkq7PH2Hu4dOP445w9Az0C++yKJ5HI6zd3VBILN6N+Alqh1Q3Si24Snzkg/UXUPmY
	ROtUwJqmm8RESemI=
X-Received: by 2002:a05:6808:181e:b0:3f4:21af:6d41 with SMTP id 5614622812f47-3f540eb869emr6260223b6e.5.1740615108592;
        Wed, 26 Feb 2025 16:11:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYeujuv9HGY3xF86xZeLEyuamPIoi2+t9FGjgAHmcb8mwvWLMDC351/1jXItvtKtUMmC/nzA==
X-Received: by 2002:a05:6808:181e:b0:3f4:21af:6d41 with SMTP id 5614622812f47-3f540eb869emr6260215b6e.5.1740615108334;
        Wed, 26 Feb 2025 16:11:48 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f5507c40c6sm33988b6e.45.2025.02.26.16.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 16:11:47 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 16:17:50 -0800
Subject: [PATCH v4 3/7] usb: dwc3: core: Don't touch resets and clocks
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-dwc3-refactor-v4-3-4415e7111e49@oss.qualcomm.com>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
In-Reply-To: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2145;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=OYiQ0Ca9ME8RsPSmprTC2XbZ0QI0xz6X7pxB3R5yxGk=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnv684JIqAG+aDaAtycXjkjs8bkeGgpw3vx1dp7
 GzgJbk0peiJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ7+vOBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWxPw/7BMkIW4vn+n0J7TfHzu4gw5wac/OEbJWiiacLun4
 aaHMCQjWc9W5FQ4/dcGEnlUkG/9JGzmeFhFBrFIfhkTAb/WqvYp2NzIqGPicMdumR6sDl3nN+BZ
 PGA+2VS66R1fxD38h+wLKicCV5e7RNRuogbLEbDe46d+bgCWaL/XZsRaKSJMyw54A8GTs+DHnhm
 /ocOr8sEMIVSjVXQIiDQXgStvZchoPQ55BJsJu/jj0longO+P8taArxEcjAyuqVbS2OZS51YI2A
 ac2/mh3xIQT5aMEXxrOE3M286f0hr3hJhdAgSmWMSneZDCI1zMu8g7c8JpJShqZ4cZID+/20hSA
 EgSdrzA+Jzy2ePLx4bCK/elJXkr3mSA1Tvpnp4eS0JDRcTdp3LjtPG2nNaDjMUgQ1vmBpKKoib4
 agOj5pwT+2Ykvv//ii1t083Gyjr5t4yfXL2fxeJYwVqlt5+g81YzS3YZNyR7TzyNJKNouUL/+gb
 WV6SDnXDAaxmADEDUxV5MP26phTQPehxbC4kp8S9zcsIB1Xdayqqoov84Nk2c0ArjtS3XlLCqjy
 dK4b8JEPyohXiosCwrPMe/ttHCBu6/qAuiFEV9HHJZ4hu2amFKkO3In5Y5lx0pH9TJme2w7v0Lq
 Z7P09tpwJ5+bjZtEzj2G27/GqKqNlC3p8JSbN/EcKasE=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: Y1pM5-czqRteFUwS3Nv8E3tv7MRDae6S
X-Proofpoint-ORIG-GUID: Y1pM5-czqRteFUwS3Nv8E3tv7MRDae6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_07,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=991 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270000

When the core is integrated with glue, it's reasonable to assume that
the glue driver will have to touch the IP before/after the core takes
the hardware out and into reset. As such the glue must own these
resources and be allowed to turn them on/off outside the core's
handling.

Allow the platform or glue layer to indicate if the core logic for
clocks and resets should be skipped to deal with this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 19 +++++++++++--------
 drivers/usb/dwc3/glue.h |  1 +
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index d9f0a6782d36..aecdde8dc999 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2187,15 +2187,17 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 	if (IS_ERR(dwc->usb_psy))
 		return dev_err_probe(dev, PTR_ERR(dwc->usb_psy), "couldn't get usb power supply\n");
 
-	dwc->reset = devm_reset_control_array_get_optional_shared(dev);
-	if (IS_ERR(dwc->reset)) {
-		ret = PTR_ERR(dwc->reset);
-		goto err_put_psy;
-	}
+	if (!data->ignore_clocks_and_resets) {
+		dwc->reset = devm_reset_control_array_get_optional_shared(dev);
+		if (IS_ERR(dwc->reset)) {
+			ret = PTR_ERR(dwc->reset);
+			goto err_put_psy;
+		}
 
-	ret = dwc3_get_clocks(dwc);
-	if (ret)
-		goto err_put_psy;
+		ret = dwc3_get_clocks(dwc);
+		if (ret)
+			goto err_put_psy;
+	}
 
 	ret = reset_control_deassert(dwc->reset);
 	if (ret)
@@ -2328,6 +2330,7 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	probe_data.dwc = dwc;
 	probe_data.res = res;
+	probe_data.ignore_clocks_and_resets = false;
 
 	return dwc3_core_probe(&probe_data);
 }
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index e73cfc466012..1ddb451bdbd0 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -17,6 +17,7 @@
 struct dwc3_probe_data {
 	struct dwc3 *dwc;
 	struct resource *res;
+	bool ignore_clocks_and_resets;
 };
 
 int dwc3_core_probe(const struct dwc3_probe_data *data);

-- 
2.45.2


