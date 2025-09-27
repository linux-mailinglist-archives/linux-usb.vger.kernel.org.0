Return-Path: <linux-usb+bounces-28732-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF222BA56B0
	for <lists+linux-usb@lfdr.de>; Sat, 27 Sep 2025 02:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B7EC4C3CB4
	for <lists+linux-usb@lfdr.de>; Sat, 27 Sep 2025 00:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2C61C84BB;
	Sat, 27 Sep 2025 00:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcB57Lvf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55E51C3314
	for <linux-usb@vger.kernel.org>; Sat, 27 Sep 2025 00:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758932782; cv=none; b=UkZUw6S01AtSB0H6fkyCnRp0ASoC9HWM0ch4ggEVoG+bubdAN/qHJ1qVxSTuQl2s54cSJ24RqjOvRHP4mibTb4gaacRRU1bBNszwFjzPrSolVapLWjBqg3LD/1ev4saoK2I1hzYx4t0f3gHjm15L6JNd/maA18Pgje3exq96aTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758932782; c=relaxed/simple;
	bh=Ie1+3dOmzn6F/oLn0yks7AubPDSI2bOKAARyt9PpkzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UiUNUdj4zBLLONHiD/HcCRyndiyG/4w36iZbtweQIejTfMzYXPzCxd+YJgsnI+Bpc/5KDBewWJmyJal/mq+sQK4ia6nvbjamDS+Z09IYE5nphV+YurlANCZKkb6Z5jQUpfsFVBZyI17Q0K7nDxz7P0BB69vE5YlWwvqvrQ+C/Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcB57Lvf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEXNh6017425
	for <linux-usb@vger.kernel.org>; Sat, 27 Sep 2025 00:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RcvHuJWCbk3BM+dDfbEeuaA/xZMstL+kCgs1ypKPlgs=; b=dcB57Lvfe3uZsrIs
	nDRj+QPZE3erPi5hptVnoU8pG7SZFqJVkcAvGtQzj1ZqiOstWvV2gxaptDPlRIfs
	XFKJlibWgim3QDRKeM1BYxWvgwsLzqFlVvKwCtUk3U1UQ/ELRdQ1DQd9O+he97OR
	PObWWdi57Ro6HRSH9iPXq4WZnmhDATWgbMURlyxS/465f3+365NrHzCVWJ1iG2//
	PfaJdY5OkXCncWTAWbk/khzN5PFAAGnwZ8KPSvH727AnsVijD/Euwg1Q5hxOtc9a
	ZuNF4DYRFl1vaSzgO2pJpgFoP1JgCamrCKmXH/+I/g//5n00mm06eE6zWPXNS6xU
	utxBrQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u4fkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 27 Sep 2025 00:26:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24ae30bd2d0so23979935ad.3
        for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 17:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758932777; x=1759537577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RcvHuJWCbk3BM+dDfbEeuaA/xZMstL+kCgs1ypKPlgs=;
        b=wcKhmrbnrn3IxncedG2cTNXumoIO+lEbcDo/hkIvNIhTq7hZMb0FehTaV3+8l+Bk04
         d8ZkHLEwnftjHABS0aSGytrmTYU1HkNl8LAtsFqpy5geBJ38EtfNZ5pOlp5WP5sAPSnt
         JVMkY8wmO+gCOoftBlEW055XM2lT8lSxo82hcPaeonxptFg1h0gz6+DPQZqszR0oYsas
         xetpjiD074Mz8q5xNxxhIBaLLxBpw8jIRrHKT9wDaC6eGLqDvhfiFKvyBNyFhssRHnWT
         ENjuMmsyENwtDkWQDFXUyWPRpYk+LzCLNwMYxRRlKUCsDlwIsGv384MRAsIeVGM0dpYo
         j3xA==
X-Forwarded-Encrypted: i=1; AJvYcCUtveJaGZRkh9pxNN7yecBfDTRQCmZFkYQOj6gvdxYUW0Y0ongVeWPpQ+oX7Qvp/T/1LkIifRjpTRE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+EMopfHa9HNxrAJb2bgf/yebVaJqFFxHFTyLSjjjRQiWwlXsW
	+5Bg5Kd3h9jJyQJ5qHevY+Vl6DOOy/wVUmG2/2Up+bE/F3JagRuS/JstUQ5EeIzbXflbYBIxD7h
	L1JAMCAOUrGy9DX+MPApI30nwegMCj3VucGV0esVoFvvuAzzHWDuroAbCF2bQrxI=
X-Gm-Gg: ASbGncvGPIupcYIZwXeKUlr2g+vf/15/SZioFKS/yGP6tal7IeQ/rHhdIjOQuKNfUIh
	zZb33ObSKwyt2C3xTogv514cKiLLxt+6aWAR214Tr25y38/e5pwfpTn0VJLL4MFetVRd0lic0z9
	sn8FPaq4XyY0AzPgTd5IgQ1jXd/QG8ERf4RGvNCRaiUrgSrsndsvbsMICMwKlWGItQ7zAmjY8z8
	0aWVehlmHxMpF1ZBBcTPi5dPOxXbcnTa/89Y2Sc+Th7RUKEkk9aqyYboJTMx+7m2WMTRDZbSS6I
	zcMDx7ZIAWpHYl5sT59rcj6in7k9HCqhAhlS5nxeUQUjefF5DxlBr8PhZNhlaboThnKYfWZuk5C
	+CLfQNRk=
X-Received: by 2002:a17:902:db02:b0:25d:d848:1cca with SMTP id d9443c01a7336-27ed4a9210cmr101101295ad.35.1758932777141;
        Fri, 26 Sep 2025 17:26:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl/VvGzXBiAsVCQPQ5JSyszwVAPZ3CE+4Pj60nC2J+bmZi/TFe45otM20FRy6jWafZOYKjuQ==
X-Received: by 2002:a17:902:db02:b0:25d:d848:1cca with SMTP id d9443c01a7336-27ed4a9210cmr101100975ad.35.1758932776652;
        Fri, 26 Sep 2025 17:26:16 -0700 (PDT)
Received: from [10.73.53.199] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d3acfsm66321885ad.20.2025.09.26.17.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 17:26:15 -0700 (PDT)
Message-ID: <89375a6d-782f-8b89-bf16-1d13b7a525ed@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 17:26:14 -0700
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
 <5e9e2824-923c-1328-dd7a-a8b496c44a70@oss.qualcomm.com>
 <exe3i3lgeor6bdokdqzu2nlenlbtjgv6c3swek3phirsinjnhp@tb5x5lkf2i26>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <exe3i3lgeor6bdokdqzu2nlenlbtjgv6c3swek3phirsinjnhp@tb5x5lkf2i26>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: exso3rX7IQXTlY7Uf7P9Z7TpERZqaXLp
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d72f2a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=sM_2IyiB1HmcMQZSuvwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX+RfW7CqhPUyt
 HfC4SbxDCu93CJ86Bfg5+1GLbAMGXJhVLPT/fyqdzYj+KxC9PHaTXs+RcRRi+LtmPkrdf0lyB1p
 6JXhprV68oLb/1lVZnnRMUHBQe946O73ixqBw73MnQCpFPYerEeWpN75wjJKvRGQ6VkhqkZz7gR
 pgFCHO8D0HN1XAuvZaW2brcQhxmoNtyPiEydQkFFSo8Ls7L2/mhaqkvtXQM5RScuZY/Or8mLIqg
 zHo2LtSoh2SWj/SBXsKbubEXOzw0oPMIQZ98wGhS3ULkQLywoCZ/Ut1fpmWH1ekdDW3JHsfpo12
 YYOwKKFvwQXoObhxd34N1ZYWXj+A4eJdbXO5zUNtICA5meWLHhjOWxfCnF/G/eZhVNXCQBecHep
 52M+FF7Z8FdKmY9dsXmf6r7pgm5T+w==
X-Proofpoint-ORIG-GUID: exso3rX7IQXTlY7Uf7P9Z7TpERZqaXLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/25/2025 7:11 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 05:14:30PM -0700, Wesley Cheng wrote:
>>
>>
>> On 9/24/2025 7:54 PM, Dmitry Baryshkov wrote:
>>> On Wed, Sep 24, 2025 at 07:28:47PM -0700, Wesley Cheng wrote:
>>>> For SuperSpeed USB to work properly, there is a set of HW settings that
>>>> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
>>>> these settings follow the latest settings mentioned in the HW programming
>>>> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
>>>> new ways to define certain registers, such as the replacement of TXA/RXA
>>>> and TXB/RXB register sets.  This was replaced with the LALB register set.
>>>>
>>>> There are also some PHY init updates to modify the PCS MISC register space.
>>>> Without these, the QMP PHY PLL locking fails.
>>>>
>>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>> ---
>>>>    drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 311 +++++++++++++++++++++-
>>>>    drivers/phy/qualcomm/phy-qcom-qmp.h       |   4 +
>>>>    2 files changed, 314 insertions(+), 1 deletion(-)
>>>>
>>>> +
>>>> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_misc_tbl[] = {
>>>> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_MISC_PCS_MISC_CONFIG1, 0x01),
>>>
>>> Why is this V4 all of sudden?
>>>
>>
>> Hi Dmitry,
>>
>> Will fix..
>>
>>>> +};
>>>> +
>>>> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_tbl[] = {
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG1, 0xc4),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG2, 0x89),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG3, 0x20),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG6, 0x13),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_REFGEN_REQ_CONFIG1, 0x21),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RX_SIGDET_LVL, 0x55),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_TSYNC_RSYNC_TIME, 0xa4),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RX_CONFIG, 0x0a),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_TSYNC_DLY_TIME, 0x04),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_ALIGN_DETECT_CONFIG1, 0xd4),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_ALIGN_DETECT_CONFIG2, 0x30),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_PCS_TX_RX_CONFIG, 0x0c),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_EQ_CONFIG1, 0x4b),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_EQ_CONFIG5, 0x10),
>>>> +};
>>>> +
>>>> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_usb_tbl[] = {
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_RXEQTRAINING_DFE_TIME_S2, 0x07),
>>>> +};
>>>> +
>>>> @@ -1667,6 +1899,12 @@ static struct qmp_regulator_data qmp_phy_vreg_l[] = {
>>>>    	{ .name = "vdda-pll", .enable_load = 36000 },
>>>>    };
>>>> +static struct qmp_regulator_data qmp_phy_vreg_refgen[] = {
>>>> +	{ .name = "vdda-phy", .enable_load = 21800 },
>>>> +	{ .name = "vdda-pll", .enable_load = 36000 },
>>>> +	{ .name = "refgen", .enable_load = 936 },
>>>
>>> Is this a meaningful value?
>>>
>>
>> I need to adjust this value.  I just want the load for the regulators to be
>> in HPM, and after taking a look, looks like based on the rpmh regulator
>> table, I need to be voting 35000.
> 
> Please provide a value from the platform data rather than just the HPM
> boundary.
> 

OK, I referenced our power grid for the correct Ipeak for that 
particular regulator.  Will update this number accordingly.

Thanks
Wesley Cheng

>>
>> Thanks
>> Wesley Cheng
>>
>>>> +};
>>>> +
>>>>    static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
>>>>    	{ 0x00, 0x0c, 0x15, 0x1a },
>>>>    	{ 0x02, 0x0e, 0x16, 0xff },
>>>
> 

