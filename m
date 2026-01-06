Return-Path: <linux-usb+bounces-31946-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A2DCF6BC7
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 06:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D340A301D61B
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 05:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBD82F6193;
	Tue,  6 Jan 2026 05:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTYb+aAg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RfVLCRuF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C2F2F361F
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 05:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767676176; cv=none; b=W5+UsB5fPrJSnU32oGXaV1wLxTlUODpezCkgsMUFfeb1NS6J9trSAecp9zuf0aov9ATpQsQNmwLso9Gzp0BIK3oeMkwCA/er3UP+NKyVn4lZmJIl8uQLfHWMHPmQtb3bdWh1yRyXDk27i22rsFVvqP6NPxVfXdHvBjyP/LiHYQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767676176; c=relaxed/simple;
	bh=yLylLMnfbComcKS5YxA9ESsOk9drHuwiQKJ8nVQQ6vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2nZj3W/q7hkau9t0iALecOKNTLvXq+lcIYnkgKBMs9i+gY1xu2VpQRY14C6pVwOrwYuieHPSHcXvaCYAFssHB9cRQ4sdQsj5JXYBa/3v+/WjK6Alno+rA8A+s22fB9rkmAje6TTWAyr7Iy4h0UT/5PGQtdrcE5qLMRsPPf2zmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTYb+aAg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RfVLCRuF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QWNa3272123
	for <linux-usb@vger.kernel.org>; Tue, 6 Jan 2026 05:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2SOD3/kMNlfHRzbXU46DK5ZMa8EeIhEik++3HN8TI8M=; b=oTYb+aAgfp2A9v2J
	orEbkKgpTBwvRdFlaqhGnsrOvu11w6tIS0w2/5KJ0819eaGHV4lGAhjw4MBiYjSS
	r+UPeIyW4T5LZjLcvRasq/kcGBUQOpeolPhpqUmd2sNJ0DrA37bU4Q3nFmnTZpPi
	/oH4j+aiNqoWJzs62DiaqObqZ+tnbNvu9uK1mnVKcEv7MowI/ET32QqdgJt1mvT6
	QrUoPaJbpKkL2YKzC7oz6y3CbzVwkT/1k54es74bODoqLgz0v/q/J/hptgauJWNm
	gi6gCLwQfLebAwmMhOiwvI8VWpW0ycMt7NigMWgWFh2eTfjYd6b8uBiA6wPaoW9P
	e1qpng==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv0218v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 05:09:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so508473a12.3
        for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 21:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767676174; x=1768280974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2SOD3/kMNlfHRzbXU46DK5ZMa8EeIhEik++3HN8TI8M=;
        b=RfVLCRuFN1maUxJOeub3a1dy2uR+BVrB4jZk/k3CXzwgeH6lqdrR2GHHQYAm7bdRu2
         QCs00KmT6d3ctIOwgxUIS5BTQg1z2GtuPTTQJBDhBI+OLYKvCBSDL2WHe/QdhlxdF0Qz
         VkGUSGtkgnVAoqixFNriKF+Z8+iKvJJKQ+NB2f9MYiqoJVRInoxwr1VMoCL3zF/vX/0Y
         TMVWNTBDMSEbBuUg3cFQwdenETSNmF9P1PZQaL0YT37CzJBre8eAz+s3yjyuDgvOwPpG
         kvBg1yvVV5TlNf1to8ASLbiPTIfVjdBOVPozB/JEoCwlf1S21d/aDc5xi6uVV0mDUuEQ
         +EBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767676174; x=1768280974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SOD3/kMNlfHRzbXU46DK5ZMa8EeIhEik++3HN8TI8M=;
        b=imVGzJUIh0S4dzRxPsueg5sNp7GRVjcCz5s+vB9thw4sU8RSsTdbFRwzxi3j6DRKYh
         0lO0in373G5aVN+V4P6OZ1YGiKCQenzB/aPkwSJk9YKhJtDZbQNWoPxRavvqOhNyEwzu
         640Z85n9ZtrnW4qGH1m/dPeOPNM90h55ulNm2AmYvfv1ybdyeGH0YofU6kDXmlW1wbak
         dcA7funGgmqTmRBbkBcUOQh6dFvcHp0R5cKEf0H/lQ9uEa1wNOcKWBd8M4SgpFXdP+XP
         /QrAE9K/T0yqtoe3Gg3ctnvSVz6DaqXDCqUoQhzq5QeKP16gjmjwPIxMpebcBwnhlha3
         wFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa5r4wldSXoaQ7vZ2tEbkb35123Gu5doOzOzl5ov7XE6NOjCo7tNA441lHcAwEzArLj8hbECJdAwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG78/z4dYvh1WKWMg4aDS/zGldn/a8qyZ9nG9C8zu7Nx4V2f/L
	0S55LuSj8dgxAzS/ljPLi364VJQe7da/fBUnXFlnvKBGypvQNfrnt4fvo7MJ+gaGmQQsxqqdwfX
	99XWbpsO9xpj7JNIGLsYj1Ji3L3nDJqQ0Tl6y1FHZH/Rx3eOThieVHAc4dWBr+SRRcU9pCso=
X-Gm-Gg: AY/fxX4HusOFi2heFAxgd6rJYxl9YTj7pIk132JSa6FuuEFzySSXizLFu9WzdEhvNAx
	2oGYuzEaoI0kYYbVfw2XY+XgshR9EiNohgi3UPmEYyy2ARfEOnM5+5NamBCGo40PYvv9buGodeU
	Yz57KFQMqnMoNah9mZuLMDPutqrX4f1JCmErktn9PhjG2eAtsjrz6S31ykHJN5dfTSk+yS8WeUX
	mFkS60Bw+heb8OuJq+LNbt+zgLllXK4YItVcyLC0uqWsqzHenCnTYVxvN8OUK3g94fKIt0kWm4b
	2KRy28dqkcTsrcR/Mi0U6uOI562dq6sv+ru8LPAJpfUWtpCpeOFSl2vIz5SpnKlx2wv/2mUaPiD
	ug6ivGvpiERGD6OhitosDr5D0g5jaqBl0vDDb8huiH+6lZA==
X-Received: by 2002:a05:7022:61a6:b0:11b:baa5:f4d1 with SMTP id a92af1059eb24-121f188c67fmr1608362c88.6.1767676173659;
        Mon, 05 Jan 2026 21:09:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFThhMjB++4/K7Cfub+aD0s+vY0i2Zl9hrVvNzgeOKOfo4k5ujmMqUBKzWI1psutADRpneDZw==
X-Received: by 2002:a05:7022:61a6:b0:11b:baa5:f4d1 with SMTP id a92af1059eb24-121f188c67fmr1608336c88.6.1767676173072;
        Mon, 05 Jan 2026 21:09:33 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c239sm2032747c88.9.2026.01.05.21.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 21:09:32 -0800 (PST)
Message-ID: <bdf65a65-baee-4afa-a4ed-4dc51298c304@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:39:23 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
 <20251021-knp-usb-v2-2-a2809fffcfab@oss.qualcomm.com>
 <41f71be9-595f-4a81-b089-27bdcc778c8a@kernel.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <41f71be9-595f-4a81-b089-27bdcc778c8a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695c990e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=ocyYg2yDLqSr0WdFaBIA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9uGDj-LGfmpvUAbk9zvbxtdlnTn0Uoy0
X-Proofpoint-ORIG-GUID: 9uGDj-LGfmpvUAbk9zvbxtdlnTn0Uoy0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA0MSBTYWx0ZWRfX4sk7eZ+jmext
 UJWyku+A+2S3045fkxvDrtqrkyPEs9O5vxh7EQ9G4T8wAQS3WZCRR/Cn+D8ru/kKBo5ZTaoE0mX
 XZaeKoS9Q8sDRkvoWV6SbDEIL/4kEAWhWT+Jo4Ies2Qpp2OI33efLjLtd5O3UaZ9mW/rbskXtG0
 uxpKzVe6NX/fO0z/qkYXBaUEP1ecKdxktT8Rc0PYt1DPSqRi/bDZoZ9nHumPsZHMpG1YYQbeMiq
 /YXduBudQIqmUDKy3NZbXHTlxh3FzYQW3s6fX1V5ZdujiDLPjfylLdF6twsyh4/kiDnL5SOd5m1
 lylRnGoGmRCZ1qkghYgRNJx71wSBndtaZNca2CYxcb53AoDLfk82HbuGbXYlHC5tA2fKH7i5rqI
 O+z2gzPE/uBT2EfSW6FmxonUKKT7vVRpWGJFOTWnY5vnOFzcYA0lIzouq/XTuubWTyOkuGvdUzl
 gsSYhshxalqynuPUbfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060041



On 10/23/2025 9:09 PM, Krzysztof Kozlowski wrote:
> On 22/10/2025 08:50, Jingyi Wang wrote:
>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>
>> Document M31 eUSB2 PHY for Kaanapali which handles the USB2 path. Use
>> fallback to indicate the compatibility of the M31 eUSB2 PHY on the
>> Kaanapali with that on the SM8750.
>>
>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Hi Krzysztof,

  Thanks for the RB.

  I was about to rebase this series (phy binding patches).

  And wanted to send the following after fixing conflicts (as glymur got 
merged):

diff --git 
a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml 
b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index 409803874c97..cd6b84213a7c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
        - items:
            - enum:
                - qcom,glymur-m31-eusb2-phy
+              - qcom,kaanapali-m31-eusb2-phy
            - const: qcom,sm8750-m31-eusb2-phy
        - const: qcom,sm8750-m31-eusb2-phy


Can I still retain your RB tag ?

Regards,
Krishna,

