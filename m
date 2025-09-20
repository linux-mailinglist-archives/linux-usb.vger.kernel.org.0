Return-Path: <linux-usb+bounces-28358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2277AB8BE40
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 05:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C191B1BC7DC1
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 03:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D69244679;
	Sat, 20 Sep 2025 03:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ISlggu6M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E422224B1E
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758338490; cv=none; b=qE/ruJrNoHGfV+PPteKwa4BQ7KtLwWNBo1Dx9d4SLyAuEqWFb7pnYCF/yA3Oxf7Kf//kYzJXkXU0YW+4djhh+YI2qdFcMnudE8fpD24ZdR4pxv6JUrcFpYow7FqvLMVJPZSdTgruRtrbcoaPo6WY2PzDPkJXyG0Gf/ReRyfvtck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758338490; c=relaxed/simple;
	bh=Ftt/PftF28xTllTsZoRGsGveRUaR2bB0qq13ptSWTkc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KPrUzUiHN9LoMT0cyxOCslzPepUKdnLQuYeZCflMOfCkmCrV05LOz3wc7x9oaawXBDX+CHrNeVH0gLtJGpdMzefISlXjMzREAkbVmoavWJV5wXqOAVdRMQ1ET5i9NphbJz4wGOGmQN1elWBXbDZK7iVjQ6dTPNQEhWJ8wCB6JpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ISlggu6M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3AjwG009398
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kuxKL1PStAu
	Jvwvz2BevRvoak3D7tba15DUzjzxEF+c=; b=ISlggu6MdmJwRtUsXG3GMk/se0O
	tAYwmI438qLshGkuxDTl+CcYaiYGvRjbybK7wZdkWxNhJ/VfzFyME9XYEN/wdxYY
	YNmcD1OpM6ETsSZwXSO3ui7AEcXsIEHTFBBw5XXWK52moZfV2aPp6FGPu7RO0TkW
	ad4t5bxL78cmTlDTyHvQq6HRVk2rBRqHubnNG2XW0iBp3L+60/chun5trfCQ91uV
	FjhqvPdQUlTydnpvDQA/Cj2etFmmMBYKavfWUMkKQlY7hxcV8Vdu7Dq6GIPwYvgG
	odo22MiEfCnsrJbTbi1MejVfM/Dq2RBxjuIOEyUG5mkBGJaoQeOKdwWJi1Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499bmy17q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7725c995dd0so2642478b3a.3
        for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 20:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758338486; x=1758943286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuxKL1PStAuJvwvz2BevRvoak3D7tba15DUzjzxEF+c=;
        b=eQ3A2pJnPgzzJovL2KcyYrzQhoJ1RsaUPWxRvL9qXSuvFwy+XQZv1JbGFXwzCzFqrg
         G8Ewy2c63maAAl3ZcR1ORJ+s3UpM/SAIkrQavtaiZ9VRliUMo2zE7uwPvI0X6KW5B/si
         90IONL9yGwqL0M6iwdVX+7sclbUyLm9mDoqyqvney4Ob4dQCavOT4fKbsNFH9u7daZbN
         q27iOpGFVZ6cnd0RZuupjA3o8Bkif/+nbu/C6XqPZHm7vk8Kg7y0R0rlQxmRNCgmaOXT
         vek5+KLyQktKTzh/I80USlfMI7FT0Ec8OiTHPqX/rC4t4Qd7DEetrx34yoqIdJq7V46X
         jELw==
X-Forwarded-Encrypted: i=1; AJvYcCUdVDlVKq0amYE2k88DT0qLvGaWGCRdkxEAf5GHqghCn3vJzgQHtbWRqnHfh8aS9Y8zdwCf0XDas74=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmNuafOFqxoA7OL5Er8j9vv+JpSQSr0u1UDN4vVlJz2gNLhp8i
	9puLccnWNXX2yHDitQz2Czr41QFszVtzUISFYQoeOpvITW0QKP5Tq+TW2cS/pyBZ4u6AjgjUIcf
	3vMoiC8rEpDRbhY/OpPrB8XCd41c23y2nzysmZc+wJukA68pRWWck53XEA4nb7S4=
X-Gm-Gg: ASbGncv2YEkMDdnxq7rIOSwSXXiFZmb/8yUMjEpjy6fahlhGVlmbF3Dru/+G76UmWM8
	lKcTGHOOuH/odKnZ+T4b8WtuaXhRx+bHyF8TjAKhII5db0Bv6hWxYv24l1PeAFh7ZPQlSjji6fC
	H+JW79ucwhuXza3ANjmWIcoganJuq5w8vxwBD6s+wzR9NeoiGUsGxmInJhIF9nrXzH7Z+Wm3/4a
	/i8CFrztvxkbSZ1ARp7ycAUnLZ9vFP3YoUGK77WoQdap0alxE5Ta2bY7ID7hdhI/T6Whm4BDSiv
	/VIhNxnEMMC7zt+Qysk4FCNE938Q1j/kQvX3/Uc5em895lW6TPA1cnSUM/qmUvVfIF8lQDhlPYX
	v12mjoWKOiXyLu3TE
X-Received: by 2002:a05:6a20:19a3:b0:24c:c33e:8df0 with SMTP id adf61e73a8af0-292727771abmr6193882637.45.1758338485854;
        Fri, 19 Sep 2025 20:21:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmf7ZyY4Qi299dDqNQLCxEkdP0noay2XXf8NGY+wawk7nSpEhPzEhHKehKKQ4CvBpbINH57w==
X-Received: by 2002:a05:6a20:19a3:b0:24c:c33e:8df0 with SMTP id adf61e73a8af0-292727771abmr6193859637.45.1758338485422;
        Fri, 19 Sep 2025 20:21:25 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff448058sm6178807a12.54.2025.09.19.20.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 20:21:24 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH 8/9] phy: qualcomm: m31-eusb2: Make clkref an optional resource
Date: Fri, 19 Sep 2025 20:21:07 -0700
Message-Id: <20250920032108.242643-9-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xvT0iQnSNu95hrL349xkZ0MjWpbYWRxG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDE2NCBTYWx0ZWRfX5shXvwUBBvme
 82j4f05qR5T7uHyGYArRk5fbEkqNH4jzljkOqVLBmQ2LTAIJ9qG8zZEXiOjxp3t6YvUEOUoOtAO
 yCLny4Z9bA7+JOQ/+AHVZuS7pLGoiR44TN2iRmg89nFjnbphzB1xvBB1jPd9AWwctrqWzLM+zfU
 9zS+yUS1L54GqYc5IizHZn0zcF5soPXE4B76HbcaSlafeyp1LepXuaiE8vxpGzo4oub4/hEeg/a
 txkBObqI3jKY2DtZUSNnZigHl5jVMGzgN8UTuTApH71cNRHCoZ82oM5LsfeT+92vCpDYgcUZO8O
 T3csimmxhgLRiCaL/TmfW1NZ+P1yFQOV+lo/jNTIHTpwNsxNXqpTZeD3cwfEjSiSFcevHbDImHm
 o43kz0Fe
X-Proofpoint-ORIG-GUID: xvT0iQnSNu95hrL349xkZ0MjWpbYWRxG
X-Authority-Analysis: v=2.4 cv=ftncZE4f c=1 sm=1 tr=0 ts=68ce1db7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8inbgvmG2iPteTk8MkMA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509190164

Some USB subsystems that utlize the M31 eUSB2 PHY doesn't require a clkref.
One example is the Glymur platform, which contains 4 USB controllers that
all utilize the M31 eUSB2 PHY.  However, PHYs associated to the primary
and secondary controllers do not require a clkref resource.  Due to this,
mark this as an optional clock.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index fbf5e999ca7a..f4355d38aad9 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -267,7 +267,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->reset))
 		return PTR_ERR(phy->reset);
 
-	phy->clk = devm_clk_get(dev, NULL);
+	phy->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(phy->clk))
 		return dev_err_probe(dev, PTR_ERR(phy->clk),
 				     "failed to get clk\n");

