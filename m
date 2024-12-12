Return-Path: <linux-usb+bounces-18437-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBB29EEA7D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 16:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BBF51618F1
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 15:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A6E217664;
	Thu, 12 Dec 2024 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1ewZy5D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A33421CFE6
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016153; cv=none; b=r1c+qxOffXc2zaFNDANbDHCN0Zc4FesWg0NXrhk/Q4XRsxvb3cqf1Rbyx1oGjl6UoiIu+w1uw5STUDhQk14rXku9BHqi1i5Zh5LLEYYqwvJht97XM5QL99Sh67qAoc3uSxlE8Uu65n9zKmDnN0HF4N/UUCESSO3rkWahKR5VxzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016153; c=relaxed/simple;
	bh=kPKepROpxS43D+DUd0rMsLd1XyZAByT65j1DYkG+a58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuNYNgo4dLDuupXOCOqpVBKlN1p7U7IDWt4o31kYKBAU3Ybma3SglwhixWOt3LUrseSk8s07tSNNC2b5TMYR6peUsPMxpP9tYdPLmKL/0y5rZL/2S8WQ3N7D5DPJ2nbh5pMNJxrqLgoqVmzrKp8djusEzSABwKM++E2nqjAETaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1ewZy5D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7qNOH002529
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 15:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WWoZhsKROhJsNL7oGlk/RfeOg6LjV5292KaV8g0SxpY=; b=a1ewZy5DVCJIjH9V
	uaijHdv4TIFF71k0DvPnL+w/59CidACoz5JzfHKFHvIvzZXpquil3ziITjjLrF+e
	xt1WsRH+ZGZmPFiVigSRozrlIo4gi9YBDr01tGkyBmqpAq8RJEX3bZ+LBUbatMZx
	HfzkcrF/ymczqRsuCoNmcV4rKvd34lWjhNXzXY0TyoI7EJquYhV6ApRH2PJK36cg
	P4fgMVBg+cAPfRgYz9nuno7P62PPvabaUPjiXCwGfAEFD6REjTHMhLdP13P5Mdue
	eRDs0H+MccrAYo90jvQfLTzPAyv60ddwsBrL4x4kbqbEkaa4co7mIdtJcCuZqYuf
	pixqbw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eyg65w0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 15:09:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d887d2f283so2004026d6.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 07:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734016150; x=1734620950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WWoZhsKROhJsNL7oGlk/RfeOg6LjV5292KaV8g0SxpY=;
        b=WWuWtt5hU77Q9hGyHxE0uY+9bCp8/c6NCISKXa8GN1fJ/6a6uk+oYMRv/aFtZme7bJ
         xDfuwTmFhlVcAt6eZ0Vi8/DWpxJrLDAHGdC32hn3b2SWiVLIT4Hplb/dZ6B3yeEtIGOO
         39rDYJRhvq1ShFr5uYE40p61TY6dzC9CgmjkRvR6YYjJAIeWPgQdGaAiKCUIdvssq7/0
         5igjS177KJN0dhubMupQ/BFTnvTtj2Td73njFsu2rCbs6JgSwf1xnUpT35waJN7ambli
         rERZcUGgIAvwmEVBa6l/2jEjA+sAbTG4ecRrcAuGmqPRVbt36kVw9ydNEp812Y8Rtm5m
         WKNA==
X-Forwarded-Encrypted: i=1; AJvYcCWi/5d42Cegt442TyvMowJaMl2YJSJlwNza94cUtI0QqaGOVlmQnuvOmYSl/svHzlqoQq4eS/8LlcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnORV1Y7KRlVeEvy364nuAU8TexlFhJvExIgpeUI/mRHl5pJNe
	bwJtjvQhh6K4cvjSJ1HKONQ5QtrO/Yt9AW6Jx6fvthUKrIr658G3F56z6PINWr5n3ixfJ01soYz
	0wJPrXqkhkwnAWHNP7jUukVxPYFZgI+llBunpfNUYUK39ZkFByrizpTMIMig=
X-Gm-Gg: ASbGncvhmWHUcqLb7PO72iWuyjprm6ofBl9S7qHIyQqqVKjfL95O1uwsdWt3kypEDdh
	a5tLHU/pl0GKW6OGKhjYIaqVthcyzs/Hsoow7nWpa1c6/kP3iTdbEb+0Bws8iOwWuQngZg+YqPt
	5Y5CRRd+i0pzJ3oqdF3IWuwgdvsCuBN4QjbD67XZbshbvgn2E3MWbML/xZGUqgv8I/IoMBP+MuR
	Egh+yz22w40lX2da7ZK8ZwmY3Fy7dvmA6DvPx1ALrcvk4OIoY0NkBkP/E4KmY5IRCeHPBcfn7v2
	DuLV4LUj4CZk1E9qW/lLlK9TAztCuLs8F0t4Iw==
X-Received: by 2002:a05:6214:3016:b0:6d8:cd76:a44d with SMTP id 6a1803df08f44-6db0f5cda60mr3223716d6.0.1734016150303;
        Thu, 12 Dec 2024 07:09:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFObVItKkexRSdtaJh76BpL6TAUzV1mdsNNZuTKmUGMDVCaT/aEhe37aNaCPzag8mlH8Apb+g==
X-Received: by 2002:a05:6214:3016:b0:6d8:cd76:a44d with SMTP id 6a1803df08f44-6db0f5cda60mr3223566d6.0.1734016149953;
        Thu, 12 Dec 2024 07:09:09 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67cd1e82bsm667249866b.53.2024.12.12.07.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:09:08 -0800 (PST)
Message-ID: <8a684eb4-c824-42d6-8070-9c6b3d582b77@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 16:09:07 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-qcp: Enable external DP
 support
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan@kernel.org>
References: <20241212-x1e80100-qcp-dp-v1-0-37cb362a0dfe@linaro.org>
 <20241212-x1e80100-qcp-dp-v1-3-37cb362a0dfe@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212-x1e80100-qcp-dp-v1-3-37cb362a0dfe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fI_1auuCp74DvcRNaOVnYPN7fpxWN9FO
X-Proofpoint-ORIG-GUID: fI_1auuCp74DvcRNaOVnYPN7fpxWN9FO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=671 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120108

On 12.12.2024 2:08 PM, Stephan Gerhold wrote:
> Now that the FSUSB42 USB switches are described, enable support for DP on
> the three USB-C ports of the X1E80100 QCP. It supports up to 4 lanes, but
> for now we need to limit this to 2 lanes due to limitations in the USB/DP
> combo PHY driver. The same limitation also exists on other boards upstream.
> 
> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

