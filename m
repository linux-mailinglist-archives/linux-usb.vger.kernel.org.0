Return-Path: <linux-usb+bounces-20887-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF564A3E387
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 19:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4025716949D
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 18:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE4F214218;
	Thu, 20 Feb 2025 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzI7oogk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E361FAC30
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740075244; cv=none; b=qkvalvIBAId4TFPWe9lVktf3zBCCQS77LnsgUzevX8rGZC1jWpI7JgD+uZ4eJka49JV1GyCMrSFvUvbvPrHixjZm8EG+i/wkOkZGOlVDw8V6igx6i+QCr5+gmXo2FSGVTiLaJV5C36VwiVoXFeoGLvf0gq+oJfpeSLLR04qvtUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740075244; c=relaxed/simple;
	bh=WaDDRF9fQy2zzLjZ3DEW2L29d2f/2qyHcaGgmIbHD3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aF6YfWqZLljyTo9kkNgV50od3KpAopa51v47IEzbAhCKY3O96rdg0CggrxhdtKTMcwHa5chHVhR+u2YpaUsU83iBWS6od9MvosvNpY8DYG/IAHxD7eRV8PygqmCdFwlallzy3Kbjk+AFcj9DpXBdaAdzAsqGkATzVtu3zx8JwLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzI7oogk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KFaIYk031904
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 18:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8CnfDkA/lCu9jF96qqSRckSj3r+BJxpocyhFxojdSa4=; b=AzI7oogkwz1xxOZO
	LWodueP6IjeP6VBDiJaqt3t1EwZmr0BjGr7LG1xQS+IUqKstXhcBV+IBSPnUpFAM
	Qvi4wi2RVtuI2eeh6Npes8Oz++v/F/OvQq+VSF/bVfpbxf6bG5wRh8VFJe18xhzM
	covJdtH9KBg5RsBSGTiZEUaMf0EtH+dTezs8OnOj/iadTHj3xXAEvvFPTc3WhQge
	13ryyV+rjlAxSsWkQujacfPnguMNNl9tvTFD2ofw/LHl3pY7pR6OD8IAMfWkn7Sq
	GvAe0FNddwhlfsEm85szirN86tDiRP3EecgxfPgfldWqxyNSWQ/dDSJZy1gpxliG
	JNJ4UA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy5f0xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 18:14:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fc1cb0c2cbso3970568a91.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 10:14:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740075240; x=1740680040;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8CnfDkA/lCu9jF96qqSRckSj3r+BJxpocyhFxojdSa4=;
        b=rHsBoBHa5FEP6g9Y1cgowT+jUh1OrF84ocVSyS5qzTg5fxLl7A1qWoIblgDJjhtIiU
         f612jnkq0y+yVMGvEMhsIdYklNLnblTw8XWyxZzFK79/a14p0eUyvJSp5Uhb9Tv26dYT
         JEV9vD3yswezjCKwCNKhc6LUn7EzjN+FxkjzvSfp2aKxsy3CF+WcdxOPDy5Gb5Dee0/a
         eBi9c9wQAXAdeBPz8m4Gvyw8pc3Iz60u3l9zjAYTwS5GehPlLV3x5U/zko4B9IZO0zL/
         PRRcled45AN5Qh60nXtKJcIEqvwsKgMndKAety9Zx5rS8DbGOE/XDRtA2SsbYJCqg13v
         7Qkw==
X-Forwarded-Encrypted: i=1; AJvYcCXKGxYP5flnRDBFU6LYmshyUAlqfAWGqCws81QmLqmAw+E0RpI8xNcsi2VguA7nP+J+u3YSRacR2Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw3DMfXhGLU2g/AgJvWj7dOJyDIvOnthW29eCjmt/CcgoV7mZ4
	8xYMlUIJt9f1Wjw1NybgNaxGrTcmbavEpACe6aji2I14QIEY9PDee5mALbfH44C2WoHjdI83qbs
	VmBdeNkEpRkxdgo/X4cG5QeMplukOwyPWvMqxw2ehYw6YwvQC+/xSL5xnGZ8=
X-Gm-Gg: ASbGncsjCFNrR74mheInKry8HUGONAPKulVsiVYYXvldeIIeQkITjZfiT03Fg5frTN0
	t3XfxLlBf1tFiH+UyScl+GntJQndPV6FhKzKtlprQFU7X2dKxCRVb1SfMfMFYnzU0g3H6LHRUi1
	TfAg8LeZSQnDSougn8nVWnQhWol529D7XmPdbp8e8moD0CM5HA1yO4QeHRY2aJ+szycjG1W2Wuh
	MjKspYuSJUwPp9CL52julQQAtxrSly9L7LClMs09Loc719xxNpiQ+H0f/j11Szp7wB13bfHuHs1
	/v9ilDRzUekNEL3KGYpySfzONb07Xeg2/stf40uOlg==
X-Received: by 2002:a17:90b:3ec3:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-2fce78a503cmr221354a91.11.1740075240203;
        Thu, 20 Feb 2025 10:14:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHv9ogDRSvPqN8972+OppvPfeC5b0EiodIB7DDO8PhtO6qM8mshIf64Jk/c7SROl+eWt/1uwQ==
X-Received: by 2002:a17:90b:3ec3:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-2fce78a503cmr221317a91.11.1740075239836;
        Thu, 20 Feb 2025 10:13:59 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc13ac0a06sm14230039a91.15.2025.02.20.10.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 10:13:59 -0800 (PST)
Message-ID: <637284c7-84e9-40da-9b0d-94fc7488e6c9@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 10:13:57 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: mctp: Add MCTP USB transport driver
To: Jeremy Kerr <jk@codeconstruct.com.au>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        Santosh Puranik <spuranik@nvidia.com>
References: <20250206-dev-mctp-usb-v1-0-81453fe26a61@codeconstruct.com.au>
 <20250206-dev-mctp-usb-v1-2-81453fe26a61@codeconstruct.com.au>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250206-dev-mctp-usb-v1-2-81453fe26a61@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: geVgI8sOvpEEvdSVXqrPB0TBSIvEyBaB
X-Proofpoint-GUID: geVgI8sOvpEEvdSVXqrPB0TBSIvEyBaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=798 spamscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200127

On 2/5/25 22:48, Jeremy Kerr wrote:
...
> +module_usb_driver(mctp_usb_driver)
> +
> +MODULE_LICENSE("GPL");
> 

Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning with make W=1. Please add a MODULE_DESCRIPTION()
to avoid this warning.


