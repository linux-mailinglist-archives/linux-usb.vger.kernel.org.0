Return-Path: <linux-usb+bounces-26110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3137B0F0BE
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jul 2025 13:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E30ADAC2A0D
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jul 2025 11:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457472DC348;
	Wed, 23 Jul 2025 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UrlxioRj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FDD28F531
	for <linux-usb@vger.kernel.org>; Wed, 23 Jul 2025 11:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753268910; cv=none; b=MeNothLmJbAJhQByA9VYtK/UxocmxGg2TyfYy941NOOdyu/eMR0Tj7Pna8/pk2h0nTGq0xN+5uGUiAkTdlk9Gpnd85IXUv123bXcs7dzT/tvBEmZW5hwcoWUcooOVvh1ZS0noY6AyO01uRaY95pNmnkG847DX4A3nIF9LkpzlNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753268910; c=relaxed/simple;
	bh=afusP6XF3NlqcMK6WC1ygO/UhXjItlHBhT8/8pOnPy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHNSy/V9c+SVbGo7E8MyBXfkbx+lBZVyw8CIk+oJMPEO6YjTi6ypXp+ZPzdzQNHNP5pfN+OxoL6C7gttyZM5rHkUbBT318duiwgIVOW7NaUjSkGzu1eoWc50EaYXN6N7IXkrV1rilq/Vai6cR5YcUCzQAhV8WBtRrL02OOAwV90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UrlxioRj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N99MXs031357
	for <linux-usb@vger.kernel.org>; Wed, 23 Jul 2025 11:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hv4tjDdkBfCtIHakQybad2DkErSzaDqc83VYETJQBNA=; b=UrlxioRjE/s6dc72
	Tavgb/7Ta5dEHIc4LWao9G9NtLRE+KHxnwE77SCEfOMklWVwqwHGMy5ecrifbkrA
	LfTAd9Y3owrJIGyYkCc/PXdV8+IOSOxwAcU0ueom/Ydsyft2n+Cj9ciwiZ9dPe6c
	mNjZs6ixQLNH6x7Fb7S0s6kYDscqbWxpTxVIXFWxrBgUffHh9rdRL7PA6R2tom21
	eOvB/7bK/r+F63W+qjxdz3cOHpoRxEHFem/idtdBOV7Jk85HAYZ6Aenyb255hZGj
	5EcIoenfn3P9uVRazVEIJAsciDEpiJmjEdOXhPtpYdS1fDrrXCkS9oYOB4z95FzK
	Y3DmKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s4wum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 23 Jul 2025 11:08:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e350915d2aso1847092085a.1
        for <linux-usb@vger.kernel.org>; Wed, 23 Jul 2025 04:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753268906; x=1753873706;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hv4tjDdkBfCtIHakQybad2DkErSzaDqc83VYETJQBNA=;
        b=O6EFO84drvTjxEmWg+LUc4dikyEvyiEhxA6YqjKDKqq6xwJhN7BJgOnAHCkYtXz2pm
         8KinYoL9D9j0iikIjcMAaG//Z/Ya+pK9LF3Upcu2ROyKU9v+sgSJGx52H/g6OMLezhLl
         xSprDp2KEk+AvCMJdy5Lhf8wAT6aihqp1HjtEcD/mvmDycrJ0UghFhCI7VFLf15JIuB9
         1MTQz1oV+8y89J7HGKITIhZm2plueDpNG+YYKEiws6A8vO0UaTsmGPra0to8gx6vjGBh
         PrYEeo72mWLFxNjeQccoZsImb1ANfsFKEHeLU05QQVAt8GJOUQKs2uOBRGyjJxZZbQE6
         wP5A==
X-Forwarded-Encrypted: i=1; AJvYcCVXh0lRmBhEYAeNLS/UhNNmAdITcoXHm1Do6gutPqmYgwqDi2Gp9l7UiY7YR3UDyaOc0ngGcyykj2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVtgbVj3JUCPZSFgeml7zmTwyOxSQjjV1Wx5EZ7PcNV6TJpHNP
	SFe/y0vWIsWd/m9xDIcijVt+vjpXKypX9uwOe6Ztn9APXQjQKbveB9bkoorPmDBx6XApl6doZHZ
	Hqaye+6hQL2v4EwT2teqfKv8FxV52WvfHp3AtQT7FrToxVmXbYZLfwgSqXp/w7XQ=
X-Gm-Gg: ASbGnctNFY1GrFxKVyye8vRfon1NSeuVjGR5rljXXoBUprMJoxLHvs/3i6qAvtiBmWS
	omeG+v+q0ARG+CwyUS/mEtTdpYhQYeaRJOIC0mXwfYU943BbOjsB9mqUCtD2H/LVfUrGDgg93Tq
	jPIIInqjbUe+zvTO9UuSlBi/VE7iDeKttPTkrmif5289jAI5UA4K0/pl2zJvhUT/AT54QLMmbSP
	C5dEz/rTQdkolzVlfPdfRHGLkZDH0mv1j662jpgUoQFDzi0RUpAi1wCYp12PBFyw8QAP6DazFV7
	2tXoV8QRRVINtRRoN1dcCRMY7wZaxMJvK560Px1vIKsBuZsyTmL6Va0c3RWNwjN88a/H3h6iMXj
	lUuC5kn73huCypHZ6n0sjNiSRjXe8nUSkSDtu728X6NjuCZZ01X63
X-Received: by 2002:a05:6214:21aa:b0:6fb:35fa:7802 with SMTP id 6a1803df08f44-7070077a62amr36099586d6.36.1753268905718;
        Wed, 23 Jul 2025 04:08:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwSQWjtXBuA6eHishG2gIiJ2cGaipMd1mJDi68fioFVtFVf/GzaJVerynAxuQtAMxj9KL8+w==
X-Received: by 2002:a05:6214:21aa:b0:6fb:35fa:7802 with SMTP id 6a1803df08f44-7070077a62amr36098166d6.36.1753268904649;
        Wed, 23 Jul 2025 04:08:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d9e89sm18897221fa.88.2025.07.23.04.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:08:22 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:08:20 +0300
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
Message-ID: <3fogucs66bpupdwbzlhevpglxg423ub2vkn6zouakjtswa4tu3@drhgtfvr6tz7>
References: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NCBTYWx0ZWRfX2BJ+OMUf2MWm
 FBp9G92VQMcnk9nHvDXeyVvTr9mJXFwMcUEp2GWvXwpztSTdBBLw4MYLISp4/w72yx8fBsdDTxg
 4ie+u8FuCCJv2u4oIhUF8sdw9wredk/4L09Jy/tewzPDuMIHwBrJ63n8favnVtZhjSCT2/Yyumr
 u7nxUrqzwr4s59MSJeSOpSk5eVgfRYZDJdzCAZa2Ys2sKRXeDWQpS9lO7O7rvFZNLC6CIO1ZlbK
 E3+j3FSN4PO++bv2cbz2IHLDQHRUgZvDL0nMYYHwfqJMF5FQnRP+dnE9IxToG5ZMQSurqZQ4SQ9
 pT/pK9Dltwskuzo9+B0FFGjh9UVX8XXRgA7TjvIKRAlCPUGH5MNInoza1sS2PCTkedDr+/8xNcO
 j6bCD31ty/OXXyk2RIRQ0fRFw9MEqlRZLGBk+KdJZMLqq1FUlP1Wy4R3I7Zx1GMGd0t5EQ19
X-Proofpoint-ORIG-GUID: ZT2U-3Hr2EiwgJsjrrxzkGCD3axbMcqN
X-Proofpoint-GUID: ZT2U-3Hr2EiwgJsjrrxzkGCD3axbMcqN
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=6880c2aa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=tE-qeLKrG5p5ljmTaQoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230094

On Tue, Jul 22, 2025 at 05:01:53PM +0530, Komal Bajaj wrote:
> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> as read-only for operating system running at EL1, enforcing access
> restrictions that prohibit direct memory-mapped writes via writel().
> 
> Attempts to write to this region from HLOS can result in silent failures
> or memory access violations, particularly when toggling EUD (Embedded
> USB Debugger) state. To ensure secure register access, modify the driver
> to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
> Secure Channel Monitor (SCM). SCM has the necessary permissions to access
> protected memory regions, enabling reliable control over EUD state.
> 
> SC7280, the only user of EUD is also affected, indicating that this could
> never have worked on a properly fused device.
> 
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v7:
> - Updated the commit message as per Greg's comment
> - Link to v6: https://lore.kernel.org/r/20250721-eud_mode_manager_secure_access-v6-1-fe603325ac04@oss.qualcomm.com
> 
> Changes in v6:
> - Propagating the error code from disable_eud(), per Dmitry's suggestion
> - Link to v5: https://lore.kernel.org/r/20250715-eud_mode_manager_secure_access-v5-1-e769be308d4a@oss.qualcomm.com
> 
> usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
> 
> Changes in v5:
> * Changed select QCOM_SCM to depends on QCOM_SCM in Kconfig per Greg's review
> * Link to v4: https://lore.kernel.org/all/20250709065533.25724-1-komal.bajaj@oss.qualcomm.com/
> 
> Changes in v4:
> * Added error logging in disable_eud() for SCM write failures, per Konrad’s suggestion
> * Link to v3: https://lore.kernel.org/all/20250708085208.19089-1-komal.bajaj@oss.qualcomm.com/
> 
> Changes in v3:
> * Moved secure write before normal writes
> * Added error checking in disable_eud()
> * Use ENOMEM error code if platform_get_resource() fails
> * Select QCOM_SCM driver if USB_QCOM_EUD is enabled
> * Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.bajaj@oss.qualcomm.com/
> 
> Changes in v2:
> * Drop separate compatible to be added for secure eud
> * Use secure call to access EUD mode manager register
> * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/
> ---
>  drivers/usb/misc/Kconfig    |  1 +
>  drivers/usb/misc/qcom_eud.c | 33 ++++++++++++++++++++++++---------
>  2 files changed, 25 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

