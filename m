Return-Path: <linux-usb+bounces-24085-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A450FABBBC3
	for <lists+linux-usb@lfdr.de>; Mon, 19 May 2025 13:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B2C917CB1A
	for <lists+linux-usb@lfdr.de>; Mon, 19 May 2025 11:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63707275104;
	Mon, 19 May 2025 10:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofkjOmZE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D89275115
	for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652338; cv=none; b=O5lw/ZkNY3DqnD8ZjjSVWqHjA6SXNgtvHwz+HOHWP0SXGBNWuvqij4sJMa9j2yttfN3El5iHhbPvOyjU5K9uaowk6SJk01dAW3xpqCRgNN+RShvtgDJdsGkIrDr/b54dyAbvMcGx9VCBchkBPU5YucHx50SkjwYCrx8/9eUWUoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652338; c=relaxed/simple;
	bh=Skbd065aT0ZHQcN9uGka7V6r73b5ykLWPWeCTpFhdBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lgkZf+hinPLmDiT6+5PnyFMAdl0p0VzDsxFnFaz2dCu8XwTJoZp77fjQZcT3CT5bcVzU0PEYZzOu/op5qtzU16khjVP0InC3M508c+eRFJzudsAXlVrq3sadcp6SIrpu8RYgOi7/XlmqUpkwOSjpynxoxqAlyp8N1jJ/m/qPgUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofkjOmZE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6P5bV007910
	for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 10:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=; b=ofkjOmZErSlLIt1d
	mCkbYMVN6TGC+Zeeyp/dr2vOSNDHi5I7gYcJ4gAq4tHof7zmYPf/F4bkCN55suW3
	J3wsTvqI51Br/tQ/yLNYFwBYY49E3FX6M011ogCt7V0fFUsW3oSE2g2L50UfoLgz
	8hNaw9OjXQANs8i2P7IgxiDYqXK6+GhLFmz7arXhtKvbNAhv+ccPDtGSOk8xIsyi
	H/ufduINiGxfqdaiAQEBb/0jbg5jWEI/Tu1x0sXE7CdsbWmhTOTsOdtSSttFbV5s
	6MMsK4noJhOoArE2iKWgOvtgxiqGaEAsJ3Y5IFRZCiWnvoCYVPk04YxG6d93OzAs
	c1AF9Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkgu90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 10:58:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8b14d49a4so37020246d6.2
        for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 03:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652334; x=1748257134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=;
        b=k+b/mjLYlDqdX0ANepXB2uP64KafOd3Trb1/vVXZzHT+4fYiF+nzPACciVp3mWWqaI
         crfvmUmcJ+eh8WAdEwdSxroWQeK1nK597vFBag1rhi4mc/ifM0uh2+pU3a3QxPwr5owo
         ZljqfaBMIcHIZ2UAU8bXE0E8IWPUAGGonbElaU9GlVmzigOo+a/4ROrmoGOPPa6a2puv
         6KTJv8DbWj1VVKRTd4dDIYbjfbff0o4EawbaaB49E3DSs4qJ9HX2AnqawAZrfzKKsDJb
         3Upx17mQisOBE49qIcBplqW05nbqPF+ZWu/A/+7D+g1mCUoIpfTrBQJrRn1Ols43lLjx
         I8+A==
X-Forwarded-Encrypted: i=1; AJvYcCVFI+4Kz39oqon5SWHQse3Dj3kDMim0mbl0OGyYCFl9lnGrG7jT8tzn6BkeB6sksV43y6KE1k3nTkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGHoRn5c31lzx4s3+eglF2raBMP101bGqvoQxJXFebYC5MOkw3
	uB8xiW109pewpiXJ6npdS0XcOBTcyM/Cm4cR3iPpdNK1eeGVv1U2cX+fGLWtOe7Eqxg56t0NphM
	L5ZbQ05l3PbNIhNOQ8HFKnDtD6etmcFDbLKOobvHEl5aTZidXt07/I64lbNZg90M=
X-Gm-Gg: ASbGncsOZGM6u1MMI6SW1S/pnLiK+SwARgJouNWIQrDVX/7OGZRCXsvM+GYLP06cbf+
	ASBK5aygboslQ8v+4KFki8JxgCuQYfkfCPi1iE9aIIOUxJqLhaKMuzEIm1YPks0LkcTGSQ9pS0c
	J/X4ybmv3QZDyOjCbw1k+4YU0Kvky6ddgPGupqHf37rKwmqYUFbWvtYQ45bTSAqbzrnczR4WmS1
	ne3ViOH2jYaBzWvgrIrU66kq6pEK3Gl6IW6mlzckjMzlWVOC13HBfc4Qq+Bnox3h7D06eEztwqT
	PVHPvw7YlJau6mzSLmuB6cVsUFIJzGcncs+ktTf0lGP+8B690YKz/84eF7OpStDvWK4iyANtlSC
	M6chi0MdhDZrr/SFmk/IcA2S4
X-Received: by 2002:ad4:5f8e:0:b0:6f2:b551:a65 with SMTP id 6a1803df08f44-6f8b094f396mr220669946d6.38.1747652334334;
        Mon, 19 May 2025 03:58:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9NmA4hTkaWiWt1DG/4qc7GE2Tx99AjTx/JlvVe7S5Gwt2EQWgtvBoTnNLcaq/78n2BYfQyQ==
X-Received: by 2002:ad4:5f8e:0:b0:6f2:b551:a65 with SMTP id 6a1803df08f44-6f8b094f396mr220669566d6.38.1747652333886;
        Mon, 19 May 2025 03:58:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Robert Foss <rfoss@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/11] Various dt-bindings fixes
Date: Mon, 19 May 2025 13:58:37 +0300
Message-Id: <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2iTVndDcxwvYLt11fq8jUkuS-GSYwdxh
X-Proofpoint-ORIG-GUID: 2iTVndDcxwvYLt11fq8jUkuS-GSYwdxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX+uMcSbZ0RlX5
 CVJQO2zG/K0Hb/asYAijAikeLErr5khYJISfUKlPCDLYHtJMQeWjI08JLrbwNWriJQ3hFCmhZlL
 D48Yvfp6XgoEcDibZFza2493Oi4/aZhZ69uLpQYRe2RnzFOq5t+dNXoSRVTw/uM3wVzTC4qkLOb
 WVklMWZ1RBaCOjV+xaEezVsjpO+M+GOJo6TDJEUjG1tOy6OqPeb7YFEJhBIfR/ewdaNN/YTjD1I
 3hb29PpV7hxmlzWqBkjrCsb1K65T+fQlJGSwLGsjXvuDDh9M/4I2c3mmku0PiQHtV9NhEJF2ZUe
 ciAOiWXtE5qOjqLja9VNom0X56zGz6AMY4+wFAn3XlO1C+qJxLxtlsipJVtcZ9FHAld+IPZAoS4
 OTTkH92ug1pO+G0rL3+SS0hySF3PcRYyglg/t/7JCNEyT5ShTAfnrQRJBAfPmLvGkywnj9AS
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b0eef cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=AprTATsQUE9CPNEuHX8A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=765 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104


On Thu, 06 Mar 2025 19:11:12 +0100, Konrad Dybcio wrote:
> A set of not quite related bindings warnings fixes.
> 
> 

Applied, thanks!

[02/11] dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path
        https://gitlab.freedesktop.org/lumag/msm/-/commit/60b8d3a2365a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

