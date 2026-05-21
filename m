Return-Path: <linux-usb+bounces-37858-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIB4CELWDmr2CQYAu9opvQ
	(envelope-from <linux-usb+bounces-37858-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 11:54:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AC05A2BDA
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 11:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B84C30A7448
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 09:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5A737C92B;
	Thu, 21 May 2026 09:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBQ+8VkJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2lCOmf5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FA237CD22
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 09:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356898; cv=none; b=ksHkfSXeyjI3vxbeOnWlgko5bJWOdFrtpMERquxccoqVj8ErYL6eg2bdo1ooVcAheI49X0jMWOxdcaF59msyzw7JoIa+1tyJG8x0XqJQdQodvXCcn3ZIJzln5Mji64b/+QeRIvOgSmUcDBWaFIca2E4OpnyQd1Bs+am5wzYheAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356898; c=relaxed/simple;
	bh=30KdwVED20r+fi4uj6Wme+Z0tWvnzRKuTPOpd1R4+qE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t28SX9Tz2Gn2a5JVjnOLjG1x3s+VnPgonZjzakFmR+J5vy1NpO1j3YTxQMdFuDLWxp9oq0t8Q4shSJ5YxdAtJ0s3zHxnxqV7OBaKCDQKvfARuf7ROr4Pr1ojd8jCJavRp9OmoqlWt9yoP3CFD80lpW4ANzZQXu8aR4cqSOWgXG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBQ+8VkJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2lCOmf5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99ndt3118963
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 09:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4PqW8WIFajA+ZFM71MofraxJOsZX/Cj4e7yQPjwSPQ=; b=nBQ+8VkJPqY9HIvg
	pGAl7e+7H5an5bP0bqwLNgqO4S2i/P68tSnOUDOV6gZYYbvV9lTW1U5FvmqJf4zC
	MHu9nsEY2G+8J6MFn9PcQioThD7p82STUv1ahJUEHAI5BNkYVVuyyy0kD05r0QIf
	34JQmgFDcfUnwmRB6aTAD1+isHA6uNF/7DewawIwqrpw5suRJcArRdtvCySpMM4/
	eTel+73BGiL1vecqeOYFP4EX6n+4/MH+ValY8GKbZaoL8ALN/NYP21xelQfaUCjr
	Jph52Ldjdp13Rr0UUs9nsKGCRrVoTCnayF7kPRkbiwbxYutZUdnSzHT45SJivxqM
	Cvfqgw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r961t2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 09:48:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e5d7f4b63so14443971cf.0
        for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 02:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779356895; x=1779961695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+4PqW8WIFajA+ZFM71MofraxJOsZX/Cj4e7yQPjwSPQ=;
        b=G2lCOmf5zsBzqdIjEJlSgqGrpMI6i6otXjASCf1CbffNcg5lIATw5m96KQQsz1Am3I
         mL8uaNmwkIloPJu0nhJ7xau27OV6SXvQ1O1GCH806+lvm1XbQQkjY6zBraMAIav4Rz3i
         OzvErkcD3AwJ5RzFhsvnHeXw8iRvJs9Up8c2w7GCEVeRJUYgC/kzYs+3zhe17uMvcp9G
         RGL5wTbXyLC3RsWW2IurZI89FDwUz4NJApiouRn89lVc/8MItahAaF8AYDMHbGIsu+X9
         gN5DDJNY98Flo4xwv9dsj3CIZX4bsgcxdARRCpYvoULWcP/P30QkxGbuct3xmBoVyenT
         HaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356895; x=1779961695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4PqW8WIFajA+ZFM71MofraxJOsZX/Cj4e7yQPjwSPQ=;
        b=E/Nq5QAVf7Q8rNkqt2ZZpJ8i9K1JpikffF6QUIISOplGF/X7DRDhg3f/NU9Ekq/X6V
         1UDooIDdg0okCmW4bvjWaXxkRtMfcHlMujDETu29pI74aZ4As5NnB71GUd4kUp32HaRv
         FUnjwYi2hARv0d5CMZUav+FJouyyTY6w/DvG6Y3mo9GNN9FSxVKHBMe615f8/I41lzTA
         rWuj3SCip3EZrwJvFOjnCCwPz5R3jaJPADaKYryZOV9BXwWS7Ygl1ZbAwhjXh+KGflSD
         UmlsMX9uUIijFCikq1tXWz+F/7T79HCGfFsKbDJYeMJuWHItbPR+8c6wowQfMCfx6OOO
         oKNw==
X-Forwarded-Encrypted: i=1; AFNElJ8r9mjFDxL3SSB46JMV044ZN9snkLHyvGKARFhowqiNDgqRha51g+51hWr6Zr4zS2HIWPzxkVt6haM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMdRrMl9tHzIg4KbdPbuVKVsfjsV5HYdfIuSfeDu3EkZm9+S67
	emj3Vhjl42B5mpgvblTzsZiHqhmtEjU+1AWpx2IeiZHeOuLvXp4mwotbFq9DksvfIcUFT9sOHtZ
	o+URHCPB1utsLR739Jk69XSPe9EMx0pZaWxwO00ZAm+2HherRTr0pwGgwBXftohMhN4xclDc=
X-Gm-Gg: Acq92OH1LjLg/ayg1s/ZMR9Ii334SPLXhLwmAZ8sbNVCQkMCA1/yB0ICj4nnGknkblf
	W9Rq2HiR71rLj2tFzWnSBOvGIEg3VTSZzMThmDUvqEm+UEqcgVY6w19SNABESr0HP8XZ6bUiLxj
	ZwGWjCJnT19uVaXZErTVEd2K7nNSZown5kGyGnOD3dXP+AlDNx5GwB1Klm3nRPM1Ec/iIs6PDQW
	d85Qbtgyao195rrFT+fUW9sacR0Lt1C9ogeJPlbw6L8l9xmig5ncSZSmH81OJQJNR7PJdt7ED2/
	GcGR5b5fq7xTTGP55Sm4rpqEnmrnocFTGsuRTEShLuOSKYXi7cGkwsY2xOTHJwxKs45pRlbySwP
	c7yOd/bQHYbY8Nb+BiuJvIP3tMUumudwHJpNYD/nnQ6tlxot5r3cHF78n5t1VymqFRna6RUlEMx
	uhHoI=
X-Received: by 2002:a05:620a:17a3:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-914a2d44cd4mr156232985a.7.1779356895168;
        Thu, 21 May 2026 02:48:15 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-914a2d44cd4mr156230785a.7.1779356894691;
        Thu, 21 May 2026 02:48:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8aa017absm23207766b.42.2026.05.21.02.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:48:13 -0700 (PDT)
Message-ID: <3de365a0-4632-42ea-8a8a-5a4765945a76@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:48:12 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com>
 <y4b3qbt4xhnahtfmfw2qx3lazlnogcp5dfrpd2wyicevoc57p5@puqv4wjzcijn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <y4b3qbt4xhnahtfmfw2qx3lazlnogcp5dfrpd2wyicevoc57p5@puqv4wjzcijn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8yFhMAg7MXcXVgBd_ymCB91plytDLWYq
X-Proofpoint-GUID: 8yFhMAg7MXcXVgBd_ymCB91plytDLWYq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5NyBTYWx0ZWRfX/XbvhcH3D0IY
 m831IvbG8t14Fh6L9qwZUVKfIF3mS0VqLAaYDuywnOkgszB5Id06chxAeNyR4mswno8ccQJ8uNY
 th8BDzpjvOlWTQz80aBN7LhaWDIVdhD/wvEFMd+vIVtOU9Hr9gOIP6yBBRwR8cZxmMlZQkep3sg
 QAV3ka2Q6qzLou1owT+lC2nFqgWqo0AyqRKakGV3IdGgcPz+GfeKbMZzlQSBs/6qiotoj+sK1j8
 /IczCSgEi2NYBgmezdRrcefem0URDN5Uu6ngy5I6z35N7ZwmEUsvxBi7A+1X2NF0sGoQOsBhA9r
 rBfk3q1UKbV7uKEyh96t2FGGfWS6AkNnELkfLbKCJzOSzF6Z49m72rmJBju/bDZoC8yn10AkbuP
 a/2T4Acb14POOvQeq9LRND5DGEIGLwuLGWLlPFQK0XNlW1J6DKeLX+AlnyiRftjdTO09l4bPxHw
 fTv1PCbrMxFQ+o/gz8A==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0ed4df cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vFx1MZsNm1lD4CY-f2gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37858-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90AC05A2BDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/13/26 10:48 PM, Dmitry Baryshkov wrote:
> On Mon, May 11, 2026 at 03:14:22PM +0530, Krishna Kurapati wrote:
>> eUSB2 targets handle wakeup interrupts differently depending on device
>> speed when operating in host mode.
>>
>> According to the eUSB2 specification, remote wakeup signaling in host
>> mode is detected via different data-line assertions based on the
>> connected device speed.
>>
>> When a low-speed device is connected, the host repeater drives eD+ to
>> logic '1' upon detecting a K-state on the USB lines during remote wakeup
>> (eUSB2 specification, Section 5.5.14).
>>
>> When a full-speed or high-speed device is connected, the host repeater
>> drives eD- to logic '1' upon detecting a K-state on the USB line during
>> remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).
>>
>> Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
>> eD- line states, configure the wakeup interrupts accordingly
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---

[...]

>> +	{
>> +		.compatible = "qcom,x1e80100-dwc3-mp",
>> +		.data = &dwc3_qcom_glymur_pdata,
> 
> This would result in the list of the platforms keeping on growing.
> Would you mind instead detecting eUSB2 by checking that HS PHY has its
> own phys property?

I think we've had a very similar issue on some other patch.. we could
use phy_mode, but it'd require first fixing this mess:

28:     PHY_MODE_USB_HOST,
29:     PHY_MODE_USB_HOST_LS,
30:     PHY_MODE_USB_HOST_FS,
31:     PHY_MODE_USB_HOST_HS,
32:     PHY_MODE_USB_HOST_SS,
33:     PHY_MODE_USB_DEVICE,
34:     PHY_MODE_USB_DEVICE_LS,
35:     PHY_MODE_USB_DEVICE_FS,
36:     PHY_MODE_USB_DEVICE_HS,
37:     PHY_MODE_USB_DEVICE_SS,
38:     PHY_MODE_USB_OTG

into PHY_MODE_USB + submodes and phy_opts

Konrad

