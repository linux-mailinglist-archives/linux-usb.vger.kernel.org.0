Return-Path: <linux-usb+bounces-20639-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB71A35976
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 09:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EECA18918D3
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 08:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390722288C9;
	Fri, 14 Feb 2025 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+c3cKgJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B36921A450
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 08:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523288; cv=none; b=M8xSDZsgGNLckEhvrbFFt8pZdeAt7xHa9MWLHz1KCo+CNzD0Z9DcXLI0jH20ukqC6WAjGBISki0g/ETVFqKaQxRryy8ee5uy/FGjdOpM/ISxM3can0H0u8hKGzpKMKZrDJGr/kYVI0VYIOfmN9EUMWL90bwJI/3ZrGQUN7tMa7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523288; c=relaxed/simple;
	bh=nottMoCa8aOV6cZJrL7jEgHZtPVKHpnlgSU38rOQ4Rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3ciL02OHwoZ91Lp/Lot9wxPkb3KxQjRmX1i1+u3KLwm6V9TrrBimTqeEVMrkOVGW8akAUVI2Y5pIUCxD+qQpKbht65TepvQ/hnjzUgkBRrjOX2S77XTniWKXDy7nowvbiXtycA5MwbqQE0OTLTddcPFK/QIIn3cvr5EYKhNUVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+c3cKgJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E6dVRf008066
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 08:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oj8Yee1gTVBAR2OBaCaP5WIbxHVmvmbfZUuTZOcJOb0=; b=F+c3cKgJcLJCsO7V
	dgCJtO3SX5tsVp+RlrPGgFkVEJrOR8xqtAkpjPir+M6c6iFwpX5EmUrsG9De5bH8
	hv3GFCTKM/OOUmk/K6QgcTegivoktt/tbpo0OjojviWkBb+F+CaURrdhm0NmPNZ+
	2L8oXk/EdjaoexbU2FzUm8VxZIaRbcwxNwGaQnkO0J7hdI7qoJ4HTp1D5gsRr8DV
	vyo5H1pDwEWMdlE+mPFXAn5uAz7MEx76h0AEjfd5ZgDxfC7pAU+fmpL2qj6pw/sj
	ZcD5t26lmfkDWBAgTfg9qVL0oh591nSEq1cYIecY9vFTyrwdNxTcCMjXsa3jjXq3
	BdB2Kg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rr1qxnkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 08:54:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21f6890d42dso60742605ad.0
        for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 00:54:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739523284; x=1740128084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oj8Yee1gTVBAR2OBaCaP5WIbxHVmvmbfZUuTZOcJOb0=;
        b=GT21jAYtRRIFnq67oYOj9RwykJ/NQxYVIRm94X11i6fESQRHi4VoUaNST8HL40XzZN
         +ZAm8jyRjZkbalQgsEoc/YyP/LVgtyMxoOlBly06ZKGgFYkpPNZ3fMy+VMAlKoDyIhVf
         580bRmOIur79AxyuzFiz7Kztbc08nciH7Mt6tcexYgt1YQmaWLl3S4JXT2w7Ha8HXxBY
         RFPP8yF3dqCmd2pJwcCJyyheyZF5GRL7l5ZNHzhkeXX2T/Gy3BhUMknCdXsoB+PuPEBk
         q0Bqm1C0/se35TkMSO1j/RtCjk6h5YgMOSbVSID1In7OpcLw0ZuOJ1GQiylpZzhcGNGy
         U3vg==
X-Forwarded-Encrypted: i=1; AJvYcCUfc0MxVV9EFz1sZEue/6ohxHr0bp1WR1Va8n6SIjDCYVb6C1xVlx5ybDTD2Mx2ek/AxytX3OpYEfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUViH9tYefIrBSM0/9QuIKMpficdXpf9oO9Nme4jC3YIsKotbN
	ce7v3aOJUzaPlOl2ZoHQwaCkKZdbW3BWqg0J0Ir/BdpsK3Kpc8KwzRwGepnaoNIHOdl4ITzsyj1
	DnjNMpAw+HzYqJ3tV2RlPimUokofKUkFEjO4tR0+Mg4stWZyHAJeXsQa9keY=
X-Gm-Gg: ASbGncspfMYbWQmO+HPrXdEmY8tbLdcW6c2ElztRAwz2EtUqc9bsYPkXM6/w/jVhyi2
	4IPA7Lh+O2KA8kjYXVOh12lx2lMveYBipzp+Qi2b1vMLa872lJxajMRVzN5t5OQCxrCPsADUJWS
	w2FJxZOK/Rl8osGu2B+hxhH58j7nwq8B1t7C/FY1YbbGyfvcxLrzlJrtFG/dHuhOuox8bgyf/7R
	Ky28BfRYP7kO8acDYnBIdgTOof8r+QYQPAU1ryHMDmGwHRHehB4CU4G8UNrnAjiIazFo8/5thBB
	/U030J0ZD9DYyz2IwqRA5p8o70NA9A==
X-Received: by 2002:a17:903:189:b0:216:4d1f:5c83 with SMTP id d9443c01a7336-220d2170847mr95303755ad.47.1739523277211;
        Fri, 14 Feb 2025 00:54:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8WQ+Q0P3Hp8eId28DGCMDHWq1vMwRmUui9erU8zLhPW/BTEuxaCh7jaJut82nv5+tq8vQUA==
X-Received: by 2002:a17:903:189:b0:216:4d1f:5c83 with SMTP id d9443c01a7336-220d2170847mr95303455ad.47.1739523276763;
        Fri, 14 Feb 2025 00:54:36 -0800 (PST)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545c8e7sm24344555ad.122.2025.02.14.00.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 00:54:36 -0800 (PST)
Message-ID: <bf19304a-c9b7-4647-b33f-cf5e771cfa83@oss.qualcomm.com>
Date: Fri, 14 Feb 2025 14:24:31 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: u_ether: Set is_suspend flag if remote
 wakeup fails
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ferry Toth <ftoth@exalondelft.nl>,
        Ricardo B Marliere <ricardo@marliere.net>, Kees Cook <kees@kernel.org>,
        linux-usb@vger.kernel.org, Elson Roy Serrao <quic_eserrao@quicinc.com>,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250212100840.3812153-1-prashanth.k@oss.qualcomm.com>
 <2025021436-seizing-prankish-ebf2@gregkh>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <2025021436-seizing-prankish-ebf2@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e1Sg5QopM2zFoz5-3c2UW9wnCylHeJ2m
X-Proofpoint-ORIG-GUID: e1Sg5QopM2zFoz5-3c2UW9wnCylHeJ2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=772 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140063



On 14-02-25 01:30 pm, Greg Kroah-Hartman wrote:
> On Wed, Feb 12, 2025 at 03:38:40PM +0530, Prashanth K wrote:
>> Currently while UDC suspends, u_ether attempts to remote wakeup
>> the host if there are any pending transfers. However, if remote
>> wakeup fails, the UDC remains suspended but the is_suspend flag
>> is not set. And since is_suspend flag isn't set, the subsequent
>> eth_start_xmit() would queue USB requests to suspended UDC.
>>
>> To fix this, bail out from gether_suspend() only if remote wakeup
>> operation is successful.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 0a1af6dfa077 ("usb: gadget: f_ecm: Add suspend/resume and remote wakeup support")
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
>>  drivers/usb/gadget/function/u_ether.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
>> index 09e2838917e2..f58590bf5e02 100644
>> --- a/drivers/usb/gadget/function/u_ether.c
>> +++ b/drivers/usb/gadget/function/u_ether.c
>> @@ -1052,8 +1052,8 @@ void gether_suspend(struct gether *link)
>>  		 * There is a transfer in progress. So we trigger a remote
>>  		 * wakeup to inform the host.
>>  		 */
>> -		ether_wakeup_host(dev->port_usb);
>> -		return;
>> +		if (!ether_wakeup_host(dev->port_usb))
>> +			return;
> 
> What about the other place in the driver where this function is called
> but the return value is ignored?
> 
> thanks,
> 
> greg k-h

Other than above one, eth_start_xmit() tries to remote wakeup host when
we have some data to send from n/w layer. In that case we try to wakeup
host and directly return NETDEV_TX_BUSY to caller. If remote wakeup
succeeds, then resume() would call netif_start_queue() which again lets
n/w layer to queue skb. Hence we don't have to check for ret of
ether_wakeup_host() in that case.

Regards,
Prashanth K

