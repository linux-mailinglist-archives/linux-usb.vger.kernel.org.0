Return-Path: <linux-usb+bounces-28406-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 573DFB8CB6A
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 17:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E4E846172E
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 15:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F3A2FF165;
	Sat, 20 Sep 2025 15:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ehB3Rpr/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ECF78F4F
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758382122; cv=none; b=I3ALVfFktZQe17l8GYlgkA65Per5GAncVifqdxynTf9hVbOM0tHMti/q5W1ZHuCqqjDord+IoHJuA5ac/knS4YAWEi7HelI4eicXmkOt01VLxagjKTqVlMRwOpysi7JhxPIpLyD/MFHsz8Wew9nTAo1EgG5u6MG8WzrK9ZpFH4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758382122; c=relaxed/simple;
	bh=o7/SBdtKnoTV18ExhMxfVnZ3RnDyVKUeLtlNcSpc66A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pigRIx80XTlCM6Xr28SIJLZflatv13e08HZvONpJO153qrMePm7VpRbNUdEBVpydXIP10qC+rah2s15RYOlYhMpfSV4MnLq/TW4JMwxw+NkIJ/FSFWW0Bh+cBQPug67R85iR7OHsl45qKDswpcX+MbL8OovwyKYuET07XAg+TLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ehB3Rpr/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3KURT006900
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 15:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EdXXPQvg8zqZCB98GzJoeagW
	GyqEl3pkoBjW0+Eu99s=; b=ehB3Rpr/9nEP6BK5BIrTZQ+WGhrLc3l8s833FM0Q
	NjCBkw0NWhCOkTf1JBmpLIOvWtFBeQNWlDcd+vuQFLmLlkkXhqO7ENQAZ3Piz7+q
	80J4EATxd4rrlc87IK583/hvLdDEmQI9SHgIkeL+Tf3Y/ea0Gi4vh5SZ2UTkzyRf
	hQGrWJOzBvLBJEdK3v2mFMHJcIaTi6xIzeZrAc8paqWKAyhgWOcCgQ1KJnej8vNz
	JBF8B+vkjMDUso8RQ6iv4ekq6DkDeJ7OJVWgke6qE6+NrN8sQj2C3X+nlg+WaRRy
	ma1Xdn+yGBLq/JFDhq3+eR7jefxnqtBRZD3Gd39ePglfXg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k988yqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 15:28:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5eb7b2c05so67268751cf.0
        for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 08:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758382119; x=1758986919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdXXPQvg8zqZCB98GzJoeagWGyqEl3pkoBjW0+Eu99s=;
        b=Lce9Z8pXqBaVm4PNt1LD4SiLFDSZEG4eZi2EDEdVYUGOIwTA8AFlsUQyqQNNYMZlAX
         G0Pfz1NF4m7Q7D0lfBeGq4kYXHEH11pXHQB5sa5dWLfVgdixfQCZxlVBWatQHfCXsEJX
         0Z7T82XyS6tkZ9lH2QZTGfu6sraKR8ksicfQzqu1sR0VfFeW1BQLY+tHrlsM4L2orSfX
         MKbkbfViWbav6Skr5fdBQHiUeBVyfCi1tvH49F2b/K+vF6nSAW+jxbxO9RzApoJoe+Qq
         0Z/vb4Inwm7ksjdlzP+iMs67+LFVgi8sgksGK5zJ40ithLRtYhemxoPbYg08iTZb8xWE
         bftg==
X-Forwarded-Encrypted: i=1; AJvYcCWz59faL2BYfg4+s7RjhmTziBZ+uHEsMptgHKfe4JyqMoSVgxDgAqrUE7t0fvJBwn9aFhDHvUKAN/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt+RJ7atfWIcHYb9UJG1Gz5NLoq6hgXB7YLMWSav7SlqzS2fkI
	Sc0ath9jSrencGC/eIXmY79kB2Nh2t+L6o8Xh9dgOWnk0c38i+pzQE2qbWB7ErirEGDCnVwT0Wm
	IEd+kqupSSi0psMfVb6Pe4xDj+wWr7z5+DzKuktnOnFIFhdcQGJpanZrsueGLCns=
X-Gm-Gg: ASbGncuAyWtwfhPwn0NJa3HgCgixZ3SpYzBb9QSlq++dxCw6XIJhWJTdGh+u/EATQNg
	gNGK7kTdN2KTJvZKj0KhRQc7kRNm5h5k1h0OylfJCJb62ogvQ3WrF2AvazJMb8c9iZW4LfaLRkJ
	SCjuUNT/1GEzc/HmSDRo5UAtPlidGDyopwSN51YTxyN+1Af+zPFSqpcqeQOTvrTP40vtdNinyGE
	/hVFytXvvFiF4hOMLJjRgAh9vP5eQBay7MwQvrDOR+A7Ay//SR3vkBsjnlnDeGEggv+0T9qlppf
	J+oUjo4TmYfjkoMWI0AgGsysmXUgQavV4+VMHAsTBgBTQFvK/O26MjIWQDgRArOKdq9sLpNpWFl
	QQ1kt2SVIqWzI3T0YtCtop6WdTERJ2hPn67fJff9+D0wtleAJkHgG
X-Received: by 2002:a05:622a:4c9:b0:4b7:9c8d:1bab with SMTP id d75a77b69052e-4c0707a770cmr68026851cf.20.1758382119007;
        Sat, 20 Sep 2025 08:28:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+GPIhiPGXPqgJWbEBTsRikkIInjv9j9qp3bfqE/zhraGDQEZi6oZt/op8Qsh7YXTkasO13g==
X-Received: by 2002:a05:622a:4c9:b0:4b7:9c8d:1bab with SMTP id d75a77b69052e-4c0707a770cmr68026511cf.20.1758382118421;
        Sat, 20 Sep 2025 08:28:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57bef64ecf1sm247359e87.126.2025.09.20.08.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 08:28:37 -0700 (PDT)
Date: Sat, 20 Sep 2025 18:28:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: Re: [PATCH 5/9] phy: qualcomm: Update the QMP clamp register for V6
Message-ID: <mbei72eoq4vss4enwfp2c74756xdhyvd7bwfomgehm4fneardc@dgmofkbof3ie>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-6-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920032108.242643-6-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-GUID: wfHpA9d8zcjzGmlqVKM27_JBRyaT58hV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX4/i1eNCTkp+v
 EVTT2b+f3A5BGS8Y1XHZzz5JZI+UbwrZxZEw2nPN4ZkwE6kUhUhn7D33izzh+/m63ZRVp5wossP
 ceh8yLMhbk3nw86+pAMxnLx2wE9T1GO7+TFcOTsBFYr4XYS4V1uCXixj7tkFhOShwX4/hVlV1Ow
 AzhY/8dilWmQFIsHUC6Ql1X7F0LbP1WbXN5wpfWlp79Zc09Dd021F4G6jW6Gq1JalCfz98U3RYf
 sYKQUSyM/EQif1AwJ9T15MUm1aXxASX4ixA/scwabRg9BATX7dm+BDXSyezn7Q87X1RUTJihw8m
 I1ph3gv+K6BPu18OqGpsUtMDAHcjHRMBFWB4Erm5HyaaRFWzB4RYNs7cmSr39PXpLWxEgClSm4S
 CuQQtSKn
X-Proofpoint-ORIG-GUID: wfHpA9d8zcjzGmlqVKM27_JBRyaT58hV
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68cec828 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iQ3mrrbCar-o9T1obZQA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_06,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Fri, Sep 19, 2025 at 08:21:04PM -0700, Wesley Cheng wrote:
> From: Elson Roy Serrao <quic_eserrao@quicinc.com>
> 
> QMP combo phy V6 and above use the clamp register from the PCS always on
> (AON) address space.  Update the driver accordingly.
> 
> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 38 ++++++++++++++++---
>  .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h    | 12 ++++++
>  .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h   | 12 ++++++
>  3 files changed, 57 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

