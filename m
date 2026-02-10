Return-Path: <linux-usb+bounces-33244-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aA8hMKL/imnJPAAAu9opvQ
	(envelope-from <linux-usb+bounces-33244-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:51:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0AD119227
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE983306C45E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 09:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48BF342539;
	Tue, 10 Feb 2026 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCNdJ21S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SMBlzFVo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E97232B9B9
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 09:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716951; cv=none; b=ZzTBPqIpbp8KbwVJVbXCoNpJbFh2uZt9hP8+qQ6160/hK8ZuM3JTjxdoVgOAAhk/4QaCh+7bqyR539P6lA+GYtSlXp6f2MyDdUQ1dGOrYsDEYgzm7FooDeHv9Fh25LeYOAiBcBS0Z7Y/TE/iAQhGiBU7X4S7RKRmKlOExRrZaBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716951; c=relaxed/simple;
	bh=VWpPoeXCSkRUD9DKFsnHZPd3THYGbDy9Ey0YiEPu1kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/QsVaZ3yJTugNMV/P5ytGHfXyKsuh5nVP1Mty8olE1LoTVlws4gYQ3g5sP2rBaMURQTYZOVZGivxip/iuatUKS1W1z4ectFyxQKa+nFH4IyCc5INPnEf5xFxsO5w+n7tXiJWLQMPTVkgV2KmcLlthyr8RDklfcMWrz/7uM02Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCNdJ21S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SMBlzFVo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A9mJ0n4101541
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 09:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pNkH4kS34BSZ0jHM3TJU9W5qW/BubjDLmklCwbPNCIM=; b=LCNdJ21SaC5dGGFH
	Cmh7SLjmH4DMrPdnHKDH2iWNmfV+qY1zHNy6YNlF0kB/CEjfmiIKVWpanqV+mJqW
	aq4ILYtSm2oyUC5TFtrtqGI/JbFrAgbQFaLTJjUdtx2SzRqABmaBfSrP5itNtf1I
	L+RdDnsYC2WZbh0mpafiuxf6An8a+MEyOMbF0ICPkLQnWwhwpGMhxR5CL67ZAWcW
	OtzC6g+HGasaG2N/0I4+kHdEeR6SRlFjyghIM5t6xEYP+uER6EOrgBcV5+EJx8n0
	w2GQcZPbh6Gd5vSCmCsWEfVhZbCUNIL422oS9oL/+io1Y5XfmkHpX1ceRELs7Z4J
	fCCBDw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7k61k3de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 09:49:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954ab64c65so19867476d6.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 01:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770716948; x=1771321748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pNkH4kS34BSZ0jHM3TJU9W5qW/BubjDLmklCwbPNCIM=;
        b=SMBlzFVoJDDF0K6cuk/om7yJdmL5LGlo6/PnJka/uQ220vHcpfZZJ8B9FJYevGZvN7
         jZ2Mve3K4MyyaDLU91GAOYJvSolj5Scm1DQ2BAdXPdPv4v//fwabK0WJlV0gHVdHyRXR
         hHyKFYzbVIdaqpntMcG7l+eSANVoaJDcY0tEwaGloJXsO2bvQd4IZnjIcg4yVWC5ij6Y
         DMZgD1+GMghJpKs8c2fGs6MjQjLBjklknVFdnMcZbh0/zVnnblrvuCxBodY6dDt/o4Od
         q3MHB2bUHxVwoAcl/YWU/kSc/rOrURycxGTbrVRZWm9bdFcmutPr//kKIPeRePgI5BIg
         jTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716948; x=1771321748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pNkH4kS34BSZ0jHM3TJU9W5qW/BubjDLmklCwbPNCIM=;
        b=W+tLYYIU5+4/0gcuTnKqJjTUZHGJ+rgga9TwEKMLYnvtRzbGFnZAX7Xvu/imyRSZTl
         CMckOT8MPYHpInBoEo8ip9J3ui8Trab/WMY3c4JLeH2xzbTwXllpigSDdV4jNxCT68fU
         h8P9jkUKfoLxz7HbzZxrtP82AoI8+fz1UaSZ1HJqwbrYHGEg6BRV1OFDqFjL36TcE3cg
         1dd6D8xEUJ8LgjxAwZPFUE5QFL+s6CIU+VwSuWnSJhWW5osPRglphRqHPIJXPH98IZ3m
         neWXwUyzjbPxn0KLgrwfMk8tk9XnXnalkt72j0kmRx4qerk+PqUz8uFPsjuRKcJBOexY
         gA7w==
X-Forwarded-Encrypted: i=1; AJvYcCUiTfxZtGxSIMvHJ4Nf9YtVsPU9pGd0glWMrmCr+DnHliHIa6+0C2joEgvRnd+D5rEMTZzoPnRf1lM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrjzBSrQoc09Jvlo1Fkc14hk5W5pJSbV1HucCYZ9yoac4HNz1f
	kHvXa5gr45x2wLXdzold7vNW2vKHq2jAAjR5Dgcv77Uwm92Lp2f76PoZrRVpufP+GZr2lUfg2F/
	MAayQxbtKGz/uNaYbKyyOuEWNhBK1rSMcKDFsOrLo59McMTXke6QomB9dshLN938=
X-Gm-Gg: AZuq6aL3qxFcNY5V51opUDpNK1HJJWWOcxDL1zPSaG5o+CIuSHyHgBuqG9l2lxja9AI
	ym7Q5mLv4/QEuIQePN3NfgEo6SofZ3t6zzL090cxLadhDH0iIlvzsLZvSUm/H96lB3UzJ7rhZBa
	+hrHvdpw3Ll17CX+d5Sjmwb9Uou46akhrEHozD5bA6A3mAIWV2nzGlYTXGGC2wlTmw20691J4mz
	NhlGmeOmgjuXJn13Lp5YkaGPRy3DFN+qqw8966l9bhB0fKrr+ke0I1ga9XxGKuftPD6V5W8Smyj
	x2SJZQnL77ZQLGjdD7+FBEP3kn1++KRCnoaBxpJBxKmeU2PjR+1vNt/TPuWFdTZQdn3gsNn8bE3
	ofaPYRH/UNNIdOsJnQirjSuNL38RspJ1cdi4BIiq5slVHvdbLmkiAmuRM9BZkDEtAkB/p1NauRx
	9u/fc=
X-Received: by 2002:a0c:e00a:0:b0:896:faba:623a with SMTP id 6a1803df08f44-8970fee2f65mr9201536d6.7.1770716948610;
        Tue, 10 Feb 2026 01:49:08 -0800 (PST)
X-Received: by 2002:a0c:e00a:0:b0:896:faba:623a with SMTP id 6a1803df08f44-8970fee2f65mr9201326d6.7.1770716948250;
        Tue, 10 Feb 2026 01:49:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a23a3bc07sm93405a12.8.2026.02.10.01.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:49:07 -0800 (PST)
Message-ID: <7be60280-5a25-41bc-a19d-4e9c4bef0784@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:49:05 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] usb: typec: ucsi: ucsi_glink: Add support for
 Glymur and Kaanapali
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
 <20260209204915.1983997-5-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260209204915.1983997-5-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M8lA6iws c=1 sm=1 tr=0 ts=698aff15 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=401012Ij_cZx4E-EtZUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MSBTYWx0ZWRfX7WnLlxvehvoC
 fSg95qhLImlwumLELCFdPqib+yTI8Ts2a+KC12hj4vWnoCE6tNYSxO6FiPecE6Dsf3TNJNbsIyd
 DWF2C3YiTxOwDzX2c25AWZKwQJvqIF/QK+wN/b2cHJz53xyMWpT4h+X+6z3J0nP7brBltxhF9bO
 iGFHNRsHANPPp0gL80XII+4Z//ZM+7mrsZ+WqJfbymFe4wuYcxCMVIZEiL/hK9KJQRz1M1kdQhg
 I6EqmG6XdK5UQO4ZHNjISZ9VXdrtoNQK+AEnsEZsE69rjCQRNcgUe44wS3Ock4hrky1HpivwmZ7
 iqa+43eIcwv7E9vdgqoFdZoWfkguEnjqraWqvFgOkE+6ZPzLesNBcWp+BS0Cf8V2cgXfOk07mcb
 MdsYrYMQITJ/woSEd7pLZJcpmOSs2222/ErsmNsF0rGSnQai4dN4X/IKewrE5Y7fG5Bos3axXxn
 OmWy0fzlul3ONQbRaWg==
X-Proofpoint-GUID: FAa6wA4HTCTdhRoC4yNbMjNRwSyQaADZ
X-Proofpoint-ORIG-GUID: FAa6wA4HTCTdhRoC4yNbMjNRwSyQaADZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100081
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
	TAGGED_FROM(0.00)[bounces-33244-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E0AD119227
X-Rspamd-Action: no action

On 2/9/26 9:49 PM, Anjelique Melendez wrote:
> Add Glymur and Kaanapali compatible strings which both need
> UCSI_DELAY_DEVICE_PDOS quirk.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---

I was hoping this would be resolved with newer fw, but alas

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

