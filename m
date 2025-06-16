Return-Path: <linux-usb+bounces-24790-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A69F1ADB22B
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 15:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86FF1167EA0
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 13:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE962877C0;
	Mon, 16 Jun 2025 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyEGxcsI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1E2481B6
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080892; cv=none; b=ZGQQPWb7kruEtDg/Bjwh2+Juh+fwVAST+v0ouwHlF/nAEQkWK2ao+DwOboOm6kP0og8vrhFWXs+GreP4Sle1kzNUe5xzLpp7UDUAA+Y11JJ0GBacKGo34sERkYRbjU6wKuZDaePedYQboPUe8nSYVgIXIrU8AWCh2aqbHLeXSLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080892; c=relaxed/simple;
	bh=FMoAq8disiNRxpyZoPEjdZRccpHqtD+dH+rBSz6PpDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1FWHTJFzlAiuoawfW4JW824A7funrKu/fUeUqjOYVuypZm8JBTl0adq//jaimHP7vdFQOo2QOb29+2Ou3spnUVz3yCqwl4K1ddc/nDYY39RVe7u1jpwoyssxDujzHu/paJAUOlFyvheNeAtP3TfxX5QjBlt8/f25n1/uIO5io8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyEGxcsI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8djbO016417
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 13:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hV7aIlrhOYnPhaE5YGpfNg5HcLb1KNXsaP+VsHA7MAI=; b=WyEGxcsITlhYNjOc
	dq/yFfLO8UUwNsGXQF/lXCixUt7nrQQYAUihqVOX4nfcpXRfudiBAqlVcCskm2ZL
	hsp1o6KqMCLDyyvyRLmP3w7ZQxKWmwiM3pg/ndRF9446nYcYs0WzsWG9sVJF639X
	QylbWL4fUHrhsqhWRxXIdloPvCTdqBj5IraI6k2I0NsRQ1d8yQIQGFWBpZTA/Q62
	LMPCmPbiQpnwL8Gslxg20JF3sK1Mlb92OJUq4ZlJLpQ7NO0ybZJIIOtRCg5+pkuI
	OPIcm1lwfAUveLhHr5X9ImSIjzhZo1sUFQCxdQOtUFx8YR3zbGgqwcost8RbeH+Y
	laHA5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f74n90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 13:34:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38fe2eff2so776140185a.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 06:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080889; x=1750685689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hV7aIlrhOYnPhaE5YGpfNg5HcLb1KNXsaP+VsHA7MAI=;
        b=FBfIpkC5pDcEc5CW6K8usqrJnjrDm9ZIcepjL4fI0Xx4LzA2PNycxtcPcWB7K2fXk3
         ksIajU4p2gXgPRqwIbdwLVfgeT5zRoHFhRhusWC4bG/KsSKz80vOxyoSrAti8ueP0SuZ
         sKO8hatMUG6ZGBZUb95ctCX4YdrCGz+dXJprpJy2Qhgc1JgNfBrWyO/rJCVtz1bsklyf
         HG/KMgyFQw4rcfAONzGNTWU2UincLI4Aeeh/dyIS7okEa4do6dSG8+gDBLClJvSb3xtM
         YjnXGq9dUJsUjFipzyvupNF2eeisOKK7jZoYfzbsYQYJxlVjHX51yYmmQ5vzeZF5F2+U
         K4wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ/F+wsKXAIFQAPMj3Q7qglCNKRc+NnCi2LYdH96tbOA0ItetprPgARU31qYNocr9KRl1jKIP18a4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNblX/i3xqkXKu++Sdn2s71YvqPhddjeJ/9liqRmUUAG0owcvm
	vYdiSD2Hu5eAgd0Djun+8156zq85C61oX1KNMdHEyJl1h46WHst0Do5YGq3CdTuVsxIzzmVgmKV
	/INur/XMcGBtnLyrMfOfW2G6Ec22Jj1uuBOTmyMdhfNIExoglCAqdM+zEH2wFjsk=
X-Gm-Gg: ASbGnctFpZATVP3FNmAk2DfvRvy8+7fDVG4xarG2Vb2zp65MWrVsByyV2iWJG4atWGa
	TrkXl8Hy0o9YgL8XZGrTXTSyNkt4nF5aZwTQ5EmXvx1uQoYHCnDbnl1qrUDdyvLtCEEC5oOJ7nv
	0A+QqsU+aNTzKgS745zRnmDvdqTj8f+FInsyjm1RBwnu40DGLhTkJa7Lxit+w7B/D2ywnM1+HvV
	Zf+deIr3IC3E2l87mI6IUr+TI6gdp2MOkwBNVZlxjOfOU6TyRlQTRgNV6YAMq4njWkBXm0JUtnw
	Jv+d1j+6PN125LAcyfGVw4+H2NO938Su/MvLenHRAFAxQgmvRZ3rrBpacq2L0YrxRNSzxrOL8mT
	7jWyZILiIjAhlSnbENjKfU5Eg3LCphpfGIJZhWBOklnapECVZK62jEtucLdakjdSRL+3P/sDvFu
	8=
X-Received: by 2002:a05:620a:3199:b0:7c7:a602:66ee with SMTP id af79cd13be357-7d3c6c0844dmr1350300785a.10.1750080888578;
        Mon, 16 Jun 2025 06:34:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLTCIUcu5DAwal2m5FNrqtOq8DGSlR71nrO7McbfLy27qVYIS0Mcuos0H6+koDugco0fRfIg==
X-Received: by 2002:a05:620a:3199:b0:7c7:a602:66ee with SMTP id af79cd13be357-7d3c6c0844dmr1350296785a.10.1750080888132;
        Mon, 16 Jun 2025 06:34:48 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a4:c3fb:c59f:e024:c669:a69b? (2001-14bb-a4-c3fb-c59f-e024-c669-a69b.rev.dnainternet.fi. [2001:14bb:a4:c3fb:c59f:e024:c669:a69b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b331ce2dfsm15414821fa.105.2025.06.16.06.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:34:47 -0700 (PDT)
Message-ID: <34cb0398-a986-48e3-a15b-7bfda6081e21@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 16:34:45 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] USB Type-C mode selection
To: Andrei Kuchynski <akuchynski@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Pooja Katiyar
 <pooja.katiyar@intel.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4NCBTYWx0ZWRfX6iFssE+/06zX
 1SKXOCdSDgBoYy9pMuW7S0Lo0aReQ9sLSlTkwyLUQlJN4endj4McgBJM+QWVdHsuWkTMZuPzfz9
 tUjo/XTZTJVzdGBVspqmYgeeWHYkR5EFsb69LWA7n6I6w07WHwDZWZ33zgXZ8Axd2gWkiNO7PdF
 vaydVfgpk1bz9qxARFR/Nt+jljHHlCe7Fb+FOABI3MrT03qfBBjIJp9tiSlF/wtCskvG1y+0J2U
 /L1+wFDGgFTCMKASImVSfgXCBudgzFeX8jg0dbtZIKCZqolyc6s4eafHykJoDUYJDtlacNcISnz
 KADEoKJQe200dJVJswqGveVv36xtUZ99ot0+QXt1g42Fv7WZAcwCZJrORpQ0GqIaqqdd4Nai5OA
 Dq2G7b+zQ877ZoldcPuSbtyPQV8azYx0+/OWdg4ywvwNuOi4lS6av3J2bBIfaVLsk8wvv3QX
X-Proofpoint-GUID: YQusbV2GM4D4wOtqW3xSs_AaI0Imvqp_
X-Proofpoint-ORIG-GUID: YQusbV2GM4D4wOtqW3xSs_AaI0Imvqp_
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=68501d79 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=JmsPOU3ckOcHMdB6JcMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=982 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160084

On 16/06/2025 16:31, Andrei Kuchynski wrote:
> This patch series introduces a flexible mechanism for USB Type-C mode
> selection, enabling into USB4 mode, Thunderbolt alternate mode, or
> DisplayPort alternate mode.
> Two new sysfs attributes are exposed to provide user control over mode
> selection:
> `altmode_priorities`: Allows users to define their preferred order for
> attempting mode entry.
> `mode_selection`: Initiates an automatic mode entry process based on the
> configured priorities and reports the outcome.
> The mode selection logic attempts to enter prioritized modes sequentially.
> A mode is considered successfully negotiated only when its alternate mode
> driver explicitly reports a positive status. Alternate mode drivers are
> required to report their mode entry status (either successful or failed).
> If an alt-mode driver does not report its status within a defined timeout
> period, the system automatically proceeds to attempt entry into the next
> preferred mode.
> 
> This series was tested on a ChromeOS Brya device running kernel 6.6, and on
> an Android OS device with kernel 6.12.

Both kernels are terribly old. Please run the tests on top of linux-next 
or usb-next.

> 
> Andrei Kuchynski (10):
>    usb: typec: Add alt_mode_override field to port property
>    platform/chrome: cros_ec_typec: Set alt_mode_override flag
>    usb: typec: ucsi: Set alt_mode_override flag
>    usb: typec: Expose alternate mode priorities via sysfs
>    usb: typec: Implement automated alternate mode selection
>    Revert "usb: typec: displayport: Receive DP Status Update NAK request
>      exit dp altmode"
>    usb: typec: Report altmode entry status via callback
>    usb: typec: ucsi: displayport: Propagate DP altmode entry result
>    platform/chrome: cros_ec_typec: Propagate altmode entry result
>    platform/chrome: cros_ec_typec: Report USB4 mode entry status via
>      callback
> 
>   Documentation/ABI/testing/sysfs-class-typec  |  34 ++
>   drivers/platform/chrome/cros_ec_typec.c      |  11 +
>   drivers/platform/chrome/cros_typec_altmode.c |  32 +-
>   drivers/platform/chrome/cros_typec_altmode.h |   6 +
>   drivers/usb/typec/Makefile                   |   2 +-
>   drivers/usb/typec/altmodes/displayport.c     |  17 +-
>   drivers/usb/typec/altmodes/thunderbolt.c     |   6 +
>   drivers/usb/typec/class.c                    |  95 +++-
>   drivers/usb/typec/class.h                    |  16 +
>   drivers/usb/typec/mode_selection.c           | 505 +++++++++++++++++++
>   drivers/usb/typec/mode_selection.h           |  42 ++
>   drivers/usb/typec/ucsi/displayport.c         |   4 +-
>   drivers/usb/typec/ucsi/ucsi.c                |   2 +
>   include/linux/usb/pd_vdo.h                   |   2 +
>   include/linux/usb/typec.h                    |   1 +
>   include/linux/usb/typec_altmode.h            |  12 +
>   include/linux/usb/typec_dp.h                 |   2 +
>   include/linux/usb/typec_tbt.h                |   3 +
>   18 files changed, 775 insertions(+), 17 deletions(-)
>   create mode 100644 drivers/usb/typec/mode_selection.c
>   create mode 100644 drivers/usb/typec/mode_selection.h
> 


-- 
With best wishes
Dmitry

