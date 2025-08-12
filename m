Return-Path: <linux-usb+bounces-26739-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66694B21DAD
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 07:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22D027A71A0
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 05:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250C02E2F00;
	Tue, 12 Aug 2025 05:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IayR9ZM0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E752E2F04
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 05:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978165; cv=none; b=fnkaoFv6BbUwA9pGLsHahhEutFvRESrKNwMPAC17d3gYpwE+pG8D9g3qzFei4QMCrwnya5zKjC4BGvSQrRIyYfEqb7VB72190WKluh07E0WC3HSTO9NpIRJYaOIn8xoPcqVBd9IKiOufb4kWt2KPZ/9n+r6wdugNPDoYrW1Tz90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978165; c=relaxed/simple;
	bh=7C5wlqfUGlNAOlcMWP3UIoJSoU7F5CfXh7HAySLy7vw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ic6jjSGI45FXPTRgK5Gmh1HkJX5OaLvQSTzrU3wO5cjR3e96JllPBJ0BAgFwmdu0+49ChMEsR1uw1phkP8+aU+8kbh2Sn1mJulKmdSE/gtdC316DG3Lx9jkv5mY8GaX1cWIEX3dCSROzJmHGNVMKQzu1KxV5kURj09UDVbomxPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IayR9ZM0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BJqe84008272
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 05:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B19nWzff1hv
	gEWIyyHXO3w1PVc/KbOyGfSQee+KWYZs=; b=IayR9ZM0ZasSV6SoP4/tcbHneSA
	CVzONprqFBAFD6bBAkrxYqFEfh4bGnVflf2uM08l9ltjaPyn00a89SiO5QsHMEv9
	C3ouXICSo8JfKqDPRJIXTf/ZWxKRin1rDGfsKYItEHzbCC7OxF3yQ4QvyHL/06+c
	yxP7rNht9+3msR9KNWbDRYr36NakZrH5fcweXekorA8WeNdtsOBe/wuj4Pd/zIYH
	u1RLUOOhnNNjQbTDw/bUBQ7mcJBFIL6J3nqsfcBUVhv2T+y1xBcYH7P/o35y66N0
	u2Ddo/J5Hp7VL6wgnJCEgzMP9tFjJRVjMm/DrIjPtaa5T0dGQBoWPUbVVoQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjjt30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 05:56:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32129c65bf8so5775441a91.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Aug 2025 22:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754978161; x=1755582961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B19nWzff1hvgEWIyyHXO3w1PVc/KbOyGfSQee+KWYZs=;
        b=rED/QMirZc/1U43YmvUNebhB5XxvFoBkues0ZWIYg8gHQw98ES0Q+sqZW8MYQ26dNJ
         57dN6QTDHN+jMzSPqoKA+KnvklomML+SMgothD6IrvyU9lFaIm9BmkISGYT6Wys9ixPB
         kXF3JVuuiaFdAJ2Ch/2ZOiA68XfKyVahLOWbCQb3B5O6VUSn0PcdARPzdZm2xmfB588A
         aAPkgIL/XEqLG2cnGWncQrGBD6CiAx0Q0JVrRaR3gZiH8qYji+qbBZBQ58u63UBL8DoU
         iNMLTCH/MBNONLcbo3OXw7YbgElctdxdpyhuY6Jc4p2VsGnlgwahf2fDp+TtAT3bII4r
         61yw==
X-Forwarded-Encrypted: i=1; AJvYcCXk2HmkhlF4EsnoPyPD7XPSpBUPpl3P38IKHcQlddmMnN0HeHadTGHHrwRff5quX4IefTcS5FLcgKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJHade4Dp9OTWGAco098h1r/9ZzPPZY8kB2ccD5wM/ddmtfznL
	EV9F40egz8hAmq49GrRmxqjTRb90Ns7TCPXtDZ/CIsipcGec3EObHN/aTcpWI5LIquBedus7Cu/
	4IgtNk52PgTQxnuA94HPVet4z2KGyP8lb6olZcSmP/MH81rkVwL7+ejwx41xogX8=
X-Gm-Gg: ASbGncu5P8fRxxKDfeMT9MLbM29EJWzCYPHOW+KhSbbtpM57RBYiohDTeeQ3LwJU9x2
	vup7F+fzs64aKHrJyTkuNvApQdMAGZmOvsvqBsNlmXIjFw9t3zp3Fxsn994r4Il3G0dkdCCM/J1
	+AAU/cxAEdjJNS5ogHp+XhTj9O2E0JuUEco3jkfkufyAjRezxHS9BgN/PlnbODutJHe/MtOqzqf
	Jqohz/YysHH18VJXhmJz8VPpJhdds2C7PaTpT2GU/oTt9/LdNUUsOI3TzlXkNlpUXUKqZHNs21e
	PZv0YUtkpaOuZv+R1a8DRgSSRh9sA9tXrSd0GXs2gEGq/RgR6Lv5xJ7XdJqkcsQI1aYRWf6UZF1
	ShQ==
X-Received: by 2002:a17:903:b0e:b0:242:e0f1:f4b9 with SMTP id d9443c01a7336-242fc28758cmr25282735ad.20.1754978161580;
        Mon, 11 Aug 2025 22:56:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4e8kQp0IrRtj31bzCgS5V3rsipa7Z4QR1lRYTKeX+/QFVw7wAbbooXEt16J/B1HRK7sYNcw==
X-Received: by 2002:a17:903:b0e:b0:242:e0f1:f4b9 with SMTP id d9443c01a7336-242fc28758cmr25282425ad.20.1754978161106;
        Mon, 11 Aug 2025 22:56:01 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e585sm288585985ad.40.2025.08.11.22.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 22:56:00 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 3/3] usb: xhci: plat: Facilitate using autosuspend for xhci plat devices
Date: Tue, 12 Aug 2025 11:25:42 +0530
Message-Id: <20250812055542.1588528-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX0CBlrdSvh9qV
 MH+1U4o7MZJkA1I6gRRyN75I3L6pZbEqWg7qpBeJGPDxDX4lv00mqZ7/DfqeQQpKpQ+Rw8iWFJ+
 TnA4ieCgk/ohsB1172tlciIIf3H7GLHEA7KpwCPckyA/mfjuAmc7VprwfOS6EQAXCzbAW4Sv8yt
 bw+LYQ4atq1mJ3m/Yv/UqHL4zhbxRsFlgHlEpPGbZbptC6ObXlKF08PLwKujKSzd76nIQewbo8A
 i6olnzz8c67d9gsQ8FgY8Mbvpf+GmvKTzmQV3r5yuJogFnzA6wv2X1HyJXN4ZRqF9Uov72Z95b4
 KvdzTm/e4mwdqK9BMQXyPAuNJQmy7lRoyt6F3ZFjb+PCFQ6AZXql/DUEqa23WEhiqZNxOjbmsHl
 nLzqJPf2
X-Proofpoint-GUID: LE9wHmrpe8Q914L1zSL8Ru3pmJ0M9e7S
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689ad772 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=dywq_Bg9ifu0WOeA0n0A:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: LE9wHmrpe8Q914L1zSL8Ru3pmJ0M9e7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

Allow autosuspend to be used by xhci plat device. For Qualcomm SoCs,
when in host mode, it is intended that the controller goes to suspend
state to save power and wait for interrupts from connected peripheral
to wake it up. This is particularly used in cases where a HID or Audio
device is connected. In such scenarios, the usb controller can enter
auto suspend and resume action after getting interrupts from the
connected device.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/host/xhci-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 5eb51797de32..dd57ffedcaa2 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -171,6 +171,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		return ret;
 
 	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 
-- 
2.34.1


