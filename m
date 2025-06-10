Return-Path: <linux-usb+bounces-24677-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBBFAD40B5
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 19:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB4093A7C76
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 17:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829CE242D7C;
	Tue, 10 Jun 2025 17:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cR26CCm7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E9E242D7D
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 17:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576266; cv=none; b=ipCC6biPCFCF+XNK69b/91XJAneU3jcIVtnTpORLWNX3tk3ClddNwNP/acdhgqJRLdWSae2DJrJKjcn9Q6jcx3QdFCAq720QDuQpUdx0ehz45KfT/BGhuVj8ThCta+r7pVmp7EZWvIAoH6pFjxafQE1pmO1HoewBMPSkPA6IrdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576266; c=relaxed/simple;
	bh=vZ/qHJY5SYbx69O6TGT6pJN0oltt/Iwo/nwAfXXgjo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzk5w27EVu3WcX6K1WFAlHFkeVtn94B+moQQSIZUnf+ARH9WQj7TeL5eeN8q9j+O27mVolaOYniZzDkjzntmnghHCCLQQMaIwI20s3IqC9bhOamRun5ry+j/JaGjy3eZ/WUs4OurCZFAd9+bfyC1+qnwTNN/8hYHRKQ8DlBRE+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cR26CCm7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADwiGt004050
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 17:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/EgCdyUGamjcRnI5Pix4QyBB
	IiE0+ID5FfFUhMmjiF4=; b=cR26CCm7BHCRgyaBrtjlhw72O2tcLzAg7zeNrvSw
	7rf59uF/gNJJ06WPbea6Q+VFkDj0pHcRKaCWyVo/wdoWSs27nTpP67JwUAz+ZgPM
	TwmwnvV+gJNFFZj2o9+zDIzx/hQry+CbYDCKU/G/fm0UxikQEjzxJATUHlXZ+FWF
	2kyV6XtYKtbKoPETiygC03CEOFkFi/1vdxUEJ+MVx5MNm3VPrGgAzlgN6hdlAj4M
	WRzauIusS85csVP/pr3oRVZcAGS2Qy/1TX2KYm3fBFJnG2M9ycMhxm2XhfJuCSrN
	nfYJh4oqz3KItwSwGLgikVHwmk2qn8hXbj02+71wFjYApw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y5392-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 17:24:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c955be751aso904466085a.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 10:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749576262; x=1750181062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EgCdyUGamjcRnI5Pix4QyBBIiE0+ID5FfFUhMmjiF4=;
        b=ZYKZIKm1ePfEyLuSh5O+yn0kt3T6G4aPf/H5xpS8CNqq41PEq4mHimdnGOvSaNXIi1
         SHGGE69bKg5s/kW9ImVznI3SkhANMJRrBN2p4Da94G9RXFUJ0jR2mSiJHxgTb5Cd3eV/
         k0jj/XYks5xlAyRjG5wdZxhvIHn867BLZ1BqbhJdzxlVqI5dGY9szeSh3LCY4bP62WZG
         vBSLTuBXuZAOdZEpVivZkBLzR7g8354azRoYqLIU5bvfO7/f3TP92tyYqtq/hG5wUmOW
         vYEclNUlI2ZWNkD2Ti7LzmnDgG5cy//YCitjG+5ixgJ/K+o+E5D2VjuZlIBUz8M4NrUv
         9P+g==
X-Forwarded-Encrypted: i=1; AJvYcCVp5GiIpEWRVXHFKap4AE0WqaPvtFjM7eGtdGlE9cMgOmfcJcqIuTXCAp4z3mSfPOG/SrFQKEHZdlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkF8naGMBxlGgYzaDLPxaid3m54t1KbFN8dDHS6eW2g2yNF5Ug
	a1+jK8enF+K9s5/vqjWpkeE0qxbd3vDIxytUHVa7DL2mCYvVebuXL/4nzNiWiX8vXgwOURKsDLz
	1SAeMR0hJGDvhQmyyL7qBx2xZ1DWvGXS0qZOET25ep1N09RPmZCZX/YhBMCJngAo=
X-Gm-Gg: ASbGncvER3wECOVFMuB6A130svR6qwoAiOnvUWAMggHFQBXSU+irXauoQI4QXFxcGae
	+pTdqCNWMCoOiCgbEOz60zMuxkcO9BDR/2MTp5XD7PhFsVfMg58wNZHR9W+TDgIbyx7eSZxCRWp
	z/d5pd2qUGdY3eiXY2iByvMFBLUccNt0cq0QOuz3u0zOip+/jHjzzqttqyv9lsRc3eiriMvvt6j
	umXvVyqHUe8qrjQiHqmNCiEFPIznX9eiIXQsAD1ZefLbANL7MZLbAFpMI7a5sun7TevR/qoLNzU
	SgpCL49kShpLr4yFQnKC/KhvLIDd18SXbfm97KQjNFuqRTvW0i32LNvKI8zzj+gX1tGpXcIIheb
	PiNl7y2x6hiKR2OVYYtLnqfnVNdkpakj0NR0=
X-Received: by 2002:a05:620a:3192:b0:7d3:9482:b21c with SMTP id af79cd13be357-7d3a8819d38mr34794885a.13.1749576262256;
        Tue, 10 Jun 2025 10:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJwAL23sxfBB/KttW8whRTTbhx5/KJQNW3ngwPR3f5kgUdwtLnj09kuUoauwaIYW7FJDmPZw==
X-Received: by 2002:a05:620a:3192:b0:7d3:9482:b21c with SMTP id af79cd13be357-7d3a8819d38mr34791585a.13.1749576261848;
        Tue, 10 Jun 2025 10:24:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367733156sm1622634e87.243.2025.06.10.10.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:24:20 -0700 (PDT)
Date: Tue, 10 Jun 2025 20:24:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] usb: dwc3: qcom: Facilitate autosuspend during
 host mode
Message-ID: <5pbdk3xo6jkj7gwxlgvzdz4nxehjm6izgejjvwafxitvn6lm5p@qhjfezk3dvdh>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-4-krishna.kurapati@oss.qualcomm.com>
 <20250610110047.4yc6zjcvkobxerml@umbar.lan>
 <02bfd468-5f92-4d06-bc90-f138c5153ee0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02bfd468-5f92-4d06-bc90-f138c5153ee0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE0MSBTYWx0ZWRfX+HXkGXGC2JKZ
 Dgp2N84f/ZIlZvi38ZsjTqIv8mXccnzDiplKV0Lv60bi5hHIIaVjgrqhKKINvL8LFCAvgzzklxL
 SadJBGCkYex2Rgvs1UVBMzuDAd4OSrITl7beruTQj0VafTpbtP1Gj2ptUs2CadtSbeB5njCid1V
 fxZeC0cUN1tiv+1r5YXjx3ft1mgzbV15YlErWbEyJclr1ZMTmTv1YBqbFIa81nQy96ZfWj1pRAG
 35F66gA6TCSmN495RPe2XdloFs6NrFbNyERudTawsCzb/yV+2trBCWFBuMnnLgVaW9rjsirf+Rj
 VD+X3rSXkIQZFjql5MYoUURCd1pn4dZH1vP0NhDGgCcta/r1ItjQABbY8lP1F7OXEnO1exv0m7C
 2vKws8JqEZ3YniJOdn93i77ivU3N8AM5MPTvfPV6x54JDk4QdKVngqZ4nhDi3i0/W6bjyEnf
X-Proofpoint-GUID: n3Pt3t5YJ72BvzeFA_YdqH0eTs8MKNEW
X-Proofpoint-ORIG-GUID: n3Pt3t5YJ72BvzeFA_YdqH0eTs8MKNEW
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=68486a47 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=yhNm8lLqjQGDdp7WpVgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100141

On Tue, Jun 10, 2025 at 10:10:33PM +0530, Krishna Kurapati wrote:
> 
> 
> On 6/10/2025 4:30 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 10, 2025 at 02:43:56PM +0530, Krishna Kurapati wrote:
> > > When in host mode, it is intended that the controller goes to suspend
> > > state to save power and wait for interrupts from connected peripheral
> > > to wake it up. This is particularly used in cases where a HID or Audio
> > > device is connected. In such scenarios, the usb controller can enter
> > > auto suspend and resume action after getting interrupts from the
> > > connected device.
> > > 
> > > Allow autosuspend for and xhci device and allow userspace to decide
> > > whether to enable this functionality.
> > > 
> > > a) Register to usb-core notifications in set_role vendor callback to
> > > identify when root hubs are being created. Configure them to
> > > use_autosuspend.
> > > 
> > > b) Identify usb core notifications where the HCD is being added and
> > > enable autosuspend for that particular xhci device.
> > > 
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > >   drivers/usb/dwc3/dwc3-qcom.c | 62 ++++++++++++++++++++++++++++++++----
> > >   1 file changed, 56 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > > index d40b52e2ba01..17bbd5a06c08 100644
> > > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > > @@ -95,6 +95,8 @@ struct dwc3_qcom {
> > >   	 * internally by mutex lock.
> > >   	 */
> > >   	enum usb_role		current_role;
> > > +
> > > +	struct notifier_block	xhci_nb;
> > >   };
> > >   #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> > > @@ -647,6 +649,39 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
> > >   	return 0;
> > >   }
> > > +static int dwc3_xhci_event_notifier(struct notifier_block *nb,
> > > +				    unsigned long event, void *ptr)
> > > +{
> > > +	struct dwc3_qcom  *qcom	= container_of(nb, struct dwc3_qcom, xhci_nb);
> > > +	struct dwc3	  *dwc	= &qcom->dwc;
> > > +	struct usb_bus	  *ubus	= ptr;
> > > +	struct usb_hcd	  *hcd;
> > > +
> > > +	if (!dwc->xhci)
> > > +		goto done;
> > > +
> > > +	hcd = platform_get_drvdata(dwc->xhci);
> > > +	if (!hcd)
> > > +		goto done;
> > > +
> > > +	if (event != USB_BUS_ADD)
> > > +		goto done;
> > > +
> > > +	if (strcmp(dev_name(ubus->sysdev), dev_name(dwc->sysdev)) != 0)
> > > +		goto done;
> > > +
> > > +	if (event == USB_BUS_ADD) {
> > > +		/*
> > > +		 * Identify instant of creation of primary hcd and
> > > +		 * mark xhci as autosuspend capable at this point.
> > > +		 */
> > > +		pm_runtime_use_autosuspend(&dwc->xhci->dev);
> > 
> > This feels like an overkill, using notifiers to set autosuspend flag.
> > Please extend platform data and/or other static code in order to set the
> > flag on the created xHCI devices.
> > 
> 
> Do you mean modifying pdev of xhci from dwc3/host.c ? Or adding the
> use_autosuspend call in xhci-plat.c ?

The latter one.

> 
> I thought adding this notifier would be a better way to identify when the
> xhci probe is in progress instead of touching pdev of xhci device from dwc3
> layer.
> 
> Regards,
> Krishna,

-- 
With best wishes
Dmitry

