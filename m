Return-Path: <linux-usb+bounces-26744-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B79F3B22481
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 12:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEB9916EE67
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 10:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577D22EB5CD;
	Tue, 12 Aug 2025 10:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QM+6lsVW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5BE2EAD0E
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 10:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754994235; cv=none; b=Vgd20eptOiDcJ9VpPPt2GsVZKJr7Tfw4tcYrpuFCyaxaUJlUHxSBY4+9Z9QYzjlp0dKBwrbIUs7bn/ZI3BI6sJU70qcwV+Qr8uYVWmhGSFf8/6fCWt+SI7+HxWrXv02PqGaWAW6Nn08bc4ougmhqWam/MhtxBuu6jyicWCH8qa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754994235; c=relaxed/simple;
	bh=We6XfkAl0+Rk+YFJpAN79Snk06JGvwWviwXHLqMusGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRLBvw0PIAoj7c1MA4u9Cgngvr41fawIkkpKNfqEymrmHeOcnAbVGySED5jvgOQENOMPt6WvRlgXHfxL72qcQSDqn3AQpLsqhw78bapDQP+GXLQDRijTuGkeSLxxl6CY6gqQl8qpFteTUPEmZLOQaiUJw/KebV1Dz/kn8obV1tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QM+6lsVW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C3QGQ1004900
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 10:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVDsi1mqr9iZ/YWfYut7sj+G181wFB16lCiuqt0bKQs=; b=QM+6lsVWmX9CZDKO
	j85s7DX5IC91rO6zwWkqdM4Ja/9zbdGQ9CpxwQaq1uoeMmvpG15rRN49Y0gcogKh
	QsreN9gT7xipMKajX6TqlA1GVScKVMsNyvR7SKVCofxJM9o/HVlEp/PPJwohMJx9
	UYCr79ToViYoGUT6S7FXKuH0Vj2HRZwiROm5sW6iRi+IDVGM/CBu+32UNAOE4Z5N
	wjxJgyRbq39dWva8Dku/T97nYzWXa6RQZbiNbBMoWJS9CYlqvtv08M4Hzv++Ktcy
	qQgnE+l8KmBCI9aC+MACMLwibERrAYMVFgMAa9hLCGhtjl2PRSC9GpZvpN3TenZM
	wm+rqA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbav61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 10:23:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-242fe34add1so7146485ad.3
        for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 03:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754994233; x=1755599033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVDsi1mqr9iZ/YWfYut7sj+G181wFB16lCiuqt0bKQs=;
        b=Gqwg7ruiLFZVXfx4zEwxIytKUiUYZwJy4cLfr0Kja2HiKJ9mxxJnG5z68wfnm1jkQ8
         o9Bw/5eSKV/YeL1zkDbmVz9M6J1M353PDYaN3MpecAmm89Tne7joxatcHk1oNewHpHTt
         b9fPqk38easvhcoQwupWTTSnlBQnnsh3FAGOfEdB2IyTA/1HFQYbT4bieguSbGwMm5Io
         Mao7zEs6JK/EaFXQqW6xk0SYiKgU8SgwKfax8n9r6T4KBCvjJopPrjuni6pwUoesqBnW
         IXT+nDjcEc8N/nkpJiq62hY9DBAUPTNXAhdW0zYyj4AXuL4qrvaanP5TQw9iLYF/VhsH
         PXAA==
X-Forwarded-Encrypted: i=1; AJvYcCWF+GYVpPdLVpF3hGCV5t14nF/x/rcjxHjHHT/AnHrOSGfUXpjLHvQL2eUnW5K8HX5WOkTQsLJWH8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFe+zy0m+3CG5UwXesvlBkQyeqDTj1p8IlEp2U1QseTu6rNQ36
	HcBhb9ehH3g9BukZAOwX2YvmS/LTaGLNu936LgUkPUxs4YxzJ9ZpVmy3ShEi4zu2wvBbe9i8cZU
	ByXuhl99Mluq+048BjQCsBlc3Ut9mEJaZONlJVRgXgMJDkH4PnmSHoL1boj8t33s=
X-Gm-Gg: ASbGnct3lq+uzgXfNorCfoGDjkk9K5Fi0OHcnAHtnvqflVHp4zAkJQ9P+la7OtcW57a
	kLP6Too2wUFCwGIbxtbJHrGQUsERxO3t+FHT/G+VPnk2l/XPLZay5j1f6gImaee6qMdrB2YbXYN
	UwtffMKu/6tAaMBPjgxCOmbDfVoURcir0ZiDeaHjGMV/EWbuS09zz3WX6wzHZ4ZmdJwQ0zi48zC
	5n24qclLQaFmFLaKR0ghPEIdklU4KPj+Zu68Cuypq4zXyq+E0JJaOfGgHPmQzVIcFWZ7oP50x/7
	RblTYCbm79uFF1tvcDc8/4ZGSbiPn1YG5QxBgiLOAsvfSw9t0mnTOwWtcbX/J3DjQi6TBKo=
X-Received: by 2002:a17:903:2444:b0:234:9656:7db9 with SMTP id d9443c01a7336-242fc31a4a3mr51288875ad.32.1754994232583;
        Tue, 12 Aug 2025 03:23:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3nE0xxMXGE/aWuTkvjXgGqjunL9+rYSJeujJY4UxqEAU7X4YcgP2z+joHLGg4G+JZ/pjB4Q==
X-Received: by 2002:a17:903:2444:b0:234:9656:7db9 with SMTP id d9443c01a7336-242fc31a4a3mr51288405ad.32.1754994232082;
        Tue, 12 Aug 2025 03:23:52 -0700 (PDT)
Received: from [10.92.180.108] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aafa11sm295123515ad.172.2025.08.12.03.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 03:23:51 -0700 (PDT)
Message-ID: <7ab4d0b1-30b8-408f-8dd8-85d9fc255704@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 15:53:46 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
 <20250812055542.1588528-3-krishna.kurapati@oss.qualcomm.com>
 <575c80d1-5f68-4863-8ba3-9769a5047b8d@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <575c80d1-5f68-4863-8ba3-9769a5047b8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689b1639 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=hQXcrAQZFoSSxVINoZkA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX67/L4q93cVem
 I5/wgBK6qzr+neXbpOdTIaCC3W6ngCKAqdZc7FW9juwfBZwjL59Zitz7IUQL34wTVgikcZKF9lG
 +XjztftRd5uoJlXY65hoCkFvxJijsect51z0u1i7T823CwjFdYXN4Ll8SdF4u1RK/cfrU/Ea56B
 5adypaBSmcuYT7+sBhCn5DlKdi8/RnRYajBW4V6YmqA1DKsHFYOd15wsObU8ao1oAxzDQeLov0F
 F+FCqjvlFIkVlsbcvHzxjxrj0wKLUQWXuCc2uQ7dU3ansqXvZJBs4nuS+8h0j//DSLljp2j71ZN
 xxSm0q128xBp5sEIAcmk4OgbUn1quqYz1JEBLZ2gno/hAp1JcrzUy5CGezRAJiqOZPNL7Gh+VuN
 FoFVVT2q
X-Proofpoint-ORIG-GUID: Hn3Atz6fqay6IhQgXdxJszleU0NeU3vk
X-Proofpoint-GUID: Hn3Atz6fqay6IhQgXdxJszleU0NeU3vk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097



On 8/12/2025 2:39 PM, Konrad Dybcio wrote:
> On 8/12/25 7:55 AM, Krishna Kurapati wrote:
>> On Qualcomm DWC3 dual-role controllers, the conndone/disconnect events in
>> device mode are generated by controller when software writes to QSCRATCH
>> registers in Qualcomm Glue layer rather than the vbus line being routed to
>> dwc3 core IP for it to recognize and generate these events.
>>
>> UTMI_OTG_VBUS_VALID  bit of QSCRATCH_HS_PHY_CTRL register needs to be set
>> to generate a connection done event and to be cleared for the controller to
>> generate a disconnect event during cable removal. When the disconnect is
>> not generated upon cable removal, the "connected" flag of dwc3 is left
>> marked as "true" and it blocks suspend routines and for that to happen upon
>> cable removal, the cable disconnect notification coming in via set_role
>> call need to be provided to the Qualcomm glue layer as well.
>>
>> Currently, the way DWC3 core and Qualcomm legacy glue driver are designed,
>> there is no mechanism through which the DWC3 core can notify the Qualcomm
>> glue layer of any role changes which it receives via role switch. To
>> register these glue callbacks at probe time, for enabling core to notify
>> glue layer, the legacy Qualcomm driver has no way to find out when the
>> child driver probe was successful since it does not check for the same
>> during of_platform_populate.
> 
> [...]
> 
>> +	if (qcom->current_role == USB_ROLE_DEVICE)
> 
> I think it makes more sense to check for next_role here (we know
> it'll be the opposite of current_role, but this is confusing to read)
> 
>> +		dwc3_qcom_vbus_override_enable(qcom, false);
>> +	else if (qcom->current_role != USB_ROLE_DEVICE)
>> +		dwc3_qcom_vbus_override_enable(qcom, true);
> 
> I think the formerly proposed inline comparison grew on me..
> or at least drop the 'else' condition, '==' only goes two ways
> 

ACK.

>> +
>> +	pm_runtime_mark_last_busy(qcom->dev);
>> +	pm_runtime_put_sync(qcom->dev);
>> +
>> +	/*
>> +	 * Current role changes via usb_role_switch_set_role callback protected
>> +	 * internally by mutex lock.
>> +	 */
>> +	qcom->current_role = next_role;
>> +}
>> +
>> +static void dwc3_qcom_run_stop_notifier(struct dwc3 *dwc, bool is_on)
>> +{
>> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>> +
>> +	/*
>> +	 * When autosuspend is enabled and controller goes to suspend
>> +	 * after removing UDC from userspace, the next UDC write needs
>> +	 * setting of QSCRATCH VBUS_VALID to "1" to generate a connect
>> +	 * done event.
>> +	 */
>> +	if (!is_on)
>> +		return;
>> +
>> +	dwc3_qcom_vbus_override_enable(qcom, true);
>> +	pm_runtime_mark_last_busy(qcom->dev);
>> +}
>> +
>> +struct dwc3_glue_ops dwc3_qcom_glue_ops = {
>> +	.pre_set_role	= dwc3_qcom_set_role_notifier,
>> +	.pre_run_stop	= dwc3_qcom_run_stop_notifier,
>> +};
>> +
>>   static int dwc3_qcom_probe(struct platform_device *pdev)
>>   {
>>   	struct dwc3_probe_data	probe_data = {};
>> @@ -636,6 +683,23 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   	if (ignore_pipe_clk)
>>   		dwc3_qcom_select_utmi_clk(qcom);
>>   
>> +	qcom->mode = usb_get_dr_mode(dev);
>> +
>> +	if (qcom->mode == USB_DR_MODE_HOST) {
>> +		qcom->current_role = USB_ROLE_HOST;
> 
> Should we explicitly clear the VBUS override in this and the last branch?
> 

Not necessary. Even if its kept set (somehow carried on from 
bootloader), its still a NOP if dr mode is host or default mode is host.

Regards,
Krishna,

> Konrad
> 
>> +	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>> +		qcom->current_role = USB_ROLE_DEVICE;
>> +		dwc3_qcom_vbus_override_enable(qcom, true);
>> +	} else {
>> +		if ((device_property_read_bool(dev, "usb-role-switch")) &&
>> +		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
>> +			qcom->current_role = USB_ROLE_HOST;
>> +		else
>> +			qcom->current_role = USB_ROLE_DEVICE;
>> +	}
>> +
>> +	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
>> +
>>   	qcom->dwc.dev = dev;
>>   	probe_data.dwc = &qcom->dwc;
>>   	probe_data.res = &res;
>> @@ -650,12 +714,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto remove_core;
>>   
>> -	qcom->mode = usb_get_dr_mode(dev);
>> -
>> -	/* enable vbus override for device mode */
>> -	if (qcom->mode != USB_DR_MODE_HOST)
>> -		dwc3_qcom_vbus_override_enable(qcom, true);
>> -
>>   	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
>>   	device_init_wakeup(&pdev->dev, wakeup_source);
>>   

