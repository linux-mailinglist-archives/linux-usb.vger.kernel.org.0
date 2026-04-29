Return-Path: <linux-usb+bounces-36705-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCifC51F8mmApQEAu9opvQ
	(envelope-from <linux-usb+bounces-36705-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:53:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A27549857A
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4E11300F7B5
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 17:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9648038C2C0;
	Wed, 29 Apr 2026 17:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGSwPo79";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sbq4CObu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3413537F6
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777485179; cv=none; b=mwn0xClBhjbcIyHAX8t24w/KS6M4+kmLzWAxcXRU3hXDc999uMV22tzd6t3p4KPDOGO1manto3hP9ef8bGqYr/bC5d60AuUVGfeUT+PBZrTUcyVtMkj8hMYaB7+KKSdnLVGNP5jvSiVbVl5anFSDGXQcYcdB1rq+XSkxrnYWXpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777485179; c=relaxed/simple;
	bh=9tUvGreN/jzc8dUgMypS7VOK2O0dvFJsYzLLXf7V/X0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Hnnj5ibpFyEf3pZiQwm2ZLUnfJPdWZhKiae3CIVx3WgKV/A50jb+YeHquXnFiPmaMdJ4LPww6Dpk6q0geR48/VqSiV5ShF5rXytmL4JBP051d41MGzIDAJpmiHajr0USP0BESzVdfuIAtu/zcQg8v9G78m2GkHyod2xB57dYJsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGSwPo79; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sbq4CObu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFHCKj2094140
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 17:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eW+nOS0yaVrRDy95sqZ0Yxy8KhK0nrYWKOhmgEMXYf4=; b=UGSwPo791QA9RbNw
	2Zz7QbO78zN5hCDd5VbvL1F8wZ0Uk8qoWoFJvmPrzEuQW1R3+qKCKNTOPWR7jaeB
	Pvo2XgTZIe+fmvOsqwn/mbmDsk57EdC2hNrdme358cTKK/Z4vUOJu5EJPdmmHXs9
	0t2613pKeDnsGGIDn8w0C8r93GhBT5Oj6W8bUxWfExJSfdvc0w67wsdKmhOELUJC
	9VC7jv0xQw+HpQB/mUmbe2QohGK2xv7+356PhiY8+Hf2c9YIJz5au5xpJpdZr0td
	wGte7fN0t4mppb78nPb9Ch1T0CkkYzSK0XGq0B/aTh5X5HkntkAL7EPoareS87jn
	YS4Bfw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3tm07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 17:52:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso142719eec.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 10:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777485175; x=1778089975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eW+nOS0yaVrRDy95sqZ0Yxy8KhK0nrYWKOhmgEMXYf4=;
        b=Sbq4CObuCUwfIHth9jUT5QYUAaxVFvol2SZvtV9qjm6CLEGL1D3sB81G9WGcL85071
         aCSj7Ud/3BSKsvgmx4CU8EfnL+ThOK0eW/AJiJ4jLHWsmrGwuGXx86Xr8+ErKOu4HO1u
         M3CgbvbHHdVhMEaa2/t3QzQ21QmFCgLHWbSeWM9I2XMDIfp85i/9kDOMH+6y46qHjvFL
         XXfDpXrE1+UHl8yy9HSzSaDFWuRFuh0ME4fxjLPmakg82HsGIk7DfLKUx3A8qvJED1Gy
         T0DUD5/6iaA42Fe8HtKtfASPIm/qG+/M4oMKsNtK/bS2HTjs6bFibr71ZW9BlfzEMwwr
         9qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777485175; x=1778089975;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eW+nOS0yaVrRDy95sqZ0Yxy8KhK0nrYWKOhmgEMXYf4=;
        b=mPu/SyNFeWLnroi9rvA7G+foQxc801DgXnAOKdEzqbNdi1C5H01sqKdqoV30Hne3uP
         37xDZMP6IezDuTqY+Cx2QLCLjNKkQ/p59HmbC5Ro4GKTFUFJ95aFuGC1nnUMTdaN5Zj5
         xmlfjksHcbnxLB3gWg5B0sJBQVLkjOdsgkbVqZaProXzisXBUeMNb5Qy6JFko07Dxk+q
         Ty5qVQptL9+NizlBPFgIu3L8FNUtYFJzdCQHOZXWYNBm2pEAKQaSYh43Jmu2+4FqaGRE
         kJfR4orFUrC/ex61/vR0XCqAPblltED2fOOz9dbWjbxCsfpslgwDos9+5ACG1pgto4+1
         SQag==
X-Gm-Message-State: AOJu0YyJPOEf2DGlD7u9Ya13WLRLUtAgrTIyOX23rByfbNMfcIe/DeoP
	196UE1BTdPoY8QWvHMKG+d0/B2aud8H2PrRHlUJsmvMl32BK+1hlglewrHvgcmC7A2yW/NCyrNq
	BK24yFX0RB406+pHvJC3oe+NwWMAqgHsQ4vAanBh4FGOtpT7mCww3eiwl5TyFV+LOi1J5lWA=
X-Gm-Gg: AeBDiesiNPV3/vLMG9bmYkSxYK8BRS46af00fByqm4Oxtd5HJUcEKO9kcAROXVe/CWf
	miQ7KDdcPGXbvYyvEAz0r1zgxNbxZEIg73M+XONmyIhUCQ6a5mfi2v63PqgV7YDgKwUN2+mb1jP
	dtvHsshKrvkMdkhp4MKKAw/i0NIDe3kMBueM2fzOdmx+DnsCrJ28sALFkzUD8l/aQoeTYK1K3ii
	aUn0M8KKd4FVaBVxTh/58G3dVAYqdlVPyKcbfJZA/lWsGBGJ2r0MTo1UB/3ABBR2jovh9tp+Nbz
	e8oM0Tf0xWeeBqgiDQMoD2sFdlVheqGlIxs0RukCwHfTRQRxa8PdjTbfGm8VzHHYj876CZXtiFe
	27KFWKCv4ym8r1/fEaEabrhL/cBUkYpTHp1iyY+iMBy8WB7UYxyknOGRJNvevkg==
X-Received: by 2002:a05:7300:fb87:b0:2da:45f8:1b41 with SMTP id 5a478bee46e88-2ed198bf34amr2219526eec.19.1777485174943;
        Wed, 29 Apr 2026 10:52:54 -0700 (PDT)
X-Received: by 2002:a05:7300:fb87:b0:2da:45f8:1b41 with SMTP id 5a478bee46e88-2ed198bf34amr2219510eec.19.1777485174404;
        Wed, 29 Apr 2026 10:52:54 -0700 (PDT)
Received: from [192.168.1.133] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1bf6d52fsm3149803eec.4.2026.04.29.10.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 10:52:53 -0700 (PDT)
Message-ID: <ed8566ad-2a98-43c1-8d89-d4ddc37e273e@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:52:52 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: avoid probe deferral when USB power supply is
 not available
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jack.pham@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com
References: <20260407232410.4101455-1-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260407232410.4101455-1-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n7YTGDyGSz2vOnuMsm2C7OrdcUgvJ_6T
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f24578 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=76KTEkCVzLvc39UprA4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: n7YTGDyGSz2vOnuMsm2C7OrdcUgvJ_6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE4MCBTYWx0ZWRfX4wTgs7NxkLLd
 q51YahLL4GXQkph8h5n1V1E3R+0qP97j4ZFRUFeC1LOUxhIqk2l6krZst0KkX1oh9oi55fsa729
 oblh7cX8tCymxBAAcZ6ipZKoVY+9exbpWoiE15WPPodqmeuiZQBCl0j0oheIe9ix//thtD7UGLG
 TLzqWEcicIHkWRTeu1IQ+W7QcAwQg01OAJAwBb6A8h8WuAEsqfG94Gs+S3tQzrGVzsrLIlfJ63a
 4KSqqZUAGSNZDsVbl0dHWgaX6s5iq8UiUCNpELl1J0O492E4ngKUP7U9qUGLV4Kjfbqc4nwx8HL
 obcRsNNX6S+jKHVzIQi+Ty7Zlq42jcyO4/ovW+75x5O9bazoywJdGmS5eki+3h8soDDSxCO6zu4
 q8rdEvIyeNoEE/xY0AT8S/e3Fiu0CDayB855dfBOdtiV2u/LQfDCp39l4XpGliCaexkMGwTt9cG
 1b1BNgAlaj2GVMCVyqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290180
X-Rspamd-Queue-Id: 2A27549857A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36705-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/7/2026 4:24 PM, Elson Serrao wrote:
> The dwc3 driver currently defers probe if the USB power supply is not yet
> registered. On some platforms, even though charging and power supply
> functionality is available during normal operation, there may exist
> minimal booting modes (such as recovery or diagnostic environments) where
> the relevant USB power supply device is not registered. In such cases,
> probe deferral prevents USB gadget operation entirely.
> 
> USB data functionality for basic operation does not inherently depend on
> the power supply framework, which is only required for enforcing VBUS
> current control. The configured VBUS current limit is typically enforced
> through the charger or PMIC power path. When charging functionality is
> unavailable, applying a current limit has no practical effect, reducing
> the benefit of strict probe-time enforcement in these environments.
> 
> Instead of deferring probe, register a power supply notifier when the
> USB power supply is not yet available. Cache the requested VBUS current
> limit and apply it once the matching power supply becomes available, as
> notified through the registered callback.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/core.c   | 82 ++++++++++++++++++++++++++++++++-------
>  drivers/usb/dwc3/core.h   |  4 ++
>  drivers/usb/dwc3/gadget.c | 10 ++++-
>  3 files changed, 80 insertions(+), 16 deletions(-)
> 


Hi Thinh,

Just a gentle reminder about this patch.
Please let me know if any changes are needed.

Thanks,
Elson

[...]

> +	if (!dwc->usb_psy) {
> +		spin_unlock_irqrestore(&dwc->lock, flags);
> +		dev_dbg(dwc->dev, "Stored VBUS draw: %u mA (power supply not ready)\n", mA);
>  		return -EOPNOTSUPP;
> +	}
>  
> -	dwc->current_limit = mA;
>  	schedule_work(&dwc->vbus_draw_work);
> +	spin_unlock_irqrestore(&dwc->lock, flags);
>  
>  	return 0;
>  }

