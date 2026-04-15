Return-Path: <linux-usb+bounces-36264-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOwfMnMe4GkPcwAAu9opvQ
	(envelope-from <linux-usb+bounces-36264-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 01:25:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E92D408E94
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 01:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80E85316ECEC
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 23:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D6D3939C6;
	Wed, 15 Apr 2026 23:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecU/bmn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIzU/f9b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED223393DC0
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 23:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295371; cv=none; b=Eh17ngZdTp3S/1K9U6QPm7Lhgwo0Z0v21aAYJMpRIcDOgRPTXdEIdPiv51HjNI/p2UqsAlA8ECKtyt3aPzJ4/2M5Y8ZHgsSVoLHysFATAXcmsfMUL9lkDUe+/gKmvNc2dTBsb8yw1mQzJtQdNI0RL/+C0qVluqNi3HBIHcHX+dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295371; c=relaxed/simple;
	bh=mz8dmJX1o7L+LkFDzvBa1x8iVPv9TimP8vXBvzsNNxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FcvVOLNvmbb2nO6rDTbsXOCxOQJt3Csje2l6Vg02VZnc98UB35S6iJ8cZn0zco6hwExheoE5/OgSMRpI46KyjS/9bus1SSj9TG/ZAlwoRVtUs7y0bEfHtvSB3hUGZBuZAxbkEtG7ybqzpDUuh9vvj6BlB/5yg8kBhauriU0oqZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ecU/bmn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIzU/f9b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FFQEpv1702416
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 23:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a4KSfjn1joLi2IK5RttCTaEwdkwsswlE9sN0psAruEM=; b=ecU/bmn9v1itzIBb
	68x+4zJohm4hFwl+P/1pO62Wz+JE+YbZGYSTfNve8Xf74w4ihxA5XEqHWqZedt57
	6LWs4oFYLn9iE/P7lv/E1xQD+ohk7jNq41w6g6hDkBB7WnUjESAoNJEftCtY7WET
	AV3Wx+itysbZUglZw/CJ5WTPnZfPumUjJ/nnLkE/PBtf4NWxHxkGhpiHN6TLx7HQ
	Dm2OLDmS9ZPFxfkY8gjXk+haWXqV8fejehk6KYMuplKf4k3envkRCXsUzF7fu9py
	7EpaSjl8qxAxQUYmoUSi2Mj1H/a5UWHwMFvzLR7ZhBsNfGQM0r42XIVbce5xFZUe
	6vx92g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamhd0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 23:22:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8e4c29caso189438511cf.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 16:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295367; x=1776900167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4KSfjn1joLi2IK5RttCTaEwdkwsswlE9sN0psAruEM=;
        b=aIzU/f9bSArmodWqmdal41FXluwcYK7QkECJw4xhziWjrswCi4ROnoBGZglNn7zupO
         curC9fsJxFC10d3wrdX1D07fs9+zXoOhFKskm4ZUiNH1t0a85rifHhzxKmb4hfFKo3Gl
         bTHeYgrZdQr97I1SCMAFMx4FkQqUwIpCciijwd3kORE+Cc8mkw0fOgzd/lfNXi+6o425
         j7cxpQMFFy/xTtxvpFi1ho6gA23Qr+aK/g2CMErkosn+KAEbgXk22j/r+L70LN2nKaig
         HCTjyoSDM/Wbd9aSVxjhJuNac92OdocKa+IWco6PmTWCqoea3JPcdMB8yCJHEOvHAf5K
         MsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295367; x=1776900167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a4KSfjn1joLi2IK5RttCTaEwdkwsswlE9sN0psAruEM=;
        b=OPaVEGn2gG7AaHbJmAxwF6M7YOtM4TxpLXnQTX0LQ0QMAgDCx7jk6Y5/TtUUERE7L9
         d/UwgJNtegB2oDhNvzwfWxBtf8jWDLGWP0BT7Gy6xqmKB6fHN9XZ3VV+BFf9YX/dG8Fh
         nrdaLkIpMxdUnMnUVP3kkYD4uyZ5+GxzmDJXLYApy8VVTegSdISQdcpREB4EDszOMmNp
         4fCW6uos9Ctj3ae+/tDd9WY3KLatbG5h1W7ksxtIwenZP/bYOkVltE+oSwWrHenkIB+G
         uf8fiTBrTKlDhRK1Hjg/LzAtmlhlJFZLA+Irwb/vIeS+zobNVDUcCCRBsk+7G0IFv9wE
         aDfw==
X-Forwarded-Encrypted: i=1; AFNElJ9tvpYPRSQv58JyHB8YLIcY5GCw/0u8MvgzONf0+VxwRZ/JFFCzlrJJRX0KLFLcTLNAqpmy9utklj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpMlQS3RlQmXmb4u6fZzhUoHKv7+AcsM81sUksL2K6ADudbv0n
	5IhBmYv1WMKbHS2doOLAl9xPbtH0EeX6J/JnrIqbe2AUDKFEBayjc7s35UOcwD9+QCkFWuFSpPu
	tHY3rau7bgjjM+kI7S1VM4a5j0Csr5Sju+fvZV8YBk6ir3h3jQ5pkIOyTzeC302U=
X-Gm-Gg: AeBDieu4xDj21CrZEM0chzaSaYpZoqYef5LFdELtqQKtHutkVkQIveypIs2FvPYUP/E
	FvnNH6in3gdMrrGJk/NmhfGJqFT3O0q3pmutwvAs65cMcKwRQc8Amvx7TZOKFSNZDWTF3vjvIvZ
	LUooYpIacV/xIETrrEpOcKvuIiZV49QKuVh/C4CNRYCtojRpmHwUD3sTxg4tBZlY1CcHRzBbDQX
	90cNKxOjgutGksVkvayvGbO5++mUgtN0bVJpml+TI8+tiuT+vm2cuIm97ho2HZdCL2c55JaWLsG
	Fc7Ez481Z+Q+0yaml10aN+dkpotpMDeIr85duw568G02Zcawe/xhh69qVCuXYRl1d1Xydn4Wq/P
	NPRrisMRJAyL/dgr2ZYriKYXcib7DRtnV8FvxVIGicTvKpL2tW8TpXlj5BL+VyoXXfhOMQSCZMi
	uWPUYWS6PD53GLV0UfJCO/3Fd5S6EIP9BId+pdQQRm44qjpw==
X-Received: by 2002:a05:622a:1822:b0:50d:736a:6248 with SMTP id d75a77b69052e-50dd5b30c24mr373453961cf.11.1776295367309;
        Wed, 15 Apr 2026 16:22:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1822:b0:50d:736a:6248 with SMTP id d75a77b69052e-50dd5b30c24mr373453501cf.11.1776295366820;
        Wed, 15 Apr 2026 16:22:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:34 +0300
Subject: [PATCH 3/6] drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-hpd-irq-events-v1-3-1ab1f1cfb2b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6722;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mz8dmJX1o7L+LkFDzvBa1x8iVPv9TimP8vXBvzsNNxA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B25wq4mEi/132w7NqLGejQ6ZJBdwpIzHMQlR
 CgdKQu+o1uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1bnDB/0SNFEv411ScvEko1SCNGqXnGoqWBUVGwV489aKOY+PT5D4wMY3kl7mN6JyZQ5TDhpESNT
 XszzIh45Q6TdckQtvLV5BndM4pjBHB7Ifftp9Tr0LenZqp6LO2HhtKbsoxtyCdt+2teeemdUWwo
 NFD+rY4+gIcP16wKtPP0HqVTpJirb+ndjoDatTbsb9xXrVGvE8MhxxPMjH3kf627kp+9Bt8S0f0
 PXmX19LnBxkToLnq88pT8puI2CDZOca59+RijyQKFm385Ek4yP7xaYt3ImCB4DZPwj4eR/tYKl+
 92hStNtdLrmfLDIhFNjTci/g+IN7G4qgHoQZ/l2MzP+1pKAm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: gZrs29iERGWygUZn3GQkH0A0DyReAjQ-
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e01dc7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=zEMOeRQCFk_hQCPR_I0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: gZrs29iERGWygUZn3GQkH0A0DyReAjQ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfXxuwXqda5iruo
 snKfMveuAkiCTuSUsfGFBS8vzVKfawuPKLFVdbrVlZ/8dTa2ew5y8XyGBMU9fHcZMWXnQmgGJHZ
 yP8RQKfq7bhxXJYiATrIjJX8bOQRURKYccj7dsU3SuI2aDmIDAwzkE6LFEuvlv3cKzFo5109c2u
 ofhB37BV92PxTbamz4GyYI/z8wUXiyVzMtAB39l6j9ymYc+4NXsuB/FgX/NTir9YQ2qXg2JQzgw
 ulc7uduEXqZ8SCXjroY2gWoLjWQy6YqjOI8aXpXfkKrbtQ8bc5X4QCrYW+ZPD6WUNpgQ9J76dWV
 bX8ElyufhyfoaIFftvSLPMnaBTrfXD9LqcKpc3TVLVbsAosNOJtLofLShYGoDqQSM5hFuCOBGXR
 /GKb7SoX02yeR7glmnO2FuX6xdaFuLLM60al2udk8e7thJCLBztoqE5zua5L28hmGD5K3a7Tl5p
 4zUaMduT2LI9yteFxCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-36264-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 1E92D408E94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
events to the DisplayPort drivers.

The drm_aux_hpd_bridge_notify() is keps to ease merging of the series,
preventing extra cross-tree merges. It will be removed once all
drivers are converted. The drm_bridge_hpd_notify() function is kept for
the driver which only care about the connector status and will always
pass false as the irq_hpd event.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c |  9 ++++++---
 drivers/gpu/drm/drm_bridge.c            | 15 +++++++++------
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 include/drm/drm_bridge.h                | 22 ++++++++++++++++++++--
 4 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index f02a38a2638a..74d606b27dc6 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -136,16 +136,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_with_irq - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @irq_hpd: recorded IRQ_HPD status
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_with_irq(struct device *dev,
+					enum drm_connector_status status,
+					bool irq_hpd)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -155,7 +158,7 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 
 	drm_bridge_hpd_notify(&data->bridge, status);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_with_irq);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 9c44e9b6c638..5a3dd4f92fbc 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1495,25 +1495,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_with_irq - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @irq_hpd: recorded IRQ_HPD status
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
+ * detect a change in the output status or when the sink has reported the IRQ
+ * event (usually delivered as IRQ_HPD pulse), when hot plug detection has been
  * enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_with_irq(struct drm_bridge *bridge,
+				    enum drm_connector_status status,
+				    bool irq_hpd)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status, false);
+		bridge->hpd_cb(bridge->hpd_data, status, irq_hpd);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_with_irq);
 
 #ifdef CONFIG_OF
 /**
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..6f837df90b2f 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_with_irq(struct device *dev,
+					enum drm_connector_status status,
+					bool irq_hpd);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_with_irq(struct device *dev,
+						      enum drm_connector_status status,
+						      bool irq_hpd)
 {
 }
 #endif
 
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify_with_irq(dev, status, false);
+}
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4eea124c7eb7..c3bb30133925 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1555,8 +1555,26 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 				      bool irq_hpd),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_with_irq(struct drm_bridge *bridge,
+				    enum drm_connector_status status,
+				    bool irq_hpd);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+static inline void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+					 enum drm_connector_status status)
+{
+	drm_bridge_hpd_notify_with_irq(bridge, status, false);
+}
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);

-- 
2.47.3


