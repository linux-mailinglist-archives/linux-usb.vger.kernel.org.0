Return-Path: <linux-usb+bounces-23681-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C71AA87D7
	for <lists+linux-usb@lfdr.de>; Sun,  4 May 2025 18:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB75D189813C
	for <lists+linux-usb@lfdr.de>; Sun,  4 May 2025 16:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360031F3D2C;
	Sun,  4 May 2025 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p61HPtGl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39A31F2365
	for <linux-usb@vger.kernel.org>; Sun,  4 May 2025 16:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375230; cv=none; b=IwBkKz4SFrSAXc+Y9tb9JiEnV5h2Dflifdxd5SkpnUKiLRPZYIOss41syK8Uf3dm7rBZBwcFfLjv4P3lf4vz6dRi3X78DS00+7H9o720myuAFCi8Iah+4KjiuLLuC4MtfB0vAS8U7Y6SMjIV5kf5jIarg694BFhMZzL4K9YPBHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375230; c=relaxed/simple;
	bh=Skbd065aT0ZHQcN9uGka7V6r73b5ykLWPWeCTpFhdBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TiQOddgnPCVimlVl9K/3oVPra8CAbYCGyIysMSfZrROXZktTiKduh36nnk6TsskExNltelNI/ZkroWaTGtbDzXjD2UUCPAy6+t29yDEaeJB6w0FzCr/L47HHdKvmT2lzLylvylgIpT0kRcN0LZ4oKVkTBNChMhqSaYs6gWXnbpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p61HPtGl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544FL3Q7014910
	for <linux-usb@vger.kernel.org>; Sun, 4 May 2025 16:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=; b=p61HPtGlIeEUxjqo
	ybywT5R1PFpAyKPZrQFAiTzHEkkKv0mRm11o7LyHDiys31qJI/nQ45V0w0HEnLwx
	Jc/K2zT6KjvWz7OkhlHVloBS6Q69jmEjaxNIa8wxcMzaGwNE2cpfjF74yleafYys
	2H9n+GA4P3pB8MclK5INKPmMr+tVT+rJ7IDT4wZ586o5OyAjnulK0p0Gpok7jnwZ
	Zohh2mA8Gb//nS99mU5BcKvJKYO8aPujBAaiE1DVjYrvTegcOHS0+jMi7BlIcM+x
	vpIhZlTndetVnqAp3JWyG4pCb4vL60Zq/D9OsRhtacCzexQSUTUiJi89EHyazPXD
	JLDw0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh7a5d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 04 May 2025 16:13:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c9abdbd3so354266785a.1
        for <linux-usb@vger.kernel.org>; Sun, 04 May 2025 09:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375227; x=1746980027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=;
        b=SCYeM8i7T1nIlRHEZAZzSgkn2YINKVUTlH0wd+qqkc9XW0o/cCmP/AnQGziO5uH9Fv
         z/1bYHvytxOZVwNyVvNO9STqDC1tCFL6/N/Bd0FKI0ttAzoRBCt6nH3UW0vSjH/Mmb50
         afIrA+ZADAQDw4SJQ5YjH1SpmeMQ5Kmp+JMxkMPzq6naj2IKPtstXa1t/V4VDinJMaDv
         +LYYhdIH4hgtbVx5wi3pc5BWFcJQQ7CJMnVCLsqjxLl9Rxx9kG98ySDw9ibRTnw1XI6I
         F9G0bh3uyZBdj7EYVmAjL9G+eyEwSTPkCmwbcYPPgc5/IP/7yAad6wvqjHSyKc0bAO5j
         j1Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUswIduLYRqImhtoIL8aLsYKEE7N1gNiZRELqsiJBdtCxoKrBLIIxSi4QNZ0Q3ICtHBYa0JTmMvmAI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl9hjbU6S9/PJ5d4jOlHBUiY7fJvYpxwL23rPcYzd6gbf+I6y/
	soYH1IWcV6pnecmc+28CrLBdTdnbuD3Ug6XylldQc5ghsAeAGmhpGNsIrIU0unaahpLY90OoRjD
	THZJE7ELuoE7GtvIfT+wMjpJbMtVrb6CyiNmL+AX8gdKWNbyn5+mM/sNfjbg=
X-Gm-Gg: ASbGncvsqOlnED8iZoYuGJSE1E2q1cMH3lX7FwJtAzgIojyH2dOjtUGl+/dytaZODfd
	LPzDK72hk4G5+tmfT16YF4+O0wQgfrDZJzbCnNVmZP+5LcDwXYgRZvUVPLyStFTQCw+aztTAtj8
	k2VDCDz9gRlbyD5HZPlPQEd8E97IhJu0sLEJmHVBn+c50wl50lKCIcQAI+hmD34rFFAJwEHhwij
	ItLeR1vQ8meP2PmszShN6dblHncU0uUoCKVOJXxOcQpJqTWRHDKXJ8kOs75ns262KNb3AXVl1H4
	E1rLeqH9nR1+CCHoaHhcxTrYG4EF2bokdsEleUvyff6pS8na3odhWManJii9DY5yLjuSxogxzmr
	toIcmrdvP3jW9UWwPni0pG5FF
X-Received: by 2002:a05:620a:414f:b0:7c9:23c7:a92b with SMTP id af79cd13be357-7cae3a883afmr521804485a.8.1746375227101;
        Sun, 04 May 2025 09:13:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWfqVRImHTF2hlg2i8dPTXb3VY+dorTtSOXnHwH9+M7i4F2YAepO0JanfpdKI8BQ8brOlCnQ==
X-Received: by 2002:a05:620a:414f:b0:7c9:23c7:a92b with SMTP id af79cd13be357-7cae3a883afmr521800685a.8.1746375226766;
        Sun, 04 May 2025 09:13:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:45 -0700 (PDT)
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
Date: Sun,  4 May 2025 19:13:27 +0300
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
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=6817923b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=AprTATsQUE9CPNEuHX8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Ynz8hopXgHTvWMkCPZMzzeBUvB6FUr4b
X-Proofpoint-ORIG-GUID: Ynz8hopXgHTvWMkCPZMzzeBUvB6FUr4b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX+LSFC4UrmO9Q
 mfssQSjmK9eSE5nR1+MpXHGJ/QM2lzEHJ5eFOAhRS4Kx0jt8PBGAri7OztyIEwYxP19ffnWhy4W
 PCO7+ww3VpwwpbfV91rNPbydM382Ohc8iER/PgYzTy0zLvkjoqPXanZMmzew42UMqjWe7YA8hHe
 htATiVJPHzUoC3p64xKdgvhPeMWWA0DXB0QQxVJxM8DzXagY8DEtq4tTU4Rjtt8/kwyQaUGMADN
 uGaVtrO6+YoxrLjOuR5gLLeUotIrcNbiiIrluInGTaxh4GFLxsMdNIscSPw+Dcn2b+w2FoIC0e/
 AyCr09JMFraBhQQpsZYt0yGXqL2Cc66hJfNRRT3b9sMbzOLIRfLDT8VOr2Sr9ZopBB4j3vZGP7k
 b4RtxN+cU7L561oq4RnVYF+8eXLiwwPGulpfo19wbAvpJSdEtPwIe6Oy40/2ZGdSLIbRDoQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=753 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152


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

