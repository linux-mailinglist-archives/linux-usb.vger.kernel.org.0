Return-Path: <linux-usb+bounces-25850-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D75CB06580
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 20:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 407E61AA4758
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 18:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5073291C3C;
	Tue, 15 Jul 2025 18:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aG1/hpIH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1A5291873
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 18:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752602528; cv=none; b=Doqmq4Bcj3Ev8iabOU64qlPjKDPJRgwGwcbK1zO9qsZTVp1UgJ1hKcUvbTOuzhW8GKB6T7LzkIV0Hh9ossdZPsIG52ovGDbQmlksU5gBx9FIXafvHObD5r7kATaY7MpQcskHjzKAyn0OsNHjoFpScPjwdB/Gsj8w3OAcT4/6Jwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752602528; c=relaxed/simple;
	bh=cD6ekhB8hSQ7tGjkPWrprv+pbrgyURdbpYaoR+lgdFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiuL6nSUCV0vNGAJR65VKK39XZWT4w/i1PP2rJGSKda3nhbbPMXubzcC/sIP1nLMuB0po8VDkoJFaA1jWFz9fu6M845GdBt/2xQMJ4XMeN+7zMZTw3J3CKLmJVrqD5zz9gcuR2iiTuvdqT9TKqtYn5VTCGUWO4KpLW6X2E4weVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aG1/hpIH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDH7l018057
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 18:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K6mo67nJeO4KAf1LYP8QekR3
	w5EhbEb1kSpHda5Bk7c=; b=aG1/hpIHM1mntA5L//114BHhpyVaS3JbUCp+36cd
	SsGhKa9mxdsKCu+3KVr/jzVO3fcTKciUxI44u/mRkgTXO7fzig7N8K4SKeHvIqs/
	TK8VXaRXlGFS3eXm9lN+RbnFJ3AHxSzNKtd3jEP6h2FEOwELbe1ymUPwWvLmmcIU
	xbsVUHIT5jqnlBubMiB0aOzjrCgwzdYxXLb/S/u8cpL5YcahYw0aJJWRLkGjsH7d
	tofwBo3X+2mw2qfEULUV94QY7/zHHZtuZuVJODwRnTMkY/UJvlfF9YQtyEatk163
	vaUHgiWa+ojyjUuF3n4JPZ5lyxmhbWLRtlgcLbTAZY0ESQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug381b24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 18:02:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2355651d204so55873875ad.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 11:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752602524; x=1753207324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6mo67nJeO4KAf1LYP8QekR3w5EhbEb1kSpHda5Bk7c=;
        b=VaflOmrqaiPIYOjAPezzAc8J6nugFDIoPwliKIRe6y5qeFtGIMMHln7fhz0m9QG+R6
         uuKUFPIl/7rYZ7dRVTI/D+RQmScw6MzM0OIyE9XJ+7XR5V9L0+L+tR5zR5kJgo12U5/i
         PiVK2G70Tw6Tj0JZoUx/LNFoPXmS0WhdkWR3xJKhX4tvSKgkFUbxs2MoRSkwvqsyXWEy
         5vdwpkHdb0f2fLm16eXzZZg9wUnnEvfaVWV8MEZOo95Fo+1LwraEVK/s5gP4Gh1Es/8C
         PwW/DmIr8ujejU4hWvRmLdw+4/RHOyfjzTrQvUtN0nxLSs+gRH2dvmFFnPRCbhHStV8+
         gMNA==
X-Forwarded-Encrypted: i=1; AJvYcCX9sxry9Ob4B4xgzoe4wukXXLmJjTLWr+nCV/J0bKVtKsIEfZxX/MGXkAwJ9u49gFzqFG2c1ymlrpg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8WYAJWpBVKljAQzcRDXJ0nuDYc6DZgKZzlSDff+rqtZxd6LDg
	1nYxT49XBsrfjLKeYIw1kw8SJxLDHXK8z3kyPnMbDOBvu7b9jnJtR3pnuqkl+Zq03xyu+nq7cD7
	tGBZ/kJilS9iF0/MkExpHC/SXm5h8dSEI86opfCQZa92AF2R5IG9s/YLFIG8/VKE=
X-Gm-Gg: ASbGncugfMXjRf4znuJatHFzNtST6xacjkz9Ua8d33oaWuWk/Kc/qet40RHzSBsjp12
	WvfpjSZcHq+8I+Y6ggwK7SBxI2abkjP0rHRp4cvoHWXr8WmXMd/JmaKrtxBagPbhee/eQpfZecp
	7R6/gfu5b34rPsPWh+SHHZCBw8vAPXjeLS0Io2vS2VTT/IgWo4ish9uo+iT3RnlWu85QEwBrXEE
	M2dqeWvmeUxesHA5V9UnO1pdJrcQQY+072Q3Xkpu5fDp0ny6M4f8alrw+KSShKVlOB/RkflXOeR
	xhtYVjW1u6cxX/hcE6ucEAxZqVvHG2kjo85P544VnzaHoUYNPPJcumYcuWmSUSBTULi7UpuXxwO
	n2aSVK4TLYG+fEnJrb6p1mtKx0e1SYp5V8/4JHhBJflKW72t0VGor
X-Received: by 2002:a17:903:189:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-23e1b03a4e7mr56603725ad.0.1752602523927;
        Tue, 15 Jul 2025 11:02:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa0R0eUK09CX1ZPe3FlchxOBqEKUBDbKkYIiXgDyJtD8NdGywD3J+Ab9FcocEpLDaL0QBm1A==
X-Received: by 2002:a17:903:189:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-23e1b03a4e7mr56603105ad.0.1752602523425;
        Tue, 15 Jul 2025 11:02:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b713a8sm2363064e87.194.2025.07.15.11.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:02:01 -0700 (PDT)
Date: Tue, 15 Jul 2025 21:01:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: dwc3: qcom: Remove extcon functionality from glue
Message-ID: <arp6ujd3463lzrpi77e6sb5mwie3uzsyzildct3hkgkni7ozfb@zxomg4beii2b>
References: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
 <2025071518-aware-tipping-4e27@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025071518-aware-tipping-4e27@gregkh>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE2NSBTYWx0ZWRfX4iZVnncTigA4
 lzc+uykiNSUi2s9gI3/Bok+g202qhvqYEmXrXa3KpsgT3HoinNFSmYGcRIGqCSi58wHMFNoWsPH
 iLno6Te5Irl+iO0SwVDPXetfwqu/SxM1UzUBsfaUEI7RgrV5t38s9vA52fgEMlIIkW/G9yd2bqU
 cN2fws/5O6m6Tj5CdRruKCZF2bK79HgBUslK6gxUw71pEMJtwbYNDEzSurO6YCe1cPRALkR2OPT
 tVFK4qe64eYC2AWh8GM9/W5C5+JDXYFzdlPuwvmyjlLbeNbkI2oPvV6FQuS28fElDJr9yvvfLZL
 iGywjvPZwbdi/9FubeFlAWTcmcUaJyABfw4bkRtQ30bIkrzCAysIJmnMS5V2vBQfJUHr26PM9wm
 JXO0085bzTD3qEzx8VQK6sBPQbyDSrq8m14Rr047fFMEHpzoO9U0O0gQlVM0pxndVNoRGDnf
X-Proofpoint-GUID: TlmP5DdYrVYVViq9N1k2Btf8R590MuC6
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6876979d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=x7q9rPTPxxJoaMhJE5IA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: TlmP5DdYrVYVViq9N1k2Btf8R590MuC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=993 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150165

On Tue, Jul 15, 2025 at 07:47:20PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jul 14, 2025 at 10:17:02AM +0530, Krishna Kurapati wrote:
> > Deprecate usage of extcon functionality from the glue driver. Now
> > that the glue driver is a flattened implementation, all existing
> > DTs would eventually move to new bindings. While doing so let them
> > make use of role-switch/ typec frameworks to provide role data
> > rather than using extcon.
> 
> "Deprecate"?  Looks like you are just deleting all of this code, what is
> going to break when this is removed?  Are there any in-kernel users of
> it?
> 
> > On upstream, summary of targets/platforms using extcon is as follows:
> > 
> > 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
> > effect on them.
> 
> Ok, so those are fine, but:
> 
> > 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
> > driver which relies on id/vbus gpios to inform role changes. This can be
> > transitioned to role switch based driver (usb-conn-gpio) while flattening
> > those platforms to move away from extcon and rely on role
> > switching.
> 
> When is that going to happen?  Where are those patches?

This should be better explained in the commit message, I agree here.

Krishna, please point out that existing extcon platforms use legacy glue
driver (due to using legacy DT bindings), while this patch touches only
the new ("flattened") DWC3 driver.

> 
> > 3. The one target that uses dwc3 controller and extcon and is not based
> > on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
> > This platform uses TI chip to provide extcon. If usb on this platform is
> > being flattneed, then effort should be put in to define a usb-c-connector
> > device in DT and make use of role switch functionality in TUSB320L driver.
> 
> Again, when is that going to be changed?  We can't break in-kernel users
> :(
> 
> thanks,
> 
> greg k-h

-- 
With best wishes
Dmitry

