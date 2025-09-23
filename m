Return-Path: <linux-usb+bounces-28571-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5757B97A22
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 23:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68DC67B190B
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 21:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E3330F522;
	Tue, 23 Sep 2025 21:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBMX5KkT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7B327A44A
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 21:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758664284; cv=none; b=K9xZKVhtHECOvqvM36smza2JA8sYsIESPr/5v0rQtNc2G0feR6DCDYeu5RdnnftKM6bNj/gMQ/L6HZaD7FXZc5abOtHnnjoAPxKnPQJme+B8vT3CJmDi9PmFzpuvNwdMZAIxUufLrX8ecg8KFVO0fbwwWNwLs6wM538kX0/0IsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758664284; c=relaxed/simple;
	bh=Phi3PYB3KOmm3zJUanSEv1JY6ERzYhkvkqz9KTEqZ1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pirQhUAke960BNiYPD33o4ZGl7mETxTrEsO6JcfEDsaL/jc3G86x4mxAYjjg7cbEYZOyOEoRPimiynU6b433/K0b0qHLKtMizfWgl5PzNMgESgn60+TKvw3ZSl7rz44Ew438kJhHeYKDKwDZvUhJRZA3eCJLfKPTRa76P/0NUYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBMX5KkT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NF5stn014904
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 21:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aiAQHIOrW59pXHLJaujV2OHhsUSTiYkKFOKLz/FR/mI=; b=iBMX5KkTaqhWAkUg
	BRxtHF1eehWCLziLrqUynIjhqx6oYcX+abOt75b4L/d6rVjzpOHm9AeA5SvMKuyB
	PYRbcQvR3Lxuy9O54ATDejhjK7CMOh4hv7/SnP6VU8RF5Tg+2OfHhoKGOqZyyYt+
	yFackzvt5dgAIt2CB8tS6HrXmyNr/jyS+9fbXVl8CMQ+1PmtCcWmujNkibu6v+fH
	/FIAc/2hxyu0r7EhpRirzxzUSLfjLTyCkLvyyOCCKDSFUTQOxSgWR1mXYjyR6SGe
	wT5jMYkmxu01p91Cscci0WUT4hEBJHYnr8sa+vbBVyBIQyI+Z1WoxuFAdHhlAhQA
	8+kl0Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk630b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 21:51:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5515a1f5b8so3764148a12.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 14:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758664279; x=1759269079;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aiAQHIOrW59pXHLJaujV2OHhsUSTiYkKFOKLz/FR/mI=;
        b=oL9U75USKwIGAV1D8EXjRXdIKVyjZDjL0FLMxC4ncQ+jG9FuPgohqDRppBrzsWL0V8
         Y9eIS8GJgFlfkkfKTGtyyZG2zCIoBpwmo5JeBRR8Zyig1Q1w89uNmcTWD0h3A0gq5mNr
         6UQidBYFkElMfjsG/Z2ZZjN5wEzlBfro8N+kYfxYGHfixV/mBnjdTZHt8fPVV0+ZhYuY
         yCQwIhjBGuz0ySIe/jr7vqUunB90R2jEcOweOWvE30Uc0Vs5MlCSaCGZ4AGqWf/xnVK3
         Q/z1Kf9W6Mcy4SR36TfXWdzwsamoneeuSlb3y92on+9TOqTPyyRF+q6qyC/v1h0DKCUN
         i+Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWtoDR1C11XkbK6/DZRJjJTPNlLWO/F53Jtji5NcyAkTgZ7rB7xpSR+ggU+xeTwYeX2T0jkFGp4pxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRrWuHgFjMgk7NVWn61TjQjorC6u2xw1sAuSF6s65J51eccnJK
	FTsmKY93LeJh/LRCYcqg56vUCQuDyn7t7i7z429cU0ikKYMn0McYJmc1ogdZMH9hIBB1rAJW0i+
	au2nBzGM3ePwKbHJ0seCA6mnF4653yiM9tSTGddI7yFYu786UNFECLrI2nm3I1Hs=
X-Gm-Gg: ASbGncuYMs7LOeA9HhvexomSgUZl3SU/XH+oFrVPl+SgOYedhrEBxSys5cpNl15GuOf
	j21c4QKP0NPM3FNssye6AYcd2RpdCUjFbrBIj4FRe5jzqhnZt1va269vE+J1+Zx1gcCM31+J740
	N9k/OkIsbM31jHyv8wkIxR8WXW7Eax0fEjqryXT4eUl5w5V0smzywMqyUAy76HJKmNehRkfFH9M
	5Exr2RA07KCdJZ9IzSVPZlct4ItWmH69tqtStbrzAvOI+olQSj+owwaxv+ekxgdg2Ti4quDQ/X+
	Mpg1ZDYhpcicfzsUGM1NNUdGRLwoYLXTnC851m0pcnF+MfMfaYN+klvLomHly9zJ2RoL9Nn+n1J
	xl1Lx3A==
X-Received: by 2002:a05:6a20:258b:b0:249:d3d:a50b with SMTP id adf61e73a8af0-2cff4209b23mr5529437637.59.1758664279147;
        Tue, 23 Sep 2025 14:51:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq5Th0MTaZw84UMrVLMwE0MdUEOMsSuPcioOUVzMEkQngd4fbtEd7mUZH6sG5VPITkCIAgJw==
X-Received: by 2002:a05:6a20:258b:b0:249:d3d:a50b with SMTP id adf61e73a8af0-2cff4209b23mr5529405637.59.1758664278734;
        Tue, 23 Sep 2025 14:51:18 -0700 (PDT)
Received: from [10.73.52.96] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55396db81fsm9565146a12.19.2025.09.23.14.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 14:51:18 -0700 (PDT)
Message-ID: <1b51550f-90db-2ead-0ec5-93ce786ffdff@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 14:51:16 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/9] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI
 PHY compatible
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, krzk+dt@kernel.org,
        conor+dt@kernel.org, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-3-wesley.cheng@oss.qualcomm.com>
 <7gvp6pshp4eiugk3qodg2ub3azu365loturidbkxqly6nhtgq7@bxnkxeqzarkv>
 <4116b593-d36d-df10-6101-4e3539b8b812@oss.qualcomm.com>
 <aNJL1YEXx6IabTos@hovoldconsulting.com>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <aNJL1YEXx6IabTos@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 50Swf0XKS9lqDTZgrOOwqO3SKjS03JVt
X-Proofpoint-ORIG-GUID: 50Swf0XKS9lqDTZgrOOwqO3SKjS03JVt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX3f1nfUdK9sfZ
 nB8hgkHgFjQiTtY+oFp52BUK5sVgDzMcxHz5VS9qyRYiwPhBQixU+QQUchSW3HUqHw92+RIEfZf
 4JQtS8ctCYMP81kWEzq5z4mvwsQTCEBODN5WfCXyHY/OzCEWBJnzJ5uchiVCpZ6MGdyjH6Fn/f+
 xLbsnHwV+MXAQMkIMwB9FKJFDFPmhwirc+RrN34FIwmM4RY7lHfcYlKXjmCg+VvzNRLPJDxircq
 nIRRaoMURgb33KriWNr7vb1fUx41p0omX+jQvX3PDBz2YnBby/hY5vtSX+utCT2WAgwgCc/In45
 z36xwuCwqSxpqbu+kwJi71ud1brCL8udUY8PYtvect9FbkgL8xveKcCRtF0qs6P5CZx8vRYEJfg
 HefnjMQw
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d31658 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=A-OFauQzm6gaq6ZTC9UA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_06,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089



On 9/23/2025 12:27 AM, Johan Hovold wrote:
> On Mon, Sep 22, 2025 at 06:00:04PM -0700, Wesley Cheng wrote:
>>
>>
>> On 9/20/2025 8:22 AM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 19, 2025 at 08:21:01PM -0700, Wesley Cheng wrote:
>>>> The Glymur USB subsystem contains a multiport controller, which utilizes
>>
>>> two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.
>>>> @@ -16,6 +16,7 @@ description:
>>>>    properties:
>>>>      compatible:
>>>>        enum:
>>>> +      - qcom,glymur-qmp-usb3-uni-phy
> 
> Odd indentation?
> 
>>>>          - qcom,ipq5424-qmp-usb3-phy
>>>>          - qcom,ipq6018-qmp-usb3-phy
>>>>          - qcom,ipq8074-qmp-usb3-phy
>>>> @@ -62,6 +63,8 @@ properties:
>>>>    
>>>>      vdda-pll-supply: true
>>>>    
>>>> +  refgen-supply: true
>>>
>>> You've added it, but it's not referenced as required. Why is it so?
> 
>> The refgen clock isn't always required on each and every platform unlike
>> the .9v and 1.2v rail/supply, which directly power the QMP PHY.  It only
>> really depends on how the refclk/CXO network is built for that
>> particular chipset.  The refgen ensures that we're properly voting for
>> the supply that is powering our CXO buffer.
> 
> I thought we discussed this before and concluded that this is not an
> accurate description of the hardware (even if you now call this supply
> refgen instead of qref):
Hi Johan,

refgen and qrefs are different things.  I will try to clarify as much as 
I can from the discussion you linked below.  (based on my understanding 
of the reference clock network)  The refgen is the main supply that 
controls the reference clock (CXO) into a specific branch.  Within each 
of these branches there are clock repeaters that are supplied by QREFs, 
and is basically the supply to the clkref switch controlled by the TCSR 
registers.

The way some of the tech blocks are connected, the QREFs/refgen may 
share the same regulator as some of the PHY's core supply.  Some may not 
even have QREFs at all.  One example is the QMP PHY that is associated 
to the primary controller on Glymur.  It has a refgen regulator, but no 
QREFs, hence we only need to vote the refgen accordingly.

I don't know if that helps you understand it a bit more to convince you 
of the new regulator addition.  If anything we may need to add an 
explicit QREF supply also :).

Thanks
Wesley Cheng
> 
> 	https://lore.kernel.org/lkml/aEBfV2M-ZqDF7aRz@hovoldconsulting.com/
> 
> Given your description above this still looks wrong (at least after a
> quick look).
> 
> Johan

