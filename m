Return-Path: <linux-usb+bounces-27331-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B213B38AB3
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 22:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51A1B1C2154F
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 20:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308282EFD81;
	Wed, 27 Aug 2025 20:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqQLc/Df"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C35E2609FC
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 20:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756325567; cv=none; b=QRhfJ6aw1mBspTXEBZr6OwA1BfaC9mz8rBF/13t+ClOBgbb/wPjM9zTgiPL8wKMQ52Q/tYU8rix4vYaom4FNzn2oA0XGgSPFlXo0VQP4qjL7E9B3KIV/7GeCFb+v6bEkArrdpA0mxnEqfUtlhDGYCL7uhBkHrysvKbQBc0RK9uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756325567; c=relaxed/simple;
	bh=6GmnI1fMybhqicxB/7VgMGg5+hQSNmBIZIYiqagcYic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pLIwgMvodIk8MLXbAflW0/bk4746PTEFtgk+chUcP0WyksD38KSstl/Si/pcSkFsQhCAFbcEJ6GEqNVjJqdEXuVlK9i9FL9gJf3o7heO2kwCVhc89cZwTJ/cTeAyLmsAeHZKL8Kc/24dJno55LPRG1ctW5doEz51KsCS0bPeYwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqQLc/Df; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGvClf015824
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 20:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2W400xC5n7cfA8Y337CijqTRODH/oa50Xrk
	MZjZCGpc=; b=CqQLc/DfeYNyn8kWupGgcwzYPZHK6NYpzBv8YI8B9x0myS1vh33
	T1orqJlnrUFwGi8zKQWx5x5uykwqe4VwWeiXq/0YY3p2wV0atpjTEc4cRacV0KRm
	plPP29KPAilGmqtUmY1OkveSo3FWjp+aXFOhOzlWfDuQwgQ5z7mwrahy/XcarNC2
	Aavka3jTOIv5giMMBvzqxELiUkeH92XMZycRGjdncCDapH/rjNYGS53nP/jG5sVJ
	7gpF/Z9a9GHbtWJWb5aYuZBxshwvs/Ny6tRnrVz4uI6hWr5M9Ed0m1LJbp7kBwEy
	g9iMLMHG4lJLOEB7Bod++OHf7k9zHkpFQIA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf05ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 20:12:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-771e319a879so1332670b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 13:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756325564; x=1756930364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2W400xC5n7cfA8Y337CijqTRODH/oa50XrkMZjZCGpc=;
        b=FMNeppIQirjRbt2m3Nc3A1y5nzZFf81t9Bin+0oGeAPvm8egEJFHDyR1hNGuMeqCIz
         DNp7K2qkfO2WE7+mATy7NADEeDWCanHGoHg80YbktbS1cxMCYwTThH2Y6p9m49eRt3NI
         TdZazYvl/sMIfxYN8LtRtokmzIPGf+QUNxUnW43UZ+H5oLyKA2fJYJp07pq/mhYAFaRu
         IlEYWyZ2Sp42ap9vvf9mBmyXFhzTdPZwFr9BwoCrSy42i3vWkLPM9c0JjVZogrqFZYMu
         HxEpci7WCSTc8Lr4yRZvlBxV0ZhM8Jwt9OUmkSo6noSNCkO3O+jK296MJoOSJ+lLBQnJ
         tGCA==
X-Forwarded-Encrypted: i=1; AJvYcCWvqOZ/asmGcXxQcKb/zCd6+gZwJmeBIN3PjI6SaIL5yF5l/pKYDs/dg0xD/FjsSbLxhS/RW2hbnPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlqTPDqViohiWT0fS20LOtfMC1gGjgow0ZEvojD6uza8VNsHKu
	lUU2V5b+ycVotTmwh44mpfeDnXyKraRW4facQ/StgtzZKdjbZiBH8E6aZSXO43rOhNyS5ds0y4h
	9K2UhO2DavUU5+Y8tGHs9ipoiUnM6XbyHAUf7Q4J2O1DRVSkJZWlTDr9srA78NDA=
X-Gm-Gg: ASbGncu60mq3AajWZMJfhhV5S0EImuQN4cN19RfG1KwhA0sClypiCU5hffHgWtZ3jmF
	91WIBmf5pB2QY/MVs+kj43F8JsVilbGpyzsxpEjH6KfFcqGS9Ss46PA8yxOQ2D3Yw0wCf0c4vy1
	9iJpWWHFDMn7QzmfT01Tv4e/5PwfPE8IuSEBCmm1AGjP5HYapKwa/LNrKnHCHjIbanrsN5SrtYc
	O0zZsv/Y6GvfN+oX56b+YtQbEuVTv54gACYwE45pGySwF0usLcS+xUIo3yG+SA6yId8yNg68gId
	7hD/NspT2Pw75nLhG6EG3212jAFLNiowpkA6YsaSMSGq0wJg+g8Bh0q+d1fN5jYZOaDWKznNeG7
	BRHWkB1XvT1JrHbiAX5ykd8xJ6ps=
X-Received: by 2002:a05:6a20:7f94:b0:240:cd0:b18f with SMTP id adf61e73a8af0-2438fad0df0mr9761661637.4.1756325563721;
        Wed, 27 Aug 2025 13:12:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0QEu0/kGlCWahFx7HAWckxBz/67xuMREB/xco3f0jql4OL36gLFpqeZcE5+d7YxYJzc4K7A==
X-Received: by 2002:a05:6a20:7f94:b0:240:cd0:b18f with SMTP id adf61e73a8af0-2438fad0df0mr9761614637.4.1756325563305;
        Wed, 27 Aug 2025 13:12:43 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbbbaffdsm12185234a12.51.2025.08.27.13.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 13:12:42 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/2] usb: typec: ucsi_glink: Add support UCSI v2
Date: Wed, 27 Aug 2025 13:12:39 -0700
Message-Id: <20250827201241.3111857-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: glaK9j40x5Lh08MzrcDm-Elri-4P_DcI
X-Proofpoint-ORIG-GUID: glaK9j40x5Lh08MzrcDm-Elri-4P_DcI
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68af66bd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AXDibm61ZLAIF834zmQA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX1u1w/56gKVIt
 U/BrIYwZWtlB1r8YiznCTijGmqQ7gm56lzBT3WsKA+6m5fS0q8nRGfVsS3hWGldDfbTQ5qb1vHT
 hSbCUIDZTFObGLlsHpgJhLrns7ieJiUj7Gy0KbvfIll7MRoGsZ704X/Q13NA7IlzJlrs+sW1VZQ
 XQOQCldyQAexsR7QUji2J9WeLBT+jj8o2p72E+S2YAcUo7Wb4aejBk/KJUAKBPSvYWrT+kirLk6
 kvbjvV72Dy8/6QdbIC+s274QRNFajGRk4ds34M+2PUg9SqixYy/N6YAkCmEv1CBzD3biLXxKkbW
 8raOsFjoTnhbjh4LjmSmRlrqbNxK0PFuL3MNzQeXSUye4ZcQxfFVV+gQSnMMzSiQzgVpoU14Wq+
 +WM3fDli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
16 bytes to 256 bytes each for the message exchange between OPM and PPM
This makes the total buffer size increase from 48 bytes to 528 bytes.
Update the buffer size to support this increase.

While at it also update the UCSI read/request buffers to be packed.

Changes since v2:
 - Added "usb: typec: ucsi_glink: Update request/response buffers
   to be packed" patch
 - Added length checks
 - Updated version checks to use UCSI_VERSION_2_0 instead of UCSI_VERSION_2_1
 - link: https://lore.kernel.org/all/20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com/
Changes since v1:
 - Defined buf size in terms of other UCSI defines
 - Removed UCSI_BUF_SIZE and used the explicit v1 or v2 buffer size macros
 - Removed Qualcomm copyright
 - link: https://lore.kernel.org/all/20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com/

Anjelique Melendez (2):
  usb: typec: ucsi_glink: Update request/response buffers to be packed
  usb: typec: ucsi_glink: Increase buffer size to support UCSI v2

 drivers/usb/typec/ucsi/ucsi_glink.c | 93 ++++++++++++++++++++++++-----
 1 file changed, 79 insertions(+), 14 deletions(-)

-- 
2.34.1


