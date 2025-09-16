Return-Path: <linux-usb+bounces-28134-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5DCB58BD8
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 04:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D1DE2A81FE
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 02:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DF623D7E7;
	Tue, 16 Sep 2025 02:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mm+qlQXJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9325D27E
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 02:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757989918; cv=none; b=WkVtHyziYe4a9Au3jRLBVk4rSXpUSV+yiTQhvJLS3/Tgt5Mc+/bU5qrJqqOFvTknIwp4bMy8T6edfLe7aPfH82QymuB/STEEyVxgARn+ZxxOhoCb8hAU27HQF7ohMw34+Yqir4L/s4HpaUEm06nLGEAvRWeQQ9JNrdwXepvQndI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757989918; c=relaxed/simple;
	bh=4++fnWEvY6eDmK6WVvP64PvrKxXbk3rdz0KqSZeY+4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2bKedvuAgDoiqYJY0mwhgxI17CPDPG3ETyk4sn7Lrl841AjDSmYIaex46GoIyTk2tdb1dNAOjWyJE1ai/cDDiArcAIIuF6UiBUdjqn6ZASvcpVAsutNLlnzuDVn3W27FLvRQ5I8khxTsQtH8CMtsVX/t6BSQavppByd3WVtnEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mm+qlQXJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G1nmfx018057
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 02:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mj+4DIC4FtIPwgZ5/qVKO3t6wbGyHNH2P4AZrpJL7T0=; b=Mm+qlQXJl1VaizLr
	wSM0NdoKUrX6uPom3OBAi5adxVMBKqwqOqWW6ejrrRgoBdHLE5qlPMrvT6e+VKnE
	ZVkdzOQkdbZ5nvPpPJmDi4PUiv101evyY3XIgp7oA396dY6qViMTG38F38VWGI6g
	d62E0DFa+jvvbKEFo7FD68eUVRhUjI9r26dp5bfCL+H7ebgsmuoN0aWZk65L50kk
	LrewTHg7dWq2+2QzcbJWXSErOgD0uo6HnTm93GK4kGvZYtXO0d5QXbX+neylzeSc
	bZ3P+I6xwpR7nuJ16ZrbK0PQPtTSPb/PaS8JErGkYaGg0h1e7esJgbPL8IPqYdld
	nuynBQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u56yt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 02:31:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7724ff1200eso3793625b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 19:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757989914; x=1758594714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mj+4DIC4FtIPwgZ5/qVKO3t6wbGyHNH2P4AZrpJL7T0=;
        b=vohp0/1oWWI5u80dReaWSffsE28Bhl4Papc5oi72ZEGXYz3nCW7XoOccE+oq22h0Vr
         IluY1RpmwaR+twcZ/KxnjiQcqAjHgQAUBEtEaM46LSywNexJIoyEufoLZHy1aUashZ4S
         IvulDwqUij8PVkU/gsWnTSliaCld13UGv/zZe5XFQz/pGxdcV53PsRMfF1MI4phPtFtu
         Nhgq75oO2+WqrPQBSxVZcwXfLONUzURbWjCBHmnKm5F6aTJuCQszSwJrvXL0ey+CqqiT
         CdvDWSNA/gGGiy31JJgzCpkhfOcCelDgoremvNHLWI38oe3hnyMQ5Mm+WwTIgL/KBIqD
         BfAA==
X-Forwarded-Encrypted: i=1; AJvYcCUVgi+Nk/V2Wr1Oe9zZwHNVc4eU8nApl5zIr/A0MvpGA7WO7jpZlR6acNgZ+zz8njxRK/h00RH9iAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YykMzPma+ad+3rFXHiXCOtdkNv1QivsF10eyc1uSCn2tAJF08rw
	KYDDvu6XopD8TpMjXxh642WZJGBwK4ZJw6b+PyhGd0Ieraw9L0OEyq3F3JilezSc8hEruYsy9Uu
	4BxvOZNjRB3mVFh0AxbBQOI9l0CxSsUIpMsoywLbOQHCzvnxfSX6HyoIf5WOZir8=
X-Gm-Gg: ASbGncvSdBFfnb9eiOQEmC3mR/wuXWbnBagaHBIq9Tsn8VuBaedcMnUlL2hh8Ht4ApL
	LBPAgs6As6zE5hPk2Z/W8EmcBBdLZcUSRYnBknXHoA0/5p8wDzu8FoG2qlOJBtoEZZRFHibE6eJ
	0nnu5WlztHsxST25QRsGsnWmAe2XEEPloiuWYMKOUu2edRSO7J3aKcVEbNTDsvaPOkPLZuZukQY
	Eta2++ioyMF5dN0Mbf2qBX2ESNqkiFDK45NI3WVPhxKS2CXm164X/Kz1Zo2ZaveC7fHtT+CopC0
	WiMFnaSQRZhH5irA0IcfZ3f4fPH8az2mBXXehxeKhO85yqlhy6ftlJJikeo1Wqz3WLjZa8XWXVY
	2R6Ok6bHsIIMyfQJK6+3BqdrlPr+v691Byg==
X-Received: by 2002:a05:6a21:6d98:b0:24d:301a:79b1 with SMTP id adf61e73a8af0-2602aa89c92mr19480581637.15.1757989914140;
        Mon, 15 Sep 2025 19:31:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGobrdOnAQJkdYAoa+zOeKuaa8r9jXR9CcquiRwbwPK5Q7sG5dUgcn7ckySyY/fCdIk4y0zFw==
X-Received: by 2002:a05:6a21:6d98:b0:24d:301a:79b1 with SMTP id adf61e73a8af0-2602aa89c92mr19480549637.15.1757989913655;
        Mon, 15 Sep 2025 19:31:53 -0700 (PDT)
Received: from [10.133.33.240] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a35b877bsm13162406a12.3.2025.09.15.19.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 19:31:53 -0700 (PDT)
Message-ID: <0cf4b0fd-e468-4aab-9ec2-38da93435557@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 10:31:45 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] power: supply: qcom_battmgr: Add resistance power
 supply property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <20250915-qcom_battmgr_update-v4-3-6f6464a41afe@oss.qualcomm.com>
 <gk2ho7ugp35kb4x65meqsm3aufnry6srr4p7jspf6xyn7ywzkh@vd5ca7txjdk6>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <gk2ho7ugp35kb4x65meqsm3aufnry6srr4p7jspf6xyn7ywzkh@vd5ca7txjdk6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NzVXr9inrfeyr8z805veV61UvFgb1jfR
X-Proofpoint-ORIG-GUID: NzVXr9inrfeyr8z805veV61UvFgb1jfR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfXwqMiulkS1Dit
 w9Ig/HcUD+++1GTN/k8ttQXsi2OkshXfSCWO7FH4c1GHInGMtkQgY3q7i579TVi7zgQlPS/noLm
 gih2IDMsKNFpxB2oHWF41mbFouLRpptx/GRAQZGcoZf+ESFKZZ8b6HC3LEgmfJms1LtQDq6j/vt
 R0fbWwKzNrHcqaNpeExoopApob2YXlN4x6bJnY4vzHgROoJcwBW/rmwb2D6SLEuqJ8Rp6MeS/M2
 U1qILPnhChTKY0lfkw8YUBf347SMTznnN8O12Wi0vVL7XIRLDbwXq5+f7MjJPqdP0vg/9gQsWZg
 c4NlxO5U7SwYfugGuOqLo33fY2XZGO7t4gvaYJK0VEkRTPGu//NmAcu0xPJPaD8fqN3KqQFSNHi
 +04dADJq
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c8cc1b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Hj7Mza36WnbFS9u3f7kA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031


On 9/15/2025 6:18 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 04:49:55PM +0800, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>> Add power supply property to get battery internal resistance from
>> the battery management firmware.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
> T14S is X1E80100, which uses SC8280XP-specific sets of properties. This
> patch changes only SM8350-related data. How was it tested?

I assumed that Neil has picked the series of the changes and tested the 
charge control limit functionality on his T14S device.

When I run "b4 trailers -u", the tag was added on all patches. I will 
remove the "Tested-by" trailer for the patches with functionality not 
applicable for X1E80100 platform.


