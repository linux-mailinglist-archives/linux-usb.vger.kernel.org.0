Return-Path: <linux-usb+bounces-34858-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFr4Gxbit2lDWwEAu9opvQ
	(envelope-from <linux-usb+bounces-34858-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 11:57:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0DD29855E
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 11:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6A9D3050D4A
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6503439022C;
	Mon, 16 Mar 2026 10:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7jYR7Tp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLqoYt9v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE169390C89
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 10:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658404; cv=none; b=ehbYxV0U/AKVk/5ca2sM58qPw7UGtT+pPE5O2Ayru8WVWteqtAVcyqMb8d+T3FJGXbp2rphOAx+0lzlxc749Mjj/J8/MK8uYRajzvmZ4JnuuZbW0L8U9KwzQ3ebb0MLd/oBpnjp2NtaZYDqCAMx/KS1xuaUHNzc1VYVSCJhMw9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658404; c=relaxed/simple;
	bh=r+6px8yxiYwkwNG5yBsLzBKvmef+byclmf5BAXEOWfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ow6grMIglBMBY6GKRFiFnhD4G3VKQxsX1O27UUPidnSACrfTe0KeW3inC0sn5imxSDDuTuxNm/wpnodCvGn3zl7OXudvetgEG23xDSJ16/7gbb9L+mdauH96Ux9FttmjIm17Ti76HcDOpdAkRMLi4QHgHM9zMpMBfBro7J/g+1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7jYR7Tp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLqoYt9v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64fkx3777743
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 10:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGd9YvI4LwBJVv9zibDy6yoqxfjO2LwjAuITLWDgM5A=; b=L7jYR7TpcSvfln0r
	jo/MkNvWVSt/wksA7mvq6K3NXNcQPmgjsO+ajnbIQVm6K9JkL2Ek9JOctnTcp7yS
	mTWny/0E7cO2ihwYmlXEj3tHX8Iw9gu4kd14+QyX3MvWVFW82fROGXt/Gzi7HfjK
	sTIXb+OvY1rmTVZopKQ8dNBuNwERep++6RShZu8wJ1ljB6OrrR8o8Qge/DjiOJrF
	LdN/FYfy88vY1OTW6A9EOf3e4/t9xBrlyw0bAvnLYPEVLpBVWXnDhSuoDpNdWJEm
	sPdxyaL2b+CGCvKsrjAz2EFgNNphe4RnSCwR9JpUgSPF5YU1+5qhRBy325YVtWkJ
	YTxZLg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7w6nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 10:53:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8e89d19bso301078385a.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 03:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773658401; x=1774263201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGd9YvI4LwBJVv9zibDy6yoqxfjO2LwjAuITLWDgM5A=;
        b=MLqoYt9vc0DlpIv+cFfc0LWTaswuIWs7XtKCkygkPuguJDrjpxLrNAQnk3sYTwtHo0
         QTDwh0E+2VcqC+gL84oVr4QrTc4PUpNk9FBxNIZLID4kx7brj2V8k3K7kLPZocNtISYA
         9576d9iaDWJC7AeWeNAdHIw/QgS4mA4GMHGpHGLmBOd6yYHaw+OkpqTBYjOkWL8NnSNN
         NlCfJgFQeDsl/WMkoCZ0iSpmTH5TxQiCBUMnn2P0NfK/lrEKwZiJST4eCDXudqu4+YTN
         aa6GROZHoHZVLDuD+HtsIuRd7lCMEZQh0FJVeAod+IHNT4J/+r9SGeaO6e1BMYSDYPLH
         Gl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658401; x=1774263201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGd9YvI4LwBJVv9zibDy6yoqxfjO2LwjAuITLWDgM5A=;
        b=JBUtZaS05Xw0VmAt9cBW2T/L1yFEbxbsveCSvQB+ZEKKCUW+/fCJvUzuyz7WmqaZ6K
         29nhYQpVw+8kHxSZmXCPmq7+NCD63y5X1TIHRqXNxBqnBkmdSEiy4v9BtJpNbzxKoiNN
         uyQqgfBCZ8dYFwfSvSEm0IA6xph+3ko8FzIf5irHE8QMc0w/XhMgMq0s1E80kyNr0DrR
         wR2HkdlJT1GolVde5z5YGD7vkV5s7YIcTMiFBR5nHZ7QiSk9TlFSZNT8eNzUfdgeW94l
         SUsSnQdhjvZ1fFuJuULh9iGUvJWE6oc+p8ozxkCin8hYhCa2cY/kyRCaFLHmG0J1Yvop
         gQjg==
X-Forwarded-Encrypted: i=1; AJvYcCVS+uNRjHfDbdwTboBGl2i4eGz+WhlmFhLPDiv8Jc7BXa7aNhLeR8CiihpKcyRbxvaguxlWwwdce/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJ71trsvx8X2V/Ife4coIGgrcOZKk7kxffxh9twRpIanogU5s
	NZiq3PIf36ln7w7YcCNV2LTjYgYaFfmTtmjJrQgiNXO7c4iw8tP9lUs/I5XgbArGCgsvRn9HWyN
	7ZEtH+55firH1z/HUyiQ5FemKMFZnUDWgX2wrnGNp+OOg6dS4pPCnYUKf15TXDok=
X-Gm-Gg: ATEYQzyjPOOMLBrYUrmFWNiAF1zk5/f17i+WH4qFJ8n7fNOTadazKrBJcQGneiYUFr9
	mIZft6HEYdj9jASYXSBRlfdR+iyMvVrQO0edyM1VsBBQOk2RkuY+oWdYRftr4uydmLlIcNriHYZ
	MLy9qU8XOUVRQbJiVU0F6sC2YL4Vj6KQfeWLoRfrfe5tsny1JIujnMi49CbXCzsJL2ccDiinl0q
	i1nYFmDctNYyEQGVwsT/GKMJdRu1Feq4RhF1EuqmfSYlePgQGaZJ/Fe24dC77eWGrVXi+9aemVW
	5pswJf12hC6/2+/iwAqH5wb9INNlEPD480pWL5gc1q/eCgEut/tMpeyowvgabW3LAy6lYmH1YgW
	K9PLTFeWyQNv831Yb0T8trJ/+Ol+oxbVPz6aE31eHTu9BBxHNVvTRIpw3V3btOgbl8PwfZrrG1E
	MplJ4=
X-Received: by 2002:a05:620a:290e:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8cdb5b7617bmr1253201185a.7.1773658401365;
        Mon, 16 Mar 2026 03:53:21 -0700 (PDT)
X-Received: by 2002:a05:620a:290e:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8cdb5b7617bmr1253199485a.7.1773658400972;
        Mon, 16 Mar 2026 03:53:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cba6eb8sm550440366b.4.2026.03.16.03.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:53:20 -0700 (PDT)
Message-ID: <35ef65d9-6424-4a12-afc7-72bcbf557c42@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:53:18 +0100
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
X-Proofpoint-GUID: aWC3UBzUEPHBLz729blU4Oxbdks2Cesp
X-Proofpoint-ORIG-GUID: aWC3UBzUEPHBLz729blU4Oxbdks2Cesp
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7e122 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=THL3f9KbVJzrASAZR2kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX56yOCfZsCalk
 Hzxw1w6NcoDWpjc/YAwxZ9n296MpPJg9yxiHQzY56GjOrwtYkghmQcaSr3vrQMQm4UyaOeAZNca
 IZ5fMLtwbFf7gogLWl4ZGolcd2QLXnCWYFVzAHJgZCiAh6IuHGGPlcf1icmJHh42OND6RYq/A1v
 VCqaLmYS9bc4gLYSAczaw5s1vf8VXMeZlltSk62NVRbfpV1mOSZev2yAp2zyPBlIm3jSRF4RQpO
 37aMt4dh8f0E0WzL4NMSYP0CnkJsE6aZ/2htxc+Hb+rhH5nS8ytCz/3+HXGIWJGCa84NRzASqvR
 f2Ji9hwhj+W1/7Y+NcVcrAbNBI0yjJZmBy76FqQn92TzG/6Um5iJuCYK2xmFY2I/NpudKDgRBcR
 gYDxYJPWIC1eHEp0PtotKa8T6vE7nx5ATIPWpFaKdcb4WbgopZZ7/5E2jF1bOlZ2mUlPnmn8y1o
 hFxdzclV+7ZDKIxrEww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082
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
	TAGGED_FROM(0.00)[bounces-34858-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: CB0DD29855E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 4:55 PM, Mostafa Saleh wrote:
> When trying to unbind a device in order to bind to it vfio-platform as:
> 
>   echo bc0000.geniqup  > /sys/bus/platform/devices/bc0000.geniqup/driver/unbind
> 
> I get the following Oops:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

