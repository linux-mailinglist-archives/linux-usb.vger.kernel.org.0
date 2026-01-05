Return-Path: <linux-usb+bounces-31897-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4E2CF1D7A
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 06:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B79E3007E46
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 05:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB48324B26;
	Mon,  5 Jan 2026 05:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7vS4pM6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3RMegWU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0AE31B80D
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 05:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767589657; cv=none; b=tZwuAKbpv1UQ4huiKp48EBUrzT4xquJTv03IQ4uxsWbu4ZUZhf/vUuW0h4ff6TX4wN/2BiIwtq8zy0us3pFp5Y1tPgEyEXdOF4alV9j6ICasWS5zXQD9nnpWhlVK7nZHGxX6QIpPwBz4QkSCOMdGJncwhd1aiPH4vJk9DPshMNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767589657; c=relaxed/simple;
	bh=HLu/w5R1FGiCcpaWE0wTBW88t/c3J2j1yN/EPptom4w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wny+oCV9CMQ1HppHEUwbU2PBVJ1ilvb5NIU9FiqWQw9BSB8y4xw5r10Nj3CQ81gzE7I6X/otb2baDiH79B5oxTYq4tEbhItbr9wF852EyaNqwyLX+fHGfHakRWQ0dTIk9X2HfzyzzalsbXmGveuxzsDx0jas+hxUNKQwX3Ef/OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7vS4pM6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3RMegWU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604KucZ23215663
	for <linux-usb@vger.kernel.org>; Mon, 5 Jan 2026 05:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ar8Sg4qYU/6vFfSBOlkZlw8QaMS6BuL842X
	7iJYE+nc=; b=E7vS4pM6d/ypRZroL4C9g+IMo5+EyLwUlp3BfGkJbNdbmX7zLHp
	VDYVTZjtzYWsASOz5E80+Z4lI7BRgIS0orHvitke/WI1WipkG86A0U1xAxiTCbXE
	FA0BBx7fQIlegBwFiX/mknEfEk7kj8MckvUICiVsSPsJZqvFluXq2YQeNiSzWJ0G
	2VPPCmwaX9jXemKqM3eidDmH6gjAH7YO3hy8IJ9R7u1tdcWTdYFwTA0NBEq27NTV
	5iJbEFvQ0EFK8vm3uUgIHZM/nkdaj85lXX0vwVldrHltLIopNwGnQiYffMsKPbEh
	kgwoSgIqe8ObfBfQm2M2ops4qfjPyll5qag==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beywdjwgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 05:07:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8088be744afso660165b3a.0
        for <linux-usb@vger.kernel.org>; Sun, 04 Jan 2026 21:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767589654; x=1768194454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ar8Sg4qYU/6vFfSBOlkZlw8QaMS6BuL842X7iJYE+nc=;
        b=a3RMegWUhYLuqF25R1vfAmwxKFKyMxJdGPMAoKP6N37wq2+qAQ6ZRKDJ/kD3F6xg8y
         YwmNa747McYGsIBhXMKDUW6BqgH83e3P9jOlWEBq4W2vjWtkpLd2oGNEUnF8lMwxTsTA
         ylcUcF27ijg8YIErH1AGGY628XevhcYclwNIbMrFXVFh0EAFH4vvAnLTvkivbtbV3ahY
         dq0E9AOA6H9KWJYKAPO/oen4DpzuiU2/Ht0jw/k2garQF1iUyEwOmM1r0Z872XLFzBpY
         hPdeaX+zbqut1C96oOClnZ0Z4CEBLCII8QbAlvAn4cQrBWxLrO8Wm/OCx5osLhOL4JiY
         dR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767589654; x=1768194454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ar8Sg4qYU/6vFfSBOlkZlw8QaMS6BuL842X7iJYE+nc=;
        b=FiPWacZIkFIHd/V+u+iiIDPTDrD7hSKSDF45o3tfxxhdiaLwyKkAg9yrPG3QsY4JOl
         Zzfw4zFn9LTX09l4Szeo+6OMQKWMazrbzH2SU8snctr9tXHeDwfuAy97JrW4LW0SbYea
         EM8fHK6hSF86yLn2/g3fbHZp1lgYJLd+EVMbSU9YyfTFJRF7lFVgYZ8EEWb1TLElfw5h
         1PSnYpf1VBBIL7Wd9/IXuC/oEpuFnnJdk7bz4kkSD9xMZWKzI48ts8o0DaQUOKDvnsBv
         ocNtlgX4coUkuGxddva8K8NlLivK4ro5a2GjkjmJHkSTSHQt7zrSCh8bitHVn6Ks0y56
         lcbw==
X-Gm-Message-State: AOJu0YwORahVUN8CVtRC6qWQY18cwmt3w2veKxOuEyU20z2Z8q96k76G
	qkcrLJn5H6j4/BTLJjqKcKhBR+zFPTmHDxmcDs1k29VpYRyhuzO+qUcfhXXJ9G/BWmdLDjCM66L
	X79bzAnVEoyzH+PZp6Q46lh7IJHgbAxsZOgMSvyTgp/EcbcYAv5c0ER3XgkRE3Xo=
X-Gm-Gg: AY/fxX5UjTZ/qObwOjrBtPMfwLU2qBNV057Jsjaxh0UMMOm0aGrGRfn5a1KFsEBP9h4
	033tx/3tZehKb7nWU6D+JZoJGL2YjhWiS19b7X8kTE0UzXS+4a13jlFuDwjgsibNOWF0JRdrp//
	Iq+OWMkN4ndUhJ700myn3J3W6WK7L/KiBaMTAqsAwGrmex3uOBgwqO8LHyok4lJfUiwPdPepkS4
	kOmM6qLjC828jsdDjl7INrmOopt/wYbcnDML3zUd687VczckWJOEtNroTVSDwLJtFqgJ78voRAe
	TCNb2ylPg3sPbOKs9EptrRJWRqBcYnWnUhRzPTEl2nHEPYgqDfUUao41oW6fPJNFlj1qvMD5mBg
	JTEiCDQ84ANzbIk6MCqVjrWX7K6ToETxNtdPf1YMTMV5+
X-Received: by 2002:a05:6a00:3021:b0:7dd:8f68:a812 with SMTP id d2e1a72fcca58-8148a154536mr5844585b3a.6.1767589654155;
        Sun, 04 Jan 2026 21:07:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyrUPivBHRu8QmYC49bJrE5xbkSdID24qVtK9lLS9EuwFwOVQGyZ8RzAcCAD/R2L9yTSbNLg==
X-Received: by 2002:a05:6a00:3021:b0:7dd:8f68:a812 with SMTP id d2e1a72fcca58-8148a154536mr5844567b3a.6.1767589653644;
        Sun, 04 Jan 2026 21:07:33 -0800 (PST)
Received: from hu-ugoswami-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa32916sm46974715b3a.8.2026.01.04.21.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 21:07:33 -0800 (PST)
From: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
To: Frederic Weisbecker <frederic@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Subject: [RFC PATCH] usb: gadget: uvc: Prevent smmu fault in unstopped stream uvc teardown
Date: Mon,  5 Jan 2026 10:37:24 +0530
Message-Id: <20260105050724.2041581-1-udipto.goswami@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=695b4716 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-zKhIro81noRTUVSJccA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA0NSBTYWx0ZWRfXznpgm4ZEiOuH
 BTUpnwJrAVufkYSWUTjNq8O/8h9wBsQQAGFhwNGUnf9h2v0hGDl29CsgOYPM5ayrYygoCHV+0oL
 9YIDvKU820dh4KUUIH5DV2HySzVcb0YL8tVphD9sdt740mLWD4s41pH93yND1iVvPzqZfvsHkhi
 ZEL9tIgu8QFI6NCWl9O5Rr/hsd5Zfx5WRIVshJ0L0W6Y3wv0FeW7uihEzVeEWYFwowauPyB7Ov7
 wKcEZCtxZ7ti7Sw+h+bTYKIciXnAXQbFy8cU86bTrMF4uwI7ie72lppG+2NMkcVlXYHrlxRAnwl
 NlJWPkh66yzZRywoAh9LymUeBjY021OlMvvmsONXpRDInQeZT56mtGEyj3qVqzK/t9Q1VdXxEHg
 DGwKAFlsZpP4sMe5Yaitkm5h22x1iWUmr40/7QleB8fqcY5QD0s6ikrAx6OgT3M1qki+SlowR3h
 0iBVLfBzofdtbLcfKSg==
X-Proofpoint-GUID: mjajms_DG4a8EITOwPOA9YkCKXMImpGF
X-Proofpoint-ORIG-GUID: mjajms_DG4a8EITOwPOA9YkCKXMImpGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050045

When switching USB compositions while the camera is streaming, an SMMU
fault can occur because dwc3_remove_requests() unmaps buffers via
dwc3_gadget_giveback() while the controller hardware is still performing
DMA operations on subsequent requests in the started_list.

Fix this by adding a delay in uvc_video_complete() when handling the first
-ESHUTDOWN event  (detected by checking !UVC_QUEUE_DISCONNECTED) to allow
the controller to  complete in-flight DMA and drain its FIFO before
dwc3_remove_requests()  proceeds to unmap remaining buffers,
preventing the SMMU translation fault.

Signed-off-by: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
---
 drivers/usb/gadget/function/uvc_video.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index fb77b0b21790..04724bd44ab9 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -366,7 +366,15 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 
 	case -ESHUTDOWN:	/* disconnect from host. */
 		uvcg_dbg(&video->uvc->func, "VS request cancelled.\n");
+		if (!(queue->flags & UVC_QUEUE_DISCONNECTED))
+			delay = 1;
 		uvcg_queue_cancel(queue, 1);
+		if (delay) {
+			if (in_interrupt() || irqs_disabled() || in_atomic())
+				 mdelay(1);
+			else
+				msleep(50);
+		}
 		break;
 
 	default:
-- 
2.34.1


