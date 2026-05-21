Return-Path: <linux-usb+bounces-37850-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBuoIPTIDmoACQYAu9opvQ
	(envelope-from <linux-usb+bounces-37850-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:57:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D363C5A1A2E
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3947631DD4D6
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 08:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9462F3DD52B;
	Thu, 21 May 2026 08:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWDhCsBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKL5OZUm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352943D88F7
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 08:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352704; cv=none; b=KHW59jtGLHEmSGfVNKVxmLI75b3Mqz8uGhkpp2pfhAbku+oPTU/jJZI6SBOqSDXx1dCTgbX55USMJmXivIY+Cf9IJqPC8U2PPzkgxTsVVSRhwVsP4U6zj+MKfr7A1KYtkTk+wvq5q43QCHDROi6zeQz4ZAvdx2HvsvOEitz4xIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352704; c=relaxed/simple;
	bh=wJdZb8+vj1m+b+x+FZVXzS56tnroKpQQ8wlBgMpo8tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwr7M8aa8CvcCBSAFYL399ZN6PHQZuUWEcI22C6HwpF06dthCaWBejEnWsDxDcYc2R561mLSfBRzlfJ+1uZEP6uHSnzeKRHwVEY6qnhPDo8U1IPuPaQa8fypy5tqYNR/J8U4sQy/CfMqMTOFqGd//aJ4g7pEaoZ12TtM15Z2WVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWDhCsBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKL5OZUm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L7GNGJ963885
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 08:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZtxQlK7p/R1CF6Ljia73lN4Xy0wFZa6+gfpy47TBpjw=; b=GWDhCsBLIGtPgv2W
	c9gVxkym+zZjL9O4PUuVE0sF3TxrrJ6W5P3YbWhFCYzbbTfeqiCKQ+7SjTWsibzn
	nNNxjDvPT7iIjQZ+n9MfKwkkhIzayMl54q//AsstKcgDfnUZQVuOxCMKVlGH9lw9
	PZiM2P2RNKg7Gu4ga5SI8yUCy2o1Alc/GuZ6YDxT7crfbaT4vwtm/i9bxzxEocvd
	fOD7lEaiVoCth1jh2crUqVtYTKIJ7opGwu8BeVmYBKATumsB560irFMWUIIgRWfl
	Qi2+v+b4ajc9hEwmmWkVKbwJcgRWW50ip1+KMSm14d7jLWoHZoTZz3V+xv7FD28u
	phe18A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh3whd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 08:38:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914a8522bd2so63874385a.1
        for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 01:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352695; x=1779957495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtxQlK7p/R1CF6Ljia73lN4Xy0wFZa6+gfpy47TBpjw=;
        b=CKL5OZUmK4Hln12OCWjDVk2MwmP/wJb2kWEeL4nKBM/SaU5qzkR0CuZ29/cNR2Gh4z
         zNToI0X/leevukcXXQn5C/UWQkhCWE00a/Tgd+ZHtK+jX3ysV+gM5QoXAhASZZBkCmrg
         IIR/VVQIFuABkbcXUQeXl9qRWqotdf6YwnQJO2W4TNAurDyweOCS5zpChC34n/q6O0LP
         41MiHrHJ9fNjo+Q3H0jBNsi8vhMhVRJM3mc9+l1aVDH0ZC+yhK9Zw7QoZW4rtzmVzaKw
         ifPK3YSrx2LgXvd1duzqmOuc4E7JcJ0th8IfhkXlgdtmSEoB7DAQPs+pcRUGgI0B/6uq
         x3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352695; x=1779957495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZtxQlK7p/R1CF6Ljia73lN4Xy0wFZa6+gfpy47TBpjw=;
        b=O0RYthJuRhIvpAK64AP/GE2ca31FqLi4dL3CasoCpx+WWNpMU9MUzlmj5taqQohEaf
         LSHn99zVL29EBFUqNw3vXV7Si/9+YZBrtADADJP1Li/RPYuODQFDHDlI5uCE9UN6Ri+W
         tc4CaoVUQr6teAWGTVZuI29u5wy1lxCDLlZEXZRzqR36h+bTyjaaZq1yUjIcdbm7idPQ
         RFY1RxbkFSKCzX2g/BL2cSwRY7oROF/e3+1AMC5+Vi2ke5dMTsVUBJb68KOpvEpB9STu
         /4efW/wQQgfVenT7en1PwIJq4faYrJQI/p6hIXFWc4GA0d5JvILIIx2yFiwIykIZDZ+z
         O1TA==
X-Forwarded-Encrypted: i=1; AFNElJ9JynLhe3y4bAcoCgsFUq/NrsttEDIadvcaHd2UKK6aM91l1NDQs279HnMMT8gaFeGf7QgADTVuoAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGH+PMw4p6hxN22W2WxEl8uWhS5a7cpL7f287yHjGwClJp665e
	8NWmwvu2UuHpP59EOfe/J66WKyozBa+XeK/gAbG2VbQUtndb9vmlcGfL/43UYi9adWgVtwMb3eu
	fVV32OizTmvF2hVZ5YKrryhSdXYt9kBqn3k0S+Xk61BiJhudfCCSBRzajXDc6n/Q=
X-Gm-Gg: Acq92OFtsFsoWod81pHae3q2Z7oDToMl4lHJks7pH4QQqBFQ4sA2u27CNqMNz3CvLM6
	l0ZqHw2Z0i+0OZMZIl4lAjyxTfz7UEskx2HfO0gLhq08XqgwHnJJ/Tg6bw51tX3RL7vbsOX23nE
	NoJt7gzS+XFt2An+54DiTFuDQJP/koBms8vv22TN2QRcBM++1yyijj2HsJXKdKftd5xCdMYmA88
	y/0KLQ60K2ctF4Sb1KLm8fEwyN8KVoW2dr/37T2ZVCs7ofg6FJ2Fyb1EWonAM24fQ+P4Ek3rVu3
	aj+bMr7LwjH09jhn/BbBz9eKh5Tt+S9Na7jQ5qRnABkNHaANwWWNr1BMlysr352WFWbDsLuk3fH
	6ACcxztAmQWiKeU24zIYXx/4zNwO3nWpUKCeug837z1wZZglO8Noxg0HKBmfHPg==
X-Received: by 2002:a05:622a:a90b:b0:515:7d69:4c0a with SMTP id d75a77b69052e-516c54cdacamr16055941cf.2.1779352695424;
        Thu, 21 May 2026 01:38:15 -0700 (PDT)
X-Received: by 2002:a05:622a:a90b:b0:515:7d69:4c0a with SMTP id d75a77b69052e-516c54cdacamr16055371cf.2.1779352694912;
        Thu, 21 May 2026 01:38:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:38:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:46 +0200
Subject: [PATCH 23/23] driver core: platform: count references to all kinds
 of firmware nodes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-23-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wJdZb8+vj1m+b+x+FZVXzS56tnroKpQQ8wlBgMpo8tk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQvywAOqGOhQtns88s4FBMXaMUo4jbwN9DyD
 kRRxvjg7imJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7ELwAKCRAFnS7L/zaE
 w4SGD/9+gwveQq+/mlMfCiUitFiJRq1flDEf0vJNh9aBWt149vNSL1T8VDY/lOW9NDE2gZ1k+MZ
 JdADhVpNlL4M9I8vqMk/LDuOM9lz0fB8NFhRkPH1xW4zmgtjdYwt+13FVlDs/IBQH/Hm7ckUoSG
 huJzETXgeWiXzfa1T7R2PdUfzVp+UKttU9KJ2EdakgnCyQt0lSOc+wM22TMQRMtX/mJW7CWw7QO
 sUVAv4Al0K4BK9tKQhdd1KUp4kJ4F5ZHrJeF91QGJdhdcRGQne3vkE+fkflalspO6rd+fnSCXaT
 dFaB7eD4PFEFbn7OiTETNfps8uMEF6sz7P/CYX2u7Fu/x9VHXGuLhHe05rMwNi4cND/uNbxsoyk
 kJb2aBlDNL+QlF0bKrv7s1K6Yqyr56o9gHv4tqjc5avOoTQbqhhJaEhONnXha8/kQUB5ye6tPel
 6AhL2jn2ZBKdNJRSbbS32aWWlLlMF6GnoUUBF3q4J7akrmXxbJNBoWUC/g4H/PM2b8QWJoSTDWx
 ObAX2bZ9TMgCFdvJDlPIZrQ/7RhHM4ySdHYIx34eebl0A8224pPJoOPzFkT5dvf7MTfHvmZsv5p
 Ayb19s0ChWVPXSppfxym2p/f8ro/874bWyD0S3JyVxkIeRz2d+Gpwqty4SNJ+8NJn95l8/hU4xg
 3BVRH8Q1h4ZSD4w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0ec478 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=2sGp0kyKjRk1obZUzdUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX06e1VPlp9XyD
 gpbhDo+3q5wR6SHZY77yGp8tBWoMlkPDrkxC3NthyCUYBeemy23lPxCEQnCG6+jGvCS266MpHFj
 svHph1r3gHhubfwE5Vg1xT1M713ccy4mwdsP1YGX7fIUwo9n9OE33I/ckOBYNTB6fmflEi5VnuJ
 CUW2+IJL2+iCEUi1IPjijNNLb+Pq61AiVbsnj7x/9fqYXQI+Zz6if24pUkSArtXO9KAsIza5BN+
 nPs8EXlIUQxR/AK+Qdu9ezh1DOMTkVjXC8O762y3UVjnJz9LIdaIJqXp4ilQCGx/XENepnjihRQ
 rzVTH93otXB+SMCFBB6D9+gpZKgXlzrC6+QUTQTSf8vCuMAwTP4QqoqzPnk9U+Yd7/a9K9cZpul
 RXGYxSVrDomZGAKT5eTsFy0IAS/ujPtI7c0cwdlPbLFefbFsAsoLapcLyTrB6y4hT94tOzJ5JAZ
 BBdxUeHzVN0YX38kUVw==
X-Proofpoint-GUID: iz8fdmOcmS5xZSVxoXSyEeYGwb35-HVv
X-Proofpoint-ORIG-GUID: iz8fdmOcmS5xZSVxoXSyEeYGwb35-HVv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37850-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pdev.dev:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[66];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D363C5A1A2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When using platform_device_register_full(), we currently only increase
the reference count of the OF node associated with a platform device. We
symmetrically decrease it in platform_device_release(). With all users in
tree now converted to using provided platform device helpers for
assigning OF and firmware nodes, we can now switch to counting references
of all kinds of firmware nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index b14f707f077bcc535fff9484d1ec904616d0a1d1..2a99162263e95f026830a437047dbf9fd347a27e 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,7 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
-	of_node_put(pa->pdev.dev.of_node);
+	fwnode_handle_put(pa->pdev.dev.fwnode);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);
@@ -705,9 +705,7 @@ EXPORT_SYMBOL_GPL(platform_device_add_data);
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np)
 {
-	of_node_put(pdev->dev.of_node);
-	pdev->dev.of_node = of_node_get(np);
-	pdev->dev.fwnode = of_fwnode_handle(np);
+	platform_device_set_fwnode(pdev, of_fwnode_handle(np));
 }
 EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 
@@ -723,10 +721,9 @@ EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode)
 {
-	if (is_of_node(fwnode))
-		platform_device_set_of_node(pdev, to_of_node(fwnode));
-	else
-		pdev->dev.fwnode = fwnode;
+	fwnode_handle_put(pdev->dev.fwnode);
+	pdev->dev.fwnode = fwnode_handle_get(fwnode);
+	pdev->dev.of_node = to_of_node(fwnode);
 }
 EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
 
@@ -921,8 +918,8 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		return ERR_PTR(-ENOMEM);
 
 	pdev->dev.parent = pdevinfo->parent;
-	pdev->dev.fwnode = pdevinfo->fwnode;
-	pdev->dev.of_node = of_node_get(to_of_node(pdev->dev.fwnode));
+	pdev->dev.fwnode = fwnode_handle_get(pdevinfo->fwnode);
+	pdev->dev.of_node = to_of_node(pdev->dev.fwnode);
 	dev_assign_of_node_reused(&pdev->dev, pdevinfo->of_node_reused);
 
 	if (pdevinfo->dma_mask) {

-- 
2.47.3


