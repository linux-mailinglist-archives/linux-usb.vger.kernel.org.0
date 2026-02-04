Return-Path: <linux-usb+bounces-33070-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNezG2LIgmmzbAMAu9opvQ
	(envelope-from <linux-usb+bounces-33070-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 05:17:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4765E1850
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 05:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3098C30ACAF1
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 04:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D5B337111;
	Wed,  4 Feb 2026 04:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lzfb4qZW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADXV1aLn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1793346BE
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 04:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770178647; cv=none; b=Tb9r1UnY06XoerT+JRYgb6is4rKy3OVWwVq/f5txCnSs56A++K92ULXOV2qstJaHm3Zr46Tay3/kckHOCR6GwwtWXy2Um7F8nCo8mTLYowrfWY+5+1SmXx7eJeby0/EEjAS28wRaXFx/HdIu4zLjsy5cESfOrDwfEC1Pf0uj2r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770178647; c=relaxed/simple;
	bh=YlZzlX0rc5xbEm+iBlZ/yeYYdH6Sf61IUqYMkk1u9cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=itjFSu26m+T5234g3XTqu80PnwMJnFOTmrPxyC4MPQHY3b9zwATbuFG6Qho3R4RMUz+zphYUY19sfoNtXw8eIeule5KLE38H4JtiKnhmjkCi0Hx6tkjmHdydrH1fHxuvKspJcbLj5RFwf9PFFoxjOHK8nvqSEFRybYTik2i2FKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lzfb4qZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADXV1aLn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613ImOpf3824292
	for <linux-usb@vger.kernel.org>; Wed, 4 Feb 2026 04:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TX+YgC2mrCIEU/1RHOqvZa/FzaP0cWDEpzd7IkPjJeA=; b=Lzfb4qZWBXJKRSeq
	04vgp1GXLJce96niOR27I/lKbiL6lJQSh0T/3eK6eQNpDIMlveEaq+crdLVZ3QWz
	SP0bd0B3OZZ7k9yn0dApEkg1BA4K4Z86fHgW6qU4xBbWQHju4/YUHwQ9QbpuUWn2
	iJgQz2tztVqo3PI2zkzx7BqjjlYArqYCUfQLA9zkJyCi8GctQ7wnEFPOx14viWZH
	QmR7UHcKsIfgfWyYQZ40YuKc/t9Z9VpL7w2LI79lbyQiy6WdtylLdAjWOdjRE+RM
	l1dZIUt2AG8E1x8LEV+SpeqNE44JgRVaF5kVXLnDF8j0/0IIq/B80MYiafLNCvDO
	pb5HAQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3g33k0vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Feb 2026 04:17:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f29ae883bso2737065ad.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Feb 2026 20:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770178641; x=1770783441; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TX+YgC2mrCIEU/1RHOqvZa/FzaP0cWDEpzd7IkPjJeA=;
        b=ADXV1aLnbRGJOZ4SXyPWuo2kr57HOpEPicxGAoBhqdHa1IOUvjJv9Z6XTPq8XA7/if
         ffUX7SXDjLghvtKf1L+f8peWWAuZe+FawC4UoVUAGjM5aMYYgAjHgSkGcQ+EP5eSWbrX
         v4EZiyU6nhXA4xewqGLLVi4qbhHfHTcSHcSffvgGTI09ZoD2ozxYSRGD7WzR6/3o4L4v
         E+VDXS+OikabjrCx7jzvD18M2OWz7afu4l+bPuVcSeFhPNb16HUYZmTMK1bkXPVH1odx
         XoG+4A7seMIQNAABLWDq0G+ry+0gOAVfQFQ2VFqEd9qDi5+LRdLOdopZZA64bH0m56kh
         GTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770178641; x=1770783441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TX+YgC2mrCIEU/1RHOqvZa/FzaP0cWDEpzd7IkPjJeA=;
        b=FjH/iPYFlrx1oGSwmPWhR3FHdKohq/rgKMbYXfzogAEadDRbmU/d0/ztHja1B9IGvV
         kKQNdCkSfBu1BOV7FFnUUe317GY3BERnPWVJr45MXPl7Pf253jm5qsvrzHz0rkzRGcDT
         GJyltFuQwVkLVKMS+vksCgtCKsQN4E6AJBfDNRpaj/4jma2ct+UlitwWplS04krRmij5
         9svAIOPtIaTf96HIz8I74cl+uWUvfU+BDGwpsrnvBE28JXwRyC9cBHX0pDHTD3gyZzjq
         T2dZe0vrS64Ir814vzDQHv2GfihEGMH/SZcvV/AK6YlauMwV33/KE6aocl7cnP/3Rlwz
         CJmA==
X-Forwarded-Encrypted: i=1; AJvYcCWrRC//yjlFHYkEGZpTsbSDLLvWHpuV6Qt5UnIj42bKZ6hdZ5xezAiQkhZB6YJYyq+PXP5fLegjxDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPZTQumqYB+B+zWuuB5qjQiohVZ+BXRvBTfMlqRNEPKDBd77q7
	56fnV1o2rT5+x726oR3beT5cP7Gm5zWzAL2lFiv2NM0DLq4ozlxbnQ5Q6/BYCV73IVTOwW+7N7A
	yDkyC7pe7dO1tLSYJ3pud+RsbW8i4pYjxQQrMKmQ/fskQ8uL418KkOfY5+zv2pXg=
X-Gm-Gg: AZuq6aI6B4pS6+OAWxiZGs1S3mEP+dXProlTthXGyxSEoFtGTGcEMAgP3h+UxuLjClT
	63Y4dn4DDbagFr7Pbly/vAYsWnbOvRY71tiFSwtcxSjDKou1jWQ+dLrMiZ+J61aOJ2ph8T8P5FN
	sGxPpFcWEovlDPlxk4ldB6LLRKxqhWR8f4Ju4BaFdJhjJvbK7bBtDC/7KhVIbRu4crqFJ4t3Kux
	frLHxBJ8A6Fr1gOErbgoi7peY5qdb3R9UU2HGt1tXU0SzQ7rwTk7EGb6VFFxYbsQZgMn5yO5ogR
	zMc/phDpwxSi4p9AUIOtZ/SacgjbBpMGLLimj9ZCW9VfBs1QJQ4MTP0MuO47qYSZsT5VCK9U93P
	LraV9cb+KQ3II1p9/yICpboTpy0+Ux2kgU67LOw==
X-Received: by 2002:a17:902:c411:b0:2a8:ac0f:9ae4 with SMTP id d9443c01a7336-2a933fb5b7amr15894455ad.48.1770178641240;
        Tue, 03 Feb 2026 20:17:21 -0800 (PST)
X-Received: by 2002:a17:902:c411:b0:2a8:ac0f:9ae4 with SMTP id d9443c01a7336-2a933fb5b7amr15894295ad.48.1770178640788;
        Tue, 03 Feb 2026 20:17:20 -0800 (PST)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93394e5d4sm8837575ad.56.2026.02.03.20.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 20:17:20 -0800 (PST)
Message-ID: <e94b8434-09ff-4ea0-a762-0869345aab4e@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 09:47:16 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: gadget: Move vbus draw to workqueue context
To: Kyle Tso <kyletso@google.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260129111403.3081730-1-prashanth.k@oss.qualcomm.com>
 <CAGZ6i=3ZJ3aihjmXnPq9C-mpVYa6rqzfWTn3qXmavYUiZtE24A@mail.gmail.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <CAGZ6i=3ZJ3aihjmXnPq9C-mpVYa6rqzfWTn3qXmavYUiZtE24A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=6982c852 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8
 a=QySTlIg7yQLGu7ZqArQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 9eHnVCKOwzXpkzpbArzATUR7TE1lLXBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAyNyBTYWx0ZWRfX/SiYJznmLEuI
 uOo3ME80lJq6mZO8GQfmXodffrUesCPIrvD4HIFITQt6NojzwQWVU3B6yaAuoikMqXy2vRIvu/q
 wUJh6w0HTULKWTy0CjLSvK7UPbqp4rbOdgyldG/RHU0q9gfcz+EdZy5cWSdTvVnvAADx+JF9uW5
 UMJJd+PvqeHMOUhx0FNHXYlSe6geJZ6WiTEC/pzw/BJzcYqu14y75lEVrqJhahom9Lnsx6JhbZJ
 ZhpB3LKKtHg28M4DEO4xtQCgrQJ2E/X4cO84JjIKQTulaDxlJWkZmCJqk2WRINg/iemb8zNFwz5
 Odbw9U8JFU5Dm8it/Ly9RJugCaDgUXrgZbz/eU/RqtlP9brGyLeoHUPdPtK/LXjkied/1XyqP4c
 velCJ4jBkzmYM7NmvQMpXq6iqTh0v+tKme5leZkoQBu7zHegW6hNclQpIFaFvbnde6EywMMMrJY
 pmGClq5RE9ohc08jeiQ==
X-Proofpoint-GUID: 9eHnVCKOwzXpkzpbArzATUR7TE1lLXBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040027
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-33070-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prashanth.k@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4765E1850
X-Rspamd-Action: no action



On 2/4/2026 9:29 AM, Kyle Tso wrote:
> On Thu, Jan 29, 2026 at 7:16 PM Prashanth K
> <prashanth.k@oss.qualcomm.com> wrote:
>>
>> Currently dwc3_gadget_vbus_draw() can be called from atomic
>> context, which in turn invokes power-supply-core APIs. And
>> some these PMIC APIs have operations that may sleep, leading
>> to kernel panic.
>>
>> Fix this by moving the vbus_draw into a workqueue context.
>>
>> Fixes: 66e0ea341a2a ("usb: dwc3: core: Defer the probe until USB power supply ready")
> 
> I think the following patch is the one to fix:
> 
> https://lore.kernel.org/all/20210222115149.3606776-3-raychi@google.com/
> 

Yes agreed, i added 66e0ea341a2a because it can be backported without
conflicts only till 66e0ea341a2a, but I'll change it to the correct one.

Thanks for confirming,
Prashanth K


