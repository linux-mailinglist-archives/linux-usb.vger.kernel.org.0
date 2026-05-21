Return-Path: <linux-usb+bounces-37848-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIBiERfIDmoACQYAu9opvQ
	(envelope-from <linux-usb+bounces-37848-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:53:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E875A1885
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B5313209F9C
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 08:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CE63DA7DD;
	Thu, 21 May 2026 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUO/2oAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4gf0wDl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF833D171A
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352698; cv=none; b=PNXW1KTtgdKWBYA0O3/HDRJgMfxpHH+nbSFKh7wdbU2VbC3SeRLk6M1Weg4BHpBfii38YqWP8Y1RkTCg5Pd0g6E/MeDjcmeRsnrSj9kDlC9b0NMc+2OvHuWZD3CtpQnsK8P0sUHSXNEBgtmV/x2+7/uwjGRMHY7ksdzIzlFNKFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352698; c=relaxed/simple;
	bh=cf9shCmrClBGUTh7dllsxEAWSRdwClRtpyvDEjdTEWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9+g/itmolUYDFt/s5FU23l/L2tWjaEMAlk9o1ZYbFaHPy9XZxVTINzko1co/7s//uROgBUvD12ZejjEVBmmNtDFQgEaA/EUAi3nmq2AU7NNEkG5EgkjUnzqc4f9v1d8etgBrUxdT6ZVd/T8n03LtEtt89EMrvA6GOTPT81gBvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUO/2oAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4gf0wDl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6x9sk118975
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 08:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7ED+C1Cny/90pO6gVbhNn3JfkifwjCs1jXkp7NDh1U=; b=IUO/2oAZBKLaByPc
	Pib/Wdi6Re7jbjDhT2DcJGfxksVhV1lG/C8PBaWeZSqZZuDFAF8uVjdTmBMcoTdo
	aqHFel1CfsAodTf2kMAAegJ+s3iSD7fS2wY48DFhw918ikDLyTnprifVwc6h+TOY
	LV4AYAPkRoMvyPJ7+0Dn3Md0beSEQl/oy1aXPhHSTq4Pv3FHP58MZXIF4b4ppphV
	JvVKXyv9r1BvTUDJgWCRPAelxHbwhdccQRUeOx57wI6xAr2WSOLp4CvmDtuwx6cr
	ln+iKZZo6t5N+ji5qB4TtPDZn0FSXPonYCJ7oBgqJKgmsLo0bVRPqsdSLnXcf8iq
	WhOJZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8c1hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 08:38:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc70cfbdso170655921cf.2
        for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 01:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352692; x=1779957492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7ED+C1Cny/90pO6gVbhNn3JfkifwjCs1jXkp7NDh1U=;
        b=C4gf0wDlcZIjydzdpcSOBs4cfrA1j3e/t9TxDf/bD1cccZdyg0bYt82jdTKs8NeTMe
         9aiVEtj4VjQ4gJzhpjiYeDSEOF/cKhkteoYJCaIwAbvdUtqqa9M4Qna7NGn6qDrzZLQu
         WFwzC1159D7EUHeu3MUPgED9d6aRfSXD50/6lCjP13zhbMh0wobSDypt1YmtJHPSY3b4
         9N9p8PwynH4iXGrmwvxXFy4z+2vi2zIaR2FQJIxnQacDGPmAzBm5XHFNvQoQkRzDrURl
         delb2Vv2yJ0jM6cQAop7mqIdFnYWWFRTXfIb/28PHnEnJsQDByr9KpZauZa2fJ6gs/Z4
         36Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352692; x=1779957492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M7ED+C1Cny/90pO6gVbhNn3JfkifwjCs1jXkp7NDh1U=;
        b=HkywS1Nw61XavogWsrNL9NnucUOyf91FgsYWb4xn1VgAAUJ4fB+DzaKftXN7FUJeKw
         6iBrVhpu6yD2cFMaOR/Z4QgFLvmF/WU+d1Y4yHXpY4L3wia5B3k4/scq9Rci8cnGfnSx
         zsnqc+9xQSnd8tPDGZSGguaNq3k4tufY0KVyxa5G7Usm/oEUs5zKnj7do7AYK3WxykxE
         gbzZk5Ozc69rK0YnTwuozPslT9gJiVNrVdL9xWtK0M241U6S3oBA5+DWEzJ+yt0rBkzw
         gwg4D8cNto/cqL690n3g+8qL7Z0co7JRrlKj1IENKXrhSxPbLBoYVQEV1SZBQVAtWcT4
         qTgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rZDH4WVn4ZK2VffP06Z1EFiOSjiJpXX+5kw/Gu8j26jLEt+Yte6sQJ3EslBnr1VRtrbaGPmOz/Vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtVHiLOcSagdY2YwBC0MWZ8C9TxPnWH6oGJa4uDi86S4uF3/QS
	CL8VFMAMrAV50HbrQZvtblt7uF3u+n3csLNwdxXsFh2s0lMYxPJEMb5OSuBnZrmy59XV3oXCqMo
	vqo6jJlnTVIzVNBrmk2gypim56B7lnSSi1yseYgFns/UlNRM9ab6CariGjYBIcvg=
X-Gm-Gg: Acq92OHB5ZGssKq+YMZXPfpLOJkmiNvriUpWDvVTmBvE3Mf2RoJz+NQAg7VhO8P8bMa
	Pf4dd/Y5b9eWhU6YF3mG/FyGYw2X64NY0ZHIvb1QawHFJzMr98TMwLqAYkvQW5CtQgJIw0uCHRl
	eSSmvpEQIcrFhKKtZkQ5rqXSUqSDivYfqLuRxwbEptxtNQRyIZpH8ZM5Oi8/0VsJlIHKwZ8nRfJ
	KfSYw9kHm77zHS9y+gQE/ATyjzZ9b9NsiWxDcy0QCdasuMC5i5+QwUS2ns4C/Awjmgg6V3w0Bf1
	oxkbS9lJXwgW3QouJVBV2YD3f5JAe7q9Z69oCG+sEm0z/rSvhuBaPN9QH273OMhqxCYPkPcF/RL
	C54Ac+/0ITlpf4OUwVX1/CnRPiOFxC0RAlefj1NZQmnNWwd2XcH0=
X-Received: by 2002:a05:622a:5e0f:b0:509:35d1:ca3c with SMTP id d75a77b69052e-516c5473bb5mr23806531cf.5.1779352692555;
        Thu, 21 May 2026 01:38:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5e0f:b0:509:35d1:ca3c with SMTP id d75a77b69052e-516c5473bb5mr23805721cf.5.1779352691987;
        Thu, 21 May 2026 01:38:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:38:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:45 +0200
Subject: [PATCH 22/23] reset: rzg2l: use
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-22-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1003;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cf9shCmrClBGUTh7dllsxEAWSRdwClRtpyvDEjdTEWU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQul5EJOx0VeXQl+rdgf1QZA4hwOrkTVMgH6
 yr7/2L10RyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7ELgAKCRAFnS7L/zaE
 w1fqD/9lXR/uJB0CDw8VfjayM1LHzrTL1T8ynf3Gvgcw2Wtn9tGB8ig72R3fTjK6WO33qSEx/Ys
 +DCcJwVRX5FpmyL+09qHtp+CXL2UW4YC16WWYephi3sCxLJYuFoyb0JH/qN0+ptGq2NeUfc5gKD
 c87044Xi5XQfAFUNj+hjqpnGkVuOk+BHO11vfS6Q8Qp9dMc+im+ZIHnNojx+MQuPpl+XYxViSi5
 m7Rj2JVyScch+ae1y1O1HDXqmgEtRjEFQ8a1sD1VvWz2dr99kOYf+zY/IVl/glBQAVwK5z39J6Y
 qgkwghvhKu3mh1nMh9qGm874qbqYvrxoyWXEu8eTHpc/Ee4EkBGbZPg4Re1IF4mxzF091bMDQMo
 /Na9rNRS6DIcjYW25qVbWTQ8cWto2C+ane9qzP+6H2FwuWKGXf7zxfdfDM3TPaXbkiuSREUX0DL
 06JFNxIHD9jqtIQPTE5wqBpn3JpyYNrvD3NT7bAO6xxMF64VHPng/cenB8YeEULz+TKMLm2WP6I
 3qbyN8Y0E19QrIzjS9oym6wbxatwoBWsv5FhinU3N1knXnOpdbjk1GBPGrQJmqiKJ2BbqWBZQbj
 szuqipQoXHQzf2mDXj1TB1k0Y2uddMXfhNG+eK8UlmCeTMGG9uCgSfFKfoJlsE4UUsheZ3FN/M4
 W3hz6QKvE8P0Q9g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: egLd8AlZIG_32_dwWQc-BxJ8GYdibAn-
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0ec475 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX6g5O+I/E+8y6
 UYQvmTZFhsHHdkTcKe/kedfCaFfAj0s/s/yGBfA8uBphokvf8akxDLP5FkUXt6ZELKDtUzHIIiF
 tcc2EalOqYQ9p4xqRfc2xoJTNoAk2vI3bu5XQhFAX5Z8Srt2TtSLDnTsJHwNjEq1di6P2YloEaC
 57/2y/qIv8y39xAaCp3QPy5jXDwaHeKXZHdkOU13qGVQG5U6i/gYHconeoKwwqF69XozYfseJbb
 1xew/I42FfuMCukMQq2nxmUKhBdHsvkN3NCf96WFJWGlA01QYt6n0LNmkv5i7QXzDa3dfj778XS
 mnJAlKV5T7okyOrtpAcfIbpuh+KTg0Erfiq+rBLDwI7/PrMBFPkwwPE4KSvrYugO4YudAnDesXF
 ZNTfCAOUTM/jZX/D7Kf/rPKCyNoIIlvBi+YENK93Rpklej/w/OlTbnpWt88WyTD2xMs0EX5KQB8
 Y4Nnw0jRBOOOr1dAE+Q==
X-Proofpoint-GUID: egLd8AlZIG_32_dwWQc-BxJ8GYdibAn-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37848-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[66];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D2E875A1885
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index fd75d9601a3bfde7b7e3f6db287ec8c5c45a20ab..f003b360629c90bb37ed0ade7a675b5b0f28fa7e 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -249,7 +249,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	vdev->dev.parent = dev;
 	priv->vdev = vdev;
 
-	device_set_of_node_from_dev(&vdev->dev, dev);
+	platform_device_set_of_node_from_dev(vdev, dev);
 	error = platform_device_add(vdev);
 	if (error)
 		goto err_device_put;

-- 
2.47.3


