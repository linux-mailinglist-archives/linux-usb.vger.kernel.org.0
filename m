Return-Path: <linux-usb+bounces-32424-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA77D2DA36
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 09:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06E7130F6EEF
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 07:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C37F2DA75A;
	Fri, 16 Jan 2026 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vo7jC+PK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFzCOygE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA3921FF47
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 07:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768550309; cv=none; b=CQC7GbSNhw2E4eUEen3QiDKX04U24FhbHGPc/BNRjkEufuPCn6PK2it7Pq1o5/KR5mbPnMDsGYO4nq/S/kdwYMkU7jchwqvVd6F1BprN64i9ppKMBhn+6e5GTrtTr/tQueDnkEeV41EUuTWEGH5IEypfkysT574pGIywJpHnac0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768550309; c=relaxed/simple;
	bh=XVs9uOGoh3kHklzB2DXHZeFDPDnzC+MAb6PudaaHgio=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KabWynT4luwGjfkbwY1qYC4eP7EW4bMRQzI2xrGYqMdyVJiHdWN/i7cFvnrJkyF4UpQmSjjuHen4iWPBIERFbF5BELrcCXuQuQJLlhkHa+AsY0gVvnO0MurYQTV0UekJstxXDbyupXM5F3hjGwQIFkn6eEW8/MKuN8Q8daTXFT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vo7jC+PK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFzCOygE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMgETk4015681
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 07:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyXN+iT+tYR+hDVnUAWsufHGX48hHBiyiWhhpL8bftw=; b=Vo7jC+PK3iqlJnbu
	xY3zDoQ685OS2Bz76kQQhKoXJmR9HBQvhHqhkrwdCkY3WuXLCtf+RrdYB6kN3CFN
	g6keMW+olYboGdSMuNCEAvLalPg44Zil2LUkxkP2s7EzMFOZiUImAurxMbEP1m4l
	ovH7LtjbkVoyikmbHPvSEdZ+eYA2+iE52vS8yTNyV/qP85O+b67vJZ7He/x0EQXR
	xgBiJ90of32Dx+gYzjZdWDSvlahoyLpZt4aUk+Xxrj+XP8pHUEFM8jPC2+nWuNnQ
	C/xXSKkZKt0q6FmC4txymC0ZtgNFKpW/ZgkkIrN/+3paCpcYDMm1mHmEe1Yn243L
	vGtiQA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98y99kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 07:58:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c53919fbfcso447298285a.2
        for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 23:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768550306; x=1769155106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wyXN+iT+tYR+hDVnUAWsufHGX48hHBiyiWhhpL8bftw=;
        b=bFzCOygETaXoATAi6nclk9h5vkGqFhdxwXW9Bkofcnd322s/BzGj1XwDRRsMKzFgMJ
         JPg4Xy/ejtPT+1ibSIoAs8BkQzJ2qQFGYVtE5ppUakVPmrxIThpD6shkYMqdbloZ7Bru
         mrxpWt09Z/uUMNyJZaWkWtNcWYaKe5PIl6VY94ZWHFj3JCXO3Ger6rISvS+vWZIGCRs5
         5b+hRNWdWM66QBMPeaWvG15TydAQ1BtyxbEVJHdsCzjHUUIj+BIhPzL/DFLrNiESKpfn
         /Rs/XWSzybdaokv7ePq/+++F6hHWaS+An861im7PULNueVXTKA+hhDUaijBZQ8ODwfq/
         n9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768550306; x=1769155106;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyXN+iT+tYR+hDVnUAWsufHGX48hHBiyiWhhpL8bftw=;
        b=qay0lxig6GUlwXjTKWiFLm9hP3jvApZ0wRyD4+vSwbm3KRmWiOuW9XzA6IHDP01u+D
         vYXe4N28xDObxFBkroDGTQbMtHWOnAHxpZX4W6NT6KzpFir3A/+6UvjUp0yhrcsW0IuH
         jkiKBXaeos7IEhuD2taOgbukTEZW2vqZyBCvbX77Q64mJZD4aCPpU7L3bFOZ03AQ4Eaa
         tjp7Pd/ZeXJ/pL4HkkcrI41Z9kXVkWtIOzOLOJDNLqeAAOFG9xBNy2iwoRK6SeKbuI9o
         yAY/V26P4u3X+HdYkE1E4jd0AXYgFj+b7FmnKSIoVeuC4bRYeyr82pvmtWvJg41l78O5
         g/sg==
X-Forwarded-Encrypted: i=1; AJvYcCURUTWEIAcOMPbl6gmr+ARfClMASY5D3SohLIy17tLfK5DVMywZhqB/ZQcCifKzgg+GmybeRgsRf/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YweAPlP1FCvt1aaMEM3Lb22I7lVrsl4kWtwmsCGwRNMp9CapTXB
	FdkSaDF1oD4FbLLj8uGrsFPCd8GfwvynSb08gjAVp9v+4NqBbCIzYjTw2jfE1V6MaTZpGuS6yTz
	G3KqHPi33qBjY2BFVLHFb/XBzzUpysfxKZ3kgfcJLPmvLnNhb4icD1T6noE1KVqw975SC/v0=
X-Gm-Gg: AY/fxX7l8pTPnpflZX50RPpNCeKGZvpnyWDs6xmM5jYctuGFBlwSEapIpmof+54A8mc
	sbeItlt0GCcD7tDwMvEQUaszR6AsjfheN9c6bBlRkJlBlhYmEQM+wZN7PfbqtXxoxj6IX2RCB3O
	sGKfbEJ5sKwi4pYAwj0xSQfPFSdpAgUO1O0jw/GcCKLCKSIN3g8eT8j4Xi14DapGghrI4kfS/9q
	ysXNKfw64v2BUCGVX8jy5gvbi5edOK4fhGwbnLyyrl7MU6BQIa4CkqkYjArKE5y3NEyj17if/e3
	/hI7jzFspnIVIDhucgJjf5FiGPdeTtbemDm5Nbrjjhr5o9NbCTkqzMF1dlXfSNWNLSMooed6EzB
	IkCOu0r9M3eiGzXPnX3D61qpN6cHSNDuEq5xNpw==
X-Received: by 2002:a05:620a:31a0:b0:8b2:e6b1:a9a6 with SMTP id af79cd13be357-8c6a66c833dmr286096385a.17.1768550305950;
        Thu, 15 Jan 2026 23:58:25 -0800 (PST)
X-Received: by 2002:a05:620a:31a0:b0:8b2:e6b1:a9a6 with SMTP id af79cd13be357-8c6a66c833dmr286095685a.17.1768550305516;
        Thu, 15 Jan 2026 23:58:25 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cdb01csm1679452a12.8.2026.01.15.23.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 23:58:24 -0800 (PST)
Message-ID: <49d6f8af-6a01-4611-854b-d1e0ce567929@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 08:58:22 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: parade,ps5511: Disallow unevaluated
 properties
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260112090149.69100-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260112202040.GA943734-robh@kernel.org>
 <0d04b5c6-4e4a-41c0-ba14-09c95a6df235@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <0d04b5c6-4e4a-41c0-ba14-09c95a6df235@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FscIPmrq c=1 sm=1 tr=0 ts=6969efa2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=cGCFXuo4JwDHnhW9cKYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: DPZMA5GWke4GyYHiWJtvx1b4BWVtSE1V
X-Proofpoint-GUID: DPZMA5GWke4GyYHiWJtvx1b4BWVtSE1V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1OSBTYWx0ZWRfX98R/+1TglnbP
 aYkFaGvHWTgoRuyrK7ZDqI19flPOGmjGXWSj94S8H2zAfcrHlpugAvTre9eLg9Q5bxJbIrtzJoy
 4atdU668eEYj7VQZk8ToRbVgeBpY/TzsRjt0VNG9caP6fVCdz3Au4cCZgiPJea9oQDKtuzteeJH
 Bpz8biBuXmjMcmwyRCg0D91ACz7ShILa2mtKN2y/hwawySzqUn1MMGc9pLrxbv9QHz9sV3iw3lu
 C2jIskwWQy72hdWC+5bRXFD2rjhxMnopZUpwZCNPDglccWHOQf9do6o+2OP5ZesB81rgfLi2Vxe
 1Fz/JJZHqLCd79lT6T5yqK/fs4meCexNvvcx+oLOh8ueu9ljW2HUeftl8WZUKUExCzKkg+eUTrs
 pnTqX0PfGeDruy1s1DzLH2D6zaSjUM0XeigQWN9URUi60p1itW+P2g8aw7BkgSaYuzWNWOv6C52
 3/PBAdQpqJV9W27WH7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160059

On 16/01/2026 08:55, Krzysztof Kozlowski wrote:
>>
>> Removing this is wrong. This is defining the number of downstream USB 
>> ports for this hub.
>>
>> What's wrong here is 'type: object' is missing, so any property that's 
>> not a object passes (no, 'properties' doesn't imply it's an object).
>>
>> We should fix dtschema to allow additionalProperties when not a 
>> boolean property to coexist with unevaluatedProperties. I'll look into 
>> it.
> 
> I see your commit. I will send v2 of this.

Ah no, that commit from 13th Jan was for interrupts. So later then :)

Best regards,
Krzysztof

