Return-Path: <linux-usb+bounces-32970-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKn8Gqcrf2mhlAIAu9opvQ
	(envelope-from <linux-usb+bounces-32970-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 11:32:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E1BC5734
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 11:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F93F301386C
	for <lists+linux-usb@lfdr.de>; Sun,  1 Feb 2026 10:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB3A2EB866;
	Sun,  1 Feb 2026 10:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5T7X1Ko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1vMIj2q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430D81A254E
	for <linux-usb@vger.kernel.org>; Sun,  1 Feb 2026 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769941920; cv=none; b=aBP/Oq0vOs4xaKOP/KlgA++J6axd2qJkw9YMw7BRie2dht6ZUaeEeHCymzzAhwrNkuoH4+qNyKnQeNd3NTSu2jIqnB1OLPWg9MoBehn1Ps7VYqHCb1iwewRNzGY/TMoxiNFFbTFd8s+BxUKclwgUiP1P8oYHhnzzPO7lK9bLqOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769941920; c=relaxed/simple;
	bh=OG5gIS46sIyGMjU+bv1FltfH7xKero3LdEFhVeDMXq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/aSNBe676QHxfGvafWxHmm/E84tF0tDSWhQQ3G1srf/AkjGENuSHgEk/Xgm+oQchcdRJTbjHGll2iterp0m5poNnc125jd7ZzVi8ucRbjs2JAuUB0dzTuRnGeMoiaPX40b9sJWIbd/Yu7R9ADi7JvM3jI2A9v9gtn5H5slpeYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5T7X1Ko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1vMIj2q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6117SRKo3576604
	for <linux-usb@vger.kernel.org>; Sun, 1 Feb 2026 10:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u+Mu8/GpwHsYaHmqjpyJSlKY8TLV1nUPDNtzWyRhGvM=; b=N5T7X1KoWES70o0D
	uBAm1upq0keTpef+1D//xJXbqEcSLMxusEMDfAVmktW06WLtn3XEntuQ4m2QC7uw
	3vABgaoZIyoS3eZLNCIdX92W1mSvraY0EDOglKH/nCJakOmbukklbykmDVjvZ/P3
	qmtU+tE7iCl2YrBYcv5y+fHo1wvmcvQICu+sNr18JLzfm0t3EEocvjktwwbA3vym
	IMW5X+uJdixjRvG7oNIWeA49Ejzxdr++A6dF7W8+EuEeon9i4pIuvtZnf8ZjU+/1
	bkuVr6uwmOdE9MNEGAxapUvMF3TkL8UGx1td3rSS6SNlMz/E8QO2LnZoE+zoQ/4q
	yyl9kQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awntdm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 01 Feb 2026 10:31:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so6446466eec.0
        for <linux-usb@vger.kernel.org>; Sun, 01 Feb 2026 02:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769941917; x=1770546717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u+Mu8/GpwHsYaHmqjpyJSlKY8TLV1nUPDNtzWyRhGvM=;
        b=h1vMIj2qTGM5y3MnJ2sEAUOY7CFlitDRC3fwR77IcOfP6+Ijdz3G2C5Q/N/Ka1Gh0W
         JMajdtKlV5eVAXXMaUw13lvx0j9DT6et+KFVJhp+8LMH36bvnAT9Awnj2AKf00psovpt
         Ev86PdYHKC2V4ku3yc54nsHvl90J+CnbcrGM59rP04j3vMECYdpyFUvZyEmLd2VWOhqq
         W/zYt0x+JxPMWicbW0FwbmTFQueHGax6Bwfcmj48WxxFTk7GGmarj7r7V0pY4Arwe92B
         4SOJX9H3QMOX8sJ3td46hVmc/dBEoDhiYnJhiJekdw6RyKgaAu01NHaO6uBBmtDdwK4q
         tiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769941917; x=1770546717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+Mu8/GpwHsYaHmqjpyJSlKY8TLV1nUPDNtzWyRhGvM=;
        b=s/LG1hv7FOe9jjBxilZ4TQBccFB31MIay3/OfYOUMd9QcYfUZyowgdx1iXdWN9FbpC
         TW1fjJpbCaUw8YnQz0uglvt0fTSyTeTz3HTyYQvXIwjWB2UIr0pZCKATypUsB7hLvq1C
         zNf3KYMZfUW/NhbfKrpjlxbXXtFwDLtvESdK+zkGjkkky2tnvIIH2M2XgIa9zMf5b13Z
         Y/qtjowoXnbqlU6eY1rfzvt0mHo3j8P6JBV8v5MMHS55IhWivfyPZNcQ6u9YMCsagjps
         a1xlwzdrTASaX8Y34PtlcGKQpYRNqjPYBlrIz6wG8/b57IK4AjQOY/b69djcMW7yDeVw
         1sNA==
X-Forwarded-Encrypted: i=1; AJvYcCVkubYpS2nzHOtAjukTt/3r9NZBBJeemkZMkc6SLu9//1h0zCTmKCwbxN+ukHQUGu13DM1juHekHr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZsOGmt7PTV8rceH+wOPY1c4K6EIQ1qwReVaT9hbwfpz99jCsM
	T8J31oVLChHe3AKdkQ7e27pkrzT2k7zMdAfM5hx252skHUF3bJ3+Wh9FXaTcMffYXNMOKe/2Na4
	Zwj4tX/EYalEYGDvt+qZsF/VeJZd4oGzDv/AF6YiUKtM3KdCA1aTTJ2jWdsTJ+Lo=
X-Gm-Gg: AZuq6aKZDx6lseLrVJ0wxvKuBvX3kikA8ROi3v8aMOwMMkQQmLs6+gg1YQl0r0rXOI0
	IlscBycTUQGtmp6wX0SiBaMg8fZURuiZro1OUqjDTNiCnivi063++FWGUb48l0W2ckGvEpYL2QK
	EXuijGTei82k57N5zewM0sOvzcZB/fWeRZJiUA2C/5p0wTi9T2PDc6h5/0iXqJYnE9qRNDD9n1G
	w+fQ8ODVOqb40zxQl55w4ehswYDWfIYpX8bGa6ud+hwYsyy/0VI4IanrcmsB1k/tQkPR9YUqRJp
	62JPPXe1WTRX+HpYpsopJqXb36PqIlB385UqOElhbj+zrMR1olGLvvK8DxQnHT9Fmp4nGIKYjCH
	PKOJFYt7y6JABFbGwsGrsrjnu93sOjtL0bfAYXrMdZNDYry8=
X-Received: by 2002:a05:7300:bc11:b0:2b7:12f8:5eea with SMTP id 5a478bee46e88-2b7c8632a40mr4510543eec.9.1769941917034;
        Sun, 01 Feb 2026 02:31:57 -0800 (PST)
X-Received: by 2002:a05:7300:bc11:b0:2b7:12f8:5eea with SMTP id 5a478bee46e88-2b7c8632a40mr4510525eec.9.1769941916449;
        Sun, 01 Feb 2026 02:31:56 -0800 (PST)
Received: from [192.168.0.119] ([175.101.107.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7eddf72e3sm3771126eec.28.2026.02.01.02.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 02:31:55 -0800 (PST)
Message-ID: <8ed37226-7f03-4d92-a43d-cd538944556a@oss.qualcomm.com>
Date: Sun, 1 Feb 2026 16:01:46 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] usb: gadget: Use sysfs_emit instead of sprintf
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Sam Day <me@samcday.com>,
        Christian Brauner <brauner@kernel.org>, Chen Ni <nichen@iscas.ac.cn>,
        Mateusz Guzik <mjguzik@gmail.com>, Liang Jie <liangjie@lixiang.com>,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>,
        Owen Gu <guhuinan@xiaomi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260131160111.3161630-1-krishna.kurapati@oss.qualcomm.com>
 <2026020129-given-grapple-d4ee@gregkh>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <2026020129-given-grapple-d4ee@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=697f2b9e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=BX0cTh2Ek7r2cvNT2UrZdg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=U_KVy2-mxjOgm-ctSf4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: cLdeexa95gJHPxtck0k3x1ekhYw0Hh1G
X-Proofpoint-ORIG-GUID: cLdeexa95gJHPxtck0k3x1ekhYw0Hh1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDA5MCBTYWx0ZWRfX9ICuYHm+YZel
 bYK4eV58mj5ObfO9ofSAgJtLlHJxndNOzAkBx8/NvRWAyvKX9XEuC9TA5LSK6S5QgfaIp9Z7jX4
 DviA5GUOhhinLRqvPg+rkXeO/SautU5vcplKXDwIN8Gxpl6BzySNxOLlgKa6XjS7bewzGp7mDb4
 hle8vY+4wOxtD3CD1feQxVp8W/lsbO50DQ55/p4MgZUl6jED8uEkL6Or1pazvRqjXitdR07qphg
 PQdO3fYH6quV1E+8HnogxrGjSlR4Hc6iMyJuOxg50Hk7hpIShcVsZHTfDLNve/qaXJBuCJN6+Sc
 Ry+Ely2HpuOIpBwCYEh1JEjL/cjcVKzdGwh3O/IqDreiJtTn39rqhOxkwcmWAcHJO+ZCr0J8i0x
 0XNnvfwIEgja0dmMW2qLik6ptem4Er4TAzltIpUMGUh8GwtJLLVnfV8Fl23g8CYOuTd+5V6Q4jq
 YCkLixezuAkv1t1hxeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602010090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[zeniv.linux.org.uk,samcday.com,kernel.org,iscas.ac.cn,gmail.com,lixiang.com,lauterbach.com,xiaomi.com,wanadoo.fr,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32970-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0E1BC5734
X-Rspamd-Action: no action



On 2/1/2026 12:58 PM, Greg Kroah-Hartman wrote:
> On Sat, Jan 31, 2026 at 09:31:09PM +0530, Krishna Kurapati wrote:
>> Use sysfs_emit() instead of sprintf() in configfs attribute show functions.
>> sysfs_emit() is the recommended API for sysfs output as it provides buffer
>> overflow protection and proper formatting.
> 
> But this isn't sysfs, as you say, it's configfs, so why switch?  If
> there is no need, the churn is not required.
> 

My bad. Its for configfs. I see sysfs_emit being used in configfs show 
functions in f_ncm/u_ether_configfs.h and hence tried to move to the 
same in f_fs and source sink.

Regards,
Krishna,

