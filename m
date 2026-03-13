Return-Path: <linux-usb+bounces-34749-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J67OL0ZtGlLhQAAu9opvQ
	(envelope-from <linux-usb+bounces-34749-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 15:05:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8774A2847EE
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 15:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D0CF7304F57A
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 13:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C1139EF23;
	Fri, 13 Mar 2026 13:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqXivNjG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P84mf2gZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E7A38F629
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410185; cv=none; b=oMVBj0pGSaRpvaLdaUqoVwCQpPxxXf74bSUuGaAOqNVTStblWxc7rgOgyoSCARPTqkYB+R95BCQFSvpw0yjNphvJjLyn/wBin/cmF4HTHpXmn6x0JkSu4Eo0juXSCJ0VKB/JDXOS0krNiUfAxvbNUo9m6upipEMNP7VAFixs6Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410185; c=relaxed/simple;
	bh=yjkWHJy7sLVpTC7Gy9FlTAMMbnf8fMSgYA43ho59npI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwydMfRaEsxF/zi6SMt+iaH7vJT4aQGrWJCfVoT5lauWZL9mUcrPUUJcAuxpgZzwQyzXSi8TvfGUYSv7rNvw/olYD4NCHzSj7oGGYtebcLeKl96mPlEExvZcKBpCDWwfrzCHz7kuc4YABVoXGwQRyZy7bMZ/h+B2nTuX3D7glWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqXivNjG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P84mf2gZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9U2T11499504
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 13:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JWDPUhT3f3QOKIIpNpeDbXRxhsqIYqxLxuhtfPheVY0=; b=eqXivNjG6u331rwU
	6dV5q03ETDdNmbnRylVFDvLYCikLkor+joJgUGNYnh/VZ4oAjKBGpQ9MYGpCXFU8
	R/GTozKYE9jtBXrkNhMJAfnp3rybRpzMggTXoCnBJiYEsLO6qirU4dRHcaOaYlAj
	H/+lz3F4EBccoT1ntcCVr2Jym/KX2HCe/ZMiXWotk4J6TqP9+MSdiQ0Ne9sFi2lw
	W0blKGaXuMJDasZkbds3bnRzK5+cwUb4JRyDB7AcmCjphFG6HaMxkfjG55WxMJp9
	W3jwR9CUYk9iLzpftfTPgViwzDeY5/OQvk7LpalnLNO1h1017CarMA1GvwUsDZuP
	DgvkVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hgtxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 13:56:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd93c91075so120878485a.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 06:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773410180; x=1774014980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JWDPUhT3f3QOKIIpNpeDbXRxhsqIYqxLxuhtfPheVY0=;
        b=P84mf2gZfmb89rqHM4GwRDaaQeqzb8WCml7+dDtwhYVQ5a6gGNV7oE2GXMfs2CXT8v
         KDEg+0GUtcmbD5P0Cs8LhqDReSOUTQu0JR6nef0bYF0FLlvpbjlGq9QHbnrjRzx6WddT
         5BHvDlzgeGjPt/CqDqcYzh6oy5dm6s+9C9dFJJ8ktRlWWwDHkOI1rzgZs9oPg0ueLmBT
         QzK077SH+vAUp0dFNOYNjS7OpAKFDmANxGhrqrR2/cXJDKCyKvdXU7ZGqFa238StXKC0
         aojFNRAhGljxdV4W8zOadNFymhGIo0k5oyR7vSXx5f07LMvuxjsGPz5u6NCq+JN9ml46
         iviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773410180; x=1774014980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWDPUhT3f3QOKIIpNpeDbXRxhsqIYqxLxuhtfPheVY0=;
        b=BtYMeeVAlWFYzB/TdxsFrllZbikBy+34h1wWZCUxKQbndDqbBsMDmpoKHgO56OJw2e
         p04KULWHGvRZVWB0rmOK8wg3z7W//rmhu1173tX6CeV969orNt6CyP6k1VFRsu51reub
         RiQ2J/i6Tqvs7eLxbeBtEmiIT/I0KWdvzlaN/4cmSuRwCPChSfOsDCzOMCMat+TReaiC
         g76oiUurA+DdLVSuVAn0MH6TYpUhH4Zyo4Gq+h8J3YXRr4gqgpFJ+yeASUlg/jXjeG3e
         mIAKMr2ZRJWQxqqr1EyM2xMGrJYozDRPjOShJyizJobUde+n8GHyKukDRUCnYxkndDGz
         TR9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuPrX6y671968bhFSogERKR/MOqQbX31Kcn4nKoDdtvcft6IX6ybBbmcRfi0j+XfH9J4LQeuN/toI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye8j/c0r8Imu1cs7FWGdxAwuJzogS+BQR5+Ma4ul+nBb4vnhKn
	/b2f+tvt077WzjFSRXm1j4aKbx9Clnlf7PjF4gfnah20BptcH+C+UiOeWfIelRIC2EIfntf+FDM
	afnorHSbxTB8iXtP8vv0m38QMG4vjB3Bgf1Bds6bFm8WKlmtPgqPykfAmhHgcjbc=
X-Gm-Gg: ATEYQzz6F2dXYSEEiEHYWKUgtCMkPIT1+v9emHcjZ42Ob3+7G/HtqevF74f0os7dI7b
	j9dHhyqhrYM/Q/A1ly1B14rwBq/plUdRa0kfZwoxyvrqraOsp7bQX1mtad4OsYeDdQCYuABlfJ+
	8ZEizf3TywOxmNtj+BI+MMdaBeftjWaL0DA2hZ5o0rqncjUdzO+ekkBQq5nMECtjt9bwH++DbtL
	1iRRNQbD5lsDy2h50h6Im/kn+0ebLF5MgiGL8Lz59AKjLtXs02wMZJviUhfi/q/r51NpDn5E67p
	irafQWGKR0Xw1hyn32OpIqLkCOztItYrjoIfvUH52l4Zh0uZ8zVfz6/cdR6hcNPdJCvPBGvNLYc
	eyZX+3vIZqLg1tYxUC/ztjvdotDXukfsEXLiGzm7RWFZAgJWr5CdpP9ov1iTEK9NbSMo0donnyF
	yxe+w=
X-Received: by 2002:a05:620a:710c:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cdb5b61aacmr340931485a.6.1773410179856;
        Fri, 13 Mar 2026 06:56:19 -0700 (PDT)
X-Received: by 2002:a05:620a:710c:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cdb5b61aacmr340926585a.6.1773410179303;
        Fri, 13 Mar 2026 06:56:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350d73f14sm1282442a12.30.2026.03.13.06.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 06:56:17 -0700 (PDT)
Message-ID: <c9c3cb25-f37a-4270-9f84-f6e4df3ccbd6@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 14:56:15 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: grumpy DWC3+UCSI, usb-role-switch semantics
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Johan Hovold <johan@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <8fabc049-7fdf-498a-a3ef-6f2570d510c8@oss.qualcomm.com>
 <20260311192118.hpf6nujgikytngvl@synopsys.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311192118.hpf6nujgikytngvl@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b41784 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=9Sy8I8J6VepcK3zmzJsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Mxn72ptAq9tWL63L7DSZmqumktzzOU5A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExMCBTYWx0ZWRfX0Jv0zz3YY1jt
 rvIP6Rtz/tuHBC00Y8qi6l4UHtZi7jpza/nrNIEN+U4xIYzNi34DlvKAhQPgzHcMs3jh+9DC65l
 Nl7A/dmpV/75DvSaB9qACRP1ItbljLG6Puv/fDhgZR19qL/058IbI2X+55pQDaZJ1OM2fz7LZIV
 KH9jI0gPXjAQXqJXJ/zq0lIpNBtf6c4R7RSpUn8nSeRLcOvlbxsxe8exw4c+oMoBnHZsfzbdNYj
 mxxRW1r2BgFxdNxG+ZIm20GlgvIHHOXPQRn7NbxLU9vR5tsrEKToWuJ2j+sSEZqqLzdau2nqIIq
 haG1iKWtdJ9gTFAt8Z1jVg63t6MIMqwK+/VM7e/LQl8z10kQUExZJojgJISAVd/nNCabeQge7qE
 cvrWiR2tM9HG0zdfJNFxI5mRH3C8ZMCm3ynHXj3KYSldgMaG3/xWp5MSl3GzvZPRhKJrZqh9rIy
 X8BB6pSnKRvlv88YEdg==
X-Proofpoint-GUID: Mxn72ptAq9tWL63L7DSZmqumktzzOU5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130110
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34749-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8774A2847EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 8:21 PM, Thinh Nguyen wrote:
> On Wed, Mar 11, 2026, Konrad Dybcio wrote:
>> Hi,
>>
>> The description for the usb-role-switch property (usb-drd.yaml) states:
>>
>>   Indicates that the device is capable of assigning the USB data role
>>   (USB host or USB device) for a given USB connector, such as Type-C,
>>   Type-B(micro). See connector/usb-connector.yaml.
>>
>> That to me sounds like a description of the capability of the on-SoC
>> controller (i.e. should/could be set regardless of device specifics),
> 
> That property description is misleading. We enable this property if we
> want to use the usb role-switch framework. This has nothing to do with
> the hardware capability. The description should correspond more closely
> to its change log:
> 
> 451d15a1731c ("dt-binding: usb: add usb-role-switch property")
> 
>> however in this configuration:
>>
>> &usb {
>> 	dr_mode = "host";
>> 	usb-role-switch;
>> };
>>
>> the role switch device is never registered on devices with a DWC3
>> controller, since that's handled in dwc3_drd_init(), which is only called
>> if dr_mode = "otg" (or absent since otg is the default).
>>
>>
>> This notably causes:
>>
>> ucsi_init()
>>  -> ucsi_register_port()
>>     -> fwnode_usb_role_switch_get()
>>
>> to loop in -EPROBE_DEFER, since the 'usb-role-switch' property is present
>> on the connected DWC3 core, but the rolesw device is never registered.
>>
>> Now, it seems like different drivers do this differently, e.g. DWC2 seems
>> to always register a rolesw.
>>
>>
>> How should we tackle this?
>>
>> FWIW I'd prefer (for maintainability reasons) to not have to set/remove
>> 'usb-role-switch' separately for each board, depending on whether whatever is
>> at the other end of the USB cables is rolesw-capable (since again, the controller
> 
> We shouldn't do that. The usb-role-switch cannot just be inferred from
> the dr_mode. The use of the usb role-switch framework needs to be
> specified by the user. For example, for this particular scenario you
> mentioned, the UCSI expects the role-switch handle. The dwc3 driver
> wouldn't know that without the usb-role-switch property. Not every drd
> platform uses the usb role-switch framework for role switching.
> 
>> itself is), but if we go that route, I'd request that we explicitly forbid the
>> combination of usb-role-switch && dr_mode=host/peripheral in bindings, so that
>> the computer yells at me if I overlook that
>>
> 
> The dwc3 driver can be updated to register the role-switch device if the
> usb-role-switch property is set. Additionally, the role-switching
> condition would need to be revised to ensure it is constrained by the
> dr_mode.
> 
> It's a bit odd to be in host-only mode but also needs to use the
> role-switch framework. I don't think the UCSI even uses role-switch
> get_role? In anycase, the change shouldn't be an issue.

Rethinking it again, we only register UCSI if there's a provider (in
our case pmic-glink with UCSI_GLINK as one of its aux devices), and such
a provider normally comes with a connector definition, which is logically
always a Type-C one (the 'C' in 'UCSI'), so it (very likely) has some
form of 'data-role' property (and if it doesn't, we don't enter the
problematic paths?).

That property may be further restricted to something else than 'dual',
but the controller will (to my understanding) still get a role_sw
notification (Type-C class .dr_set() normally ends up calling that one
way or another)

So, zooming out, the problem here simply seems to be that there is no
reason at all to limit dr_mode if UCSI is at play..

If it isn't, something may still call role_switch_get() and fall into
the same defer loop, but again it seems unlikely that it would be a
valid configuration (I can only think of dr_mode used as a workaround
for DR-capable HW that can't detect the desired role properly, paired
with an overzealous driver that really wants a role_sw somehow consuming
a reference to that controller)

Hence, I think the way forward is just to stop setting dr_mode where
it doesn't make logical sense and revisit if this turns out to be an
issue in a "real" scenario

Konrad

