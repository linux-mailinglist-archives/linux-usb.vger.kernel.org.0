Return-Path: <linux-usb+bounces-28687-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AB2BA20A7
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 02:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99D15189DA52
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 00:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FFE34BA49;
	Fri, 26 Sep 2025 00:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTZFtog3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C3A34BA4D
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 00:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758845679; cv=none; b=YUOTVmcN6w2nKh1HPSnQr1T0wCJHfCPUoKj1Pdysx+c+HnesZXaVI2J8BP0vnm1ciFjn960oDxzVwdKQAsoD5qQenF9nRKEjuN6WJLekq7wOqEIFBA8ZQFXtOXahbibZngOZCvBLdkRWVMqfnA/TOud3JbZVDsE65Phrt0Qn18Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758845679; c=relaxed/simple;
	bh=81r53nq+yKoXBaJ4jwvZf/v4iOezccpg3MNQTvV2+X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M11DeWgXjsZuKc2CtQ2InPvjHy5EaV4gANwdnuC/Yza1Oz4xjTeXEJxng7dtDOzIBiX3ezLfAKMBeIbEwhnNWYCHigyGRq426t6NpEjoF+BUGmP9baiR88QBnfwpeU0Jp8nxtbDjPkOI50T31mp/Wcy0joWRxM2ITmm9c/1da0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTZFtog3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPlGJ014738
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 00:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y9aVQL6fEAcMEMTP9D/9Z6oTfy+cY28XMdggMyG2w/o=; b=RTZFtog3ulZxflRw
	CVYRks4Vr+AFqtvRb2kti29vCk19UwRstvMPlqFZakQgnHKJBcKuBm2qEEB+n1bx
	ikU5b8JQzPbne7dxrVJXIAlC/PUDsjYrZYkx3LKq8HNvf8UzsfnTLVARh4ehBetw
	Vs0WmegRNIP12xSGOqMJqc64YMhV8EvldY0JoaRdJaKRdrJDgVIUcCfQ1cCihINt
	h8247sc7y7UiTy7sKudy8cFnTkckARR0QwyBMGo6GBOYX2piLZEo+xaKiOI3iioW
	QCTH2+253rOeFFlqMcpFQEppiPq0B0OaQ33xaCrs7mgX3QneJs4ajd/kN6yF9cIQ
	CKRnCQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0t8sh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 00:14:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2699ebc0319so16454325ad.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 17:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758845674; x=1759450474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y9aVQL6fEAcMEMTP9D/9Z6oTfy+cY28XMdggMyG2w/o=;
        b=ZBZXQ8O9f8Dthu6R/TAGKnxEXn5u7k0aTe+pwXzUMi6724zybXNp1l08fJZbIGic9B
         3nce6WYG6Sdb8Dhw2+UlrkDok6zY7P9RjqmqpO8B8jBeXdznKVN2ah03b7cIDjH7yPIF
         sWlvLD3DbUflrLzEX7pXpvy3cyy6HsAymrdkmTKw9fyFqbsI+L1Z53mZNqc4Ja/PJCdE
         +szlNvTc+TE1X1XJd3KElzgDDl3EGlP89juYklhDliRpSz8ZEJNYDZbNtsytuneQpsfs
         uXuek357r6NbMCcC1mTJsq308kjNZg7mbTIECL5cKu2sHQ8t20o57s1s1PcvgseB6qQp
         cWDA==
X-Forwarded-Encrypted: i=1; AJvYcCUwQwzMJO5VdYv6HWEN2S6uhgLcO4eeJGB8nMlfEEPN6VQoCj/s7vEMWvFvFKcaGItsfmT0Q9g+eCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyX8xOzuk8LJrxAncyhWhgoJsis5WDVTqHkFcIkQ8xNVEZRr0x
	oxtE7cvXF5nZ+dpWpgXsQf0Yxd5pytpkGseg/YiUYFx/rl6tAcc5VjdsyujLewrVmkFCIC7TUtg
	ozb1XuwAQqs1l00/+No6cWcGZxH0ZMH5eDEVPeNQL0Ja96IIZjfIDXB9FuyBcBwQ=
X-Gm-Gg: ASbGnctbMrjzFbwWZTdetJfT5STO5uWLt9XJ9E47VHK06bp4su+m9EGzgf0v0yzw5Xo
	hBwPZZIjyNki5UN8MI1ByTCkPXKaZ6vOxx94/6qsVliLBrSWwpYeJmxPwopKSE9ObYGC8JOTDT4
	6mzUVSNcgnO7je+U6lSe/tnXUzJSM+4M5JI9EOS5eH4HFQfGVI6DNy02Ma1Te6tRNWMPBf3l71d
	rN02F6f103wcvKdyOlZwdBvnyFFUZbxM9OiDu3X1NCZ8hcu/uTm/63LblwaXQYi5ktxRXUe5ECa
	BeWPkKvwZNF3C+U3n+w6vQclWK2Ihpszykq3NlVq9ZDevg/azvniQ9mEPcL6I5m+BniRSL/GhSh
	nGoGhsJ4=
X-Received: by 2002:a17:902:f544:b0:246:7a43:3f66 with SMTP id d9443c01a7336-27ed4a06c04mr62262915ad.7.1758845673437;
        Thu, 25 Sep 2025 17:14:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6RS0Z+VcLwtx06uS7E/LrV2b7e5WIQiC7s7bIX/lu3xtr100NQaYggwOJ4VVgTNHsEDWRcg==
X-Received: by 2002:a17:902:f544:b0:246:7a43:3f66 with SMTP id d9443c01a7336-27ed4a06c04mr62262565ad.7.1758845672931;
        Thu, 25 Sep 2025 17:14:32 -0700 (PDT)
Received: from [10.73.53.199] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cf181sm36713155ad.28.2025.09.25.17.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 17:14:32 -0700 (PDT)
Message-ID: <5e9e2824-923c-1328-dd7a-a8b496c44a70@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 17:14:30 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
 <oecyjwj7ouufjbiq2fpvlhhuaof5agm22fdsruf3ppayiu4kkm@wvi4no53x64y>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <oecyjwj7ouufjbiq2fpvlhhuaof5agm22fdsruf3ppayiu4kkm@wvi4no53x64y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ADBQh4Vu01mXl0eJy6MS85xazcfXcuik
X-Proofpoint-GUID: ADBQh4Vu01mXl0eJy6MS85xazcfXcuik
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d5daeb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=INxguLwuHvTa_v7rZvUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXzrLOoC4KKYlJ
 9SszowXaD6FH7apwzV4JQlhV3YPoZIebiY/RzG/G92HgVGhZHiijjXg6fxa1UHL1mcO1Q1ASUG+
 fZ79e+NXqmOQJhsDW1f4zCrfO7lAzEXnjPfcgWPQ/FcV3ERgy+Xq4B8FeeBShxw01zUvLEqEUXv
 4sKuIz6Q33qR+wscIfb81ifYesy/NFGp4YScM8K5W+8mEizDFHbjOpABDgZtErfeYn5qKtnunaW
 0R0nG+ZLAPqwyOKkXap3iJ2FkfPZmhX/2HEfvsSWtC0YG2ynLZkjQDvts4QSDTdK19xuh/X9AoB
 tTSttLnrW6i53wByDHkhXuGcyUIL7MXcf4JDSOzUi6ChyghLqWgAaDJj8FhmjuHs8ikop3S4VrO
 f6JNWQGXPKffRlHwBMBFi6OmEJO5Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/24/2025 7:54 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 07:28:47PM -0700, Wesley Cheng wrote:
>> For SuperSpeed USB to work properly, there is a set of HW settings that
>> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
>> these settings follow the latest settings mentioned in the HW programming
>> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
>> new ways to define certain registers, such as the replacement of TXA/RXA
>> and TXB/RXB register sets.  This was replaced with the LALB register set.
>>
>> There are also some PHY init updates to modify the PCS MISC register space.
>> Without these, the QMP PHY PLL locking fails.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 311 +++++++++++++++++++++-
>>   drivers/phy/qualcomm/phy-qcom-qmp.h       |   4 +
>>   2 files changed, 314 insertions(+), 1 deletion(-)
>>
>> +
>> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_misc_tbl[] = {
>> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_MISC_PCS_MISC_CONFIG1, 0x01),
> 
> Why is this V4 all of sudden?
> 

Hi Dmitry,

Will fix..

>> +};
>> +
>> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_tbl[] = {
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG1, 0xc4),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG2, 0x89),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG3, 0x20),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG6, 0x13),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_REFGEN_REQ_CONFIG1, 0x21),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RX_SIGDET_LVL, 0x55),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_TSYNC_RSYNC_TIME, 0xa4),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RX_CONFIG, 0x0a),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_TSYNC_DLY_TIME, 0x04),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_ALIGN_DETECT_CONFIG1, 0xd4),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_ALIGN_DETECT_CONFIG2, 0x30),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_PCS_TX_RX_CONFIG, 0x0c),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_EQ_CONFIG1, 0x4b),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_EQ_CONFIG5, 0x10),
>> +};
>> +
>> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_usb_tbl[] = {
>> +	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
>> +	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_RXEQTRAINING_DFE_TIME_S2, 0x07),
>> +};
>> +
>> @@ -1667,6 +1899,12 @@ static struct qmp_regulator_data qmp_phy_vreg_l[] = {
>>   	{ .name = "vdda-pll", .enable_load = 36000 },
>>   };
>>   
>> +static struct qmp_regulator_data qmp_phy_vreg_refgen[] = {
>> +	{ .name = "vdda-phy", .enable_load = 21800 },
>> +	{ .name = "vdda-pll", .enable_load = 36000 },
>> +	{ .name = "refgen", .enable_load = 936 },
> 
> Is this a meaningful value?
> 

I need to adjust this value.  I just want the load for the regulators to 
be in HPM, and after taking a look, looks like based on the rpmh 
regulator table, I need to be voting 35000.

Thanks
Wesley Cheng

>> +};
>> +
>>   static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
>>   	{ 0x00, 0x0c, 0x15, 0x1a },
>>   	{ 0x02, 0x0e, 0x16, 0xff },
> 

