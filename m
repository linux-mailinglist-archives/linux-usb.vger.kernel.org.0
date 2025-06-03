Return-Path: <linux-usb+bounces-24451-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBACACC486
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 12:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC3FE16782F
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 10:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CD219DF4A;
	Tue,  3 Jun 2025 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlcSe1b2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EDB221F06
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 10:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748947033; cv=none; b=kPicR98Rl1pyrPE9paO7looTyTQ6VQxtNUnH9axoHIhRDaWfg9z3BEj3ciBwH5Irkjv3ZQgOGduSbg1XNpPp8M+WDVlE+v1+5i0/xSH4DWcn6Se29oT5ZlowQVGMv3tnlGENIWjXaZNZTUmigt8D8wSwxBCik6IpGrUYreZWwiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748947033; c=relaxed/simple;
	bh=uqpOJv2wigJPKhBBU0tlE5lRcyIvfno4JsOZUYts/FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mk+ntwRJAS8b1iGy1+EPZKIGKNH0We3pNhPGtvo/ZJ5EHrdVcJ5cC37IVHST4YOHe2gO+Y/au8DqCqkFXgf0pvwm4zpplPbT1MXn3jNUSVCdblDCUZInOBfym9I+dJtXYFaTN8fCMcYEP2FVPhWfs8iMVAkKziZizDIWCrruo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlcSe1b2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JHg5000708
	for <linux-usb@vger.kernel.org>; Tue, 3 Jun 2025 10:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9uWNnzZMN7gxXGGetcBuxHkVFtdiwfBWdURBEwcqsI=; b=hlcSe1b2m80sbOH+
	HrmJDeiCebvVITjj3d/gHYyowy3NuP8JYUV/BR5d8mbbzf1KTrwRKFRvXBzzL8uv
	HrhbhuseCaIT2KZe4HGcmug2znR5CnaNSW7jRx6v4bcAO9He3/4vmow2zhOJHBWR
	mZmkryhInHOTzytu69Vh/R0rsIhRX5ta/bM31l5wufZUzxvKvH4Uafjx0XhS9p4A
	Y8jCnyLguivFvriquzrkWchJZO7/c92KkacJ/py5QD8onnTTmI3+OBg5i9LMqcMg
	DX2MnNFuXPgLHNQt5SkdcuIR99f4AANY9XAoSetwDrpq1EVR3I5HxSIOTo6RbqRG
	LPv4bQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q2a1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Jun 2025 10:37:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c9305d29abso867383385a.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Jun 2025 03:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748947030; x=1749551830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9uWNnzZMN7gxXGGetcBuxHkVFtdiwfBWdURBEwcqsI=;
        b=TIKR6H2rFHTJH0KGAO6ZoH36HVb0dB64cX7akSTuUEp3fAEwK17rY9MQ4T1eSVP5mS
         cBzHKcT+FsajJGU2OdOBjzy+DnlqgiFeqqORD/2qEO9+unrstI3I3dTXlqupNTRaHxo4
         VZgMS30K1GXlZtDYC9dO82b6zcfjGoHbJWHR3WEttBMOn8laqJmsCpRD56msOuCgLrcd
         jJYkJSVUsCiDeTQN6LlgdjDuMIjVJ+c7mz78Jn8/4oIX9//El/nyEXBYTNDhrjyhvkRh
         vxv+bkZe8K9Lcv+zAvwh+llA2nv6CimyXbCFC9LDuEoPuHG8y0KIwRGFHCd6ndMnQuMd
         M3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWECZx6zp273uvxfkzrOPMofu9t+W5S8/LumL19TpNre/ZqTDRvQZfD60CqYn8cvPl9cQ7qjxDrbT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBsqtmsD5KI1ARXDfk4OP3kjcQ9JC8v1nVno4EZi6SnpF1drj8
	yFEl5rfeVFxOtwYWFzByJpAeCvCp4+ULzkNOqQ02mBiA1/sLKXC9GqttGWbuD20tCIT2LiqC/dD
	JY1NT+yxw8+X1YLtCX9E1dW7OLPbhRmH2T9kjeQBJItBvlpHsgoN85hQRrdT/ZvQ=
X-Gm-Gg: ASbGncuKK2VokF7W4Qvg6al7rRDGUQzwpcKJiE9JnFf0c6dvJMM9qOVG8nZ11i0FGXX
	xeuWlcDvvPhbi2L+9kZt5oQAnpS1WlVUI6ml5SDAMclt7tGTYVEfHbfACKo+i4MwqaH0wyUhJvV
	WCR4xgSZ2r0h+s2pBvRSQZMy4cf9NUrc4jLwxaly6CR3sBFsZmcFnlyU7Scj71EKZCnfDJq4pR5
	4kP6O4Wiu/k/YvuOiSG/x+u+yNts1+/HN0pgEDJgmLn4prplm0bCOwX70jSAyPHNk7H92xV+MVi
	6fal4A7IQJKZjQB1Dyvzo3PZSnlERkSlaWEsHUn3dfTErhY8g7VTuTWvYa4eZ2Cwif/D+ca+uod
	6ME6RITU9Lw==
X-Received: by 2002:a05:620a:3f85:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7d0a203c941mr2733684485a.58.1748947029997;
        Tue, 03 Jun 2025 03:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcaWHfUMt/J84blqUHOVj38V1G/bCnq6PQ19HYI5oXarRw/p2CQ+daA0/OPAIVimxK24L/Xw==
X-Received: by 2002:a05:620a:3f85:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7d0a203c941mr2733680685a.58.1748947029464;
        Tue, 03 Jun 2025 03:37:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a00d8sm1888642e87.82.2025.06.03.03.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:37:08 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:37:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: =?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
Message-ID: <5knsdgk7o5zifkvzlrqiplmhztnsyhlxnqiuikqf4l7wkx2qvh@s3vzkiezw2bc>
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
 <8bb3a056-c00f-4ae0-a790-d742d31f229a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bb3a056-c00f-4ae0-a790-d742d31f229a@oss.qualcomm.com>
X-Proofpoint-GUID: 3nFosLC2IVcVODWrzh53e41A0PoySKmj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5MiBTYWx0ZWRfX2BkDdsGi40du
 L1saJ1k6Ln/y0tQ7tfFM/A7r1jn3oSKcfZyQpVXkYY9k0rPpbpaogvxoLwVdfW7cSwMKNUYhBHw
 0Buqx9gDnEQ8peA3Red04zs5yKLh05qsOJwAZ5aJdAdYMSOu0jjXxvDQKYmlsYRIZR7WW+fHSat
 7jO3/eYpIWFka6rzChhSE8nKaHWx21pYLvz2YE6oHJIANs+qQ4sNLSWmp2CV98ZCEFWFBGu9HlM
 +uNnE9urirveR6Rh952zQwjnbnG/3FzIto3c/n4bpt1jD6QHQiupN5btxgs8YKQGGvdMgC/b8h8
 N3E5102/n3oSMSYvllmQaV7y2hPgXX5D7LHq2R7F4CbMOPjcZ8YOfyOgFovGN5KoJmmjAjZVZz0
 EGdFsRrJm+0eflUzJgoW9HmFEXduQ6aK3fQVUwTbFXTorskq/ctEMlmbRVaFuyPWXKZEXuAx
X-Proofpoint-ORIG-GUID: 3nFosLC2IVcVODWrzh53e41A0PoySKmj
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=683ed057 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=DVxyIStym39DqTwfPQkA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=681 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030092

On Tue, Jun 03, 2025 at 01:48:11PM +0800, Fenglin Wu wrote:
> 
> On 5/31/2025 6:36 PM, György Kurucz wrote:
> > > Add charge control support for SM8550 and X1E80100.
> > 
> > Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting works
> > well, I finally don't have to worry about leaving my laptop plugged in
> > for too long.
> > 
> > One small thing I noticed is that after setting the sysfs values and
> > rebooting, they report 0 again. The limiting appears to stay in effect
> > though, so it seems that the firmware does keep the values, but Linux
> > does not read them back. Indeed, looking at the code, it seems that
> > actually reading back the values is only implemented for the SM8550.
> 
> Right.
> 
> Based on offline information, X1E80100 doesn't support reading back those
> threshold values in battery management firmware, so I can only use the
> cached values for sysfs read.

Which limits usablity of the attribute, it is now impossible to identify
whether it is enabled or disabled. Is there a chance of fixing that for
the X1E80100 platform?

> 
> > 
> > Anyway, this is just a small nitpick, this does not really affect the
> > functionality, and I would support merging this series regardless of
> > whether the read back values are always correct.
> > 
> > György

-- 
With best wishes
Dmitry

