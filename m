Return-Path: <linux-usb+bounces-37695-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDQXD7RJDGrjdQUAu9opvQ
	(envelope-from <linux-usb+bounces-37695-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:29:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CDD57D9FF
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98070300D468
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 11:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE3F49553A;
	Tue, 19 May 2026 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIfAg4ZC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SZFffMB/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BF333A9C4
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189923; cv=none; b=SyRMszgoOa+UcUsN7rtcgSpG/zCXsYeP5JRkLSi9gCsrFh/F8vuTZ4ZDUbXJL/PWjc9vjcnm2/jjAE2YgBe3UHzYqECKd7x6yIE3kaiQyaZCtLSEePeMOPmF/Hag6FIsNIimdsQnJIYry3U67ykoDrWp8xNhxGlW92JRYgicOFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189923; c=relaxed/simple;
	bh=DdlYAH7YYC/uFEG6PShPTwU3kyoumx8Dw/obSoed2pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3qx+x10UwAMe3I7ahGJUhEXcNHpPg20JRhT07qpxz2vQI9rK276DgQm7ORyIeqZZmBvpUIN8H3GMursWUnYs9zSE8XBDXXgf8V0bqkzyP4MquruFNbYJnxvHp/0AefW88W4Ofa7Gf1a1VEwsFHsimlpJwrsDaBLxvrtVICjBxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIfAg4ZC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SZFffMB/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9kwbD1257190
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avHDZ/dhsbqUN2QfuautlreNoMotY+jG0kwbtZGQxPY=; b=QIfAg4ZCaWfbcV68
	Y89gr/Y80ttsyMuKvNpnNp0gB5vV+wla1PSODH/FEwCHlLUpPslTMBYmbgL7F3Vi
	c9y7uhnQN6jeUONiABBP8H0Ip9w6MrKirrCY0LKMkjnuO0JjKcusvjcnZFQNfY2M
	x+zaEQDitQTahSCzeVoSteZeQbHj1/CTRTmXLvJW6ui8y7mkpZbrv0xLPACS5CEl
	2xG6cK0/JshtSTBCPjGMwBa+rTVep3HTkFsHUb/sug5QiV5QJgbKRpRajYdtwQjw
	5nu0nsaUdxBY62ymVH6Uxmm1TxNri8SQAmrNNluihOlIdsjTy4/mZH+dn6tDpRtX
	5cUHmQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nhj8bn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:25:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50de6db1eabso11200561cf.0
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 04:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189920; x=1779794720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=avHDZ/dhsbqUN2QfuautlreNoMotY+jG0kwbtZGQxPY=;
        b=SZFffMB/7m8SKieBZaHqeZ4wn4rxldBOX76LODD6DV6HbFFa92DEzO8X+jqnnI/DRu
         hQazO4T5VKXjeG/OuLRDAh3MBvU6HMZwYPsChBX4gIuukO84ZJYs5fv+I503pDe8Pa88
         KsZHNvJSsHtD3dUwc4mf9LoAYRJP8EoabXDxBuDf0ZYjhHdjMlXX67HeKcpB+rPQZ2gG
         vcFNyF/QZ9zRK4xzfJaQY88PZAzFl9lWx/qzyBSiWbUVUNXKjb8/aR7g/uXRKZLyT5sH
         a234gMMQEuBtZb2cmAMJnprcdCu4YeEvGp2VqbGZS/WXcoIEYbwdgQYmHEOQtQJfBsXR
         Y8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189920; x=1779794720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avHDZ/dhsbqUN2QfuautlreNoMotY+jG0kwbtZGQxPY=;
        b=n+zUuvWL6i1AKq7TUAejWD+AWq0NBA6m3p5RJcVvUcfPwABthm1tN5t6dCc49LO2wI
         u05sZLOtjPIsYbzqEA87Hu/SeDe4jysH3Nymj65qqdpwintz57prWh72rSHz/rQ7Xemp
         ZdXHUg2SVkAEX8Q+mbTbBdkGlYiFQW8SxxKTf0zeZTJPdv9P/WD96xq7pCGwceqZSKpp
         zl0IEBQP3uqUpBVCJ3darFJsOD3muMazXwoHoavT0xRBeOxiyZlRZlsGFf9CCNkYABMS
         Mv4V1LhgAul8ltnaMhAHi27Yhwu+zbbiQjiO2735ypgKkk+ye6dpblMCo6F+OaMzU26B
         FFng==
X-Forwarded-Encrypted: i=1; AFNElJ+ry2cX8hCwOm/io8GPwFdxLM44RfkZPQhiRV+DOoz27ibBY+YWc+9KCOEOqWnlCFeMbcWL2WXQshE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5SbY7g/x+oOAbJzZKbhmDBBUmLODpD31OBKv0Yw05cDwwXIHt
	yTEKr5YeiEuuhC0yPGSnhMO1HHTeLm35oK5cgrP8REzZL5K8clBuWEFDvS8NSFRxR4mcd4YZQQR
	hWwX5ose2e+V96H7Uo5XOcHP9aLrNzYJC6yejSHRLLnM4sLh6Kfpbmn2VtcHenyM=
X-Gm-Gg: Acq92OHDc6LZynDMLM2V7+Tu//14q8kZjc36ciuXn2hlsj8TGFfR3uaQU3lUh6KvV3w
	sUASlBvICajMiYFch771rTCyq+uOOVIMs/WWLdqMMZPxbbSkFisRQySF6/Vd5wiX9rdKbAAZZBs
	PKnSkevJOCw0fT3Mgdv28VrSdwFe79nSWBQ0g0eFpXv3lwqW52iVjlFnobkrSU00RZvMiWlTffT
	yMGy4D3vKBQWZuSFWePb0bOkqjyAQDbr8BHyQ20OCcwTpBcnUmq6TmohQiR+bBv7Wusn9LTS46V
	1VG709HnPGASw02onEtfBFgZftxPHq4915Bx3JAawvNTCzUl15eqdAJd453CO1YAQgVLJeCb5j7
	SsgH7i/RIYhbmyjN125Cw1bbIwz9XNhJfi+NeWJe6LRy6FhvvMMUW3V465lIq/HJWZdbbpIDuyW
	9JmFs=
X-Received: by 2002:ac8:594d:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5165a26c9fbmr197475311cf.8.1779189919916;
        Tue, 19 May 2026 04:25:19 -0700 (PDT)
X-Received: by 2002:ac8:594d:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5165a26c9fbmr197474941cf.8.1779189919482;
        Tue, 19 May 2026 04:25:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e21235sm687291866b.43.2026.05.19.04.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:25:18 -0700 (PDT)
Message-ID: <dd74004a-cf60-47be-9799-8b658830af8f@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:25:16 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] usb: typec: tcpm: qcom: prefer VBUS supply from the
 connector node
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
 <20260519-fix-tcpm-vbus-v1-2-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-2-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4WbkpTsgbjnOB4uSOEJE1jd0HlyONFR_
X-Proofpoint-ORIG-GUID: 4WbkpTsgbjnOB4uSOEJE1jd0HlyONFR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMiBTYWx0ZWRfX2mCCEo3Uujbn
 GuVDMTmApfsQTIDJFh9F8lxNZjwU2SRI/LWoEiKEEuzH2MYpD8mi/nTMdNeUIELgA2x7g/b42yi
 r4auLe+ExxBpNp+lsaRIdBaxxERBMkCVHmExBeYBmPPzaV2k7CBhbNQn+awi2CM/Vsd8pCawmM5
 jcNvZDlAxA7+YeSoqOjPIeR074IpNKAGGK7ZrI9rVm163ZIpbkEC+sTpDZ5zOeg8C9gCkQqx+Tr
 vXsKFNG6wVzOWj77yTXnjSugxfuaB4A8u2E0oe4cgEMjOMfTY5eggTRkp0IzdAN5zwp5yaz+cyI
 GX3XKnSN2LwXRxAbl7ZDzZfm7oRHbtZMPJQyO2OFKnwxMBvE+CY8AZWC3H0VJr1SnUafL+68iEa
 2sSOpBtMX2SMG09NokJXKB5zRuG2vsPGAE/TqiTcvBdF+CBTtKcrP+Bz4KC1eg8xXmwyE9Xa2A4
 lOoHtyqD9HefH3drLqA==
X-Authority-Analysis: v=2.4 cv=ToTWQjXh c=1 sm=1 tr=0 ts=6a0c48a0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=K9uqyr9RctTKKMavoioA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37695-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: A9CDD57D9FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:48 PM, Dmitry Baryshkov wrote:
> Current way of specifying VBUS supply (via the device's vdd-vbus-supply
> property) is not ideal. In the end, VBUS is supplied to the USB-C
> connector rather than the Type-C block in the PMIC. Follow the standard
> way of specifying it (via the connector node) and fallback to the old
> property if there is no vbus-supply in the connector node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 8051eaa46991..429bd42a0e62 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -9,6 +9,7 @@
>  #include <linux/kernel.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> @@ -704,6 +705,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct pmic_typec_port_irq_data *irq_data;
>  	struct pmic_typec_port *pmic_typec_port;
> +	struct fwnode_handle *connector;
>  	int i, ret, irq;
>  
>  	pmic_typec_port = devm_kzalloc(dev, sizeof(*pmic_typec_port), GFP_KERNEL);
> @@ -720,7 +722,15 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>  
>  	mutex_init(&pmic_typec_port->vbus_lock);
>  
> -	pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
> +	connector = device_get_named_child_node(dev, "connector");
> +	if (!connector)
> +		return -EINVAL;
> +
> +	pmic_typec_port->vdd_vbus = devm_of_regulator_get_optional(dev,
> +								   to_of_node(connector),
> +								   "vbus");
> +	if (pmic_typec_port->vdd_vbus == ERR_PTR(-ENODEV))
> +		pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");

One could decipher this by reading the code, but please leave a comment
hinting why this is a thing

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

