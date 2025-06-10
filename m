Return-Path: <linux-usb+bounces-24646-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51509AD32F9
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 12:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 047361896036
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 10:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C73280319;
	Tue, 10 Jun 2025 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlXXGG96"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F16D9460
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 10:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549693; cv=none; b=YYG6MSKO4V62oKmhqkWjv8vTPfMIk2BGXNn5yvTqa/U+6WKLO1ShzDKeJxNiq/9q4kOGnJO5q8CkDVPv3AIz8zhzOwxK0A27xGfQd/aV3z/00PMq7TJ7ZwuN6sXmj/iVftAcb8bpjWdlqSD9w8xPbis6IGhZnz8LIC/9tc7tL50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549693; c=relaxed/simple;
	bh=JGAV+CUOY6EXm8RJw2oIXNOxzAARRDM+J0O98cxQxsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KtHFQASzaL0ala8yZIZdFHtjOvcc3C6gAFpLo/GF8dqGNfv0y8Vh6+1TdWUnOTOGGnDqxIRwbWLDmIaxVFW9zxxQ5+IzK4O4cU8aQZvy9w9+NKF7yywyWc1Drmt/LmvF0RZq/0mQPwLoxFQhJjek8nGDT8fET7cqKqABxyboB1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlXXGG96; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6wqAb002453
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 10:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bS4Hzj9a+WzWFlODSnPwST6wqsP6vSjcyVbEOkJffUw=; b=UlXXGG96gfXNx9EM
	ECRqUNZt4cBBciqIzzgSltnob0dr8fjh5rT5O0FQstZv8eQ8WybpsiqHDVD75OOx
	tC8GHxKsYoe6H4y5a4KpFIW9FGj5VCPcvxWCxGUYE8Za1Fl/NS4rnH4STHnZGVvt
	FLGwDAcS/+8pChSk+VQDnGjV4QZ63p0mh7X7TZB5bj4BGFLRsOTtyFtVoIr5XfQW
	LRE3OGNLiYYRqcKCNGyUhOypXcL2eb/gdJilZHI+Wq7v/4a6FY31eEm8oKW8AA2u
	VmN5KUZDPbgKMgCiIlZPRdvBU+bPpQw9RDjvoNC29lGmEP0C+ylpgbWoAgJsztKK
	xwg53g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y3rwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 10:01:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so5844930a12.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 03:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549690; x=1750154490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bS4Hzj9a+WzWFlODSnPwST6wqsP6vSjcyVbEOkJffUw=;
        b=JYqTqSBHLGSRc3FQVVJTWFY8F3E5mfH085X1ySQyiJpC5+m0oZjew1YEgVUtjIHk0r
         0nKxZOl2WKUg7+nfvJ4IuPgYmALDUfVzbtArFim+uUmASQPgaaLZaWx+8g7rvfEpUocM
         r79T0QrTEbE19SRLPlIbQ4NZs096LWmCKAt1D4ftti0+snZXqHXG4wqgO4giwK5JBP92
         66oORbcTRKOAcdziK09l2uAYSrt7jxOTDMZauRzRJmPQwcxAPUukOEZwRzQ3ru9cy5xx
         Hx6AXnXv8NXjatbSoIOelJ2OWCM4nBkiv83Z1syqbL0AHCmB9Lild4WfbEGAqns227VT
         ZJBw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8bqOBqdtnE900wqcQ76xcF/NJba4MynlMkRVGWYFQ+erHeahk/ZyGntCLyVNHjaDujoOqRxyOtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuMKZtYP/Ym0OBIehC+Z+ykGduH7EC9GNyA0hTPKn+MdCCjtCe
	3WVzB/nf9SQIKX1vE8EnVINUa637DS/aSPmZSWx6geHjZjBUDFJSEr04fCOgs7GubXTLdLkhd7X
	ufxD0p9CzezPey6GRW70lgptMlMsCTUty63Bzcy2sv9/t1yjhM4pVsEwdYD24gjs=
X-Gm-Gg: ASbGncs/hYcBbU5Gh1inDtysoqL3KBA7KET6q2TdQCYKpO1oDyrNiePxWhg0qGgiEyb
	BhwMhnjMgfnejrzCOFJPSzGySqrH4PyYgvG/oPgFQlf7/rCKuBm69TUdt9KkkWlUdLBE5CPEVHE
	OCnbaxO+vTTMghJakkb7GqKNgv9M0xt8funlQjEQV8+3RwNvQl4QGMOjEqlMYjTIxBVM+VB3CG0
	/TP61UOyBzjuAqSJqBjFO4I2D6+eX+Edth8PtEbh3UCL4z0cnJ3ggVwLYWKHg/bdA+cgWfg/xVP
	BM580MvrOXapSGjzTprymZesRRbImbaeH4z3UO60/FXKEphwqNk=
X-Received: by 2002:a05:6a20:9150:b0:21a:c56e:3bd0 with SMTP id adf61e73a8af0-21ee696e89amr24563705637.28.1749549690541;
        Tue, 10 Jun 2025 03:01:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtdsn/9J1RkDGobV+X9NeAHlUUj40DP2x4Dyes7BuAZOzuwM4Nz/+NXqSizip31OoUxD12Fg==
X-Received: by 2002:a05:6a20:9150:b0:21a:c56e:3bd0 with SMTP id adf61e73a8af0-21ee696e89amr24563671637.28.1749549690096;
        Tue, 10 Jun 2025 03:01:30 -0700 (PDT)
Received: from [10.92.165.7] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ef88914sm6584366a12.33.2025.06.10.03.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:01:29 -0700 (PDT)
Message-ID: <819173e7-e245-4fd9-b810-1f3bd8c1a8b5@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 15:31:26 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] usb: dwc3: Modify role-switching QC drd usb
 controllers
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3NyBTYWx0ZWRfXwAUFZgBNcChj
 K/zqMcT1xV3YVJ3FVsiWMKxAV6QhOOOCdmvorKvhmIDRkCRfJNiMd4TCbPaVx+E+O3gtVIgnzEY
 8O8Kk8ZqHoy4IGbKeCnIlSmBNJCLhq+nsRK7QsxTCDOGvHjJRImsMPjQSKqIFiZby5VXRC0e5U3
 kp61IOq7Q/2lXOyyDulEDNHHT9d/gd9b1A8UtTp0VRS0JuWjf8Vys/yVfjtlC0Ou45fstYdcubQ
 NpuLZwDbJ/12s8KxT/XAcdsUQpiADDDYLtq338TNMMxR7qt4QLHPMRXyYy0ybS4JIhyb3ghvo2F
 JgqLAXCtGrhP2oaPbsk6gfjxLxM4Ml/rvDElBHr4a6hVeZrVxtMLLinH84N8LzSdptoBnEz+Sm3
 V80oZakhZw1vqhFmaV3IgYAGp47/D0h546LwKxLoNH/RNAoBjV9OqjQ8dNB7EtU5IiHhnmdb
X-Proofpoint-GUID: l-qFC4MlZHw5GzYvwYV4pjgqTCH_aBb3
X-Proofpoint-ORIG-GUID: l-qFC4MlZHw5GzYvwYV4pjgqTCH_aBb3
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6848027b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=tKMUdf_y34624hTivQcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=803 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100077



On 6/10/2025 2:43 PM, Krishna Kurapati wrote:

[...]

> 
> changes in v2:
> Rebased on top of usb-next.

One correction. The series is based on top of (acked commit):

https://lore.kernel.org/all/20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com/

Sorry for the above mistake.

Regards,
Krishna.

> Removed glue's extcon handling and made use of in-core handling.
> 
> Link to v1:
> https://lore.kernel.org/all/20231017131851.8299-1-quic_kriskura@quicinc.com/
> 
> Krishna Kurapati (4):
>    usb: dwc3: core: Introduce glue callbacks for flattened
>      implementations
>    usb: dwc3: qcom: Implement glue callbacks to facilitate runtime
>      suspend
>    usb: dwc3: qcom: Facilitate autosuspend during host mode
>    usb: dwc3: qcom: Remove extcon functionality from glue
> 
>   drivers/usb/dwc3/core.c      |   1 +
>   drivers/usb/dwc3/core.h      |  26 +++++
>   drivers/usb/dwc3/drd.c       |   1 +
>   drivers/usb/dwc3/dwc3-qcom.c | 219 +++++++++++++++++++----------------
>   drivers/usb/dwc3/gadget.c    |   1 +
>   5 files changed, 150 insertions(+), 98 deletions(-)
> 

