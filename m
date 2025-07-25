Return-Path: <linux-usb+bounces-26175-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AE5B11F6D
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 15:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7885BAC1C4F
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 13:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AF224113D;
	Fri, 25 Jul 2025 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFMxBegg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8751A2C11
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753450666; cv=none; b=p6X4a3Vm7aR2LRbaSd3oc45IibxkHkpWqj5QkVbwykpyQZDWFXgrgp98I8jkYL2omIGTpPunLoBzyReIS1bDT/EVfKkRspGG3X/hdpEHlHBUlDRV0Rgw7lNcC0NJjDan8dshw8urYUNIUBZIXCOntOXXXTaKqEk2pOZ58mzWoow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753450666; c=relaxed/simple;
	bh=l1wCSmxzlzvs1NK7wSC0udzHWXbsQgqhg8xqqAEBik0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fca4KY+VubT2TV/w2fKcwVutTRo0fvWx6nakFtZcMXM4oCbkLb/+mXf0xWeyVdYTjL4HZS87sMCUMyWPw0X39kAfWzIllPujIt85H6UgoG/MV1G6K9nhFNAh1FCWvysZi7TGHbslkOYRSWHQLKSBRIKKJh8nJXdIPfnLvpgLnxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFMxBegg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9VoUV004895
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 13:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2rC1YJt2J+//AT0SXKZ6woHQKaVJGxLTaWdwzA5Hqd0=; b=AFMxBeggb6AOffZU
	NBLPj7p6zJ1OMpAy89hT7/KmpN57vCkasbGzUrX4r/y51U8+K8tVUWI8vCdeLh4O
	jlcHG75F349Ko9YdXavAhcNX1YwAhb6tvSjnJCd6s3qbgyBrLi6LwSKy/wKHd+Rz
	ZFDnyEy3xlETIY/RVYe4fCn+hsf+g5bqOSGpT0ZRwyFMutAM/jBv59girZ28cRAN
	erO2KIbU+qpYKVr/jj1kUSlutXgzzsR8aANrcIwv1m0VrhZwP/Z8qaLPXQfX0qHg
	75DUzMf6QVK2X/eGx4V35//G67yFhLXgQDdtPX32BCOvSrv0LPBjSYae22/XyvW6
	+NbK+A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w53a6sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 13:37:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb01bb5d9aso33229486d6.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 06:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753450661; x=1754055461;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2rC1YJt2J+//AT0SXKZ6woHQKaVJGxLTaWdwzA5Hqd0=;
        b=BEbr17fKIz43BbNJY//0J5rBtkBRwEqdj3f3FnPf8Cc9zWY4O2KYuJa+dPkEj/+xSP
         K7Q94gkIAwUZxZfHAwyGGl/9Opo7RFGDeAOMdrrZEAbH09PeP7ThwTVcnFkQEqPaAykO
         XThy1Zj73IIUvb5dBMZHaAzeexyVXBskTgVqHspBcsfQ3llSJ1drbXIOhUooZ0ujOcgL
         k8MA5btbIPxGTL3j6cbLUemQST+YzK3UZopC3ke/stfRoRyTzFQOMdxOwdyNJkDjfujP
         +lF359PUC5kJTp2ptadKjTkC5oSdyYRZ6xqoRfcb0FF6MjGRR7bGpwOI/78hh87yMcgD
         hb5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0BprsB24LlIRSpnY3qTvOcs5QBz2SWtlySb/QA8v8buGVRjQOLAAt0ZhGDyxSXOIvloOJS+lB4qI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9M/u/IsF6GNpJJ47JCgpAe8FidyuQB2xapN1pcscspnDeNj60
	frPLMgVHnyzj9VWWhHp/TWL1X321t3ajxjnYR3F8vHYOr2IT9+raI5FrrSjO/KZHEb1xdi5Y3P8
	CRsqYhurplb40aRTUzi2LVkHr+k8xn/+5kE60/9Gur/IBmuL32OicO8aFQoXZ9cI=
X-Gm-Gg: ASbGncsR9XmSo/pUtqqqKEzAQbfkb16zLiG+BgCxRPdR5sAhFJDJ0FEKuqh1kKjOZvx
	nG+tEKqZMXBsM3go1KQgBSBxmLqar3Y/MqNmJLT2ky5aTKGCNTMYfbHAP1zcyg8nb4oW4WpyWpz
	A79t9Txx6aj/ZZs2DUfCLsdrE1UvcEcVyHCK9lzS0NMqUlfGGSR7dtCMkrc5iIGaxGSfVquaLHv
	BiLB6zy+9QHWWL04n43ci5b1Z/gq3Q3lO1HSuPW0gLkUR/o78E1AU47RRReBwJQVECym8ugSATu
	A1SIQtSzQECJdc0wW2N3626jAIyVT72HLP+x5OOx4ujJudoRqWY9JimZTKH6jwPrHnXxvyTcVQt
	Z1FsxO10ptGp9qymIKzRaZDX8JOm4RVi7nY5w/GC/v4END7D3u6hh
X-Received: by 2002:a05:6214:f0b:b0:706:c5f3:1da0 with SMTP id 6a1803df08f44-707205c1b9fmr30283526d6.36.1753450661068;
        Fri, 25 Jul 2025 06:37:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEWHL5mgOQMido+qUUdTF5v4fO3m3eU9gYx2OogR19UUifLAGsAoBTVSYGVi3FjhEaEPLXpg==
X-Received: by 2002:a05:6214:f0b:b0:706:c5f3:1da0 with SMTP id 6a1803df08f44-707205c1b9fmr30282756d6.36.1753450660228;
        Fri, 25 Jul 2025 06:37:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53c9bb75sm932517e87.180.2025.07.25.06.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 06:37:39 -0700 (PDT)
Date: Fri, 25 Jul 2025 16:37:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Message-ID: <fo4hek5twtgl7fa5ncqefatowz5nw64iwifaibl3yyzonucpqz@uwwxf5jdke2x>
References: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
 <2025072446-ensnare-hardhead-12f5@gregkh>
 <CAPHGfUMnaJ8HPX=CC_q6m2nbq-ODP=MY_NkcvHjXR8mD9b=tBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPHGfUMnaJ8HPX=CC_q6m2nbq-ODP=MY_NkcvHjXR8mD9b=tBQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=AfKxH2XG c=1 sm=1 tr=0 ts=688388a6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=ag1SF4gXAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VSMTo9EABuy5iElPEDkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDExNiBTYWx0ZWRfXxQmXue5A6Ypk
 icmddkqNEN9xilOBCSWE97KmhMzLCaP1hsNYLhXJ+Haub6BnlYaQoXTOQwl1C9FEds9Uz5P8UH5
 BPljwQIV+e0el/oROMYTcrm+Ctgsf1hZoI/Ygb3xCGg3bM+r+kR732RX60TQleGt1EXjOOFkMsX
 BtChkBMNXkb13ynug3TFncGzrdQrkAcFkU38wP3/omIhcvK8fflV8/QwuPgVQolp2J9hQjkStcQ
 8vnAUVasxfTCbdXJWZFUC2bX00Kgp0QSNJw3HRxgcaDJhC041cY4w/StXAbZ38tvu2oT32x3sj6
 J1cwaiV0Kq2ipaMYZSnj/TQHowj86zdOLRPGkaZ3SQHLQE0hjEMGPUXWSitbb6f2F1bBnLbKCDl
 7R81/VGD7bc2w7/oIyNi324ymYS6ujB8OQhIoIStCLyRPwxBzrJq1CjnwJabitV+a5KYnHD8
X-Proofpoint-GUID: AUh2qwSFgEGZ0DzrzqrsZnRsc2GF3vj0
X-Proofpoint-ORIG-GUID: AUh2qwSFgEGZ0DzrzqrsZnRsc2GF3vj0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 mlxlogscore=846 suspectscore=0 spamscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250116

On Fri, Jul 25, 2025 at 06:19:21PM +0530, Komal Bajaj wrote:
> On Thu, Jul 24, 2025 at 3:06 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jul 22, 2025 at 05:01:53PM +0530, Komal Bajaj wrote:
> > > EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> > > as read-only for operating system running at EL1, enforcing access
> > > restrictions that prohibit direct memory-mapped writes via writel().
> > >
> > > Attempts to write to this region from HLOS can result in silent failures
> > > or memory access violations, particularly when toggling EUD (Embedded
> > > USB Debugger) state. To ensure secure register access, modify the driver
> > > to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
> > > Secure Channel Monitor (SCM). SCM has the necessary permissions to access
> > > protected memory regions, enabling reliable control over EUD state.
> > >
> > > SC7280, the only user of EUD is also affected, indicating that this could
> > > never have worked on a properly fused device.
> > >
> > > Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> > > Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> > > Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[...]

> > > diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> > > index 6497c4e81e951a14201ad965dadc29f9888f8254..73ebd3257625e4567f33636cdfd756344b9ed4e7 100644
> > > --- a/drivers/usb/misc/Kconfig
> > > +++ b/drivers/usb/misc/Kconfig
> > > @@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
> > >  config USB_QCOM_EUD
> > >       tristate "QCOM Embedded USB Debugger(EUD) Driver"
> > >       depends on ARCH_QCOM || COMPILE_TEST
> > > +     depends on QCOM_SCM
> >
> > You now are preventing this code from ever being able to be built in any
> > testing systems, including mine, so I don't even know if this patch
> > builds or not.
> >
> > You did not even document this in the changelog :(
> 
> QCOM_SCM is essential for QCOM_EUD for its functionality.
> One option I'm considering is using select QCOM_SCM, which ensures
> dependency is enabled when QCOM_EUD is selected. QCOM_SCM facilitates
> communication with secure world, this approach should not cause issues even
> when COMPILE_TEST is enabled on non-ARCH_QCOM platforms.

QCOM_SCM is not user-selectable, to it is not correct to depend on it.
Have you had used `git grep`, you'd have seen that absolute majority of
the drivers uses `select QCOM_SCM`.

> Alternatively, I could use a conditional depends expression like:
> depends on (ARCH_QCOM && QCOM_SCM) || COMPILE_TEST
> 
> This would allow the driver to be built under COMPILE_TEST while ensuring
> QCOM_SCM is present on actual QCOM platforms. However, this would
> require proper stubbing in the qcom_scm driver to avoid build failures during
> compile testing.

-- 
With best wishes
Dmitry

