Return-Path: <linux-usb+bounces-37758-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HIEAnWCDWrUyQUAu9opvQ
	(envelope-from <linux-usb+bounces-37758-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 11:44:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDEB58B01F
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 11:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB80B3064A4D
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 09:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD7E3CBE84;
	Wed, 20 May 2026 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyXTwlq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApF60oeZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A9F3BB9F5
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269973; cv=none; b=igvh+QND0WlgfS5QHp5rnk30YoqKC0X1/HFxdTCnXi2ZNLVhI5sgYXfFPrAkzTC8Ol7osimDJUSjJlp9of3Dc07Y98E/hC6uBl93FHU/2ObLYVYq4yFZUHvDSsd2qjXF4OutueWVanRTfaKaAXkoNjtdCQ/ZupUynVlPmWbc/pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269973; c=relaxed/simple;
	bh=nyUTaJzP8toGAdl8HalTJ9lS9wZuuQpE6XykKghAhR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUWrzQMBvz8zuCFXQUcPcBEp6m1/qu+PLJSS7oZuZbRVWBM2XH97qYm+BU+rv//hk1KnAqOqOWwq8Gq0MDvyjFyus4DfFnnITtEi2wzplXq0bY4REZcL4PeLzb5XGP1QwQsq871cORxcqO07nZ/ZCG67q5iVFM5DiwIb3taKbj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyXTwlq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApF60oeZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7ZSjm341432
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 09:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RzwAq0zllA/
	1JavPJ3XlwFBcA15VZo8BZL5M1whyRJE=; b=YyXTwlq+7GbDNph5kyfsirCTIjN
	AYOykHnXxzu4KIBbjP2r/Gh+KsCWh14kNgVKxNBlWczX9/6YX4jl2wmwhjU1o5F/
	We/jXO2G1Xyazce7dQaNSFlbiGbjs0h0R+Hfw5x3sGTm8Q/zDnsXLgu86UxzDZ/l
	X8qDihS01AU85KFXVFVbXDjCH74v4gBs7hcIshzO4qmP0Nj3OsLx9VYDF+QJSWXo
	lYc6jQKv1tl+JFC49o3erl5UYjm6+tAaxHlCXVigHvh+y0X2Zhr5aOa39U8AoRNa
	XZVKfGauHoniTSJZP4H9QR3L3L+njrXgcA1taBLRscO5WBJep8tKVbdi70A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3vc2gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 09:39:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba838d3fa4so45118275ad.3
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779269961; x=1779874761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzwAq0zllA/1JavPJ3XlwFBcA15VZo8BZL5M1whyRJE=;
        b=ApF60oeZVkJYBgpQRqAQ/iicNBluyKxCPfCVVWe1fQ/jPc2T1woqAYMNoHN5AJAH7F
         RR6EOeqfg7cpI4WfXEeybGYv6aw5kfL0UxE2GHnbpvL6F1E0yoiUHJQkJPEgicaM1oXW
         D5bY4FAL99b9eXNEbFwzKL5Eeqo5i3KPISvxMSMhs8n5hmidw+aWKwNmicQ8zUyvHkgV
         K/arwZHMy5ncUQcQsjcxyKPcFX/+J1CdC9nch6nLJuV4bFoazvYwp/s44ElxscoPCtMe
         mmMIrl8+9ytygJOKHFV9/eK2HTYN1OnCe8VcUZI0PvC8i5x5CU2n3nNWCmK49uzSaTY9
         Nk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269961; x=1779874761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzwAq0zllA/1JavPJ3XlwFBcA15VZo8BZL5M1whyRJE=;
        b=E5xh6X9J1Dq4Xuz13Gz3fK33/OeGRXYuAWiNUASxBhELyqZwBKGjMPVOlW7VpS9v7u
         GVIF3ZlzbW9miGuCtaAo+SJn7TZ2KMr9WCVJZ77JHqVIi/4hmX2EmvNWAfmnRtkRo/6y
         eCXSGz4nBf2L4kNkANM83hAUW/OLcIPMMQ9k+nEIq/tipL/dzsppIBS6wZRvEACvvBeE
         hSzvQOPYISQhvmKpO9Lc/gUiRu4fwMuNZezmkR8JwM3d95BxcuPDB/cLY3CCygu8065n
         xjkxJnsOZVCL39RpRJJbfNqsFieHdbYyCzursnlFLyVsoCoOOhqV3iWVhmyzvlrRAOkq
         yiGA==
X-Gm-Message-State: AOJu0YyAVknLBg0s2qZ1sCVV/O+/A1jN5z3Us0bG8hQDOfv2S6FFFLzC
	mOQK9OlJHx2LLad/fIg/jzZPXzfaWh+zxtQMorgahj6kPyYFuk5tModlRqXyTI890I1S28dGF4d
	07SzJoFb4I4maf0Ugvwii+VIdjOl1pOmQX6wpkFKAkmzUe1gWF0iY6tfxW4VvDLQ=
X-Gm-Gg: Acq92OGRZ/vTsIi1IVkybSgvuuyAP89+d8jKyB5XDOlfFWAV94HyfEeowxTjDDK1YPE
	KD4s7HIIQwSeOJUnVtIJDysVFlaqAI1G2q3z7HSNXjPqcUvLXtXk0LJnQdPTbEo+WNiONmNjd4s
	UTxmdj3BSIGgkAovX+IQf9wJdrcSwej7QP3TlXFXpqoNQw/sYaN2f5Q1UO+ypOXAkyj4yH6nB05
	K3CTTaiRaFuD1j04hrLiOjnxDkjUcTJAtG544JLcFmxx136CSy7KTtU1oxCmElhPe5MMMW6RoHw
	JUNA3xdwLennZcy5jPjV7/Re6YayIlBlnwTk7HBtfrF5ZgSvOSw7Tbzyou+xgaq6kmZRDO/xCU8
	1ngmY0eof861nhLvYOov28HhTT0a9Dte0FL/HwabvGnfk7/vw/g==
X-Received: by 2002:a17:902:b181:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bd7e862606mr167294815ad.1.1779269960988;
        Wed, 20 May 2026 02:39:20 -0700 (PDT)
X-Received: by 2002:a17:902:b181:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bd7e862606mr167294695ad.1.1779269960550;
        Wed, 20 May 2026 02:39:20 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8baesm217052215ad.47.2026.05.20.02.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:39:20 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] usb: ucsi: ccg: Add support for CYPD6129 (CCG6)
Date: Wed, 20 May 2026 15:07:34 +0530
Message-ID: <20260520093902.2064730-4-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rlxYR8Te6Fg_KQbQBe1R0v7j7S9UMnQJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MSBTYWx0ZWRfX8viqoqfXjJiV
 Dc91pS7weoexqSdFghvTCJR9tLN30xnbwCPgTPskDLR/VAK0DOSzCem6LL9uFtln0LYenUdqzBV
 BdlEwqHDjXMBloXgoh+3Y63KET7LyHxG59kAidbx2ZhSqFTcKDrLUYYIbWHOGgjkiEY5Zl+bfXX
 ICx5j2BcvNPBuNW7sP1ptBPO/fiz1zL2jHDCvEOiBngVKPuIGphTx06YbzfL6XF7RDkQgRMuHHB
 DAqdnRrz2I6poQnSntfuljXOAUbM2iIcVJkxHaikDF7ZtQqJ+UzXqCS/0bWeGnGgroJnWMVsHA/
 ZAurR2CRYREiv3y3dpcVeYDdZ9ugbCcFUOB/NY9hBnahdtlJyCnkrnw6KtrkaXwxI9gfuORfF+I
 iNpCHpkE8EuqU2ki5u3wLylrS8mxbLqvVM9LRCwxz4tfqvJCRck5iS+egtm8PTChNpLRi/gK7ex
 N1ydtCDGbfWp0cHxL9Q==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0d814a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=0svvs9ifJEUDWjkQtegA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: rlxYR8Te6Fg_KQbQBe1R0v7j7S9UMnQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200091
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37758-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BDDEB58B01F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add "cypress,cypd6129" to the UCSI CCG driver match table so the driver
can bind to CCG6-based platforms using this controller.

This is required for monza SOM USB-C support.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 199799b319c2..0695ce348135 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1520,6 +1520,7 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 static const struct of_device_id ucsi_ccg_of_match_table[] = {
 		{ .compatible = "cypress,cypd4226", },
+		{ .compatible = "cypress,cypd6129", },
 		{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
-- 
2.43.0


