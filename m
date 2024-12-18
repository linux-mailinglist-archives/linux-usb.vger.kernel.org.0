Return-Path: <linux-usb+bounces-18603-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 465FF9F5C0F
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 02:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9126A1684CB
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 01:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2209935940;
	Wed, 18 Dec 2024 01:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DOfJAVBb";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UyuIQntv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD480DDBB;
	Wed, 18 Dec 2024 01:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734484093; cv=none; b=UR9k+7IBQ/K5h5Ixv+4Tp8IcgsZbpwBRek/NZKDCnviZyabSk/wdmjjUKp8doNtT56I/duEv5T2U94rff2G+GHHG1+LAZ3uwMSA5EB6yLmgiClM9PI5/3i+UZ8eKKO1WKKV08KLIXFFToqRpoRO2t/GEXZpMougslKsR6BV1o0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734484093; c=relaxed/simple;
	bh=MFhkfdCUAnhZiOz9fI8eJ/eCR8/PSMUmfyXp1i0ZRcg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=cqNnkip171OejBZWPMP++ZeeQ4d2VjkzPvR2c4XAVPsFqBpYc51NHdlwYpS2W3sQw7oey8xv8sgL1y+4V34zFU5R3i7WsDk3rqX/nlQtTVFQfQkpDUCAmUUucDWAIoWgdC26qRP3tbdvLJ8IfVJMDZ4B+rtBnKt4XNZscNoauE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DOfJAVBb; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UyuIQntv; arc=none smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHIJpcq005630;
	Tue, 17 Dec 2024 17:07:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	pfptdkimsnps; bh=ddACxBYX6LvJUJfWlNDmo/sGoi5P3JB+svtrxKk/MtU=; b=
	DOfJAVBb01OTKm0+4T57L3q7u7YI/FZ9m7veDk/7nRUqLA1aY8kWNMepa7cQ3zBD
	JSppoj/d8nbgCVbfivhDPKg61KO4U0w1f/tMS1fx/YL466R5jCPmAFwJ8TAjfY2K
	qafqugn1Lumxbyj0G1S8r8V7of9Xt0iMiPKmRzrG5GzLBje8a5C7j9hEofPVk0Sc
	A1yFpd5J4PdHAHOYuhn7EgrAakmp2CXAnt4So/OPXIxM1NV+PUhZlEXuft5Nnf5d
	ZutCT83WmV7tl6ktSq5NhwLUk1n1L322cjb+KGFb9RwPP4wMY4B6nwvvizStHnPA
	cjnLkNgyqyToGdpIwtgzdQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43kefyhk7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1734484060; bh=MFhkfdCUAnhZiOz9fI8eJ/eCR8/PSMUmfyXp1i0ZRcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UyuIQntvOeHr0YjxNi0fvsRZE50CYwh6gx6FuAp0S2I87FSj4I29HtJ7G7/MP4pU1
	 ngnFL+d2bxuUBUoEk/Yxhai9hErZOKNed02dawnixpcF3YpU2As+wuU/Dtqxhim5UR
	 kmhe/JN9kwhfLWF67v0dIET+l57Gi0CXhlUCmUTpSYJFhr2uGnJOmki6mhF2Ct0ZZk
	 9JJk2CU7atnzBskl5Ov6XwyguizLBt1DUigPE7ChPZvQwvSL2Jqdp7Kqwkvj38gFdt
	 4wHZqwLPNd1Tez5bHaxKVcZ2ydVenT+n9NTRUdaG+z1C6ZeXNqY7lpUkjEowFmWR1s
	 IGP6FB3/itJSQ==
Received: from mailhost.synopsys.com (eudc-mailhost2.synopsys.com [10.213.161.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9573C40147;
	Wed, 18 Dec 2024 01:07:38 +0000 (UTC)
Received: from stormcs515.internal.synopsys.com (stormcs515.eudc.maas.synopsys.com [10.212.40.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 1AE71C0A9B;
	Wed, 18 Dec 2024 01:07:36 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: "Miao.Zhu" <Miao.Zhu@synopsys.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, xu.yang_2@nxp.com,
        andre.draszik@linaro.org, dan.carpenter@linaro.org,
        emanuele.ghidoli@toradex.com, heikki.krogerus@linux.intel.com,
        m.felsch@pengutronix.de, rdbabiera@google.com,
        u.kleine-koenig@baylibre.com, conor+dt@kernel.org, jun.li@nxp.com
Cc: "Miao.Zhu" <Miao.Zhu@synopsys.com>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Jianheng.Zhang@synopsys.com, James.Li1@synopsys.com,
        Martin.McKenny@synopsys.com
Subject: [PATCH v2 0/2] usb: typec: tcpci: Make the driver be compatible with TCPCI Spec
Date: Wed, 18 Dec 2024 02:07:16 +0100
Message-Id: <20241218010718.224530-1-miao@synopsys.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20241202054314.k6dt7uhnv2kavea4@hippo>
References: <20241202054314.k6dt7uhnv2kavea4@hippo>
X-Proofpoint-GUID: cxTTWV_-oTDOK0RyorjrucWixDvGN0QN
X-Authority-Analysis: v=2.4 cv=IqPkcK/g c=1 sm=1 tr=0 ts=6762205c cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=N6atwU2pGFX-QpmD:21 a=RZcAm9yDv7YA:10 a=qPHU084jO2kA:10 a=Yw8pcWr8A_zg7vjb-sMA:9
X-Proofpoint-ORIG-GUID: cxTTWV_-oTDOK0RyorjrucWixDvGN0QN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 suspectscore=0 clxscore=1011 priorityscore=1501 mlxscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 mlxlogscore=964 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180005
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The tcpci driver doesn't fully follow the TCPCI Spec [R2.0 V1.0]
even if it mentions this Spec in its comments.
The changes make the driver be compatible with the TCPCI spec and
won't impact existing HW.

Miao Zhu (2):
  usb: typec: tcpm: tcpci: Make the driver be compatible with the TCPCI
    spec [Rev 2.0 Ver 1.0, October 2017]
  dt-bindings: usb: ptn5110: add TCPC properties

 .../devicetree/bindings/usb/nxp,ptn5110.yaml       |   5 +
 drivers/usb/typec/tcpm/tcpci.c                     | 115 +++++++++++++++++----
 include/linux/usb/tcpci.h                          |  11 ++
 3 files changed, 111 insertions(+), 20 deletions(-)

-- 
2.9.3

base-commit: b86545e02e8c22fb89218f29d381fa8e8b91d815

