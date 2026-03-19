Return-Path: <linux-usb+bounces-35164-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Br4JswSvGnbrwIAu9opvQ
	(envelope-from <linux-usb+bounces-35164-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 16:14:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA712CD83C
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 16:14:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 65B6F30299F9
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 15:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9B03E2740;
	Thu, 19 Mar 2026 15:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="arK5pQlm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TfcyFlHM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D3A3E1227
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 15:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773933010; cv=none; b=NXgcQdPJXcM1+tdSdnmJYF39vDsUpGkyp/TVXC1KWXXNtTiHCF9sPa8v1KESbhhnvvU1PalJq7EClDF+loucuRNcvxh2SQBqpR6+R2F4OPCrNJwauzGw67VEFYwvxAIjwxzmC4K86CvUqNFZVLmyPLKDcUCfFNNFknp8vLXQGdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773933010; c=relaxed/simple;
	bh=712tYFd2LejZ481YBDwJMV4ihA2THIfN0AVHe7B24Bk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0aAlKcNf8U80JMIOG4nU5g+qmdqwTCN2HHuIfBp66Ifq4trdheCoKWz1FXhoj8zasO+azvp7tPp4LzD3ksFinRsean0fEEAHDZUVFwZuSK4CpAhHa+ppypx60tagIiqTuIQcNypTMa52Y0V9Rgx/ca1u+JalNfGI49TRr2ufKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=arK5pQlm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfcyFlHM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JF2eup1567799
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 15:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qy21oTHWPQB9GqrJOZRuLLS0a9N8g/NrFFNrOaR80VE=; b=arK5pQlmr8nd3Yxk
	ziqe081jkzanKo8d/OHSCagJ51HbxaTo+/wjdmIJt0ALV7bBbuNjSTQUaiz9ETMq
	pVEsBqPfYhgPwlpgMP507xc2SPcAM/Xr+pAX0JyHKMU8X1Ay9O391RhCMnORCZok
	hviwVSFYMt3r91bLKgFHjh4yR2dSOH9A5p7BaY8XE1I0q/JzRBfb/IG27srLmZkW
	Mnd9xdsHsJi3uGuOileMOutYJHYxwtrn6ttufUsF3FIGlZVCs5yeptJoVC8o2NTD
	ZBFWsaTwb+d1ogIMEt/eG0P2NKMRntXdLZjqbzdmqJcoG4h1H4a67z4I6PaY0sZY
	vWsfiQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0akxhukb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 15:10:08 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9484dbd65a7so1878045241.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 08:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773933007; x=1774537807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qy21oTHWPQB9GqrJOZRuLLS0a9N8g/NrFFNrOaR80VE=;
        b=TfcyFlHMHWD83I8XrZczaKeMy6XvecdR6SPn9lMqP9xA0MRtYyvV0W4lYlVvcAbVPl
         f2BFCkXKUr5O6l8Z+G37NewmQonGOAuWZ05kP+lv2X7PclzxKYZz7GVIdUFWPhWxB+Fl
         kpD0NEo/L6BhnVa4LB954iwXfFrDaQf7fj9Fr78bjWxSu1ohVzccrPF46TjpwnmxR8QG
         7la44w5wjG9Iu4MdnN4x2CzUyTM6lpLKT2ts3TpwY08tS1QLqz+I88e2zWCi/jv6YPVi
         z0OKpPtDjLqa9qqBe+ta2dQue5yvME0ISFoVMrXMZchOH03fObB4eUs5WT8l+7WAeykr
         TuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773933007; x=1774537807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qy21oTHWPQB9GqrJOZRuLLS0a9N8g/NrFFNrOaR80VE=;
        b=skfc/vTj0ybPO53eYDnFR/Clq9ItO/sgOIc8gzysmWJii7kgmFv8gO31bRKuSpg2b1
         R1LtocUTvocU4ZLfjHdKKo9PasYeBpFpbZc9jyBULKZN0xsL6IPj95vbAvzi7xHLXYaq
         yA3v1Mo9POJ/CGlhKh4ePRbKL/GcOs1flCS29/ekexiqX4FD6bFinYsO9aUG+FA1dZZh
         etIXZ2yNNiTbhJgPZxeJcXRXN6HTofF2dXnm8UH5BRkmfbHUVzBT/amPeWcNqSr9bBVQ
         f5Wtz17tuWDPQZCcr0b37R5Q0LyOTOt/ZbWMtW76sS37zw+7vnKhbESO0Wrw84F2Zylb
         fZGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK2CQMQtyCxJb0zlLSB8RIh4w9J5EjfJtQUFwnfC0JSjgJZh+30OOrbg5fDJVNznA0N1CE3U3iNL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa4IMwDLKuw0uh/6R0gpMRs6Ww75u2hbf33zs2zydR8/izpVNw
	oFjHineClCQXdj6Z84QbrKdz+UgFEfEURKIMMLZRz+CD6DbzWqQUMIZpT/ULjNIolb+ipjc/pzq
	i7qnUlNVIZ7xJS8a4uT3R8iAyTN1O2zpiR093bhDNZvHsq31Te/Ta0zz9TBqVbdc=
X-Gm-Gg: ATEYQzxvV0hobkrT4qik+Mw5QWyXMOVguZCqgn5yuCN+utnI+sgbfCvhlZleTB6eHuV
	JI5tT8P7lcdSxSoZ3oIuFq17Rj9V47f91e5OwaR/tnAXZFYwAMQ6oY9lCFZ6fkSRmy49bEjnMa3
	iJWLZS794KGPh2PXYqMIRcRA9l0a6c6c7enYjyqs3j37gkR6QXC0ma51UJRh3onRB7uzYsxAESH
	zX+KDFtg+ZaM4cwvhCp4T9E2uixT3JhC+S7i+A3d7x501D3+FfRMgQe2Ra/QM6WbbCv33q81FE/
	VGj+QVIweuGkmcHuIxQaj2WdyZPZe6GhaRf9TXaLTjW9wiQNkaU1mNEuAHCveJHqyxpeiJmGHE7
	ZQXgKVm3lsnlXee0Ai166t7QQjWg=
X-Received: by 2002:a05:6102:41ab:b0:5ff:f6ee:1089 with SMTP id ada2fe7eead31-6027d11ba7fmr3167254137.13.1773933007355;
        Thu, 19 Mar 2026 08:10:07 -0700 (PDT)
X-Received: by 2002:a05:6102:41ab:b0:5ff:f6ee:1089 with SMTP id ada2fe7eead31-6027d11ba7fmr3167242137.13.1773933006758;
        Thu, 19 Mar 2026 08:10:06 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fc61dd4asm32274565e9.14.2026.03.19.08.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:10:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 17:09:51 +0200
Subject: [PATCH v6 2/2] arm64: dts: qcom: glymur-crd: Enable USB support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-dts-qcom-glymur-add-usb-support-v6-2-fa305b40a90c@oss.qualcomm.com>
References: <20260319-dts-qcom-glymur-add-usb-support-v6-0-fa305b40a90c@oss.qualcomm.com>
In-Reply-To: <20260319-dts-qcom-glymur-add-usb-support-v6-0-fa305b40a90c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=5790;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EiqUaHPmquDd/xJyBfNXiMWYImfQU88MJQ82XQcexO0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpvBHGEWFT5HD9cf+1ml3+acMvO5QuxCMeGTrlS
 Z5+kA62TQmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabwRxgAKCRAbX0TJAJUV
 VsIjEACfiknfphiynV638IxTm8qQwEujdrhhwPX4XqpN53q1SluhCqXDO9NQwQJd50aArGnaiJ8
 KHnK2tcsQaqKQysdLIsdHZmSh42JoRW4wY21IayFB36EAW6BervlX6MD8R0Ix/P4exvHbdmHiye
 vRcBXERgQO84Bvn6JsAUy193wQz5FTJprWY6PMtKrB/QxopK9gvKPIArPyp/SPHagll+ilUrDye
 BvDfczel1yCkSaqzCgboMVA1l5CsSE3GbSn3sF7qWmBNc2MByrw6KmqnklRGxJRLzOLUfQQBIiy
 iJHZVRb/Vg64bRt9zdQtK+I+KH75CFTSQEtEMCMMnBGmX2vpmabI9ByzIIXSPZoL8b1DRa91kyI
 9JY45meOHMCUDxJncPayKPyuG8Z8nes/Z8JrwcOmK/q1BO0lh8c43YsaXLznoCaYIweIlIzB9bG
 98ULIYBrnwlj3pIpUUS4Zq9vdTNyqDASMY0p8rjre872dBYveyg8ka8KRfQTL+pisWB+wnGnqJb
 mAJS9zDWXIdWQ/pNDWFbZx9maMjE34cbKEwNn0XNBlUeIzjysI7IZhtoscNF8GK5CBn1wt27BUT
 1cLtijaZXdvrsUwsjprqAe8r3C19Sn8w9oBtnM8v0HBfjb8e1C0fdYb6KUbWuuKhdTttJaeRQEj
 41GA0YdvLVajQqA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEyMCBTYWx0ZWRfX0/hheUTQP17e
 YDTjwm++Efu8RD/45/HGu6rvyTeQmvmPIIzU9VpqTvOI2xWK5jd0AK66T3v5SSjsIvOi7QWDpiN
 ZAxitUGt2a/4PaMBiSTRDpp+rTXkokeCcgY1999nwnNYoRL7/HuwZHCS6JQlms1I+aZg3ijT25F
 OuI9jSeT9GmqpMUVmrAMTM+dU+A8ZmhDrqIeRfZZvC8tj4avMk6w0F5GFpjSrByBl2U1LyBxvsg
 hR356E2Qrdn+QFWRzBhTT5DP9WFk/eWDglk4dnvUMWsaE91qvGrIPYSChjsa2L9f86Nc+Rfls9j
 IY/Ds4YUOx9obzfLKgVIJne7tEy1Tp/BrVfwcnLkp/5FlevSFSnOs7wuECII8tZWzbuMtJdurqZ
 8Z8ePNp1HqOPppLMi0ePSU+S6Orw/DFLq1PKZ1w3X6viDkv1MSt8vwT5AZ0EDr1SZ16tSa0rDcX
 smPP7JeSHz7m7VqYUzA==
X-Proofpoint-GUID: YqrjD683S7PMQx2fVHIo2TLXnTm3hR6i
X-Authority-Analysis: v=2.4 cv=ZeMQ98VA c=1 sm=1 tr=0 ts=69bc11d0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UaQ5raezdk1POPUwhdYA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: YqrjD683S7PMQx2fVHIo2TLXnTm3hR6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35164-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,0.0.0.47:email,0.0.0.1:email,0.0.0.43:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9CA712CD83C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

The Qualcomm Glymur Compute Reference Device comes with two Type-C ports,
one USB Type-A port, and a fingerprint reader connected over USB. Each
Type-C port is connected to one USB combo PHY and one M31 eUSB2 PHY. The
Type-A port is connected to the USB multi-port controller through one M31
eUSB2 PHY and one USB3 UNI PHY. The fingerprint reader is connected to the
USB_2 controller.

All M31 eUSB2 PHYs have associated eUSB2-to-USB 2.0 repeaters, which are
either integrated in SMB2370 PMICs or provided by dedicated NXP PTN3222
devices.

Enable all required controllers, PHYs, and repeaters, while specifying
their supplies. Also describe the PMIC GLINK graph for the Type-C
connectors.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 214 ++++++++++++++++++++++++++++++++
 1 file changed, 214 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 877945319012..a7b30accbd1e 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -60,6 +60,69 @@ key-volume-up {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,glymur-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in1: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in1: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -367,6 +430,36 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	ptn3222_0: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+
+	ptn3222_1: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -485,6 +578,16 @@ &pon_resin {
 	status = "okay";
 };
 
+&smb2370_j_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
+&smb2370_k_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
@@ -596,3 +699,114 @@ wwan_reg_en: wwan-reg-en-state {
 		bias-disable;
 	};
 };
+
+&usb_0 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_j_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_1 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in1>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_k_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l1h_e0_0p89>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in1>;
+};
+
+&usb_hs {
+	status = "okay";
+};
+
+&usb_hs_phy {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_1>;
+
+	status = "okay";
+};
+
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_0>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	refgen-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	refgen-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};

-- 
2.48.1


