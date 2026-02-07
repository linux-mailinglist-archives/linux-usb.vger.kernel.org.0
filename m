Return-Path: <linux-usb+bounces-33160-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KFvKsMWh2nBTQQAu9opvQ
	(envelope-from <linux-usb+bounces-33160-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Feb 2026 11:41:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D22A10594D
	for <lists+linux-usb@lfdr.de>; Sat, 07 Feb 2026 11:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B509302795B
	for <lists+linux-usb@lfdr.de>; Sat,  7 Feb 2026 10:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95CC33E346;
	Sat,  7 Feb 2026 10:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYrtw/AE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgvoZbWz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541083385A5
	for <linux-usb@vger.kernel.org>; Sat,  7 Feb 2026 10:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460855; cv=none; b=r7sIdutaeli8JQAqIM/6RVjGiU91qzWhfLL0MqLWEq4O8sAMKJljNkA7b4dlZTMe7ncAObT1LttS4AjBw/nSN8sBgCPduckh4CVZT/fMgOzhot3J5ToYcV7t1GYGmaZ/PnVwr0YSBqhbUV35sQdYifLw29XeljSTD8Ym2frjrvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460855; c=relaxed/simple;
	bh=Btnq49XorOH3N/Gj+6SbZqBgjJYUN/tq1x4NuTSnaXs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZvV+q10kJACjW3E6BvLvqUgyorquMflDKPwr1pkK3KEC8KnVsxh0D5NQbvO6AmZbFM/GibRwKC2Pm322ua7/ewGBQKQAmYJ7VWs4SHjecJzRl6HaUh67Oa24To3ywOmAULLJRf9hWFvA04udt0htYpiKvnT1MryCLwMa0LwKYkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYrtw/AE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgvoZbWz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174Rlhr2230705
	for <linux-usb@vger.kernel.org>; Sat, 7 Feb 2026 10:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCw7wSL4eGHs+p13won9KVzKu1j034CJcclFyyJMlEs=; b=GYrtw/AEZqpHs3Vf
	C0yazVgvvhdM4ledK+f2K1QS3Mzh1vJq+Vgc/CySD6Ja3Zqe1doQUwncaXjxduKk
	NB3Vl7+UlP26dFgfuvUuzzMez9vrNchFzHF4/x3b+YxLrysEvHGI9d/IXvTQ5eKx
	7itDffzklrsDoLFcekTQs+KmMKfj9Or3DSkI9OraBnVL6CwNlx+ERqjzujNI4YGD
	DwtI3f8cwCv6aRJajkXDGMd+kbvQ3V9rLWdbxR2+GhkKmD+ZmP6dcoFhhWAvpdTW
	Ri+9S7eb8yTXI6QwEynS8eZ2BNyZG9NTz9qOqp3jKYwfE1kAh2Wk4Zwwt9iFs/KF
	DzXd8A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xd0rhhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 07 Feb 2026 10:40:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70a08daf3so729045085a.3
        for <linux-usb@vger.kernel.org>; Sat, 07 Feb 2026 02:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770460854; x=1771065654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCw7wSL4eGHs+p13won9KVzKu1j034CJcclFyyJMlEs=;
        b=IgvoZbWzeZ7WJah1XPnnrhokbcqPsKIF9YnFXrnp9JqtAfVvczgx5LQGu7kCYvdtM/
         sjfCNbsGQYw3jH4RKP7SmwfrfXJWZ++hH0DL4dtOGmVM2CwPLW4RVf02Eeh9PjX9TKgh
         fdO7HnqvOJMBzpsvkMVMT7NY6btFwgPZPL/ovcCQPQBgQj0u7Z/BBFGKXuj4WpHavaSL
         SECGKiIQ5X+zD4M0FcylsgPyKPlPv5FYB2yMzEdkeYLScM0ETtAuUGwIp5D7tUAI+OQu
         w9ntJIG/Xo4zDeOV5YC60gChxARoXlqvWkLQz7XAV0lLEGAfoCC+esT14W/DID6GhMyT
         Eabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460854; x=1771065654;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mCw7wSL4eGHs+p13won9KVzKu1j034CJcclFyyJMlEs=;
        b=bRF0kVAnAXOfVxarizVUIOEhD4qduM6WFRkPJsBZcNSNBS2zv+O33Jku0cFUnwcC2r
         XANj2sCNOMXUle6Mh88zIE9C5VBPvkkeghxERUlW5C7efm49PDD1ToavTs6y5RjhdcmI
         UwSp35q9Gm0qXd8vS4++SHeLALWGd+wM7ls6JW7LamjAfKZdVJM1ixT633hvgVP1Q7OQ
         1XpJCf4hcKaLRnXb1zgBlXE5fM+K2nnpFMjTjZqfEe1LhF0zWM87fpnxdnMBH7jSYgGI
         gjUuIda35yqXmryGZBkeuyCPrtB6NG7bxrP3xg94ULsGAAzedJ8b11BKeZ4ftF+T4xCR
         GeUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmgxRh5un1+E0g0OMKRJHaYSrq3JQgyL/FMbIYHwFTKM6Wxt6xA3k61hkYD/2zs+QtOZ/tHkW55k8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl0TBPme+x+/ipSAtheJeHb5lVD4fKrfMww8NGMEMF2OAu2I4U
	QUf3RnJUHYwr8wqBW22IqWqBEThNDcds/J6JV7DhSGiVZmyGAIXtZs4lBX7w5cwr+Fjb/aNZTSQ
	Odk3gmNRTbUaRezSKfqmGePGj2t4+pn1KbBuZPvIeT6xQvYWDq6N3NPCpUoX0tGw=
X-Gm-Gg: AZuq6aKWRWMha8dJoROLhQVePczZZ/ZsFAO1NE2bSA7u5PGrQJ/NFcfSMQCcDMTMNvX
	bUNXn/UbG5CDuxcPzeUN9vyztSf0/OKAUJ1cv6I+IQO7/PhMnnPphbGVcBzc6oS74yXyL4VMKAZ
	b+EkwtHpCuPwDOXwsNzL0bvsTWDw/pXdPyaIomrwUHgW8l3IvyGmFzQsd95iuue9oVflzTzUhB1
	nc16l714m0n8lMYSsq9kLb5nDw9EGp0QiRiZdsD7HBzirLtNRkPxF4ErboVNME8POKKex0NrUyN
	3VbBvIsmP290/aGWDfTI5dIhgD4Hcss4h5fV+CoESrtx8WHKz5wbQzk5aeeDteOFV9R1yasw5Z/
	6GKxqCcFd2c+wU2bm/+uoxpJeK0I5Ir3P6hEdPwt/zkB9rpt7xv/dsBDdHShzaNXboWiDw/8XA+
	rgw6VIyX6XnT4Fcn3Eu5EurAc=
X-Received: by 2002:a05:620a:700d:b0:8be:6733:92ab with SMTP id af79cd13be357-8caec1bf257mr730166985a.0.1770460853716;
        Sat, 07 Feb 2026 02:40:53 -0800 (PST)
X-Received: by 2002:a05:620a:700d:b0:8be:6733:92ab with SMTP id af79cd13be357-8caec1bf257mr730164685a.0.1770460853192;
        Sat, 07 Feb 2026 02:40:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6feasm1244990e87.7.2026.02.07.02.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:40:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
References: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] drm: bridge: anx7625: implement Type-C support
Message-Id: <177046084993.2611002.7265880027469077346.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Feb 2026 12:40:49 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: t9AumM28jAb2hc-8e0noiTQmqxEbsllc
X-Proofpoint-ORIG-GUID: t9AumM28jAb2hc-8e0noiTQmqxEbsllc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA4NCBTYWx0ZWRfXyxmX30b+cB/m
 LrCp4YpY86WslcmlCuO1rMDPEJ8NZR9vc14dhVJ+wp3/jWHQiYIB737iOE+a2pQlnTNPtQptO5V
 n+pAWsiZQMxRPW3aMZXnvHVwYXbt0qRyX99FRWVi9D/5cwct9BPgAbUERu5uYcBN6RKWuIUxf3B
 qIz5qkbpStbh9CB/5rZwQW74WAXwHezoVrTc6nUADK0c1KgjIa3XSzfip13NBoL5DqzM8dn6/wq
 1IgWfEUJn3mjH++iKLYQMeXgtRfNXI4tdNek9j0QmcUqigcYgGqgVhMD7MXz+7TqtcFzr2106h8
 LHDedu0c9e8qo1UTk4lQs1Tp6CiMtxBerdS2ZEsjir4dIFk/qTpyxoQPpnBWvHcppcG3mJ26Kvk
 40gbynxY/qIwos1YvDNNpNPXR0ZexycO6rNbhl1MX4P3y21ABDwNNsmlszO7uTm5xRjeq/r913C
 BcbFrDHIhzWTChtghiA==
X-Authority-Analysis: v=2.4 cv=F+Zat6hN c=1 sm=1 tr=0 ts=698716b6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=_bsLKE6ODhMN5xNVZ6sA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33160-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,analogixsemi.com,linuxfoundation.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D22A10594D
X-Rspamd-Action: no action

On Wed, 21 Jan 2026 12:15:44 +0200, Dmitry Baryshkov wrote:
> ANX7625 can be used to mux converted video stream with the USB signals
> on a Type-C connector. Provide minimal Type-C support necessary for
> ANX7625 to register the Type-C port device and properly respond to data
> / power role events from the Type-C partner.
> 
> Notes:
> - I'm not 100% happy having Type-C code in the DRM subtree. Should I use
>   AUX device and to move Type-C-related code to drivers/usb/typec?
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] dt-bindings: drm/bridge: anx7625: describe Type-C connector
      commit: 1d7532444a32b53ff7344dc52019bab5a4b5ed66
[2/3] drm: bridge: anx7625: implement minimal Type-C support
      commit: f81455b2d3327a5685623e7db4050dbbe5513bc3
[3/3] drm: bridge: anx7625: implement message sending
      commit: 8ad0f7d2e6fdfc4462a5b168ec64d73b7e952ab9

Best regards,
-- 
With best wishes
Dmitry



