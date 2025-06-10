Return-Path: <linux-usb+bounces-24651-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E610AD3429
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 12:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73EB716F4AD
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 10:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FB728D8FA;
	Tue, 10 Jun 2025 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIIKsChP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510A028CF60
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 10:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553099; cv=none; b=CkTvJYcddsK/GfXEuMRSXujRmqoG3fuJyHZdkK2v78RFpHjv3/XhGvTJyeKwoAEYEJJKxjU86E2Lh0ArjhgbEYRz1rYERrv6qEtIiHzTdhuS9G8nX6NfsTRJZGR/Kxko7AgYixSg3qxJ64YV9dv6bvo5Ch4XcQxsjD1YjMtpuTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553099; c=relaxed/simple;
	bh=6m4aSEIQWuSZ/2c8P2Tz1u+SJ8juloqQfcsI/15XCAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SH0yxCyUOMjlOMYk9paGrf5GVTXnPiLVNjCMpff86+8Ek5GdS+TqAIK3KI6OfFwD24o/sjlCltQJNiOxBm37EsTBj2UtdAgsgvqTHS27nFoJB2b6uDInPK2Ppyg8FDFkMhhCAin31Qe3hiJD4x7rH65XMZN1n7ECwa2bZQXWkQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIIKsChP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8AXss017801
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 10:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ashcq96uXxB0qMzOHPKXx1fF
	NyLvTWrKO/a+H8IUbAY=; b=CIIKsChPnX65RD81vvN/spok/t3d7iuznaK3EIpg
	E0mVzSqhcX7wyqmaqdkxvIQjo5b1lVV3EitucVQHru8T9KZ4vYvO+jaMAk6+lCW3
	oPPnMhWlFnUki0Fnjq15pJ7ocVFkJh5AtMQHOydFk66JBJ/3S9oW0LNeX0PQf9rB
	0+CB/7HhOqhRHsCdbBh55Va23J69LjSSrB9ocvYN156ncgs9cVHXMXaULLmGia1i
	ycDuDUxFgmBIq7p6HhJYiZvl1TN/bzd3y3C6UzFPTjB281L7KlPa5tBRWCb/gX2s
	Ur/jWWGWgJbC+rICv8HBxFGwYEkqnKJEU0XBMDwijS+40Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mchwey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 10:58:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c793d573b2so939414485a.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 03:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553095; x=1750157895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ashcq96uXxB0qMzOHPKXx1fFNyLvTWrKO/a+H8IUbAY=;
        b=i7rJgtLtxLpCNLRHROUou64xJkQEia3p8TvLTlQ0l3f5zD0Gm8xghAht1AEbZ5V/fg
         sPfOBykHTsq7eNfTasK3x8KsHSoqmw3P9tx2OxJiURC3etrcUs0ZO6PU3XqSttEfEZFn
         V+O3NWov38JEPBjC9KbMNpb43FfLLX76Md7M0mvrxwNZo5gG8CwZL16m1kcLndxPhRIh
         UhWfxY9zx1LNY1K10CUyJa0n1tpiGwF6ONQF6TmXuRN4q6MK0HpPsehs5SY6TiaLlfg0
         cdXjNTwB0QlctsNqslJvVUuTS/26xc6rUOQGre8bUmKGobpVOECfpbDcchy1aHCo3qvt
         BT7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYIuaGM4L4o9UIcXXQUKrf1PLuPKV7PU6V2kCWwx/Ykt9bRzNT1IBU2igvOI3StCSBWIcgS7WXW5I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7nXwbA3nJYHQFyFYEIldxvE87IfGFDlXk0PTWqkg07GAMM+NB
	1mOHq4aiiNox7jffwI9Be4UU8RDPSSFVtEsXKTX/9k6rCqvAHxEPRtj7fzf36e6AkVgdoBRNFPt
	wmwbbtp1xI5GkjEt0WrF6A1Mcz/O8B3SpO/0KFnSf4LV3WdN8Eos35Bb3wrIwdDs=
X-Gm-Gg: ASbGncsiW8M0my1qDT9RgPLq8ahGBiDsNlxW/6LePJCh0xCPL9nhQywpGt9F2ckG/HF
	JjLR3qDZ0QJgWwmLZtxe9l5t1CxQogRz56FcpR9IA8iPdrz7Dkiw8gXnLTy3V318tb252sFdd/g
	Bf6By5gnbkkGxHFIhQR3IfPSHXoA6kojMLsCPHV8pIVPUpI5w9jTmxGSwn7DStFV5rjrJvaNPHC
	B8EQ+rxzuWIpcKCOIzzz10mKFra02OqZyv/SQmKc+Yi97Y93KeJR0VLb3UEbu7X8GKkVByyH4aD
	+CpojSwsP9PbW9XYgeW0F5oob6nSJVQHlEZdL9NIV0XNa7CnGkDn3fawh9t+TU9ggaFz7+6RMHA
	xCOxpi91b8KKUOyHbNnXez4nSvYCnM2bCdaQ=
X-Received: by 2002:a05:620a:4088:b0:7c5:4711:dc56 with SMTP id af79cd13be357-7d39f63c1c3mr320135985a.48.1749553095225;
        Tue, 10 Jun 2025 03:58:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuBgGIXPcSSI5jhWkbuOwMy8VWRPO/ZBFks/C92LrsTqQqlM6GtEr0n7B4qevS2ZV73Wr4mQ==
X-Received: by 2002:a05:620a:4088:b0:7c5:4711:dc56 with SMTP id af79cd13be357-7d39f63c1c3mr320131785a.48.1749553094688;
        Tue, 10 Jun 2025 03:58:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b36c77sm13882691fa.44.2025.06.10.03.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:58:13 -0700 (PDT)
Date: Tue, 10 Jun 2025 13:58:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Message-ID: <20250610105812.jepct55ic5snglno@umbar.lan>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=68480fc8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=jpV4xLzjOhFdEjUPh5wA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ly9fkQncQYhvLarwS-XPpTc0SaXp6nDY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NCBTYWx0ZWRfX1a4nMwCXKv1j
 +iAxzJfioHWENdx81HbaTiUP+ai1VOqaJAsJ0F3XHo0mH9W7HAzWUQBzMhN2jGE7TuLQKd6FJRX
 rD4zPIEvqiwBmdgf6ijxewJqph3tNLRuRfaC9jAPLxGujuDNnhX1hLqSpOWAs+Au4CDJOOvQIQr
 WQJWDtXMDljHj3iU6zyGa+u8tlqkxxKUanwLGApk5H38MAZvob1sarGqx3KNbBjI/gWVTVZmj+a
 nVk/eOop5DHH5WTfd6/ZmYsxZXUzB88DnHUPiXgqZ0rNOHfqmUS6phcqblyICyshhe58opuvdTF
 GPCKpMo+xz1WM0qrIp2F/CpopWT2SBpPrjRPRNbZ0FcOVVZbS/+YncZ+Dv6pwRpERcYjrwrp2Ot
 xdlQZnUh0W0od4gPt7nLawELQ1cNncp7j72KEjlTMciOjJuXrEGkijhBrIs/oTQ6oI6TZJ/g
X-Proofpoint-GUID: ly9fkQncQYhvLarwS-XPpTc0SaXp6nDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100084

On Tue, Jun 10, 2025 at 02:43:55PM +0530, Krishna Kurapati wrote:
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
>  drivers/usb/dwc3/dwc3-qcom.c | 82 ++++++++++++++++++++++++++++++++----
>  1 file changed, 73 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ca7e1c02773a..d40b52e2ba01 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -89,6 +89,12 @@ struct dwc3_qcom {
>  	bool			pm_suspended;
>  	struct icc_path		*icc_path_ddr;
>  	struct icc_path		*icc_path_apps;
> +
> +	/*
> +	 * Current role changes via usb_role_switch_set_role callback protected
> +	 * internally by mutex lock.
> +	 */
> +	enum usb_role		current_role;
>  };
>  
>  #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> @@ -118,9 +124,9 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
>  }
>  
>  /*
> - * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
> - * validate that the in-core extcon support is functional, and drop extcon
> - * handling from the glue
> + * TODO: Validate that the in-core extcon support is functional, and drop
> + * extcon handling from the glue. Make in-core extcon invoke
> + * dwc3_qcom_vbus_override_enable()
>   */
>  static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
>  {
> @@ -641,6 +647,53 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
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
> +		dev_dbg(qcom->dev, "Failed to resume device\n");
> +		return;
> +	}
> +
> +	if (qcom->current_role == USB_ROLE_DEVICE &&
> +	    next_role != USB_ROLE_DEVICE)
> +		dwc3_qcom_vbus_override_enable(qcom, false);
> +	else if ((qcom->current_role != USB_ROLE_DEVICE) &&
> +		 (next_role == USB_ROLE_DEVICE))
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
> +	pm_runtime_mark_last_busy(qcom->dev);
> +	pm_runtime_put_sync(qcom->dev);
> +
> +	qcom->current_role = next_role;

How is it protected by the mutex? Which mutex?

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
> +	pm_runtime_mark_last_busy(qcom->dev);
> +}
> +
> +struct dwc3_glue_ops dwc3_qcom_glue_ops = {
> +	.notify_set_role	= dwc3_qcom_set_role_notifier,
> +	.notify_run_stop	= dwc3_qcom_run_stop_notifier,
> +};
> +
>  static int dwc3_qcom_probe(struct platform_device *pdev)
>  {
>  	struct dwc3_probe_data	probe_data = {};
> @@ -717,6 +770,23 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
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
> +	} else if (qcom->mode == USB_DR_MODE_OTG) {

Just 'else', otherwise you are not going to implement the default case
correctly (per usb-drd.yaml we should default to OTG).

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
> @@ -731,12 +801,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto remove_core;
>  
> -	qcom->mode = usb_get_dr_mode(dev);
> -
> -	/* enable vbus override for device mode */
> -	if (qcom->mode != USB_DR_MODE_HOST)
> -		dwc3_qcom_vbus_override_enable(qcom, true);
> -
>  	/* register extcon to override sw_vbus on Vbus change later */
>  	ret = dwc3_qcom_register_extcon(qcom);
>  	if (ret)
> -- 
> 2.34.1
> 

