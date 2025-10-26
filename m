Return-Path: <linux-usb+bounces-29671-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 956F8C0AFC2
	for <lists+linux-usb@lfdr.de>; Sun, 26 Oct 2025 19:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A94E4EC3BB
	for <lists+linux-usb@lfdr.de>; Sun, 26 Oct 2025 18:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C547262FE5;
	Sun, 26 Oct 2025 18:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvfy2GNQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BAC1411DE
	for <linux-usb@vger.kernel.org>; Sun, 26 Oct 2025 18:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761501816; cv=none; b=hjMB5BZUjH2GtHhtasupBayW7qdSHzagyjnXfKbDpLjbHbS/aK4zOwFGu0z0m7v7z5TkGFBNVlz7qOztMI6wflo60qFDDuqY3vVADdG7Y7Xzg2zvXWNXVr+DHMSlXbfN8G0si/KsHsGX9AnRAJRp2ayv7RylWzHhVhKVGNJnuF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761501816; c=relaxed/simple;
	bh=cORcqgdcKWHgG9pVbbHOxGzCp1SD0U+vVcRQ4D4iyHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e4JBVuLUji9tDoPffWO0mzy4xF+u+lgVRMIj6SBRumdQtE/zNxqFwG7ytTuh5PTTpPsYMUvGJjsBPqEiGN8eRkrr6gXT2VJdEvzrkbxjgF6MEGe8dGP9algmhU1aD/5No6hv/ThHWkf8JkVYagpgQsTiajUuwmIGUVMSqnHle+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvfy2GNQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59Q7hXFl3422108
	for <linux-usb@vger.kernel.org>; Sun, 26 Oct 2025 18:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZxrMFflhLeg4QntPw4Vis45Isvn21+Tev92z2ffrZmo=; b=hvfy2GNQaHhcXsCo
	6Crq4SC2k96LQJ7RLMhCFJZ0jRFG0Pl0pKYeGlR1LS9GqqpFWV3gMNsnb7RkWeyQ
	DgOtNNqjxxvzmXHqj22Vp0QLBVw6GfpAzxpNTlcYrj3gWSt/tg8jpx/XhDD6CRIk
	lyc70ZRKmPRRdc1ZjwXzNFnNx6RcPsKThKhOkjOnsOM1BEL5mqcu/FeY1YlkJvD6
	BH6qNLyTWC22qmIaOEqwA6Yyl+WEikkGorAYaLokBeMTOqegzqayGvHWPfxWbx1i
	4xHiRQgmEbYpu4F0OSg7TTg6RBDkc+RZRkgtJcLp27z7U5ky8VfmRwCzPbTJ9hnX
	nh+O9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0qu828t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 26 Oct 2025 18:03:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290bd7c835dso36651755ad.3
        for <linux-usb@vger.kernel.org>; Sun, 26 Oct 2025 11:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761501813; x=1762106613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxrMFflhLeg4QntPw4Vis45Isvn21+Tev92z2ffrZmo=;
        b=vKGb6+JhNKWP4Iwgi6v5K2JJR/cOJ8vuNn6hI01NiGQBrbVCnzxJ/ddB7PANP7h+79
         N6cjEw60dutT1vbA3Yel35u1ks7M65Gdis/iArXONRpBP9RTaFGqAznL2SYv9hoIhviC
         Lyc/izcgmh/yGZNBhkQZaY8j804bFh6W0y5sWDn9dho6q3R8XB/cp1rbpXbc/R0k3CEF
         nVrDFm2x0WUJBAlIP0ERfEtX0QFHhZIP5ADw8kqK/kSqplZen08ZovsNgx6dkP+WCpUr
         +Ry73la+PVrzj3M5u+5MGaoKcc5wsvXxcj2VQpT4LLpOii262XLNRJZVhF7wuOULpVyI
         aCsw==
X-Forwarded-Encrypted: i=1; AJvYcCUPtVAieDNHLHrOG0ibSDPAU4KC6bJ3ueIckwM2zODcU681OeBYjCexslnmPMZ4uP/eyHAYnZ0MKCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW4N5nFjlykoxa64IC37En5FYhFdDca2DB3ZOwWgVopsUlEmBi
	+ma/AMt5IVG+iwMFOyMql+ixjHo3ORxg5zV7yPGuw52fcBy8NeR+OlnBkrI173ePTs09suBvlM2
	R7G6QAt4qxsLIVO3iMPTh+uBfTd5j6AkBm0ynnA02lGc9vbRtqV/yG6jSub1nN0s=
X-Gm-Gg: ASbGncvRToAyP1f3e/LeIK3FVvBmkTlPwLR+bL2SAGh3lQxbAZ/JsnIs/2CBSAd268d
	r1bgix/9EGIk0KGmfA9q1ipnGvhzSfsHycl1qZ4nknncIauyYZDficJdjZ+zk9uiRDvIRR+IPnK
	JCRjRebMXBYynkpayvj90EBQxjF0O82SCbbelzIyl/DsIjFmNuSzSYWlSX4KfaxKQH1SNkMK2rR
	bzvpO2dHx42ZI33D/etj5YF9K240AwpRRfzRVb5jKNHWiFB5vjuLVEFlrGNkNNH+oLEKuyaPdDg
	2JSPcR+Cd87m8qaxqHqeUA8rxLRRag6DHDacRvPbx+PpUA1pPoqaout8zHymCWepO/FZrhvAYg1
	DB6jESHSTZcARbqsbg6rWOf8hxQzlrh5q+sY=
X-Received: by 2002:a17:903:8c8:b0:251:5900:9803 with SMTP id d9443c01a7336-290c9cbb8a9mr440697155ad.21.1761501812696;
        Sun, 26 Oct 2025 11:03:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJRu3/mHPj8RD+WBVtrofAc2L/JstTu/NuEjFDA9FcFUaVPHjzkQlaT0MDYYLsiH2Q/0vnBQ==
X-Received: by 2002:a17:903:8c8:b0:251:5900:9803 with SMTP id d9443c01a7336-290c9cbb8a9mr440696825ad.21.1761501812087;
        Sun, 26 Oct 2025 11:03:32 -0700 (PDT)
Received: from [192.168.1.3] ([122.169.146.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a7esm56216155ad.70.2025.10.26.11.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 11:03:31 -0700 (PDT)
Message-ID: <f43d6bd9-abe4-428e-a675-32cbb9c719b9@oss.qualcomm.com>
Date: Sun, 26 Oct 2025 23:33:25 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] usb: typec: hd3ss3220: Enable VBUS based on ID pin
 state
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: biju.das.jz@bp.renesas.com, conor+dt@kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
        krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, robh@kernel.org
References: <20251025122854.1163275-1-krishna.kurapati@oss.qualcomm.com>
 <20251025122854.1163275-3-krishna.kurapati@oss.qualcomm.com>
 <9b059848-1512-457c-8437-8172e3726992@wanadoo.fr>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <9b059848-1512-457c-8437-8172e3726992@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _epfwHvg20HRfOocGhMZvcQvs1JCH9Cs
X-Proofpoint-GUID: _epfwHvg20HRfOocGhMZvcQvs1JCH9Cs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI2MDE3MyBTYWx0ZWRfX3l8oqZm0TyGX
 fKUD4TXWXh0EbmEPab/wpd2WWKkMT8rrFIo90I8LtszjkXB6znY8Nj1VsLUczKZDrJI1jgxhIUn
 nZk9Blr/JcVZ3+iKuQ3PS0oiZrCQ4oNeEeTUw8ZKKTKG/GXZZYxCQoXQR8RbeWhxsGKJ25rcDbJ
 pJlb0scvP3MKtV8Z8x/ccfGCgcDSglj6EEOXolqjpU3OV8oYnP+b/drzQ8jnUHnPlFs9rAyTlH5
 lLO0vBOuNGQjISOM4Z/g24Z/WNq07DkVUckkcP85K8xJ9G+5eqUUMK9RGrs42lIQdYzaEFdrs5u
 6ZSKPXkUz0kNLCGVU8Z/jJLC/TeLDohx1lYtUFS4PQ5A1n48IjtJLL1IKpVZEmc5LxO71e6NiLV
 uxywwBNbyS62MDLKCES4TY4ViOxrDA==
X-Authority-Analysis: v=2.4 cv=CMAnnBrD c=1 sm=1 tr=0 ts=68fe6275 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=os7cmxGP5G+7zi0Bb7vKnA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=StZl9DhFn1pbSIVtofEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-26_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510260173



On 10/25/2025 7:44 PM, Christophe JAILLET wrote:
> Le 25/10/2025 à 14:28, Krishna Kurapati a écrit :
>> There is a ID pin present on HD3SS3220 controller that can be routed
>> to SoC. As per the datasheet:
>>
>> "Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
>> not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID pin
>> low. This is done to enforce Type-C requirement that VBUS must be at
>> VSafe0V before re-enabling VBUS"
>>
>> Add support to read the ID pin state and enable VBUS accordingly.
>>

[...]

>> +static irqreturn_t hd3ss3220_id_isr(int irq, void *dev_id)
>> +{
>> +    struct hd3ss3220 *hd3ss3220 = dev_id;
>> +    int ret;
>> +    int id;
>> +
>> +    if (IS_ERR_OR_NULL(hd3ss3220->vbus))
> 
> I don't think it can be ERR. hd3ss3220_get_vbus_supply() forces it to 
> NULL in such a case.
>

ACK. Will make it (!hd3ss3220->vbus).
>> +        return IRQ_HANDLED;
>> +
>> +    id = hd3ss3220->id_gpiod ? gpiod_get_value_cansleep(hd3ss3220- 
>> >id_gpiod) : 1;
>> +
>> +    if (!id) {
>> +        ret = regulator_enable(hd3ss3220->vbus);
>> +        if (ret)
>> +            dev_err(hd3ss3220->dev, "enable vbus regulator failed\n");
>> +    } else {
>> +        regulator_disable(hd3ss3220->vbus);
>> +    }
>> +
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +static int hd3ss3220_get_vbus_supply(struct hd3ss3220 *hd3ss3220)
>> +{
>> +    struct device_node *hd3ss3220_node = hd3ss3220->dev->of_node;
>> +    struct device_node *np;
>> +    int ret = 0;
>> +
>> +    np = of_graph_get_remote_node(hd3ss3220_node, 0, 0);
>> +    if (!np) {
>> +        dev_err(hd3ss3220->dev, "failed to get device node");
>> +        return -ENODEV;
>> +    }
>> +
>> +    hd3ss3220->vbus = of_regulator_get_optional(hd3ss3220->dev, np, 
>> "vbus");
>> +    if (IS_ERR(hd3ss3220->vbus))
>> +        hd3ss3220->vbus = NULL;
>> +
>> +    of_node_put(np);
>> +
>> +    return ret;
> 
> return 0 and avoid 'ret'?

ACK.

> 
>> +}
>> +
>>   static int hd3ss3220_probe(struct i2c_client *client)
>>   {
>>       struct typec_capability typec_cap = { };
>> @@ -354,6 +405,34 @@ static int hd3ss3220_probe(struct i2c_client 
>> *client)
>>           hd3ss3220->role_sw = usb_role_switch_get(hd3ss3220->dev);
>>       }
>> +    hd3ss3220->id_gpiod = devm_gpiod_get_optional(hd3ss3220->dev, 
>> "id", GPIOD_IN);
>> +    if (IS_ERR(hd3ss3220->id_gpiod))
>> +        return PTR_ERR(hd3ss3220->id_gpiod);
>> +
>> +    if (hd3ss3220->id_gpiod) {
>> +        hd3ss3220->id_irq = gpiod_to_irq(hd3ss3220->id_gpiod);
>> +        if (hd3ss3220->id_irq < 0) {
>> +            dev_err(hd3ss3220->dev, "failed to get ID IRQ\n");
> 
> Maybe return dev_err_probe() to log the error and simplify code?
> 

ACK.

>> +            return hd3
ss3220->id_irq;
>> +        }
>> +
>> +        ret = devm_request_threaded_irq(hd3ss3220->dev,
>> +                        hd3ss3220->id_irq, NULL,
>> +                        hd3ss3220_id_isr,
>> +                        IRQF_TRIGGER_RISING |
>> +                        IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>> +                        dev_name(hd3ss3220->dev), hd3ss3220);
>> +        if (ret < 0) {
>> +            dev_err(hd3ss3220->dev, "failed to get id irq\n");
> 
> Maybe return dev_err_probe() to log the error and simplify code?
> 
> Above, you use "ID IRQ" and here "id irq". Maybe keep the case case? Or 
> change the 2nd message that looks a copy'n'paste error to me.
> 

ACK. Will correct it.

>> +            return ret;
>> +        }
>> +    }
>> +
>> +    ret = hd3ss3220_get_vbus_supply(hd3ss3220);
>> +    if (ret)
>> +        return dev_err_probe(hd3ss3220->dev,
>> +                     PTR_ERR(hd3ss3220->vbus), "failed to get vbus\n");
> 
> Why PTR_ERR(hd3ss3220->vbus)? Should this be 'ret'?
> 
> If hd3ss3220_get_vbus_supply() fails, vbus will be NULL in all cases.
> 
> In hd3ss3220_get_vbus_supply(), if -ENODEV is returned, it is not 
> initialized yet, and if of_regulator_get_optional() fails, it is set to 
> NULL.
>

Yes, ret is better. Will change it accordingly.

Regards,
Krishna,

