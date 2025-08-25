Return-Path: <linux-usb+bounces-27231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A0B335D7
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 07:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87EBE188774D
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 05:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683BA26D4EB;
	Mon, 25 Aug 2025 05:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXdeTOYP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4C023815C
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 05:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756100437; cv=none; b=qZFXULY2YL9xfse9bo94fY3V0bV5XumO7/W8fm8fqbOOM+iGdVIxlMeEnE5GBc+6HIJRWY1Oo/oWx83WU0aELl2+aC6kEdR4EjLBUZcG5aTDiIwJf2NaspEdSEB6QTRp1sDovZmhoJZ67hji8o9mjGsKM0cnqmkBM/6SZRnv5wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756100437; c=relaxed/simple;
	bh=GWJkno7UH1EmP0ghaeExjRxfS6IMqGgi2ZFXNxROOgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EvdI3j62gyyuWLedvRbYDqWGo8HMuLLcTYdBENLQZDX8Gsz01cLf0PskW0XpuLiXjlkwsNcTaKMRfgU0m2ToPlScoSLOrweF8k8E2Txf+TgRgkAOGxC7Mm2tZcbtWAl4sU5AwQWwuMdtdb2Ga9dRAFZg6TA0BMyXkeB4y9vK1c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXdeTOYP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P0dCQk012844
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 05:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8a+TtvwZG10ZUAyJp5QPl4t7/OgCTRNElkzgAj0FVsA=; b=WXdeTOYPq2nMdvno
	pdMQ/ShNbNshVifZRInAm5XNVFrRXvdc43NXspfjU5/MKx964zbcXs9zq4Ajx/wT
	F0xUXNt5rRoEO1Q9Ip7NGJo9YWCWqf0mnUkOUXmsYf0NHVCFVfZK/06hkp8Agmp5
	LUX8QUgGatpmyUxfijXwZkbP853pdP3u1v4qp0Y39u/aM3lUunum8uRctjHYg+Nr
	CNhvgzQIXYT8B7t2q7zQMHZfMEddQpgFFffYxNHiF5TD+aF6lb3WLN8Wuz3rnOLI
	GR3mojXR0V6hZqx8Ll7yC5+n9wUvT+CT5x6YDm7lHRYRq2dlK4L6/46DY1XOnbz6
	wSuO/g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de3x37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 05:40:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-325ce9b32baso99374a91.0
        for <linux-usb@vger.kernel.org>; Sun, 24 Aug 2025 22:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756100434; x=1756705234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8a+TtvwZG10ZUAyJp5QPl4t7/OgCTRNElkzgAj0FVsA=;
        b=AFAA7h9XfDMpwegxWvR3HeF66BmWkjiW6tuktXHIyK1zc/yp6ht5fG7uXdSdufmWR0
         fSZZu8rKrNrYKm8mlQlqy+MlH8sRC3TQNhS+JvCSaJ0lhje+4VqLYdZDz/rFt5pKBxer
         AKa5KoeOjrZ2pz82QYobTEZMCOwlyfvOAIIV4wDkNa/0LXzoP011MCZAAHcjdYj0FIdu
         pGXmB6v6/+hkZExZhf/oC/Ah0RrcCMUR87UJAx/S4NrpbLjrU3E2S8Mq6vOZ2QqzoVxO
         AAX/SgA1YIxmDz9c4tW+Xwsw8+ElK6s004gXEZi2oxEdlqWe6YzwHKBvn9PWG4sRwSnn
         27Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWPcbpoF3z6AbAQpV8auI9E8iKcfu3T8iHe9hCb1UCVnN0XlEo/nTInS8GgQL8JVo+tF/kjEGyF2BY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj+M+kKGc+8c2YUGRSSEOwPKHK2Io+sNq+iZemG6GLEtkd5QpM
	5I2tuLXvNwlPW7pnNUDU/IdN+Z46keOrNydS1bszyBmBbWRjD7AfqRGyJk/R6BV0Y1M3P70EI92
	5SmokpOsvM57sp2twiXB53GPiLzEMKLGkEIK2P99H0wKJ6wu/2a2BBfbeMyppVlg=
X-Gm-Gg: ASbGncsxs4e/gVQ4N0U+FXbxyber9vimQgBFfUWMEJHZqWDo9GBAP8Lr3my3gqOOvgD
	h9jHL1ITdxI28K4jxrwpSPFNB2zeBattNbWd7Zg0HYAqpgsFAA/MuhPRCZ7/OmmPaUVKzdpHg06
	Z+a6VFWY4rEzw1271Yv1GC8uRbibkZytNozlDSOuDVszMDxFusMrfYpN5afZ+aoywJ/1e+4kBKU
	/jW/WMFXeC7P6Xn45YUY1fu5JxVufjYxr48tktLrMn9CKEQqAelh4L7PiMNX5n3Rf/1c7BuOhx9
	LtWHJcR6iSoan3+ZVq9Oj8BFy5AvsnlEz/8fz3zEZo+8UNjcSjF82Q04IJ6RLOwqo8vc1cJCLQ=
	=
X-Received: by 2002:a17:90b:1b4c:b0:324:e6d7:6daa with SMTP id 98e67ed59e1d1-32515e0ed9bmr14080779a91.0.1756100433688;
        Sun, 24 Aug 2025 22:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhgaMin5seYJHkfrlytGzFCnZxybYHYMcFaVpDKc9LsysyD3YbO70n6HcNcaQfiZnvmdMbVw==
X-Received: by 2002:a17:90b:1b4c:b0:324:e6d7:6daa with SMTP id 98e67ed59e1d1-32515e0ed9bmr14080743a91.0.1756100433067;
        Sun, 24 Aug 2025 22:40:33 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254aa6e27esm5847724a91.25.2025.08.24.22.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 22:40:32 -0700 (PDT)
Message-ID: <d121952e-4662-4651-9398-3a5446a2281c@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:10:26 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] usb: xhci: plat: Facilitate using autosuspend for
 xhci plat devices
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
 <20250812055542.1588528-4-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250812055542.1588528-4-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfX6zgzXJ+ggr70
 uXEmy08p6W5CoUcYlsoWEUQxga0ClX/Eki/dCYKcYeWeHDqzkkcJ/Tx4TjGeL1Hh4pzPZAbZekb
 dGoLk1lkBccp4si5/+hSKMKm6Jb+AIz/2J6/xJYb3v8q2TsP9jsqPR+8cNDAkSaP5d0XEtoMADG
 shdE2e4y7ymZpOpHeqEg8pHf7cLB3i+bd4OWxnsv8uk7bm2wrZGn4Yey88W2I02hVISOgtCw61V
 i1m3OZ8PuDldmji/QeOkb5IZoPJw7JPV0zr/WpZC37VoygUCjdKbYF3hzWc+N0FgMqEeMKFhwrM
 vTy7YoUe7kZ1BQouCcoG29tKW7k6V80lNFJCeQMKkB0VlIiNqHZMCXoo/tkptEAJkFtccH0m/mo
 5s5UkxSF
X-Proofpoint-ORIG-GUID: 2KuNZ3VpoLfiJtKmRrMCXoeWteoSM91q
X-Proofpoint-GUID: 2KuNZ3VpoLfiJtKmRrMCXoeWteoSM91q
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68abf752 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=nnkCm9v0YjVGcTDIYNYA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037



On 8/12/2025 11:25 AM, Krishna Kurapati wrote:
> Allow autosuspend to be used by xhci plat device. For Qualcomm SoCs,
> when in host mode, it is intended that the controller goes to suspend
> state to save power and wait for interrupts from connected peripheral
> to wake it up. This is particularly used in cases where a HID or Audio
> device is connected. In such scenarios, the usb controller can enter
> auto suspend and resume action after getting interrupts from the
> connected device.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>   drivers/usb/host/xhci-plat.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 5eb51797de32..dd57ffedcaa2 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -171,6 +171,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>   		return ret;
>   
>   	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_use_autosuspend(&pdev->dev);
>   	pm_runtime_enable(&pdev->dev);
>   	pm_runtime_get_noresume(&pdev->dev);
>   

Hi Mathias,

  Can you help provide your review on this patch.

Regards,
Krishna,

