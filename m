Return-Path: <linux-usb+bounces-36609-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN9LI0pz8GldTgEAu9opvQ
	(envelope-from <linux-usb+bounces-36609-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 10:43:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0B7480633
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 10:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC86530D0A63
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 08:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9613CFF53;
	Tue, 28 Apr 2026 08:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hS5ctlWI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hT+CQ1Nz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D03A2D0614
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365139; cv=none; b=caymrCaKlGVgQGJNnLvK8duxfqosbIxeehJr/0QGglF4331tfsleeONDGX0HMITHgud+EJl0dHDysZ+DQzMl2ovcgLsEYReLUsJwTA1WAsJ92v4YRVZsvcMUL3cFJBGIZIEqIUStHxGHGM4fGSZDYUwPUzRah/YFT7BChnldBFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365139; c=relaxed/simple;
	bh=ioDuo7tnWPkIV+u/gZ4vdbcGbc+WB001JmPbBpk0llU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l56JWS6uwCTk0r1jIom325xQrPcK8t0SERvNd3J+xtFXyS6oWZGi+kKNx3uzDA5qtKM9CRyduyKgHWImpW2geWjUtl7XwQ1ghxEz0YbjvEdVGcA/82oG4JJGQMds2+pF8yThcZYK7DSOzHjgVbQtDXjRujEYmMTivzAwiVi2D9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hS5ctlWI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hT+CQ1Nz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S246WY3123487
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 08:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+Zu20h9/F+SJQk60N5/Mbo/x
	F3FttwLE1vaX+pR9W0g=; b=hS5ctlWI9cIeddy6YUztSdjjD6lwbI9thiZ7wkj8
	eAO5IbI1SQy/hKFouiNAywQ6om510bKSBF3fhdmg/sAyZPNTClkKiWDtyQznB/WX
	fz6BMBWaaEdEYERW/t1QptBsRMUa2Mzb9KcpV+vwJGd8SDN/jBLiL6EK4NBU25IL
	GWoMON8TshQ4PXU7Wm3gvF8cobE1twwlcCgrd2N1Q7yxvAsqlb6SjlEi1q0Ijt/a
	t0SZ2fsmzOaOOGWzAipO2hHB6XDGNYYF2HJ+j0LoVmfJRv8Zfys2yCKTmlELbPO+
	j4JoHRZVjHPVS8hukbOLNGeUxK89FxTEN/W7Fmjw5jT/6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgmkhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 08:32:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e5a336b44so148063121cf.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777365136; x=1777969936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Zu20h9/F+SJQk60N5/Mbo/xF3FttwLE1vaX+pR9W0g=;
        b=hT+CQ1NzpDrKIuMVeJPIr5RSejffhxrnqBSHsvd9jYB7tJnoh+XAvryFB+VKa4Fgwh
         wucHkUrGdL4ww8J2R965XL1XpP6GiqGs9AJDRhI1l5FDVHRaAfilv7TMHLXbE/f0aQKL
         NG6iLyJB2Kw0nFkzapEWoeMuZarCJFcfoUbZ+xxqLvVP6ESXAustfCvMq6lNXtICkFpU
         ah2OaAnhd4xkzlILEAUDhW/ZgzDoNN+J95s90Sa58BYYwBTBi2oXo7sweOrrfTo5e1aN
         FiMimTO2CaHHHLvW4zsi9eQlq6PLXhPqRACmobKt16nj5oCmPQplM38tNMQsBV08y0tr
         s9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777365136; x=1777969936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Zu20h9/F+SJQk60N5/Mbo/xF3FttwLE1vaX+pR9W0g=;
        b=hV9ekKcLQ4iYmgzfmDTisfCTBTssv+d1pGcoEHuNfr5Sw074fy/xm7TxEgXg0/72rd
         X9c8dNVX5OrhUyinAEdqaBYt0WX3vGeleFBcCpIZwIJbcyeG44WzpelGZsjmwrEbAsMk
         G42aVyTx9lssVNogrrJV7tp3fJZW25UzRfeO6Yufx0rgFRt3EpOzZrE56LwLY0HnvkKv
         vz7pTRcyeJSParMC+T/UwEmendX0ptiKmBsTAbb8I6cmVH6ylSXh/12G9EJ7OvkvSWPq
         Hgo1T3xR1X8Ceq1tSVdpJVflrzH1voNouk9CzCbBm8bFjSpxj3mlfKEgesnqKcp//Bye
         Thqw==
X-Forwarded-Encrypted: i=1; AFNElJ8HgVeSsrYkeIFziweV1y7xSSXMh8k3udQSeeaH4hsKwUFcDvnNtZES4AtkkgAVbqtbkh0bY7bRNRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkUIVFDExro3MzdllivZKcIMKzh/7gJ9dO48Z7ymWREgHYQhgG
	o3jvgqVzy9N3x3jlFoJyQwL7jqGPE6646AE9H7YOeYeAEHKCRRMvIw6BvouTsqOETpk2k+jSI9G
	fhBvmozEeoL6fysFvwqw8OQv18suDQkiukZrCyH02MdgaldHqFHRd3VjOs9wTy4g=
X-Gm-Gg: AeBDiethe7tbQsBJ0vmgDMrIdgYJEzcMdRqBKVLfZakDvBNFrLNwE0zjohif1+YK2vI
	eeZCSwZZUFFA5NuMjEuCC2BMFityB+fCPn1JgY78InMrC45SZp3QEYlAG8I8rqRvEtsF40npFvN
	/1DCrXOUO5a5lpW/VJ/mSp/UDjW76E8yD5dprfv6z8ewVdHchZHHn5GXV2I8ISvcBqILKeKHIQr
	BX/nHRFejSOoVzwVlJqAH9XrDMAEOnYP/HPW5MCanFWj90J1qyh/YtXhPH1r/P1jyLaLIWqGKAP
	n28dcpx78M7mjbXdLNqqWyifz0KUkv0kJUPOvgUn43LQYSLV0aCkvEBqSYMxvF3CHGp97SGMBsJ
	az2qTSN1wzyEETBzJwaJ0ybyGjrefhahNY+AGMvFCzH17zBM=
X-Received: by 2002:a05:622a:8d0e:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-5100d9cfeb5mr22876881cf.12.1777365136004;
        Tue, 28 Apr 2026 01:32:16 -0700 (PDT)
X-Received: by 2002:a05:622a:8d0e:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-5100d9cfeb5mr22876551cf.12.1777365135474;
        Tue, 28 Apr 2026 01:32:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a773a870asm44939345e9.1.2026.04.28.01.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:32:14 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:32:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Cc: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
Message-ID: <csj7ilfxa4hcr7groudzrrc4h6fddobxprmyveyae67rsgtian@rxu3gbhvulbm>
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
 <20260427214217.2735240-5-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427214217.2735240-5-ronak.raheja@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3OCBTYWx0ZWRfXyrEwhgi5k2DY
 h0ISixNgTHP8tF6UK2vk96rEfrnMEpjRndFlYZ34mPFdexg54HWftTJUEUh+dvE92t7E5o6TlQt
 AiHWCGc3kPrd4pfQDEZju8VbKPk7MKf9rjyjIKef0/znOo6zquRBYxQ6nnTyeKFApnhCb/4aRoA
 GwcbnMisqEAEWaCH4t10q978+4pt/ee/3gvrMw101I7d194MOSzdNvEco8RUv+gvp0/eUQxqPdo
 wzOS6mmjX0fCBZjRjaDe3dpwWSOaJiwTby0ZPbrxm0KmQH0yFubxDWWfDq07DNL0XjbSOXpYSnL
 I1mctFP2Kdcxp6LerkW9TBj5prLSlvv9ycmmKgSTJeCkEC/Mu0+PWbRaScO3AmWZ5LNzMtfM19f
 B2wWk7mmr3wpz4+gS3Jz/0slLKpbggJkOvt0VIoAIxUtAYGyIoFa3+ZCTHAzQcrpXEdXjXcUaA4
 PbG3BHGXyk40EjXoJ5A==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69f07091 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1tJ3z92Lny5kRZNiqYQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 4bOrwd9xqUWfyT28M6wIDeP6_2-R1rAb
X-Proofpoint-ORIG-GUID: 4bOrwd9xqUWfyT28M6wIDeP6_2-R1rAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280078
X-Rspamd-Queue-Id: 2E0B7480633
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36609-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On 26-04-27 14:42:17, Ronak Raheja wrote:
> Add support for the USB3-DP combo PHY found on Hawi platform.
> 
> The QMP PHY for Hawi uses QSERDES V10 register layouts. Add the required
> PHY sequences from the hardware programming guide and new V10 register
> header files. Also add a new v10 offset structure to incorporate the new
> COM AON register module.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

