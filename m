Return-Path: <linux-usb+bounces-36369-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IoSDaO45mlJ0AEAu9opvQ
	(envelope-from <linux-usb+bounces-36369-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 01:37:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3E7434E74
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 01:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 554AC30488DC
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 23:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95913CFF79;
	Mon, 20 Apr 2026 23:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwrsUnmI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWeB5kQw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415533CF049
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 23:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776728037; cv=none; b=RcRNKj4mjMcZ74vBvN2aWj70jpO8wQxMqLzah2G4ClRH++J2rFUDV99mzNmomIy+Dh0QuZaeFTsGSUZDz7MHaiNFXpFx63bWNDUjHRfHEvUFsQvej3MPtclHoMjKNWhF7eDTQvfs32sV7BGRjPxVL/mEJeUR9cY5jnEm7BiaUB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776728037; c=relaxed/simple;
	bh=+/ILvBuGhqekKhSlkO02babbVbDbrJeHq8l4XOhAwlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nG8z/7mKiormctXi95iJ7UTRVn1At0clWj/+Lbef1DuMpLElN3i6OuJ+WUWhcysvVsIKbcBTcDJ+BYZPBZQ10OQVDgtKZDRuHJ3dusuawaNfUUUkoLsdMhlw4F+fGzVJ+8CsO4wyVXtiyW4OXBkULhFqOR0spgofXEbWUxyQzNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwrsUnmI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWeB5kQw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KIUGfP1598282
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 23:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=; b=nwrsUnmIe2W0tHvx
	qv+K2ykbluRxeMpFT2z5cR47aB+Ai4q84jOYOhzLWiEQvlTwZ/Ylxc+oJFZDHF2P
	XG9H9qtHUt5eWPtgbsahyI1rREj+jUJxMhKrdGcGQ3gNJXQzyVL8kqJsjZ8V6oO5
	GeFWtC6x5dEAU1JgG5Wkc2S3YgFC1THHWx0rpt6rGyYLPXlWC5MF882vlxVzwyKf
	+bZkCAz+JmswKLySVaHyin6V3uyZvMUz2dNSl2j6oXN68cfxLKkGqjgMox6wwGRd
	ES6mjX9b8rflNFCMSazlxbI5Q4os86OmKU2IQR9C17ryB7+2Uaga4/iYzo/s3fuA
	kK5Jcw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnkmhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 23:33:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50eb8bad331so42346941cf.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 16:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776728033; x=1777332833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
        b=iWeB5kQw1CWbVOs8nT9GB7HJab1a5kJfz2Tcj5YWjtcp/W2ubT/VMuPpSy4WbIEHzj
         xdp2qYNaenSuWr9wARSTFDdlD26JQZA/h/pvaSMbZ20IJCBSWfhbszpO93l34QG0d0ub
         +EAmIoDpKviNSs3Beuj+h4ZbVGC2ivnE6XLwzBOwF5WZIA4mHWH0+G3m1t7bkxzwfrs1
         PS8tK1p67kusSs/Nsqu3hgl1en/KRuYwS9Nsui2VCgk+3pJ2xucp7zvrhV4DAjxX7MrH
         5521MLTmLPfVzF8bQSq5AzziryrxGXa+PfOsbY1hf3CbJE9k4XMQGlWG0UCUcrXVzMCm
         mBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776728033; x=1777332833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
        b=q+4tgZ1qn4CSqIDM45ALhhRIECh8j2NTcEYyttba9usdoGd3ZDXuA62qoI7M9f7cs4
         wgQXMYpu6bhzd93pqnG7Hl9Q60na0eD7A0IRCQ6wHQXylciPabT0PWSW0jY78aR5T4Mu
         0SQOpu/fNO7o0eKLXgrjdOG93hSvjPPlCfui2sysmqOEL+6QlNUX6Glw0Y7lGrgziNth
         aTsmp+rFhs6zptkbm6Z+xO8Ru8D+AgSJ0/Sx3f79WVAHG5BtK0X8JcuYK6lw23Or5Z6U
         MX6tKaSLKGlGO+xMGmMDCH3Y0i1HcsQ1nVg+clm4Qv0YY6g3x4FLx36jKJC9J0R0kkQ0
         wn/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+LyKi8/zP8iqLmnirgcVlWf80kANDmfJcSMB9q043vRw4AD0riwM9IkXFiGcMIR07Njkfy77hwhDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPn0hdB+1rNynDvlGUBW6U46toH6rPUytl/ILiIgDk/UvZVSCf
	JWe8a+k1E2ZCWCThb8s1fMTChBmz8Rja0Rw6bXYR5YgHv/N6O3B4R7fhAypP8iokLj6/q8tXMy4
	J1+YnTXelpdMWhCpgQAC0n+EzfJHr1FZqNSic6R7BDulVd8yzGHK+lBcGlamq8ko=
X-Gm-Gg: AeBDiev+VqF6KZ1B8dIQKP3xrduGgmyg7OL/nklnf9/qOYY5pBXjJ+NB2bUk0M2+NCM
	A1ylO9Pwz8Rv38pUeRMQUXUtmGP/6BEDw5ehaXs6ryrRlxO41jmK+BNMdQBnpkHljZhDmi/a+Eo
	2Hdqp4xU3lVXqt+Ec9jqXb5gG/05/Rk4m1l9n8pjh3Zl2h7r/WD1HXMYU3YD80Mdv3lD6ThP1OC
	BlTJCMaImiRFLfFv/ffPFKsMjiz/9RyqXNLAw9xWgbrN+YD51FevxHiQNLipO5jLM8PbanM6nBj
	CsVradr4S9TRXG0jQijQW91R36UYK5/H58DqhZMe2Aer3YYfbbtK3rD+rrhaR+l4vN4HjcJTFxt
	ozeGGOXQXCj3S71J5AyNTXatYBTYjrHo9v5kXeUMqTaVjMU/1X17BSCMy3LY9GoKdwwMMOKSGri
	rE1QNjrQ2XOkkYeptipx5PU/22ra2/pG9ENnLVsCoHEVmPQg==
X-Received: by 2002:a05:622a:84:b0:50d:912c:c2cb with SMTP id d75a77b69052e-50e36c4d835mr229844471cf.42.1776728033440;
        Mon, 20 Apr 2026 16:33:53 -0700 (PDT)
X-Received: by 2002:a05:622a:84:b0:50d:912c:c2cb with SMTP id d75a77b69052e-50e36c4d835mr229844161cf.42.1776728033013;
        Mon, 20 Apr 2026 16:33:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc627sm3320714e87.29.2026.04.20.16.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:33:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 02:33:34 +0300
Subject: [PATCH v3 4/6] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-hpd-irq-events-v3-4-44d2bf40dfc2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=891;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+/ILvBuGhqekKhSlkO02babbVbDbrJeHq8l4XOhAwlU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5rfNyjFzL4b8IkwF/PF49lz1EuPnWyS8Qxlcr
 U5qoTUzCLWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaea3zQAKCRCLPIo+Aiko
 1ScGCACJMMnjpi9t0iULUWpszlSsI4q7iJwWHegcsGM/iwQvHCyLVAcm8trSNMycKBpkdlIpjgi
 qutScdnn74VcxSgGoQBusOE4JTtC3EwpKjWOu6D9oiMf+ATGfMVtVxG+hErUzl8iWh9g3t9V/j1
 PwQwbR9Iftr5kNio91MsoXuBkTudXywYpgVCcJ37u1V/th8NcezRjcQE1ww78mBhhXwEc6hpKj1
 SgtTJImlf0dgsumqITASw/7XwPheCid49bfS54ITNHRvaeGrnWr/ls0GnSNCyIoD5HBWS5/eeif
 nkxyVQkoGqHHpBIjjlXqa0CLa+2io1+jotp1uhof45783PSW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: NfEJulFA9SDaq_lY24V2mkJzENIR4crL
X-Proofpoint-GUID: NfEJulFA9SDaq_lY24V2mkJzENIR4crL
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e6b7e2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3ML_fINe3tzxlWvVV4AA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMCBTYWx0ZWRfX4AbHu4EAfBzE
 GgjEF+EYgfi4Ca3RowCrmJZ12TEvufBpMWtPivGjkevYBWfJhOv5jjceaiQS8qijQC0wQCULwC6
 oBUDaUY17CnndbC07yAuh8MnLXXsGDvdaqeT/y7/FC0JQIwx+hOAKQUORm7pH6PRs3MnJS05eyT
 Rw3fD4SBokUOsvejG4/b+NfNHe4p+bWD0HZxpB9ZZ8A1KXjpIPmXCtdUpe6u0soGloybaMnIXEW
 EWkg6+Aw90+90/a0Ra/+HDPifFms6XL1CXLm1gLH3IHdCRJSHg5rSX9inmvZF5P9ZhFjTORNZa9
 owP3UvkVfz1xCFexOMZy+k6mIcjWele2y8K+fBzN/6oRnpQOZcvuvoVw7ZReD5mt5W4vadfvwib
 6bGLNmIqGypG4XWCgk0CoLksrDV5OM1CtHsxoxqTJj48kMRp/DSvKqT9yfYEHGf60iEmbJop+p4
 MOivyfARELVTXHrCOxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200230
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36369-lists,linux-usb=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 9F3E7434E74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7a0623fdbd8e..8df579bb320a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1800,4 +1800,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
 		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+
+	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD)
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 }

-- 
2.47.3


