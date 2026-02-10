Return-Path: <linux-usb+bounces-33255-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHtMCLYki2mTQQAAu9opvQ
	(envelope-from <linux-usb+bounces-33255-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 13:29:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9309D11AD2C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 13:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D60CD303E2FB
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 12:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D11D327C12;
	Tue, 10 Feb 2026 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tos0V+pK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FUTvyl+C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFD431984E
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726462; cv=none; b=e139LJw/G7LxqgAzGrqSdXLNSJ8GjHtnkyFI5bKopQjg4/hBTDv0oiKvB2lhX2vQwLhrGTYGZPfuMrJjviQMTjxY2ZOtdUxZY3mSuZlBU+Goj8Fb/pAfrOTtWNThdguSDmVpZzyxqWoe4KhHPRklDDJaiFSMd0NXhWflOv/LCNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726462; c=relaxed/simple;
	bh=efhsIlUcgrxJHBgx9tFahFZW3O2XY8N52nafIZ7BREo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bH4yRLqXe8oB3De2wt2+hR840UNCWnoFNwuW7GaU8bG5tX1RMFU1utzYnH7O7Fb3rad7NFjaST0N2lRxXTGDoyj+gLEJZ0F4oBBFDH6p0yh2srG9BlYJjlPCYFM0vMo5fxZ3GUXWDOHxdA6nx23D9CAkwWml3hLA2FcydAzlSAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tos0V+pK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FUTvyl+C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7Z3aC2169241
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 12:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0MYFCYT/8/l+a8Upz+OX+GW9
	39DYsFckcT2Q51X/lXM=; b=Tos0V+pK+QqxYCJJ/XXhqh1NJx/89Dlp0BpLQ8Ni
	EBlOooAIaKNPikRXakPaLq69GB7Zk17z/P5iGDezAxmb99Wj0w9fB96VV/4HtDm3
	T5gFT8fI3/0tB19gIGg5meqVh0xSStFlNf4ZO9CscLdZkAMzcG1ehIALzb32AtA6
	ia+yF8EwgdPxPctpyMfplpEi1AT1i/2Fn+kGDiXjNpwNCP7lHaKPH26ijVeVo9qe
	Xwwofw82Yp7Heq1xq4Lk9g3InCUokhVx/PqfhvjYElfX59grIOnvlxyNhn0anDIv
	cf4aL+1thUBtbw2Ec6uaqg4iAbQ212Qqb+wrc575Kih12A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c80drrxbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 12:27:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52f07fbd0so1715828185a.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 04:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770726459; x=1771331259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0MYFCYT/8/l+a8Upz+OX+GW939DYsFckcT2Q51X/lXM=;
        b=FUTvyl+C/XMJbwU9l5bS1hQG4bETScic9RyEXpJYz1zpPpGg8nBQVFZ/pfmEIUNAK3
         0uW8VlV8sgCocFnKC1sCRf3gam1yhclkwp9mLnjRtyWuYvv1l1AODix8liNm+adjdWMR
         3/YFwXBCTDecgjvnAvf3zj7kgbrUzVQxD4uTdO+xvdH8G+hxDv6LORRPmDHEx9zUzNup
         DOwt9s+myCH5xIdGyIkYkCiODCkbcsAUMCYddF7lfbXNWYkJpHWbswydkawksUs8D6Lx
         uG7LmcT3BGCNsrvqMc/TwZpKL4S4qbAdOU37P6vLFS9LFi6+A+hAcEJd/fkyLqF2ijop
         csOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770726459; x=1771331259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MYFCYT/8/l+a8Upz+OX+GW939DYsFckcT2Q51X/lXM=;
        b=C63OVmBD49tutIsscbNVMXNM2fGaG0AYsg0B5F5VNKkLGjYavrYAJ60Zs7gw0O3/J0
         hkwZ0Xick1zdGr5MEYAMbfjyUBgd7KO/xMYclpVG0OwDlqAaWKr6MxIAyZIljQdU6fSC
         3xf/z0wN2zbOSimYq8uoiL4xeqBMdjdFWLg3W3u9Swim5OqWi0CEftJ7hJbw7P7Bgoal
         7ArR0cmGeP4NToJqQxXw3UpBvImCMl3M7gh0v7W084tVff3pn8IuNKKOEeW9aAUo0Hqr
         vyjSVTi8JcmsnuzHVMwZGhqfX1LFzerfCMlVeodn6sFaelB1PhKOcmTiJ7L3NXpfK5ci
         5hrA==
X-Forwarded-Encrypted: i=1; AJvYcCWmycjU5zwxQWZ93vzTI+1PJHjTqj6ID/cA0/x6K/NEWKQChreobhs+FMZcl8qsY3IyQR7072VP1I0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9jtUFxeIyMOxAxH1RkkBYM5rnitd976kZp4f2wrq1QcrLNUTR
	eg3qDDnUpypPqwaEqZzf5L/B9cDLKXs+CsyHvzZSOSFRBIpn7FkpKotL3GTiR6YvFalHGfcI2+o
	GXCe8WfuZE5YEi7uyNOgyQx/abO9Kr1Z5FBvejRL7Voj+46adr8XIFT19T4b2ju8=
X-Gm-Gg: AZuq6aIhfdHMHHlLhAsSQjkVxKaCwSgl827EXdcl6zmqRYAHBZ274W1WvoHxF+7hh9i
	pBSwwM5z/VeWs6TSfVaBAUph2aQeyHDVAyZIpKtYUILKxd1H8CWniBKxAA/VtMTYRJhaqoHHTuo
	vTU6diVSmYqY5byICYAhSfnRLVAY2hmuouPNUwymIDL+GNHYDMciq1V7zql3WqaP4vbMWT3HsfC
	SEwy+oRmSZrY/L7QFsD9sIlZUos9jrxYovTDY+YBQFbXt+jRKMK9OrgN8oDpMsDSed28OBAAzt9
	dTH4EaDh0MUDfHYEjDx+qpyzBJ46ImgULaDO9tCIHNbqyec/HCZ40i4JbiveTQfDKL/T5G3gA2F
	TTaL/ehACqNFPLlOXNCQu5avBWFXRuS9FfZ6HCLTRQeGJLDKQysOIGVRwcCl8pjUrF2BUffpVvw
	a/kWAt0b1wST651cTN+7sKoyEh3NlENBAhHUY=
X-Received: by 2002:a05:620a:1a9d:b0:8c6:ffe3:49e4 with SMTP id af79cd13be357-8caf10244cfmr2024235285a.52.1770726459348;
        Tue, 10 Feb 2026 04:27:39 -0800 (PST)
X-Received: by 2002:a05:620a:1a9d:b0:8c6:ffe3:49e4 with SMTP id af79cd13be357-8caf10244cfmr2024231385a.52.1770726458913;
        Tue, 10 Feb 2026 04:27:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b6236383sm32602591fa.10.2026.02.10.04.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:27:38 -0800 (PST)
Date: Tue, 10 Feb 2026 14:27:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 3/5] soc: qcom: pmic_glink: Add support for Glymur and
 Kaanapali
Message-ID: <hrlgydepwoh6jwrxi7if6awparre2vhehxywshtxv6s5km6jkq@2hkh7qhawkxe>
References: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
 <20260209204915.1983997-4-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209204915.1983997-4-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwNCBTYWx0ZWRfXxmMsAMfX00nY
 tXYaOsFGMfSGM25IcdPG+YdPuVrMWND5ZA5TLUrlRuDjiD+wmDGTd5LyjjdY2V+BXeVyKiyVega
 8KRrmaDPRVBc+t6K69iTBT0qZ0JtpFAf51gKyI4RC7vB/7g1F2Nq5dqUqfTSLesLiTT+SuxPJz/
 K40DSwElG3R6qBI3WEGiRjAvPBQo1ROmKPK0bxv6xanFasgIn/XG5d2c5W5e8hsJEoPoS2y38m1
 tOJDZl9+C6Fg3BtFesMAopvN7p1kW4SsdxwKWghLJRrtShT6s7Bdpg51rbpdbKUa5V+9r3EVsJQ
 Bm9eunqTnzWmpvihphIzylKB2Merm0gryRvgEzJO+ajdZcTvhmuuUxaUkiD5ayHd3TRcd2NYTnS
 3Z+Ct7z0xOwrpqNVFzjWtXZZ+kfxefDbe0XhTGd+xLW0GRZuhv3FWXB+H+CwBLa4iRplBv5uXlK
 cN7Nm2V9PluhjzyzFmg==
X-Authority-Analysis: v=2.4 cv=fd+gCkQF c=1 sm=1 tr=0 ts=698b243d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=_MtkEuZf4ZNMOBkvimgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: N8IMltR1SujWloLAvV0zfd37oGj1l_n_
X-Proofpoint-GUID: N8IMltR1SujWloLAvV0zfd37oGj1l_n_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33255-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9309D11AD2C
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 12:49:13PM -0800, Anjelique Melendez wrote:
> On Glymur, a compute platform, and Kaanapali, a mobile platform, charger
> FW runs on SOCCP (another subsystem). SOCCP does not have any specific
> charger PDs defined. So, add support for Glymur and Kaanapali compatible
> strings.

Ideally, this needs a brief explanation that they are not compatible,
because of foo bar baz.

> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index df2fd03d3b33..3042261578aa 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -397,7 +397,15 @@ static const struct pmic_glink_data pmic_glink_adsp_data = {
>  	.charger_pdr_service_path = "msm/adsp/charger_pd",
>  };
>  
> +static const struct pmic_glink_data pmic_glink_soccp_data = {
> +	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
> +		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
> +		       BIT(PMIC_GLINK_CLIENT_UCSI),
> +};
> +
>  static const struct of_device_id pmic_glink_of_match[] = {
> +	{ .compatible = "qcom,glymur-pmic-glink", .data = &pmic_glink_soccp_data },
> +	{ .compatible = "qcom,kaanapali-pmic-glink", .data = &pmic_glink_soccp_data },
>  	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_adsp_data },
>  	{}
>  };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

