Return-Path: <linux-usb+bounces-36262-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCifEPUd4GkGcwAAu9opvQ
	(envelope-from <linux-usb+bounces-36262-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 01:23:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B94F8408E4B
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 01:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1484030E8D63
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 23:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8254338F954;
	Wed, 15 Apr 2026 23:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HN9jqGQm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iC+7r8+q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAC6318BB5
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 23:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295364; cv=none; b=Wi0U0LFdyg+wPCMKKIA4jvKylEprGv45ZnLbmhJqrJ/ZXXOT9goNskL38afLuz+Xe6BG+AwvF1daWOzfs6S7BBhmdCJZfHzQ/Qj4Hb2s4wgZCQETOZ9+lZjXoVcXLJ/KHsJ2bp3x73AJecud62gsxCHyz2Qql9aqtPUaijwhsv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295364; c=relaxed/simple;
	bh=J3Awa0W9x47e9VDImgKb//FhRzSC+4krtGr/Wy12gno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IMfXJ5c3iGbwUHQrgZg5ChGwClNSJ8o/VGPmgFYKOEXDHxFdIn6paGvCRtKPJOat0qYjmqx1M7zUNOqxtNwA4oKGHV1t56WH/7tlPjWFfAZbxNT9JY1Yv3L+Xa1+TFmCEeZkkwMAafLWxEAqIeP4P7BnHOvPJAkwXMTYJrGdoQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HN9jqGQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iC+7r8+q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FGEvMw506974
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 23:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iT4ySHxd8iMiHVjfS/Pg8NfDAUzunyhUM2tZEku061M=; b=HN9jqGQmz0rOg6qq
	gM7Ah4W9Y7kaF29tucblX1H2+R1u9HMVdLhD4pohGhFPwRkMBxkDz43FDkLMQoLN
	jQkAjCv5F8SxaZTZS/FjIzwzRcQHO4DByVL1mJ86ZL/F/QB+5BBEnAXmjnYKsKJB
	VgL0Bgi15wvGsmuL9cz99m8I2UoaMBaPjB90kxh+yJGJDBwcQJlndgmNoQSOq5lG
	MwNjxpGuAyTfHllF3pAV5L5yZc0RF+gc9AXbHSbIFskv2VOaQ2sbmiiSjOIyl98o
	JrQLvEZy2eW/FpHX4FJwnaEiJzTKcmiavrDodZqk56xfxpH7na6bVJRXKflYmCdf
	FsfsIQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dje1e16yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 23:22:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso195383531cf.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 16:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295361; x=1776900161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iT4ySHxd8iMiHVjfS/Pg8NfDAUzunyhUM2tZEku061M=;
        b=iC+7r8+qFBpTAMUglQZ8I13+G5fHbpU3fDOhv328VE2CuH+LbgtbRU2UaKNHIWRM2R
         MJrCtjKvOi+5iLZQ187js1sZAQ5rq8Niujha4sObnShy7yyOBN417BWXQCX/tY9kMuB4
         zck8h+g3XYuFuw9n3o+GJP4IV4aoH4CgdGKCuswW3e9ecWcowTS2oZ4+DmpmdVeZWP+x
         SB8EYjhPWKkNpXUjEAYYkXYZA98gMiPF0ht8DaueC2qFb7r4NBwzJHsdMIitsj/ilAXC
         pp/8bCrwlHP/xCGiCV0N8lzmfiNf/9jBXTwJckRkYPeIT69bsCbV1LJmKlLWMDk9V92N
         iuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295361; x=1776900161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iT4ySHxd8iMiHVjfS/Pg8NfDAUzunyhUM2tZEku061M=;
        b=nxrGzcmCsqOdSPd8urRQ8wKCobJHFJWfaKpI2GiWd80ggH3toIkJbKC/MQtuTiGkxP
         EEsSA7WZ2tZATh33YUgVq/tyJWX9MYPMPpl+SgDXNaYplt6Ik1jIqvRZF982Ssyv4ACg
         UMKoja0kEBNVtL5HU0pgB00NPJwC0l+hi0ghGP6Ebl9gE9aTkjNW8OxEP5Go5i8ASrr8
         UFNIhAsw/+vbKfxlNtqhEmd6dK+JRcpJ3+fE1UQ5y5DG3QSDlsPgw47kolVmaMlvYWmw
         Z17hB1AIs4kB/IWNxu5LLs5/yWijq+cVn3TX+TgBzU2HQ3dr1DKRljgYRXrgmh/afVeA
         eBig==
X-Forwarded-Encrypted: i=1; AFNElJ+jmv9neyd7UWPxuwiIGc1r5lZPHqD5uquMtsA+qeT/UluA8qOL+1b3QpRzawRm9OpLWLlvZyEvPps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl4hg2S8L1gkFH6ZIu8xtuelwLxiCmwQp2Prnf7RO+zyI+bWNH
	POVzmswGuV9RlXTrOxTY3B0uQBERFFFIQt7EFxK7B3cj5N4XKs3chZjzcGeEKTDn2nvz1nMXpLU
	JG58pyA+vu0D6ac/JFlx0PsxRw25KWRtewSr2bO3GmExvJ0BV+/vy2HUbbb6dOUA=
X-Gm-Gg: AeBDiesdJvUg92vF6GZpThfHcSL77iVV5rXqb5YWTObfBiZvoHipT0Yfk/U03bT+qQ2
	1YoXdXuKzdgfaVFZeFbdJii48ZsLOHBDnwJMm3dW8F9lgqHrs87kFO0ZzI2sUdSSmVZs4goaSzK
	6Qh4jAwQnYmYC2uWdxUlUlLbw7+4BhvmgV15NYcXRdGN1NHupwFV5htLK2GLE40Z3iBmv0NBSuG
	ODdVONurGaKqAa7inTaV3KATvJMcZPar7Rkc9krCLZpJNJzEHdx+5+b9Lb+ZVR8XtezWDioXDKV
	ivBcZRRVA1lUqGXztLdJ34j77GAHdAnM4x9nJc3rkR/7htBgJhoT0SXOkgXV8SIhKR2Dpc4MXO5
	jr2+2j+xrJEPvvBTbIcClSdl3P6diXn3cgmW5uHINDy3MUORH79Pm4NBAUOAlsMuGfrnN1dWX26
	IDH/EMaZaBRwAMZeUpSBgkwtohoGxE6e3lxj71o7VFsjOEVw==
X-Received: by 2002:a05:622a:13cd:b0:50d:c0c9:c985 with SMTP id d75a77b69052e-50dd5b30efcmr356728631cf.2.1776295360528;
        Wed, 15 Apr 2026 16:22:40 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:50d:c0c9:c985 with SMTP id d75a77b69052e-50dd5b30efcmr356728031cf.2.1776295359994;
        Wed, 15 Apr 2026 16:22:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:32 +0300
Subject: [PATCH 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-hpd-irq-events-v1-1-1ab1f1cfb2b2@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4349;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=J3Awa0W9x47e9VDImgKb//FhRzSC+4krtGr/Wy12gno=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+YD2Z0/KxXy+84z8JxSP2aQ1M3eUcvU9ilBtXjR/aqj+
 2Z3LuboZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEegXY/0d62BYrmU3n/7zq
 w+ajokINzO7HGphf9f7u+KVYY9GZPPPd+dPrFkd72JYIiEYv+Cgyof3QC9HYhe8y7N7v8o55f8f
 3X2Ke4BGewnim+rd2rxrcf07ba/hJLfSBAqcl671TPhwNIbvfN0euXzJFsjR5bzDT9YdzJh+Ym/
 DrT8lMr/j1XxkOpW5ULS/5e7N5VoX432Vz5+0VLIppu617LG7ZrHzlp8d/Zss9j9FTmRRq5zq/c
 aVoRAqT3bZowYyZno1Hlf17Mu6zn+s/mVhZfvShDm/vs2P85XszgkUDjLKetR15xhyY5ufn1Hkv
 c23zbjeWi9birs2+dzzKg7olbd5uy6nRu3vQ1+Tx4h1/AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=HZwkiCE8 c=1 sm=1 tr=0 ts=69e01dc1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=TP8XqTAxF71JeV6NEI0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfX7g/8kVdy/oYP
 8UNvq/sk+YZ76XQekWU+13Stf8m/lPXMgkwPp2pycK93J2RzMaZazujBfuBuNolF9JivdKVvPHw
 /TOlNCrMqjnje8FEpADMKbX3coADqPzYgzigYqm6RY6JG5Ybk4SSZNj0grxza+jZ0+tEHVQmja+
 j5FIiuQiqNh5wSokfVshGfAAX4+2CCIJQupQj33zaoxALkNAWIj4VkJ37LxX1ywRfTff2t4zXvV
 MzL1ZheF6YY0L9QFyNcHXz3EZjqaqkhemtz2i91FGQoiwKOaSDnD01i9NEz4X1ijDi/b4sKloI1
 RXW8LF3Q5vCD22ATtrjwBXPgoJp7/5MDcvDgOrK854aWxIq4o9jhC65AqY+Kd5c+/n0utLpVxVS
 DvJ154SSLzWCp9qcLFwFPV+qng4htnPIr8V8LuH33GrUSfFIghrl+/w8ghoLwv9NhnPjrk6OxbF
 ZxQusFcDBRLeVz/CE3Q==
X-Proofpoint-ORIG-GUID: gtAGH7-kyUHF1yJFC_LShiBrz7qAZkR3
X-Proofpoint-GUID: gtAGH7-kyUHF1yJFC_LShiBrz7qAZkR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36262-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B94F8408E4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DisplayPort standard defines a special kind of events called IRQ.
These events are used to notify DP Source about the events on the Sink
side. It is extremely important for DP MST handling, where the MST
events are reported through this IRQ.

In case of the USB-C DP AltMode there is no actual HPD pulse, but the
events are ported through the bits in the AltMode VDOs.

Extend the drm_connector_oob_hotplug_event() interface and report IRQ
events to the DisplayPort Sink drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c          |  4 +++-
 drivers/usb/typec/altmodes/displayport.c | 12 ++++++++----
 include/drm/drm_connector.h              |  3 ++-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 47dc53c4a738..5fdacbd84bd7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3510,6 +3510,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
  * @connector_fwnode: fwnode_handle to report the event on
  * @status: hot plug detect logical state
+ * @irq_hpd: HPD pulse detected
  *
  * On some hardware a hotplug event notification may come from outside the display
  * driver / device. An example of this is some USB Type-C setups where the hardware
@@ -3520,7 +3521,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status)
+				     enum drm_connector_status status,
+				     bool irq_hpd)
 {
 	struct drm_connector *connector;
 
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 35d9c3086990..0cade62da905 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -189,7 +189,8 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 	} else {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
 						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+						      connector_status_disconnected,
+						hpd && irq_hpd);
 		dp->hpd = hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		if (hpd && irq_hpd) {
@@ -212,7 +213,8 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 */
 	if (dp->pending_hpd) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_connected);
+						connector_status_connected,
+						dp->pending_irq_hpd);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 		if (dp->pending_irq_hpd) {
@@ -397,7 +399,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.conf = 0;
 			if (dp->hpd) {
 				drm_connector_oob_hotplug_event(dp->connector_fwnode,
-								connector_status_disconnected);
+								connector_status_disconnected,
+								false);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -827,7 +830,8 @@ void dp_altmode_remove(struct typec_altmode *alt)
 
 	if (dp->connector_fwnode) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+						connector_status_disconnected,
+						false);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f83f28cae207..e8e7e6c9eb5c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2521,7 +2521,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 }
 
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status);
+				     enum drm_connector_status status,
+				     bool irq_hpd);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);

-- 
2.47.3


