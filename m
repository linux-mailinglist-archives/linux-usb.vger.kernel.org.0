Return-Path: <linux-usb+bounces-32960-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OIrKasnfmmLWAIAu9opvQ
	(envelope-from <linux-usb+bounces-32960-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 17:02:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 060FDC2E1A
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 17:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DCFC3044BBD
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 16:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C130632938E;
	Sat, 31 Jan 2026 16:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmBXoB9w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Phih8BM9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1194A3C
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 16:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769875289; cv=none; b=sMj25Uer3/B4CTex2D3WnC94FHcxMhhFqz1afn034dFMCdQOGcc3FMCO36M/T7Cva0L9qmY/5Lqi05oNAhLkj1Fbkuk4Ic/qFQp+hoIXtIW4+RX6fFfHOntpz9F7BG7wYOFHWIUVhgDso7QbWK0rUJ9QqoGWGVoFfQ4gKGQrKXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769875289; c=relaxed/simple;
	bh=xiBgi5crv+fPs6Xc+JEo5j6TLEdDqtc83huwsWgxA6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cn4TDPbfl5hHdZyQMTstxPIO51RFqTMxL+451NnWtJRtdwV5/ChNJQUQuKFiahMdbybb/qJQEfrOYko0WgdW70rjoT/TeijgLMYMLSSxtyXFF8PtIZVDRQ1MuO7ZiiHXRPkndf/uJYWRw5Dlng9iAZGoiJZ7eouGo5LzHrhcXsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DmBXoB9w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Phih8BM9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4Tmr6446805
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 16:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4cQ1Da2/HYJ
	SE+5X4ubOuVg8KMM2qhR0qnTEefJaQbU=; b=DmBXoB9w+a+qu51Ev+TheCF/pYj
	mnDEtlknI9H1iuz7sWLtVT5t29gJ/73Y6NF2v/mJSBMpwyb7BnBjAPJndwDvI3cd
	+xuZXrYjEykeOAZdLrviKEW5CAEHc+2c945VmhgfTAxgp6i74AkS/1NdwYdZCNpe
	bBt50XFL3ne+CW+ljJiqRA3b3Fr8przPnEChcuNqSP1reFlE3Pa9lqRx374TCE00
	/m8C8TkDsOGXu8qcEjXL8WTYgO9MpB+5shGjeJ01HCSDsVwAu+i9UqdQnHijH3IK
	+JyqPKrKooOeq5KbHNIrbLPFRyXKeRXScmFAkAYcPHvJ9DIB/sz6q0Ad3ZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arrs31c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 16:01:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a863be8508so41531505ad.2
        for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 08:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769875286; x=1770480086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cQ1Da2/HYJSE+5X4ubOuVg8KMM2qhR0qnTEefJaQbU=;
        b=Phih8BM9LL8IBryivNC/p9CkHeMzltHJ5ERBh/2Ydtr+L7YV4BvXiSTh7fxvMK+i0z
         /zf5MF6F0lwXOxyvflhSAtgGi1FSxZ/Bn4XBCqfv2e/y/nCn7RzxlKRELwgu44jP6Dhu
         LVSXNlRa6Xizv4fzNhE6wtzreimSNrYAUd6o9DqNGpObmDQj4sa0jHFEwBZ0BQI0gFPs
         h5etH126GH36lWu8XlUwCZS5rZJsubEn92HHkF55J2fZlLMy9e+wbz2kVmBVNJ9Z/W9G
         KqZKUGtBFuNbmMC3/+EELJbdtwttQGhoBoA4tg7ky/vHzbZ0CHRv4DMYhSsb8Ec7cv59
         ZIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769875286; x=1770480086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4cQ1Da2/HYJSE+5X4ubOuVg8KMM2qhR0qnTEefJaQbU=;
        b=Vatjt8NQuj5EdyRokCytHNKpflu/hTJIfS+qkcY438n6DyYaiUzV1UKVDE0408ksbW
         JoA6mfJBtpto5jQBo0OUrm6jaIAs/mqx4R7PkQVwthjiynD2D/CTx5QDehwo8KGVT1OA
         1Cbe/rTjYOzFYipPL8VvoRkrVnSXCJB385ei3o+a57JJmULJcOyMB1e+uo/CXWd0+0Cm
         uSV5/uQgU22lZKSM/zo/c9V5FV7B2slcIGW2H2D3t+5rlLYLAmVxlhXeC0Z4eli+zKw8
         koFbT9M/0riJRQX6niJarSQ1j84Ytw4hVc9V4wUaRBh2hZ0Saa1Ch3f7pqH+5NPATHdq
         WF6w==
X-Gm-Message-State: AOJu0YyXMc9nQ9bVZ1SBD0Ll8KTU/Vl7Q2NOZvqqVAcAANBz/kJu24l8
	96x3pgnHbQsWu9epI/0KJRjNMNg/1siREy+qq9LzlSxQzDZXG/FXhaKRE/PMLQeM1/U+oxxoKSW
	+vyAUAHm1XoMjgJ+NThoJnFeOX/+jYb7exIRwvufsN1kJyd+kAbQi0HLWPW9a/hE=
X-Gm-Gg: AZuq6aLpHLd+iXGm5306EXOZJ+U+RAjGt+Ph/jtibDquWunEuUlirG83Z8yt4svyBwd
	T/zadl4aesjCUc+0v3J1SC1AJqc51syamfo4AJAKfLnh5XWik3Ha2eztXzsXzc77Cf7ift013w4
	X2SSOpoXVv2fGhKzhNcXc0tJp+dmiiyASiguuP1OAczpBY9wjEsPKgqmZNeJlqzUljwXP1sSzr+
	GJ5J83qxi5xXHQbdyRP6SBl5bt2ybR3Igp2UA7SrWSVOys/BILY3hyrRTqRHHxW67vlBCQNjUSn
	jYRb7Jfu8ci8QAd0Oznd2Tcb6BH7ekeTtpBaVZ6j7NiK55Y/V3z8lG+czYy8rLsZokehUAF7bNh
	DXJ6Q6QynxOazYTqXNGeIMKp3o7KbGyQ1Kzbdh9H50U35/v8=
X-Received: by 2002:a17:902:e78c:b0:2a1:3cd9:a73a with SMTP id d9443c01a7336-2a8d8163c80mr75090035ad.40.1769875285919;
        Sat, 31 Jan 2026 08:01:25 -0800 (PST)
X-Received: by 2002:a17:902:e78c:b0:2a1:3cd9:a73a with SMTP id d9443c01a7336-2a8d8163c80mr75089645ad.40.1769875285405;
        Sat, 31 Jan 2026 08:01:25 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8bd7654dasm77358295ad.81.2026.01.31.08.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 08:01:24 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>, Sam Day <me@samcday.com>,
        Christian Brauner <brauner@kernel.org>, Chen Ni <nichen@iscas.ac.cn>,
        Mateusz Guzik <mjguzik@gmail.com>, Liang Jie <liangjie@lixiang.com>,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>,
        Owen Gu <guhuinan@xiaomi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 1/2] usb: gadget: f_fs: Use sysfs_emit() in configfs show function
Date: Sat, 31 Jan 2026 21:31:10 +0530
Message-Id: <20260131160111.3161630-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260131160111.3161630-1-krishna.kurapati@oss.qualcomm.com>
References: <20260131160111.3161630-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: py1gGziQCynTfFDgHKJWb9W4jGZN-MOj
X-Authority-Analysis: v=2.4 cv=FNYWBuos c=1 sm=1 tr=0 ts=697e2756 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ds8rhIrxm6W19G1CM2kA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDEzNCBTYWx0ZWRfX72MENK7WC6B8
 PKxosIGE4FGLLwCagrYmMW2yuXXdHDhBcVB5h7CGaYJyfn8Iliykf6Ou0Yhzm+fRy2R65qca7mt
 2c2fn82NulWXikgrOJd5HyShYCFWBNXpTGYCBO6ryomnkCQT3+kAwAv3/pl4dFmhHil3DEU6PKi
 0Ozq5Lxfcg4WSegOIuE6ANMQ5K6PBf+08jHbgvlB1LF7d+v2L8JIn5+ha7PCvt0kw3InUr+hAtM
 zZzPGF42gek0Vl4RRlkBzfb1CpGrnfZNiX/iBxffeMbFJ6H5jCgQuzoAS2oCm3WgPatx3cD962W
 wgxI1qpbz1IR5A78lnmyyBhwDfChM94Wgf5d+kHPmUKHHIF0QpFA7TXiQZNC7ewts7+VA6ekXyn
 vJ+1eAK1qdip0sT9dlPfLGZymb0P54Vsscrk9JhOvoAwK79e+PF7SEjt19itLvBjdkNzxYJ1M4B
 F7U+CB3G531f5bIHHfA==
X-Proofpoint-GUID: py1gGziQCynTfFDgHKJWb9W4jGZN-MOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310134
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-32960-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,zeniv.linux.org.uk,samcday.com,kernel.org,iscas.ac.cn,gmail.com,lixiang.com,lauterbach.com,xiaomi.com,wanadoo.fr];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 060FDC2E1A
X-Rspamd-Action: no action

Use sysfs_emit() instead of sprintf() in configfs attribute show function.
sysfs_emit() is the recommended API for sysfs output as it provides buffer
overflow protection and proper formatting.

No functional changes.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c1826aa2f0f8..80dd42a7f391 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -3981,7 +3981,7 @@ static ssize_t f_fs_opts_ready_show(struct config_item *item, char *page)
 	ready = opts->dev->desc_ready;
 	ffs_dev_unlock();
 
-	return sprintf(page, "%d\n", ready);
+	return sysfs_emit(page, "%d\n", ready);
 }
 
 CONFIGFS_ATTR_RO(f_fs_opts_, ready);
-- 
2.34.1


