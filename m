Return-Path: <linux-usb+bounces-26535-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E89B1C451
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 12:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33F50189EE5B
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 10:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC992749E8;
	Wed,  6 Aug 2025 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mtgld+LP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED9D4A28
	for <linux-usb@vger.kernel.org>; Wed,  6 Aug 2025 10:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754476337; cv=none; b=DHSjYEzenb23kTec8Cl2iNxhkYgNY3xNTHyIcRw/CIKxabcNiCcvegepESJh3yxNBejdqfvGtpQzBVTEgKV2mVqtXm1W+g+SyLk3HqxzAg6GejoWBloKBARxpe/BBqVb5wopkvnk7bT/QIESwZznBwT1LV81BG6s7/gLtnpzHG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754476337; c=relaxed/simple;
	bh=tUcprFfXd9oAcJwqCv/w3dOR39GaGztYnBkemd5iOnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GlDDtBVXLG01Uk5AryfVU3lQYmZqKqUvhMrocGwjUlIYWk/+BiAopqLNZ0fUMvo26zwEOVIqSFjsIiqPQKTNoB7Rhixy1KrQG+9eslkvCxG+Tl+dMIcQ4oj+UitqLCB3SRiDe3sVDR4Ipjefq1bZ7zLlA/0PVhDHMQHdScDDF8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mtgld+LP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766AjFj013856
	for <linux-usb@vger.kernel.org>; Wed, 6 Aug 2025 10:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEk/ULY6gK45IEnurP2aWib60KOhIepG3boZzjJxTdA=; b=Mtgld+LP5Qstevok
	W0BB0q2GJmeUj6hs63WvPcYhqla083K3Z32JldljfHTyaF4RAgYp3CSnlWg1kW4F
	MYVUDzf/+xEriO6oqYKmXdhMpHINS3G9qNWYg0DB8m/3+Tswzm5+OTOCPpglRhB3
	DAeLqBfY5CiBDUiO3Up4Pt6xfLQzCDa+Aq/lvUmPNko90vD4TuQRlVMCvdsZHUsX
	KJhD6GSAVAhW5+oQTFBweRmhGcwImPI0md7v+qoVaY1wrIBvD4u44AMLHVA1PZeb
	ipeGmZaAh7Tu+HmtD1t9Qd2yHDicJ2iuNbQrYFCt2BIUZERVQTnGjZVUyPPf8C+q
	UGyRFQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvvtc71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 06 Aug 2025 10:32:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b07ae72350so6970001cf.0
        for <linux-usb@vger.kernel.org>; Wed, 06 Aug 2025 03:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754476332; x=1755081132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEk/ULY6gK45IEnurP2aWib60KOhIepG3boZzjJxTdA=;
        b=riou2qZuG5S+shz2uTJvIBSxQ3iFeEhS848xaVBioD6m9PHlv4XDaVbNqfKLhB0xbp
         9jh5FC57CRJpcOH3KgbW5n2loEBMTL977NN8toH9UZWWg42N4VHIkvwxFhmXxizBBGQC
         MCOHpHx6kmSOB6422vVMJxKWQ58hEnhYTjbq0RfsFYX/nH01ET2eSGrqqp48EgSgDrlW
         pCBPYMUVBBTXo4X+efYaWIA0w5NlqxoptPFjNeN5B0f00MtOITVAcDSZQimaHltvUUaF
         gTeAPXANn/9S0TOzCuJ5uk3pNzlqpLa6kj354RnGXDD8MRmiFyTgrR0+dd1HUdEyG8Tv
         tpLA==
X-Forwarded-Encrypted: i=1; AJvYcCVGBFKYJTohz++a3sL9WA9KFRJCtq7UrzH/w6nr7gcQl6RQMcSK5KWI7ZQuFsYpWaZoLGvDP2ZBEUE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk9+4ufMNM1ZJvVKue83J9xjAZOynUnqDy7bGMMf1vwzoVMOiG
	0TcPOZ4nzPhHYdzvwuJNR72L1D6pFHHTFm32+eKhsm4aa46uVWIGUma/2La+5lfykoPc9z+AU+O
	zmMwIFNBogTC1MOphXK+LA6dBSWCwpQY9LpYL8RKVykTHTqMDHkEdzhfTTy1JIqs=
X-Gm-Gg: ASbGncsZxEHti/yB+WBP1Zy+0znT5ttD3IfEzTcezw7UCbcAjKRApWW36mxYrkhZjwC
	md3kq4C1NrGtzeubI+yJCKgLcTCYd5s2O/wLQvep+0I4FyPX68Ssqo66JbmHI5KpvDXMSWR4pk/
	NdnZwlkERfrhWQ6OPdUp634YlEZ7YCEJW0RTEUgsediBIpHrO4lZbSk75BxXEpwFd2rHlet3Zzr
	j9QPpa5PKa6v+YpXPbEx2rLzwa5f02UYIsIS8D1O2nOxrL1ofvS4sTbKY4HxCN6LEmBABEOemMQ
	mq1mjtJfU0XEqnb99jwoJe+IYaLGGTMkGY5KL3sSlB7HtmYtxwlnB5Gr1jcsx0EX3C7Ctg/NnEq
	l1gJAPsm4y6V6W94X2g==
X-Received: by 2002:ac8:7d0c:0:b0:4a9:b181:cdd1 with SMTP id d75a77b69052e-4b09133d2camr15361631cf.1.1754476332233;
        Wed, 06 Aug 2025 03:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8617zK76RWr+ilfFqm3EQxEshxMceq8P5bYKx3Fh7J1HbMsxXFxOycWQ3N+WaatQ4jGVpow==
X-Received: by 2002:ac8:7d0c:0:b0:4a9:b181:cdd1 with SMTP id d75a77b69052e-4b09133d2camr15361361cf.1.1754476331615;
        Wed, 06 Aug 2025 03:32:11 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b6csm1071709466b.48.2025.08.06.03.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 03:32:11 -0700 (PDT)
Message-ID: <83c54b3e-8e31-4ca1-9ca6-31703211d507@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 12:32:09 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250806095828.1582917-1-krishna.kurapati@oss.qualcomm.com>
 <20250806095828.1582917-3-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250806095828.1582917-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aOOAxUKw5Z84SUGGC7UoZ7DBoGwX0d4C
X-Authority-Analysis: v=2.4 cv=GttC+l1C c=1 sm=1 tr=0 ts=68932f2d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jpV4xLzjOhFdEjUPh5wA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: aOOAxUKw5Z84SUGGC7UoZ7DBoGwX0d4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX6xfbzRR6Esr0
 t+rGcZg2fI30igtuSwoG4IdDqHm0RthzdcNZgM2ucYR2WPft7dbpp9FEsO0kc1xD8cOHDTTwYhm
 Ahcxg65Ak9VPXZBmG9fVGiPsHkz+HHfTVhxhCaTMwhHS4+wsUMa5aWmk6QcRCL3ommUdNiBsPJc
 Bpd9CpzE6tD4eSGVTyBQZyxXNx+PbfjXPFdjIE7qnQzzZj1uUwTcHspv6W5rqA8r7qNKJBGJ6kZ
 zYxnzOvYOJLjrQ0/jTTumjVye/ZkINFl7+r1pLIlHullpuuXGYy0kQ3LL5E0DasLDJIHaE79qe9
 rPRo5sdZnJdEiB+8rHCnZojVOeoDtzLgG3wCOBQp7JQi9hu9bcGFMbXQEhUCpNjVT0I1/eadHgZ
 gp7ckuNr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/6/25 11:58 AM, Krishna Kurapati wrote:
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
> 
> Hence implement the following glue callbacks for flattened Qualcomm glue
> driver:
> 
> 1. set_role: To pass role switching information from drd layer to glue.
> This information is needed to identify NONE/DEVICE mode switch and modify
> QSCRATCH to generate connect-done event on device mode entry and disconnect
> event on cable removal in device mode.
> 
> 2. run_stop: When booting up in device mode, if autouspend is enabled and
> userspace doesn't write UDC on boot, controller enters autosuspend. After
> this, if the userspace writes to UDC in the future, run_stop notifier is
> required to enable UTMI_OTG_VBUS_VALID of QSCRATCH so that connect done
> event is generated after run_stop(1) is done to finish enumeration.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 80 +++++++++++++++++++++++++++++++-----
>  1 file changed, 70 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index a7eaefaeec4d..5195267cd34d 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -83,6 +83,8 @@ struct dwc3_qcom {
>  	bool			pm_suspended;
>  	struct icc_path		*icc_path_ddr;
>  	struct icc_path		*icc_path_apps;
> +
> +	enum usb_role		current_role;
>  };
>  
>  #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> @@ -111,10 +113,6 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
>  	readl(base + offset);
>  }
>  
> -/*
> - * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
> - * validate that the in-core extcon support is functional
> - */
>  static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
>  {
>  	if (enable) {
> @@ -560,6 +558,57 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
>  	return 0;
>  }
>  
> +static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
> +{
> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> +
> +	if (qcom->current_role == next_role)
> +		return;
> +
> +	if (pm_runtime_resume_and_get(qcom->dev) < 0) {

no need for the "< 0":

"""
Return 0 if the runtime PM usage counter of @dev has been
incremented or a negative error code otherwise.
"""

> +		dev_dbg(qcom->dev, "Failed to resume device\n");

This probably belongs in the suspend/resume calls themselves

> +		return;
> +	}
> +
> +	if (qcom->current_role == USB_ROLE_DEVICE &&
> +	    next_role != USB_ROLE_DEVICE)

The second part is unnecessary because the first if-condition in this
function ensures it
> +		dwc3_qcom_vbus_override_enable(qcom, false);
> +	else if ((qcom->current_role != USB_ROLE_DEVICE) &&
> +		 (next_role == USB_ROLE_DEVICE))

similarly here

meaning this can become

dwc3_qcom_vbus_override_enable(qcom, next_role == USB_ROLE_DEVICE)

(I'm not sure if it's easier to read, up to you)

> +		dwc3_qcom_vbus_override_enable(qcom, true);
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
> +	dwc3_qcom_vbus_override_enable(qcom, is_on);

this argument logically becomes true, always

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
> @@ -636,6 +685,23 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (ignore_pipe_clk)
>  		dwc3_qcom_select_utmi_clk(qcom);
>  
> +	qcom->mode = usb_get_dr_mode(dev);
> +
> +	if (qcom->mode == USB_DR_MODE_HOST) {
> +		qcom->current_role = USB_ROLE_HOST;
> +	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
> +		qcom->current_role = USB_ROLE_DEVICE;
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +	} else {
> +		if ((device_property_read_bool(dev, "usb-role-switch")) &&
> +		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))

currently this will never be true on any qcom dt ("role-switch-default-mode" is
not present anywhere)

> +			qcom->current_role = USB_ROLE_HOST;
> +		else
> +			qcom->current_role = USB_ROLE_DEVICE;
> +	}
> +
> +	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
> +

Konrad

