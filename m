Return-Path: <linux-usb+bounces-26742-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54143B22267
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 11:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78FF57AC09D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 09:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C702E7BD9;
	Tue, 12 Aug 2025 09:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kIwVq140"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EABE2E7BAC
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754989779; cv=none; b=PNIUJmZXJW72Ma1H/hh3Scwr4NrouvmH1Vah7pXEyG75tTuzs4uiWZSjnjKV2XxScKaj9uZOZ7EtgX1Re/38gFWhsdOSmIsn+HKtK+JX78UZwPtbfZxPPSmXj9DkBrYxJKqTIzY2j7qHZaucVPhosadfMn4huI88Rb5YZlfAsF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754989779; c=relaxed/simple;
	bh=bcRgZxxZm5dMTAv+MCHtXygXGg1jBllmgGGPnkWK5iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qn1JeGSHnTIm4lCjD0jXKWi8izvwrCoDlKEA5Ykmq9eFf0snsDkYB0v74A44tdSA7/8tPuiYKItFwdJEEz2iwdoQhvwdCKOT2jRQhAjJTDL4qq3MWc4S0RYChzn1QtaOP+bfCE8jHSjuDAeTLYu/Mqq1VYee3aICW/2gd1vX9hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kIwVq140; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C7XGe8026164
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 09:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uIMbl48QKb7Q2ta6KgDRhn0gdecz7ce+OLsivdgtlLw=; b=kIwVq140wOMCsZ/z
	38lqGTNdR63fGKjcY7b78+ZEEDMcooa3bn3nYqN66SAobsFaFp7j22xvkcOEID5N
	esrY/i6JljwMLbXo53oQtgWvXolzpBpKk2wpFcokiY8Z+7RohabcybKBOqJA5P5q
	rLfEtzgE9tB0NM/CLrNC5ARxKSEsja6fRmYQhZil0Omopt4lP5bsu/ByOhJRrvC8
	QP6UUmHhXmxtXaLUdWEvbQnLX1Ev04je/QJdgku/fcrglaiQP80rTXsgOoLfEDPa
	hgKXD3kxxpFYjxC3Qqgnc9EKyX4tIGBSoi764UbTvF3biClN+bqURxuj5IonwfcY
	8Eqlaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx5q8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 09:09:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e7f8e1dfd3so89962485a.2
        for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 02:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754989774; x=1755594574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIMbl48QKb7Q2ta6KgDRhn0gdecz7ce+OLsivdgtlLw=;
        b=oHSmlRyI1f+ZsBD+BSLw+sQQWWRP/NBWoM2oF/hbzwRgEj3V+mK2qpLpUqYlIqgGJQ
         eaeor1Wjg77za9K8wiBP6SWRKWf7qnKyrgYywTC6sGHBWs3ytAV3LYf7G0MKx80AweMl
         2rDC0hSlXCE7nKixXDeNL4CWTposhSxBpHA8MxFANerfLgqvsY/nJifnpNNS2MZtOVu0
         i3S0X0O9RrWQo001xUht4vJSiB0amsf/9CZVlt7UlGNEbGhncLPXwXUx8gbe2BrhUxpQ
         Et57DX8r2ssj9IPAyc4+cgv8vcss9T5Mn4PBYfFPU6n7zZZqYoVeRewoT+QAqg91z40G
         Ob9g==
X-Forwarded-Encrypted: i=1; AJvYcCWJOftm81CEld37iBQdaRvMppXLMLZvZTP3IKoMpw63LLWBLPQ54gXB32nvS98HK4DLekTlowM9U5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRlzJ+8DgZMvV0JCQkzLchfNf/DeyLtnnGLu7TfWM8sjcfAM6r
	KynjKLBmVMELt7S2vay0CrqHdzuzcSZvWEQDpO4bWdmSADTDZyeH9KUUwOrdWBFpmE27pv45a/b
	IT4+EVTSR8ntJteXsxgZA4pvMm4rdlnwNeXXo7O2Ladf/lq1Yp3j66gDOViOWqug=
X-Gm-Gg: ASbGncvJFgMdUrlfNV6AKyc1NobxHyvFjBfDepNWxGQ6DGg8St7YRyuPg4wVo5aw/3j
	762LAdBjTATjJjbJ3DOLLlHEBnml/E7LmQjtjnFftAGhN7IKBe+L7x3EKHDjlmpKBtfmojQR15D
	A2mI6D97QfrqkTEU0P4zAgcKMlhXv+J4AboqJ4nuGa9i8Hd2luabGks1veNLFq4/docJ28GE1pq
	JXG8udUZ9MTDipAZqYB7wHa8fgfgAhhMMZGY/UQYgxkw9+8cXirvZxf4vX8Kmhf75GT4txaf7zH
	ye4qC/8n1D59UcsDfktO/2cd/v45tteCChni+dTb/wjN6pcOGGUwLWNXPQJ6bhwyYhkx4P9Gymo
	1PxbgTcHWOz7u/ZRSOQ==
X-Received: by 2002:a05:620a:17a5:b0:7e6:5598:1fc6 with SMTP id af79cd13be357-7e860356a6fmr22572885a.8.1754989774442;
        Tue, 12 Aug 2025 02:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnlXnf/YbCuLIOKn9HG8+7RKUuvqXBGNTEXyk2OzW1YhsoxvxHMG/eUXzv5HDAXMbcSY96LA==
X-Received: by 2002:a05:620a:17a5:b0:7e6:5598:1fc6 with SMTP id af79cd13be357-7e860356a6fmr22571485a.8.1754989773890;
        Tue, 12 Aug 2025 02:09:33 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615cc38aeccsm18158600a12.2.2025.08.12.02.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:09:33 -0700 (PDT)
Message-ID: <575c80d1-5f68-4863-8ba3-9769a5047b8d@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:09:31 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
 <20250812055542.1588528-3-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250812055542.1588528-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX4PPVnvNQoNja
 hQey4bkJfPhCSh3exoH4nqNXBqYWoS0sG361kKvttmWcIjyZ71RYMf5DBaOBBMLxzOZ1P2flDnH
 13PAn7j8em2WNEoWNAGPTeZ1llCRrw85IVYaL1GPmJaLwX1KfUWiWA2bStF7gPUq6T6uVfgbjCP
 lntyfremLuNc05jcqLJRrF5sbCjwDkkqcimpGnMBe20NUNQ9Yw4WIB/S5QmZ8RIHtNU4PdXeY2R
 8n9CaKxmPwipU7t9dL/PqPo79HLoIqerek0uaSiQkEPdMxSbnhntAl2CvL8hVGvqz0XSPb1xTuH
 w9qcFLo4JzouBwwZFWutyd6wfwY7/voO+z5xeeTwXuvGngJSaJPPl59k2drrse2BzDmJyUlNgGd
 WfY2Esl4
X-Proofpoint-GUID: 2MKMGVWaWgHceNFjI7NTlWbRCs-pKgre
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b04cf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=t7pkRBm_AtVa8SjYk78A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 2MKMGVWaWgHceNFjI7NTlWbRCs-pKgre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/12/25 7:55 AM, Krishna Kurapati wrote:
> On Qualcomm DWC3 dual-role controllers, the conndone/disconnect events in
> device mode are generated by controller when software writes to QSCRATCH
> registers in Qualcomm Glue layer rather than the vbus line being routed to
> dwc3 core IP for it to recognize and generate these events.
> 
> UTMI_OTG_VBUS_VALID  bit of QSCRATCH_HS_PHY_CTRL register needs to be set
> to generate a connection done event and to be cleared for the controller to
> generate a disconnect event during cable removal. When the disconnect is
> not generated upon cable removal, the "connected" flag of dwc3 is left
> marked as "true" and it blocks suspend routines and for that to happen upon
> cable removal, the cable disconnect notification coming in via set_role
> call need to be provided to the Qualcomm glue layer as well.
> 
> Currently, the way DWC3 core and Qualcomm legacy glue driver are designed,
> there is no mechanism through which the DWC3 core can notify the Qualcomm
> glue layer of any role changes which it receives via role switch. To
> register these glue callbacks at probe time, for enabling core to notify
> glue layer, the legacy Qualcomm driver has no way to find out when the
> child driver probe was successful since it does not check for the same
> during of_platform_populate.

[...]

> +	if (qcom->current_role == USB_ROLE_DEVICE)

I think it makes more sense to check for next_role here (we know
it'll be the opposite of current_role, but this is confusing to read)

> +		dwc3_qcom_vbus_override_enable(qcom, false);
> +	else if (qcom->current_role != USB_ROLE_DEVICE)
> +		dwc3_qcom_vbus_override_enable(qcom, true);

I think the formerly proposed inline comparison grew on me..
or at least drop the 'else' condition, '==' only goes two ways

> +
> +	pm_runtime_mark_last_busy(qcom->dev);
> +	pm_runtime_put_sync(qcom->dev);
> +
> +	/*
> +	 * Current role changes via usb_role_switch_set_role callback protected
> +	 * internally by mutex lock.
> +	 */
> +	qcom->current_role = next_role;
> +}
> +
> +static void dwc3_qcom_run_stop_notifier(struct dwc3 *dwc, bool is_on)
> +{
> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> +
> +	/*
> +	 * When autosuspend is enabled and controller goes to suspend
> +	 * after removing UDC from userspace, the next UDC write needs
> +	 * setting of QSCRATCH VBUS_VALID to "1" to generate a connect
> +	 * done event.
> +	 */
> +	if (!is_on)
> +		return;
> +
> +	dwc3_qcom_vbus_override_enable(qcom, true);
> +	pm_runtime_mark_last_busy(qcom->dev);
> +}
> +
> +struct dwc3_glue_ops dwc3_qcom_glue_ops = {
> +	.pre_set_role	= dwc3_qcom_set_role_notifier,
> +	.pre_run_stop	= dwc3_qcom_run_stop_notifier,
> +};
> +
>  static int dwc3_qcom_probe(struct platform_device *pdev)
>  {
>  	struct dwc3_probe_data	probe_data = {};
> @@ -636,6 +683,23 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (ignore_pipe_clk)
>  		dwc3_qcom_select_utmi_clk(qcom);
>  
> +	qcom->mode = usb_get_dr_mode(dev);
> +
> +	if (qcom->mode == USB_DR_MODE_HOST) {
> +		qcom->current_role = USB_ROLE_HOST;

Should we explicitly clear the VBUS override in this and the last branch?

Konrad

> +	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
> +		qcom->current_role = USB_ROLE_DEVICE;
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +	} else {
> +		if ((device_property_read_bool(dev, "usb-role-switch")) &&
> +		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
> +			qcom->current_role = USB_ROLE_HOST;
> +		else
> +			qcom->current_role = USB_ROLE_DEVICE;
> +	}
> +
> +	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
> +
>  	qcom->dwc.dev = dev;
>  	probe_data.dwc = &qcom->dwc;
>  	probe_data.res = &res;
> @@ -650,12 +714,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto remove_core;
>  
> -	qcom->mode = usb_get_dr_mode(dev);
> -
> -	/* enable vbus override for device mode */
> -	if (qcom->mode != USB_DR_MODE_HOST)
> -		dwc3_qcom_vbus_override_enable(qcom, true);
> -
>  	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
>  	device_init_wakeup(&pdev->dev, wakeup_source);
>  

