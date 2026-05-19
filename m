Return-Path: <linux-usb+bounces-37696-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Eq2BmVMDGrjdQUAu9opvQ
	(envelope-from <linux-usb+bounces-37696-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:41:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B4057DD71
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D2DC30272DC
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 11:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0158A4963B7;
	Tue, 19 May 2026 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bktjc/7E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YV6TpGyU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9A135CBCB
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189967; cv=none; b=VQGF64h2GjOmx1pDXMhhWy4US90dLvxh70jMrf0XcM/zLKbjMYEJN3B/dnUS6Uig5Cy+oE2joL379g5005BPdET50oOK6uxpBRKDSIEN3MQvFjdzDePEfK2HuF4mBP38UsUIZes4hEjEYuGwCA+GChuberdxFAuS0UP33FUUCeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189967; c=relaxed/simple;
	bh=ae7AKhMBbsI9tb5fUkX0WcTb0/TIDX/YBF9du8S0Puw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1t0TWqk7tNHsUYdE6boMP0b21A3/OVZlkLsYU/XmTCGchrkIV22JFAhCPTIkCWbLq0xd6LzsSqvICsWBbwUeYLbmLAD6M51L6mZ8pWWrc/+AqPZmVCwNcGcXgrUtxsfEgBpO9wWAIcpXohq519d05DGmdZK/W3pziPTvx1J+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bktjc/7E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YV6TpGyU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAccPO4130970
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V2qaDEbArwPFdUbmMClHEeKqelyfCK6Oudya1L3F0SU=; b=Bktjc/7Ey3YEsZ3l
	KlcIs0nevjZX76IVdm2Ml8C6tGI9k4BmHKR3KbFwr0HRgYtewDZY47tJEUsOp2MW
	7GYFNjh/IoaQtMTHHGR/SsH1UKUaFx6L3YUqfAjHGozs9rxc3I7CTlVmMFaInqQ5
	IjsD/ZI0VHuGDvUmvwshqi2f7NiRK9Aih52PoNUScnDiCwO5verHHT+fXMYNAC1W
	OsXsD2Tgs3EBPjbQyfrpkNP4Pd4DHBoCSH4ZEXQ6K/8ckq0e0+hwsk629+q55jH7
	M4D1L6SANWbQePb9DYGMS3Udc4culShJElX4wqS8Q6iLnBs6mSZ6ivWcgZXpwT9Z
	csgWQg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1hfnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:26:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso20932871cf.0
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 04:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189965; x=1779794765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2qaDEbArwPFdUbmMClHEeKqelyfCK6Oudya1L3F0SU=;
        b=YV6TpGyUR6c2r1cG1KSRdyflP/nyFo40jP8+f1nalK8jL37/cRyqJeKr3A10ggwio5
         Oixp20VaZ6P5bBldb/GCNah2lYdaNlfY8iT+v6kiI/rOib2vxC6H1MpcxxeBreadtcLK
         +KpmXmTzRZPh6Y5+G9Jbs4cD+6XB7HxpJiYJZ5KH54TGh0hZ8YQCZWAbXFJbO546n+lU
         wAEUsh0zh8gWLUfKYzVUubs3uobNqcqMtnscOyXlrAqyVjv5MTTx9tAI3B0OIALUu+LN
         2dUwFnDkUD7ICdUot8430BgleLN787tJpJIPc7WLUCmk2aKLm2ve5rY/+c4iBsQViTn3
         5bqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189965; x=1779794765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2qaDEbArwPFdUbmMClHEeKqelyfCK6Oudya1L3F0SU=;
        b=f+oJNOp5aNB0wmuWWhsCCvG9++PpBZAtDcmLT9VCyp3QfYX1FLI41lHJUBEN0xWxKH
         ditAUf5giz6U8fBF6J20Da4Y/R4uBnt5WbHjtDHVcN/NlV6HLq4bVn8sb0uPwLvZFzIO
         oHuGB/si9PcIUz2nEYxmL8ZNtz9gDEOdLnl4Qhj9pgP9jU8jFo5rNy4/KWnIaJCOzXaf
         QKJ/obmnpvDaFQvIslVVkWo8Rwj19hWlBoV0k4zSkM7HKDUZkTouvjS7lDpqwTwGgbIC
         aj+1u2/zwnoqgEswMd6e3UBd4nZ5JEFKbWnk0ndcy/MDrDlLouGKGisPJqrppiM+hrTu
         xMcA==
X-Forwarded-Encrypted: i=1; AFNElJ9/L4G5ilsWWmz/QtokmmYg0UY0x5OUcou8Gr/057m7N7K34UStVulv1faK4uDooz5HmkQeDxQVFv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhUb2L5LBfnGn2N+FMc7HQh81WIyjQ6TUjEXeR1vLFM5thq9vq
	Ck7xeor7fO8HNRVl3JEJahyyHfuH+oJwdlc2XUhk7nkxCIqeQBv/VHTC9t7CFmthqOn6tbqv6zv
	zNFLWPuoxdhTh1kUqWvz6sZ/7NH+B3FzFWoSUNb/CEhqbMMz8s1A4oOCxAA8XOfk=
X-Gm-Gg: Acq92OE8Sp1KdLJwr9r3Hbau1bVKqrEmt0Waaw3Is+ZCgOFM5AMJGFRzh4ptvL7PrPg
	uGnXeGN1BKmta4L19FGFffJFq2eKCzm0dcUadMngjWkEoAxAKVUEfhcSi9G21Tzd03tj85VJ5Z3
	n8Oc3Pw++JwLbsJk6V9QU/u2VXzG4pad2jyJ3pNCErSIUW018kUVEIiRzgfamXXdOZ8XaxtIqva
	5Y1j06Wo/PJXx7ufo4y5hfcd+M1I4nsj9KGHuxjGSeTyaTnOwS/hBIoUdF9YLYlgYCMYD1LW8HN
	dut19a0JqGbk19ha5Kkb6qw3rfU9rx1/mQrTHU9GbqQDs5Ip2A6mvYLvHC1TSKhMmmOLKXbIpgb
	PLALAPJhgokdUuC4HOooTqV8KRTtHYjIZGU9JYQN3H2RKCFjCBHrhnBlNdl1J/m4Fa8VkpA3SVZ
	wJNeY=
X-Received: by 2002:a05:622a:1313:b0:501:4767:a6f with SMTP id d75a77b69052e-5165a1ddf59mr182669591cf.3.1779189964757;
        Tue, 19 May 2026 04:26:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1313:b0:501:4767:a6f with SMTP id d75a77b69052e-5165a1ddf59mr182669211cf.3.1779189964293;
        Tue, 19 May 2026 04:26:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e2d75bsm686163066b.45.2026.05.19.04.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:26:03 -0700 (PDT)
Message-ID: <178923fb-b3b5-4c35-9255-0e7194b89845@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:26:01 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: usb: qcom,pmic-typec: deprecate
 device-specific VBUS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
 <20260519-fix-tcpm-vbus-v1-1-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-1-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c48cd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=y7IPdFz73yPOmcpix4cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: J-hYFZC71Bd-po5LC8xbJy2H3VKwDNWD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMiBTYWx0ZWRfX5nHyeEFntbSg
 PJlBwIxokByVBBD4OUUGbIRl6Ljqd16xIsYl08mMGd2K3w8XqXz4ayIzeAC60XFuMHrBdcr6tEV
 J6s9hRbCYHkbXRGeGRyJYEuCXi9vbnOB10HI35oWnAHCGPAOOh0049hqghfqTqVQoxFPSBUWJ7p
 mkEgCHo6jIkkeTq/iZbIBRkx9GmGg+itt4XTFiVwD2khf6uMOJ/KinILxiLPhEJ67r+I4oQPeW4
 eyUXNYTIh77/hpRZ6BLtGX4cIZhvzV+67S0pUzk1qWpK4+Pau/0xXBSwWxfLsXdbxT5hW6JbulU
 HKcaJaHPfc7RD4beoUTCfsoKZ7BqplzFvo3GavflP9Pl+RtbaCaVst21dZsaIMTFyT5GIKTOknj
 8h/Va+0wopDmtomPyX6jkrnj0NRF0czAR9fr3Id2TS/ih3z//WfWMSSf9wduo59YQalSIOlmx7b
 SNIN5KREIyjTjOZZdMg==
X-Proofpoint-ORIG-GUID: J-hYFZC71Bd-po5LC8xbJy2H3VKwDNWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37696-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 14B4057DD71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:48 PM, Dmitry Baryshkov wrote:
> The Qualcomm PMIC Type-C devices historically provided their own way of
> specifying the VBUS regulator, via the device's vdd-vbus-supply node.
> This is not ideal as the VBUS is supplied to the connector and not to
> the Type-C block in the PMIC. Deprecate this property in favour of the
> standard way of specifying it (via the connector's vbus-supply
> property).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

You may also update the example

Konrad

