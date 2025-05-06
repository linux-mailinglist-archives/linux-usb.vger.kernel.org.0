Return-Path: <linux-usb+bounces-23762-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E3EAAC1BA
	for <lists+linux-usb@lfdr.de>; Tue,  6 May 2025 12:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04BC37AB671
	for <lists+linux-usb@lfdr.de>; Tue,  6 May 2025 10:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B492278E5A;
	Tue,  6 May 2025 10:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ays7/Tvw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5022220C028
	for <linux-usb@vger.kernel.org>; Tue,  6 May 2025 10:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528562; cv=none; b=O+RJ26ed6OvttUDV7DFYroOQ8QoqN8WxueuLH35uO5EgfqruJf2eqISdEw1JYEeGm9IhwU934NP4Gz9Z8VgdhunOsah7b52AF+KjjsIX9o2Mc0uCr1YxFh/XitGhlJAaVrBE3lYV6F/kTPue0Upq8Mm7TNYck5JU0DYhB3q+83A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528562; c=relaxed/simple;
	bh=MXqYVLlIC857YO1MJUKMFQ6APvJH33Iga5WRljoMUTE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BZXGfnuuemCATT7EdaQuAqw0gh48mSVg0TZzIREhrjKY68WTBmSrP6LxeMjVwiLbDvSVcKVGL34j8EhEODganLpGWEJVvgpztPwuGsQWTrkT68sJHF64UFEPRylqiUZh6uRmE7meLvPgtOXLL+P1BHBiJHq9QQSL9p+1S3d71k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ays7/Tvw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468np0v007245
	for <linux-usb@vger.kernel.org>; Tue, 6 May 2025 10:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1BT+9avoZ07YU8MroIjY3rzBacA3W/8MWgZ
	5I9HIHaY=; b=ays7/Tvwvf6CbqmSf1OpMWWqZqQ538BlTyYzmjpK9RU1QL6OTQ6
	+6K0xTk6T76lMedVlGvSGWueK8rBt5Afl2pSocczinlIF2rvMSZi4ocgYFX/aNye
	4reyaTNWfV7yaywQ4Y1ZJIzFjsm3rnIV49qboGpachsoHK+J/WbzReECa5WW8paj
	FE9uhimq2bgZrCDfDzMhExg904cnMfhlfzQaOCnM+TGNH1lNwOdZitf5s2s/rnqg
	eSedKGHQSH/SRwp/FE+++Mjue0gNmrE2m8yejof7jt/xMs/j412gr2UNBIhE/wtD
	CAaTGYJh7iybNJ7TiGpyp65ckfLGri2utmA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg1wmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 06 May 2025 10:49:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22c31b55ac6so76222015ad.0
        for <linux-usb@vger.kernel.org>; Tue, 06 May 2025 03:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746528558; x=1747133358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BT+9avoZ07YU8MroIjY3rzBacA3W/8MWgZ5I9HIHaY=;
        b=Pj7eLdF3Hof88G2fXlK1NMWQqoj5Cvipxj9A837KR6ysjfTvYmJzqvYqNUV8hMl5z6
         13+1Qj0pYxVXvwxAyEQ1sAsZmo6+qcBzHAcUfQ4BOn/K4HnaFW8qjN1VNSoOpMwbp0S6
         XtUeokX1Aby9ARctpIJzpcGEhnQr0Zrfce0+Opz2p9XXJXjJrMtmPk0b6KyxR+9ux+ys
         Mp30kmoqNrCZuxpre/uSTyFMh8/wNK/3qiKvDnjpKcHIOIxHI0L8j4kM23BwmlkjlR+n
         DER1fQLYoc2BwcBMzE5Wf/7mRKcSP2IP+ojneRocmJOVCzSjljRowUnxU48SfFUbqp1O
         t/oA==
X-Gm-Message-State: AOJu0YwMw9XbVGNriHK6LtyiBP3DbG6iG3K0kdzx4hUd0/UlNUsEp4d8
	bWwmKIdELvaNEixrOfUCySay7gqjzvK8Y+l2DvBz+4toqISWGzjn2mRzkXY9guaX3hhBlEwsP2l
	d1n24DzLuWHEEHlcgTUxI8+PpHgSvBWbTKapJV1vRhZlKp1+w4ynjX43UllI=
X-Gm-Gg: ASbGnctdqex8vdSYo5kaHELLFYyBAcYTbIS1G5Gf+rpkRcBlAD7w/B1ukhP0gh5DdY7
	C2OjnxYvYZOre14t/NU5773y+yG4aG9ElOlZnbgbIiAtYYIw++uEcu+M8YYbzO417PGX6Xvm5Rg
	j8jp7XSE+Jep49gRU7IvN/EMHC65Bq0DMLFslyMbaK2x67OdK3pIqYuJopErmfSWMSdHNhFke2E
	dW6odufBkISkqgu7U5X0LzUvfzEUBb/khA71qgZqCXquNjHkC4con/ISzjXpiqDFCoY4F/504Hu
	Rh3Mwcvl1yeNLUvWUOwUM+Rd0bmmKwgIHT78GfEz
X-Received: by 2002:a17:903:22d0:b0:22e:3279:990a with SMTP id d9443c01a7336-22e35fdfebbmr31963315ad.17.1746528558588;
        Tue, 06 May 2025 03:49:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKK6d45h63Gdu4TDOKJt0NRyzixLAgMez8xflvSEFkVTtmtil0jJ03NTWeRlH3BhT/YnRWWA==
X-Received: by 2002:a17:903:22d0:b0:22e:3279:990a with SMTP id d9443c01a7336-22e35fdfebbmr31963135ad.17.1746528558221;
        Tue, 06 May 2025 03:49:18 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e3b99dce9sm10786985ad.6.2025.05.06.03.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:49:17 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] usb: gadget: u_serial: Avoid double unlock of serial_port_lock
Date: Tue,  6 May 2025 16:19:12 +0530
Message-Id: <20250506104912.3750934-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3zooBw75Ukzszl8ku8bNoe_A47bJdwfL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEwMyBTYWx0ZWRfXw7/3UrWzUC5g
 Mz4AE85H9bqkSveR1NZ7zmuKsL8jNB38plAEVWRJ+YWxYYnNeL/2+Vy4UvZqhy5cAyQtkooLKpZ
 dt1OGq02dVk9ey/3SL0jfYacN9TQ0yXUm//8kYWgJuG3N/q6L8JbaMCQOo//buYIOmAJ6jKsB9I
 Tnb8kbG00aYplEU+9PizbPvr4YALg/8i+pXn0ET7f4ei5bY6J81jA1/e5glqJoYj60rBvyhhuTg
 AjLTr8OAG+UvjtWZJ7hqcalo4gimz1186opy1Z3mfFQG5D7X4cx8p2Wvn1EnY7EkvNpHDGoY1L+
 3ILblbrlaAbLsqT8rNQb/ON5eu9UySCuvlBseoO8V/QpGWKjWxVkI0MjAGrXVY0kK31JgQxLGv9
 7y75eoy0FpSl/0PLFa7BfXoYHI0Q/s8H/CgPPGTRbwyu3CJhxN9S9gDdh7LGUeavTXht/2Og
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=6819e92f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gJab5K-lH3zide7aClcA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3zooBw75Ukzszl8ku8bNoe_A47bJdwfL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=819 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060103

Avoid unlocking serial_port_lock twice in gserial_suspend(), this can
occur if gserial_wakeup_host() fails. And since wakeup is performed
outside spinlock, check if the port is valid before proceeding again.

Fixes: 3baea29dc0a7 ("usb: gadget: u_serial: Implement remote wakeup capability")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aBHatifO5bjR1yPt@stanley.mountain/
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/gadget/function/u_serial.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 41dee7c8cc7c..ab544f6824be 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1505,6 +1505,13 @@ void gserial_suspend(struct gserial *gser)
 		spin_unlock_irqrestore(&serial_port_lock, flags);
 		if (!gserial_wakeup_host(gser))
 			return;
+
+		/* Check if port is valid after acquiring lock back */
+		spin_lock_irqsave(&serial_port_lock, flags);
+		if (!port) {
+			spin_unlock_irqrestore(&serial_port_lock, flags);
+			return;
+		}
 	}
 
 	spin_lock(&port->port_lock);
-- 
2.25.1


