Return-Path: <linux-usb+bounces-30537-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FED1C614B2
	for <lists+linux-usb@lfdr.de>; Sun, 16 Nov 2025 13:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 342A928A50
	for <lists+linux-usb@lfdr.de>; Sun, 16 Nov 2025 12:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE5C2D836A;
	Sun, 16 Nov 2025 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7Mdswn4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3Kfhe+i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308FA2D7DC5
	for <linux-usb@vger.kernel.org>; Sun, 16 Nov 2025 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763296246; cv=none; b=kAdgM1beD9tN71dW0/OfTLOlSVPMpG0M6/H9eiN7wtwQGoYgkBOP7B6rNqAQGE2t9DOJ9kdf96ZaLUmWPl+xw9bF6yHjCXiKE9AEewl+p+U8hk/MMEUqB7axynVZp2OOXfrtOi3ZGuHPsg7/z9wX6XuxC2Ctzw96WOf5sD/oSAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763296246; c=relaxed/simple;
	bh=qn6qHcN7jQ0D0SzHEIE3ogFDkIRjoEoM4ge0AYRLkoA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JJcZy+ZOmqEZvnbqN6koBo+4Fx8Prrh53Q1lKB6cwv9X+SUFnl0XFC9h6/DvgdVrjI4mXsF1gVefo3J3Ck9uV2ls/gEpbgoB6lBwXUwiORLVvn+0FTa5ycivtpUTK26pJHWcMWcl0ytoWCI6BBV5Ke2dnalekmDaTN1yCNwFNbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7Mdswn4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3Kfhe+i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGBx7YY1287096
	for <linux-usb@vger.kernel.org>; Sun, 16 Nov 2025 12:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DonaG/M7Ub+U0gHvabNuDi868ril51s1gpV
	ZHcQMUjY=; b=d7Mdswn4HjaIy5BPgHqyYQ5Tgdy24CQqxV2YFFJLod4EJ/vC0Rw
	RzJDIdZkZqn4D5yxR8iMrzTbf8wUEMPWrO8I4o7nQVC+kjSqy3TvK1Bl9ykhJGHg
	bwTFuI3tuR1QlTJmXRN9FvRwrJkeeo27aDRKaVTDo1vqfYTYal8W8Jpa/abnjp4R
	RxZduGb1Hg5PeHEdL8W4uidh+87wfKYnRrNC+bKaq40eiUjpXhFNgcjeVYUW2YBz
	b1HL1BhohOdVIe3TNIsONzp/eppTU+0f915W2zzkIGvWOWqIrt0ItVz3UWDrgr9V
	2Cc6SN4sZtmNqw6pdM3gmOXt/nJtz6nmcPA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejm5a3j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 16 Nov 2025 12:30:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b993eb2701bso3451594a12.0
        for <linux-usb@vger.kernel.org>; Sun, 16 Nov 2025 04:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763296243; x=1763901043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DonaG/M7Ub+U0gHvabNuDi868ril51s1gpVZHcQMUjY=;
        b=T3Kfhe+iimhaFQ/d/qfI8wsG2sZzuLf2O9hxIKxrLBCsIvBcmu72snEx8ez41HGMdW
         EN6vh9Y3LtAajC5pK2kVAqBngngl4jmMqaeBxZbW+F/1JSwyFFltwfO/zqnihBciWPxB
         AlzTdO6SOMQxw9wDi0TXpGVSz01Hp+pcC6voLKsKIKJZp9cDcXoKXxPuOle7Pbcqwk1M
         Rz75zAJZoEUkpMiaQWarumiQNUPeKP+RXCO9g/Yk/PCi2vEQbbQF76NbGil0sublAUaJ
         9Nyy5CeNSxuVoAqy8sd1TvV1v352WrhZqK69vcOmZlsQwhbUEZbGnurlIW1uYKAwUytW
         OCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763296243; x=1763901043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DonaG/M7Ub+U0gHvabNuDi868ril51s1gpVZHcQMUjY=;
        b=qSJBHXJavlPPRwbqOrUnMZAaSCOB87TAv63T1n4exlEfxvGorNxsRBsUjwAUJ8AVwO
         0AYBFifKDWk66xuE2T9+Rwsusym2BbJeZIGaclmzM08JSQSYsKsx1qagfENaQjxi5BHY
         pviEUgFcae5LJRYlDWsVNznHL85riKpyYzAAIZVLVH9dNFXooTUSQXFyjdV3gA8isA6w
         j0z3IFSBFpcFkYzPP/0JO8SSzxN6CycS6P1hLI4I1+m3nAGaBV0jhIVtb7yd8ycYPmeX
         OapMIqvcazRHILGQe2r2sETEGrqujwq327KNHGlTwY0t2csUGob0Gn/kAjcxcdNofp3/
         vzHg==
X-Gm-Message-State: AOJu0YxveSfQpvK5DANwD+J/QC9Pzc4I6Jw8JPK0Anprl0sHe+/A8gYA
	ZhfsS4T3AFeo4/IUcJEDUTxgvPXHV7GqsKzuxAOWFA2c7B+2WzWSzgsFSaQex3GvOGjOa8wt9CF
	eoLppkk0dFe3ohJpRFeLF0X5I/EdAiXus6kEza1XULSDazySGORv5GjUOjKpwDa66SCnVSZY=
X-Gm-Gg: ASbGnctZXu3TsuIrgw7h9tMEfXX5VNjC8sfuAFf6N3Klpo/OYOKITjhVMSwI1OLXfYs
	+bI0mS/mUyfau8TOa3YHktc10C9tJi/jSI7n5GtQqFenBWBawHSyZZGeIoH6PLhodHWAUZNvL+l
	+1DT+Yfw/b2J20KeTkJ5avUmCdWPB0TwLE5BhTqeqoOMgMZpfJN9xs5dOCWM8DVvmc1cZnLN/8M
	wh975ZoPObEgD+JklxWwVe3ePZiyt4i1jfBgdRmjbTdDsgRucrwH76PuKIsLZy/lWXWKPLI4ZBi
	ZAtD3J15JwOigmZZYquJcdGJu6tsLP7QMg9/PKK2wZa6pNl5LBNhk5LUyf+rJLFT9I3wS2H1Tvr
	Mfb/iG2r3B6Yr0vMjqP0KS3VF7K4C0BMR6ZcG
X-Received: by 2002:a05:6a21:6d86:b0:342:d58b:561c with SMTP id adf61e73a8af0-35ba09882a1mr10702059637.27.1763296242874;
        Sun, 16 Nov 2025 04:30:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnk+Dzr5tddr08o0JywQg+/YLVF42KvB0fxKmpC8GZweLSIk+nhW+ZKUbgOUjWXlza4vMnAg==
X-Received: by 2002:a05:6a21:6d86:b0:342:d58b:561c with SMTP id adf61e73a8af0-35ba09882a1mr10702030637.27.1763296242344;
        Sun, 16 Nov 2025 04:30:42 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ba611682cfsm7284735b3a.26.2025.11.16.04.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 04:30:41 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: core: Remove redundant comment in core init
Date: Sun, 16 Nov 2025 18:00:33 +0530
Message-Id: <20251116123033.131004-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDEwNCBTYWx0ZWRfX76uK4D7MbEwv
 zxXBCb4d8/aai7S4kY8gg6mGpEl5LC2vex2gPKRy7qQ/smrKFNmo39R54NdLZUiCuKPGBViguIs
 ox8wN59+z0O4mfDjawLsUYbRAuoZ2pPVLlmsEARAMcOvvuGjE4XgVEb/OjIGqNfejSSEEtzELEW
 8lwJpWjOsIO7bfFzESlYLojOub/q0I0D8sxWClrGFRhqzOqy4u12xcS85PnPddjNntZB6VwPTmM
 9ciUWN62BzWEtznQBtVSMMQL48cGCDoCy2SVOz51IilN/CnqX1oJCYhm5k+k/xNCw/IJ7x64EEz
 Ei3Gg4HU1+t0aFIh2obclntgCpIlej7NNm62Kol5pXFLEG+tC+Lpna3A/DIv9QjWeri9kyb7hFY
 6x4hy9ysMEtye5TrC6Q3ou86hKIGVQ==
X-Proofpoint-GUID: GMZXiNQ1uKckczU33eEf98fvjpG39EhN
X-Proofpoint-ORIG-GUID: GMZXiNQ1uKckczU33eEf98fvjpG39EhN
X-Authority-Analysis: v=2.4 cv=Pb7yRyhd c=1 sm=1 tr=0 ts=6919c3f4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iLQ7FBvWljknKMV_mTQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160104

Remove redundant comment which was put in to address LLUCTL register
modifications for all applicable ports of multiport controller. Although
the support was added, the todo comment wasn't removed then.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 96f85eada047..fbedf46d7468 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1484,10 +1484,6 @@ int dwc3_core_init(struct dwc3 *dwc)
 
 	dwc3_config_threshold(dwc);
 
-	/*
-	 * Modify this for all supported Super Speed ports when
-	 * multiport support is added.
-	 */
 	if (hw_mode != DWC3_GHWPARAMS0_MODE_GADGET &&
 	    (DWC3_IP_IS(DWC31)) &&
 	    dwc->maximum_speed == USB_SPEED_SUPER) {
-- 
2.34.1


