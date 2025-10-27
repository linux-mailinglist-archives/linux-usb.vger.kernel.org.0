Return-Path: <linux-usb+bounces-29686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F784C0C525
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 09:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E0164F0D71
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 08:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58F52E7166;
	Mon, 27 Oct 2025 08:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNzumApB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F6B1DF27D
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761553925; cv=none; b=S0tRBRC2+GMbOcT0u/J6LlTX5lDPegZcz/h3X54dunbNOpzliD470jfH2FbHIsneuspw88RnU2lcaDiG+0/TKU6INRL5gRfqbTFUumrKT+ynxgA4V4BOALL0uM6Z0Q9jjxNe7G5SnjSbkxF/vfvI9P01/6qdK1QYMpWONn58r+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761553925; c=relaxed/simple;
	bh=RSfpfphYkf73MtZSBd82Y1Axxx/IQ+C0kNZbF1z7ZpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9SNbLPJFgWQZYE/zp7uvNx4SbEfrv3RZf0IRT4bEdYZwB1FISP/q/JBnR2TxrIQ68PoUmtq9sD/aWdaHGvJ5KerMC3PnNis57tOmOVpJ2Mk9g0mpAvuv4/oK6TIv6xbzRggmgmR4TYRBejMnfZe245AovlHcE+oO9r2QDCm9ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNzumApB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R7JugW2059252
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 08:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sx63s+VEGub670xFqR/IElGnwDWu9CRZ/VDK1Eqvsfs=; b=nNzumApBBadV2W8f
	P66xcqTSanCcCCMHYJtUWYzjf2B85ip0FS+lIhm6g6sVeoLOKPpNTAgdOVUtVl6T
	nWnXoOrGV5sHHIsb5a9eoUI7GCd/03MB0ABWhs0OGLcPRASVdZ30/2JK4+fGd2Ux
	cuHwTLvstHhN77xqbjy38xNgBweO5eHOeabb5yEJFhwJTc3gSzVn5LtsaSl41pEt
	CkiEz7HuQIslr4tCgt5KEb3AGLGlasX8dKk9KISmT9dhXKIDjxZq+HhbAr40lPoo
	o/9Tm/pwom/OSDpmTKBjfICwqQlHjhh/eOENKJJnsnfhL+at1Xdwz9W38XU0v9ZK
	WOjQfQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a248p85yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 08:32:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2909daa65f2so62973465ad.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 01:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761553922; x=1762158722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sx63s+VEGub670xFqR/IElGnwDWu9CRZ/VDK1Eqvsfs=;
        b=AaM1jLkkCw2zSPDL2TK+sl/1pPrQsxX5HOMpBhRn7gr/MXd5beligtiHriHnYNpfmB
         JMWEl0upNuWsHbuKQjoBY/1HCIRYpKS3+9jZmWtg0N3nSLnrN0NExR5qqXSSK1YruDLr
         qfw7PFAmOgDN/NOEsiNkWbhSBRkdDF9fPCiU4gGCUfkMo/80PDI6OgnD4UPCwzHi4Z6F
         aMUp6Z+dphLl2CBN+2hYLy6nZRIlrKr1Q8zwVzy3dEGnyw+I+e5FgA/PNZYSeLbXjLjD
         hAGs9NnX5W9/9Z9lOWhYUWS5U5cwbxOlAFo/EAv0l8Ze1ruo0SgG5U1KQ5c5ojncpwmb
         prTw==
X-Gm-Message-State: AOJu0YzWKMqyoMlrXLtBpX/WvV9048TKFv+LxPwdQrJYrK6vUq/fIu+B
	JxC9lVuBwnFLJhsMxXhLq0ZD3zX3sLXWa5n0DEvTm20yZiATxAfd/7C90detA3wqOkdjRi0JyXK
	fThtKl+PjmT8FresMEPw7JcsGpqrwbIt/A/+s+1vDOrWf94l9P+7zF5Ibx+v5lnY=
X-Gm-Gg: ASbGncu6Pldy0MYYa+ROhgHGO6pQN50/Rprub42Mhpixr6unyX3gcHzH0ix5MsBVo6c
	Zqh1yyW8hOax274ZMLSukTVWiPc9A073NMjX8zGTzqazS6kTHmTrr6MuMKcWdbRQ16m/1BhzPaG
	GtE6Ucyd59TmSgGy7bkUfT0YYdql1wFfD/g1rr88nhXuUCObhZurcZ4MhOBnyosk73MXPIWDZ1y
	9NcyUXrOOANTqZsHZbro9KxEF0/Wi83NmbxBE3mQ4nSBJ0m7gQ+dyaL24YqEeJzGp8qr7I1GT5z
	mZCTIoB2NPw0PvopbNdk4TL+8H1I6X4YhCixqj+Rx59w/PHM5vtyZiJdXnoWXcZ8BP+6YVFhXDv
	V5PxTz5gqB522KtWgz6PLXa+KSoOPcCSg
X-Received: by 2002:a17:903:185:b0:269:8ace:cd63 with SMTP id d9443c01a7336-29489e773fcmr141431325ad.30.1761553922363;
        Mon, 27 Oct 2025 01:32:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0XF2U4phwBqiDvn2bL/HXA0I40/tXYhgsNsdk2eMlASGSo5k9irm8PXwBWuFXZfmiIvaHag==
X-Received: by 2002:a17:903:185:b0:269:8ace:cd63 with SMTP id d9443c01a7336-29489e773fcmr141431075ad.30.1761553921898;
        Mon, 27 Oct 2025 01:32:01 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2903csm72918725ad.63.2025.10.27.01.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 01:32:01 -0700 (PDT)
Message-ID: <e4ebf454-93ae-47be-bb12-2ab363812b1b@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:01:55 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: ti,hd3ss3220: Add support for
 VBUS based on ID state
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251027072741.1050177-1-krishna.kurapati@oss.qualcomm.com>
 <20251027072741.1050177-2-krishna.kurapati@oss.qualcomm.com>
 <TY3PR01MB113460779967E7BC8FEE11DEF86FCA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <TY3PR01MB113460779967E7BC8FEE11DEF86FCA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zvzg6t7G c=1 sm=1 tr=0 ts=68ff2e03 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=uVO98WeOcy1yjMVTFfcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA3OCBTYWx0ZWRfX5au8tdbROMTg
 gDjf474kVuTqC2ddZoVtkkGhmNJXs3UIt/cLRQIyoHSDUEWra9QHekVtKle5A+ksvMJVpwfrF+s
 NA6rhUKRV1koKDQ3O/ihnl9TuJyLkFmD/dcCjIh7l6PlhTxeQQCoiyEb+47iKn/lyyELB0EcL8A
 BWSueWDx3/gMNT5BLAzlWjVzpftpbOSby48e+Ptw2VKT1ZJowTGrby+1Z2FmfImBrgkMC3NN0sF
 l1Xb+g6cV5BGwSqeulh7mpHXFXBCZOmYanQOyoNCua9SRH+7CuAQxt7paij6UMgTrKmRi8dxkdo
 jp7Dt1VORpAvyk79OhLpPX68rtY56VGJ4rpXkrMl5PgmXskpm/4ngYEH+CWuhS7swlc1BPyXZSS
 J2Wl8XIVDl9CM4AFG5WBs6Mj63R/uQ==
X-Proofpoint-ORIG-GUID: hl4NmjwXeeo5h1pbCLPyIqw_Bmh_sO6Q
X-Proofpoint-GUID: hl4NmjwXeeo5h1pbCLPyIqw_Bmh_sO6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270078



On 10/27/2025 1:02 PM, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Sent: 27 October 2025 07:28
> .kernel.org; linux-kernel@vger.kernel.org; Krishna
>> Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Subject: [PATCH v5 1/2] dt-bindings: usb: ti,hd3ss3220: Add support for VBUS based on ID state
>>
>> Update the bindings to support reading ID state and VBUS, as per the
>> HD3SS3220 data sheet. The ID pin is kept high if VBUS is not at VSafe0V and asserted low once VBUS is
>> at VSafe0V, enforcing the Type-C requirement that VBUS must be at VSafe0V before re-enabling VBUS.
>>
>> Add id-gpios property to describe the input gpio for USB ID pin.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
>> b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
>> index bec1c8047bc0..06099e93c6c3 100644
>> --- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
>> +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
>> @@ -25,6 +25,14 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>
>> +  id-gpios:
>> +    description:
>> +      An input gpio for USB ID pin. Upon detecting a UFP device, HD3SS3220
>> +      will keep ID pin high if VBUS is not at VSafe0V. Once VBUS is at VSafe0V,
>> +      the HD3SS3220 will assert ID pin low. This is done to enforce Type-C
>> +      requirement that VBUS must be at VSafe0V before re-enabling VBUS.
>> +    maxItems: 1
>> +
> 
> Maybe to help DT users, add an example for this use case??
> 
Hi Biju,

  Adding GPIO to dt is a generic thing. Also this is an optional 
proprety. Can we skip adding an example.

Regards,
Krishna,

