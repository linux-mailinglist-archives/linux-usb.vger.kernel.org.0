Return-Path: <linux-usb+bounces-18627-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E64C9F6097
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 10:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C234216C188
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 09:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A5C1957FC;
	Wed, 18 Dec 2024 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="otlS/Cvs";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cuarZPTR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F030192B94;
	Wed, 18 Dec 2024 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512429; cv=none; b=Krj4ySta9QZpgXVqcvltRNu7kRA+XODHIVJj0Uu7PLIoZprlQwkuEKBYH1eQnUOAe6JYRh5VmFTgwavoJGkmiuDGe875/U/5/rIs5MEqQhFw6GWUDtWSwLgxdPlxz+ndqUcedHl/9sKvvUGJiRpmzX2T/sNYrYpTmwLYkjgzMME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512429; c=relaxed/simple;
	bh=zD8Av+b26KTurnIxJgI7SaeH2JtQ+yTdYjodOLC8P5U=;
	h=From:To:Cc:Subject:Date:Message-Id; b=oK3oIE4JfSaa4ilx7ObqLDHWra3SxOY2h1H6mleATA1pbgY7H7mGy29NMIVKlyozy9i+jWcAUzCWCngjmvwSlL6w4ohxIDjBm+b/pmigd8867LRqH0Ah1VxjR4HPFMJlrKdL5oyvY62GbMX9EIqLzpA1tWIb8Fi4tfpuXac2Xl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=otlS/Cvs; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cuarZPTR; arc=none smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI72dSK029856;
	Wed, 18 Dec 2024 01:00:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:date:from:message-id:subject:to; s=pfptdkimsnps; bh=1IR/yE0vu
	5V3eqSVnmhVKXlUofKn5GrdjzHCiIXsKAE=; b=otlS/CvsUzTduO8k8aF2ZYFES
	AnY+6yHyBJ6Lza5daV8FWwUUvdt+yotuazCb2C0EJYpaIJV9j42TCJXt9NQaTW+8
	rBUR/8fCS21sJxPKclXXpa+DcfDBvI0NM1mOosENs0n6l7NZZNmn/CsNOX2Z4YNN
	ogm3tdZZNBo2PbmYTNejD1tDdghctmgSnNmV9X8Ckzf3DMTl5jjVWBO7+u5rDggd
	RROVSV2urZ+LOLnGbUKBiXwx0Rr6uIMG61nPzhK89q5nP9hxmVke5Tp5GR8WKOl9
	Mh778BsqzO1EZNVldHBrg2kvp+5A13k5+WfDO1xz4L2LSuShzTW9rS3MsCokQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43kjw226ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 01:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1734512409; bh=zD8Av+b26KTurnIxJgI7SaeH2JtQ+yTdYjodOLC8P5U=;
	h=From:To:Cc:Subject:Date:From;
	b=cuarZPTRmCWx4Jymd2ePdtyl6huX7K2nt69X1nsKF3vzySirkK03ReTngAuza4dXV
	 9x7WLfpp31XnHGz7smmkUtrWYUKymyxK025WugTMcw+EVxqqmJyRA3d8iChfJimrT7
	 0ngdgnUhBVx15oSURFbWoNrO/bLdgIzcQjnfjvEvSTYo6cJ2cewoO9zKzakUSurbeA
	 L3L7y/ul1sfZYLjz8wL/1r+2oXuOKCXi7khteFteUf7MKartblSUQfgV35HAtz39nN
	 4udrOWzndbTWL6YqAxzvnPuQhF7H1TN1M2H+D75mqyKCN8iHYKNkneMxIlhyjF2DBW
	 pBwvPBo2jqVdA==
Received: from mailhost.synopsys.com (eudc-mailhost1.synopsys.com [10.213.161.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 521214011C;
	Wed, 18 Dec 2024 09:00:08 +0000 (UTC)
Received: from stormcs515.internal.synopsys.com (stormcs515.eudc.maas.synopsys.com [10.212.40.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id C5C74C0DBE;
	Wed, 18 Dec 2024 09:00:06 +0000 (UTC)
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
Subject: [PATCH v4 0/2] usb: typec: tcpci: Make the driver be compatible with TCPCI Spec
Date: Wed, 18 Dec 2024 09:59:31 +0100
Message-Id: <20241218085933.2790127-1-miao@synopsys.com>
X-Mailer: git-send-email 2.9.3
X-Proofpoint-GUID: BkXHS4Ru4JjmKk5qlZ1eCMVhcXfGWxtC
X-Authority-Analysis: v=2.4 cv=HYHuTjE8 c=1 sm=1 tr=0 ts=67628f19 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=N6atwU2pGFX-QpmD:21 a=RZcAm9yDv7YA:10 a=qPHU084jO2kA:10 a=kjTaquXGPeHQ8arqYuAA:9
X-Proofpoint-ORIG-GUID: BkXHS4Ru4JjmKk5qlZ1eCMVhcXfGWxtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=939 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180071
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

 .../devicetree/bindings/usb/nxp,ptn5110.yaml       |  22 ++++
 drivers/usb/typec/tcpm/tcpci.c                     | 115 +++++++++++++++++----
 include/linux/usb/tcpci.h                          |  11 ++
 3 files changed, 128 insertions(+), 20 deletions(-)

-- 
2.9.3

base-commit: b86545e02e8c22fb89218f29d381fa8e8b91d815

