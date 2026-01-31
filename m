Return-Path: <linux-usb+bounces-32958-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN5vNq8YfmmMVgIAu9opvQ
	(envelope-from <linux-usb+bounces-32958-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 15:58:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B22BC29B3
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 15:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 814143019126
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 14:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E21340D91;
	Sat, 31 Jan 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvHzB4qP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ik1dSwSL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F533587D7
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769871510; cv=pass; b=uDD4dPN+MCQn6MDcls+Z6bKPT1m5Bwbt3HfzudWXKLJaoIj3e3WX8VNM0pXERdahqliEcxVR5XU8M+p1EC+ZbtVWbyQskWJf3HdPxpJmgxqUljrpz+AvriO3Ky6PX5wePu1APJSNqvKbRrZYmyzt9hFx4paE3yxcVeKbCrA2Zpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769871510; c=relaxed/simple;
	bh=XoPjc3FsSnhAH36Ksfm3BAJI9jxzPUWZyt5vdnTXd18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDEkN+2B6dzG9U3LMQL5eFqzgoaak6JMlG5SX4jzCMjX5AU6cYBY3vRW6+2btWeLQE9Zu7ypZKwBLn2s2qhz0JRH3sBlhyY4OLV8cSfDoE9R1G+cnpx8/XD1V897OhNPosM5S+l67IQBwH4lB+5vq4p4ZxGbnVnDloQSWRlqP2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvHzB4qP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ik1dSwSL; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4cJfc4075688
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 14:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjEvOy2WGDJOvuBTZY4HtZUR5P6Q5ANbgXFoz/CfBwA=; b=OvHzB4qP/0jw0pjw
	qHWpKU9MTVgAy76IZFOwvomNtT5ojMnLFjv9vAMABxUYDDdhCdM/mdh/1U5ckbR1
	OHXys8Fv+a3PchmsefgHP4EyfqjCbDSoUrH0Z9vDG2TJsjY7dmvbMOIBYgB07cQC
	ID8YMzju3Vh/8MpgAyNwHRivnN+v5eYDr5CIhLCfTj2mGS4XRYyxzAUFh9cINBG3
	4lbqX8kwiPdpC2X1VC+X57Yc4hGnLxfwp4WoeziP1V7KW8OWpTYzBS2/84Kelkij
	c7Hl5zdRcBv8uYhTITx455LsNqpLBdwF+tnJlsXg2fGzqhfqDBQ8OAyarNxVhK3m
	+a43bA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx0x1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 14:58:27 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-64956cfd789so3847653d50.1
        for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 06:58:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769871507; cv=none;
        d=google.com; s=arc-20240605;
        b=kK412m4oC90WK/6ALNB0xxdWBHJSz8dj91e2bWOrkBhIa6jMNIHy3IpySg6HOhUw98
         /qqeeOeT077qNVXik+yfWKV8260OOeQvIxjKuC6O1spuoL4xAufEQibhBk5+I6APAVz6
         1QGzzzF9IIC6wvHsU/F2sW4vbXH8JoLew3+MoL6cPAv9VUZzG2epQbKT2Ws/XHzmtYht
         U9/GuotQUofTqsPYJXSBk66ufGVUjioMeq4dh9WAkWtY/HIuIHNTULEGn7FkuhXW1DmC
         gHKMWCwcxoQxkBJD6M4Cf0NXubxJe3gaUdL9DEP8kC6sa1tYF7nNvLzWXqtW+Qi/0Dyu
         BjpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UjEvOy2WGDJOvuBTZY4HtZUR5P6Q5ANbgXFoz/CfBwA=;
        fh=RWikwiSRwT59Nx+2CfDpy0NSgMc8ehqhcpk0nylKg14=;
        b=QOdcMOFaYoJ9JNw5uad/0rdStJklUwpkLdYFkJPJaK+bfHFDSeZbMOl24NDzsfNbyF
         3+OKCajgJFPcRuIfOQ6SZdJwFNnt92wzuoM1u9Z6cGk7PXiRqbKF1E3/7G7gjWDFq5PQ
         nGnXC87bA5wxEZUwzvejV4pT49Ixf4u4Cwfl55mc4Eh4d5dCm0DnRxssonIi5t4WW+ke
         neOUuUpUDCjPEhnTlBJrCNNYQLGtc563igsNMunw8spoYiXM4rGJuK2Vg5c3SsT8nqv7
         bKZ0FZIM5AtFigu5G1NAyt9Ycpf44InmR7T1ULlcjGz05+FUQXWmqWkjLqaYwcsbFUUU
         OV/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769871507; x=1770476307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjEvOy2WGDJOvuBTZY4HtZUR5P6Q5ANbgXFoz/CfBwA=;
        b=ik1dSwSLQ5gKPr8itJihjb1p2ii6Z3jsGGCTSkLMElBTfrxMKk2BzSGAZs6Y3u/2Rm
         5Jc6JSviSstpkzoM62LilXKmZWvAB9DOuIyh5Gb+T0bn5eaFS/fm+ubSY0bwOoKcsOy0
         uUtdXIcMt8Yss89aVvVX6L4TWX7ziVDAwkZMGPY0zF71BzqoENGzauAVtQ4TysgmoZlo
         JTHS3Hq7Z/oREAC5DERRmVVlk1h39H69Q2dO8oZHQipUVCajubHib4a4IvOOCF6qUMnD
         V0QpB+SrFFffsYYxdEviApG9Tsmxy5nAA4c6446S0S+5+7eyl2juS3VlFK3vrM2U/7eF
         ejDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769871507; x=1770476307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjEvOy2WGDJOvuBTZY4HtZUR5P6Q5ANbgXFoz/CfBwA=;
        b=CqU7dwDS1Y0gsGevZBXk+ULNyzhp0sHpB5SL5DIjlP9ufx8zjiO37C/s4cRlA+kac/
         687vUXBPKPb4eRfOs3jO5+mN/9gGHGIhvb0mQjya7ZmQ2BjSGJMAhN85Q5++8EmzbTf+
         M3PIrkzA9QYBo1d1+XFK2E9bh8pVS9csmTL0OG6b5q8dEyfbx3yavr7/HgoAt2H0gDkX
         yOAz2eseLS7/w/yRxOpPleHk/6lzlVyfLRIPiJoyI+ghpymlSG3Fss9zap3CGURqEpeA
         vxUkQZVulf9OhWPIRVs0EsuDpOqUd3GUL52Y6iZHZHs1BtBcgxdPAIVGjFxK+dcb7hx1
         QErw==
X-Forwarded-Encrypted: i=1; AJvYcCXfIMwka46zo0cYGeyjpUkdWUFKysFhLJ8ysiiQCREteSbDv8fdVDmwIAyJwR6uvB/PJyI4GxpoJNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFHy9qJ3uSy2cTluJYZdpIebh0sJAiwsIrIjsM/rqfVkd+yQEF
	PM79EMqJhyHmETZMOow65n5BEEMHNj8CdbREJ+zXBGLqfgnyLpHeplJed3C+mtC8YwOenotmpa9
	P5a8AWAeoHr2X/MlykmRY0e0pmBYVqzjEWYrfDxRiC0mV7mIJiUVqkma//Eo5f9zkOfSGr5xodT
	ejUXxdN6/9EJkNl2PkQjjzyovOmphS7k4K8GfLqg==
X-Gm-Gg: AZuq6aLw2iec2ftR/U55BEPMkfPGVjyRSZqtxTiczxFun42+hZFajuogPMYYIRD+oDE
	Z8/Hm9HDu0g5TROrRSPtc3jBu1k29HBRRLnQEVJ755qHF3ZkZsFpP+cLenzRtQmuEd5bzMLtpKu
	6sNPXIiw1f8c1YyYnbJbu9iMlcvOLh9g1f584O7Y49A1yrTNy7P0dtPuA7xrsBLKmEVSw=
X-Received: by 2002:a05:690e:4107:b0:649:7c5c:88e3 with SMTP id 956f58d0204a3-649a8547db8mr4403451d50.95.1769871506927;
        Sat, 31 Jan 2026 06:58:26 -0800 (PST)
X-Received: by 2002:a05:690e:4107:b0:649:7c5c:88e3 with SMTP id
 956f58d0204a3-649a8547db8mr4403441d50.95.1769871506570; Sat, 31 Jan 2026
 06:58:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
 <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
 <2026012715-mantra-pope-9431@gregkh> <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV> <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV> <20260129225433.GU3183987@ZenIV> <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
In-Reply-To: <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 20:28:15 +0530
X-Gm-Features: AZwV_Qjt6-X-XbfNyo2_bleHjewtRG1qoA5gEXW9Hu9LjqRyKmxz-97xcVzcIio
Message-ID: <CAEiyvppoiL2EiSmVvNV3DEkr7wwyC1Fbwhm14h7Rfus4Z8uP7g@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Samuel Wu <wusamuel@google.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Greg KH <gregkh@linuxfoundation.org>,
        linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
        brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu,
        neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org,
        linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
        kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org,
        paul@paul-moore.com, casey@schaufler-ca.com,
        linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
        selinux@vger.kernel.org, borntraeger@linux.ibm.com,
        bpf@vger.kernel.org, clm@meta.com,
        android-kernel-team <android-kernel-team@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: lJ6wrgakSilOjbKpOqsg9_InPVQiQRoT
X-Proofpoint-GUID: lJ6wrgakSilOjbKpOqsg9_InPVQiQRoT
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=697e1893 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=1XWaLZrsAAAA:8 a=drOt6m5kAAAA:8 a=wEBb_YokH4NsbSDSc3AA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=RMMjzBEyIzXRtoq5n5K6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDEyNSBTYWx0ZWRfXwaL+z9AJXmTd
 eEKps73GMYPwZUVHUu2ivFC1S4xsMASYHr0YXx3bZfI0ITkiAjTT5rktwO9sCXgnOnUeV2zXRQq
 5dSuDNTfluZYVfusH/nVz2sxllZcMXsPYi050cwWuO7frDiahhieOAWkuXZxeUv45ydKvONqnyl
 nUqTNZ7ixwtPMuyLVz9MyxVNj6Zd3xssVPdq1h+3f2ZrIZ+1nsWq3UA2jZZGg3T5QeEBUFWDHq5
 vsr4GXApnMIBWGNwdoRmBiC0dQ6Sxu3vBbp+ewnYCWBR7xgHZl3P9ad4q2FJVVx9OeQu2dPPyX7
 m3/n+t+JGadnkTZdKExC32kqfZz1damv8lhMZz9sH7vqkfuX8Ov6934ElwP9NQv3rEpNTXHlZe6
 8EgtPIciGP1DcRbac1gGpzoolvBhyarsNJtjnCc+gZSQ20ZrX1bPpxDTTgFTVq4+fQOdxQ+6IdK
 lBEkRgwfPASz1LzcIbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32958-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B22BC29B3
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 6:46=E2=80=AFAM Samuel Wu <wusamuel@google.com> wro=
te:
>
> On Thu, Jan 29, 2026 at 2:52=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk>=
 wrote:
>

[...]

> I'm exploring a few other paths, but not having USB access makes
> traditional tools a bit difficult. One thing I'm rechecking and is
> worth mentioning is the lockdep below: it's been present for quite
> some time now, but I'm not sure if it would have some undesired
> interaction with your patch.
>
> [ BUG: Invalid wait context ]
> 6.18.0-rc5-mainline-maybe-dirty-4k
> -----------------------------
> irq/360-dwc3/352 is trying to lock:
> ffffff800792deb8 (&psy->extensions_sem){.+.+}-{3:3}, at:
> __power_supply_set_property+0x40/0x180
> other info that might help us debug this:
> context-{4:4}
> 1 lock held by irq/360-dwc3/352:
>  #0: ffffff8017bb98f0 (&gi->spinlock){....}-{2:2}, at:
> configfs_composite_suspend+0x28/0x68
> Call trace:
>  show_stack+0x18/0x28 (C)
>  __dump_stack+0x28/0x3c
>  dump_stack_lvl+0xac/0xf0
>  dump_stack+0x18/0x3c
>  __lock_acquire+0x794/0x2bec
>  lock_acquire+0x148/0x2cc
>  down_read+0x3c/0x194
>  __power_supply_set_property+0x40/0x180
>  power_supply_set_property+0x14/0x20
>  dwc3_gadget_vbus_draw+0x8c/0xcc
>  usb_gadget_vbus_draw+0x48/0x130
>  composite_suspend+0xcc/0xe4
>  configfs_composite_suspend+0x44/0x68
>  dwc3_thread_interrupt+0x8f8/0xc88
>  irq_thread_fn+0x48/0xa8
>  irq_thread+0x150/0x31c
>  kthread+0x150/0x280
>  ret_from_fork+0x10/0x20
>

Hi Samuel,

 Not sure if it helps, but Prashanth recently pushed a patch to
address this vbus_draw kernel panic:
 https://lore.kernel.org/all/20260129111403.3081730-1-prashanth.k@oss.qualc=
omm.com/

 Can you check if it fixes the above crash in vbus_draw.

Regards,
Krishna,

