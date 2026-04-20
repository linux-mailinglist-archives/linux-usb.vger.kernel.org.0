Return-Path: <linux-usb+bounces-36371-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OrEMgK55mlJ0AEAu9opvQ
	(envelope-from <linux-usb+bounces-36371-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 01:38:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 317EC434EA7
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 01:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 454823065887
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 23:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD15A3CF049;
	Mon, 20 Apr 2026 23:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpvBvE1Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLxn6V8o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9E33CD8CB
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 23:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776728045; cv=none; b=WZ1/y6V5rzTJGXkUVNRLBN2RcFs9YzfNt0dHpmcsaLl88lNq7s0FE6naMjuXbpLVHVj7/4SjLfl4jv953muo2AhyK8jHKOOb3GhE3/K8mE6IQkdqeIP/pyGi3U6YvDUEmHMzsVTe8H4PTYY8GkJy9e5r/+YPw1Nn8m1skGY36KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776728045; c=relaxed/simple;
	bh=mxGolAt7ROQ681cKNciUMVefMdiRDsSwC5zox5THv9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=spdvkJTNClQG4T2f12YpU1jX+zyS/Mq4L8kQa/tqdIz6ESEvHLehytAtx2iYGpYsouHKxD0Zfj0ah74xotNbKQ54CqMAU9dZ/2yOCWlfk6PP7n5AtqvIOiRWdGL7AjfUl7IU92S87Rf+uTwyouhQhXPx/1MAKkaykmFGA0xhafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HpvBvE1Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLxn6V8o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KIrKHd3455270
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 23:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=; b=HpvBvE1QLHNxgFMc
	QoUecGt/rJg9vNlE4G4+5je7Lv52Wc44BKL4NREup+GtkJlzefSb9vMblGPkSi07
	ssTeEQHMaSu89LcWDOxAHa/PJL+Yf8BE0ke+O2jJfO0FpawHKOcX1KLkIqHvcn1E
	gBG+0dRkFjFCmb1LR8re7MIJVF4MmVbox0mXkUWK8uWMxtq09/mu9qzVtW9uZkZA
	xv+A/lnE9lVAnDglO/OJuphfp2iKqnhgqrn6HY4ejWe8pYxvZxopCN2STQcdgeP8
	I2cyMh/ZdSD8PqhlianfkMpq4FGHhh37vXF/fTe9/kimWd6Q1USMiJ9QOyLukYDL
	czPPFw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjufeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 23:34:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca29dcd69so90577666d6.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 16:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776728040; x=1777332840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
        b=cLxn6V8orZuinT8B3D9DZyz3wfumGzTN5OrYuG47hpkOCs5g5U7V9kV5QXGQBmGEcM
         qQJ4dkODmbavBzVAhUi26jgTGCZ4ATZ8BHOy5047Bg3hq1yiOvebuO1pdWseABVnO1Wb
         v24iwQt25hZ/Rm089H2N4fC+hJ6R8QBzTBzR36Hw/D3ahKVSwTyl2IRi/dKbcIAAQBFp
         JI4I+y3x+NmLOYBNOkQkymMMtN/Ex47RuFISWbqtg1wiOsIaBPuUWVJwpRHBa91Nufeq
         j1I4T+vYPp0wYCqAYQjYmRlEgftP2ekJq6keDE9N7KGbUTFBAVdWdg6OjuYbAo3Iwbvj
         KDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776728040; x=1777332840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
        b=EQtn9pGWIMYQgsbgbM+xemz7avtxGsjo8Lq3pSwDLeHdbb5fdunVdaD/IYa0gcOCCO
         YGZI6PztrE9lp3AK70pwiNnX7kGz1xzzq7G+vf6YmnyHKYVxbZns16mQS214glNUtNZa
         canrN+0TyJis382IJxZlldPsbSlbXue7bt0Mp14m0i//5ihcnAHhp8S4q2Fs8X2x+b4H
         dvIuLyKZa+ODc/6nh7/PhnNCQlYhszVqUoVkmbg2ATZPirnZ3xdwXAvDx+UiKEJEMKy7
         n8Firp8PxLho+Efk4zJ+/wQVUJ8ckcHI41FgXM/Hbeqf0eT5ylF+BMYolcr7Y1/y5zy4
         FZmg==
X-Forwarded-Encrypted: i=1; AFNElJ9+SuQeia15nV5QLr0SaxcQFUBRcJVjw4qIjnzBaa70zIIrPoPvivarlnFzRp/IxDX3VoAkkyZHLBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiQfqWpWDutJ+BOqZODew1LWmYniugLRcrr73FI+eZP1/Tbjh3
	c6ZAFGmedeN4WkCu0ZljMZdkr2bnYY9jjMeAVzg4obzDhgbhErPuQ5v+LUKTe10H37S+12lIRMQ
	vnCil8kBSNd1xjfU2urEHDFTHAN5iTbk2LlIHYfzpyiikkDWgHXBL4E5hCj7X9xs=
X-Gm-Gg: AeBDieuwcguY/r61U/m/omLdhEwn8EVoYhJrWbfCQW0AmqwDx8jqeWLtQHJDo19pa5V
	tJrNM6q79uCYUt+0VzKxedI4LcAlZru/6OmKaAl46l+Zi3QMygsJmR8t7Tv9mUz2fD0wAg6TU7s
	PF7IxIFrV51egMpQLotx0f3XbNM+kJeAm0Z4Ko7H8DlPZGwF7wS4ma26nioXs8VWscWDM0KA7qa
	UuRsgODv40mtmSP73sGCnYKNRpM9+fXZudH1wOqEjt3y5r2b5AkOGoZNpi64XF0ZhnZ8vRN9+D1
	J4a1fKyEXkOD0uY3J85fSb5FNQ9xllvhPdqHWrDNhnfXJhEJtVZlscWuztVFg8ZK/1Xkt4Ljp6V
	4LMo9CDuPvJf+yl5masUJeXjH4q2uuD1IRlDhkP0AqzqNdlvJIv2uuZ0bcQfBeGETLA2e6eWAn2
	IuR6z8n/uGxJzSp/l4TKYe3kuhMcEe+6tKkUXNbgkisRkEwQ==
X-Received: by 2002:a05:622a:4245:b0:50d:8056:da41 with SMTP id d75a77b69052e-50e36836149mr208589711cf.2.1776728040276;
        Mon, 20 Apr 2026 16:34:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4245:b0:50d:8056:da41 with SMTP id d75a77b69052e-50e36836149mr208589331cf.2.1776728039743;
        Mon, 20 Apr 2026 16:33:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc627sm3320714e87.29.2026.04.20.16.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:33:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 02:33:36 +0300
Subject: [PATCH v3 6/6] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-hpd-irq-events-v3-6-44d2bf40dfc2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mxGolAt7ROQ681cKNciUMVefMdiRDsSwC5zox5THv9w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5rfNcYA6Kn6vJQasDmoVbhaWkp9oc1LDRkXYb
 fBIXvmCUy2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaea3zQAKCRCLPIo+Aiko
 1R4BB/9GohI0ZFgi+xqrkYGMe/3Udg5Nue1jmSANu/Otqvi7uD155XM2P9LxdiNxtumuSBIOZV0
 ZM2YwJ0094hTPQVf33GGO2TTcvusZV5uQYJ6XLsZYcjreXdNaU7hK/gy3K8J4CDrGah5ai3YG9m
 YPp1Ywnej+ym0q/P04Fko3yj+I+nVVhCJX0grp75+IBHoxlXcN3UQoN52HycYjjeL4oagQReQym
 NR8P+cZwdhtT8RR8dl13lWVTAt92Z7A+IJLUpzga0kyQWAuxOxI4W8RLlO1AGkhOTjPYzfNV+2S
 1iHdUU4TuohfcHIGhYbTI1erKqCzoEvMrcoEnptsZKObh68L
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 3AtyQQOsgcfEmxJhbGVohvuylIVOQ74a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMCBTYWx0ZWRfX1feE1HAO3JSb
 r0FHihMjgRF7PLJkN6dzHrq92B24CRXgunfXUlGqSoXYZAA7lM6u7V9qyDzQo7UQeTgAMrHV0fu
 LMwf0h9gLYGf4ksqYG/2YXple17cocBkWLaq4lrpmAK++VibLIit8K68zmTEzG73k0LJnq+E6HY
 U/bYfLtEFEEzsrKlCGi66IeQeyuJJJS5F2M2rGWNvDIihH0tf0Y5tV5MDYyFyVSf68fMyh93UWq
 dXiVE8T0ZX3HPwb0fv6ggkVudZXE9jmnBcaDPL+1fshAePD5m+HP1JzZ2eH6MmeqZ3LAhWS/6AE
 sEOOgfmN3EGQFM1KlAtfW+sWvxVm6s+UWP3KRRwA7apwAGCFLwG2gBokzZ/tH3ktLZFenibRFQD
 6IfawbZ996Ddc2rv2q3AMJ/wvioM3eM4TpU2xK34ITWercdqrQXs8hh6jGdzxQ+Gv/FZzF74Jxo
 MjBlWdY6XkT13bGMNXw==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e6b7e8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=xNxaoOyMFJLcTYWjjPMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 3AtyQQOsgcfEmxJhbGVohvuylIVOQ74a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-36371-lists,linux-usb=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 317EC434EA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index ca749fde49bd..5e3f887ecbd8 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -299,10 +299,13 @@ static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3


