Return-Path: <linux-usb+bounces-28726-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31619BA54AD
	for <lists+linux-usb@lfdr.de>; Sat, 27 Sep 2025 00:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58A721C02947
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 22:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3828298CC7;
	Fri, 26 Sep 2025 22:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIzTOVac"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7006D290DBB
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 22:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758924443; cv=none; b=d0gsGlnea4weLyI6IXHISr4WquGh8F/W0rd1sZ2y82cApk6Ldzj9CY2LGe6cKxcFSyYpBoqAdjOTAM6fHhJ1JlOmNm5q9Jo/cTstH+tvleVhvrKO28PTADGa95mQUpaB2m3r62Zot4Lu15y3oQg42N6UCK8wl9sWFPI6xVt/U10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758924443; c=relaxed/simple;
	bh=BV1ZxDHMWxY38fQkwL5M+vOanIM66s2UNwhIQ9cEvbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NU0+uJYMXwKXulC3fMQ2prF+IOvhGRGw+B5ww10d8VYQp2A/8MYqXIZ038CBV+QBhoAZqf+/w0ktijhA4gKx5t90aE0AoO8lxHHPARgX+cn8L0Dc7z1n2rUbHPy0LnIcMM3zL8ti4JK6ZpHZVDdgkhaNKVFiM6Neu2BNzb7t+LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIzTOVac; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWp2p016031
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 22:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lHtAHBnJANbRMtBfR2vxVJaV
	VRDR9+GfMMa3SXU9+WQ=; b=cIzTOVacqywUe94nbfMHFrTcCGghBqY+QdouA70B
	8JE55/BAUndTR85COcseST3y0UhmeG/BUmxYf2+En06Tq4n7xrdyUrWsywJ45qqM
	9w3JUJaUBIp9JWWN6uOod3aGGVWm+1AXOVG2msHITPJzr9qSv0Usak/6G0QaqJZC
	lbP8u+ZRQOQcS/zABwhZsMIIP7KIjkzU44J/AGUYZKJXss8Iy2IoEeYjhw+fyZ47
	QSWXGCPO4O1t0/d1f1BhUizsj+/DiKviS2Lfxkdb3sCQHaGVHdraEJmASQzk+FOp
	uTN/U54NHMN9QQFwssWS98wxuqjVLIwjTT2e646blJtcZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tv960-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 22:07:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de36c623f6so23578591cf.3
        for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 15:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758924439; x=1759529239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHtAHBnJANbRMtBfR2vxVJaVVRDR9+GfMMa3SXU9+WQ=;
        b=RYukLGxwxD4Vk+5ewvCZdIlK9AOXk1ujrMP4ZnJKRGE6GLHQGeoFpZ9JpQsINLwzt6
         SxQs9EdzPaTeJ9CujObqSd4FOBug79ffVWj4GQYFwRvHym+5PhUTpXfeylEGd93fmngB
         ghRhJ1svGPNSHloi8KyylOj4zPeHYQg+J8JRklfrlv8uhoqpFWJuIGtHY8ot6jF0SyMu
         V+XSku5ER+rzlHlLgdAXu8+/k40mtw4EPQUGrUrviAt8w0ntzz+RPGkNKrzFS1MgzdtX
         eayHmRdV5Tp7PjHZBoQOkrTVrI6DiOXxjSHxGljNtiirEBGBd84SYf/4Le9BwgD/kPiC
         93uA==
X-Forwarded-Encrypted: i=1; AJvYcCXYpONriXP+9ZxLGCuYrG47QydO7VmLH/MpzrDvkirxS+dQSxwM/AL3+7EMDjuDaXUoZZIYp4JMQE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGK30jqIEASfrgp8nh7IpdzvQ9Kpd0MY7tI1sylW7wOrnX1kjx
	zUxdBn9VHKEhzFc26XGX+po1h/tdy/EiB0SORstOWJ1kqDY81PScVcz8be2lg2bpvvY50vPwo5x
	ZInphM7BM8dRWK20PPqZfF8+lWEKu5OdqK3tuGMpzrREi+mrSK1kwMnXw15mmpIB+MTdiZfU=
X-Gm-Gg: ASbGncsgeyDPbpG0S2teH3ZgVzezOonmCfyzc0FneqbqxFpS6x05LXMbD73VFUZiUr7
	b/dCz2WOhsmtfRIEKk10c5YUg9YXi9jOyKNXRnPWoR3FEQxiBLwp37krNlgLEqM52Xj3yAbxQ9X
	7BztRCyoHg7Qt0mnF6I0GpVmMC36qqa9mcN/SGbEadSXMEz4WymRct+MnwpeOC6Cn7Wy5jNV2S1
	fnrECRwEwGRb389sob2qqjFxMRcrjIo4ewjt4/6+611vWKRQWZehyS0I/mX8mQMwQU7ft7B9N1T
	dLqE9hPLIuIRY6ni3JHVktDImWqlMkC1FXqyFS8OlHJ0IbAIZSoRYij2VWidI0BIgpHLZTs0Jxx
	ELOfcZnroZkwszTfCBRf0oXCVlxwho8kJ3CMlSIHrMKvvqDETIRpP
X-Received: by 2002:a05:622a:5e1a:b0:4da:7af7:ca1d with SMTP id d75a77b69052e-4da7b1654b9mr66755201cf.55.1758924439237;
        Fri, 26 Sep 2025 15:07:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7y9BPwYXsLwllrlICGh/y3wjajN0DatA1Xa1+K1MRg4+CJ6exu6kPOh8+ogzY0kvWFwS0xQ==
X-Received: by 2002:a05:622a:5e1a:b0:4da:7af7:ca1d with SMTP id d75a77b69052e-4da7b1654b9mr66754931cf.55.1758924438695;
        Fri, 26 Sep 2025 15:07:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583173d0fbfsm2141145e87.144.2025.09.26.15.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 15:07:16 -0700 (PDT)
Date: Sat, 27 Sep 2025 01:07:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/2] usb: typec: ucsi_glink: Increase buffer size to
 support UCSI v2
Message-ID: <6kbkkiwsp3hzu2u6uezelwufooeeh7efrcc2buydpbziuhr5px@xdp24rhfjqyf>
References: <20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com>
 <20250924232631.644234-3-anjelique.melendez@oss.qualcomm.com>
 <t3hfr33t76ckecatro5gheycb2phnch57m6zzdpm44ibykbubd@e6nffasyetib>
 <4cbcf312-7697-4725-8fd8-45f2b5b0584f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cbcf312-7697-4725-8fd8-45f2b5b0584f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d70e98 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KvxZ8lf09URLfSDANNkA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: W3weBrQTPfUnt2yM6o2h5Q26Llsw8ETy
X-Proofpoint-ORIG-GUID: W3weBrQTPfUnt2yM6o2h5Q26Llsw8ETy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXwMELVnoEFzSG
 PqiIiyrDj/jIT4h43igUmD21n3EUQ1Gu/j28vsXzEXc3uGc2Ur5yIQvHt3+aoHFvDATTopbOVrE
 e7sBGt7TC+etbb3xF/JD8GK6ojyaeBRwt29idFj7E03Fz37Q70mU6YkAbXZN1V6SzgliK2rFS4C
 bOXglFrJoIWpHdQ95xBR/tYCapGoYY9krtsLVAEpqf6NXrLeVqAF+BZxa8b/PRZAfWbJqHXyrr+
 KCI8Sr4lrhVyn7lmER2Xi1kTevRhxZoLb/x4ms7Cmz3kXqTneW0OHxLwTk6oc2yxa/f0KgXwQb6
 Auh+n3iLzVhQAo6YwJuD+LycLFz00HRLGHm2Oj69REiv0qovF7BYl+I+lxwFCtj4mQnQRYJll6p
 nd9JpHQyvJTuREvQkpDizkjznmW1jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Fri, Sep 26, 2025 at 11:19:13AM -0700, Anjelique Melendez wrote:
> 
> 
> On 9/25/2025 2:43 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 24, 2025 at 04:26:31PM -0700, Anjelique Melendez wrote:
> > > UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
> > > 16 bytes to 256 bytes each for the message exchange between OPM and PPM
> > > This makes the total buffer size increase from 48 bytes to 528 bytes.
> > > Update the buffer size to support this increase.
> > > 
> > > Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> > > ---
> > >   drivers/usb/typec/ucsi/ucsi_glink.c | 81 ++++++++++++++++++++++++-----
> > >   1 file changed, 68 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> > > index 1f9f0d942c1a..7f19b4d23fed 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> > > @@ -16,10 +16,10 @@
> > >   #define PMIC_GLINK_MAX_PORTS		3
> > > -#define UCSI_BUF_SIZE                   48
> > > +#define UCSI_BUF_V1_SIZE		(UCSI_MESSAGE_OUT + (UCSI_MESSAGE_OUT - UCSI_MESSAGE_IN))
> > > +#define UCSI_BUF_V2_SIZE		(UCSIv2_MESSAGE_OUT + (UCSIv2_MESSAGE_OUT - UCSI_MESSAGE_IN))
> > >   #define MSG_TYPE_REQ_RESP               1
> > > -#define UCSI_BUF_SIZE                   48
> > >   #define UC_NOTIFY_RECEIVER_UCSI         0x0
> > >   #define UC_UCSI_READ_BUF_REQ            0x11
> > > @@ -30,15 +30,27 @@ struct ucsi_read_buf_req_msg {
> > >   	struct pmic_glink_hdr   hdr;
> > >   };
> > > -struct __packed ucsi_read_buf_resp_msg {
> > > +struct __packed ucsi_v1_read_buf_resp_msg {
> > >   	struct pmic_glink_hdr   hdr;
> > > -	u8                      buf[UCSI_BUF_SIZE];
> > > +	u8                      buf[UCSI_BUF_V1_SIZE];
> > >   	u32                     ret_code;
> > >   };
> > > -struct __packed ucsi_write_buf_req_msg {
> > > +struct __packed ucsi_v2_read_buf_resp_msg {
> > >   	struct pmic_glink_hdr   hdr;
> > > -	u8                      buf[UCSI_BUF_SIZE];
> > > +	u8                      buf[UCSI_BUF_V2_SIZE];
> > > +	u32                     ret_code;
> > > +};
> > > +
> > > +struct __packed ucsi_v1_write_buf_req_msg {
> > > +	struct pmic_glink_hdr   hdr;
> > > +	u8                      buf[UCSI_BUF_V1_SIZE];
> > > +	u32                     reserved;
> > > +};
> > > +
> > > +struct __packed ucsi_v2_write_buf_req_msg {
> > > +	struct pmic_glink_hdr   hdr;
> > > +	u8                      buf[UCSI_BUF_V2_SIZE];
> > >   	u32                     reserved;
> > >   };
> > > @@ -72,7 +84,7 @@ struct pmic_glink_ucsi {
> > >   	bool ucsi_registered;
> > >   	bool pd_running;
> > > -	u8 read_buf[UCSI_BUF_SIZE];
> > > +	u8 read_buf[UCSI_BUF_V2_SIZE];
> > >   };
> > >   static int pmic_glink_ucsi_read(struct ucsi *__ucsi, unsigned int offset,
> > > @@ -131,18 +143,34 @@ static int pmic_glink_ucsi_read_message_in(struct ucsi *ucsi, void *val, size_t
> > >   static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned int offset,
> > >   					const void *val, size_t val_len)
> > >   {
> > > -	struct ucsi_write_buf_req_msg req = {};
> > > -	unsigned long left;
> > > +	struct ucsi_v2_write_buf_req_msg req = {};
> > > +	unsigned long left, max_buf_len;
> > > +	size_t req_len;
> > >   	int ret;
> > > +	memset(&req, 0, sizeof(req));
> > >   	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
> > >   	req.hdr.type = MSG_TYPE_REQ_RESP;
> > >   	req.hdr.opcode = UC_UCSI_WRITE_BUF_REQ;
> > > +
> > > +	if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
> > > +		req_len = sizeof(struct ucsi_v2_write_buf_req_msg);
> > > +		max_buf_len = UCSI_BUF_V2_SIZE;
> > 
> > I'd prefer it to be more explicit. Define an union of v1 and v2, fill
> > common parts and version-specific parts separately.
> Konrad also left a similar comment in this function "This code keeps the
> 'reserved' field zeored out for v1, but it does so in a fragile and implicit
> way :/" (https://lore.kernel.org/all/df671650-a5af-4453-a11d-e8e2a32bd1ab@oss.qualcomm.com/#t)
> 
> So I figured I would try to get thoughts from the both of you :)
> 
> We could have a union defined like so:
> struct __packed ucsi_write_buf_req_msg {
> 	struct pmic_glink_hdr   hdr;
> 	union {
> 		u8 v2_buf[UCSI_BUF_V2_SIZE];
> 		u8 v1_buf[UCSI_BUF_V1_SIZE];
> 	} buf;
> 	u32                     reserved;
> };

LGTM.

> 
> and then ucsi_locked_write() pseudo would be something like this:
> 
> pmic_glink_ucsi_locked_write()
> {
> 	struct ucsi_write_buf_req_msg req = {};
> 	u8 *buf;
> 
> 	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
> 	req.hdr.type = MSG_TYPE_REQ_RESP;
> 	req.hdr.opcode = UC_UCSI_WRITE_BUF_REQ;
> 
> 	if (version >= UCSI_VERSION_2_0)
> 		buf_len = UCSI_BUF_V2_SIZE;
> 		buf = req.buf.v2_buf;
> 	else if (version)
> 		buf_len = UCSI_BUF_V1_SIZE;
> 		buf = req.buf.v1_buf;
> 	else
> 		return -EINVAL;
> 	req_len = sizeof(struct pmic_glink_hdr) + buf_len + sizeof(u32);
> 
> 	memcpy(&buf[offset], val, val_len);
> 
> 	ret = pmic_glink_send(ucsi->client, &req, req_len);
> 	if (ret < 0)
> 		return ret;
> 
> 	left = wait_for_completion_timeout(&ucsi->write_ack, 5 * HZ);
> 	if (!left)
> 		return -ETIMEDOUT;
> 
> 	return 0;
> }
> 
> Since we are adding the union we still end up initializing space for the
> larger UCSI v2 buffer and when we have UCSI v1 we are only expected to send
> a request with buffer size = UCSI v1. With this we would still be keeping a
> reserved field zeroed for v1 but it still is not the req.reserved field
> being explicitly sent.
> 
> The only other solution I can think of that would be fully explicit is if we
> created pmic_glink_ucsi_v2_locked_write() which basically just did the exact
> same thing as the original pmic_glink_ucsi_locked_write() but instead used
> ucsi_v2_write_buf_req_msg struct. pmic_glink_ucsi_async_control() would then
> decide which locked_write function to call based on version. However that
> would include a lot of code copying.
> 
> Let me know what your thoughts are - I'm more than happy to go the way of
> the union but just want to make sure that we are all on same page and can
> agree on best steps forward :)
> 
> Thanks,
> Anjelique

-- 
With best wishes
Dmitry

