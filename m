Return-Path: <linux-usb+bounces-37697-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNKJGtpODGpIeQUAu9opvQ
	(envelope-from <linux-usb+bounces-37697-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:51:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5AE57E0BA
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 196FC311C3FD
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 11:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B274A33E2;
	Tue, 19 May 2026 11:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1vnyH5l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGJSueq7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E582494A0C
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190024; cv=none; b=C2QfvSdobHl+vC3aCMIa3ARBfOYXq03Ko77wjvRbv8WA9z5DF03jfwhPly3TGdTqD6In2wu3PR1tMUh/12SgT//9zNAhwbdPH2VGlM2EdQsMI1SWvJMSvYVePB2q14QNrBmytgoa/4ajTALhTD2pJf7ZKkZP02NBY7shObcTtik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190024; c=relaxed/simple;
	bh=o8d25J2khhRXl66J/BsGcm24W8v/vKfxRKzSLM5m768=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeKELupJtS84odO0SC1KbaGJgLwxoZECSBiOKuJ4J6ZZWLjMHub1mzwZPGl9WlDU60ONTk3sxtL8ncKRGO6Mao31KDKARA+PVLiTLexZyJHpA1YlABBrGlt/ytjf2XuyzVCMfB1baU5QyVCApM/OQ4Y53xc8P4vksdWzNAw0aPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1vnyH5l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGJSueq7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAcSoE4130965
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=; b=B1vnyH5lZUaKTktI
	OsK7jciedikezrLVK6M0pjKp/Vv89oWe/gvR4AFlGEVwhOXrJMtCTOZuuoAne8U7
	unQFnCu7i6W7n91d/H6oUIrs98MY2xQIMfEZY8D/jvDCnlNvjCF34NiFNhC+sYi3
	wkjs9nahzUDnS+RejxcVK6lOQGrcFbxmsBXlcBc52s5Wb9yDr7WNXCDwE/TpMv9x
	5lpUWTAzwZD4x78WMqPjhjHSXjvfnEj/jqjpQ2CMdKGwRZCr21q2wSnjRvlqyWEa
	cCZ4OsfDA2vD8dxZ2vqvx3udic2ZOR+Xf7TNWkMaeW0njzV/Qe74ykYNR5LqTfMz
	/Lm22A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1hfst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:27:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91345d517bdso50690885a.3
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 04:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779190021; x=1779794821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=eGJSueq7GApwj1RAPjPMkeoOtgYM7L9IIfkLFaZ/L8baOUZjaPE4gf9BT0XM5AAl39
         CON4fEn5ZYKdNaZneh4fZ3RIXRTNKQxBkqPBh2eaZhhjb0iKqjVPYPpdyi6vggESv8t8
         FFQABBIb063D8mlRhmJgK6x5DKSXbWOlFq/9JjfWWnN/lw4NqUeRc7imSpeh5889HsLs
         JxKM40K1l+6z2bfZ3oK+jU+VfKsG4jTATyCJcK/8eHVjpqEEJzcoRhgxlonqsdNeDiw1
         XvpUDhP+3/LG7PqjDD/eDv0X27z2foOxj8t59XQ8UiZWYJ+9R7MZDcbxF+QipQnc8zQ5
         WMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190021; x=1779794821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=kY+An2iLsFmvegc1g9ployOgFhRMUJsGbGDf88CHtuueKBpwEYlxoTh9XBd0pl6iFV
         7sLeQiHy7ORtavBLfKc7qFlJWscU9bHaHa6XIRCM4Om3NXyKErhSwVJ6qmo5gripH5Le
         opX+NWitZLRQJdQQHVeQNkC4NA/PQKc9GNtv/wfkvDJ7v/MzSED2qK6ZowVlKO30xJTn
         xFwpHqgREcJkSUBEO04hEsuxLsNrQDA2HGkjs9fc3R0dEHBnzKjR/nYC4i1bpkBKsQ/E
         Fg50GVNnGeN+82W7ulfzctwwY8WK0WFFqbCUfrHJ0PW+gTszvCsyWl7qTVbCgWxtuOEy
         RxJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aNRYYUxE7B8ScZicSUIqlrUWme/Mh3y5jrznl2dmeymH7bfYVoFJdjMHSOqA6c2RHKCZw1G2xJnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsP6jI8a6cToLf89pAoIUAIyxkvWRb2K+24aPSzJmJ1dd1XSfF
	MhyjTfsDTyWUkwmFO6H+CZCHNoWdvNhXBPeHXiutBeXWRO/WXaQHh405JFRrhrhFleBNyOMFOro
	nVFXEn1C+DMf9T710841kLdmYEzJa1h8UoSspnxna4WZmpbs3fUfWXvCxnaoIB5k=
X-Gm-Gg: Acq92OGc5nA1zhedH5FP3jJoY6z+1hk5XyOz+Jr/VhzfFJ/BUBghkyke+lYQ0HpKSE6
	B//EuWNOhIhVTuLfr24SUrUmoHlcb2rOOfpDONPC7b0jfsqE0uWLM6sWpBHnd43dV3Q0icRWnzn
	SE5s3LETmjr0m5QCPgLsTvMZ0LtqEYIHXClv4eEZRVQ+uGGAXcC2+6+xXIsgLZkh/Uwlc8putCT
	9C90Gk8Loz1Fa4Xn3Hw87OiWqGh5pVq5PlvfW8yoeecrevR65vAj9gGF8P2nSN2PuH93FxpVQt+
	f0/mlAv2FRgey7UFCv1B7Mg+sfxftq7ItoSZ9SAoUc9jIF0gdT4uqFd2Yo8E8dR2nDqMv2H1RYn
	EDNZfOf73ERoCb36LqpSRj1xCktIHdiiE9PXWMIJTpLTLoBFMFIfgj+9X9lbsxROX1t7P1B0CuZ
	xIvpY=
X-Received: by 2002:a05:622a:1207:b0:50f:bea5:52a with SMTP id d75a77b69052e-51659e99e40mr182643621cf.0.1779190021403;
        Tue, 19 May 2026 04:27:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1207:b0:50f:bea5:52a with SMTP id d75a77b69052e-51659e99e40mr182643371cf.0.1779190021037;
        Tue, 19 May 2026 04:27:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1bc9sm703044966b.9.2026.05.19.04.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:27:00 -0700 (PDT)
Message-ID: <a9a43d35-6fa5-4a61-b9be-3c283080357f@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:26:57 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: pm4125: move vdd-vbus-supply to
 connector nodes
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
 <20260519-fix-tcpm-vbus-v1-3-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-3-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c4906 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6_Sr6spSlTavn73YIB8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: il0F6-prwvubUo2umwJABRPYgWh0XQW3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMyBTYWx0ZWRfX2gyJUOnMPZ8P
 r0AGKhFPfp6oSrKUhrNGnUWQ5j9kJxiQ6msCK6xUomHk6DswknNBOShr/gfooxc906N4gB/+Car
 NtZ6n16B5cTatHqfhNgGyFgsFNYUnoik9bc4QkQUg3HQnkK5JinjXic88HFDI0EXJdAKpMo7i3p
 w+NnEhFyRL5syW836dE3UfdTfDphyvkfiD/7WwPFoaz04ic+XekFrjyEfmkU2iBOccOeSPjxZqm
 UiTw98wxuGn7a2YYLWmUXDOosqAW5ftt0b4kiTw8FuBpHrwKI5VQM3YK0Y3Kucmd7Ezwk9Pu4Mk
 f//zxnrDKc1tuHJeyGMEQWMhosS6oPLBcjxP9Q9ZprbMk2G1KiRlf3A0bBSawrh6WIGQUYgANWf
 wfsanHe8hswqA7miHfirKwUDSU76XC/J7uLFOOTEGkIFEr+kYbSPwF08q2M4/FBxbpSIv6ZiSvX
 4UO4e2MS60VNfer/qRw==
X-Proofpoint-ORIG-GUID: il0F6-prwvubUo2umwJABRPYgWh0XQW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190113
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37697-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: CF5AE57E0BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:48 PM, Dmitry Baryshkov wrote:
> Instead of specifying the VBUS supply as powering on the Type-C block in
> the PMIC, follow the standard schema and use vbus-supply property of the
> usb-c connector itself.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

