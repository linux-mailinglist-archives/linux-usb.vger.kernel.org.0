Return-Path: <linux-usb+bounces-32961-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IChTD8cnfmmLWAIAu9opvQ
	(envelope-from <linux-usb+bounces-32961-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 17:03:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BE7C2E21
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 17:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F927304C7DB
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 16:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA11329E73;
	Sat, 31 Jan 2026 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKLgEgrC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AgxwSJGu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DED14A3C
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 16:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769875294; cv=none; b=OU0j/8cv1kbYFXPwe8DfTqUpHvaMHj+VQzXaqznLNCXgZX7Y3c2qCEofP8TaNAYn9QG/9tPZ9G4Sq0AJcwuA42bdxABXomIhvQJdsTl0yFs6TKRQW/TanNushdD6HLhPryWqGsQS49Alm4QECvN3H8kV6oMvVDb8Rxzuo43rfQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769875294; c=relaxed/simple;
	bh=YtIXrMSIXwIPKbELjUkXtzCLCCesoD0kKJ02qZ8/jpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vGFPcJ+2YKc2S3xRHKwDQ2mupvTSE8XqK8R5Osk+52/ZMv7HJgqlqXqORy1i5REdr5tKIx7VjwizyMIj1bXptRVpK+xfDjQG8qd1sP4NlKs1CsJcwnVXqZaisrKO0gMSHdA6Q9XhuN9grZ7WzdwywUELoJkhTyiBJA+8aW05+a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKLgEgrC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AgxwSJGu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4VGjO866595
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 16:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oUD70mRU5x2
	1tG8w1Ex5JyJjlw0djl5gCuQNo11wP28=; b=mKLgEgrC2J1Q1OtGA13p5IB1+67
	WiHfn8UUwjlmcpvIF9DdCyRptCOd08X+T+jYRc6qp4mDFhyk4WQbQ6/WcFGR5VY4
	ri4HJr8j4OKdlz6XHvQMm9RHZngQGYmqp9eQPMMjqpTYSt1L862T5mikr1bVIPxS
	fq+pHRNT3435KSjdgIQ51mucZqKsEysMw3jvRf5iE0ousrlYi3jA1grQ0Tnl64ES
	oIWxwCrmojuheLNbWlECcpPjMDsz+NcetG7fc/zDmI/ASI1I5WwcTu+HgRj99Wa9
	zfxgWKx5l1H3WYaXcgOEgxp4o5DRU5t0aJ8jQX5wycZIwK+v39SIuwik/RA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1asds363-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 16:01:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a8fc061ce1so7617575ad.0
        for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 08:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769875292; x=1770480092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUD70mRU5x21tG8w1Ex5JyJjlw0djl5gCuQNo11wP28=;
        b=AgxwSJGub19DxiuRcDKl0slxeg+youQqxd57ws9LvSqve2X4Rw4i+gH7dCyCRSbW68
         vjO9LwraPpYE0yrSm2mK1CW3vq4VpTbyj27I6xIEFvx8D3sjhdhuVpkak2Y4dhK4p6BB
         DxF4AHzy4CZ3fRlWQr56idL8gu5W+p/SlQVtmMRAvM3iObwcQvtTqZCYuXPA0rpp5qaR
         Tp2forFnsSL2BJczqwaYnDe9gObHdMBOW38aPJQvxowvpE2TgHkCMiEHc5s4gdHWfBB1
         E5IOW0aD7TqrORQ83NvPdc/bCx1SLJHq5iuv5xb4uTa2oX8MoRPzhjnVKxeMDxcDxRGO
         j2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769875292; x=1770480092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oUD70mRU5x21tG8w1Ex5JyJjlw0djl5gCuQNo11wP28=;
        b=hdHOqOMBhkb1eSOIX8IbhQa3SIyJXIq4G/dbHL0iWWyX4cL/EjbuvEuAcmy6e+bjl0
         OuwK2jomUG+39p8/8t7fW5W3GkdzxP5Dz4qgOukElRftEyzzXnfuCLnwdvRlSsrpJVgP
         +MNnruu4+fiK05bYpGLo+BPB708t7yf5fQLva8mSmYEwPydEUMK4++zywr6dCeOchqsA
         afN/BZDHSroHUMRRvyPPDhHPgpk5qNUbqZtFePL2kQ2VIYxAh3jEgWjNeHrdAjmHyWSc
         7iPIGedEctXIS9H54VVb8QQOZXEvtV6hAQD3TylmdoPvu+V+e0PK3rgNNULE0YVzbHxV
         fGDg==
X-Gm-Message-State: AOJu0Yz7okCtB3NsYcMeyIZXz3LaENKllrfCwyXNw322Cao1Bdh4Ybom
	bt2Kbq5uq6P+QBdlKfvWEAZapbju31FQBEf2Nubihl5ECLuks/LDIntL7xEnnEo1puxPjCLyPQl
	JfOu0+DFoNBa5WzG4GxSq67sK0pv76iI9Ww+vwCVEPLA4XWVVKbtkY5KILCX5484=
X-Gm-Gg: AZuq6aLNZ3BLLP+2WdBvF2wa1DB11V+r8gCDJPMCQHI2dMvJXAWu9FIXKfZBcR+h3lR
	5dhdYQPUOs0h5kh22joSUJvqrHJNRDVWx+gIWOLdHg/XpBiGbV9EmL1v6wA9fkUKPyCBI9SUFgc
	IWd/l6iStFuQ0hqmHIQpnEFqHklw8J278z6FtT9sT1I6GQefjediSN9aPkO9RRtiT8k3M1iiO/e
	YRlpuXaf1JBR/SLPOY2j5nIC93tzzju3OkAtuz7KrBIYWhT7Ehg3XDaJf9h+Epd0KuzIYg/I1cw
	uiMeAbSoHIicIm4lE36TMNrOxvq4icg7K7iVQz7USUgSUCvOr0VkfG8Wwd4STPV/fe6uqtf38CH
	1u/FqVeVzw8cKqJjpoIyi99K9EhNAa/YorTEaVEy5W8Dr4lU=
X-Received: by 2002:a17:902:db08:b0:29f:2f40:76c4 with SMTP id d9443c01a7336-2a8d9919165mr67458675ad.34.1769875291730;
        Sat, 31 Jan 2026 08:01:31 -0800 (PST)
X-Received: by 2002:a17:902:db08:b0:29f:2f40:76c4 with SMTP id d9443c01a7336-2a8d9919165mr67458115ad.34.1769875291208;
        Sat, 31 Jan 2026 08:01:31 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8bd7654dasm77358295ad.81.2026.01.31.08.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 08:01:30 -0800 (PST)
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
Subject: [PATCH 2/2] usb: gadget: f_sourcesink: Use sysfs_emit() in configfs show functions
Date: Sat, 31 Jan 2026 21:31:11 +0530
Message-Id: <20260131160111.3161630-3-krishna.kurapati@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDEzNCBTYWx0ZWRfX+3Eu9g7xXt6O
 EUk1I16ew94GxnG7/0MfCMNqZPdvjpPsE9iXGw40QjW6g1azrlrISiTi3RYTA5oQmZCz0S+i+Wu
 9KiO+FXEMKFtvjl6wKVkAN2MfhMpAVwaf6E5rL/NhS7U8cfcLO/oVIZJWmvBmKCbCzyuMr+ZP+C
 Kki21F4jhUABd/i2j8AoXMmkq03RAGOaVHBByPlEqo8/GaCcX0OmpnzAwX7HsTa5YqDwpVpAZPI
 EJ4uWA9UjJnkyPRJYQ2qOirFgrwQ4mw7+fGkn+3ppKze/ZX/5AeVnWgLpC08VJm2/+EVAKiOxhi
 +zwu88WngbUncrKYwqYmsug+qbcjRZ/gOYlu8cPsfrw8VANDZrZa4YEUs/ZM++w1wfLT8YMYzkS
 4kxwKvqii+7o3S/mU9SQg/mJS2/Ivr2SL3JjCsZzmsvjvHojrEp2xNKIBLFQXaxZSNXtnKaqTu8
 B9Q4r8C2oLTIQSJdSuw==
X-Proofpoint-GUID: kBnxHbA50rniX9JNrreTnptLAfHMdeM-
X-Proofpoint-ORIG-GUID: kBnxHbA50rniX9JNrreTnptLAfHMdeM-
X-Authority-Analysis: v=2.4 cv=LNNrgZW9 c=1 sm=1 tr=0 ts=697e275c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8XUvpNRhkjWRse7Hyr4A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310134
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-32961-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,zeniv.linux.org.uk,samcday.com,kernel.org,iscas.ac.cn,gmail.com,lixiang.com,lauterbach.com,xiaomi.com,wanadoo.fr];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93BE7C2E21
X-Rspamd-Action: no action

Use sysfs_emit() instead of sprintf() in configfs attribute show functions.
sysfs_emit() is the recommended API for sysfs output as it provides buffer
overflow protection and proper formatting.

No functional changes.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/gadget/function/f_sourcesink.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
index 22104e9c6cab..e6ca80dba7c8 100644
--- a/drivers/usb/gadget/function/f_sourcesink.c
+++ b/drivers/usb/gadget/function/f_sourcesink.c
@@ -900,7 +900,7 @@ static ssize_t f_ss_opts_pattern_show(struct config_item *item, char *page)
 	int result;
 
 	mutex_lock(&opts->lock);
-	result = sprintf(page, "%u\n", opts->pattern);
+	result = sysfs_emit(page, "%u\n", opts->pattern);
 	mutex_unlock(&opts->lock);
 
 	return result;
@@ -943,7 +943,7 @@ static ssize_t f_ss_opts_isoc_interval_show(struct config_item *item, char *page
 	int result;
 
 	mutex_lock(&opts->lock);
-	result = sprintf(page, "%u\n", opts->isoc_interval);
+	result = sysfs_emit(page, "%u\n", opts->isoc_interval);
 	mutex_unlock(&opts->lock);
 
 	return result;
@@ -986,7 +986,7 @@ static ssize_t f_ss_opts_isoc_maxpacket_show(struct config_item *item, char *pag
 	int result;
 
 	mutex_lock(&opts->lock);
-	result = sprintf(page, "%u\n", opts->isoc_maxpacket);
+	result = sysfs_emit(page, "%u\n", opts->isoc_maxpacket);
 	mutex_unlock(&opts->lock);
 
 	return result;
@@ -1029,7 +1029,7 @@ static ssize_t f_ss_opts_isoc_mult_show(struct config_item *item, char *page)
 	int result;
 
 	mutex_lock(&opts->lock);
-	result = sprintf(page, "%u\n", opts->isoc_mult);
+	result = sysfs_emit(page, "%u\n", opts->isoc_mult);
 	mutex_unlock(&opts->lock);
 
 	return result;
@@ -1072,7 +1072,7 @@ static ssize_t f_ss_opts_isoc_maxburst_show(struct config_item *item, char *page
 	int result;
 
 	mutex_lock(&opts->lock);
-	result = sprintf(page, "%u\n", opts->isoc_maxburst);
+	result = sysfs_emit(page, "%u\n", opts->isoc_maxburst);
 	mutex_unlock(&opts->lock);
 
 	return result;
@@ -1158,7 +1158,7 @@ static ssize_t f_ss_opts_bulk_buflen_show(struct config_item *item, char *page)
 	int result;
 
 	mutex_lock(&opts->lock);
-	result = sprintf(page, "%u\n", opts->bulk_buflen);
+	result = sysfs_emit(page, "%u\n", opts->bulk_buflen);
 	mutex_unlock(&opts->lock);
 
 	return result;
@@ -1196,7 +1196,7 @@ static ssize_t f_ss_opts_bulk_qlen_show(struct config_item *item, char *page)
 	int result;
 
 	mutex_lock(&opts->lock);
-	result = sprintf(page, "%u\n", opts->bulk_qlen);
+	result = sysfs_emit(page, "%u\n", opts->bulk_qlen);
 	mutex_unlock(&opts->lock);
 
 	return result;
@@ -1234,7 +1234,7 @@ static ssize_t f_ss_opts_iso_qlen_show(struct config_item *item, char *page)
 	int result;
 
 	mutex_lock(&opts->lock);
-	result = sprintf(page, "%u\n", opts->iso_qlen);
+	result = sysfs_emit(page, "%u\n", opts->iso_qlen);
 	mutex_unlock(&opts->lock);
 
 	return result;
-- 
2.34.1


