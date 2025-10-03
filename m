Return-Path: <linux-usb+bounces-28879-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A21BB5AA7
	for <lists+linux-usb@lfdr.de>; Fri, 03 Oct 2025 02:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EFD6F4E8C1E
	for <lists+linux-usb@lfdr.de>; Fri,  3 Oct 2025 00:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F0478C9C;
	Fri,  3 Oct 2025 00:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OnzqVd8O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BC51EA6F
	for <linux-usb@vger.kernel.org>; Fri,  3 Oct 2025 00:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759450854; cv=none; b=Q8T+J48J+SXdelx8OjUpS6qNO9sxFnMR9BeFS5TjiAMqKTo8RqNEl+0+XpZLlnf7QOYWdBYowSg2CGI7H8ssU61y9hfeFr3dx6t7qRkuKVzJqknsqIKShDrfD2gXWr1+uBjDNPZ3/tr86QGh2j1sD8v847eD9GdhX+DM9zed+9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759450854; c=relaxed/simple;
	bh=E9h7ocI2yzY8vYKQXj21r6gL0XQdWo0Z9RU9W3pJXew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IwI7RAKslcSWhQsfN2Lh9i1OYm8Sxsiw5O6bUOf9ReqLQVOH+ZYn2QZvckYH3KS/NUKYiOj5ugT+1eP4lYnSOIznF4BUSrv6RYPFY9ByFHT9Q8KaJ7b6wGNQL2O5bzQf4FbXrHKrJlNDICsgRxnQGkRZf+4OThj0yFBNoCLb5m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OnzqVd8O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592LvVJf005645
	for <linux-usb@vger.kernel.org>; Fri, 3 Oct 2025 00:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=c4iZcSe2xkw+a+pWRSy8F3E4RIZyAiFUK38
	FdntSBBk=; b=OnzqVd8OcOmZ/iaSUlG0nzoF8fEv4jfb9Zt3jH8kFeMpB5oZA5y
	MduIJQFHyXJ//Dt5WxVPZZxDw5LjoSkvcnLSc5VrTl86N2E8LTb3QySp5N5KtoJg
	U4IxwsFfhVzuMbGYj2lVO6jgDiA3hE0IgygEeY3Dio68oH+Ia7EB/n0p/P1LA9CU
	HRE+EpvohYI1itI4/GQwAJNZAQ8jbsvCRCBUwAAxhmvBusZP5LhNEHaxqO40CNAy
	wYiDS5IpVqHoB6CTZvIFiZAoMjTP6WwVfMcSkZejVvok2/Wm3aoi/uz5n6LiMLnr
	12a6B2CXJe+vzbvF8aR9ejAYz0UsktOGAQg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pds359-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 03 Oct 2025 00:20:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-780f9cc532bso1616727b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Oct 2025 17:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759450847; x=1760055647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4iZcSe2xkw+a+pWRSy8F3E4RIZyAiFUK38FdntSBBk=;
        b=bPf31bTigUZJjSpcJOUpe/R3bej6vmdiIJ85YeHUE4v9OI+HR4zBRROezE0YglOVnQ
         RSFvC2BGmkaJMWuN7oR2lZoNbgXYM1N6yhMx1Vr3TAh1ZGml0W46M8HqAN9LEuRUo6Fj
         fW+GaT3PZljpQSCe4Zi5C43uOl/TLnhT5sUr/rLTHb3TKK7k2zfvJz2dsaOypcqbG0Pr
         EH6Ejw0peMFakzmkEQmdyHbljJnJnDMjwqnFVWHw3ugywu2EWZxMjG95EgLfc7WWxWvw
         19EInmwlVHSpibeiq6xStrBvDyprg0Rq2BOT0UmlIFguSGfK2VgqylOomb/F8EUNIKjX
         GWog==
X-Forwarded-Encrypted: i=1; AJvYcCWSQrS3vr2HMNAYNfF9iK2yY/k27Uzsvjo939SAvoLwaiYOrXxYM0WxaEbIpV9zb8n1X929vpEOkZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlDHf2tZ7z0JN2naKfV14anxzc0jPpoG1IwpTqc3DjvBU8qI6Q
	iERztMTRipUAORCkpW9BwY1cduUQ/jdqX3+/r8gKqXmClo7AXD1QL5aEnCaez64gfy0Ba9bsiw0
	FAI2ScFXDYj8JbDI7PNDySHyEqfcWKDXqo5ccM5KvMa7Ga/AXyo+NZiqK99EACcE=
X-Gm-Gg: ASbGncu8jUof91xFDsiu58Qha9FWPaSe8f0JlbsHMwSkwJBWHaH3b2nZPJGuM/pmyq1
	QuhNJgJp8YMFJkOQ+Olgf63iPkgOrcNyGCRd6/zQv4fISY/11rrDqDhiSJ/ZCQ77H9sLgjht4en
	ro+vFsKr4r8HCRJafETP6TzPGg7Rx4uqua5Qh+6xHd3b98Kvhvdmx2ro77sRR2lKKn5M+W5drH0
	9vCdzCq+321zCk49m4zWY0SZusv7b7vjDGw/BVERTJgPr8zOFuR8cZXwYks08VXwACQUnr/fpT2
	vuKMUVTAta61VuoZv0BoM7nu6NXzks4SMsKC8ZXAx2xgcMSTCOEWpcFpLpvHznA3GTSVMJWpPUM
	ir4bhqdfQDWasfzqAgiF5XecLyWDnLHlj
X-Received: by 2002:a05:6a20:958f:b0:2ce:67b2:3c41 with SMTP id adf61e73a8af0-32b61b2dafamr1618163637.5.1759450846701;
        Thu, 02 Oct 2025 17:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnykMpl6KwBYvLoLXZgMJwIyv5faVFh4HNnhKStdMWFztJtzgZPYdSeuEvbf8LSHJd6OSyoQ==
X-Received: by 2002:a05:6a20:958f:b0:2ce:67b2:3c41 with SMTP id adf61e73a8af0-32b61b2dafamr1618136637.5.1759450846200;
        Thu, 02 Oct 2025 17:20:46 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9a3f1sm3128632b3a.12.2025.10.02.17.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 17:20:45 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 0/2] usb: typec: ucsi_glink: Add support UCSI v2
Date: Thu,  2 Oct 2025 17:20:42 -0700
Message-Id: <20251003002044.2944497-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EYKaBesoWTjGQXPYt719TZfX8Fw_EJ9M
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68df16df cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=AXDibm61ZLAIF834zmQA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: EYKaBesoWTjGQXPYt719TZfX8Fw_EJ9M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXyAAyMz2ynzsW
 OVJIC6dbmJrxZN1hMFz/OhbXNVLiS8DuVdFSrUNZM/D1r1OT1qQe+T71joztf58snBcVzZaOmze
 zpcPJVr8aKv2aaO/ji6bh6ovsJkA99uccjKFcK4QPnwATgyRm8k7dDEwM8rN081U3fFnqx9vl5F
 FphYaQq6wI9ofTwUoH203J/GqJzmqMwvKegZ2tPu2lMXjtMXFPZWMr+Y5mFXTqtwF9RhJmLaadW
 mhMVYzJsIY2u/VYUC440FTSRNtE9IPOX32+zg5d2inq70wtY3923pEXA+ssPo+NUxRkQ7NJondd
 xiexcUoh3Rv3QHcgMHZhuK4OX4xnj7SPVu+qjssjY970H2qNf0qxktPlWcDFPu6e36qP0G9s2ua
 DE604guAR3CAmefIuH55LANP+FkgsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
16 bytes to 256 bytes each for the message exchange between OPM and PPM
This makes the total buffer size increase from 48 bytes to 528 bytes.
Update the buffer size to support this increase.

While at it also update the UCSI read/request buffers to be packed.

Changes since v4:
 - Updated the read/write structs to use a union for the different buffer sizes
   which depend on UCSI version in patch 2/2 
 - Added a clarifying comment to a size check in patch 2/2
 - link: https://lore.kernel.org/all/20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com/
Changes since v3:
 - Added "Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>" for patch 1/2
 - Fixed if-else if conditional in pmic_glink_ucsi_read_ack() in patch 2/2
 - link: https://lore.kernel.org/all/20250827201241.3111857-1-anjelique.melendez@oss.qualcomm.com/
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

 drivers/usb/typec/ucsi/ucsi_glink.c | 84 ++++++++++++++++++++++++-----
 1 file changed, 70 insertions(+), 14 deletions(-)

-- 
2.34.1


