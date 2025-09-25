Return-Path: <linux-usb+bounces-28683-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7A7BA1AEC
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 23:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C8527BD65D
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 21:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C00322775;
	Thu, 25 Sep 2025 21:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8S0NUKZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB2F27FB26
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 21:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758836640; cv=none; b=HuS6XShN/V5K+78Z4hFQQMrDdZHGzzFKdU4bE1vpZhXJuvncZWV3E7pw2IyHITKfD2hvK1ZIDobkuwe+kUtlO7bzFZ1x8481+m2bmOBkV+PZXnlx3lULZXpAAWZYezadMZXy7Y+RTSZgf48AgWwhGkvd7ZBtToMPCFQGwPtJicA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758836640; c=relaxed/simple;
	bh=k4GsBLIueNm1p2m6nOEdppg4lCcwt5Wac66Va2aS7RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHovOYiI/2iDAvdP8vRdiFTu/jIcB6VFoO8MhGuFwSjr17SSr9uTacejBoEWyAf7XvN5qP2mE52beN+DkI6fAPoR+x+b1cBfXy1PN/5Pydljv3D9yJRty9bcYvVD5ByCcdC3ZoPIYmnmJG80pvZNfTP25w9HZc3s/0k7kt/+GZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8S0NUKZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPvpt021818
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 21:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yfBWrlDRkP9t2hl5/olMt1ZH
	Hf9C2kMP7k9geBdbKGU=; b=X8S0NUKZJKUEFFgvSCjObCXKZKIFq0fBXj2KQhQc
	49/zZCuL/+ODRzjv68MpfQv1Wv9ApVl8u3YKeQGFFEuGXvkn0Ei45XaoURfUC6Sj
	jA1+1p0WKhGjYZ6RIYO7pIiFP6QUgcm0Do8UgKnyiE7SRRhB6Km8WP/u1y0kz+p1
	rRKPum1vldnE8yL+Ep87+XogyPloAywyvZHPAxJ4bAbx9t5Nn8BQ+8VRRhni2aPP
	vNXXFZvfdWjfqZat/j1JO49r89olF6Hxm3waCczyu3lvVz5GJ4lrmAlNtlZ7/i7t
	R6LHEzDEoZ0AYrkjwVzRxrmURd4Rdo6UUG+bZEUoRY5zwg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qrfwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 21:43:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5d58d226cso36765571cf.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 14:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758836637; x=1759441437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfBWrlDRkP9t2hl5/olMt1ZHHf9C2kMP7k9geBdbKGU=;
        b=DkQq26vGMPZS0EYAf4PK16XwS/pmnprCDu+EdAAWgiCNorckmQ8+ch7kKyzEsmZsio
         Cxf2ypjLpxuvhnrRNap8LBj1Na0kD716f3FD2n409tIyol9kSpRtudAnrwI7Che7ibNZ
         hhtxcS/61+khcENva0S4xEeeZvpO2dcR+voZaBSQ0qsN6oK+naLxB70c/cho1+Fnh+bA
         ltFX0DgN3LPzzgDSKaJ8vXcI68ciY7r57mycN/FkGUmxiwGefeCNJulXffrjoUb/Dfig
         7zLmFG1UMJr64vdUasQiFHNLL0AKtAuW7bkrgx8TmdRhlHQY//DbarY08oQYT7g3qgox
         UthQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU4SNdqbs9XxHE0ZULG+Ybh34UpsRPP5uGO2i+UC3YbN9h069aF530A5ZuXpdLvbQEForX29y4rME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3M66WxYNG89rO4tfxTbdBvl75qVLRpAR5aaJjX3RFFiKvs79M
	qhpNduTghsw565IBN+nMnO9o19biX5KoSx6zExvnLd45E2TfPLvDGJK33ccDk03MBgAWUtbrAvU
	f03yrqAOYiUdZIqDzzBgz6SERU5lCnpyIIH+LiFtgrp8kYNtO9vVGWtSwXJIfs0c=
X-Gm-Gg: ASbGncuh+zecQLJNwEeP5QShPq19GrmBDIw5/Qu6N8yHXQ67IyDy946s21Pst2SQ9eX
	ON92tyZE5hneAiQUBaQpSZtiS3Vmqdr4zEOdq5byFGjLeMX90gAajgSGDRfzsG+YUVjsoD0iKdU
	Jd7Run6kmDg2G9ZB7Kl/k9H+1yiUV3HL+fyAh4K4ypGLLMxs08w9KDUjzsJrhv9teSmhaB9UkVA
	jKQiTJI75qvyVHD6001gRuT4rh6ZZxSjdiIKhZ9ql5yIu8wNJZOEt4mxZ/hriiNxvpIEjSdFkm5
	DPRbXgbZduQ4Le/Hhbv6gRceUmO4rJoOySDOf5VsF2ba4kMhBKT3USGy+9U3uGQaNdoqhPBxYXp
	2BAd8BBhxyjCadB/Fk3aCFzgstQW5R0cglZEqP54ymatupbhdGOYT
X-Received: by 2002:a05:622a:4013:b0:4b4:9522:67a with SMTP id d75a77b69052e-4da48b8c9e7mr67878961cf.33.1758836636898;
        Thu, 25 Sep 2025 14:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5Ks4ZFu9wxVK2/DfMG5pfEbTJRI9Il6saFQFftRQK8PqfKWLcYEXz1KrDO0TEPuOD6/iiQw==
X-Received: by 2002:a05:622a:4013:b0:4b4:9522:67a with SMTP id d75a77b69052e-4da48b8c9e7mr67878521cf.33.1758836636311;
        Thu, 25 Sep 2025 14:43:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4e38b04sm8176191fa.15.2025.09.25.14.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:43:54 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:43:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/2] usb: typec: ucsi_glink: Increase buffer size to
 support UCSI v2
Message-ID: <t3hfr33t76ckecatro5gheycb2phnch57m6zzdpm44ibykbubd@e6nffasyetib>
References: <20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com>
 <20250924232631.644234-3-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924232631.644234-3-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-GUID: 6_UgHCUbs1MBdsUBKKtS2AmZv6iOtxUO
X-Proofpoint-ORIG-GUID: 6_UgHCUbs1MBdsUBKKtS2AmZv6iOtxUO
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d5b79e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9NeV5C6gA5lNjDPYUkgA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX0Mv4aYwcFiRg
 Mim4m7fQ0CUGdtMXOpG1FvN1tL01TNTBNS0a9h7EPSWAWkx7i03p834eZ090cZpcX5yQDgGreYL
 knvrTYfVWLCw8Ywo6XIPujuL0KTsWoucxK+A7JWij1r0bxOzy88Jm/6eyzdSDESWb11qfeTj3IK
 KErYXKxNtn2/zlIS0Ly3MOvS7VGR7vtWXNEb0x4E05TaRr5kep+yJxp9nNICx0tFDFmLXhqfylz
 PcHn1TwRnQakma2yPJz4iQ3SrwaByc7eLM5l9iDq87Q7Q5poAz1hSqmRtYwwR7dkOpFP4eH6mpa
 dMhm4DZlrf3xfNiksYEiuGA5gx9fFMk2ypMUVDym0sy9wmqMAohHosf38hHFi3e81yPGPgOF9zU
 G9IIZxLD6hALhViJKIi21CCKhoftMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Wed, Sep 24, 2025 at 04:26:31PM -0700, Anjelique Melendez wrote:
> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
> This makes the total buffer size increase from 48 bytes to 528 bytes.
> Update the buffer size to support this increase.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 81 ++++++++++++++++++++++++-----
>  1 file changed, 68 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 1f9f0d942c1a..7f19b4d23fed 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -16,10 +16,10 @@
>  
>  #define PMIC_GLINK_MAX_PORTS		3
>  
> -#define UCSI_BUF_SIZE                   48
> +#define UCSI_BUF_V1_SIZE		(UCSI_MESSAGE_OUT + (UCSI_MESSAGE_OUT - UCSI_MESSAGE_IN))
> +#define UCSI_BUF_V2_SIZE		(UCSIv2_MESSAGE_OUT + (UCSIv2_MESSAGE_OUT - UCSI_MESSAGE_IN))
>  
>  #define MSG_TYPE_REQ_RESP               1
> -#define UCSI_BUF_SIZE                   48
>  
>  #define UC_NOTIFY_RECEIVER_UCSI         0x0
>  #define UC_UCSI_READ_BUF_REQ            0x11
> @@ -30,15 +30,27 @@ struct ucsi_read_buf_req_msg {
>  	struct pmic_glink_hdr   hdr;
>  };
>  
> -struct __packed ucsi_read_buf_resp_msg {
> +struct __packed ucsi_v1_read_buf_resp_msg {
>  	struct pmic_glink_hdr   hdr;
> -	u8                      buf[UCSI_BUF_SIZE];
> +	u8                      buf[UCSI_BUF_V1_SIZE];
>  	u32                     ret_code;
>  };
>  
> -struct __packed ucsi_write_buf_req_msg {
> +struct __packed ucsi_v2_read_buf_resp_msg {
>  	struct pmic_glink_hdr   hdr;
> -	u8                      buf[UCSI_BUF_SIZE];
> +	u8                      buf[UCSI_BUF_V2_SIZE];
> +	u32                     ret_code;
> +};
> +
> +struct __packed ucsi_v1_write_buf_req_msg {
> +	struct pmic_glink_hdr   hdr;
> +	u8                      buf[UCSI_BUF_V1_SIZE];
> +	u32                     reserved;
> +};
> +
> +struct __packed ucsi_v2_write_buf_req_msg {
> +	struct pmic_glink_hdr   hdr;
> +	u8                      buf[UCSI_BUF_V2_SIZE];
>  	u32                     reserved;
>  };
>  
> @@ -72,7 +84,7 @@ struct pmic_glink_ucsi {
>  	bool ucsi_registered;
>  	bool pd_running;
>  
> -	u8 read_buf[UCSI_BUF_SIZE];
> +	u8 read_buf[UCSI_BUF_V2_SIZE];
>  };
>  
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
>  	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
>  	req.hdr.type = MSG_TYPE_REQ_RESP;
>  	req.hdr.opcode = UC_UCSI_WRITE_BUF_REQ;
> +
> +	if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
> +		req_len = sizeof(struct ucsi_v2_write_buf_req_msg);
> +		max_buf_len = UCSI_BUF_V2_SIZE;

I'd prefer it to be more explicit. Define an union of v1 and v2, fill
common parts and version-specific parts separately.

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

Comment?

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
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

