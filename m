Return-Path: <linux-usb+bounces-28148-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B0BB5932A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 12:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10E5716786E
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 10:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FE83043B3;
	Tue, 16 Sep 2025 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYodLLOu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FD0302173
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017814; cv=none; b=MOgorj5lrr4uuFA+Qe39C1LCup1yFLAEeXW9EKSOweO6rxqtcp2zj+4gm6HympIe3Lqi6Ukanqrl3un2QbSsDvsVJQrmvs78x6R9NJvXAEqA6808HUPQmdVOan9Y1Elo5Cd7QWa63FwXI2DJg2i0ftUKLEIQhK3vH0dx/K7a0y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017814; c=relaxed/simple;
	bh=ZZTjg3nESIJaMyExBV/VDYlLd9/ybfakJ0TFBxehk+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=so/UTYsN8JMbz00z9pgNaSx9KU4lGJIpDQgFH6aNM7LqfmVIr7xnf3vZRi+n0q3YwXqX0Ue3xfk8rcdyet3NY8OxmWY8WSXyINJmoKtvYX133XeOPH+nOsvyUfnoy26NqxOpL57btsAiAzTynNKeigUgBos5383KccmfPbvg+uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYodLLOu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA47xu012514
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 10:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r5q7Ptg3IDb5aGHpR/B6NYC/
	GiSBXmLjKmkevafLTeU=; b=pYodLLOuHd0OOa+UEZZOQmlXHdy2260fWcB/BarZ
	pU9PIakrNMRjRQLY/sl7jxmSYEhDUPyoywnz/SyHYlhFQkNQglWuQnApultaGt73
	LkNiIVNx+A2cX7rHHmFFcEiECUU7tKU/VJ9FaTH8m8kvc4FMyLD5prt4ela78Z4O
	kd/70erhbgDxLBGizdkXpvOu/v5DBMG0574a4gTHZbJIqWunXiFnJEGnwp6akdqj
	bLn/W0CnGL7oaDc5/dTGoWLRwGc4BdmZy872Bhof0tvig/UglZpZmPQfv19JQ5C2
	XCqlHJWLGFi0VmeaK6dGISzwDmjAo4D4LBvYb2vHJ6HwZA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g12m4ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 10:16:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-770c244004bso68227406d6.2
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 03:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017811; x=1758622611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5q7Ptg3IDb5aGHpR/B6NYC/GiSBXmLjKmkevafLTeU=;
        b=WnwvJcoIOsw7r68ADThzPjbTfd6exABgg9yE4Dohc9T4tPNELs/Iim/yUGIONcg7Tc
         dTLz8BbkAgDq2PR6qKdmjlRZgCO3UbZmRJCxd039Z+5eM2LJoF9RO30Q93uiVt0mfrTH
         rwR5uBfS0PLNNM4pUs8I+q96iZlqKBqkbzC6t2aVN3tQXJBMZbc90mDjBIbk2k5hSPbu
         jaNM7AmYPb3lfEXi0KlYe8wm4GC48RQSPzKQCTSJpAyTDSg1fWzDWXmSAQXCm3JvZKgA
         i18b4V3CmaHq+ctlV819ldal1Tp+5y9b1xdTGETIVRmqVadzxDj4xkxQF6Xe80P5LHUs
         D0zg==
X-Forwarded-Encrypted: i=1; AJvYcCUzLKrz0ZTQDvfTO/JYBZnUVsE6kH5GBTDJwuSRKhd9rpIhXLyra9zOyttxOGibd/0FL7/2LKvYBwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYAO1/hj/vlPZ6bhkMLGMm2trNJPcaLdUjoskujByTRugdOCgp
	KnkJ7oEV/CGRESqfwG4HYyT3794DSwCV6zqYgaC4c0Ys67/+KdkVG0E/xdWk89KslHGDUBTFDzA
	gkuwX0JNG4AJ7K17TJoyzM9LwW6LmyMS93E3Y1HhGx2X2lTaCArJTDvyx+d0iDcI=
X-Gm-Gg: ASbGncu/FrZxuVoy8lj0yMIiXTFfpy3RkvwRKjrGY9jZEEFYeQq6q9gL+LrJQG/AwUm
	AVQZcTEsv/vbzeWwjLR6yEicsWekVeOQn/FoGLvnu5P45KEy/ePaLf4dqsB6g+GpmGK/Dn/eVJ6
	sRz5I0nDtawSoN79ZS0zXuq9mD9+34rMuqn/7U5zB0aScRdAQiuStXlkpYh+5NqtEOLgKSD9HAR
	k0qg13vWcISzc/9OLJaorSHCJ1fbwUNgnb1Z5s0WJHsaXqW/+WdnNxkjpCiS59x7t0BNhv8wmOl
	/zmXdSD6fBfkWdUw8Ho/C1xBzdzej5BaqV/3Yv9Zei7H18Q5Kli+i5Osf9OculWPfRB3GOZaIl4
	pidCAVuAZ+2Zd+Ek/mM92tGAilseiq+yKl5LnEM/BGzvseHNG/FFh
X-Received: by 2002:a05:6214:4287:b0:76e:7c27:f03a with SMTP id 6a1803df08f44-76e7c27f5d0mr62114106d6.24.1758017810593;
        Tue, 16 Sep 2025 03:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyThvaMCTHqAaC7s4keMOJ2X/m+LlZYzRAuUnW6jCYfwPDs8ID5mqt+pz5VEB+vkErkc/XZA==
X-Received: by 2002:a05:6214:4287:b0:76e:7c27:f03a with SMTP id 6a1803df08f44-76e7c27f5d0mr62113746d6.24.1758017810098;
        Tue, 16 Sep 2025 03:16:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e65a32f66sm4186723e87.138.2025.09.16.03.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:16:49 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:16:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/8] power: supply: qcom_battmgr: update compats for
 SM8550 and X1E80100
Message-ID: <aiplezjbovtaghgblua5xj3rag5kjwzt6sjrnygzbez5dtaxm3@vn6kwmskc4e2>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <20250915-qcom_battmgr_update-v4-5-6f6464a41afe@oss.qualcomm.com>
 <f3s2srlmvuj7wmh4rndffmbfrzylbuq4rsu7pqqrnqa5fgsmch@t5f4dgmqtgys>
 <c5e3ac07-e91e-4c9f-9256-497991b75200@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5e3ac07-e91e-4c9f-9256-497991b75200@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SateuC1n9Ppa4PHlXV9rNAu3uCBJGXSx
X-Proofpoint-GUID: SateuC1n9Ppa4PHlXV9rNAu3uCBJGXSx
X-Authority-Analysis: v=2.4 cv=E5PNpbdl c=1 sm=1 tr=0 ts=68c93914 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=R-MLo3Tlqdaq_EXOKnUA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX80g1R2Wu/yKF
 3IC7Lb7xPm59lEhGfDZcDCg1k6MPfPZkUmTni2d27jSBlGHxAXfwSGDjBHdvw1sToC5/WH38EZZ
 Beiqb0UI0WQPGTGPbQSijsnsJcaUSFxIWhOMQPUFAT+cAvMdn5mnaSmhYtYzvwd7b6AvvmqNLBS
 IqTurHFY0gZiwPWaWGSFW3MdLy1IpVRKuvRSlzKtsoAVQXgXOHSKGUvr9GUuSqpkUMNUImUHSu7
 tH+8hCUdNl6VzHC/NRR02YCoMDnHVtDjAX6OA9CJzW5rR26VFKFZ7sFgoMWour34yEBYSgE30zs
 6de9dR+YgSfwapf53DlVkNUh6X1FlUgvv3ac3B8uDU8e7PyR/usFnhJMpcoQfeAOgzZYJtXkIKe
 HkcgdzdM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086

On Tue, Sep 16, 2025 at 10:40:03AM +0800, Fenglin Wu wrote:
> 
> On 9/15/2025 6:19 PM, Dmitry Baryshkov wrote:
> > On Mon, Sep 15, 2025 at 04:49:57PM +0800, Fenglin Wu via B4 Relay wrote:
> > > From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> > > 
> > > Add variant definitions for SM8550 and X1E80100 platforms. Add a compat
> > > for SM8550 and update match data for X1E80100 specifically so that they
> > > could be handled differently in supporting charge control functionality.
> > Why?
> Is the question about why this was submitted as a separate patch, or about
> the need for the change itself? The reason for the change is explained in
> the commit text.

It's not, and that was my question. Why do you need to handle them
differently?

Please always start your commit message with the description of the
issue that you are facing.


> As for submitting it separately, that was done to address
> Bryan's comments to split out the compats changes. Anyway, I will address
> the further comments from Stephen to make the change bisectable.
> > 
> > > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
> > > Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> > > ---
> > >   drivers/power/supply/qcom_battmgr.c | 7 +++++--
> > >   1 file changed, 5 insertions(+), 2 deletions(-)
> > > 

-- 
With best wishes
Dmitry

