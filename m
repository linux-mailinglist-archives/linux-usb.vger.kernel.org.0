Return-Path: <linux-usb+bounces-36261-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PLFD94d4GkPcwAAu9opvQ
	(envelope-from <linux-usb+bounces-36261-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 01:23:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AB8408E33
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 01:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE5E8306CBFD
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 23:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AD63939C6;
	Wed, 15 Apr 2026 23:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5D+Jlst";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETeJzQIe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D84B318BB5
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 23:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295360; cv=none; b=FUYsI0U5wSECAQ6ks7vDCKIwoJjrx0HGFFoemMlcjgK4RBQiVx/pli9BK3KEI1JVET//IxfJS3pfYxSZFOU9Ghswuars8qJxzHEK5N3LrUPSbpiuj7/sxKVIQbcD9wuS8ZRt455v0Ylb3G3Er3miA7F4v6tDu2MdY5tgMrgwLoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295360; c=relaxed/simple;
	bh=DGTBlD7qs9HNM7qsl6CaN+vK2gHbwUw1l1hWZUAKoYg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jM/Uu6vZWZ+COIz9ucxZiO19btfMi0YAj/TWW3NOIqprZq1Yfy2rjTqFrLhhrPbWj9FGRYnacZ3bcBSSwxU5opwSOPT1K+ykiN6BsSS7TfDkQnei3GckNCdsrW0y/PK1s7kFHxqOWrtAkqt0V34v3SDeV9yUaggIoAn5E8xtF70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5D+Jlst; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETeJzQIe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FEg9AX2972410
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 23:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QjrAezVeYmMM4Ps1ry3g2H
	LZr/7V5M12bVqxCDqfRuM=; b=m5D+Jlst7zIrpNFlkcMehTxcctR1022cEwiZvM
	OV/h3ebwTZAAhMMWwAJNnlFxcecuZp+eiZSj7bwThxGkGCjNkf434v8v7zRiq8dK
	V6sHHtJo4FYzSszeuAuUZvonwryKRYdoSzCO24iP/r3LpfzV/QUob/tDgY9gvTpK
	YGvfl1oHuys3HNQn4Ecwn630RdL8023nZ+9I4Y07yKbBHNBTi70yWrlXLo9cm3h9
	2Ow5JQpJMP8zFagj3jwRNsNR4SQ+csPvOS3o3X6BGSz0O3IgQtl5WkFSYek4Bpkv
	WysoB2M2xHJmkCDEBJ0WQ3haLX3EEMmTyWlt4hPLL1CTzaOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj74gaxat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 23:22:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b44f7b7bbso181447631cf.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 16:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295358; x=1776900158; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QjrAezVeYmMM4Ps1ry3g2HLZr/7V5M12bVqxCDqfRuM=;
        b=ETeJzQIenRnt09UGZ0iF/r4h+A5ymPsYudoIBSLF9roxDYylrXGlrt0hJqPSgWtzXu
         aTGmM2Ez+OhCnT6FJvPVFNY0/Z7c4koLHf7e+ZlK8xpV5HCR4bWdJfWxJMN80xLG+NQK
         H8GsqHwEmPrQOL2SrOVooM7T85520vFUxMSxXvHu4kbxgxvmMgnx9vRsWCnhP+mZ/S4/
         hfW7UtS2VoW4X7zG3gkd4MH0kzEug5JVd7tsvfGN+bGu69vjd6P7b5HYuAAow94wDFXY
         XLcdWtnKekonRVsbjcS2/UGEup+qFsp/s7iy+jimyDOryctECNuGEDnuwYWWJuy4qQBZ
         eahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295358; x=1776900158;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjrAezVeYmMM4Ps1ry3g2HLZr/7V5M12bVqxCDqfRuM=;
        b=LdQ/f9UNvgRIvYUXEkFF+l2LbYJ3oCx3VVvwH7VJ+SFyBpfV2zNKi49vLLxqW9/p8W
         okpbEgdJ+AOd5umz7riLCJOH4qptmgRMWE+SMNyZH4SY6It7bvMwVu0nsTf/yomt6g9f
         FBMiwhH8aW+KVUV6Qqf8lXqJs2xhdc+OUKwZMkxScboXpo7S7v0cCqMErP8pAox6nKcR
         Ro+JcrtVVdOiQXX7Y/oR7kUXjXWLa8RHvhZUNOlfgkCUP+almVpmwsj0U5zNY36mzNy8
         5LwQ66/WoSFy+8k9C53AescvT8LHZyMIPxOABe2PSW8G8yIlh8GFlMU7zi1mvgeLF6rJ
         dMmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AipP24tdY5fw0W3c2jpqjw54Ikkz7Ik1PfX7qtf2J4RHwy1KxdM/eNXPbrxlP43xh9YG2HsoDIkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUyVr60OPlWxYI/wRcHNJ8P5WypQlhrNuKqmQSRNAnGxnahkjf
	uyQJ03pvacjtQRx8NfEqg7pn3x+AnobF9cxgoSgkmpv8V7bS49hDSThh6ydhHVzZrTjsOK2YfWf
	BJnBmUhzZaAEHTZlWU6pV1wWw6zU+alswV/XyZV+eZo54Ij8k1JgjAnjJXi4gnlw=
X-Gm-Gg: AeBDievsDv9+OZfSRTdWsnNtzyJ9TqUKKCDDsgBz/4+hy9GFghqLHoM3e5eGrLwKoMR
	f8xZDvHQIZKhAwnB8F3KNjiXOSlHyVXslObdJvvxISWTMR+0Y2qbEMkPyzG5K6tDUM2S3ThsJJl
	DJbGjCgdXW1J4OD7ssYXpiwmjTrq1s6LVBfZbQscsDRkwgeLEa9eBqzdsOQ/vMTpKppg0QZO/6k
	cm/1zvmU74CBkyeBlaJI/nFgOs/6aHULruFCqoPbdw82YVqXX3BM68R+dK3AQxixy9iZIIOnKZw
	KOWseCAoORlrXMG2qE7FQwiAGxuxzfeyzANJqdWgIIJPsh/QIvuj6tqf31eR9kxEdLa9tRuPRR/
	avr88SgsXDtyclh1PhBFyx2PgBVAU+wGsp+LFamBcmDrK5p3KXqZi/hJrUYCe02bVJ4Ev5J25J6
	UE3mfv63W1XM5i/aO/Ne4LOS253Ky+0bzZ5uNpA2BFMkuJlg==
X-Received: by 2002:a05:622a:4a08:b0:50d:9174:cf27 with SMTP id d75a77b69052e-50dd5ada552mr341629791cf.20.1776295357600;
        Wed, 15 Apr 2026 16:22:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4a08:b0:50d:9174:cf27 with SMTP id d75a77b69052e-50dd5ada552mr341629291cf.20.1776295357086;
        Wed, 15 Apr 2026 16:22:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/6] drm: handle IRQ_HPD events correctly
Date: Thu, 16 Apr 2026 02:22:31 +0300
Message-Id: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALcd4GkC/yXMQQqDMBBG4avIrB1IglXoVcSFxt86XaSaURHEu
 5vq8lu8d5AiCpTe2UERm6j8QoLNM/JjGz5g6ZPJGVeawhY8Tj1LnBkbwqKMynXeVGX7GiylaIo
 YZL+HdfNY1+4Lv/wvdJ4XXIgi2XIAAAA=
X-Change-ID: 20260414-hpd-irq-events-e72bc076a5f1
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DGTBlD7qs9HNM7qsl6CaN+vK2gHbwUw1l1hWZUAKoYg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B25snfl3bH76DEACoBeVZy/UCHClRy8lnyw3
 uY/zfPUoHSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1aaaB/9c9WKgA+3medunIFAl2CwuoCesh2/joS8gvRUa71/vNjPKRaDwhbLm5jO6MCbLgig4onY
 jF3bCfXqoO2RrZ9cTVrg1MKZqpXlRdW3BQyhT/DOIKfGPRMdoNyCFz/rU3cI4D0WrGSbVX+yC5V
 51IV2z4RVS6XNUX1aZNn+vG1dHT6XeZoCywbYQUMUEG0OJuZotdNHy1CPjDAGr2m/227RZM/vVV
 hlvH8a3N6EX4o+ASH2W4NGzsOS2dg3yKZKRR4CWR8ReMTZqXsj/7qZfOV2nj/S66/Dj+GQzrheb
 QBGq4goO9Y68lpQRcQm999ISp8uPQr9FshsCDN5JCmNeMCo+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfX5I5RBsITufsl
 ZuncqOBzsSOc+lycO6Y1Az0PNC5GVCKY+sYJGgBXQXAY5gYqRDxSUy2iOFVe3ocgJxpuT2BKpJC
 p0h8dwHQlOYmTq4NBIx+DpSvyg2TF4sHTOH3VI9eg2MmTLlnvZX7pS0Lguhj+GSsrLmSxEhdik4
 5VLZCmUiLrbRv8K5fkNRN3U0mC++Mg8OoXVJ3+lvQWZDBNRHeUN/1e3iAmJeIXtC9kXsTeAIk3I
 EMwusFcsyuiSavUrwt848P+dZmHflREhhnUnP1ks4+8e98MDHK9OyvFG7EWL1t5i4XRVmqhRnzb
 JuGiP65SUxBw2F3v2I8wAE29DZKwnP+imKal48n+XgvgpLUSueWUh1qP6NYaN3bSWV+HIyy8LfL
 6X9LvWZ9QKQ3ZlZvChXKR/lr9VlYY7sV8yh1ElaP1oIW65hMu9kmOREpSZgWH9vUfp5UV/QmAKN
 iehWriE1d2RYK9Q/0YQ==
X-Proofpoint-ORIG-GUID: 4LuvuwwI--JuCltQ6FSF_po922pew3RL
X-Authority-Analysis: v=2.4 cv=ZIfnX37b c=1 sm=1 tr=0 ts=69e01dbe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ST8Y6Hw29dmLQzsKkX8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 4LuvuwwI--JuCltQ6FSF_po922pew3RL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36261-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: A9AB8408E33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both DisplayPort and HDMI standards define a way for the Sink / display
to notify the Source / host about some kinds of events. In case of HDMI
it's as simple as singnalling changes to the EDID. In case of
DisplayPort it's more complicated and requires actual checking of the
DPCD registers.

Currently USB-C drivers don't have a way to deliver the IRQ_HPD
notifications, leading to missing MST notifications. Provide necessary
plumbing to let IRQ_HPD events be passed to the DisplayPort drivers.

Note: the Yoga C630 UCSI driver and Acer Aspire1 EC driver are not yet
enabled to send the IRQ_HPD events. Both of them would need some more
reverse engineering to find out how the event is being reported by the
EC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (6):
      drm/connector: report IRQ_HPD events to drm_connector_oob_hotplug_event()
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/msm: dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        |  9 +++++---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  2 +-
 drivers/gpu/drm/display/drm_bridge_connector.c | 21 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 18 ++++++++++------
 drivers/gpu/drm/drm_connector.c                |  6 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            |  6 +++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  4 +++-
 drivers/usb/typec/altmodes/displayport.c       | 12 +++++++----
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    |  9 ++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 30 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    |  6 ++++--
 19 files changed, 107 insertions(+), 48 deletions(-)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry


