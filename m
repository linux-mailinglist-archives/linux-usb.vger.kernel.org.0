Return-Path: <linux-usb+bounces-25205-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6895EAEC3D9
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 03:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D59553BB0F2
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 01:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010D71B4121;
	Sat, 28 Jun 2025 01:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W50buEiX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAFE262BE
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 01:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751074821; cv=none; b=n+hDiW7kHGHHI3lpEY6r0moAah8y6bvENi85wKj5AIf9nsFx5hAM2Wjn6jiBP8N+uKpqEbj7XOJ7SzTvIG+naxyc8KBUdmeILsHutt4j74W1T17uRkcjfJh3qt4oty9pyUjcGn895JwDKNo12BoI6X7xSlu01Dp+b6Dj/I+UU6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751074821; c=relaxed/simple;
	bh=3DQmOJ7Nx12ZkkN4wIfB6SEyTlIxf73MSmHqgN8oWlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWNk9X0E9HCokfX1WRYU4SGAfttPRNmrjGyAPHAeSyme5RZuXlmxxBByR1qWdl5sVfAUOdpunkzkXp+8J1/RuKZKLebp8b3qgH7qzDPLPo/WirhHga12cROQDEDaLRiZL8ReS/6SwXp9vxsac8ZF1+N1+1XiOs/pFsg3kqxbMw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W50buEiX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0hK0T019229
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 01:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g4+G5rzHwaNNNk4V6IF+LJqzuz3+v1IfI12aSHJdFKY=; b=W50buEiXe/AOduuS
	HCAHqlOcCuhhcTp/MrsDs63G8BY3NHpu4M6On8HS8rTjFxgwrYbhHVfdhn3IQqmT
	trJg8u9RblZgzKYlmrC33MeeT3X8JX6s+iMLZieOYPUtDN96Mx3+9HUappCNtgTC
	yhA26tDF5BcyLlZTj+EtIOMW54KdbrpjLNIgU5rKmSWaI1ZhKAz3xHGU/1ritVSv
	lCygwRNV0BIk3KRFAtF39TTN5Gk2GsG5saeU7JI6gpsgoaO9sLn1m2htiQQ1/xnQ
	cSLdrH9SPMTXz0yPtaw6Y1j2p7fclz4PCwnYoV7vZbycYMQyOuLOK9nN6wA5WtLy
	/PhrXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k0217-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 01:40:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d399070cecso70005985a.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 18:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751074817; x=1751679617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4+G5rzHwaNNNk4V6IF+LJqzuz3+v1IfI12aSHJdFKY=;
        b=R8vYWx1NX+CFFjXQXDVbHeR/QTWzWOs2YCZGvAkx962fIUfq+B8CLA8ZCpylMRhcRI
         8HEF0Zubsggqb5suK4o8XzCx1tg4yapPo1n+90aSqj09F6RZh+oJUabYZh4z6iEbeqjd
         Iyzg2ExESe6eCDIm2dfcVW77D5QPC6Bz+ejTENhE9I4AMSVRNE2UIFNYE1ww4p4NjxFc
         U58MlszT4V/1E03rid0aQDf3aE+bNgQZ89OSMBrb418JPAyTRg3sK1le0GTsLlVJhI2f
         zrNIJIkdBrkHuC+DIDRPfwZTRZ/3pPmSpT8lilaa9hT6bI52IcyJ9C/AbxhuAaz/JlwK
         HZLA==
X-Forwarded-Encrypted: i=1; AJvYcCUZro33HdC2Ji7722KuoWwqRLi5qT5DtK3qwiumhk9DB8RpZsm/jnArSZ8Ac3IRoi6isJB68un5ppE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUaLU3jK/XTHpAE9Wm4mCmPeyA49pxxyNkSA2UJRGB1QeuUSKf
	/3RCfEmGMVhI6P6OzKEfWwqFHvfWiGqNA6Lt9yeEkcgYDBEeU697sZk5yiqrSBVGC/Ooh86dZI1
	oSKCPbK7/l5ulDARuLKmuxak7VaAq15+RPZB8nlvYh/53VKRlFqE3cmcLndkZTlM=
X-Gm-Gg: ASbGncs97dyr6JFqwdd+ylvqbI463XSotVBKBzVKy+oTLNJR1ftrPfxHeLejZCehmHh
	MaY75Ah9L3unUBMu4hGYj/su/Ez7OSqWllG6o6mmav+XEzORsuRSg4+GQQHhdBj6W2qZy9pDDQi
	QfpjAlGra7s148lxVjL8Lg4orxJKJ1IcFTzkIvh7bmoiRx7SMf8iTtnrRiV3C8+44g97z00V43i
	uvZToxdqJy/jMOtwEp4MJZkC9NmkosyLJhaRt+iG9zdjJfZiy7KG0FY1V4u1PcII/wi9wGlvcV3
	JzTQa3oGuW3wO5WPW2qiPiU6A2alO3SvkeqjHGcrUNDYnE8xh6LEkW1N1EkFuAtvHwC7EX7+DFh
	pfBOQGKdxRjFm5oNCH2ila4Ke
X-Received: by 2002:a05:620a:4156:b0:7d3:90e4:1581 with SMTP id af79cd13be357-7d443972ebbmr702421185a.42.1751074817251;
        Fri, 27 Jun 2025 18:40:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzLfEeNLtV2LtUnwCer+Dj/71XL7wFuk4YHdax8rvtSjrrdZbNzSN+d+1FWybH0dOjRpZoVw==
X-Received: by 2002:a05:620a:4156:b0:7d3:90e4:1581 with SMTP id af79cd13be357-7d443972ebbmr702419185a.42.1751074816819;
        Fri, 27 Jun 2025 18:40:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::55f? (2001-14ba-a0c3-3a00--55f.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::55f])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ceee2sm634823e87.188.2025.06.27.18.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 18:40:14 -0700 (PDT)
Message-ID: <da49edc4-4aa9-462f-94d4-a2f2c920619a@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 04:40:12 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] usb: typec: ucsi: Add support for message out data
 structure
To: Pooja Katiyar <pooja.katiyar@intel.com>, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com
References: <cover.1751042810.git.pooja.katiyar@intel.com>
 <cc0b7701c4ea3d1001fefeb3df65caeb3e624722.1751042810.git.pooja.katiyar@intel.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <cc0b7701c4ea3d1001fefeb3df65caeb3e624722.1751042810.git.pooja.katiyar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=685f4802 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=QyXUC8HyAAAA:8 a=bVx0uqR01MAO5JqRZ-gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMSBTYWx0ZWRfXykHmULiNeswD
 pg6vuU/Vi/zOuzk/rIuRJz9GGbBWzC9GelKapPIqN0CU8rMDiQ6fpEAEFiWZXfcxY5wnThTFp8B
 HkRDKnhfm7EYmwHa1J82JqZp9Op56yOTRjX628Su8Je3YlIbxTYEBCCg5OflP0zGYNKMiYubfQi
 vayJ+QhmcYI/gJD9n04smjza73S+xIhQ3GwdXO6gpEEmbIRxBRjViTtIJIFgVOwTp2ZelVViPtV
 RC2sahKC1VTQ/sggmSkeh/cey46VN3olgbXW7hjYuQJxB83pCwn3X0Z0ICiAcvaYA/Qc6r8D4mP
 w135NoPBvqR2jWy3sqr4BU3FAsxQgCBZguJ4gXehyCFiHLrUJQaLdsm4uZJmbV1dl/PhHqDHkPt
 qSQv+lrk2J2nHOXzeFq8/2tB+jXXylNEsT6poizLL0azDOYTR4KqNxkHPlBe6eebW3Hcyd8e
X-Proofpoint-ORIG-GUID: 1CrXAaucZfsJmZmO3T-60PoqqZdY5HX3
X-Proofpoint-GUID: 1CrXAaucZfsJmZmO3T-60PoqqZdY5HX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280011

On 27/06/2025 21:10, Pooja Katiyar wrote:
> Add support for updating message out data structure for UCSI ACPI
> interface for UCSI 2.1 and UCSI 3.0 commands such as Set PDOs and
> LPM Firmware Update.
> 
> Additionally, update ucsi_send_command to accept message_out data
> and .sync_control function to pass message_out data to
> write_message_out function if the command is UCSI_SET_PDOS.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
> ---
> Changelog v2:
> - Moved write_message_out operation to .sync_control.
> - Updated ucsi_send_command to accept message_out data.
> 
>   drivers/usb/typec/ucsi/cros_ec_ucsi.c |  4 +-
>   drivers/usb/typec/ucsi/debugfs.c      |  4 +-
>   drivers/usb/typec/ucsi/displayport.c  |  6 +--
>   drivers/usb/typec/ucsi/ucsi.c         | 64 ++++++++++++++++-----------
>   drivers/usb/typec/ucsi/ucsi.h         | 10 +++--
>   drivers/usb/typec/ucsi/ucsi_acpi.c    | 20 ++++++++-
>   drivers/usb/typec/ucsi/ucsi_ccg.c     |  4 +-
>   7 files changed, 72 insertions(+), 40 deletions(-)
> 

[...]

> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 01ce858a1a2b..c8410c88b45b 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -56,7 +56,7 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
>   EXPORT_SYMBOL_GPL(ucsi_notify_common);
>   
>   int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
> -			     void *data, size_t size)
> +			     void *data, size_t size, void *message_out)

Missing size for message_out. Also logically it should be:

int ucsi_sync_control_common(struct ucsi *ucsi, u64 command,
                              void *message_out, size_t message_out_size,
                              u32 *cci,
			     void *data, size_t size)

This way in params are separated from out.

>   {
>   	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
>   	int ret;
> @@ -68,6 +68,18 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
>   
>   	reinit_completion(&ucsi->complete);
>   
> +	if (message_out) {
> +		if (!ucsi->ops->write_message_out) {
> +			ret = -EOPNOTSUPP;
> +			goto out_clear_bit;
> +		}
> +
> +		ret = ucsi->ops->write_message_out(ucsi, message_out,
> +						   UCSI_COMMAND_DATA_LEN(command));

I think it should be other way around. write message_out, then set the 
DataLength field of the command.

> +		if (ret)
> +			goto out_clear_bit;
> +	}
> +
>   	ret = ucsi->ops->async_control(ucsi, command);
>   	if (ret)
>   		goto out_clear_bit;

[...]

> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 6b92f296e985..c0426bb1e81b 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -86,6 +86,21 @@ static int ucsi_acpi_read_message_in(struct ucsi *ucsi, void *val, size_t val_le
>   	return 0;
>   }
>   
> +static int ucsi_acpi_write_message_out(struct ucsi *ucsi, void *data, size_t data_len)
> +{
> +	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> +
> +	if (!data || !data_len)
> +		return -EINVAL;
> +
> +	if (ucsi->version <= UCSI_VERSION_1_2)
> +		memcpy(ua->base + UCSI_MESSAGE_OUT, data, data_len);
> +	else
> +		memcpy(ua->base + UCSIv2_MESSAGE_OUT, data, data_len);
> +
> +	return ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_WRITE);

Why do we need extra WRITE? Isn't the one performed by 
ucsi_acpi_async_control() not enough?

> +}
> +
>   static int ucsi_acpi_async_control(struct ucsi *ucsi, u64 command)
>   {
>   	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);

-- 
With best wishes
Dmitry

