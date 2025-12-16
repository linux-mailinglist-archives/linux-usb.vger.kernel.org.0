Return-Path: <linux-usb+bounces-31475-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C81CC2DE8
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 13:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E534D31CC92A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 12:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83079345CA1;
	Tue, 16 Dec 2025 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIFeGhm5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DtRi9yfr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96E13612FF
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 12:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765886900; cv=none; b=CecOziGkg0yMtk/xY2nmGakuQDgyS6OulKPvs9zIB6VfxfMCNsao0xVtKGVnNkI7U+JkulLv5adUW2DXp1HOkL6UfsqcwaaxcVNMX3NfwfjOLuV4KkTN61dYwcCJQDCpUCAeVHKVms5iwg3YcVn4lampVP2+WmO9YRyswgGw21M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765886900; c=relaxed/simple;
	bh=8Vj/lMM9rhEx2syYcxszRhvNu3d6eckMlX+WyHRKVyY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cWd4DZejcE+mBeyPBPDRZjF+D/m3bUDJyHxAvEIMGtad09QVgqwaU/hOnbjf6sFLFbU/2N4S4q5RXKUEcP1Si1VecpoJlzaWwIoM0fdCUF2gXGG+SUA0HYV0ypOMqV/iqF28TuDKpnm1VdoAua1fe6dKekjm39y2QeZHYdJC3b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIFeGhm5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DtRi9yfr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG8JkbX2573615
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 12:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lTzQkBkSZVI
	P/qwZGUKXC1S8FfokCEt/lJKZp9k8Efw=; b=hIFeGhm5E5+7xdoZZMH6Vgoxb39
	9gMV2w2tLk5z5ULZWflEEYVi+Bmbvz5KT/1dqC45cDV3C3U7AQ7uXkrwGfwDqy7u
	L3yrhVDS+5JD97yxtYzed2DcHavROtSkSM26iPomr2zxqXjlbq+K6hyX314BOYWm
	8hE5IgRqJXdBoGSnVcSK+GjqLnj2fPqNneiFWVyozQBSknjOti9qOPdN87NZzrPN
	rp0vDhiuvEPFLAMjjPYpO/Mwzf6mN+JoYCBdZbWDZ3xfssOQPwGUYj+NL9Oh8GE5
	aVzYURinDFeScIz7Rojc25d4eedG5TgiOzfZUve/W7KB5KCmntS9Tp8rlZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33thrxhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 12:08:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f2b45ecffso59639175ad.2
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 04:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765886897; x=1766491697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTzQkBkSZVIP/qwZGUKXC1S8FfokCEt/lJKZp9k8Efw=;
        b=DtRi9yfrBpoGGT/sLW5Mggyjk6hkNwMJ71wb5kOeQY1VJmTo/LjmPzimpTG4xrhcUm
         iatQCWK6Hglplyaw+hKSy3T9RH5hFQRzMWaRt1X/nrnARJtgRfw68/hO9bEnichWS1In
         +UFFA3qnNjK6emZy6y8SCchxurNpkGM9Riuw3StlsSEbuVAF5QcwSHdrsqvA3OUXZOC1
         7wh7yuBWy1LWWgiUdKAThL9RWB8Ue31aLGJ/h/zT2CR4hCS9Rog+874wXqO5pbrGvpNI
         cYcGenh/Vvc3zZlEc/E7dBsTv+Wr746OMK1rMFf/S0UYpFyPmRk6qUClM9KtqxtTZ7/R
         Sn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765886897; x=1766491697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lTzQkBkSZVIP/qwZGUKXC1S8FfokCEt/lJKZp9k8Efw=;
        b=u8JAnvhbal4hs34SfQ5hUyNw24mnvh98OF1JhFS4NMdzrvSl04iNeAiQjou2urbPcS
         k5uj4QdJJtYwtqLWkW0eaB352zJ7wH84zUBDvLqYq1NfpY4hY8n6dA+AKewM2/dedTrN
         bkVrx8sFnGLAw5uZh8xdWixF2g66R5CII7q26OpcP5HqnrSptTjKs6ITiiTRAV+h9V5b
         +6eFaOgeCHQv9TTaSCHNRDAebuIWp9tdxo0iwEMz4GWwj8qB/8RvNGL9EY6kjBkhArT2
         lmnx/gjxL05ONnUa6OBQbw45RkZ6PbdCZaQ54rGnaCAVUHt6wb1ob9QqFyoT4kruNs4z
         wjUQ==
X-Gm-Message-State: AOJu0YzrAQ0MeONroEWBmfDU+vlwQNvahtkMNjWdiLywjEwGtj7uy2Sr
	ZBDAvx+w5UUpU5fuX7mnflPlkV+Axy4bjBk4Q3b3ewz71y58vTDqiwWLRiMGKuMDrM8oZJElujo
	1mZ/AAhFjPiBEbIbP1JPffdFbgZhyNuObD3mr1rkA0e9ZFX1onn9IPw8f3BehWS4=
X-Gm-Gg: AY/fxX5dO7zIRk6Lh4kuKa46aus6qFnoVFVh90P0Pn2WNjMUV3i3H3TUjG1E7FnImDL
	m6pjUqmetODkxyISrDt58+LdS8BSuJXHxD6EL3+rnkmn8XAxoZXgR3Pcsol0H7KOw9+xu/wB/jF
	QBPTS0hCKD6QmUCor647rVlqWlMspKLs6kJ/ImmwCvLzp2i0F0yLh+KL7xPj+2ubfGKPlyvXkkg
	hmnZ1NgjuDY79S9S9izcQB4x3ph+Vyx3+5cHA0zU72jS1VccF9OuUW2shh91yXzXvQY73pA8PeI
	u6pMiMVihS0NCjaS8aWgT74ipHaKB3lKo5fr7c0ELem6rEHHBJ6JCi/ZvW7pIU056fEF/CN3Obe
	U1zy1PNqZ2RjPd9JzA5AI295MPbospZCaQxdTERNW7SI=
X-Received: by 2002:a17:903:2311:b0:2a0:d5bf:b27c with SMTP id d9443c01a7336-2a0d5bfb42cmr87964445ad.45.1765886897103;
        Tue, 16 Dec 2025 04:08:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpxJUZqLq80Ian06AlRB70sn0PsrZjAaYypZVukvEG/E2eUbTL7qWkDQClYuQjzLYVeKTbvQ==
X-Received: by 2002:a17:903:2311:b0:2a0:d5bf:b27c with SMTP id d9443c01a7336-2a0d5bfb42cmr87963975ad.45.1765886896530;
        Tue, 16 Dec 2025 04:08:16 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a110f6374asm48568695ad.63.2025.12.16.04.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:08:15 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 1/4] dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
Date: Tue, 16 Dec 2025 17:37:46 +0530
Message-Id: <20251216120749.94007-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216120749.94007-1-swati.agarwal@oss.qualcomm.com>
References: <20251216120749.94007-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZIPaWH7b c=1 sm=1 tr=0 ts=69414bb1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yqrMnzDj37h-JzaF6bwA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: GAfyC7S8QoQfzQxUUNDj_nKOEN9K8jf1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMyBTYWx0ZWRfX/V/sovVgFsSi
 D8f7FuVD/UcsAseVrqYvWNggI7sEXODUt0El8b0FVQWco80sgaxlpi0UiexVyo68ZEixB89P8vs
 UcvGdk3FNP8seD6yjbR4dNz9l+L+YhyzPFNEfz5KyIIXanfSgBih5JJwUwvhW/5Cvif5l0tl59e
 kNiXHXCQEIvX+IYQKNaeU13/at/k9RkDvdZgn8W4knSNRrYt+V+RJ10rWawbyKRmK2FHQER2Us1
 3EQuZU5IC2JhqhcEitRWEY8Flpyij7IgUWG6isryEG34Ky7bcGyboMFRhYf9qzP/9HLS43uTJlj
 +acdEm5rzKVqZi4taNhI/1qXtWQLg5z8fLImYUlIs+/7HsNjZW+AaWMr48w9vahVR+9Kr5Mfec1
 wM/ZqaQiW0CsOx153M9AA66AYkGVcg==
X-Proofpoint-ORIG-GUID: GAfyC7S8QoQfzQxUUNDj_nKOEN9K8jf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160103

Add the binding for the USB3.2 Genesys Logic GL3590 hub.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index 9a94b2a74a1e..6665fc4baf61 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -15,6 +15,7 @@ properties:
       - usb5e3,608
       - usb5e3,610
       - usb5e3,620
+      - usb5e3,625
       - usb5e3,626
 
   reg: true
-- 
2.34.1


