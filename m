Return-Path: <linux-usb+bounces-36370-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID/5C8C45mlJ0AEAu9opvQ
	(envelope-from <linux-usb+bounces-36370-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 01:37:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80357434E83
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 01:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D1233053E34
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 23:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B978E2E413;
	Mon, 20 Apr 2026 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y69pm4Sr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FvnVU3V+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006113A9D89
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 23:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776728040; cv=none; b=j2vaKbzViSk5u53IpnacYWMPh3cu1eM9eiKyce3zEHxsGmMjjX+Wyhc5jdVOvFV4V/RwYQCQ7Apkk8vAM7woHbc7wQZ0Tns+tvdLJgOpdPQQF5XtaoMdu+uDrIFx959+izIBRECoKA4G9PfE4lDD4UpH4DntQgZ5pBIhIp7duqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776728040; c=relaxed/simple;
	bh=g2eHBnhqeprT5L86a/SxcLn20kIiQiAhlBDTRdUq0LE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bZpwsq+YP9VOoQ7PaJ6I624qroLMZce2WOk8BRbMYqf7MF0ZwVFssEuQFLRQPOsX0bunAr5wU1d/JTWuKMCMMzBjK8QVlne9PI2/nPcTUcsiV/0ftBhuyuolyeZuBOsXs7/Qbq1fnfx7+J8bdSSV2RGuSwZRhJapEvhPEyHlu7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y69pm4Sr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FvnVU3V+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFdqX21600322
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 23:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=; b=Y69pm4Srn2LCPBjb
	025nTlDFvxjYJhnQGKyOlfHgAiNYtlC/gI/4rGoJzuqRCqMfXlyKM9aTTIFzQ8W5
	sL93/7AMjo4ui/4+2xuW4VoPUYnyo5PjDQyNBUicPT4OoDdgwwgSVWz6xz68Dqe+
	uj9bmjCXEoOI0ldAscc6TGdPSPkjCAnQwmVMtrX5cCyhwXLTEWi5HR24+pZbj5Ez
	OBpAy1+412XNQ/NyPfZek05H29kw+9ojgzeaMvAIfJdzVJjXIoPbpYfiBSxpzbwH
	jqvKl2JGQvPpqMaANSus+/ll75z1TRGYCDHJggWZFK1K8wHFsE29pfVx2PSWDwII
	8S7TcQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh89aw28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 23:33:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a8ea3f1becso10436876d6.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 16:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776728037; x=1777332837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=FvnVU3V+obu/jmW263UTMxVau2h5vra7v+/fSu6PBxtnyRFpfVIDRrgj5k9Wvq6Z7r
         ggi6+uI2C8/TBxLKsBSWgOcXc46PDplOyVyFAQQyUDJ4mWzaoHwBShUTQs8LbqRtRno8
         L0eJ8lE1npHwdmos262bOKQKhzHaNyAHaNJJqWY4bdVbgy0PdNEBweQXVOkwUsQGpWag
         XXGDjtPOb3R+X+DMn1pXqpAtgyNB7h/RrXMCWOHzzgFvEXiTgKk1UBt3VEG4QkDIXq8U
         /2NcZ9rhskW7P0XV03zFugOcklz50rbECjab0AzNDBhdwYWoU78nvxBo1WF3cPowKK+e
         1gWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776728037; x=1777332837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=BkH2dA/CT9kG7klsCJL1851qlsK7xgM89lpy9bL5pQANAW01XfFPJXaMigL6VB1Ijt
         IOJktv3/q1jgbBL9fVFaxAoSaUfvnUkmtpGrM2fgo5kSToXzcfQXr7Gx1KRLWTLb5GCo
         yIAv6GIr2kUO2KF2HtKx49GyDRkKgy1o5xcpWQi3Hayu2Fb0AkVj10f90oMuf2e+ITGq
         hjlaPWwhThJUrytlkPA3QswO+D5Y/vX9ouK9p5a5JS9wBUmmxBoSV6+sQYlA8/4hCPR/
         VSOWwLky7zwiesu4FwybdLJdYGaTC9p70ZS9R3GAWZ6lNexUkci9DWHr2quZYyDC8MT+
         Nc0g==
X-Forwarded-Encrypted: i=1; AFNElJ8w2K6FKlS3SZPj0G/9ttOsvD+e1JtKFvsMzCjCrGUQIhV8gha09f2V8whdTHvkUOO+idZDV4KawiU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0YxDePQ6E3V+Jmsqxrtbe29FgYwDsAm5pFsemRbDT7ehYSazp
	br5/qnwL+eG9CNEU1AHoB4FurBzbfeJ0rXa2KK7XI+nATfmGv+nZnZUlcl3kV9MHBg/IAhozbPW
	odjovo16JcowrMteFL1gaKA0S6zXrEEWCKOKB/gtX/KcKB05Z1mU3wUOkvmTOFDc=
X-Gm-Gg: AeBDievx2aF/r+/uxaT3r5SOGiv12LCjYKDSDeibAOIJjmO+CEaA3R1ZWOw35Ysruh0
	JzAiapImI5qugy4C4KpZZ+XeA/PUpkvArAgYPxjuLu9xIS9boutTqCszKrkNxoS+GNH08lGzqDb
	R2y8ZEbzXERPLoTBZlx/t0w84F5scQeDgeL1HUd4ni4JV+rLZGD7vLiD9EV10l3aqiU2+eOfzKb
	Vo5JUDLVnijt8rlprTIzCVrYsFYKhLBXyFGix9ArSRcxrV0MI7A+6YT8OQae7J7+WV1kj3cgONU
	fn4VeH2jxOpGZ2bSm25WZ/C0Imrdvyio0Uo/xvzcQcFMT8bBZcwFhf7bpl7a5l6IJTmIq0NpDn4
	PqU+348cgZLOePyY8J/psekIK5sBQICijZDqupSdjQX3A4QG626+q9JH31IAT5wJr/8ij6NE1rm
	chBPCpF+g7G6ETi12y7OEUwftSFbHY+vvRtzfwdVE8WkDDrQ==
X-Received: by 2002:ac8:7f0f:0:b0:50d:6557:5c83 with SMTP id d75a77b69052e-50e36c1165emr201698551cf.25.1776728037452;
        Mon, 20 Apr 2026 16:33:57 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:50d:6557:5c83 with SMTP id d75a77b69052e-50e36c1165emr201698051cf.25.1776728036949;
        Mon, 20 Apr 2026 16:33:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc627sm3320714e87.29.2026.04.20.16.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:33:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 02:33:35 +0300
Subject: [PATCH v3 5/6] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-hpd-irq-events-v3-5-44d2bf40dfc2@oss.qualcomm.com>
References: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
In-Reply-To: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=g2eHBnhqeprT5L86a/SxcLn20kIiQiAhlBDTRdUq0LE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5rfNYm08F+v71xJY6cvWWJprHmt/2yaesAWq3
 fglBTG+jpeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaea3zQAKCRCLPIo+Aiko
 1XkBB/0WgdqQ1mhHWgsx/7ld0lJj3i66+rbrFpJxidzADlKQPAxm48ED3/gjv79sb4e5wUwCCXA
 /gz6xF/8U0cGItse/+TQFlWdhxMszRjOOrDo8nOwrVTlmspph9v61iJ9K0Xf8OeIOcC7VsdrVVO
 OEJloUwiJIFWdfUu2QyAunkDTkyXzO3iDTVXVcHGiezrOQ5QhoBxoVdYWSRommd9qAfZifIZNfP
 zGytUeE3Nn3tPlgtHIYsjG51CCx1FtdhO4CDkFl6XbOCBym2qudhC9uSPOYMJRJ9fC9dH7pkgyB
 ex0y3TB3oJTq5/Kwh0Q3aj02bHOTscIcHIECopeUpmsZOzeS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMCBTYWx0ZWRfX603n4CNmnalO
 4eLmwVQpDn4ERI5YxzVl5CWFUKfhcq3P9lbAAZ05re81vqB4H+B1Z8g5VJCPGT+SyvN8P4SNXCK
 5HPxhLckF9/oiK/Exs/h2VXGhO+0uJ+ecZ7l7SrY6leUwiVa7cpL3SmBY0cPrLB4kLwjCips/xp
 DJ89o4IBHajhzlRILf7cA/SO7l8yA0yb+idOWuoscT9KW8Y4DWIDTkXVCOts7c1RcQIRV5Z2GIt
 wqfLqfbnF5TFmp8AiDkECZJK+YOU7AStJJPvLeOFRmGT7+DQnziyiqF29GpBjQe5Q9vxrs/Pjqt
 hVTWkP+/FZz2nvxQqu0xB/WaKRFty2Q26ClchAuk/hKT4p8ZvLTaChGnjdFkJa1I5NBG+pNFqaP
 lVWOTCBgcsEZ//kAMayCf9lrL9InB65DuL2M7djYMjrh3TjrBVc3AIr75Mn/5jujEGTBO1QVcnO
 P6zwubzow42uUqZjh8g==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e6b7e6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=QzDdqdBtNhq9Kz3vvWgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 5jBf82MnyvnS_qdGoGdfwWIJUdnwPwet
X-Proofpoint-GUID: 5jBf82MnyvnS_qdGoGdfwWIJUdnwPwet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200230
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36370-lists,linux-usb=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 80357434E83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
the DisplayPort driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..946eb20b8f83 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3


