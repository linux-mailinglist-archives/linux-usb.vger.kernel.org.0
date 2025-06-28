Return-Path: <linux-usb+bounces-25208-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 809EDAEC538
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 07:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1B6E4A4C91
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 05:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6E921FF46;
	Sat, 28 Jun 2025 05:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXtRKEP4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB5721B8FE
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 05:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751089478; cv=none; b=cg5CHzO7JXC8LpHsWcX6GXFIyePybLZDD5oaGJsxDTo2fcQhSsRuqfvaf1NmVNzlsdeL9sUKAPfKgmOuTBknDy/Br6WKV6Wo+xT1JVji3M+G91Dn/0z2edSp4SToIiedqkwJ7Pud8qxsdhDGVBxv6/HlpburU0qTGc5d6IaksSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751089478; c=relaxed/simple;
	bh=LOCz/6CnC9GBhCIu9bdP8uuu8MSu0vaUQ3DB4qVBqGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/UtMD3Ds6ddQ2GvJRHixcEWglqbIyDURPTaOfeeVgFLdb0L17vHHMEGr8MR426dxlpehg9sVjvpmHU4tgB4oOmkyO/S/nEi+6GZ6GcFLNNITwDfZY+VjJdsg1CS1eIF7yI+9jzL6sm+oeHRA5M701cRRw85AK6mTAGnCovMQo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXtRKEP4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S3QAIs027898
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 05:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kUC7xBVH0d3kUt+KUxi0+JwN
	EOC+393WJOkT9pG6mLc=; b=aXtRKEP4TFKHtUmtBmzNy022mL9zBvLDkRb6DyTV
	czwJL78WCRXlIYiqSW4JEKUssrSAp2EdFvZepoEr8Nb5KLUBmEMws1xyq57kdBQ6
	q7OkNErXx7m+LzkI7r5zJlyf76RqClwyLwGPvmuly92V4jTr0mgccAOH5NboNibq
	Mn65mplKEY0MgP9z18zUHHvnmYUY+8xCD0XzALk0yS6BD4bNeonQQloU+O08uER5
	AOohXr8rQknvAUR3hL3h9S7Kaxgty7AgNf7CogJak24XjmPYdy4RVUcowB3CbbLM
	iNVAKqpUF+mcy/HkPgjdq/sG4H/p25oD8jNWV2q8HVvKdg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fx84xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 05:44:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c955be751aso436435185a.2
        for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 22:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751089474; x=1751694274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUC7xBVH0d3kUt+KUxi0+JwNEOC+393WJOkT9pG6mLc=;
        b=feKL1UJccY7ra0WbKAHPWQXDXes1YFBdwsIv1CAZlvJ7L301jB6F+IaJ3rQslrBXsT
         V9VPBgy+6bI3TYUURat98GUQCzIE/pixBnY7GvRd/QKSKHS1gz4ngYzWxYy+3FgNoj15
         fpRdasAjVDSR3ZATGTE4wvxrVLA/nGLWbAAhNRwKDECRNn3XSFW9YiVX1Th1rwSGodj3
         R/cgyLpAa8avkQon0R20OCyZ8le+Nq1kt4xL3xFHyEiwYCfu7nsb+XJx8Yo+8yp2JrZI
         /zwz3746OsIYuMowA648HAwm2Dmu9iPHF9BgHBVDoV27C+/OpRPrHwHEHFACbyDCo92I
         yc5w==
X-Forwarded-Encrypted: i=1; AJvYcCUJyFEkWw1f9AFY1djsmSF7K1ImmsWDBRtoSrXF5Od/zlzbYK5sgWR9KYi3MFYI5yXqYAtRAqmH1BY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMwW5HaK5weAPR4bVL50H+uwCQdIAXbHmlbnBRZuDhj4MoEO0+
	QyFFckqbypneyG5ViHVS3PILofjP40kJL70CLSiKdo6cXJ5iKC2DD/xhXfpwsV036K04o7TETew
	62fx1zTKq4AjerUgwgDKLvyOeu+OtmIUhibuXz34v1q8qBhNbDOV2c3adqeu+ZQo=
X-Gm-Gg: ASbGncvlhFwkyWqyGBECQHSzO/yzSAdF8mc3GAMQ+4vnYf59FsBZzpE+l6nLh81GU7O
	pzD8Wk9gjAKaTANiFQvUX+qvHTXOG+nWunfHXY3eDhy/4+DtoP/fqAB/LoCV6SNa2yRNwMH/e0o
	We4aBiYWkV0hz0YvWXXfy/9ocYxKdKlvXtkvBpjSuSCpZ0Roq029fgBVGz+NuCJUu9ZSJbTf2f+
	O1aKp9rjhpeGZwjJoia3NRO+bhO+bjr1TEA39ON+NZOp5hTlvXQ/3JpvXG+7oTnON4JtL64mzeU
	gcNA4zsJ69usMeDNjcFhH5/uiTQ5WO3iiVgySDJI+StDcKydH2tA4Bw5j7YAhBnM9YmAvRS/5Mk
	wnT8iATnQftK0gphHyLCHyKGmM0Q4rq0NF3I=
X-Received: by 2002:a05:620a:284b:b0:7d4:27ff:b7a7 with SMTP id af79cd13be357-7d443993447mr967061285a.48.1751089473613;
        Fri, 27 Jun 2025 22:44:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVAxxSrkbOEBKx3cz0+IPQ2g/5OlD0DOAiPlEbJLOnN3L2vQlF5ZPs5hb6q+9b3wUtWW6npQ==
X-Received: by 2002:a05:620a:284b:b0:7d4:27ff:b7a7 with SMTP id af79cd13be357-7d443993447mr967059185a.48.1751089473192;
        Fri, 27 Jun 2025 22:44:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d1b2csm685996e87.194.2025.06.27.22.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 22:44:32 -0700 (PDT)
Date: Sat, 28 Jun 2025 08:44:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Message-ID: <b7mv4u2parcyzrm67yufuor3cwx265kaoae23rksbbuu4aaayl@7a6xxfmganof>
References: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDA0NCBTYWx0ZWRfXwK3+PemGBFhM
 lOr/deAITYLa6m3R6B6EyHazdWqpnz4Q2wIesj7Oby9rOlAsnFhiPDvzoxdR7j7/JSEf0g+wdb3
 nHgCkdMIgVjUPWe1AUI2cmcNJ4dPtqpeBfT39KWiiDy1MqXlgBH95TKLgdIpraD0ZK33yFylZd8
 15fOtSLG42ag7UEHSaYaB2qkuUMkjkuHMf5J4ZmmSYvVrCLduLpL94S1wnnqWKb+69orN2P/yW0
 1Dg4Pbk2Uf7QeD+J69x/qJgpJran44+UPWSKM2e03bgbBNeH1xUL3ALcEoX2r0U4doc0gD+sA+T
 tuz2Mak25tpR74IB51oyYNA3+fqNNZQnZ6Sv7UfLlx8iaJ7aLA6S3SgnhyMfrWXjjaAGWkjWh9w
 7xtFEliIqWsFBtPeOugscz0uZsGXqjhIC8HPgwsGL70VvMxxVwI0Oyk4chBnT9/X5z79g4TQ
X-Proofpoint-GUID: OSLlqlhXOf_2fnoDZcnXuTTfiXzAqSl7
X-Proofpoint-ORIG-GUID: OSLlqlhXOf_2fnoDZcnXuTTfiXzAqSl7
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=685f8142 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=6MIUTFbEWCSSVVwswsMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280044

On Fri, Jun 27, 2025 at 06:21:31PM +0530, Komal Bajaj wrote:
> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> as read-only for HLOS, enforcing access restrictions that prohibit
> direct memory-mapped writes via writel().
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

Most likely SC7280 Chrome platforms were fused differently or used a
different configuration of the TZ.

The question is whether there can be other platforms (e.g. SC7180 Chrome
or SDM845 Cheeza prototypes) which should use direct register access
instead of going through the SCM.

> 
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v2:
> * Drop separate compatible to be added for secure eud
> * Use secure call to access EUD mode manager register
> * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/
> 
>  drivers/usb/misc/qcom_eud.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 

-- 
With best wishes
Dmitry

