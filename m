Return-Path: <linux-usb+bounces-30163-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C467C3C0D0
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 16:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FAA33BBF69
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 15:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC5027FD74;
	Thu,  6 Nov 2025 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFpsDnqX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WzAKjhsg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE4C27F4E7
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 15:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762442635; cv=none; b=gr3tP4a+Brakhb8aRxj0Fb2PO24CC+2qvkgCu4Xu167I69JvjaCRmTOwUyQmITqiJEqiYbBHrh/nxnDhaarDUfT7KCrk7dpCiBBUYkS4IMP1soXT9wz5CqybsFmI4YQ1zPNk8xo6Xa3Zua3YqonTtD9+kWEO5vLHvd0LFA695tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762442635; c=relaxed/simple;
	bh=HCaYR4YVOukbLj7jhdYFa5FxgeZeqJDhW58mi5gV+F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHHmwLcRL4p93METSWWnU9drLdHlC8K4W+UwnSD9wWrrlY36MIRgQWjeIVfY2+xtijvqRaPXAUd5rA7R0QkA3SC8p/b+g+ZtoMjVmO3RsLaHhxSiDbi8OcJBGcL3dUmkRcDoFPCE4j69EC47c4lx2stlMxVWdS9aKj9z20/MUhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFpsDnqX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WzAKjhsg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A66rEoJ3362006
	for <linux-usb@vger.kernel.org>; Thu, 6 Nov 2025 15:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AM2sfMtEfOa7KhDU3VgLqOS5fRlov02lYAgiXrnPdFE=; b=LFpsDnqXbN5J8HSQ
	p5kjOSYW7NDB+pDWWE86gHRIbIOit/osKG0RvSt1cF06nYypOIayGHXkO6hKf0XH
	zzbZ2iKK5vvj0g1NC87dQtIXYKN7xyd8DkE8wIHb97KvSLbBYOnHjCrwr1s6oc6T
	BudvlhVhTXK519NdZoVa3FRJ5JH8/nsn7NRRAjADGVQNX2v42Sv50atDxK0u7WuG
	e7lyl4iIi6T5213YsmUOfuqSVuAWNJU1kzKlK/hYV5RxKIChxNdLl5u4Bta80RDo
	NR6H+h5gfeRcNaKpmVYxKxY5uOBgHeajzXCefNxW24cYeQkiHvrIRVLqJbnH35QJ
	MVDcYw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8pt59ea5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 15:23:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b0a870d3ebso100343b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 07:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762442632; x=1763047432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AM2sfMtEfOa7KhDU3VgLqOS5fRlov02lYAgiXrnPdFE=;
        b=WzAKjhsgwV4QJ+wjd1POxOX40IHgmBnAy5HIZutRzZKRlICHjSytmp4u7oveVkHzgn
         V75oMiRGYmhby6l+k8sUPFcacTgWIbZWBQYYhHWyJ3MuvoDcuJ1EIuq2oWylvMnnTaIj
         86DY9mYaT7FMU752ZZaLH0qZdEf+/4QwUG1GL0wyuhQ3blcE5nnS1yj124R1wRQoRGv0
         KFVMvmf+ngnn5IHXrtPrO2isS8kLUCCjaSztavY31TSe18H5yChjtYujV2rIpK7/DDXA
         Bqe2XXI/zVGwcz0CZxZNin2IoSQDoNOoDcyIk46K13iMGUubfjhtuQm3HYL6xRxLSjCG
         MVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762442632; x=1763047432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AM2sfMtEfOa7KhDU3VgLqOS5fRlov02lYAgiXrnPdFE=;
        b=XMg4zobmxfkJx0rok9jqrZ/0Au+xg+sxtDoVvKOjnpBULWOhRmarIYE+zqFxJt2lIl
         oRWGpcTi4sDLuachXx9UL+hOMBY8S+5jlGzoelOWGbG6CbVit5NXAdIHN0K0QqQVJNMd
         b/JRyhqjjvvOeV63fWJwSMGj/T09hxrE8N/jmTiYifjWQSJSI905FpfL9gxYXwaLr7+R
         TtmVn6xBov22HnuF4kPG2kXgu5ORNE2ZA8oxayYwp/Qq/pt0GTtyjtjceWmGevVbZ2Zi
         IQsitsaCMvbDm0DAEYPBRVWWpepRZIYYv30B53XKcVMXvvgdbyZamAvTlUK6X6gcQ/94
         /OYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGMO/392DvRS3fj3lvHU3RB/si1bNV+I9tv6tNkFeqlrbRDkt5JQdt4ceV5Q/l2cFGZfD9Am9gSmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpWAu1ptfYxeQFZPZbZ9rE2Pv8fP3op1wo5I/KZ0t5nOtTuz7s
	omgMZDrWZtkD24ogOvh4GfwT95P4gfMqQZIUr8AmBuoHNi9UV6sR7GXtD4QHb9JBWEiGlWKkgQp
	ZXHiH27OFWJ2bO44OcNhXYKYuON6TPvVABKpcRsbPF+uFLnE5OCi8qU/egW6kPPs=
X-Gm-Gg: ASbGnctbSTMkJgU7SetlHbC+z793ciVJbwfWIPlfpO1AV7w66xeerBK+VXek8qS9w1f
	VlOq5hlwO8CUN6JDJnrbqcsSErk8f9/oQp2uc3X/n+m8+QV0cPQWZG0E4RFTBcPwTw0WH5yulYt
	0efNSzJzqzc1LlMrXiRB7VcmxhOm7cmNKraKPE75uZ1HRV35IDCVlgyyg4Q0gt8yBRNYFBrIxjp
	oMnvdnlo/FvlfKAxp5wV4f2UJqWlIshVpRwB39oD79BHJDRXANFcOFOsvpGmcmt/hrLi0NQlu13
	L/C+WyLAvAv7l16R1IZqhbKPP2b+8GxSHaCHPYua03B+iaoExGO+kdFGPT/mGQnvYHbwTU2eznd
	7ToA3PWhgjx+jPGGFanJWUyR47Ni137eMow==
X-Received: by 2002:a05:6a20:7294:b0:344:97a7:8c5c with SMTP id adf61e73a8af0-34f868ec5acmr9474790637.48.1762442631927;
        Thu, 06 Nov 2025 07:23:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF97e0GXoOncAGOrjI2ScllFLDrtpqS3SjsIAfKcVzSGuS3VIsb+Ftj9YpLE5DE7gJppyEwPQ==
X-Received: by 2002:a05:6a20:7294:b0:344:97a7:8c5c with SMTP id adf61e73a8af0-34f868ec5acmr9474750637.48.1762442631390;
        Thu, 06 Nov 2025 07:23:51 -0800 (PST)
Received: from [192.168.1.3] ([182.65.157.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a69b698asm6878934a91.21.2025.11.06.07.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 07:23:51 -0800 (PST)
Message-ID: <65a910ff-61ae-41a8-b5aa-9a7a119fb13d@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 20:53:44 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] usb: typec: hd3ss3220: Enable VBUS based on ID pin
 state
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251102164819.2798754-1-krishna.kurapati@oss.qualcomm.com>
 <20251102164819.2798754-3-krishna.kurapati@oss.qualcomm.com>
 <aQxyfjYosVd_kPKC@kuha.fi.intel.com> <aQx1WVif-vgN0_T-@kuha.fi.intel.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <aQx1WVif-vgN0_T-@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AbgDcYD9zjCYzE-WjoNW520DOos7EA5e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEyMiBTYWx0ZWRfX2Zr3dnKr6kiI
 L0SHqnksSHKBrtOciAzkcM3JqQd2XHdpoPw1YpLda7uFB12rESamw6tf0lorpKGpMhXQrS+JxO2
 h4Ih9hHsaAN6ljX5k/KrBd3tUP1F4TB5QBS1dWJ4wzrdy3Cbi1oJxVCIf/O61KUqEDBH1pBXfhp
 D0xIu4ptWGzb164TpBz19Llj4RhNj0LgdnWCrBLkoXuUJKmkTnBfIPJQRtaLgH/Wn+PgWQR1KyR
 EkpAmd9w1BIXQXrFgei5r24HuB0DKWdz74MTpGQvX1Tq5HyMMa6yYdSEkAXf5mzW+T8Upmol/Mi
 uW+Vwo6XB4VHf+IdZbmzr0zNeT5qEnNNkqr4wofUP2qy9nK0z19w0C6czk6/KlLNJmgouSdWxxz
 zjytmpAIo2ZHYzIHHl7ww4cTehD+Xw==
X-Authority-Analysis: v=2.4 cv=XNI9iAhE c=1 sm=1 tr=0 ts=690cbd88 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fO48qRZoIuIFQjWVjTpNpw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RlX0HteZJ6yL10uBmSMA:9 a=QEXdDO2ut3YA:10
 a=QYH75iMubAgA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: AbgDcYD9zjCYzE-WjoNW520DOos7EA5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060122



On 11/6/2025 3:46 PM, Heikki Krogerus wrote:
>>          struct regulator *vbus;
>>
>>          vbus = devm_of_regulator_get_optional(...
>>          if (IS_ERR(vbus) && vbus != ERR_PTR(-ENODEV))
>>                  return PTR_ERR(vbus);
>>
>>          hd3ss3220->vbus = vbus;
> 
> Sorry, that has to be:
> 
>          hd3ss3220->vbus = vbus == ERR_PTR(-ENODEV) ? NULL : vbus;
> 
> 

Thanks for the review Heikki.
Will update the suggestions in next revision.

Regards,
Krishna,

