Return-Path: <linux-usb+bounces-28673-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79079B9F159
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 14:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 350A53AAE08
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 12:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850852FCC0F;
	Thu, 25 Sep 2025 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVhNeyWU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8F12F5320
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802075; cv=none; b=ChGKFkrGS5a1+kTadO44lPHQFfox41iSq5gty4S0ajm03vtJob7izdFWssIedEbnhpwOIBd/bkbu6wED0u44Kn8ySRn173mnskecHgShvacS8dFNw391k3rKFpJi3Zs4izmNX1wd7iVyHobBGWy3jO7XpWiY/4d8BdToDg0qTuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802075; c=relaxed/simple;
	bh=gDa8eibeTR7pD9qAnsrm2yPwQpm8Mans4IJPZGjSg7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gU6LeD28/S8L8h7ASwDjoVqReKaIz1eUiMGKHxw7cuatIikIgo1O6SuTd6m2790MPGb5vkeKYPfb+Qn13VxVD0dVXKbeVkkAqRAfeBxXUZ2LiOTapPKkRCvbVZshm4+IqP+9tSQHpESZ7Q4tZknegWWO0sphAb6Es4CcgaI7V/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVhNeyWU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9UgUf025591
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 12:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	weJXdfLjyQOO+L4dDrsKUb0fFZpTyYgiDzGUPHQ1E7E=; b=MVhNeyWU53c1/Vab
	+ZEeaIyP1GMeNzcIEME/uOAOKSwudXZCFrgmhyzviUteAmPXI5L7afpJWJ+zhUbn
	QTxQ+JHVbzj/hIETS2UrEDV2tPxbkQxOUblFrdaVAlTZ8Adb3OnxXsWFHHmO8sGj
	O/mHigFvPV54NDBmOR0Zl9IwFcLtcaXAbbJT77++itdHkT0bT4Nu0YFlyAlBeLjg
	pM4Mrgi7BCGH/hUft4iWeH6l86Y/ysvuTw9E1aCT5klEZAIlD9W6LyRQ0fkCHCXP
	O+TojUIJyVm706PfK8C3Ys7j3Y9C9yxAvM/fwgPeXWEyRS0i5Kjpgf5V00pThYDh
	Vokdxw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyf0auw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 12:07:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d880ce17bbso1713971cf.0
        for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 05:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802071; x=1759406871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=weJXdfLjyQOO+L4dDrsKUb0fFZpTyYgiDzGUPHQ1E7E=;
        b=t+hojjUQl1XiHCzkzjV1NEePXQSu6l9VqbUmoULZbHkuQ5hZcMuDK4H5rtTIRCo0CK
         YtPaFaYSOgKrVxT5Q8BGd1L0ZuWMH7WgSl5ICpXWPElarzEK9uq1j1OfS/Fu4EiHq7fq
         HhZiHbBsuKw0v4GTMjCuMuteEczo1Q78mnKmzXJHZhlfHlYOB5ohcDq9KxFvtcX/uXTT
         mS2QZjqSm3ezd0m4DIJDviiLxwwt/pXl3OaCD/r6no9lJKt+j5j2Quxd24edXtjkYnw5
         z05y6R7OQLXZH7L6wf2/DmVOvLaHhw3Stc3tEfhjBGC/HocIN4W4bD1lgE9OJqnU2HFc
         Ucog==
X-Forwarded-Encrypted: i=1; AJvYcCW/3AlBqaiJwDoxzyjVqeKjyDi9xQ2DfkSDxoYFMqDzpGqk5bcM/ldvno5O9xBi3UlGvoJvfDjuL4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDLj2CQYah8sWaurENA2NauIpbFu/ejdgNIBXY7aSZvfkrky+3
	p0g3vFATgPC2efEF0gPUmGMDDCdARTIwDzuqA2mdyToiGMAixu0imoXryIdHAj6Lj0DJETbkkN8
	U7dWbcjA+nTsOr8u9eLStngRE5hyopVGKBcceGOHKYopSiB1Xg1ZY0ObrdJpTtDs=
X-Gm-Gg: ASbGnctCrjizpAOg7JuK+Tt+AWx7tbEycNQ6xa6xmxEcXTq92szKRDobnq55L8mtUxq
	cutYhy/YwT5Fqhn4DuR6CXnMPHwa3xn1HGVICLHQT57sGmUgK2lDDIixD4T8+6KCTuvCjezBdd4
	5As9LOAhiLFt5b9TSDPplfLFD9YijXnX4/kiJvJyaGRYNH6NvrObDhMuc/nvbIa2gU/5uOZoKXi
	Fq75AmsmFlWqdBj6yy6BpOJQBWGxtjsMXMKExifSeLErgUXf+tn7H0xdhUKHOpuZyl6zTT2ytte
	SyStwuFGahcIG+kWAR7nAWBqcaIP7viVuwoz2yaKhNmFXFA/cwEpFLNlrscxEAPtc/im7AlFZjn
	WhpDxLZzeTSkYLa5uX5EbaA==
X-Received: by 2002:a05:622a:11d1:b0:4cd:3f47:9786 with SMTP id d75a77b69052e-4da4924fb20mr26435521cf.7.1758802071093;
        Thu, 25 Sep 2025 05:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/x3fu4OCkYicD8u3aPyJRoZkA+aM3Y3MPrBYWZinB0wQz9Ef6J8V+YzHMOdkXzgoavSWDRQ==
X-Received: by 2002:a05:622a:11d1:b0:4cd:3f47:9786 with SMTP id d75a77b69052e-4da4924fb20mr26435031cf.7.1758802070376;
        Thu, 25 Sep 2025 05:07:50 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efb8903sm154374366b.33.2025.09.25.05.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:07:49 -0700 (PDT)
Message-ID: <df671650-a5af-4453-a11d-e8e2a32bd1ab@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:07:47 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] usb: typec: ucsi_glink: Increase buffer size to
 support UCSI v2
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com>
 <20250924232631.644234-3-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924232631.644234-3-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L3fhzi4PQLhxQRDu9ERI54KMeObQYdp-
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d53098 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=IeecORiGvqfwQRmb6Z8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXxC5mbpdr6eda
 zYznUBFG50IITl6B6tmVu0EjETgIXtNO7JfcBWJBX6A9ruRLmke6FdYR+t8kfOZXvlLE5gXLccu
 lzmYSGxe0a2F+ykhrgjWWKlKpPpr/jKWgEXlV3w/t+6v+QAmc3eTQu41x9KgfUIHenLN/2Kc7Yp
 S1IymUxQWxGKcSm0/b2mbym7FCiAxWrNK6v6FhjuXZ/EDxMgcUBCd+F5lc0rzy85ho3/ZUTyLWk
 U6X01jKcWFUVrkENXWOQj8mEKnAbkrjGjJoYlHFscTARvTpKYUS5ND/peH9esiuWHS0phcXzf7Y
 944WBgh/lu/azmU6llrYi53PvU3n5ysaKlRd4JiT/pFLnE9Fo+EoLYJFEKzRZbCnvzO7KOBxQBy
 E2qyNzcZ
X-Proofpoint-ORIG-GUID: L3fhzi4PQLhxQRDu9ERI54KMeObQYdp-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On 9/25/25 1:26 AM, Anjelique Melendez wrote:
> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
> This makes the total buffer size increase from 48 bytes to 528 bytes.
> Update the buffer size to support this increase.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---

[...]

>  static int pmic_glink_ucsi_read(struct ucsi *__ucsi, unsigned int offset,
> @@ -131,18 +143,34 @@ static int pmic_glink_ucsi_read_message_in(struct ucsi *ucsi, void *val, size_t
>  static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned int offset,
>  					const void *val, size_t val_len)
>  {
> -	struct ucsi_write_buf_req_msg req = {};
> -	unsigned long left;
> +	struct ucsi_v2_write_buf_req_msg req = {};
> +	unsigned long left, max_buf_len;
> +	size_t req_len;
>  	int ret;
>  
> +	memset(&req, 0, sizeof(req));

= {} already zero-initializes the struct


>  	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
>  	req.hdr.type = MSG_TYPE_REQ_RESP;
>  	req.hdr.opcode = UC_UCSI_WRITE_BUF_REQ;
> +
> +	if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
> +		req_len = sizeof(struct ucsi_v2_write_buf_req_msg);
> +		max_buf_len = UCSI_BUF_V2_SIZE;
> +	} else if (ucsi->ucsi->version) {
> +		req_len = sizeof(struct ucsi_v1_write_buf_req_msg);
> +		max_buf_len = UCSI_BUF_V1_SIZE;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	if (offset + val_len > max_buf_len)
> +		return -EINVAL;
> +
>  	memcpy(&req.buf[offset], val, val_len);
>  
>  	reinit_completion(&ucsi->write_ack);
>  
> -	ret = pmic_glink_send(ucsi->client, &req, sizeof(req));
> +	ret = pmic_glink_send(ucsi->client, &req, req_len);

This code keeps the 'reserved' field zeored out for v1, but it does so 
in a fragile and implicit way :/

>  	if (ret < 0) {
>  		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
>  		return ret;
> @@ -216,12 +244,39 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
>  
>  static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
>  {
> -	const struct ucsi_read_buf_resp_msg *resp = data;
> +	u8 *buf = ((struct ucsi_v2_read_buf_resp_msg *)data)->buf;
> +	u32 ret_code, max_len;
> +	u32 buf_len = 0;
> +
> +	if (ucsi->ucsi->version) {
> +		if (ucsi->ucsi->version >= UCSI_VERSION_2_0)
> +			buf_len = UCSI_BUF_V2_SIZE;
> +		else
> +			buf_len = UCSI_BUF_V1_SIZE;
> +	} else if (!ucsi->ucsi_registered) {
> +		/*
> +		 * If UCSI version is not known yet because device is not registered,
> +		 * choose buffer size which best fits incoming data
> +		 */
> +		if (len > sizeof(struct pmic_glink_hdr) + UCSI_BUF_V2_SIZE)
> +			buf_len = UCSI_BUF_V2_SIZE;
> +		else
> +			buf_len = UCSI_BUF_V1_SIZE;
> +	}
>  
> -	if (resp->ret_code)
> +	max_len = sizeof(struct pmic_glink_hdr) + buf_len + sizeof(u32);
> +
> +	if (len > max_len)
> +		return;
> +
> +	if (buf_len > len - sizeof(struct pmic_glink_hdr) - sizeof(u32))
> +		buf_len = len - sizeof(struct pmic_glink_hdr) - sizeof(u32);

Is this expected to happen?

Konrad

> +
> +	memcpy(&ret_code, buf + buf_len, sizeof(u32));
> +	if (ret_code)
>  		return;
>  
> -	memcpy(ucsi->read_buf, resp->buf, UCSI_BUF_SIZE);
> +	memcpy(ucsi->read_buf, buf, buf_len);
>  	complete(&ucsi->read_ack);
>  }
>  

