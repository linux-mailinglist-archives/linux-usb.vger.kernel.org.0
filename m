Return-Path: <linux-usb+bounces-37765-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB6lDSiIDWquygUAu9opvQ
	(envelope-from <linux-usb+bounces-37765-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:08:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCF058B5E4
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FF03304D9ED
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 10:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C6936DA18;
	Wed, 20 May 2026 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ueg5n+22";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ol6RSgvr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFED73AD515
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271671; cv=none; b=ViMNqTOY2lw/Jkbnvx59HY49PukLc+VP3lfqRQt0knXbbQ05AtKxYb7WanJip0j3DYwGnb+v6ffencAbW3uxyRegmgoNfS+haPMiWHawOPRgobpwPZ133yP/yLarzzOpQWyS8b9oNRN4oqtZcH2a8fjrmEDFxCOJnG3F7yhNphI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271671; c=relaxed/simple;
	bh=F1CzCtLxJoFHt8P+kMbN8ysS7uTa28Ev2UWktcjoHkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6v/0EcQdCRDKKZ8dGwTPgNJqrwyGvfHSUq/lsHJTyCc9KTuv8ob626IxM0cdiMvV0apq6ToSK4W1UfIhZYbMVe3H75S44AeF/3g6BLBE9QIns01VpIpDvkq/uAzPsTJ1zP6a3v6Qb963HUKW6oGdQGOkNwEzn7DoKXyPTX/X00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ueg5n+22; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ol6RSgvr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7KPV11725603
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nl8sC+8zm9kIr8pRpH5xNL2N
	YcseFu9h8lAGzNpYcIs=; b=Ueg5n+225sJZYlBZJLyY5ONCd9Sh4LVuHRifLyEp
	qXYILQK3xkQmrkiOGp/YrRXLtmJcNsqdBNkVxmU5yJlDm7UamWOAjFQoEU83zPO/
	KzcdPVAfVSwsLzj4wBxEkm97ArNrTepOOmL9kb+TKLspQwiDJycFOLCcP8dnOI5Q
	4p1ArxmOUhDVl01XyCYkjjzUD9BXdN9hGGBZfwAjaOA91kEZd8NyADz0BKaiJttS
	dBABC6+CMXq0J5NO786MpaR6B9wbINbvUzqE98tSpRNG0JeUNJlr+G4vwYZ3RFIZ
	WO0rp0Mzd7doOcXHxIfxGEpTISsgpFEppqbC7Cn0E4ZxOQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qm7jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:07:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516879bf1a7so122323321cf.1
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 03:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271662; x=1779876462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nl8sC+8zm9kIr8pRpH5xNL2NYcseFu9h8lAGzNpYcIs=;
        b=Ol6RSgvruyXEMYSfiXDRLAD45QSg1rYj1bdlGQTLiaFBr1bfkDo7Nwa9PkHmBbIieX
         PGdLfoHfDCndN6azM5SFqbuWl5gZk595+sUl5t/Xtb7PM1D0TzgcMO25ONtTMwtYuSkg
         9Q9nCsN9tHpdJLdnXWmN3b0OsjBhaKagpy9JQH6bZVATS2j/G701FBKzEYlCWT6tjvqQ
         gnWZhGrbpZL0EeScSdSg/KL9MCfR/+tcy8vIJRw2E7GQCk1dkuXiIvGnf7r9WFYZ5g8R
         NHEoKkN0XOW7f1bv9vu2boye7YU3RZg4OcxoQUr4koXTc2y0VvTgsUbn6wmNUPCnOFxC
         yhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271662; x=1779876462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nl8sC+8zm9kIr8pRpH5xNL2NYcseFu9h8lAGzNpYcIs=;
        b=Ia0/mHFWMZ3/whaKtWtRvJqwCxvMKLPjuEWfZQ17alOSvltAheYMoyh0rd6ao27BMn
         erX78SYUGI8BHc8vxDgUvGEHwDcMGwX7aKRMprtaMlBqHYNlIltdzBqKe4O/XABQNm6B
         66fU32YPNs+WBRZlt01tSOml8v1Od7qtIoEZgmu9rzUXCWU6gFk9ZYR0s8gGJW2/smD3
         DxeqA/MUxCO2Kt042JRS0w8pFReL77tKhTCtK8LN6R4S9J//THHctLqVT62Eed3O10NL
         VdrtGT4CfcvcAPz603KCMTsMwaG52Z6LCQOreCnY6f1nH62QYinOzZQRywz8/TOIOjFl
         JGig==
X-Forwarded-Encrypted: i=1; AFNElJ9VzWyRSWh3R0eH1V1KPdgEbTkYV5xprH1U1yq93t3n0ttO2tvoYKx07OGY+OEA31fle3Nq0n87MSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw6328DVMsIJ3xphpLs5pPvVmLLvWiqpOXLOYg1CWEYl4wt3ws
	3/yVA2p2ew7/Y73hDAwJBxXNC1HG5a8YFafZ/eBRLJKhOLOMaN4gFezRy5qr/XcAwp5N47SarM0
	aMuWms/5LLuQ7v8wqRNQQDD7ftGb7+hxzuuJZn9FoVpXKNTiQ93lnMN53Fxydeqo=
X-Gm-Gg: Acq92OHs/6gQvR3yKOZp8lLbDNtWCPzftBIYFa3FZZoYPg4MCzaXfmx7YO53TyVG1hh
	bHzXAJMKDe4HKDCXKibK3te7vge1QXgUpDWmll59voWZmm/rE52FGooDk2XtQCnGAY/WEhCSlJ0
	yzVACcAu2hR1dceOlyV47cPZTAEOq7VA62mp0VKsmVo/uLtvIbFw2Gkx9YyJiE+kgk/X2DJZFDQ
	N8Vuhb9N0nhHheP4j6Xbdo5CJ9SePPgKpApETMfoqldbnlQPwe+fLTQZofTQ+H7KnNJGY93pJRR
	eyIMKIDo3WCyPAVQd7taYhPoQ1+aCkKynEGxQFQj39KxGFiVCtomnnkQeGbwctSERw0YIP8pBVO
	ShRqgm8EFwFReSNIPq4pJg7a16wGBrvLU0T3SMObylvHmlya4wZiX4Mf12Fnh3JSfd6Cw8+GS5O
	I8eWOo/PpAOLvdyypL1kp9l6JgRgM9Jn2PJYwyBMMcXBKfpA==
X-Received: by 2002:ac8:7e85:0:b0:516:4059:f035 with SMTP id d75a77b69052e-516418b93eamr343913741cf.29.1779271662482;
        Wed, 20 May 2026 03:07:42 -0700 (PDT)
X-Received: by 2002:ac8:7e85:0:b0:516:4059:f035 with SMTP id d75a77b69052e-516418b93eamr343913481cf.29.1779271662034;
        Wed, 20 May 2026 03:07:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c531sm4787220e87.4.2026.05.20.03.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:07:40 -0700 (PDT)
Date: Wed, 20 May 2026 13:07:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: ucsi: ccg: Add support for CYPD6129 (CCG6)
Message-ID: <pchmvk4khwre5ib2qdjoq3wwxma55rxecuwuitfuchuu2undpl@lalm5eadakft>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-4-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520093902.2064730-4-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NyBTYWx0ZWRfXxigKrsTq1gt9
 b+yqAfGZPgOlRaLMD39f8R+neER2mbLnkIAw4ikbRUYFeVvsmzlc41eueL+81+JsGMKcr46IR6I
 1O7h+U6U0piLGVcBfDDAa8YU8CQbP0Gwo9rcSxp/B9U+LCv/A5gqnebkbBSl60TnQy/8wJFlsgA
 zpiX7NIB5KcZv0+++hWhlrwhnnO8+CtkwAC7a5eMkf89f4Xx3cM0aQUWHQDW8VnkeRCRNl5OXTt
 qj3sxXs8FvuOHyKRVCeCuEo67WL+nU3WqjnEQ3zGp6Sl4FQH6FA9zXYcb6DbZxo9MGmcbP87otO
 ucrdDWEDD1A46vH/EKcJbL3hjsidgbs101rwklQUXqdpBzo71q5sVSERTK3z6as1q3EqLGJW/TJ
 nXmsw08vllqFEnYpj9Du6nGg7YXlSP/prdbdWEJ72kx3kLOOYhop7vbFewKxnl7GGYaxdWrU6vH
 Diw0mR3f/vhgkK3HBHA==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0d87ef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Hbrjtlq9a-Fw36vF3dEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: W6CmWojreJ_4Uqtb-iZXMZ_ESMOSm15v
X-Proofpoint-ORIG-GUID: W6CmWojreJ_4Uqtb-iZXMZ_ESMOSm15v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200097
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37765-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DFCF058B5E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 03:07:34PM +0530, Akash Kumar wrote:
> Add "cypress,cypd6129" to the UCSI CCG driver match table so the driver
> can bind to CCG6-based platforms using this controller.
> 
> This is required for monza SOM USB-C support.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 199799b319c2..0695ce348135 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1520,6 +1520,7 @@ static void ucsi_ccg_remove(struct i2c_client *client)
>  
>  static const struct of_device_id ucsi_ccg_of_match_table[] = {
>  		{ .compatible = "cypress,cypd4226", },
> +		{ .compatible = "cypress,cypd6129", },

As you are using cypress,cypd4226 as a fallback compat, driver changes
are unnecessary.

>  		{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

