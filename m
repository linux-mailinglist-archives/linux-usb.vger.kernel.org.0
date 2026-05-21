Return-Path: <linux-usb+bounces-37836-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLF5H7XGDmqzCAYAu9opvQ
	(envelope-from <linux-usb+bounces-37836-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:47:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF73C5A1643
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7793E314AA5A
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 08:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2593B8120;
	Thu, 21 May 2026 08:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGSv8YHH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+Iq35jx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11433AEF2F
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352654; cv=none; b=n2bih5QG0cBPAMk5xD+69XhIjeNpryXfCboWBhj6ig4vUXO6Vg990G2L3ur/jQ5bT6o1iXF1x/wJUFYrk2JMlIHTKp4XbUp+ROOSJy0MZNbMFv+QKETeqTV3nZxJXQ9t/88Yl+IBo5WEvw4Hsp0LjCgqHFk511Ka01EhoxgzFTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352654; c=relaxed/simple;
	bh=wZzo4F+iEv+cqnjZacAyiOQUCIfz9BeD5LEdTUENfEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVW1s/KxkS6TVVQqFyG69ldxv1A4kiB+Bu8nYT/TTI35KsMvIHj3a0XYVR/fE+MVXppJAiMC674/PCkO/OHvL9yX7utGq77iBACGw0Te1ej5rR2H0KR5tJaH4slh1J2Xx/50c3D1BlFiHyXlNAEbfhbHScKSEq98Axz3HawB6W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGSv8YHH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+Iq35jx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6hXCP118974
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 08:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m0PJY/EBXaS+NGqlIlXtzUywSQPQ33CG8O0mf5HsOtc=; b=TGSv8YHH2HHm9gce
	LO05rZSE6dZib/XINNl6hu/QvmGJtgVvta9prqDrYEhZLuap803BPNi5UJ6pclC5
	8u54UuNFHHifWzorPhqhoAujRKyfX2pOVUtZwN4/RWtZiEIMKIKCbjA78t55rW4j
	NeAm+13eASkdx3gOsHfhlBsFIp25sLXiXlSJKlr4hMmSH+3icRb13RT2tf2A6xfl
	Khpg0wQCdp2jMuElLBz/vJ1F4RrRglBsQ+G+9NE6yUo2soHkDy+sOzVG0O6oTes+
	tevab/rwt7fnTEpBxDXzs7qe82eYsaXRep86pEQUxvQmJYEi3ALTpInszxXfFbG+
	FnGD5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8c198-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 08:37:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51605cf3c60so67355661cf.0
        for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 01:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352646; x=1779957446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0PJY/EBXaS+NGqlIlXtzUywSQPQ33CG8O0mf5HsOtc=;
        b=Q+Iq35jx1DZpTNiLVHzM5216k3jFIYQ/vOsMtjVb3H+PfqXodMSglLhjZB2LTwBfNz
         +FnIagPxerOItHadvkpZ/tctBt1PH8bIFkTk4t22XgYAWXofCZ3Hz0PyYoNZcxcLY9L7
         1Uws/SjmHoLVozsoOqTeOyl/1O8URb26f/lUI3xdao1L1vEtUiW/iNxitmQZFnXPsu7B
         KbfBDP91zlPPVD9EJ5FKVrS1yPtnDfi6N2RR7lYZShcuZ99rUDgKV0OIlH2QxIEcy6na
         7kCi6um6UeYweTesC/5nw1Zlb4LX3G0tt9OKrGe0hyg+K+OHn5nUm7zFIolL+UCWYHN+
         BNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352646; x=1779957446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m0PJY/EBXaS+NGqlIlXtzUywSQPQ33CG8O0mf5HsOtc=;
        b=hqQk0D/fC/5gPLaA/rZC9EVZs977mIvAa8eUI89yw6bs8DNxbn+IQSZy3NfMWxjIax
         Rs5hJMLfaDIRGCdNgMraJPO9qx92vULGQN4MsEYlOVa60gqmxc80cLpKWMeSMjv/o0CM
         FfwiQvWbKtJvJW+79/N9NdRMj3/XxN0UmS81p9M5JK9ZiLsRfatu7RjPWYTyqDLlfGYu
         16nWVlEGy4ua8ZUKq0l4+1tZkdfpTCGKL6Dqiddlz7i9Htc9vLxd2cn9dWN7oWKCgIAh
         Q9axB2wx5YSz52Ym96sSVwWxvJJr1b6Kxfs+sjhEDQ3EIRw/g1uPmTn+j4YzaiL5ngU2
         y6Fg==
X-Forwarded-Encrypted: i=1; AFNElJ8p9XJHzzylFCw7imp/igws/4jvfvWy7Wuu0b2GARVgIq4IkSvueOFScAYgeXUK+6xql5CmwI6LogI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Bf+PWjsj+U7IaFcmczf4t+Ds6L+Yx4mCQJxyi/zeWBew7Zaz
	Jo+enM0oDqzrBDlcPsyTrU9Pma1FlR0l4JW6fCWZv/B4Rvo+8FYa9OrTYdHCIHQDB2EnI5FL18G
	w9zDZV45VFaIuzREZmG+rKYbUxS4OeQOGmGdh3E5h+3NbexZuWLaqPAwoknx1x74=
X-Gm-Gg: Acq92OGvqR4oCxsYyX+C7gqvDZA17wS/OaCsKvZbw2dAHIZVST4O7ehLOFvd/FvWpID
	sx97sWwcwLdCAcQM7BYZXCBPqBJOlUurMMgf/X7acDoaAX0TcHjEpKd6i+Kg7HGU/nHdh5XI2h/
	tSA36njVfwCUbZAJIgKdfqQU36bnxG9wnj/kvHYQbhs8pe/LLLgGQwh5GG13H4nA84r5K6/XDqm
	cQRqoZnHOhBcsyhY97ShvWkN5aEaITvWpyCvjOxocd7aE8aiY1znSRh/H4oP5kZ2KvUPXnZPnma
	n+vWoYrnSsU+SeiJk/7zK4+cFxPbLj8NAAzraBHWsW0h/uKKS1he27stz3BLiOD4r7HC+eHEsMc
	BXEoluKpSipiYdTsIXhHyvnyrhnbBliqs6l4UDvXNSo9PkklljXc=
X-Received: by 2002:a05:622a:5588:b0:50f:817c:2fe6 with SMTP id d75a77b69052e-516c53d8aaemr28108771cf.2.1779352645796;
        Thu, 21 May 2026 01:37:25 -0700 (PDT)
X-Received: by 2002:a05:622a:5588:b0:50f:817c:2fe6 with SMTP id d75a77b69052e-516c53d8aaemr28108511cf.2.1779352645294;
        Thu, 21 May 2026 01:37:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:29 +0200
Subject: [PATCH 06/23] driver core: platform: provide
 platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-6-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2715;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wZzo4F+iEv+cqnjZacAyiOQUCIfz9BeD5LEdTUENfEM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQjLvHgEkgDUYcyQqS+YI0tDoWCf94BkOfk6
 vDphiey46iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EIwAKCRAFnS7L/zaE
 w10mEACuBjw1mRfWGN/zZYles7aGCy04DbiAjWjYefDvcAqjwNHVbQPGTfR9vvDt9Vt3opZlUfJ
 1ytnUuq6dFumO5reYJ78tEy9o+PkI8VY7UoUHI9DX2cKKEeA6fkKzjp3sYJvTgqJELasQOkPH8y
 PlZgKzt0c0z6CLrSP/lqxiiyL6Roc+RIVEg6THFxHR5OoOrX4+KXE7TpYW/+9R6Q2BP2a5mjGKI
 I8sHIVxHMgpemPUcVLU4/uTLyuQeLaADPratIxqvFuTx0AW6AOYaFvaamCkQMd//4qESASqVPxq
 Iqc2iJqP6r0b+IvjJO1nHSUPlB1yTjcDLn+baiOlmwj1skALP2IMeucYdve6oLVmXSGYq6qAYq4
 gC7R+np/sgYQ3f5xLBo/KtwsaKQb6TSf+ZaoZnYHVqW+A9akzduAnNlWFKW0UODQ9PcBDZadov/
 3mRLrzwuMo293FdKXtsUcYpBMNIX1XEo5vV2REkvT+e4lLq2oAkW+Y6KmtTYYkzZs+myeRmoTWk
 ebeqMSKJ7NApWk3IX+x4SN84ESMRkBiuAhe1JJ+h0WQ/IOtxcd82UQCshyJxQ8qXTzoFMc2kEEB
 3KNvxUJHXaBt2BDRHwinv0uRBTS3Qwt835TjvmqeqIrB1g5DU3xqpgR0Yja7mcdp35huKbkn9rN
 lHge5prVxo4DdaA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: P4EocYyjSOzRRgJ_6LMOq47VGoqU6aK5
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0ec447 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Q8RKEeUEMY9O-VPP2I0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX3ff1XJDIs69+
 8ae+B4XaiJ4HFE2DpZJNc1AUwiQKn6rJXMLzi8DyjZaTYi6jLAW3Wc/bp7nzvzXzHHWXZmWyrB+
 EVZzFBhcTSn2gOQOdNhB75RQ8gfkGlfyxKxw8xr2eHXZcz0dh87+6BZLcn+VjcEFCFoUm1uisDL
 WoODFkc/Sj78NZWgXTLb0Ao9EE+Q1er/Z8H742jMdtsyf80KUkVIetRvrM3AXcz3iZyuFXXEwvn
 D6H4uhONZOTZp6qeNml1bi/dUQef2uKNP1YzuLcs/DmzyVJvUP/7Al34pTg+B5fT7XZxlrnBExT
 QGvGJZEIEHdPsavnBxdXysic+X+uguKFrbDoEse9PPK/zxJXQY1ASYeOjVG6vW7zq3TPrsbh9eb
 IY+W9IFSoiLF/ZD8eF/yL7opAq6rtdXebCCVpLt3JbCsnCW6RsPrTALy9d6QYyIJqoPDn9QNfXD
 B3gDM0Wl32N/0Kj/8Jw==
X-Proofpoint-GUID: P4EocYyjSOzRRgJ_6LMOq47VGoqU6aK5
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37836-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[66];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF73C5A1643
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Encapsulate the reference counting logic for OF nodes assigned to
platform devices created with platform_device_alloc() in a helper
function. Make the kerneldoc state that this is the proper interface for
assigning OF nodes to dynamically allocated platform devices. This will
allow us to switch to counting the references of the device's firmware
nodes, not only the OF nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c         | 18 ++++++++++++++++++
 include/linux/platform_device.h |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 4824d9a2edbe9ff86cc9893cd74688e9cbb6483e..ec53383fa17ac29ea3b15b61f97ae65ae8ca22ac 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -693,6 +693,24 @@ int platform_device_add_data(struct platform_device *pdev, const void *data,
 }
 EXPORT_SYMBOL_GPL(platform_device_add_data);
 
+/**
+ * platform_device_set_of_node - assign an OF node to device
+ * @pdev: platform device to add the node for
+ * @np: new device node
+ *
+ * Assign an OF node to this platform device. Internally keep track of the
+ * reference count. Devices created with platform_device_alloc() must use this
+ * function instead of assigning the node manually.
+ */
+void platform_device_set_of_node(struct platform_device *pdev,
+				 struct device_node *np)
+{
+	of_node_put(pdev->dev.of_node);
+	pdev->dev.of_node = of_node_get(np);
+	pdev->dev.fwnode = of_fwnode_handle(np);
+}
+EXPORT_SYMBOL_GPL(platform_device_set_of_node);
+
 /**
  * platform_device_add - add a platform device to device hierarchy
  * @pdev: platform device we're adding
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 975400a472e30e2f98cc8f13bc36a63129bd4fcf..21f7d8a7f4b5c9a47d56d80a69802b3f84457ef7 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -19,6 +19,7 @@ struct irq_affinity;
 struct mfd_cell;
 struct property_entry;
 struct platform_device_id;
+struct device_node;
 
 struct platform_device {
 	const char	*name;
@@ -262,6 +263,8 @@ extern int platform_device_add_resources(struct platform_device *pdev,
 					 unsigned int num);
 extern int platform_device_add_data(struct platform_device *pdev,
 				    const void *data, size_t size);
+void platform_device_set_of_node(struct platform_device *pdev,
+				 struct device_node *np);
 extern int platform_device_add(struct platform_device *pdev);
 extern void platform_device_del(struct platform_device *pdev);
 extern void platform_device_put(struct platform_device *pdev);

-- 
2.47.3


