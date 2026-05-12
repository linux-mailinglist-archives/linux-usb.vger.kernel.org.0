Return-Path: <linux-usb+bounces-37331-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNc6BBsrA2oR1QEAu9opvQ
	(envelope-from <linux-usb+bounces-37331-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 15:28:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EC65212A5
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 15:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 533A13208FCD
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 13:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68433B5F58;
	Tue, 12 May 2026 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wk9x9yyl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WlOVUbwh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97B0395AEF
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591225; cv=none; b=O+0bVcrVWrE/nCracriG6KOlPpMOjjYkXMHTV6XWauFUUk61+iaKUeNdnzpAZ+DOoNtP1ZC/iKu6rmtxQ0PQjxNDvWhnFq27nHY1TfnMm2/l+2dcGeiCB8cNtSB4P8eXwDauvNF98et4WD7OfxoP/Enq2yUP3Ty6Cn6iXDkt1rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591225; c=relaxed/simple;
	bh=/g367lhKepjdqg5B7eVRgMaYc6ku4HfgsOSYrZxuo4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCtImkDcnxRtFf8EIFOTdg/QtCUmSv3FPRcVTEe/7SszDKiUSz5YsLIcGWL6/iVfqYzZa2MEdx3SuXETbtolrUrLFLZynO9OPZCK8LqsKhdRJt8cEXNDYOKf3jWs9wYbNFJx9FMhVxsQyDqk7kh7y9SSW5XNti/5yAXvjdJkEQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wk9x9yyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WlOVUbwh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCKxIP545158
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 13:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W4fS0akUq6FNrdDlhGRtC55vg2avDag85vDl7LOzXYE=; b=Wk9x9yylz+r9c5VC
	CR3bZHnMMhszgnSIQ1QwAE3oUX02I8H6GLa7dxsYM0rpfRJUt7p+aWShamS2/oO5
	d3RPYMroYs9+OsR/R6mQz+aO3+ms/siOV3z9i1FnMVZ3PJoTZXy1+MOXnapKAIHu
	hylZ0xY0pIEjKYw6d8jTn8tM9/MuwaGWV4YKTFOS71fEFNrGfk33i29ytu+aGGxf
	mvp9RD67CHyCDMXo3cSaU2P789baWiHaCkvwAMH3wyCViUHX4LzpM8Nbe6ab1/2S
	E2JbXWC1ssjhOwHRyUNFRwcXHuhkYTh55aR9pqoxU+N7J/Vx8bQkcCmycd3pf0ZB
	wFIc8w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444sr4st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 13:07:02 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95192ee0b2bso265686241.2
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 06:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591222; x=1779196022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W4fS0akUq6FNrdDlhGRtC55vg2avDag85vDl7LOzXYE=;
        b=WlOVUbwhHXzPbONWVKHyWniIkp1YaUYVpXDg0WAGJWVEJb8Rr3S9mhMRZkm5ISb+bi
         ch/ibrDDPtOrlZXPQBb4SKqJvThL6Od/YyyXYbWP+XBIZsk5qvnFPsohtbB8KTCq195l
         rsFdP2r79zrFkovDK9ugYJAyg+MramU5muJEb9fxzFySKm+x+wQdjm6BYmB0oPBU8lSH
         7P8JtTcs6ZCxV1VIucioVsVeUvgGQfZd6/WQLzACDNIW+NY0dn/Bbw/gHBq9oQhJdIFs
         7+w5DiumDBmmjlMSKI0egZ6d2C8mHjNc5XmJLn5kDulFTXvZ0s0DUYtTrvFaNBGH+wu5
         1tcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591222; x=1779196022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4fS0akUq6FNrdDlhGRtC55vg2avDag85vDl7LOzXYE=;
        b=Q1TPSA7q5jAYPNmM0WAhekxQLb1KyivmU2PsV0sVeJB1sM0ez8diCmygt7J9B9SM3+
         ayV5hCatg6sbRxlARsxuPy/NtfAhJmF7eRn1ShHW+WJzEM27cXU4Dnu+1GgNPYh5xz/Z
         42mB1D6UE8rxboh4siKVathXrFsAXe1mBt3Nyi5sBC25SiiDSMtTLTmOGCrGKT7yWNHP
         DbZbm0D323WQDNbDpP5sGKMONg9SxqnKoTlzvDfmiT9OzmHkBBF8KVcfkTFFkEG5PgfK
         zooQAaQL/ouiU23fjHZspmX+A0Ifn/ppXm0epuWSyjMW0+CMXudSDrFBiKak2WovZBfO
         TK3A==
X-Forwarded-Encrypted: i=1; AFNElJ/kP633nAKFdsrmxP+WE7LWKiVVVeonIg1sd4CtATZgmHoY1/gVT9yhh7pA99luQ41F7t4qDuxk4Wg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgEH5LcUjE+DmAPr+IYqfUZ9zzi1OPK2qdY7bTp4Jobq2km8xc
	Kms/Ik2d/Zl5LIFYd/J10Ie46PG0evPNC5bMGvZyEY+K2F2Qd+MR2okB1wPvaHgw/L7bWq8KmcK
	nUO8Y6Ul44ZnJSpfp8yth4gQ2mbwwVXkeZsWP7wJdeTsBM6IMW8y0M0bDscrgWI8=
X-Gm-Gg: Acq92OHwGOb8W+MVj7RR4ixSzoOh234VfJV6NQcgDc5dO/0OiJSQABIhbAaH90Fu4KK
	YOeZ513Mam/m+Ta12Zxy0UghEDZp4d41Ob5iXatVkeBmMBCr/Yl+J3/KD3qa6BpDZS8eRbC9wej
	m0mIf2G4pRXQDEdo7eYxniqZ1WQKW6MTlrBpg0Essbf1dgcHvdKggkP6+LpHhzTRYSDJg8lHDBn
	bZnIkMcbL4hllxa72iXW+nFakpS0BLHMskbeg9tieAW+lyKIzYsbZJSMI8Zanv0ssY/TyVO4GaD
	eZJ4KF30wsL2+3gTMBBonSo2QodT6FdzOF5xPAATiQHpjYBZEWcy/HXBDonzweYF/y9W/tD0caI
	Wfk/4GwwFxASiUim3iwZJpkQLjPMnfKEfp52eeqb/95q+d0495BQPAgWUf0tJJ2GrDdf0JiIwLv
	St0IQ=
X-Received: by 2002:a05:6122:8103:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-575dcecfb77mr206455e0c.0.1778591221725;
        Tue, 12 May 2026 06:07:01 -0700 (PDT)
X-Received: by 2002:a05:6122:8103:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-575dcecfb77mr206428e0c.0.1778591221314;
        Tue, 12 May 2026 06:07:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac3989fbesm670315566b.33.2026.05.12.06.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 06:07:00 -0700 (PDT)
Message-ID: <7aab3f25-7609-499a-b701-8301719b9a82@oss.qualcomm.com>
Date: Tue, 12 May 2026 15:06:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] thunderbolt: Separate out common NHI bits
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
References: <20260428-topic-usb4_nonpcie_prepwork-v2-0-452fb9d63f77@oss.qualcomm.com>
 <20260428-topic-usb4_nonpcie_prepwork-v2-2-452fb9d63f77@oss.qualcomm.com>
 <20260504065402.GB6785@black.igk.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260504065402.GB6785@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 89udW6QZpkXZZHzjnnQXYukH9LggI-ig
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a0325f6 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=nyb3a_ycuV9-R_YOpWMA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 89udW6QZpkXZZHzjnnQXYukH9LggI-ig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX1Sea8R8hMf2b
 a81EugstYm9EjrXplJbfqHd0/jwZbi2MOd/T21nbk7MbwHnv3AU1z+uDsfzfvXKIGKuGgLVYGL1
 bZUMF7LC+3NVq65MaxAU4D1o/75PhxEYjjoFEuE1Wq5Zj/ZU3YI2zBHuAMaep52wLU8Lt3JQFcw
 0HkZImoZnY1bQlXBqCq4M84VvtX4yv7ez8r91qh8MwLjYqzJUAlYzvMa+83An2oow1GsW9qFVCX
 YUZs7rlWewDS5MouBhm2Cu3WIYHMpf0dskh6YQ5s4AEQ8R5TlI46TYYAt1duPBQJ00CLlfx1/dd
 tXWyaahsndI4jcfopwBKuDjDAh1fTtpsOEH0o/4nRYJSRonyLRk/Mrnw/OQ5V5WP3qotFese5fd
 uQG1/WwYibznFA/5o048KstIxbdzGxu/w/3uZHTYrhjdM0Kfd56hgdjvU/7D3dQe9Tl8DceyKef
 qBLXjpgR9NbRszaOB0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136
X-Rspamd-Queue-Id: 57EC65212A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37331-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/4/26 8:54 AM, Mika Westerberg wrote:
> Hi,

[...]

>> +void nhi_pci_shutdown(struct tb_nhi *nhi)
> 
> Why these are not static?

[...]

>> +static const struct tb_nhi_ops pci_nhi_default_ops = {
>> +	.pre_nvm_auth = nhi_pci_start_dma_port,
>> +	.post_nvm_auth = nhi_pci_complete_dma_port,
>> +	.request_ring_irq = nhi_pci_ring_request_msix,
>> +	.release_ring_irq = nhi_pci_ring_release_msix,
>> +	.shutdown = nhi_pci_shutdown,
>> +	.is_present = nhi_pci_is_present,
>> +	.init_interrupts = nhi_pci_init_msi,
> 
> You populate them here so there is no need to expose outside of pci.c.

nhi_ops.c needs them too, as they were previously called
unconditionally for all NHI flavors

[...]


>> +/*
>> + * During suspend the Thunderbolt controller is reset and all PCIe
>> + * tunnels are lost. The NHI driver will try to reestablish all tunnels
>> + * during resume. This adds device links between the tunneled PCIe
>> + * downstream ports and the NHI so that the device core will make sure
>> + * NHI is resumed first before the rest.
>> + */
>> +bool tb_apple_add_links(struct tb_nhi *nhi)
> 
> Okay you moved it here good. I think we can call it in nhi_pci_probe()
> directly so no need to expose outside.

Yeah that seems like a good idea. It's already there, behind N calls
in the software CM case.

Do we have to check the CM type though, or do you think it'd be fine
to just call it unconditionally? (either because there are presumably
no Apple machines with ICM or because these devlinks would be harmless?)

(ack for all the remaining comments)

Konrad

