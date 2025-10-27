Return-Path: <linux-usb+bounces-29691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE7DC0DFE8
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 14:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 47CB44F47AF
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 13:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146F728152A;
	Mon, 27 Oct 2025 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="By4pgJEn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1317D277C86
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 13:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571151; cv=none; b=oO/yl9S9EREDJ/C5ll7C24V6CoNNdDhjvGV/8Oem0rKQtvsf9zYjq+mLu7nSn7l7sAba2WRG5NYJkZ1so0a1vbqy8AkWpfsC2leP8d0RZime58Zbjvp3PtuKjdRTyg3gsE67PNLnlvvZg3RLNVSELDByR0Hb+VkGpO+StEHrURE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571151; c=relaxed/simple;
	bh=p681Z5rbaDJF06LN/mmHiGuUx0Jh34Fe6SopBwfasw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ms0GGWX5zoxTrQYJWu5PbHe8bgj53GuTeAR+vCtm+9KEfvqg1omorfSeNCQSRQpEyyU0Qu4FRADQeLDdLghqGYEXWX+VK8HXoOduMDL4D6pGzx/jP19r0gFl2qL6MMDPMNtFDl15Ef9xNtKMSMVVpnCteSvPBd/lTXeZlO2vwk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=By4pgJEn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RBJhPH2546709
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 13:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J2Uzmm4o+Wkvy02wbzWdLFd2
	fnNoKBhusnbJ+pfAWnw=; b=By4pgJEnETTbOjcnpaNXT/R2pezog73Wj9boC9dW
	SjNlmOsvywBlGsAykgQDec2HnAb60SzplAs86yk/0WPP81i7FP6ioNUx3FIud3T+
	QVeDTVfMOhbneO3Y1RNcGa0Vxuy3DSLgCfsBCQxYeBjJ9bgmhNtyXr8DX1jwp+go
	76DzORq/QLQek24arGszSgCkLlDoOxFkq6HnMuIwgMJVNoUsHEL5967NhK0QhMOz
	NEZSAPHJyQn1W6cNiu9fhtCKCoosd6qFZsnFeIJKIHJzvxazZ6AaR2koLcFe3cWz
	6HAjXqNpKolJ5d70tEitQ7HBXW4nWVGlTH4I6x9HJYA2xw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2g9w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 13:19:08 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5db1ec1daa9so2538433137.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 06:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571148; x=1762175948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2Uzmm4o+Wkvy02wbzWdLFd2fnNoKBhusnbJ+pfAWnw=;
        b=MnainsKmxKIsfzWjTfSNyYeRDx4g5Bm1m4bQT+WMfytZFuiN9VInAj0S+k4Y8ZwB32
         5RpN0mEPheSa0TQb/qeQ+m/a6XcGVC/8HdZbJ5xk2pUOaDuG3FoL1XAs0SRQqWJjtH5U
         J0SlhmR1E7wd6t6Oao4p9Btvvq7yaAO/BVJeU8Y8NZG8ZoRmxCU0FAAI5WY5doEgapf4
         nUDiJt6HS/RMnkLuQGAX1bwlixidqXvoUASp7n7o6nH73FQRMId3E5dgI5G3pVLtsGaC
         /Cj/CP1Jj5IlYRVt5kWDBBcvaH6lS8zQ/kPHpcrU+7Tux95N+RseGhKJq77wZ8GCltAF
         eMsw==
X-Forwarded-Encrypted: i=1; AJvYcCXh95UR4xlU8z5NRy1+jsUzraHu1VGs+b7UwSCAWrLLHOKultQUCZuZF77SXxL909Di7Kr6wR82xdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2VW68KqtdhQWPvs3sPRNDq+m3FTNNhqVhczTOE4dDiWjMlVVY
	eZ25Ugswc+N4jO7iIGTlivfblFz/kGiTluSkvyn9uuM1Sqkrk24lHT/MNXozC92quUFG0RHeeYg
	5DpZfGEj+ofIOHTtg7jce1FsIZ9889M9l8rXoPA62oJR3ICZ6eV/GL7lfa5p/mG0=
X-Gm-Gg: ASbGncvN8DRI5NBc1BomzdF2UkrAZAA3DbU9gDBEhk0YSCsecL08vQbqUfN/svJjcZV
	bRxgbwmgQGlEIgYwxcluvuufN7ZxX8gdSLG6O42dPprV/JCNI+1f/5yW9731oAWoZqSa4l1kTNl
	s7OFF5skfIHsN3Nb2TQ+Tj2ksWuk5zrVgxNQCWEcOctybffzBYkjYgcccOz+fzmYt6H27BEK7eE
	6Kjk9LQeOScasm0suM1OqA1+xGfh6NdIWKl3UTeAbrYGVZaIRSrrc86KzPXfv8v9OhSNhYt7USi
	MZ+Yj0gkep9HCub8C7FN/7mRb+jEBX4HPjDoy+3zsI/ofw2ivACY6Uc3hoRXTGbUjVF0m/P6wVv
	178bkgYKcVn2D4491mTHVHwyjzeN0TZOcyODCrcG554toKvErSMYqtHGGTYNB+Py02mL3BMVN0K
	icv5dc7Dsx7hUl
X-Received: by 2002:a05:6102:6cc:b0:59a:79c:f277 with SMTP id ada2fe7eead31-5d7dd5af38fmr10917097137.17.1761571147663;
        Mon, 27 Oct 2025 06:19:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvGPuBFXFMD+s+AGYLbzxQPLMqSCxh3xUpq4ZLUYKahpArKmvvv89qv7QYWkqo9JVUBMy6qQ==
X-Received: by 2002:a05:6102:6cc:b0:59a:79c:f277 with SMTP id ada2fe7eead31-5d7dd5af38fmr10917084137.17.1761571146949;
        Mon, 27 Oct 2025 06:19:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59302335036sm2326984e87.70.2025.10.27.06.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:19:06 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:19:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] usb: typec: hd3ss3220: Enable VBUS based on ID
 pin state
Message-ID: <34atfkavrxtv5xdekrlhhkxx4rxs3ueclxrmou5pquym5fsycv@i7mv7ssdlm2v>
References: <20251027072741.1050177-1-krishna.kurapati@oss.qualcomm.com>
 <20251027072741.1050177-3-krishna.kurapati@oss.qualcomm.com>
 <aP8_oZlJ4466BEf0@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP8_oZlJ4466BEf0@kuha.fi.intel.com>
X-Proofpoint-ORIG-GUID: xS41WyPZclpkML0FdawSUceIVpigpryZ
X-Proofpoint-GUID: xS41WyPZclpkML0FdawSUceIVpigpryZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNCBTYWx0ZWRfXxcLs9Yv5MXUb
 b1F0GCLGn0hEGjZJICgKQcogWzjZf9bveezQ70CGD+5FdcHmtSEyxhihwIt8SnLj3L8rHVBGynz
 4/i5xEJ/rGXyC4EgoSJ7ZyAz2k7ge1qxy7Ccserxyl1wb5Ai5CDTR4q6jV5ie198Juj57H0YnyL
 Z5cWobeKAjaU4lSLTmwzOC7EuRiJGIc1o4v8at+GxAFVYSEB+b1C0n+z/0X+SB6vRUSvNeSmW8L
 +Aj1xzSP1ycwGw2e3NNPHTfoU5nppkoSGqXeWj2SpU0zd4Ki1ie7Dz19B/PJO/qDlVzkunN0gKp
 im1Wt1il/BiX1I7MHuJj5pJLWbPip3w/W4EWt7agMkfwk6BVvy7M1/MC4PzHZ8f3slZ+M30OkcI
 FccRrkgMpFZGZJnWZPEQDv1FEWb1Ig==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ff714c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l5K9N5hKnuDr3Ur03xgA:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270124

On Mon, Oct 27, 2025 at 11:47:13AM +0200, Heikki Krogerus wrote:
> Hi Krishna,
> 
> > +static int hd3ss3220_get_vbus_supply(struct hd3ss3220 *hd3ss3220)
> > +{
> > +	struct device_node *hd3ss3220_node = hd3ss3220->dev->of_node;
> > +	struct device_node *np;
> > +
> > +	np = of_graph_get_remote_node(hd3ss3220_node, 0, 0);
> > +	if (!np) {
> > +		dev_err(hd3ss3220->dev, "failed to get device node");
> > +		return -ENODEV;
> > +	}
> 
> So I guess that's the connector node. Why can't you just place the
> regulator reference to the hd3ss3220 controller node instead of the
> connector like the port controllers do?
> 
> That would allow us to do a simple devm_regulator_get_optional() call
> that's not tied to DT only.

But we have devm_of_regulator_get_optional(), it was mentioned in the
previous email if I'm not mistaken. If we need, we should add
devm_fwnode_regulator_get(_optional).

vbus supply is described as a part of the usb-c-connector schema, so
it is not that logical to describe it as a part of the Type-C
controller.


-- 
With best wishes
Dmitry

