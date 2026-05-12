Return-Path: <linux-usb+bounces-37334-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGlbOREwA2qN1QEAu9opvQ
	(envelope-from <linux-usb+bounces-37334-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 15:50:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1AA521A56
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 15:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B40C301AA46
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 13:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D543E1706;
	Tue, 12 May 2026 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dF5TCNLr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIQglgnk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F733397B06
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778593401; cv=none; b=Kmxa2TzRqYqLjPAS3mHNKbfbnEbjnk+BcL4shJZfc5xgYFcnLPmp12VsgzVbw+cofBytnEnEO0SrhBnNaLXOfrK3o/TlXPrtFmJ77eNhLD3w/19kB6cyeJE242zt3lIvQRGfQCzpPXw8JmDOQd/SdpjIj4j2b0JoUpruU6rRzCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778593401; c=relaxed/simple;
	bh=OEjrytslbt6HQZoRorWzfmL8gpaLUaLvAaGe4kF4hMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YyvGjpMxUu286U6Nzo4sZ2XCGZDGog7YT35YLdbwh9GSHtQIL8QibGkQtvDwroJUZLKHIKNGEgGDfCUUbM8moCSJaAJqdG7BKUWQIiy7pQ/2y0AVqlgalW27tbth6KOtfHPNLXwubW0B39fCEv1D0QJBCwH2iRGMCUM75yME0sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dF5TCNLr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIQglgnk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB5MWJ591851
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 13:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJMQC7vSWS9IasgHmQWVqiRy6k68XFBix4FrWXZnp78=; b=dF5TCNLrrXELB3oK
	loQRmn4JeXMKC7ZloubX5eGBOfA8HD030BJZCU5nR7qCywyb5wfgzFnpbNJ6wc5O
	Kb4l5IrUd6PRO7xAVuoYjqoNXT6yVRq0IT79iRMtkA5/QOizhFG/Vlc0lEaiFIQQ
	/hyRx8EOOkcySGHCr0AO4c94ZiIQZT5FpNsNyVtBywH/MYfOh7iyEq8P7F6QpsuN
	lAEy+VWK4UD8jCnuq0DpjNRZrlqyqpOALQoEVh3OLq9qXy43OPJ9qDEZfOdQrDG/
	B/NMehP3CtY9FuhMZPYU+2F8nIeIjH4+Dht/p8Z6+IDmLa4QL8cc2FQw5JTsnQkw
	vVgn4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319rmeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 13:43:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514b5cc5cd2so6059161cf.1
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 06:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778593397; x=1779198197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rJMQC7vSWS9IasgHmQWVqiRy6k68XFBix4FrWXZnp78=;
        b=DIQglgnkUz+U0b6KjR4CuBm9yADxbD5szpCM+0e6dym0yRr+DiuWhPWopx7zLpV6HF
         aVS3QSqNGzdaubBMfI3slkKKWxsmHiqvLsnOAY6brQCN0mJVd7vR/fEEjAyNr0cB9DnV
         1OvNt+jRaYy6eqWdJdEYRkyWtqnBfX17iklgAd29vFbWwgvsOwfxF0wSuVCgkDzf/yyU
         Kp4ZUaQRtaibr2MEODNNrjNaBiodcE7g035Sa6mx0x4I1nI6EJojdSBENKs1qJd04XNW
         orQb7wvUmJhszfyWK3EoomfGjSMjulhHOCIWH1fQEdgPBgutFBm7YsO6b2kYyDGYMjSu
         EFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778593397; x=1779198197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJMQC7vSWS9IasgHmQWVqiRy6k68XFBix4FrWXZnp78=;
        b=bnje4Jc2FtT2CON855DBQJaT2WY1z7mR5APwV0szdKDh8lVY/7VrzCcAn9NHLNQmqk
         aNA6klu28rk9dxTItPdvQiSexYDweOv+Gd5Ci8sL8lIxS7Oyu+Dyuq8Emdfa1Z5ah31p
         cW39qKrRB79mCDn8KUcqPK1QDHSjF8/VX8mzoXohKhav2i0lIdfWgCSrf9nnkwmVmeR+
         yWvUMuSWiRMSssCqdoZFODibNwWvd0rltfQSUxEzXzGx7fNYc5RAy054eKiDn/vF3xqK
         tW8uePTO7BrgXjh+FOsL5xEPRk5nCjA+xmKq5SkmJ8MFkIaPchnFNNFL2UDtoVh9U52v
         VfOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zc2sZuTya6pS4wPTHUP4prUs8KsTVTPZa0dukVG9/p5j5dzsY9uXMcoPC9pPNtVTHWbX/gFiM+p0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAygC4/aO1y5Le/2gpFjmBH4GvOEJgcuaWTJtwXihHrFNVX9vb
	L98EQRAy/uZhW8c6vXZ/mPMh6NDytJitESS4KweIzlD0sa1OPQarwgEFl2JB42IFpxv91H1qFLW
	IoBdr/r66X+bKB+PunwcvzbPE6zxILlsAKAqZ8Pswb1Hs7/YV1FVRHhCG4fdcyGccfQV/Fes=
X-Gm-Gg: Acq92OFakBc+zEYivu0QUTRoaLjpO7CBd7nuFdmOD2iOvd1JsYT7LEFU52q4y/QCHPV
	450fyppm05f1v5nWldEufJQXfFwMVVjFAQRjGc2lA1z22LLkvN3P4ubZcHuGNchEtf81s/TWfaZ
	qenk+DZyCAgpbO3tP5vEAkvf3WXu7fl+wKeS7OCnaWxd3leakJ8XMfZhDCpTlQD83ldV8tb2CpU
	Vyv4sAY04WgRbR3ljkN39HIP3D2DF6MI9bVSkG9m6c9iACUzan6lFBp8FPYe9AzkOBJO312pPrM
	eHocVmnz3aK5IUs0iOt9S+ck5QDOHj7/rdIzjj3QHd8nVChp0jW+LW3fDcHhPZl8LBpKwAmQ+jL
	7cV37J6eEwdXP5Yl4JsSDvZItZtgvrnofhszgf9nmi5x5J/Am3oT2IuVt0LshkNAWjam3T50zZe
	Ju4xE=
X-Received: by 2002:a05:622a:1108:b0:50e:6311:7380 with SMTP id d75a77b69052e-51464b1b978mr285575661cf.6.1778593396318;
        Tue, 12 May 2026 06:43:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1108:b0:50e:6311:7380 with SMTP id d75a77b69052e-51464b1b978mr285575311cf.6.1778593395612;
        Tue, 12 May 2026 06:43:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6268ddesm33432601fa.37.2026.05.12.06.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 06:43:14 -0700 (PDT)
Message-ID: <80e0bd64-c99d-4dee-9417-3036f72658f2@oss.qualcomm.com>
Date: Tue, 12 May 2026 15:43:12 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] thunderbolt: Separate out common NHI bits
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
References: <20260428-topic-usb4_nonpcie_prepwork-v2-0-452fb9d63f77@oss.qualcomm.com>
 <20260428-topic-usb4_nonpcie_prepwork-v2-2-452fb9d63f77@oss.qualcomm.com>
 <20260504065402.GB6785@black.igk.intel.com>
 <7aab3f25-7609-499a-b701-8301719b9a82@oss.qualcomm.com>
 <20260512132008.GC84797@black.igk.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512132008.GC84797@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE0MiBTYWx0ZWRfXzI4GIFU78YhA
 inKKXpkXrTrbUX1N0NkQqH8tAcB1UZiDZoVdQUSu0xDJNTous9KF1SMHtg4hi+SHXu2CRXx8voj
 pQEdIIAiV419l3f9TG1FPwhJMXbrnR0UtmcrVWVU9/xWmMKoGpHiYTbKmZGJctLEEyqomIwUcFS
 yw0TSB9GpJ3Z2wgv6ESxVrGyzgMbrarkYc/BedOJx22rvFuZG4tRuqkCErvCsq6OIHjfxoJTebl
 SaxSOyVi2wm6oJEFgXoB0X70uynb0aglTDUtfSycCuc76MPS8dDBxI2IuQHqGvMrPjJTGpllwNj
 Dys8bcBmwV4FD6OGWm8q1IwG15ikcN6fUxpLKQSbE8VpkOR6fW1toSeZwb2qseSun8/jzHIOh/U
 lm/DMfeEwW67v9wownA7Lh2zgThxA4g2ylz3l8vI97iWkGE90ZOrSaHl4zFNBwthGtD/K+bAqJ+
 yvTcg6Dk4EcoaODSdUQ==
X-Proofpoint-GUID: eN1ff6u1V9oor4rN3TdJszmdxOMV9aYn
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a032e75 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Dw6u55PnCbx0-5v_w68A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: eN1ff6u1V9oor4rN3TdJszmdxOMV9aYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120142
X-Rspamd-Queue-Id: 6C1AA521A56
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37334-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/26 3:20 PM, Mika Westerberg wrote:
> On Tue, May 12, 2026 at 03:06:58PM +0200, Konrad Dybcio wrote:
>> On 5/4/26 8:54 AM, Mika Westerberg wrote:
>>> Hi,

[...]

>>>> +/*
>>>> + * During suspend the Thunderbolt controller is reset and all PCIe
>>>> + * tunnels are lost. The NHI driver will try to reestablish all tunnels
>>>> + * during resume. This adds device links between the tunneled PCIe
>>>> + * downstream ports and the NHI so that the device core will make sure
>>>> + * NHI is resumed first before the rest.
>>>> + */
>>>> +bool tb_apple_add_links(struct tb_nhi *nhi)
>>>
>>> Okay you moved it here good. I think we can call it in nhi_pci_probe()
>>> directly so no need to expose outside.
>>
>> Yeah that seems like a good idea. It's already there, behind N calls
>> in the software CM case.
>>
>> Do we have to check the CM type though, or do you think it'd be fine
>> to just call it unconditionally? (either because there are presumably
>> no Apple machines with ICM or because these devlinks would be harmless?)
> 
> I think you can call it unconditionally. It only does something for TB1-2
> Apple systems.
> 
> For Apple TB3 we used to start ICM firmware but this was changed as the
> driver learned SW CM. However, we never setup any device links so this
> would not change anything.

OK. I'm keeping tb_acpi_add_link() as-is, since that's both bus- and
arch-independent.

However, doing just something like:

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index cb5d028de3bc..f5ddc8ddb8bb 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -3327,7 +3327,7 @@ struct tb *tb_probe(struct tb_nhi *nhi)
         * before the PCIe/USB stack is resumed so complain here if we
         * found them missing.
         */
-       if (!tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
+       if (!tb_acpi_add_links(nhi))
                tb_warn(tb, "device links to tunneled native ports are missing!\n");


diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index ca50e3584cac..e0abd1d503c5 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -294,6 +294,8 @@ static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
        pci_set_master(pdev);
 
+       tb_apple_add_links(nhi)
+
        return nhi_probe(&nhi_pci->nhi);
 }


Will cause the warning to show up. And adding something like
`nhi->device_links_done` is a little ugly.. Ideas?

Konrad

