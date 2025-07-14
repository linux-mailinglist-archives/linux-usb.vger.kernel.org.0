Return-Path: <linux-usb+bounces-25754-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F7DB03AB7
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 11:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 511F017531E
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 09:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED64D24113C;
	Mon, 14 Jul 2025 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7u3PGTt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873FA23A9BF
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752485053; cv=none; b=mjI2ZupzrznTL799cKrFScSaO08evqUbrVvTlvgkj7Mx3n4hwFlMShTyg8b2o9L4T07NM8CxWD8y6NXkDlcUnXXkl/gtQcgLiip3JiJYMpjAgRaLlMkJGVkYV+VVtaHUdKyGSGXqU9kZv1w87MJW8MfTg2WvVcRvIof20mWu2WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752485053; c=relaxed/simple;
	bh=vW7zFUT4uisZkBflxFOgTOHHFIpYy4naUQy1oVtrAik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsXv+8K6/Z3H3kM3nlax3aJoqa9lCkL+nRUYnhioVtk65Pxle8Yl4v2UzPPSTslkQqx4Azjnz61+JtOWnwKNeNj3WQ0r5gpdLL88nKAM08/1yhdZNYW0BVtG2UJ2mgHqQVMY7eCMgp9lJUFnyId1ZM8dOGvTi19YIn1iBGN/8dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G7u3PGTt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DLq3mL009866
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 09:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V8ZlHczfnDZoIkoxuSHgxwOK
	2zomSWcRzbFFVNS1tiY=; b=G7u3PGTtAgMTWUTC2phFDAM9W4kHdlSFLbGj21e8
	eFoFKPkD02amzzF7jpZgMh4/Fzm1oB02pdEmutBZfAxq6uf0Hnfdodh9Xnb5j8b8
	OnK81eQ+1zTObpkgicZjAyqPsIk1aE5ZiXXLk0Wlbp2u7JmV/r7tvvyA3YLwK39p
	Ycd9l6hdpm78O9r5ZFF567tNbgHiR2gkkw9h2L7JfhBufY053ydUofK3rYhHFkYf
	Qj4AecpCWR8DAleNFd+zlRnveBcXTDR/vzKJUG53AIbsfcng8+dqnuls0kndZ9b8
	ScshWuwxU0w9rXHDW+vRw6NEKBdSjl1Ab6BuF6Vk3itA8w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47v56a2jg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 09:24:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6face45b58dso64732776d6.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 02:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752485049; x=1753089849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8ZlHczfnDZoIkoxuSHgxwOK2zomSWcRzbFFVNS1tiY=;
        b=LvUp08gsL2hxLOUCFag+HCZK6ti+StY76RfO6ih4S51baGNkYsKtr1fxbl4E/veSLB
         Ly1xfT5IeClS/DSYBncrzVdbsntypUzshf1VJFWn9iJXymjAxG0HxM3H6zU/lyyDVCSE
         qXjEv/Uz75LGqVe5tGGrskxWbTHOZSeQRbiiBfGguFT3NgN5PK5R0CAQ06pDX1e/0hdl
         RV9ruYszcCTuClRA8oOHH8RRADqXQem6+/KP5rbMcLY0WfFqZajSnXyMw4dS5djL3W2w
         Doy/vXGJTxNSsCNKb5JcFqDXETr9t2ng59HkUPu+PE+fFkYA3gEKjz0EMJZH7h11VTnz
         Ukvg==
X-Forwarded-Encrypted: i=1; AJvYcCURvqHrO3G0qcq/3s94m7Lvw6LbRMGfLJN34xy/PyfduDmxZWbc3sy1hIupL4M0M7NLa9nacjvVx+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ44UC/CDs9t4iqwdKGegPph0VLGm8MuVTzGB2y24NwY2FhqfN
	ikxwKgFgQUFWGPyCmFZTOwKxqPh+sGenvELeAJTxD/rK9ZiH+hP4CHITAukZYWLRwC0R4LICD4G
	ZRoJzYOSM7vOLZn/V/UT5iHMDvG3T8NJpaZk1qqrri/gTRaVpfhLrAAbDR4VTKBI=
X-Gm-Gg: ASbGncuWYSBTPxGU81CxLcz7LE3KVB8zdpH+btK/CEwPZuuiKEl3RaofKJg+UK0drGH
	jWQtGMWSLk7QaDLgw0mjMbANzZNo9ZU6kSM3rD84dAXXH7MSNlbs8GMQRCBA7xoSTUMRt4FUfAw
	DEHrLAqmCa/wT0G1tLZII6v0XifmdFqDiw1LtXmJGHYBqp1oOJCfux4VAGq3fZXCe1o/0XCOdtq
	eXCR6h6b5uSbnlF50fipTPh7egc1zESBI1CDB7s/0SU/5dz0D6o28ihv1RfbP0ND2Rv0kkhxrR+
	tqxXQGx9rC0z4BwhVQpgm/jcPE/lDVKHbr4fiZj6QX972qJRgU0yuk3my0n/NXvkeosyWXmgp7U
	1i8DkG8Np2/mZ2kMLcm+TnUrKJec7txJixz2Leww0fkPIerpQ1v2w
X-Received: by 2002:a05:6214:5017:b0:704:95ce:17da with SMTP id 6a1803df08f44-704a40c8425mr184203506d6.11.1752485049056;
        Mon, 14 Jul 2025 02:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIT36I3m4hHfAONrGfjJUxqWcUbn30oEyBIYCebfEJkEpfuMOuhby4qawcjOVW/7vsoAXGEw==
X-Received: by 2002:a05:6214:5017:b0:704:95ce:17da with SMTP id 6a1803df08f44-704a40c8425mr184203246d6.11.1752485048417;
        Mon, 14 Jul 2025 02:24:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab91a480sm14418941fa.112.2025.07.14.02.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:24:07 -0700 (PDT)
Date: Mon, 14 Jul 2025 12:24:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: dwc3: qcom: Remove extcon functionality from glue
Message-ID: <h4gvc73zp5csthn6fk3upj45xbtlijove67gigfgrvzi6gwu3k@y6v4lggyqf2u>
References: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lIrrGdrEnd6E6jMiYYqgiRVRfqBp6vyY
X-Authority-Analysis: v=2.4 cv=X7BSKHTe c=1 sm=1 tr=0 ts=6874ccba cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gYDs5GclryXmtiFo2a0A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: lIrrGdrEnd6E6jMiYYqgiRVRfqBp6vyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA1NCBTYWx0ZWRfXysxzDzhl9otk
 +FkIesMa7Yg6vZwPvwRcB/7YELW3j4UtAdsGlYNUnWH2EwVWTj8UAwU7lww4T+fI+aT8GpmRtK7
 PBsUiW2NtAjvCwk7go0gDZJ4HtrpYRaIZ2RJuTCK7tNV3NGccgu/b9RfshNIFjjKpjd+FybSTBy
 7Wk+pyNPcVddeX6/VAO+CU0wDsrxLdEVC/cnKlHnUfFGOLetofCxO4sKoiILp1DCme3mmlIdvmO
 SWQZNigOEbkV/fCWx9jawgaQ1Qh0zrpgkJyh4W+C1O3Ur7TIAGwJGHuy8Y6+BvfGTEbmI0PnVEI
 TtGVzYG/K2s7S+Iqtvxr6UDw5LCViymM5CghQTYnLUnv8W88QuonIKHVl24lUs5X+Ly1m7IGhDn
 nXaqRPeKfjmrJL5v1f8JbAFU/F0lY5wir2kaXLI2mXTik0AKYFIPYSpTPgPrWjh3AHzfVZSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxlogscore=881 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140054

On Mon, Jul 14, 2025 at 10:17:02AM +0530, Krishna Kurapati wrote:
> Deprecate usage of extcon functionality from the glue driver. Now
> that the glue driver is a flattened implementation, all existing
> DTs would eventually move to new bindings. While doing so let them
> make use of role-switch/ typec frameworks to provide role data
> rather than using extcon.
> 
> On upstream, summary of targets/platforms using extcon is as follows:
> 
> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
> effect on them.
> 
> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
> driver which relies on id/vbus gpios to inform role changes. This can be
> transitioned to role switch based driver (usb-conn-gpio) while flattening
> those platforms to move away from extcon and rely on role
> switching.
> 
> 3. The one target that uses dwc3 controller and extcon and is not based
> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
> This platform uses TI chip to provide extcon. If usb on this platform is
> being flattneed, then effort should be put in to define a usb-c-connector
> device in DT and make use of role switch functionality in TUSB320L driver.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Changes in v3:
> This change was 4rth patch in [1]. It was suggested to make this as the
> first patch of the series. Since this is independent of role switch
> patches, sending this out separately. Removed RB Tag of Dmitry since the
> patch has been changed.
> 
> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
> 
>  drivers/usb/dwc3/dwc3-qcom.c | 90 +-----------------------------------
>  1 file changed, 1 insertion(+), 89 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

