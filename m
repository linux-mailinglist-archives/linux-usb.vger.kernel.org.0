Return-Path: <linux-usb+bounces-33229-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHsWFQ21immwNAAAu9opvQ
	(envelope-from <linux-usb+bounces-33229-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 05:33:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C74D3116E2C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 05:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ABC03019502
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 04:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7F0329E56;
	Tue, 10 Feb 2026 04:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8XyRL3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uy4B9Cn9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA0F2E9729
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 04:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770697960; cv=none; b=gyxhQSEnVRBYC+u4/orPXqv84OTtlCk+8yq3+rhU7PzdM2QSJ6hqEM2OWBjCYVWX49TA5FZ86By48+MhZH0HZBki937QHzircGBoXwDbqbXd8DTD6zHJei3KDfPBAvjPQ2IgLPy7s+r4EYLz28oy7Cez6CtjrlUkR1CSfL1t54U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770697960; c=relaxed/simple;
	bh=Kd+yrwU5/xbhFBEX/6uz6GmycP+t0I76y1YVMEJC0EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQWPiFWW04S8zCRc1566U3LNsfK373qMnk4Tu46SnzLzDVg36O7sjLvBendHTEQUiojxC+zNebccb59J09K1/2vV0R1No4XaTrQMIOzrLCeVnFh17Lisy0ZMxTzRDNpSClFqPZb8JkxMR8HgSMqi8Swry9Kvc3ZkZ+J6X9yO9fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8XyRL3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uy4B9Cn9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A3iMWd1940305
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 04:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zRnetKOzxqQdEaiENqW7EBVO/gE2PNAsW153vC0f7uY=; b=Y8XyRL3ZpPXjeqC/
	NId1Wdy8Kdl1NVVakdTFO/CuYHIMl/sR084uoGT4bE3PFpSGPJDnDOlYA7eL0FqR
	xf/0JngwLpZOU4irSt39Fkp9R2OperovUduX3Y5wJWMq/okMNnE8+DIP7vJkUcPp
	KbMWdfFhjKRFnsBOZniXFLXJMc92jgdTcQSEMBQErXCYKxQYpNPoZojZwZardsrB
	tkya6RE0ECHNRNAYxsrcL6afiFXIMNLN7Nv3bYJyI6ck6chh3O4mDgFiG9FHwiR8
	c6JoZrlxS9/eFRI+H2dyGY5TnVxoS2H1XPx81AxjkzNSnKCHQSDKONAkeCs2jwYC
	OuFzqw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7w1jr418-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 04:32:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b9ea5408fbso281544eec.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 20:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770697957; x=1771302757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zRnetKOzxqQdEaiENqW7EBVO/gE2PNAsW153vC0f7uY=;
        b=Uy4B9Cn939M3eG3MCVLbI5VnELo1KXxPP8h97S/5mE+JusdyZy7sEBLddLKTCpYAse
         4wDTl0TroSjUuBfYENm6Lxox8bmdLNVWa/72FDteRgcXFi+GWlFsXb+lDJjYb4NUOj4l
         Qd34ERoNT03wXnqmditXbyTALgTr5lMyzJQmakBGbgAR7f6UTWv0h+DJ/5sPjCzwEmKp
         eNVACNWhPvoq6iUSmkwKraSCeeCEu49lJ+1IHYO/bUvQj7PqkLTUtnjGagcINsA+wsw2
         S1rhM3aQN7OWSwyiI2EZlqex2t2+4+ULmmgG32V2Ilphh0a9zRuNQH3FFbMTsOzWCAwD
         3N+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770697957; x=1771302757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRnetKOzxqQdEaiENqW7EBVO/gE2PNAsW153vC0f7uY=;
        b=d+wsPMsC/ad0KLomlyZfQ5zz0PY9dKvCnsuvW2/eupCOCtse4MxYiVLQo9Xedpv9Ku
         pr/MBt/0kn1qWz64paXIQwXaE8kIiooKw9nLBV3QZIAOdl05jQeuDQWMi3sLw+qGle02
         20V369HVl91m0eK1aHfhYiDPcpOtqelVRNCeo29ct5xwnF74rY9kTgopWPnU6cPR6BrB
         QJQnwMMmDtmpVxQj7b2LJnhHbNV8Pq9IlCy+VmmG0Ij53y8Q34EMdXh4klQqhbndsyre
         5wwyuPyEUyrxUOY9XeCXJc1jMeYfoKFQACkdzhExzmHNlT/UV6q1Tmpzsgu+iJ39Ujc5
         0JLw==
X-Forwarded-Encrypted: i=1; AJvYcCXmkx3A5lHUie9eQEudv/UpxCZr6Nu3ygN0XRI2QjbSO88GlvTc/c/79stC+h9GhuPeBdw0QHxo+1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMaIxZY0FmMkuzlwgYDOElXAM5M55gqiTtD0yuaBKo60CPuPJj
	Bo48xvUxFm7SpEFfnOOKz5BdOHJhJu6Ngj0K5oaVT5GCarPgSiHz7M832gHutaYzyODzlVqEAK1
	51TGnjFLJ1gBabWfZYsEXgVmJ93dYM6LWJPIVuxZLM63Vm4g1eawPF0JLG2FcXJs=
X-Gm-Gg: AZuq6aJa36+lSUYYv1K9EWhiTFi8ta2eOd90GGMgA/Hto4nMxG0tNyNGfA6iPbs4Za8
	IpGaYjYE+7qXxtCCflgygEp5EAzAC03q6OZoJIrlmkslaJKn04XOIyXODM461xnA6zxN4Iz3SBz
	7bJanRyMqrD8Xg/6USkbhtYxFD8GKIvHG0wKitv+wmSQbucm9HpJmKK9S4wBtAWOoo/bg43kBX/
	RwkuYI5mIOgcbRXViBvOukp+8WHIF+ocQnmDINAgKIH549+jJUCn5WUCU+nKKj6OOkpC3K6Lsmt
	3x3BZnhyD+Ej5MY6eycsfPe2dJgoA9sH/xviQRdFJwr3RyKIPb/di4K/BtFbJJlY30Sni+vPn++
	YN5eKzhbtixXQjb38Pc3yV05uTI20w+IfFaI6/dY2vhL3JG3GX34=
X-Received: by 2002:a05:693c:60c3:b0:2b8:6b32:1cf6 with SMTP id 5a478bee46e88-2b86b3225e3mr3014717eec.32.1770697956516;
        Mon, 09 Feb 2026 20:32:36 -0800 (PST)
X-Received: by 2002:a05:693c:60c3:b0:2b8:6b32:1cf6 with SMTP id 5a478bee46e88-2b86b3225e3mr3014702eec.32.1770697955927;
        Mon, 09 Feb 2026 20:32:35 -0800 (PST)
Received: from [192.168.1.133] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b8647bd6casm8228165eec.7.2026.02.09.20.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 20:32:35 -0800 (PST)
Message-ID: <cb0693b2-b9fd-4880-86fa-26fd1259f5b1@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 20:32:34 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: soc: qcom: eud: Restructure to model
 multi-path hardware
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-2-elson.serrao@oss.qualcomm.com>
 <20260206145544.GA207233-robh@kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260206145544.GA207233-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VP6lyod_KKQDogCDrVrw6_xjyr0Dm8fN
X-Proofpoint-ORIG-GUID: VP6lyod_KKQDogCDrVrw6_xjyr0Dm8fN
X-Authority-Analysis: v=2.4 cv=YrIChoYX c=1 sm=1 tr=0 ts=698ab4e5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cO4pQMiFdYyVEuTpdcgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDAzNSBTYWx0ZWRfX56o0eEMx/YNs
 S0nL+cUAAO+DPUCYAAY9RLJbJ9touXYnAsRPieQnSwV2J87pVjwBiR2IV7FFyQ5JLnzYgUEGEAb
 EAHq3mls7uRmgZQkHf0Bs/u19V+4zmU2E1QzqIsLP/965vfdUP2BkE9n9mu1qQQKpp0e4JFSk6v
 uffbEImKRIXzgRErdLsAEh0XaSrVi1o99Gkj+xoi/OV5B9SNYoHVn76+0ihsKR4kgYh1t1yqDqJ
 vvGz4s/7yCBGP3Fnsb40rReQUG+8x2uYtbvxnJ38X4QtRK9SJnd2ckxmVsbOv1B/ZHuM7RdVb9/
 Mzd/1BeiWsmp21hJayGaYgOvh45oeI2eEKlPkT6cl5jrW4RsXkt7trGqTOhDNwIN7yNh62Z4dR4
 n9LhaX6Fb/X5dB9Ztu9cOk0l5Hbh0Vx1/xGvwowh6jd/4HLm8YTieJXQoUOj8R/Mog1mPeqfLsu
 T6/clCHj11VCDCl0R5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100035
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,qualcomm.com:dkim,n:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33229-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.3:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C74D3116E2C
X-Rspamd-Action: no action



On 2/6/2026 6:55 AM, Rob Herring wrote:
> On Mon, Jan 26, 2026 at 03:38:22PM -0800, Elson Serrao wrote:
>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>> independent High-Speed UTMI paths, depending on the SoC. Each path is
>> distinct with its own HS-PHY interface, connector/controller wiring, and

[...]

>> +  supported on up to two High-Speed USB ports.
>>  
>>  properties:
>>    compatible:
>> @@ -29,26 +32,62 @@ properties:
>>      description: EUD interrupt
>>      maxItems: 1
>>  
>> -  ports:
>> -    $ref: /schemas/graph.yaml#/properties/ports
> 
> You are breaking existing users.
> 

Thanks Rob for your feedback.

The original motivation for the structural change was to make the binding
encode resources/topology that were implicit before. Specifically the EUD
intercept of the UTMI path(s) between the HS-USB PHY and the controller, and
the need to represent platforms with two independent UTMI paths. That led me
to introduce per-path nodes and a per-path PHY reference.
I outlined the constraints and rationale in this earlier thread:

https://lore.kernel.org/all/5cec9127-bdc5-49d7-80e1-2ae26f81163c@oss.qualcomm.com/


>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^eud-path@[0-1]$":
>> +    type: object
>>      description:
>> -      These ports is to be attached to the endpoint of the DWC3 controller node
>> -      and type C connector node. The controller has the "usb-role-switch"
>> -      property.
>> +      Represents one High-Speed UTMI path that EUD intercepts. This node models
>> +      the physical data path intercepted by EUD and provides graph endpoints to
>> +      link the USB controller and the external connector associated with this path.
>>  
>>      properties:
>> -      port@0:
>> -        $ref: /schemas/graph.yaml#/properties/port
>> -        description: This port is to be attached to the DWC3 controller.
>> +      reg:
>> +        maxItems: 1
>> +        description: Path number
>> +
>> +      phys:
>> +        maxItems: 1
>> +        description: High-Speed USB PHY associated with this data path.
> 
> Doesn't the DWC3 node have a phys property? You don't need it twice 
> since you can walk the graph.
> 

Yes, the DWC3 node does have a `phys` property. I added a PHY reference under
EUD to make the dependency explicit, since the EUD debug module is independent
and relies on the HS‑USB PHY for its operation.

If the preferred pattern is to rely on the controller’s `phys` and discover it
by walking the graph, I’m happy to drop the duplicate reference. My only
concern was whether that makes the dependency effectively implicit—i.e., EUD’s
correctness would depend on a resource not directly referenced in its own
binding. If my understanding of how this should be expressed in the binding is
not correct, please let me know and I’ll adjust v3 accordingly.



>> +
>> +      usb-role-switch:
>> +        type: boolean
>> +        description:
>> +          Set this property if the USB port on this path is role switch capable.
>> +          In device role, debug mode inserts the EUD hub into the UTMI path. In
>> +          host role, the EUD hub is bypassed and UTMI traffic flows directly
>> +          between the PHY and the USB controller.
>> +
>> +      ports:
>> +        $ref: /schemas/graph.yaml#/properties/ports
>> +        description:
>> +          These ports are to be attached to the endpoint of the USB controller node
>> +          and USB connector node.
>> +
>> +        properties:
>> +          port@0:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: This port is to be attached to the USB controller.
>>  
>> -      port@1:
>> -        $ref: /schemas/graph.yaml#/properties/port
>> -        description: This port is to be attached to the type C connector.
>> +          port@1:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: This port is to be attached to the USB connector.
> 
> Both port 0 and 1 are attached to the USB controller?
>

No—only port@0 is attached to the USB controller; port@1 is attached to the USB
connector.

> Why can't you just add more port nodes to the existing binding?
> 

Do you mean extending the existing top-level ports like this?

  - port@0: USB controller0
  - port@1: USB connector0
  - port@2: USB controller1
  - port@3: USB connector1

My hesitation with a flat ports list is that it doesn’t encode which
controller/connector pair belongs to which physical path through EUD.
A graph walk starting at Conn0 could also reach USB Ctrl1, even though
these are independent paths and not interchangeable.

Below is the high‑level topology of EUD connections. In the disabled state,
EUD is transparent and UTMI traffic flows directly from USB2PHY0/1 to USB
Ctrl0/1. When EUD is enabled, the debug hub is inserted on the selected path
by the internal UTMI switch, so UTMI traffic on that path traverses the hub.
The non‑selected path continues as a direct PHY↔Controller link (EUD can be
enabled on only one path at a time).



					EUD Block
			   +------------------------------+  
			   |                              |
[Conn0]-->[USB2PHY0 ]----->|  -------- Path 0 ------------|--> [ USB Ctrl0 ]
			   |                              |  
[Conn1]-->[USB2PHY1 ]----->|  -------- Path 1 ------------|--> [ USB Ctrl1 ]
			   |                              |
			   |      +------------------+    |
			   |      |  EUD Debug Hub   |    |
			   |      +------------------+    |
			   +------------------------------+



So to make the connector–controller relationships explicit, I kept the `ports`
property under the `eud-path@N` child nodes. Please let me know if there is a
preferable way to model this.

Thanks
Elson



