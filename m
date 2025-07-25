Return-Path: <linux-usb+bounces-26166-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB2CB11B50
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 11:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 080304E47AF
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 09:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B1F2D3A77;
	Fri, 25 Jul 2025 09:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUijmzw9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEB419C54B
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753437499; cv=none; b=lSeC+9LOBovgx8kdwG/YW2ddBkJ+2QAO2TdBe6RY0ZzWYS55jjUyCP5ky4QJWyIsYJIn+sTzCEYJE1fQDQpD1RCNnH4JT/UAHuDWUjK6FTlmhPwH9sTfMyojFha8gAgJxZzV/XXZwqQ8nbLQB5HDlUC3fgLHZqy0BHV2uf+2z0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753437499; c=relaxed/simple;
	bh=2tiAjB0z1k00ZNhCKVrTV+vcG6RgrZgG4F/1kGUZuvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cpTxfTy4k4ZK0dsFnx+YxNLmXw/PeCwedAowXQL2rzw+VipzIeCpbUL37zIMLej8rr9VEG/CUEVJOBD0aW/uWiS+KOdfcoRTpJAwvIfwPvGR2fdzs4O0XZzfwT/WzEji1XIt/6u7ukpim3f9+hVPd7PBU2GV8mH0klzRItzR06U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUijmzw9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P88UXW007953
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 09:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PEnz4H6V/d/qO6cgGDmgOqec5WVf9pfPd1n4f8LtXmc=; b=LUijmzw9lOt/+t8u
	lzDyQnX+L7C65wXDSbeSLHBOvkp/lmMygm4rtqwRyincOqJzn9dB8bXX8qQ8Vqo1
	vh3CB1wewqOl0LgLta56aL/zv6s2dqNZ8PAUJopNeYbwnGdAG2CjuMSIqw2LuSwb
	6rwJke8b4KJ1xULroMWSE1aEKU7qolFYWLdfFya3bDUnRoph8izfdXKAGYQf3iSi
	5XYLisvOCDvGc+IPa3iPN+P+XylGOXrisqxxteGeNVbA1xkkOrtmJYM8sD1O2aDM
	s7YacLYBGyl/72XxPsAPQlCW+Vcf7hg5BNqzVIUJT2mSyaZxVtrWbAP50bqUpNLy
	hSVbUQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48465909yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 09:58:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748e4637739so1226985b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 02:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753437497; x=1754042297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEnz4H6V/d/qO6cgGDmgOqec5WVf9pfPd1n4f8LtXmc=;
        b=Q4ziKdPZCnStwAusFV1KiHVnMYlSwhGHcwadA+AEv2Srj3UsGZuCgbeYgs+BA5S/Jt
         xC0+bFezlYX1iDic/xQBFmOylHrXV0gBrD/36tWVPTzx8JdxoHA/rjB7nfhwLkB7VVi4
         U+LUPIqWs4/apJd/HUdc07ymKucKei23ocR/I3pGQfqXu0NsUPQIfomlButgG/GXS7SX
         6WY5MeMFjS404fkNMYlOvh3FV8ZytfhBw2HM1801RV7x89TJFE10z+5x1SSR+dtzNDvu
         JEhUbI/4lt0E2mW1a92Q3+SfdYx4R4BfM1O8tQz0DYMVAkebhd8ioV2pwH284YV4h401
         4nGw==
X-Forwarded-Encrypted: i=1; AJvYcCXUoG/gZQRORFF1jNqt624Mxl/AH9wHV0TApFYM0292Cma18HLBymPGUykYaomoeax3g+wYDEm9HVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxMSX7V61iLwDWBD4c39NVj/CrMgz6PH0xGjWqBNwMX7iGdqWp
	ZU2IXgF4LaKBW0nnLPmq8Co+bADjqfXer7KG+uNFgCiIPOll/lG6hn1/NGcSMPovEmBu6KxVHMn
	pNn5o80gm3vCSsfpy3PLRHZFsvMvgQbqD2GlZFGdMaKSJFThMA8eTQsNwuTerSZk=
X-Gm-Gg: ASbGnctnDeda/20HZwblapkMrshMLAJkKN9apZzzts0Pa2cuu+3ii8IL51qvW0MLj/f
	BuwLIfoS+5Ul+C/DzIcbxZ/vvBOpUGC5Dk+66tDmEXy+QY+zilyvoiSOeE7GHqGU31Q4hAgpM/J
	boVj46rpLe9uGQ5PuL1ExPAL9VoRO0Dqze1wFuiTDg+RnDBFim/Qbxi4kjBg7rKcxB/4tc+cBXi
	Kh7AdIByivQTN6x6rl2FAWv6kt6ZTxE/hzhEGfdekBbTEnMxVF8gp8h6g+dVh1iwnVYavvywRFD
	O/F05eQ7PEl1qnnGZk+4A9PQkL5c/DxBFL4ynvWwpK/12hdpfm3KNwQZQiHED4eYgmxq
X-Received: by 2002:a05:6a00:2d95:b0:748:e289:6bc with SMTP id d2e1a72fcca58-7633227a158mr1964816b3a.1.1753437496665;
        Fri, 25 Jul 2025 02:58:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxeluw4+DDKKpWWuyw/4WDEMIRtuo5eBj0yv9G3SoYRav34QjHWJH5owQlj2Q3gmb8i/0slw==
X-Received: by 2002:a05:6a00:2d95:b0:748:e289:6bc with SMTP id d2e1a72fcca58-7633227a158mr1964788b3a.1.1753437496238;
        Fri, 25 Jul 2025 02:58:16 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761adb7878esm3284533b3a.20.2025.07.25.02.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:58:15 -0700 (PDT)
Message-ID: <852ff03d-84cf-42f1-a428-ec747bea835e@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 15:28:12 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Add shutdown handler
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250725062158.2418961-1-prashanth.k@oss.qualcomm.com>
 <2025072542-bleep-parting-3e7a@gregkh>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <2025072542-bleep-parting-3e7a@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6Knyga5uldKbIT0nV3FDWRrmNGG_QI7t
X-Proofpoint-GUID: 6Knyga5uldKbIT0nV3FDWRrmNGG_QI7t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NCBTYWx0ZWRfX3U+Eci/56Ya+
 icOcgJBg5NelHmRQrnUhkK+wCJ7vayiRA/OjKqrnWrmMdJCvgtsMwIY+0obHlJiE3P/6oG/yLqD
 Yswia55tJzOyYEhpcwJGA8lR126mQcJxkVfWqBcje5KoDwwTk5BWTtMxUpwLY6VYiTPBd3Iyi9t
 XUzFX1qf1P9P7TXq6B1salh/ohmuLVmwlKcV3x6zzKQa58LhVbgZ+m38c7O3vqkG7SbfbvuPpBZ
 XJcxG4kKfEH7PTyseG+sjFa07rVgCuPmAgDx25T27GYFFcrqySHYWCOMRqCyJKnveNi4khh2faC
 JoY9akOlP9XtXDl6MycKWevRkJPI22shZH8vk1whg2Eo+q6Bx9J6g2+8ZMMkIdZRa1wZsJAyTsK
 pLXc9jZxQAGJtxdlkkUDAcYZ8ehnweRuGMzx1BErbPIB4HyUaxs1n5+h+cSj/QNKiyjnm3Ui
X-Authority-Analysis: v=2.4 cv=Vo8jA/2n c=1 sm=1 tr=0 ts=68835539 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=7GsE9dd7f-aEGlja_ygA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=929 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250084



On 7/25/2025 2:18 PM, Greg Kroah-Hartman wrote:
> On Fri, Jul 25, 2025 at 11:51:58AM +0530, Prashanth K wrote:
>> Currently during system reboot, SMMU disables its translations
>> while devices like USB may still be actively using DMA buffers.
>> This can lead to NOC errors and system crashes due to invalid
>> memory access.
>>
>> Address this by adding a shutdown callback to dwc3-qcom, which
>> ensures proper teardown of UDC stack and prevents DWC3 controller
>> from accessing memory after SMMU translation is disabled. Reuse
>> the existing remove callback for this purpose.
>>
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
>>  drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> What commit id does this fix?  Or is this just a new feature?
> 
> thanks,
> 
> greg k-h

I didn't Fixes tag because a small dilemma. This patch is rebased on top
of the flattening series, specifically commit 1881a32fe14d ("usb: dwc3:
qcom: Transition to flattened model").
However, I don't think that this commit caused this issue.

Let me know if you want the Fixes tag.

Thanks in advance,
Prashanth K

