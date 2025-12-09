Return-Path: <linux-usb+bounces-31349-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC41CB1597
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 23:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9EF5F30295B3
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 22:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4569F2F49F0;
	Tue,  9 Dec 2025 22:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iy1gBp9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EEhaQ+BV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F974271457
	for <linux-usb@vger.kernel.org>; Tue,  9 Dec 2025 22:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765320668; cv=none; b=aZ1f1QS4++a8GqorXZ1q7YWgtJNPvcbIOCSFvUGAONSFJfOf3rdc7V68wMTqYqQO7fLJ3hYxmyzITReID2xTWdWS+nsY/xf+uE/pnZiK39JPK7ZR/U6ofc4hQCLXeoQYeBPYS/fSkZFKdYDXDr69G7PPnM0BSxFFwH3kPdJ3gD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765320668; c=relaxed/simple;
	bh=4UviVE+MKxH5YXkUKOH1o7lscfz0/UhOf9AiPURZags=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iK5QRum0Io+v/ExkY3JmgAf8UVowaN4DmDv6aI6RkLyVYlTCg4G1STehnH5jt6fW6L/oC6LTazFZ8NuNL+Si18MkpC2lH7WdN5Fyv3QseuZh05Hv1KNfEqOLAWjNclHvI67bpg2RPgAktiKC6RjfsnJztH9FZNRtIw6i1JeKT0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iy1gBp9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EEhaQ+BV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9Mm8VX104114
	for <linux-usb@vger.kernel.org>; Tue, 9 Dec 2025 22:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QEQMzl7vqNIap2ByUNZYi+y3
	EAq/MDWdLePRuwHVOoc=; b=Iy1gBp9YC7bM+9rD0CFVoQcnDIzWXbZb0blFrH/t
	OzDmsj1dZ87Z65SyzJ8fwsvO+e7F23EqzgLhF1bKfhkCs0PvuG+pH3dMfDJb/hZr
	AYE5MX/cD3Iq+fmo8pscBgEwRWDpViRHt4Y6C+hdclZGYc7SH3Y7RUu10IOl6KKj
	qLYEfxo+AxUQt1xfzUkhlpuRwlsz64jozRnDV6UPJ8oXOLrimgUgOnb7kVPrCfUu
	X+5pTC2SMz0wJvGqs5UKD9gxyDOzxgKV4IVwXdFTzkUxfhKrL0LWaSurr51K5QJV
	eFTgtw3tRMGweJve7sYm9Y80dILNL58CeM+AGafZgRiLXg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axesf2wbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 09 Dec 2025 22:51:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee09211413so145955311cf.2
        for <linux-usb@vger.kernel.org>; Tue, 09 Dec 2025 14:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765320665; x=1765925465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QEQMzl7vqNIap2ByUNZYi+y3EAq/MDWdLePRuwHVOoc=;
        b=EEhaQ+BVvVSN9JIb1ybMRN3mbl43weM3mZBVP2dtXIe9emognnSZFcRKvz8SBTD6lc
         5YNqI0kGLTixbVPIK4LnsaYusax9WtSy1r3XQBN8wVE59TVEqsSZv75XI2h3C+Mp5TNu
         7NVW+kMMkiRlfsIToAvyVd0/08hCgwpp3T6Zuh5/tXyUqBF9aK2vkRtH7b7ULjYf0e2/
         r+0GbYQ2Bsmi2NmLRjUYsLpUIiEwSoQlhRfiG61zI24Y8GuxYiaZFbbrLAEiPPIVygHP
         MvbWksJgXoEiLjtohT6Q3ztb/R9tSpWUL02UXPzoDkNywMnQm045udzgodQarmOnBgBD
         q37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765320665; x=1765925465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEQMzl7vqNIap2ByUNZYi+y3EAq/MDWdLePRuwHVOoc=;
        b=CYI6mGw2VXKhL0XBN6WYK0ImrUpGhxQLmufC0awA9Ib4eESrmA5FpTBmYbTH/VAIcy
         MvxQ7NycoIt/q8EPPzxHWTJgv3lN9H2N2BM6dKJAl8WVpJ0aFRvkBRGQA+iO29nAIFRU
         nbpDIAwwDrJPYCFvVYRda4NUbTVEr6Vcrq8WMFV8J4Nl0CN9H01Q8gfBJUa8sZJ4tG46
         k8das5P9uJbcbAukgQGT8El+gYs5WN1DNiPQBRkq6wrN/s9pzLf6H7Ooaz7u5EeW6asU
         OK+BhLashMuH6t/b35NNDNCg4GPZtRgLGCkvU/bJf/qKqOT9AK8RE4/krFMhXgwJycvg
         eb8g==
X-Forwarded-Encrypted: i=1; AJvYcCVQY5puSNJc7QwqU1zpVCQ8mwK346R3ceteygpRJ8i7K9cZDtXs4/5QwdTIxDwuOE5yONlhSC+36Bo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhlfM8s6hQtLnVshpvMSAI/kfwZfsOYShlTegOMbFrT4qQ9vBR
	DPtIOaXr1GkJ6N8wmtAO0Q20dEcn6J5m83hPUPU3cnjXx6nCIBmYwx9CrOJoK4t71tS9SGNoBYr
	tEgJinSKQWu4Qpgx2M0En35WtQ17JlBkaQA/0LJiLlm1X+ZTckNkTJFRUbAkKgz4=
X-Gm-Gg: ASbGncu7BuqNd8SvY//C841uE7LrgIXGJGcLSkp0/Vb9LNiPKflZpAe/IohvF9Zuu2o
	fQc64q2BFaQD/LbdbqazMwSd2T3l1dHkDIyPCXtq+da/jsunZ+Y/uZFobeWDNapN04PDTc3w21i
	8568PHtQds8pVX0xYwyIqmmbIb3NhJo3oaUap/leiijZd3bDW0dS3dSuL1TFlSIJ54P6wkUO9Z7
	mUII8oWbC8wQu+QDUjy1SLXJZOTK97pMEfPHX/GNf7oR4mZXlW2L2W0K2uWkdSXYiaDYGGFxnxH
	bV6iJYqC50AWyeYN/xaShRUFrpMY16036X8JyraZK33OSZHXk8K+hkZPTnYWeU6SyOQq7MhHNmf
	Am9cCrsqPBv6sveXDgLkxhb0EqTE68kyn7XU2zfBtNyY6HOLh2te2ukbNao/JEnatOWlEUZfgYx
	j+WtJpNrOEtVe0DLrkjRHFZE4=
X-Received: by 2002:a05:622a:229a:b0:4ed:1948:a8a2 with SMTP id d75a77b69052e-4f1b1a7e138mr5189901cf.40.1765320665284;
        Tue, 09 Dec 2025 14:51:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqXfCXoGkec/geIDZqj9qtcWGnUkW/xMVVONs/SH655X16SAhaO0w/9u2YnfaCWf+p71MfPg==
X-Received: by 2002:a05:622a:229a:b0:4ed:1948:a8a2 with SMTP id d75a77b69052e-4f1b1a7e138mr5189521cf.40.1765320664869;
        Tue, 09 Dec 2025 14:51:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e476sm5689248e87.54.2025.12.09.14.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 14:51:04 -0800 (PST)
Date: Wed, 10 Dec 2025 00:51:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Ji <xji@analogixsemi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 2/2] drm: bridge: anx7625: implement minimal Type-C
 support
Message-ID: <7wp25rctnwydxa3zfpbmddgygyxmg5eg5crv4yuo45k6ovvww2@bnvcw3yorqw2>
References: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
 <20251126-anx7625-typec-v1-2-22b30f846a88@oss.qualcomm.com>
 <aTGJXAnlkK5vQTzk@kuha>
 <BY5PR04MB673939B585B2419534D48E77C7A2A@BY5PR04MB6739.namprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR04MB673939B585B2419534D48E77C7A2A@BY5PR04MB6739.namprd04.prod.outlook.com>
X-Proofpoint-ORIG-GUID: -clWzNVjzgtbs0xFgZ1yTc-INEwZRry1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE3OCBTYWx0ZWRfX6EeBJsU4LM1d
 Z1znRreml1fQM8nHfRnkWuRGzOhLXb31U6RxKM2ZxU1rVogNg0lZ0UXwKeRdvYwSBJTzhKEqxUm
 ksBtTMyrazVYU9dM+SxORT763uJ0CRLmKkegshOY86F46Lw7LAkPC+FUZJd13YXIWs9D8yr3rVC
 n+2JwjTj6l8ZGeMTqieo9TxxXpIbG7kZFZ6NR1gw/sfsRjV9NjNH9ecyWDWKr1JsKq8nbC30bfh
 pkZdC6DTupUiMHahrFmqxKJL3joRAy/mIVOqMDsSywnIJ78xpErj3gwFv4GYFNZ6/JRS/2e2G98
 0+wXQeq30W0RSyfOfkEAanKU9tAUH0RnIHOnzV/BCnKLi+hdxZN/DjULaj/4MBZeXLW6+gGeC33
 8Xh6d04dX882YLoIpal3Edm3ojRqOg==
X-Authority-Analysis: v=2.4 cv=fMc0HJae c=1 sm=1 tr=0 ts=6938a7da cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GaQpPoNlAAAA:8 a=cm27Pg_UAAAA:8 a=PJmAgKdD5_Fpd0EMymkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=xF5q_uoM5gZT5J3czcBi:22
X-Proofpoint-GUID: -clWzNVjzgtbs0xFgZ1yTc-INEwZRry1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090178

On Mon, Dec 08, 2025 at 07:37:30AM +0000, Xin Ji wrote:
> Hi Dmitry, I found there is another patch "Register USB Type-C mode switches" which provided by Pin-yen Lin <treapking@chromium.org>, but I didn't find it in the v6.18, is it obsolete?.

It has been posted 2 years ago, it has not been reposted since that
time, it targets a very specific ChromeOS usecase. I can't call it
obsolete, but it wasn't merged.

> https://patchew.org/linux/20221124102056.393220-1-treapking@chromium.org/20221124102056.393220-6-treapking@chromium.org/
> 
> Thanks,
> Xin

-- 
With best wishes
Dmitry

