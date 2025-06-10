Return-Path: <linux-usb+bounces-24652-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D74AD343C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 13:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0D7C172A2E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 11:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A582F28DB59;
	Tue, 10 Jun 2025 11:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G90MMvdy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864A728DB63
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553257; cv=none; b=C30HXegP1BRJ7wLP3f2G+5UZWjPtPsNR40kiU5tBjayPEHh31LT4WFVvFpsYoiBBreVQ/XCXkHgpT3j7n+iDUVBE3Txrf4GY0d1qKREO1Nxu5MeE1BcZzLNrz9u2Q4GY9GiN8NYOydG6LQ/8ZV3oCY0pzJoryAh8iira6paGCZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553257; c=relaxed/simple;
	bh=+dIEq21bZDNm/F5wofLUI1T/a46ytCN/VL25CWWOfSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9QhBDZzYzxr74CqU5nbGj9pnQ/x9vkwFDQjoFqYK8UEOJXBkbKg/yx/BVsBy8G/Huvags1wAaJ/fNVP1u9KO348BsxefZEPQJ9yt6YKfdHK9+LZy8csrmlGXpBemTSXBF5K/sMNJCfW+aLHM5Xum1Kih1RV5UbmHdpaKxhzDUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G90MMvdy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A60NMO002514
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 11:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pEBkMXzXpL7qUqFVNTnStfd7
	mGzv44qmPPxiUT7KNxU=; b=G90MMvdyzvFIDk95eDOCYkyYwHIwLdA6xjcmDaL1
	xr6zPmqs2t3pOS3pxEXq2c2DeF0mdBOpTyC+pzVhh54G1lh6oe76E7JkliwRxN9J
	24GTmYFBCWv8abcqYN52V6pDs7JcKEMME7GhcRqtghLd6ot2TTNBDT6fpzXCVz7n
	TlMdKWt+R/AhiEd2YNs4eA7ZdtCRim2LUkKPn+BKYDPhdZ3krZ1U8OctKbHgP14O
	fBDWK4zxYZd9dutrfB+reFsw2PC24kJFXFxpOltchj6euTf5X3tpeYNGGAuvMq+8
	VPzZkB8iF8WEfDd+/vACVIXFTuvDK3zYF66usDgrfRVTqw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tburp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 11:00:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4e59628a333so1206708137.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 04:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553253; x=1750158053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEBkMXzXpL7qUqFVNTnStfd7mGzv44qmPPxiUT7KNxU=;
        b=ozgE5gqXXxJcBIiZ+wKh4lvXMQGxgypO7mE7X2IuUoOeFM2v3gTztDLy9pWUmPMhdZ
         Ceufj8/125d6xUtUZcafRpYCap77H9XmTB1irdgQBHEK0lEBSDKNsJ51PmIH8u1pbJDL
         uUu5pUsV0C0uHS+236cb2C7YQL2rXkGLWJC2DNbgAlnrDMQOxFhJsGjXGU7RV8yZi6Cs
         25vsiONubw5cJlJHxlcejVV3XCccfFcOXTHDuxUew8dkmlW5S1/5Fsqfj/UROe4tnzJj
         FAhVJ5BygCt5HUT/KyhHr3kK4tk8E9ydrCY2KHxQNfjIpyqwv5KgUfuxA9mKUrdC+mr8
         UnEg==
X-Forwarded-Encrypted: i=1; AJvYcCUJmL35EcnVavkNwMRIJX8oH8QUdr7amtQiKefGG9WDhe4R5SrD1Go1qOsWvndOyVngC6hbIxskzL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YycfupnvTHh1v+zSNHxFeptEy+LnGEB9d8oad6c0FiJrEW5PXGj
	sYZNJbgHQWU9iDq1o4AnIwAJGVJwzLkU+SmEYzQKWRpk4H0+C8fmr6cjv9Jb8S3rJytWQePSzv6
	/BqDu3BVcCZb5YHr2Ef1QndbLHJx2D27f5LMmM7bgczcei8uUNPfmivVTjS7wHD8=
X-Gm-Gg: ASbGncuoHPSypHFvnCOeT4byWZLf4ON1yiOL/afyJXTkTZCkwoLmjmDPiFTps/mVpaY
	Z0AnZdiGqglTfnLH12slE+BIMTWdqEaxOXYPmZ8vYcPUWi5WxR8KyI1OKccy+dg10cpf2yb3Z0h
	/DRatYQByWn2ZaP6gZrfXjrfGrHz2JARFN5jZul0ylJP+vUKGDrqrn+sXSU4uFviS5B1X1rT/Ea
	jMOu+Rj8Bo81YXs0cP99BuW/5Qkso6r2ctmjdiji5crToag+S8nyzxNEYb9bKm82ZjCD85tg596
	7BTaruWeeGQbjD8uMqFtlKBEArK7ThHkvtLhZFy6l4DnpPIY7UeK9ImGPq7m+U/IuhiceJjBKjl
	ZVxADv287Po5XdVSYr8FVORNlyu0Nu3orb34=
X-Received: by 2002:a05:6102:54a5:b0:4e2:bacd:9f02 with SMTP id ada2fe7eead31-4e772a31678mr11943342137.16.1749553252102;
        Tue, 10 Jun 2025 04:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCnwVY9cWENSO5uE9wpn1rHEVj0l2S2/o8EK9oDN+YHWBDV4+pps3la8q1tc3n3DXG9UFWvQ==
X-Received: by 2002:a05:6102:54a5:b0:4e2:bacd:9f02 with SMTP id ada2fe7eead31-4e772a31678mr11943093137.16.1749553250944;
        Tue, 10 Jun 2025 04:00:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b3fa6dsm14218041fa.46.2025.06.10.04.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:00:50 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:00:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] usb: dwc3: qcom: Facilitate autosuspend during
 host mode
Message-ID: <20250610110047.4yc6zjcvkobxerml@umbar.lan>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-4-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610091357.2983085-4-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-GUID: qm4X1xFffcPYNGLLcZ2LY-NeikffeE56
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=68481066 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=iYtnYYCt-WnurzE34mkA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: qm4X1xFffcPYNGLLcZ2LY-NeikffeE56
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NCBTYWx0ZWRfX3RlhmrmJMdae
 NwEq3BhrTiPhpQ330pZoadQeI6cIUyLSmskov2ByzxJkdZtTl/pEgiOnnjYdy38pkprG0yhCA5O
 fc4fwSiZHjDQwlHCDE9WAxhtHHOjxQHLyEGzazRtS7Zy/4t/HFdRx9Sll8koy0vhydCzY0uHYD0
 tOLBUa0+iMy9cSgvETBoCkP4LzQ1La2RHjlN9eQ63b4Io8s8AbRXZvcwOiRDHb7rGdalp+nNs5e
 wXJF02D/iSupq8RgVfv3Ruex6ytTqZyPR28BXEEmPnEBjYa1VRjTmpGRhMA0w803UGlHMdEX3xy
 ZBMQnZXOFNS8YswLo2kF8H9zCUofbOHBF9lqRzKvRnS3xjSONwZFHSTYBEoksBVR2BZKcBVVkuH
 wZ9z7mnfnir2r0vZhKgWJFDVpBlywzYGIAaOG60Jo7OuAIdrAbKM5g0qiQXfzLXhTRFqvGp+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100084

On Tue, Jun 10, 2025 at 02:43:56PM +0530, Krishna Kurapati wrote:
> When in host mode, it is intended that the controller goes to suspend
> state to save power and wait for interrupts from connected peripheral
> to wake it up. This is particularly used in cases where a HID or Audio
> device is connected. In such scenarios, the usb controller can enter
> auto suspend and resume action after getting interrupts from the
> connected device.
> 
> Allow autosuspend for and xhci device and allow userspace to decide
> whether to enable this functionality.
> 
> a) Register to usb-core notifications in set_role vendor callback to
> identify when root hubs are being created. Configure them to
> use_autosuspend.
> 
> b) Identify usb core notifications where the HCD is being added and
> enable autosuspend for that particular xhci device.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 62 ++++++++++++++++++++++++++++++++----
>  1 file changed, 56 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index d40b52e2ba01..17bbd5a06c08 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -95,6 +95,8 @@ struct dwc3_qcom {
>  	 * internally by mutex lock.
>  	 */
>  	enum usb_role		current_role;
> +
> +	struct notifier_block	xhci_nb;
>  };
>  
>  #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> @@ -647,6 +649,39 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
>  	return 0;
>  }
>  
> +static int dwc3_xhci_event_notifier(struct notifier_block *nb,
> +				    unsigned long event, void *ptr)
> +{
> +	struct dwc3_qcom  *qcom	= container_of(nb, struct dwc3_qcom, xhci_nb);
> +	struct dwc3	  *dwc	= &qcom->dwc;
> +	struct usb_bus	  *ubus	= ptr;
> +	struct usb_hcd	  *hcd;
> +
> +	if (!dwc->xhci)
> +		goto done;
> +
> +	hcd = platform_get_drvdata(dwc->xhci);
> +	if (!hcd)
> +		goto done;
> +
> +	if (event != USB_BUS_ADD)
> +		goto done;
> +
> +	if (strcmp(dev_name(ubus->sysdev), dev_name(dwc->sysdev)) != 0)
> +		goto done;
> +
> +	if (event == USB_BUS_ADD) {
> +		/*
> +		 * Identify instant of creation of primary hcd and
> +		 * mark xhci as autosuspend capable at this point.
> +		 */
> +		pm_runtime_use_autosuspend(&dwc->xhci->dev);

This feels like an overkill, using notifiers to set autosuspend flag.
Please extend platform data and/or other static code in order to set the
flag on the created xHCI devices.

> +	}
> +
> +done:
> +	return NOTIFY_DONE;
> +}
> +
>  static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
>  {
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> @@ -659,12 +694,22 @@ static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_rol
>  		return;
>  	}
>  
> -	if (qcom->current_role == USB_ROLE_DEVICE &&
> -	    next_role != USB_ROLE_DEVICE)
> +	if (qcom->current_role == USB_ROLE_NONE) {
> +		if (next_role == USB_ROLE_DEVICE) {
> +			dwc3_qcom_vbus_override_enable(qcom, true);
> +		} else if (next_role == USB_ROLE_HOST) {
> +			qcom->xhci_nb.notifier_call = dwc3_xhci_event_notifier;
> +			usb_register_notify(&qcom->xhci_nb);
> +		}
> +	} else if (qcom->current_role == USB_ROLE_DEVICE &&
> +		   next_role != USB_ROLE_DEVICE) {
>  		dwc3_qcom_vbus_override_enable(qcom, false);
> -	else if ((qcom->current_role != USB_ROLE_DEVICE) &&
> -		 (next_role == USB_ROLE_DEVICE))
> -		dwc3_qcom_vbus_override_enable(qcom, true);
> +	} else if (qcom->current_role == USB_ROLE_HOST) {
> +		if (next_role == USB_ROLE_NONE)
> +			usb_unregister_notify(&qcom->xhci_nb);
> +		else if (next_role == USB_ROLE_DEVICE)
> +			dwc3_qcom_vbus_override_enable(qcom, true);
> +	}
>  
>  	pm_runtime_mark_last_busy(qcom->dev);
>  	pm_runtime_put_sync(qcom->dev);
> @@ -774,6 +819,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	if (qcom->mode == USB_DR_MODE_HOST) {
>  		qcom->current_role = USB_ROLE_HOST;
> +		qcom->xhci_nb.notifier_call = dwc3_xhci_event_notifier;
> +		usb_register_notify(&qcom->xhci_nb);
>  	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>  		qcom->current_role = USB_ROLE_DEVICE;
>  		dwc3_qcom_vbus_override_enable(qcom, true);
> @@ -794,7 +841,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	ret = dwc3_core_probe(&probe_data);
>  	if (ret)  {
>  		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
> -		goto clk_disable;
> +		goto unregister_notify;
>  	}
>  
>  	ret = dwc3_qcom_interconnect_init(qcom);
> @@ -817,6 +864,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	dwc3_qcom_interconnect_exit(qcom);
>  remove_core:
>  	dwc3_core_remove(&qcom->dwc);
> +unregister_notify:
> +	if (qcom->mode == USB_DR_MODE_HOST)
> +		usb_unregister_notify(&qcom->xhci_nb);
>  clk_disable:
>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  
> -- 
> 2.34.1
> 

