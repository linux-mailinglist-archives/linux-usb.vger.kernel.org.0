Return-Path: <linux-usb+bounces-29502-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B4CBF9817
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 02:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 219383536B3
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 00:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE22178F51;
	Wed, 22 Oct 2025 00:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqtfG4sN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D090038FB9
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 00:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761093960; cv=none; b=s38LT4nsl2RC+5loj27ai+WnpRbYufKpmlXUqbXaYMXoKQBbEO1Ga1W1D70dhiHEmtiBKJFJp/7FJlBhoWX9YdZ65gpWEyJ04gg4ka3Fe+YXmteVM0IoDYo2Q5FBsBNAulKT8YwPgwQz3m1vL8AAXIWJyOniX/32e5cYe1tXNso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761093960; c=relaxed/simple;
	bh=Ff3ly7OYBgQF203NlkpnJPPzsPGuYU3vghG0scfKJUM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oYb3FvQifJXFvk+UCm1T3Ez2qD70T/vC/v763w2u3FJ60PhbIhlZ7+Ph18gfVnldM72i8YgMiOBY5uEoGjNJlLHA77Barzp/2im0QWi2sYCjA7RcCuBLtzRITQIwarRM2vBGRYWN1E3XMm+/rFDrnNmm/oMDeSlzG2aEu9Ps2QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqtfG4sN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LF2hV7032689
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 00:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EoVdk+R2177hR21peGq1tgmUNMOo/3hzUkC
	rdH8m2TI=; b=VqtfG4sNaBlmeoy4ynrChLaMeRlVGXz4H9wT56xbzAz+zMF7u72
	qfcpNPiapLKhcpEQxkNHiLQlHuIR4bdhKG8gqweXQnG6ZmAra7NRhODKSJtjxktS
	pGj5CsSgWylYieSn0IRis/E6oCGPevFEGuFQq4Fo7beFOjyAP8bu5sWSzKwUuRuC
	FszeCD++gxAfuoME0LCeN5Kis7Z5qCdWpTPSAYRrHR+xQ8hcwKIMlNTtLa5sZNqJ
	Z/CCvBBbgf9KsbpG0qY1A7q5bzf6HBjA+/mWVdyfIMTpDJ9946m5AEJlKayzji2E
	cSntZ7w5K1MYVSI1OEJkteKoBZR+tfIggow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kagrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 00:45:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28a5b8b12bbso156400295ad.2
        for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 17:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761093957; x=1761698757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoVdk+R2177hR21peGq1tgmUNMOo/3hzUkCrdH8m2TI=;
        b=kLsyqfZaiT3quBv0mmVsD3D3mf6EqIrzm6VKOHbnJEAi215BlSsicDzfnUklL4RJ74
         UFro5ryLUtqNeCBdap1Q6YU5jbW/r8xnfrat9/1KOawYyjg7UpSl5RJ3rFe6IZoz1YDw
         1GRQ57inuJRezfnfdq+HdM5A4M4qrqwU7k4N6SijeE2aQxjd20Z5tjMEATpbEPjOItvT
         g5/IpX4r0OHMLFqGNlGZ01/VxiVXvhz89wy6dyOrOGimoDLHDZwGfOwS9mkyA2QFyZh1
         ZyfVq67qyIZN3PGfddEiWul7FLRQhz2qeJRz3DfbYDYNlxrOHCwb+WDCW2sCBIt/NFvF
         fE4A==
X-Forwarded-Encrypted: i=1; AJvYcCXjrYHyqNJ8NsX62UjR/dCIiHykaPeYjHCmPZs7Ne8L9KgcLoAjSlD9qUO/F/GuNuXnVXu0wCtAMsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfMq852wOoxmPizO0uw1yPQd6R8WBZlMSDufmtya4iCCrqFhDw
	OgjFOdMmpms+lykFq2SocoHu7/SHQF//5VzJPAnTTYX7LL50n9gQ3zMjDny3arYb0Y39bMEhkcA
	GUfza9TwlUYcxsCk7MwSVfeFPwI9hWyN2sTnxQ52gm2DIbGrhaUt375JpVJ0izfQ=
X-Gm-Gg: ASbGnctQGrh7IA60zm0qNtAG3VsHaWHDB0MTQ8+LdIiU1ARDvl/gA4LR3bmoF+JoPKK
	wDElCrXw2X0xsLsDHOyVnQrCyIGbKDq6W3O22Njn/hgjKUQ+DfU09G3Zf3tKQ+PO4MyobDK/fJb
	gDU4CYrYKBRX/UQA9YhX3pkpO5fMTRR6M2gBwhT2piN6eLedFiH31Fsja+G2jWM+NLQXqQQDZwj
	DWBGLD0/8vz5tmVC3B2BSaFNtHs6CP6YSn+scGv9BsWWUsQaFPiEBnKXHt3P2MOqjzyGPPQGJJd
	Xb0kBGllI62PBUcXHlr+6cdZg4GpHXMv8hG6vPkhCk4B/LJKjYETgRyf0LY9ur8BBFqb0KLkIlK
	l+IJeSzZfJPYet3AO2Q7N9r51S7wsnoLd3Srqer/bIP/FNXFm5STPe2S5Eqyn+g==
X-Received: by 2002:a17:903:1106:b0:27e:f07c:8413 with SMTP id d9443c01a7336-290c9cf8f3amr209465625ad.9.1761093957083;
        Tue, 21 Oct 2025 17:45:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAil/FD0eyE9wxbuEjh9p2COtE3nPDA77TDJ8rM4VH2xnt/n4RjQN/WjfhsGu8C/XoxIsf+w==
X-Received: by 2002:a17:903:1106:b0:27e:f07c:8413 with SMTP id d9443c01a7336-290c9cf8f3amr209465335ad.9.1761093956642;
        Tue, 21 Oct 2025 17:45:56 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcf67sm121913045ad.15.2025.10.21.17.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 17:45:56 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 0/2] usb: typec: ucsi_glink: Add support UCSI v2
Date: Tue, 21 Oct 2025 17:45:52 -0700
Message-Id: <20251022004554.1956729-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cr47Z0ag0Ipzsae8uRY-SbI7XEYn5oyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX7lNYugTWWwhc
 VWE6yVvazc8Im2l0rqyO0/cjGpmYhARWb8D4LVd3tmiDyyg3NzfeB7Ik/PH1WPB+vtI5nf596Hy
 /d5QFg4kthuIYI7V+SeHq8DNXrGUmmJFP3BJOEgv06ru0VqBLcS7ly+adnlpmzcr3/ZruQX05YK
 jZJTK2Nl5p/vsr1fyaES6ozNVhTVc1eAZvBTSzOCQUvI3n8ZQQwS616zY5Xh4K/c59mZZkYie64
 hkJzk2yUwtNLp4Ha4CboU/wHwB46nQ1CuOV5u8/QTyKi5+B+lRGCP95w5XFGfVuxWYfQHSthoLB
 yQG3c41841nKNf164g0F935uXPJSXzWbS2glS5BqUo3MVwUizqlUx2XToYVG2sp7zDTfva1+uHX
 PGJt2n6//SYIcZKizMLMvgnSdT6oCA==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f82945 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=AXDibm61ZLAIF834zmQA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: cr47Z0ag0Ipzsae8uRY-SbI7XEYn5oyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
16 bytes to 256 bytes each for the message exchange between OPM and PPM
This makes the total buffer size increase from 48 bytes to 528 bytes.
Update the buffer size to support this increase.

While at it also update the UCSI read/request buffers to be packed.
Changes since v5:
 - Added else statement in pmic_glink_ucsi_read_ack() in patch 2/2
 - link: https://lore.kernel.org/all/20251003002044.2944497-1-anjelique.melendez@oss.qualcomm.com/
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

 drivers/usb/typec/ucsi/ucsi_glink.c | 88 ++++++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 14 deletions(-)

-- 
2.34.1


