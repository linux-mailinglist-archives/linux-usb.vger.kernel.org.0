Return-Path: <linux-usb+bounces-28098-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB8BB57516
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 11:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BA5E7AA9EC
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 09:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BC42FA0C6;
	Mon, 15 Sep 2025 09:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTPLKp+Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243482F99B4
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 09:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757929492; cv=none; b=ArXfL5/EClkSGDus/pvMedaYtmQBvVMdD85M6qb1gLPdI1aeG3Jp+yS9wkNInSr1mnGcclvm5+02/jPNZDm37zmYb87O8gVGzeo8xdaPhL4MsizSt8xm4T3D0aK373pfnofMjNg+UkZtCv9R8okmDN4UZLUmhzZ4CTR3gv1uhRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757929492; c=relaxed/simple;
	bh=v3RG+UICPkrVnxWKbeqHLBZe1IIHqbLgB0YYfEB2ieY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bck7Tv7VI1et4cpR26ak8/CQstx+5Ka2k4gvseRoaWWxZaR7LkuOP17uRy0IqHTiWRGrm+oy2/p/6uqHoVI6waIXCR3GFQ6szlpHMLYajTIFEgAvvN0itjfg60YBL2T4ctQQ+9f1QkH/Pf1f1C2CXvr8Fj01s8gKmWoU0Iz+dLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTPLKp+Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FijA008264
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 09:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btUt09/JWFKx9VAylYCCOROw35FyhcxsxetmaKbojb8=; b=YTPLKp+ZUmN02Qpm
	MghxcspLw2YbFDu6hU6ii4k1CwK7ncmt1QMSTkMI8DTr0529ix5yhvUGgr0GMoWX
	9flipKVbHTiw0HVoPSHidwIc6np4RzvmP1kGgCOKxF4n7jJsCpLuPOcD2oKOr4Yp
	FHl26H0Fj5fJzlV0h8YKme45jH34LA1/HQoxdzxOhoIGufGq8A1EG/4ioZGxvsa/
	FmsS8WFHpJ48EVFbiwmSi7RNhztLFt2Vfh0lmHVlRI/VRDn6hQ6t/jjn0R8Mfv75
	8M4BwleYkaTzJWkOhU+ANphqLOUZIbm6t1HGIVW9YgzeodzkW0JfBr4MOdzJx0L5
	cEpIag==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqpu97a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 09:44:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-261cec07f2dso12483135ad.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 02:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757929489; x=1758534289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btUt09/JWFKx9VAylYCCOROw35FyhcxsxetmaKbojb8=;
        b=spB34yDHupBVanSHQbVbmvP2JttVYVt42bRUNHayE1ZwFiw5dSx7361AQ4o23N2V82
         RBiUwqiUcmi5oYfR4o3VnOI76OpEP/3rbhNyGyPfKuiI2w9Tt39Di88j3BpEE29Np9qS
         RUT02El8critpeXnzmgFBxmnyqS4kNgAp6Ez05QgsMbWstxlBF2qaFYCnGpoJeY6tcQ5
         MJSJS2Nzc5sFaRAwn+W9gYf4qGKYm9xbCaHGM8L9o5RXwjMF+r9Tw44p9oZmAmgGeSLH
         qKmQ7I0h0bEG6ttADI8bfP/jhYNddAWEoXA4Y/uSgQiLZwMWgAaiydV09ONOkdZIeK9n
         GIJw==
X-Forwarded-Encrypted: i=1; AJvYcCU4eC5U3Ud0irzKgwnPUrkhdIOienys1V8vpsfUKisOhUPfjD8lFxVSVDiRQ86iqGDL1Q/Vaj8BCJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTIlUX/lIfJ9NT+bwCO+vw7tuTImSQSiqHEXAPm8fvIqAexLsM
	8jblubHNf7AstV7LXDtMsy2NZsvGPZMLlY8q/0ds2O2ZwyH7tOtiJ8FHjlb258m+7frmvEFSW0b
	5GCJDx4pQnIHCGZ4uU6PEYbkie7BdpbxsFxfc8Qi8MyViN4wtaTQ0mppc40u5O4s=
X-Gm-Gg: ASbGncvG9UzNCtXDfgWlEritBylHs9NZ82BirjnNJyMtaUp+spkNWEK9EY22LtcLXAz
	t6wUzlc3SB9lB6JZwIP1ZXKzpTb8b2dElgtHSZAAI1Pv7siNoTLm4OgxmGxOh8JOSRPtYjKlaTk
	nJMVgA8LmIVFSX1w2DDiIAv59iqQlXSgyq4nwaJCgnp8QFHUKc7ysQbVktjeyR7VPxL3nfko0wr
	ly2XkdUjI4WFexb0b678KXDiSaNa3Qtz3VN4mFjKscgJwC8hYU+hkuPPnC4gfXwVkVnCOjvIB9q
	zJLFF7A+PCQTv5WnCt8r0XjSumNJn4WB2ywzPOL87vo7U2BZq1kOWA4XIvsICMmVMolXUqJbqYY
	qG33RXeLTxhv5s57H0D+3hdzl11rSKMBn9Q==
X-Received: by 2002:a17:903:185:b0:262:9ac8:6132 with SMTP id d9443c01a7336-2629ac88031mr71832075ad.19.1757929489317;
        Mon, 15 Sep 2025 02:44:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB82jOSYdcixCfESlUwNeTpTC1N6ixEj5+ZgwzGyCnR/7UvipAKq3xTaZw7ZjJWJzsrOwUtg==
X-Received: by 2002:a17:903:185:b0:262:9ac8:6132 with SMTP id d9443c01a7336-2629ac88031mr71831745ad.19.1757929488787;
        Mon, 15 Sep 2025 02:44:48 -0700 (PDT)
Received: from [10.133.33.240] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2653fcb5b23sm34612035ad.56.2025.09.15.02.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 02:44:48 -0700 (PDT)
Message-ID: <3559cbe4-b2e2-42d4-85ad-554258fc9dec@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 17:44:40 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] power: supply: qcom_battmgr: update compats for
 SM8550 and X1E80100
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
 <20250915-qcom_battmgr_update-v4-5-6f6464a41afe@oss.qualcomm.com>
 <aMfWKobwM5bhJEAd@linaro.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <aMfWKobwM5bhJEAd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FrzlKsgCwmzeTbNyBYNf5MSPtrQnlx1E
X-Proofpoint-ORIG-GUID: FrzlKsgCwmzeTbNyBYNf5MSPtrQnlx1E
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c7e012 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=j-CFaJrOc8d7PKyLKvMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX4Ca9KPXW+ccw
 LXpekrnDp+cU+QgdTj7NL1aeb+aXpmGAJs0l67ywE7iMasIEEFMNYlgYd974IWqxHhFhe++Xwng
 9w0zxzrsSjPkW8IZ6JquIB/5a5xY5RbcHtCl3YKD0laftEGcjFdjod3yyqIswLHaqjvq4pSVrz0
 qOrMaKbYHdQVOLrP/ntG+O6fG2/ctz7aw+lugeRyTikoUVXIQPm3CLHslMZdx7l+SGHK4OwyneA
 dXYupDamBOoFY+slMI+gVMglxF/rKOorP5k2UsbGW5jsaYFwxgYqXCIcZ96LgaQSVNtFIrvZq9H
 oFvz1NTh/NZbuj7gf8r064c6528mJHrngAilf/ZMPMhQ5Ffz+4So1DltlIdpENwHWn9mlCOYZ/G
 34Jk5KAJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186


On 9/15/2025 5:02 PM, Stephan Gerhold wrote:
> On Mon, Sep 15, 2025 at 04:49:57PM +0800, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>> Add variant definitions for SM8550 and X1E80100 platforms. Add a compat
>> for SM8550 and update match data for X1E80100 specifically so that they
>> could be handled differently in supporting charge control functionality.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/power/supply/qcom_battmgr.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
>> index 008e241e3eac3574a78459a2256e006e48c9f508..174d3f83ac2b070bb90c21a498686e91cc629ebe 100644
>> --- a/drivers/power/supply/qcom_battmgr.c
>> +++ b/drivers/power/supply/qcom_battmgr.c
>> @@ -19,8 +19,10 @@
>>   #define BATTMGR_STRING_LEN	128
>>   
>>   enum qcom_battmgr_variant {
>> -	QCOM_BATTMGR_SM8350,
>>   	QCOM_BATTMGR_SC8280XP,
>> +	QCOM_BATTMGR_SM8350,
>> +	QCOM_BATTMGR_SM8550,
>> +	QCOM_BATTMGR_X1E80100,
>>   };
>>   
>>   #define BATTMGR_BAT_STATUS		0x1
>> @@ -1333,7 +1335,8 @@ static void qcom_battmgr_pdr_notify(void *priv, int state)
>>   static const struct of_device_id qcom_battmgr_of_variants[] = {
>>   	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>>   	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>> -	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>> +	{ .compatible = "qcom,sm8550-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8550 },
>> +	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_X1E80100 },
>>   	/* Unmatched devices falls back to QCOM_BATTMGR_SM8350 */
>>   	{}
>>   };
> I think you need to squash this with "[PATCH 7/8] power: supply:
> qcom_battmgr: Add charge control support", or move the modified checks
> for
>
> 	if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
> 	    battmgr->variant == QCOM_BATTMGR_X1E80100) {
>
> into this patch.
>
> With this patch right now, I would expect that your series is not
> bisectable: The wrong code paths are chosen if you only apply this patch
> because e.g. X1E doesn't use the QCOM_BATTMGR_SC8280XP code anymore.
>
> Thanks,
> Stephan

I see.

I was making it this way to address the review comment from Bryan in 
patch v2 about separating the compats change. See here: 
https://lore.kernel.org/all/7f001134-e099-492d-8ce5-4122d83a3de3@linaro.org/

If I revise it according to your 2nd suggestion, would it conflict with 
Bryan's feedback?


