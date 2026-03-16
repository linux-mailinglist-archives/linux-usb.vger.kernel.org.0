Return-Path: <linux-usb+bounces-34859-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEBiKlXit2lDWwEAu9opvQ
	(envelope-from <linux-usb+bounces-34859-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 11:58:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E69298584
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 11:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B07BC305DEC0
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6A539022A;
	Mon, 16 Mar 2026 10:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iqf51xuC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grAHcqYg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2091639021F
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658442; cv=none; b=iNOQ8H9pMFaeZdCAFjn+2+NF0VdISgLDh8NhxsCIYuBb4CrsPV8SEjAVkhRL/1nbYDZOrDePm/sX7iZO0qlQDw8HQHAH6fr05uhs2BlIdr13rFzPweDhQMVJv9G1A2kCFAVfSmFVweexyCT/5UqoPG+JtfE0Xr0aPMwvizTY6hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658442; c=relaxed/simple;
	bh=1yrviHqSXF9T5Z9ErzIMR0ycwVWDFN96Rk4c4WHPAwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJvSFdYow3gr/r1fuqcJZu5ch+W7Yr5lZGVHN3MblD0vsi38RMb47IPJyURzqSCqM7gzPoPXgETQK8EYVFZpkbfQn5LdCtDLXzhygSd+vNvodMQibAOvohFEZiBlZxDUsgdT/UX3FkuBX+M0eHO3GA7gMzfb2eySGqJOEPqVfMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iqf51xuC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grAHcqYg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64lPA323701
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 10:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DaOxGyMwlbRynP3B6fbAvTN3ZnEyIcBJwKLT8kR8si0=; b=Iqf51xuCV7nhrfUw
	UWpjTb8AxqXJN9QX1fyl1mEbetOOkjUTp92pNXZMdVSypF2hSLB9uFGYWMP69o2N
	adhhAHy+fLyWflJfDvc5q6u3PZNqDUIgw5hequBHBuL3G17DZSge7siHDlgoEBPe
	yxq75r5dkBCakA0B2kB7CX59quxaE7rgO+cr0FkeX6rJjaXAbh2s3NCTWusgsona
	GAV82cDiEQor5xZ199JLUK6BxkMPTOlJKyceDqBsfGFsP/kqw80SWSjDnEGryEUv
	pFH+YqCLYVt9xw7uWEO0MmLW7X19+4ZdSmQY+lXOWRM2pHijhXUZSt3gFf7mjShR
	3F9uPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qndst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 10:54:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50946034c60so41735351cf.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 03:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773658439; x=1774263239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DaOxGyMwlbRynP3B6fbAvTN3ZnEyIcBJwKLT8kR8si0=;
        b=grAHcqYgF2KT8xWfnudbCf9EsoE6uzhq2g4RBb3S64EyWtL3gY4b5zMZtEDZGrEmut
         eAvLpHYbwX0YxAi4ay8E1ytpF0LDA3efOI7tjmW46VhUk9DH1K0qpi3YumCKirE1hZ6s
         yf5//qt7yYkbmsHY1U6KyNs9a9iDWltF5hBigl7gmSlrcdWYAmq8em4R06090P2vTJqX
         P3EtV4rllAjejbnKTCRm328u7Hi04+rAxd2ZzWhMZEGYmzKmnSCkFQxPq7CNrRHsgeqg
         4pLY4ioSQcsCTylHZyyYnTyM99rpoizaU02XUFTOyhpolG+1xZkjKFXbMWrHBDC0BsWC
         zjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658439; x=1774263239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaOxGyMwlbRynP3B6fbAvTN3ZnEyIcBJwKLT8kR8si0=;
        b=ec2Y42Dbz7VSjpo6yngujqszHmSp2Xr1Qgacvoum4FWuQE0I/4Z3QbgdYXgoTUhgtd
         AQfBZ3sUBbTkxe2tUcJTdiYMyc2qlvPgYGMUqJiLoIv4oI2hsAGHsj/yL4noySvRtPtD
         X5j/gExt5MhfvxrVjozKlo3lkTtbm7sFVNsQkiD4ujUfKMk1fXrWDmkkHcy3ipyapxAB
         pMnShY2N4tIdf6pwIbO22GtG1mMmQ0X9BaXeBclU9fKNg3H5uBAAnHduOPCP8xggVjXy
         Yi41bReGPhBR9fw110iDjQEkyrdOgUkhuT8LxLCFvIsPo8MZ1H3lbKUrIhfoT1Tm+EKZ
         lcLw==
X-Forwarded-Encrypted: i=1; AJvYcCUat/AaFS4/zqYII+CmUAPXedhu8gca9KtJeCe5NEAbqot+/AJ9z1ICQxU0g7b6yuvytRnbz04hd9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhJFq/h2dF+/T/Nt0K9kKBgpcCi1YEd8Ry4JMjKr9lAHDQRkKn
	SO5cMDJzSMgDz+627GbVCDrTefOQOii1iFwTnh7YH+cyL3+jCX/ohIh/6YdTRqeaAdIPlx/96f8
	eF5XjtjZO3SX5CnVoC7XaiDU2yU6Y/3bJmjNOJuFgGLWuJF5PZir1tgOajI9DL2k=
X-Gm-Gg: ATEYQzyngFy15rJ+4rL6wN4u1tAOF2odqp5bNa9dIjlUINVHxFX43lr/qY/gTkyxjzh
	fZsT0pLgVT4eJiNvDFrHQID4vnY4VO6G3fHWseWNpO9UiY9R3GGaPX6mudmYTDBVEn5/k8vURf6
	ErvFLxKrx1tOvThXnxNZxdusLrbkudadExfW9MtXfGXbJddmUGxTIH+/TRYn6WRAAgBq4k7k8i9
	sWWp3aDBrMtCIRBiBZTC8/Ihf5UCouu3a9cfkOnkRCT/UrEyCQR3T1Fs8SbVvmgfXrnIsfmwBoW
	ZlHOnvVG/6jh/MC1NNjAH1pIEgCoWYLyWUxM11hUpJqNSiG3/h9D6Cq3pTjszxVXscbmNb165cG
	JrIS/7/dDoYQZI4WhfG3Wf8BX+PnHctnMPYbLiodrCmsliV2SJsaCjCabmgTPMBu2+EMpCOof7P
	b2mW8=
X-Received: by 2002:ac8:5a90:0:b0:509:a3c:e390 with SMTP id d75a77b69052e-50957d1b684mr128665861cf.4.1773658439392;
        Mon, 16 Mar 2026 03:53:59 -0700 (PDT)
X-Received: by 2002:ac8:5a90:0:b0:509:a3c:e390 with SMTP id d75a77b69052e-50957d1b684mr128665601cf.4.1773658438915;
        Mon, 16 Mar 2026 03:53:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fdb6225sm4986109a12.9.2026.03.16.03.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:53:58 -0700 (PDT)
Message-ID: <1ec935ce-2023-450b-901b-a287b9d1f486@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:53:56 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: ps883x: Fix Oops at unbind
To: Mostafa Saleh <smostafa@google.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        jack.pham@oss.qualcomm.com
References: <20260313155534.1916773-1-smostafa@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313155534.1916773-1-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1bDoSiJpPOqXhjNCrBf7HDGZn7ntpeDo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX6RAU70J5poBB
 7FtKMadnVCpzb2P1ePdlvFUnMczMG99X+3HY7HtsUIqHd7LnPAWgODxHYdamymImB5hmHxiz8vn
 1FJnGK7U+4YVQE9DA+ePxCzO+HlP+8MfQb7yT9m5uFBA43G4X1Zpw80MPPWS1VemAuvGWSecMmX
 z4X8mAmyYmeVD0wfvo1k7sLj/P5YKsvM5TDVydHLLi1/1RQJb8wrAhdoE3hS3tlNzcZ7C0xR6aF
 MXnp/RPsO/8c7JTtn9joSXnzuI4lUFkxPmhf3xZ1QYCsXwfcVNilteC+pagI2ALrFEatTljB/Wm
 fYNbYQEgsriHS050NOpEVslVI0Ye0XGYLx0dWcctpOTIzKwNK6joyYovDrldwtHQkmBD/vyNBt+
 D2iBxlrdBG7ZrJbn+M8v1A4UNdSLE905d3b+3/Bcom3Mu2870km3/82kcV68e57yJp37eMNudlT
 2+y8GIsxI1P1/7cCczg==
X-Proofpoint-ORIG-GUID: 1bDoSiJpPOqXhjNCrBf7HDGZn7ntpeDo
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b7e148 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=1XWaLZrsAAAA:8 a=hMhAVbCCx7uGpyVcq4oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34859-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57E69298584
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 4:55 PM, Mostafa Saleh wrote:
> When trying to unbind a device in order to bind to it vfio-platform as:
> 
>   echo bc0000.geniqup  > /sys/bus/platform/devices/bc0000.geniqup/driver/unbind
> 
> I get the following Oops:
> 
> [  436.478639] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
> [  436.487762] Mem abort info:
> [  436.490716]   ESR = 0x0000000096000004
> [  436.494595]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  436.500071]   SET = 0, FnV = 0
> [  436.503250]   EA = 0, S1PTW = 0
> [  436.506505]   FSC = 0x04: level 0 translation fault
> [  436.511533] Data abort info:
> [  436.514558]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [  436.520215]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [  436.525436]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [  436.530918] user pgtable: 4k pages, 48-bit VAs, pgdp=00000008861a9000
> [  436.537554] [0000000000000020] pgd=0000000000000000, p4d=0000000000000000
> [  436.544548] Internal error: Oops: 0000000096000004 [#1]  SMP
> [  436.550374] Modules linked in:
> [  436.553542] CPU: 2 UID: 0 PID: 671 Comm: bash Tainted: G        W           7.0.0-rc3-g56fcdd0911a5-dirty #2 PREEMPT
> [  436.564440] Tainted: [W]=WARN
> [  436.567515] Hardware name: LENOVO 91B6CTO1WW/3796, BIOS O6NKT3BA 05/02/2025
> [  436.574675] pstate: 21400005 (nzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [  436.581841] pc : ps883x_retimer_remove+0x14/0x94
> [  436.586605] lr : i2c_device_remove+0x28/0x84
> [  436.591017] sp : ffff8000847137c0
> 
> That's because the ps883x_retimer_remove() retrieves the driver data
> from i2c_get_clientdata() which was never set at probe. So, add
> i2c_set_clientdata() at the end of the probe.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---

Fixes: 257a087c8b52 ("usb: typec: Add support for Parade PS8830 Type-C Retimer")

Konrad

