Return-Path: <linux-usb+bounces-26073-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A97B0D271
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jul 2025 09:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABBB316E724
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jul 2025 07:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A07E2989B4;
	Tue, 22 Jul 2025 07:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBqUFhod"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042531C84DE
	for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 07:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753168707; cv=none; b=MgPx5LlLhwdWjSfUWK9AfRmmrdNxxI0ZjUSFegK78SSUSQx9AahhrwwA6zMmUmZDcd5WdOJZChFeRq3ODdAoDPFtk48f50WmbHvotidaj0EuvVc6OUE4qgsKDeQqMhYPfQymPdHYQhfrYMDVf6UJKDgH50g0Rm8sRaSrVgzoaa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753168707; c=relaxed/simple;
	bh=5T8JIkKfiUjVkjvG6ft28382jyrh8mx118uNTKp4Tiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smiVW1fDAUpRFbZQoUdPAkum5PVvWwZ5uyNmjYqUR1I+wVJbXBTwgms/x0kLVhM2cHVNx8jQpPz3ybcYFJmEBRenhPEK/SmVuqbbnyGbdi8203VDaV/82LEK4JWA76QR+bzTVfMCvEHkDLFWnQ3XW3e7X1nMdkPB0oBgAaCuZ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBqUFhod; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M3X7Rq000932
	for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 07:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C3bjn0K1BpuI5g7LymF9fp6Df55M6Pk8nkAxDqY4xk=; b=SBqUFhodBglIJfVw
	AtEmf5nhoR5q/PRqQuAUMrSTfyQy3KJ1auCpKFK52RT75nm9NGUrFfwY+btfpdOt
	+Bmc6vFboCJKt2jD/mfZsJlkLDqjU3lxSJLKOJXelszau3uFlZl6n8Z7e1wJrlPW
	r6kacsQU1COxWYAQX2r5oZpoxbPpcskA2MzcFh33q+XEGVVmntxXHB6IWwWu9/3L
	6JstIE1RgFvqTK0Hld4GkCdE6ZCmvob1IJhYXi3uaODKtTWXL3LvnaxhI3oC4Ni2
	jMJN6Ouhk2XB6PJ5q7uw6tLqgCaNY3snFK+YjzmrXWXzRAo/2yScZYv49NflaCGR
	KOfD5A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dgc0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 07:18:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3642ab4429so3694031a12.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 00:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753168703; x=1753773503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0C3bjn0K1BpuI5g7LymF9fp6Df55M6Pk8nkAxDqY4xk=;
        b=INsl8DycmlaCvxdUcv30wN5VO4DoF5MXbceRYLpGj7GFgYfEZf4mngqI9wTTlMdu2c
         WNycWt10reTcSDO7h4t0ghW9R/7q9g70Rgj7NkukitlLMi7QNdpbkCuWpfACrV4sEBqr
         4CWc5/8+Yc7RzIGetREBybXuV7ZRGr0ZU/fwfwjtnwDsr10/3ovj0/w+qQEJmKd+JBRj
         7duK6GSBrNe4YyXRPt7Cdk5uErbnmnj5FjwyUZXATgid9RrRJZPI51gdLQM6FDiKH+Rq
         cigpX6xeW6uiZ7NEG2D8rFhONmH5Fj6VWzVRqvfFBLpdpEUO6TRmLcmYYXeQAQh2MMpS
         xBbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQMavZovUBz5yXIPjEUBYuJuY38aDEZ3uMlXUv2WIB4CC0AEoAqGbYwovDxnJuOmz9o1ZJ2hFgrFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMM6on25PvEUlhU/h0jHGe9ycTYEaGxF5TjnRTAYBPsXtqRYyO
	TrNEZhkJ2J+jEYy98Slian2FPZCE+L06q2Oj/HS97pf+cg3/DtU7grM0gVR+lpZeX0ddT/QPU+3
	7VI7LBW6kpN1xTh3JtlnDFGYOmomTVrdx2aS0P1373zMwwrCMnvNXC+R589MDnbg=
X-Gm-Gg: ASbGncv5ekYzhD2NU995oyLkMXrNUyrIiTbPHgtyVfjxCnpHe19jU08Vkbyptrfvvan
	AsqmDPNUNExi8aswWDK2YdooyQVI/ZdFwmvw6/UKgFAcGNrxYFILoI9rNviFpOGlRr/dlcL8GA0
	B8kGxrtvuNFKipA6YQ5sRJ9ZWP9IPXk1dDfoI94gs6OdW3C4GtTZL1N3raoOPA/UJZnSXVKQm3w
	hO10UuWMa2GUfxQ0Gr/ddFYOOoCNLIc2pGr97snBnBmescRBJiW6JtZgfXEJpqLGlPFb7ohhGbH
	GAc8leMxxf9+gmnjeHdGRJG7uSoENscor6AiSuHcKr5eN4BKJj0mYaet8ruiUBJeoatz4kA=
X-Received: by 2002:a17:90b:1c07:b0:311:e8cc:4264 with SMTP id 98e67ed59e1d1-31c9f3decd2mr33663775a91.12.1753168703014;
        Tue, 22 Jul 2025 00:18:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfWROZAN8xnaU3AGOGzeHb21uHu6cc8XWYoJJlMXthbXoWRNTVmmRgM4/DanAva3Ppxlpi+A==
X-Received: by 2002:a17:90b:1c07:b0:311:e8cc:4264 with SMTP id 98e67ed59e1d1-31c9f3decd2mr33663744a91.12.1753168702519;
        Tue, 22 Jul 2025 00:18:22 -0700 (PDT)
Received: from [10.92.181.248] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef976sm69124245ad.202.2025.07.22.00.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 00:18:22 -0700 (PDT)
Message-ID: <a6e26f6d-67ba-47b2-a4d6-6d4c6be1e914@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 12:48:18 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usb: dwc3: qcom: Remove extcon functionality from glue
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250718053856.2859946-1-krishna.kurapati@oss.qualcomm.com>
 <2025072021-rounding-oversized-5b4b@gregkh>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <2025072021-rounding-oversized-5b4b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687f3b40 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=C-RkopLJPYdHzFFRb_oA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Y4Tm6HMIgLg96tg1NnKO5OjxX50yPeik
X-Proofpoint-ORIG-GUID: Y4Tm6HMIgLg96tg1NnKO5OjxX50yPeik
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfXyiGFe2LHeIxe
 JfJtZ7QmUwJRxyTkL2SlucRQWCwGR/UYK1rzK9ZbC9NzTYQ0ZlmB5ZPEtS+bADmBrmIKOL2S05D
 aERoGx3WTG71ogDsUenSBt2UC62W0IUME+ffc9XX+HvbcZ/e0lzZpsNL+4cAVIIEPb6kFJnUDaU
 rEPlKJ6NmQXDauUbXmsBdubx8dd4mu1ndpRoq88wSDtidPnpWQXcZ2f+2JCCnROOCqzActt9YCA
 rWf7l0Liqe6qWY5eJRxD+/icuVSpFgdGevJDzYJAEkezklQ37QglyawfuK/6AI332u6Xs1R2jYs
 7asMnVAwDxkHN3uJqqbQGhin8jZGahnwNiIJONjYbzPUdhQaSJTN2BI9NEyeJp59fgbmYl6CtNn
 PRAxnFe6PqWZ1cUzyavhqYmlrQq0PA1QlUTobz+gjDIXouDm5HnLJmtwKZpfeAkDMrzY+xcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220059



On 7/20/2025 5:10 PM, Greg Kroah-Hartman wrote:
> On Fri, Jul 18, 2025 at 11:08:56AM +0530, Krishna Kurapati wrote:
>> Deprecate usage of extcon functionality from the glue driver.
> 
> It's not "deprecate", it is "delete".  "deprecate" means that you don't
> want future users of this, you are flat out deleting it entirely.
> 

ACK, will rephrase it to "removing code".

>> Now
>> that the glue driver is a flattened implementation, all existing
>> DTs would eventually move to new bindings.
> 
> When is this happening?
> 
>> While doing so let them
>> make use of role-switch/ typec frameworks to provide role data
>> rather than using extcon. None of the existing in-kernel extcon users
>> have moved to using new bindings yet, so this change doesn't affect
>> any existing users.
> 
> I don't understand, who does this affect?
> 
>> On upstream, summary of targets/platforms using extcon is as follows:
> 
> What is "upstream" here?  In-tree?  We only have one development place :)
> 
>> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
>> effect on them.
>>
>> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
>> driver which relies on id/vbus gpios to inform role changes. This can be
>> transitioned to role switch based driver (usb-conn-gpio) while flattening
>> those platforms to move away from extcon and rely on role switching.
> 
> "most" do, but not all.
> 
>> 3. The one target that uses dwc3 controller and extcon and is not based
>> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
>> This platform uses TI's Type-C Port controller chip to provide extcon. If
>> usb on this platform is being flattened, then effort should be put in to
>> define a usb-c-connector device in DT and make use of role switch in
>> TUSB320L driver.
> 
> I really still do not understand what is happening here.
> 
> Does this break existing in-tree users?  If yes, we can't do that.  If
> no, they this is just unused code?  That's all that we should be
> concerned about here.
> 

Thanks for the comments Greg. Basically, all extcon users today use 
legacy glue bindings (dwc3-qcom-legacy.c). In the new bindings 
(dwc3-qcom.c), we wanted to remove extcon functionality and enforce 
usage of usb-role-switch framework instead. So no existing users of 
extcon would be affected now. But when the above mentioned platforms 
(the ones that use extcon-usb-gpio driver and 
msm8996-xiaomi-common.dtsi) are being flattened (by anyone), we want to 
enforce usage of role-switch (moving to use usb-conn-gpio driver). Would 
it be clear if I incorporated the following in commit text:

1. Extcon users today use legacy bindings, so this change wont affect 
any existing in-kernel users since no flattened dT today uses extcon.
2. Extcon code is being removed and usage of role-switch is being 
encouraged instead.
3. Effort to be be put in while flattening platforms using extcon based 
on gpio to convert them to use ubs-conn-gpio based on role switch.

Let me know your thoughts on this. And thanks for taking the time to 
review the patch.

Regards,
Krishna,

