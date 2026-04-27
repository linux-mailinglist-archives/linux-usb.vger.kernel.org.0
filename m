Return-Path: <linux-usb+bounces-36501-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CgZIcAJ72n14QAAu9opvQ
	(envelope-from <linux-usb+bounces-36501-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:01:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F2F46DF76
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 229233006D66
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 07:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E742F39099C;
	Mon, 27 Apr 2026 07:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbPo/CTd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZFjOMu6A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59979370D62
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273253; cv=none; b=a8RM0qGfJZjLGw/NVAVQPkEAcNuXyCk9dqVGws3tIl4iHn64Ugex7cGvl/I9c9jVWUEJbg4ou5W29YJe9TS5b2xXsqYSiuF8ykBk//D1xrFHOP4VCZO5OP3XVYzQ8v0bncljjBCpSzxHBM+gDPhETiY00EDSWH2kJm5Xp51wmug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273253; c=relaxed/simple;
	bh=JGNSq690wg01fTJ6rahHFerhs4Oh4Eua11CdfuxCEPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QJHFp6r5R2TiwUwMAOoimPWfMpALOU+SzpbUsp27eaonkhylntTyV6njwt6+hqljPGzb2A8eO2M/3Oyk7yaV++VAsIusU/blkkaV+smz2LznDdgNHltd3xmB1IMOg/bRjlJBPRJeGm0pH9cfxBELXqkvgNMPKDDTJTfXEbSGQUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbPo/CTd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZFjOMu6A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R4bqAf2387970
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 07:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2noFOt6s1RRzT38f93pKYK77wkjlKoO1L7c
	jckqJr4c=; b=hbPo/CTdUU37j5jamuvIKPHWY9+i810+wWXJ8gnZ8ciDiODtFdz
	ERI7lfe5VEDDt1ly2JCrkOLfK99PMLd7kPXWk4kQbV068Tn+BB/CG6TBY3nVvE1b
	508qpEyGB8wFrmhH96CzRHaJFtI4UTm2teuzM9wTOjk0j+SYvaWd9naqsXP08wuI
	24iZeLEx58yShSYvVPddH3Fr5YHcisSxzwyw0Hqaz1KEqVBLIBBMLBpF0xqR/nAQ
	nFj8FymiMYQYruKNSopAs5Gbm57gMg6VNdoZ2JIYKv0RPyVDBmEUO4tYioUETvnv
	GZth8kr75QelAo+c1gSdB3DC6h0qT7C8SDw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw4tk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 07:00:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50edf01172bso188506781cf.2
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 00:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273249; x=1777878049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2noFOt6s1RRzT38f93pKYK77wkjlKoO1L7cjckqJr4c=;
        b=ZFjOMu6Ag2J2gcMpqclrhKEJtOo/JWOysRl+WL3cunVDT7hraDKHlVrlQtoDtq1z5n
         G439TSq7lctut7AcXu7z7REH2AiFiEk3e87rF67TJ43edRh1D+1qGFIWX5+MYXUbdpUH
         LwptTGJTG9WuxUXaFXavqyAVi4TxlHhrkG9mi5GdMmZHp0m314CNcIXp05c2pvxfyueS
         eTQWN1RcGO/nbZ53uxVs4ordkaCKllAgjl8IFml8oZ+hOk88hxqy2mz9xIhOLuVOhleM
         ZdFcOAgLm1QhAO6lqSg9Z58sXRf4NAHGMNegQZ4NUPqLyIcUmN4y2ZyYFr1UlArGhUPp
         Hlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273249; x=1777878049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2noFOt6s1RRzT38f93pKYK77wkjlKoO1L7cjckqJr4c=;
        b=Epidxv/YqUFxdD6qZrgc6WfoOfjcamzDnQHsX5V3m0e45GJa9e/XpMWrkPbLnhCOG5
         ajHqkovdo7bZe0jkdBP0EKCMI+KncEwc0fvVlWWQVQLLcAX7wQXgLyGi5+AZtwtLk59F
         J2UV0E7mxAZCHpz/RdFsTzcx/KdG6qzlsqsMTMmKfEmUmyfSPwB9TNOXph6JTcyYFq4D
         R4iV5rx8P9ikNpWg8UnnbwZ9cTxZ0Y3oqp6kDolrcdlvhMQRub+5pgW0VhQdp7yQOrmj
         lXDod2Jv29Yix5slr0tknbkGALhYrrvlHkxZ2m3f+eel7V8D5HJz9yRzykwmVrC+XZQr
         +zhg==
X-Forwarded-Encrypted: i=1; AFNElJ/O4ABEd0aPuxHhQTkRTY5s2IHtOpTJrX9i0eTq/W1cmawcQW3pvYBs/IYAgUv+rsLoEiZLG3fdSyM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4as7tHp3w6pMWIYZN7qfd23xzDfPmDZssNlOj5JdVhoEnw4uO
	6gcGidK1Hpoe+PvvZdu6rdhRWph18Q3WflrfMu/BTW5Gym1ZK1pfIOie94w87f1NxdLpIoaiJek
	TvQ4kvp+lesZpNRWNQguTlCG8xk3aulJNHDCy9m57oYID4Ml7sJENrdopjiIEsvY=
X-Gm-Gg: AeBDiescbzldHGsjAFeHK1AbJoHefMYsavZEqd2QgkN+NdHQc1GhIGI4mIE883jCc19
	KoCz/BEsfZocEKzU6HiKvF0ibSboGcoYH3SMU5kbVG5Lpl6awC3iHg6hhI6/CsCE8WW8WGBDhQi
	eynfht4CeIUlDoLNm1U84RLCdc4MXeAF9cBFRi07/lY/Et0OjrGRhUccz9hAiPLKg+jjIKoUOTJ
	T0nJ+FuVQszeIQx9eEr7E56wWkX8w+kBuJHgRLsmc1odEYxny59+RMjeH5eyc0Gv36MJveAe1Ix
	Cl1cKolZiqtbuz9RRyThZDMpZGzbxdAuvHw1b0J2O27TzcBfLjniUMhwI0FgKhjgXzhdi3oOnEq
	fd4lQx7uIC15p/u9jfbbEZJ/puFi6Fhoc7wzE4gx7SCqV7OTxQrHQE0uMRoyyxnkMi/eM0BEONh
	vXVeSmSmSWjg==
X-Received: by 2002:ac8:7d4a:0:b0:50f:aeaf:b127 with SMTP id d75a77b69052e-50faeafc0a0mr418136531cf.53.1777273248695;
        Mon, 27 Apr 2026 00:00:48 -0700 (PDT)
X-Received: by 2002:ac8:7d4a:0:b0:50f:aeaf:b127 with SMTP id d75a77b69052e-50faeafc0a0mr418135641cf.53.1777273247940;
        Mon, 27 Apr 2026 00:00:47 -0700 (PDT)
Received: from quoll (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a166sm77794640f8f.19.2026.04.27.00.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:00:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] USB: qcom: Unify user-visible "Qualcomm" name
Date: Mon, 27 Apr 2026 09:00:45 +0200
Message-ID: <20260427070044.17974-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JGNSq690wg01fTJ6rahHFerhs4Oh4Eua11CdfuxCEPs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7wmcbavafihL2sqE2uvD6YHS+VB3KMbSZ+NUE
 hwz28X9L+yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCae8JnAAKCRDBN2bmhouD
 1853D/9W9yJe7w/7hu26FpiH+c/ITI7QjckbusRgUFYg5+UbyWPanz85DLUgnYY8REypHmG+g/7
 hsFupovSMBZRy8MvMtKJToC0gMEDnqPteVR/kXE3moHC3vXmNMrLo64K09agKEGEi97fo05tFrt
 fafZorc0iM0Grcie715HwWx8M4EGFeu1XmZ3puh/3zxtzxfDIP6bODUiguduDRx9N2fTlUfkM64
 qelfNvboJDpF6PQLiAxdsk4xZDK6B3hrk44LsmD2JBq2bsOQrHGhBhkl3t1n6oL1jASTBg74j7+
 /SO9rKMQPZ9QVuVM8SYRQaLW236A/ipp9nXZ6iQRVf221H4N0E6ZCCO3QubWO0byzubQLXoW7Jl
 KzWcFmKbqdGfz5TItL5IEdgL7JLO2uvms0hdA4Plsdm3iAgHC/+6nZurLO+ygOI+SwXRI7YW4nT
 Z5K+YmNzFvbSBw4wgOIk7AudgNFVweDWB6TTx2r48cYHaD2Ywk0Q59gOS+RCefzpzTEcCKbFDNw
 CeAy20qP2oTD4Ur64a94Yq/8O1pNCttjZ8y6TcL3hTjGK+WYRH6okz1qKnUY1GadNwt86jt1G3U
 6K6+e+YEEFLLjhr4NhPq2W1VMeCMGTmyi93gJl/KgAj0WWlgUuDu11NgxCuKqHwfBzRQwcaGgiP h8n+pgs4FDK/hOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MyBTYWx0ZWRfX/FoozlB1LV+j
 XsPFmyrUyx4rnVnop+StHKdCA5c6fBRkQ6L6O++xVhYWJeK0e0N4tc6A3phyxP4x89wlk38m8bT
 02TxwXY7v/kEcj0asNkh3HVp+Wi86AYhhZh59vHSRCdim4tzneQ03R+6n/Kzfm7pY39FJHmiiMi
 iFg74UecbHOQ2zlKuYl76ZcnvfgRNMTRo7NEfKgZ89LZmXyQ8DvZKrLK47VpN6itU+/mWU+ZPva
 h8h210u71xFfyBs/JVqiVZ3bZalZGWVEkYE3lcuStE2WDl7WmbesRr1rfbCS0IHEMR9GBMtEEtl
 CYFGpzH+5iGTLp0ZaW/2T/v6ebCp9ySyWtyWXFYSJ5Qw+pVP6HbzbSO0vj5RR/DDkBI/mPfxG2G
 V7fZfh9fu8fSLpQUKOrSu5KbWoeY/rK3anDlE2pLnnk0wykzuiHdp2O8HQw2vIPNWmuMg8faiYe
 gGiPi+usQMdhHhnOifQ==
X-Proofpoint-ORIG-GUID: PG4F7_IqrXnrh6bE4lzps4DouJ_IYH6j
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69ef09a1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=nnYKl1aPHK5ktf5uHVwi7Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XNgau8SRxIOjiplQv84A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: PG4F7_IqrXnrh6bE4lzps4DouJ_IYH6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270073
X-Rspamd-Queue-Id: 40F2F46DF76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36501-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/usb/misc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 0b56b773dbdf..91b62acb537b 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -145,7 +145,7 @@ config USB_APPLEDISPLAY
 	  Displays over USB. This driver provides a sysfs interface.
 
 config USB_QCOM_EUD
-	tristate "QCOM Embedded USB Debugger(EUD) Driver"
+	tristate "Qualcomm Embedded USB Debugger(EUD) Driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_SCM
 	select USB_ROLE_SWITCH
-- 
2.51.0


