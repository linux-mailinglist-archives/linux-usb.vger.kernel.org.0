Return-Path: <linux-usb+bounces-24676-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD83AD409C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 19:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F83317EB59
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 17:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B83924EF88;
	Tue, 10 Jun 2025 17:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jzJnLnN3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61D52459F2
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576206; cv=none; b=dzWLKVgNNP83rNrJR++YI32k6f3YdggCWraLzHjxux98S+Tz6G/S53aBr8xxdl0QOi0iwRvyTTxTJ6Sfy2TeFWdJFkGHXjB0v8u8t2ATpltDQwthPxjCYIsSbwXzB8bjOM2mzKBvdCdO9JNoAdabk8hLGxDLtWkE1KCfESETTpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576206; c=relaxed/simple;
	bh=CrHjv8+FliCkKij6pchH5GclhBXNk+Zv1FLg/wN+vjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGsgo3FbiBsh2jwLErQ8ft2mvTLwViVG9p0EdV/LjBXNTXBuVHWpYVKFplkI5X7elPIX3U62Raq9+8OZIQDtBOIO1zR6knPcBV90zy6L/l8uhK3PqUISvXJFQc2NKc4wfAU22CVmyAeHeEobFxzM1gx35IW8ivYnlLj2lq0q+pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jzJnLnN3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AEo6L2000796
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 17:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j8m/+/ge7/FMBMM5Zz1Lr2eW
	mPr1EQ1sZArqncuixgo=; b=jzJnLnN3AQOtla7exJkHRyGXSMCuT6gfTTSDVMCP
	Jb/JTVDdGsvDK5EfJCzis1w1NkF8vNEz8foGSve5trO15hk4zmVHrkw9YqkzXZI7
	BIWLcAJUfimiy2KG15W44s4uaedW+ixQeA/D03J6H4LJ/xBaGNT57NNb7mPspN+V
	DFKDGnT7V2OJfJBN2Y1fbS8nEsD/acgonCLgx95bRElx0FF/cFIbbhNc47eYSGVP
	QSt1Xa3beVVra/hJMfBE/DC454eUn7g8KfYxaNDsl311o+BOP0Zj0B14bQ+sbYs8
	8Ess+Ngarz5tNaUuxcGuooVOl+AbtqlWz0MWz/P1VUg6LQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tcxpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 17:23:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5cd0f8961so1037006585a.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 10:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749576202; x=1750181002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8m/+/ge7/FMBMM5Zz1Lr2eWmPr1EQ1sZArqncuixgo=;
        b=LYnoZBGJEoa4VTb0OvLqiflZne6nr5mzlKwXWNv2WkiCrmn5tHNa2J8pxTWRGqWVAD
         CpzHJcPd5bQ21I7V3XY80wF44Lcj7fa3/rzd5dHA11IwHKNtz8GQTR3TT4S0T0fBPscS
         wjDGYGmm6iU5Pax1fp/TeksMv9ihFOeHx6y3lHBm9p8xQxfj3I89Tscv/roVFh3vTbR5
         vN+gL8LCzT4EWiHW71kp8vMql/yLLnT+dUoeACpf3YqBLsHpbCLnQQpKCrkT9QI2RExo
         X9/l4YDn09CoswrYsOM4JTR37lKkLbYbowwQhQZaG6ehX1dOmY2TlaLr9BTwww3FqksX
         cLhw==
X-Forwarded-Encrypted: i=1; AJvYcCXi0Eh9Ef+a11QugdMkIGSn+A/d2Li3P/wtIbtXapYrvFHY35gmPJ/xioX4uNC3XpH3X4Al8o+StBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmfvwQBn5siMoTbrdAi39Wvv7qVLYpZOF2s0E7gLo52qOCn8KH
	iqLhaEMpCqnxWhUhDnilZioBg38Hhk/r1bq47kFsVXOfx7zC83fsutaVcMO/yI80yOeDAs+UzYQ
	c32bZ/70YL+LC+/xLtkV7zXMNKPzmQPXM1ghUTUNUco/M4lAZq+rWjumusPBH2LE=
X-Gm-Gg: ASbGncvbQuPJjBMMtxzuemjLqmvwMlKr+Pwta9tMCdFpPZIW9lIhBiKTlCGvEmUPD6G
	s8P2llNHiOargD0HW+8AQIbQaxotvD+1bLcB5ilCy9zTGPADktAxeiNkGt7mLTpRJJF+QMgFlbY
	oZfczeCzPAj1eh57AvYDr8cSvCWdyuRtt8SB/4R8TdHYgjWw6dr/AwmOwCUsl223oiPUgjaOqos
	V7cW+z/8Rlu4GC7W/eUI7S028cI5ZWzs7zoi75gevpc2E1HWmhZJ731hmI+D+iNKU3KahD8tWT6
	/S0IICq6IRrw5qF+NZHyyt0nE1D/76Cs2SHkbeMIGrdcMRai92FtN/CiRYdWnNw+6AgKptyg1eP
	TBKtKSlJpzob9/WFeXdnoHcx+UNtThQ4vZkU=
X-Received: by 2002:a05:620a:2697:b0:7d0:a096:cf80 with SMTP id af79cd13be357-7d3a888e055mr32498185a.31.1749576202256;
        Tue, 10 Jun 2025 10:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHN0PxzkvuqH1TCV1n3E+M2ROth6uwGEKPKCYKjph+8DU1Styao4lHQ9jN18yyZpzx59sejKQ==
X-Received: by 2002:a05:620a:2697:b0:7d0:a096:cf80 with SMTP id af79cd13be357-7d3a888e055mr32494385a.31.1749576201840;
        Tue, 10 Jun 2025 10:23:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536773139csm1622912e87.208.2025.06.10.10.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:23:20 -0700 (PDT)
Date: Tue, 10 Jun 2025 20:23:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Message-ID: <shpn2wf64trpnulc7dsyyc76mafeila3amxl53wh4ksmtv2jte@3lccqv6wz72q>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
 <20250610105812.jepct55ic5snglno@umbar.lan>
 <aaeafb33-9897-4f47-b4f8-4b92885c3795@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaeafb33-9897-4f47-b4f8-4b92885c3795@oss.qualcomm.com>
X-Proofpoint-GUID: 7eljEEhvwzuIkkfQOsUmVsooqJ9O30d2
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=68486a0b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ba8jTNeHwYO7qFVAJGAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 7eljEEhvwzuIkkfQOsUmVsooqJ9O30d2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE0MCBTYWx0ZWRfXyfwJ72agdu/9
 s6TrKfihUJltY6u7LTsIXFi2IPXWCpKITU1SNl8OLRqv3R38LADOSpYZZtLcLUmAurzUwmMr5uN
 r/kdvCzq2gAsYzHWqMtDRLIHxaUZQAL684o4oEMUkjs+kzirx+x38VlX1fKY48IIoIZgCM+Tk4n
 Qg0pxLMhkAS2VjEU6+fToZK/tDQiOm170N0FEpUdHNemqPviBCmCBdMX2ajeJW25nn8BwYuOHuy
 ZEnlgRHAfKrcBhz1ekWQG/XgAQ21j6ghNO4d2dRNmgzar9v6pcMpqXf1JJ4w8lNd+UioxoI5WmC
 80FzxrVO9BGZhbDHakdrcCv0sizgyVV4zmkFPVkoJQeH/tZ1bp6iyoajz8fqbIEIzqaPFEu0F9G
 eXSKY04amCNsV92pwg9+P1laWqlZLx+a8ZCyiEMfUt7xokSciz1/5L1qkpczej5vSm/0gix1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100140

On Tue, Jun 10, 2025 at 10:06:24PM +0530, Krishna Kurapati wrote:
> 
> 
> On 6/10/2025 4:28 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 10, 2025 at 02:43:55PM +0530, Krishna Kurapati wrote:
> > > On Qualcomm DWC3 dual-role controllers, the conndone/disconnect events in
> > > device mode are generated by controller when software writes to QSCRATCH
> > > registers in Qualcomm Glue layer rather than the vbus line being routed to
> > > dwc3 core IP for it to recognize and generate these events.
> > > 
> > > UTMI_OTG_VBUS_VALID  bit of QSCRATCH_HS_PHY_CTRL register needs to be set
> > > to generate a connection done event and to be cleared for the controller to
> > > generate a disconnect event during cable removal. When the disconnect is
> > > not generated upon cable removal, the "connected" flag of dwc3 is left
> > > marked as "true" and it blocks suspend routines and for that to happen upon
> > > cable removal, the cable disconnect notification coming in via set_role
> > > call need to be provided to the Qualcomm glue layer as well.
> > > 
> > > Currently, the way DWC3 core and Qualcomm legacy glue driver are designed,
> > > there is no mechanism through which the DWC3 core can notify the Qualcomm
> > > glue layer of any role changes which it receives via role switch. To
> > > register these glue callbacks at probe time, for enabling core to notify
> > > glue layer, the legacy Qualcomm driver has no way to find out when the
> > > child driver probe was successful since it does not check for the same
> > > during of_platform_populate.
> > > 
> > > Hence implement the following glue callbacks for flattened Qualcomm glue
> > > driver:
> > > 
> > > 1. set_role: To pass role switching information from drd layer to glue.
> > > This information is needed to identify NONE/DEVICE mode switch and modify
> > > QSCRATCH to generate connect-done event on device mode entry and disconnect
> > > event on cable removal in device mode.
> > > 
> > > 2. run_stop: When booting up in device mode, if autouspend is enabled and
> > > userspace doesn't write UDC on boot, controller enters autosuspend. After
> > > this, if the userspace writes to UDC in the future, run_stop notifier is
> > > required to enable UTMI_OTG_VBUS_VALID of QSCRATCH so that connect done
> > > event is generated after run_stop(1) is done to finish enumeration.
> > > 
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > >   drivers/usb/dwc3/dwc3-qcom.c | 82 ++++++++++++++++++++++++++++++++----
> > >   1 file changed, 73 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > > index ca7e1c02773a..d40b52e2ba01 100644
> > > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > > @@ -89,6 +89,12 @@ struct dwc3_qcom {
> > >   	bool			pm_suspended;
> > >   	struct icc_path		*icc_path_ddr;
> > >   	struct icc_path		*icc_path_apps;
> > > +
> > > +	/*
> > > +	 * Current role changes via usb_role_switch_set_role callback protected
> > > +	 * internally by mutex lock.
> > > +	 */
> > > +	enum usb_role		current_role;
> > >   };
> > >   #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> > > @@ -118,9 +124,9 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
> > >   }
> > >   /*
> > > - * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
> > > - * validate that the in-core extcon support is functional, and drop extcon
> > > - * handling from the glue
> > > + * TODO: Validate that the in-core extcon support is functional, and drop
> > > + * extcon handling from the glue. Make in-core extcon invoke
> > > + * dwc3_qcom_vbus_override_enable()
> > >    */
> > >   static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
> > >   {
> > > @@ -641,6 +647,53 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
> > >   	return 0;
> > >   }
> > > +static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
> > > +{
> > > +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> > > +
> > > +	if (qcom->current_role == next_role)
> > > +		return;
> > > +
> > > +	if (pm_runtime_resume_and_get(qcom->dev) < 0) {
> > > +		dev_dbg(qcom->dev, "Failed to resume device\n");
> > > +		return;
> > > +	}
> > > +
> > > +	if (qcom->current_role == USB_ROLE_DEVICE &&
> > > +	    next_role != USB_ROLE_DEVICE)
> > > +		dwc3_qcom_vbus_override_enable(qcom, false);
> > > +	else if ((qcom->current_role != USB_ROLE_DEVICE) &&
> > > +		 (next_role == USB_ROLE_DEVICE))
> > > +		dwc3_qcom_vbus_override_enable(qcom, true);
> > > +
> > > +	pm_runtime_mark_last_busy(qcom->dev);
> > > +	pm_runtime_put_sync(qcom->dev);
> > > +
> > > +	qcom->current_role = next_role;
> > 
> > How is it protected by the mutex? Which mutex?
> > 
> 
> I see a mutex lock in usb_role_switch_set_role() that invokes set role. I
> think that should be sufficient here.

Please add a comment to the source code.

-- 
With best wishes
Dmitry

