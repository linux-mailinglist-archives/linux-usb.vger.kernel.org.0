Return-Path: <linux-usb+bounces-36873-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKx8FMRT+GnSswIAu9opvQ
	(envelope-from <linux-usb+bounces-36873-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 10:07:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B575A4B9E5F
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 10:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0108D3012BFA
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 08:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F573161A4;
	Mon,  4 May 2026 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RPB6IrUW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODLxDJAZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FEE3090D7
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 08:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882047; cv=pass; b=CkatqacvlI1qnXuD+1if7ZihrKkINQY9vBL6DYgFbkCUL1zJHcDu52PaOvr1/JQZb2hjJgATfrdTfs7msNLlSmdJMXHJg+xsdv7sy6oH8X+8BbLs2UKHp0RNC8P/xZJqQcBWyHDWkJgejF2/ltmDsW8H1Nd8GACxI4RnNN7iuLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882047; c=relaxed/simple;
	bh=nEQz64k/1WoIwQjZRUfr29xgmGc05Cnt8HVAuYsV0aM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2QN+fRMk4OQ6LNRYPVX8BKVcp2UomPPMUBZhmJ4wCiGSgGVHJjzoQXU2eRMIBDj4VIZpD19cfj3Tvmu0PvroFjwjGNqnj4tV95qCuru6Bw9mSgzJ24v/MPFYw6RXHcdbLbhUr7seLonmQJNXUKfVLLlc1kC1SVYgJsR1PPhLvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RPB6IrUW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODLxDJAZ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DTV83505366
	for <linux-usb@vger.kernel.org>; Mon, 4 May 2026 08:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTOFH2n3dVfEzZk7wWH3keBS96QiA2Aks7uS89gRBH8=; b=RPB6IrUWhMlAldNP
	e5g6kmXsWPj9jxjm9j8O2VBF/NZHIlrZ1wyASNEQI+H0CXJvB6+/BrRQvoMBGsBj
	SMPgtdQU6erPAOqdsw5gdC1tI4S9Y0kB7gX+Aos4WJpbYucUxBcL2LeCti+0AC2+
	Stc/XR1QuMMSLEwhwA0jkF0HvxzuL+fuz8juZD7QyOTH0ma7EMumuRP4pGLlnqgO
	SxdtlsmTnaD66WKOtwkMKr/LE+DSj9L9bBeY7/LKA8cLRnWwYkaInRLgiX6V8I9p
	kBJbayC+NoWtwvyw72qA7VbHIoh6CvCgKC7Ata42b9H8+P3kMBtpL4F2p/rT7fYa
	vi6ThQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6yfd5tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 08:07:25 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-794d80fea59so69609097b3.1
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 01:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777882044; cv=none;
        d=google.com; s=arc-20240605;
        b=hZXUNSDyBasajb6hXjm3ACC+/S2cqK6Qw86dJUwMF4ufHXe47sJFAhUtgTAaTIhYw9
         V5niYqLjRBWFTfbUbgUGRPg1ma9IXWHyIABI0qD6Jl6eL5XKqYEQKwVbUlQAh6LOY0wO
         GR7oXFsLLfSbeBrDzhP6DjHHEK6t8KdmGbovcYoIno8HpCnACnM383nSyt3rY0qCLAcf
         3Fupw0I7XlWSXKkTKJYkqTX2bTONzC//QdJelRwM5oZ0S8mA0Ky6xbZi4Jk+tiZD+Mt1
         4nLAKrHVQ7I63ar3YCbm0fNn+LoNVoRUuEVBgvlppbP06tAeSYdyNsQfYxg1+vqObiIe
         MKpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PTOFH2n3dVfEzZk7wWH3keBS96QiA2Aks7uS89gRBH8=;
        fh=fJU4A8TPqD4q2tb+2/1AIsLGa7MuFqH5MewPX2eB5QM=;
        b=W26NXDx7j2bmnVFOd3m8rIFceUg9omdnK+BpDo1APTq/cyYODYqOzWL1ABkj2xdxQ6
         p3So6kxvJQVzCpCncZOSB+dSU/Nhz6OzWGAZvg7XoABlc5ckCdrWKvIaOrbHKnlN8E9X
         hv0n5my/c0dpi5HDvTgS103DugnnvKLjRSG5bIYv7ldCnJV+cdwam16gPp7DgbkghKF4
         DAdKoIsb7lYgrzcV0o5uwu98VVqJdP2BBS3OVofaXKuggSKQnSruGfpOqxb6hsIIQkvl
         BhNZGmkpLmUJMGrTE3uqYCHbJo9o0ytDNlFu6Onf54a5RBW97+Odj0VyLtJ0auIxVG/y
         rNPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882044; x=1778486844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTOFH2n3dVfEzZk7wWH3keBS96QiA2Aks7uS89gRBH8=;
        b=ODLxDJAZKRmtwh6zpM/gZ2HyeXa59ldvZv5CeA394ZaZoY2dHNdlihaXx/qbM3xFB3
         IDSob4ORC6cl6vqQZ05GBwKHwa1/j53CzyehniTrpHgOUEf5riSM5yXQPtQY5IZd9vdr
         FUzPGR5BNQrK5DhegqcRegR4KccJOxX5UI0F4oxcQ5W7l4Uj6SJ+knNbW7YOv0MKRFc7
         mNcLh/0HHb1LZTWIEZ4+Kv8ts9sH0AN8YuTzWSVAg2hd5qdwQnR7spz5xTPulQS5W1uD
         TKWFKBz26s+39OzIqmR8USP/SPJScAuT4YXJ6tBZl1NdLYL1131j35ngojR3QzEKsn7r
         AdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882044; x=1778486844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PTOFH2n3dVfEzZk7wWH3keBS96QiA2Aks7uS89gRBH8=;
        b=s3wyN+c8yfhi195VHjlhTIz1oVyIzaf9V4PRZCLEZ0OttQFzOBHAXNxgPi+0RBjTia
         RxuTskzhnXNQOorBCT6LEGr9sF9wuPI7IQYqUAXbe0KAV+u16kBK+529BgKNJho130Yb
         UOB0wm+ij0p97mG3B7Ktj6ojbgUWNlI4nCLAqhJOyjltN0x6A1KjmckDH345ZQSQH4XW
         +V0l3/OwS7LgBp4Ab5O2YAitcpMLX3lbZD7hKWwLwLzNcKRLgx4/Ccjx5p7h/2SFIjmQ
         QNrAjSr9HMzu5zqtwkiGHSp67wi6IcafTXWDCq3zGqYpghgiPMQgEtX8vvkQDfIeUjZn
         m5SQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EhNWdru89hU04nYgHg6cUzQARr+PbDme4J4ThEG+onJ1uwQFX7JO8PdSwIajQA6WjQcDgqhSfiUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1JzTr8gvwUz2wf+RtDRliWdmVW6oDGQ7hj6NUdE82D/s0tT6J
	u+ZY6BkZ4dsoY7j7X3GepQnpVmtQRkorWNsLBcJAZGojqR/X+QINXze4Ruu2NTBNs0WiUj3n0ob
	HkaqiUGilws1QLyZrHebpnX6Sa7RcFAct7jXh10FvIo1w2ZsfUO1V7JwWC9W97w/O7kXyOdvGj0
	/is82SAHELsFbo0/xMAty2zBRixHS+kCdX18YhbttF08WoDg==
X-Gm-Gg: AeBDietS1xs68lb0i0HdDXB86SRpGkebecOGkLpShY5byF4DjOdRmZr6Iq+5at0qcb+
	KWKlr8tNXwdCtZTpTxAW9BSyIHrpyrgX/OrbEMYRUJkX0BmSuuJLOznxl8/tanwsGN6xBLmuPSn
	yEXbGyYEZGKphc0Hp2E8zT1qpeDyfCwHSCd08zJzxkDUbrVX7jc61FQG/51OVIMMfjJm9XqMXQ7
	ob1lN8YZNyEhWa0TVt54sgXWEQZs/Xv+OOgn4OakWIL3e9aNN4=
X-Received: by 2002:a05:690c:6e85:b0:7bd:8752:cdbd with SMTP id 00721157ae682-7bd8752e640mr48818427b3.41.1777882044584;
        Mon, 04 May 2026 01:07:24 -0700 (PDT)
X-Received: by 2002:a05:690c:6e85:b0:7bd:8752:cdbd with SMTP id
 00721157ae682-7bd8752e640mr48818157b3.41.1777882044236; Mon, 04 May 2026
 01:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com> <d774b2f2-75f8-485f-830f-2a7a5dac1c23@linaro.org>
In-Reply-To: <d774b2f2-75f8-485f-830f-2a7a5dac1c23@linaro.org>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Mon, 4 May 2026 13:37:11 +0530
X-Gm-Features: AVHnY4Ig_aLpEo-Nqit4pYFKU8Cb6H2Xx8XMnZLH6cUdADQNynWyvQH0888rOIs
Message-ID: <CAEiyvpp2NseXQGxRi8zmebaONVskPyHDDb0SL11-wttH6Sj1Rg@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: qcom: Modify interrupt handling for EUSB2 Phy targets
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: G_N_Z4OtRAt8qXCtT2-xYFR6fQaM5fph
X-Proofpoint-GUID: G_N_Z4OtRAt8qXCtT2-xYFR6fQaM5fph
X-Authority-Analysis: v=2.4 cv=QY5WeMbv c=1 sm=1 tr=0 ts=69f853bd cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=FDDUSfwg_FEBtVg4pJEA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NyBTYWx0ZWRfX8qQoOwpJ9iq/
 noOK3EVTY67v5/nnRNg3FQMFP/Zo7jmrB4Scs74IZEpQfh4GOwPYcuYyABoljj5BKYGS+BXAmDC
 xCqUQXtPfij0b5PtpPVzGVJExVkHZ+NnnIUTuayVB06zrj25X0fo+YeK8poA2HpbHMryM1fERn/
 DpjZdlzOnVpOoLpX5rBqW0W/7KgieAlHY4zdkU7cw64sTlKTvcK7Uu4WaKDSB6zlExL3nS9uZkF
 mC7JpFVwVPhML7eaXQQnKGc4R3HRxh8PsxGbbkr/MvaluIIAcs5gf70N81tNuNR8r8AdRfr2/7A
 XAgerlehNshbls8QfDckn61ez4L38RagbND8yQdB7j2Nyx8BJGvPC/vqBiBMieKrOAQ29r66iXf
 pdTDNbfEdJPXnGxKxoBt6WDImSDTLk2y9WX2AA42053hH4R+qb/NRGYBM48QF9COq4iH7pl5qf5
 Lpu8K6w0ehkmkhuadyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040087
X-Rspamd-Queue-Id: B575A4B9E5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36873-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid]

On Mon, May 4, 2026 at 12:17=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 5/2/26 11:56, Krishna Kurapati wrote:
> > Modify interrupt handling for EUSB2 Phy targets. Enable DP Interrupt
> > when an Low speed device is connnected and enable DM interrupt when
> > a High Speed/ Full Speed device is connected.
>
> Could you explain _why_ and not the content of the patch ?
>

ACK. Will modify the commit text.

> >
> > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > ---
> > Tested remote wakeupon Glymur device by button press from a headset
> > connected to both Type-C and Type-A ports.
> >

[...]

> > +static const struct dwc3_qcom_platform_data dwc3_qcom_pdata =3D {
> > +     .uses_eusb2_phy =3D false,
> > +};
> > +
> > +static const struct dwc3_qcom_platform_data dwc3_qcom_glymur_pdata =3D=
 {
>
> SM8550 was the first QCom upstream SoC to use eUSB, should it be covered =
as well like SM8650, X1, ... ?
>

Yes, I tested the patch on Glymur, hence sent it only for Glymur for
now. Will add other targets later.

Regards,
Krishna,

