Return-Path: <linux-usb+bounces-32241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC70FD18130
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 11:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE6633036B8B
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 10:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374DB28488F;
	Tue, 13 Jan 2026 10:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8k4fImZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOxVKpMW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F2D2BE630
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300453; cv=none; b=IkXFeUUxZtvE1iNgEVxw28ZBs3MuWxbyC6SypxUw2H6I50qzQf/rPo1zCWFpiqUiewHEiU+FophTZtc4ukZXNYxnLz9T03H2+aTp3DJvClMThf5P5aJFi62x4okoDpkGC8U1YS8wWG6Z+oMPHfcLVN3EmsKKNJ5YBaQ7dZi/N6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300453; c=relaxed/simple;
	bh=3IOpqeuJDd2VvQ1xyKE5Y/yLbTdnCHOyfCmTcMJWgmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Tyo9B1jnEg1HT6F+EG9KNFpW6CGVhn1xZEbzQsTXoleZxAy6zcZVdqQGDPfX0rKUfhVTuc3dOc1qqYcKrFa7tNKOBto+kGmzCvWHbjikjqypti+NeXFfNGZrGRwyQv7TnkFyZZpQB9FaI+U5NeDNj5XC3t2xwVoIQHJef/KaP0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8k4fImZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOxVKpMW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5aw733637257
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 10:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t0DxTF6XpTbcLZF16ugKMHmuEdIMBo7WDZa
	FbWe1gk0=; b=b8k4fImZu7maRrZnRXZGNpQ26t6txGB/VOSKWoJA5CprTJ4e+UX
	c7uKOv3/RgFWapSIvCMyM7AT4IT8inkn0g35Xa57Y12FmYlqwFxGnMw7L3+52Szv
	nfKOZ8ls/Aj5VnpuowVV3OETM8lfdwW5nF8Rk4edcQRaWEwA7FpwPj2CKWXoAvqd
	DGHz4mLwbBoFNOQchPK5VWt+vvrZD1pltulIv9rz6m/RVfzYl2wXD4749Qdauppz
	dUzWQi0ouPaZbBvfpmnuhweE+u2dcPBU1eylRvVLrt+CoS4hpaprssELfRU5HnAB
	lClOi9qmLCKxye5FxQ3Cjpg2tb/WuZe77uQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng2c0xjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 10:34:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c52ebdd2d43so2825066a12.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 02:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300446; x=1768905246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t0DxTF6XpTbcLZF16ugKMHmuEdIMBo7WDZaFbWe1gk0=;
        b=gOxVKpMWyWeLvXxqKLcVoLmnGf+XtXD8nvB7UXEGPmhceIPSh7lEineWXmRg3z2F9G
         uKIEVPEEW4Z5I8qG0lpWSceHrmVc4gktkXZHcgfCnsmf3JUHutDQTHrsEJkZF3VARi95
         lXM8WPOAMVjCoqFAJLMHJis2uOxjaJD2xRRpLurp5polGXpJClmoy2wczG933HWe7vsj
         0tg6TULzLwWplmnrgWARDfgiAXja1IMvJDDntUuywwwigJouZlrlSIOWLs8w3R+s+yvu
         ZFuaE5m6/PyGcIBNuIA5xyrtAidUh8htvBoAsOFiEB4bplSxNlk38jtnfLK8g9H+6X5s
         nGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300446; x=1768905246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0DxTF6XpTbcLZF16ugKMHmuEdIMBo7WDZaFbWe1gk0=;
        b=L0rHSXkAqQhvnGk+jPRE5rPtXLvbNTw5osHj/brYfN3KRdIK7vXe6nn7TqnmoG5UIF
         qJAJFFFE9tmiCcR5Gbndk8I8RLIAq29aZsRvzfBm5GszzvkkA65BH+jggZAxZk/ABfYR
         McYzcF95vhDzIFoYEJBuu2QoQCJUFaHn/L9vFjHHOUkh2ybeYENAAomA026wK7Z7sPFC
         8kTxvf4iJQNR4aaaaOzxvLr/P6msnRAvAC5jHxpQTOUR8luKN01t3glopomIcqlqUtwV
         Jl5JCxWF/Xy+EgATFk4YH8Y45tZaeC6fT6qPRDUMo0nUNOcK3YxAm6bzaseJQCjPfek/
         Okow==
X-Gm-Message-State: AOJu0Yx/Yxi2/3bSV7aWvLzvt2pQIDPpgW7tUwyiSzK9meWgmSb8263c
	dyWKF+aUovxhMOrT3p1sPvhOI44QbOblkUfcL8FPCfuPSL8bWftC2zermQhR3N5jL7Xl9S6zBCd
	N8ZDpiKN3nH+1ZYLwbvmUfPR5GylYHT38QzhQD/O00WUtLq9wfKxuY/99OFhts3Y=
X-Gm-Gg: AY/fxX5rCZEj6CocKuA6V62wmmGWr6+q8FABptkv19elKdoFoI+zZXT00lYYM4eh6HZ
	Add51rMDhfxWMVmPUm2oPVTxe7YfApERClSDEB9TuUxLIXd/LSmxOmF/Cv3MwHBN9vaHz/fZIIt
	vNU+sRw1I5an6rPGt1Y+zxie2ZxphqduO/LMKTJTAO1vxu343xOmQ8YWuWVR2084cQvd8heDgr4
	CXowMnd+tFM6gobvLsuZaj9E4652QlHJshwN4wgOeI0kgoTenFah2qqEX4ubW49S4RB3s0uxQl9
	100Yp5ffUrLM06ATltDuhf3RLmUdWlJg7FVLarzrgv+p44ruowxLlxhTZXDuyWWCzL74pETO45o
	SjMlUL7TM9BMGDIzFU5X5LauerNmPyrbrV2rTmw==
X-Received: by 2002:a05:6a20:9185:b0:366:14af:9bce with SMTP id adf61e73a8af0-3898fa17787mr18881627637.68.1768300446372;
        Tue, 13 Jan 2026 02:34:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlkCh9JDgXmQMZ3tRhoJmBX8OD0TapeaylQwnoDHrA068OB/cX9ocOe95S4md3bpIYxs90Sg==
X-Received: by 2002:a05:6a20:9185:b0:366:14af:9bce with SMTP id adf61e73a8af0-3898fa17787mr18881607637.68.1768300445857;
        Tue, 13 Jan 2026 02:34:05 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b2edsm19769911a12.32.2026.01.13.02.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:34:05 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add the DWC3 instance name in traces
Date: Tue, 13 Jan 2026 16:03:57 +0530
Message-Id: <20260113103400.2347763-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OSBTYWx0ZWRfXwqK7lhOQZkSF
 WOnRHXOFnuZPltpuiLLdtxSGxfaYxROJbbiFPf80AcrO2fQU/EExafDXOKMvZgGINYyb3ebu3dd
 EDX1I3CekMXIlds/ANx30IfPtHSeYRHNY5Ld1TQE0O1WFTavCmVMj9WYrOI6E4im0bqs23VVBP+
 20wrATh1yvIbcYLvcKxR2GEIJ3Gx5b8j8fb6TPh2UtCM5Z8iszVImyPZbqYwD/AvJc4gVFaw4Ca
 HoQaoLqPj09QTL17V6GIdDk4H3ivTGXuM+LOxmQY0eyp2vUvXLUVNqI1cSH08gfh0nEBF8pys7k
 jjIetlzOJAVz8q+nPto9BuHSZrSVSA3FHEm7Iu2GDSPnVmaocis9wFDRyJEUuFG2t0W5YUSzuMI
 Ahj76eWXOcXPoLEXidoKkmJw9TVpdZ586R2HQJzeWzWNNkEMTqMMWQ0r8SqTz/7w8U+XhhJZeGa
 NmmtisxQRAd18eF+vbg==
X-Authority-Analysis: v=2.4 cv=C5TkCAP+ c=1 sm=1 tr=0 ts=69661f9f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WwGGzFOkyck6md8MPd4A:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 3BCT27X_NhBIXPdv_YsgHQuuGDUcPJlU
X-Proofpoint-ORIG-GUID: 3BCT27X_NhBIXPdv_YsgHQuuGDUcPJlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130089

When multiple DWC3 controllers are being used, trace events from
different instances get mixed up making debugging difficult as
there's no way to distinguish which instance generated the trace.

Hence append the controller register base address into ftrace.
This needs the following reworks which is addressed using this
patch series.

  1. Removal of dep->regs and use dwc->regs everywhere
  2. Use dwc pointer in all dwc3_readl/writel()
  3. Adding the base addr in traces.

Changes in v3:
- Renamed the variable to 'address'.
- Used u32 instead of string/char[].
- Link to v2: https://lore.kernel.org/all/20260105115325.1765176-1-prashanth.k@oss.qualcomm.com/

Changes in v2:
- Avoid using macros for dwc3_readl/writel()
- Use base address intraces instead of dev name.
- Split the patch into a series.
- Link to v1: https://lore.kernel.org/all/20250825114433.3170867-1-prashanth.k@oss.qualcomm.com/

Prashanth K (3):
  usb: dwc3: Remove of dep->regs
  usb: dwc3: Add dwc pointer to dwc3_readl/writel
  usb: dwc3: Log dwc3 instance name in traces

 drivers/usb/dwc3/core.c    | 199 +++++++++++++++++++------------------
 drivers/usb/dwc3/core.h    |  13 +--
 drivers/usb/dwc3/debugfs.c |  44 ++++----
 drivers/usb/dwc3/drd.c     |  76 +++++++-------
 drivers/usb/dwc3/ep0.c     |  22 ++--
 drivers/usb/dwc3/gadget.c  | 164 +++++++++++++++---------------
 drivers/usb/dwc3/gadget.h  |   4 +-
 drivers/usb/dwc3/io.h      |  11 +-
 drivers/usb/dwc3/trace.h   |  88 ++++++++++------
 drivers/usb/dwc3/ulpi.c    |  10 +-
 10 files changed, 328 insertions(+), 303 deletions(-)

-- 
2.34.1


