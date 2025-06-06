Return-Path: <linux-usb+bounces-24534-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C17ACFBA2
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jun 2025 05:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D471B1894B4D
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jun 2025 03:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EDA1E32C3;
	Fri,  6 Jun 2025 03:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3cq+/TL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB8E1E1C22
	for <linux-usb@vger.kernel.org>; Fri,  6 Jun 2025 03:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749180255; cv=none; b=RSPxpk63Aj22gBA0kzIvJ2MI4aqwKlrdx1c154LAyGOvwYbe+E5Rf7ZpZhe+pKVhv1l+2PE/4H/PJbewh5TJ5sg6vC/df7ZjI0pxQIyMAvDnz+XPUAuY9YsdyIXQetyC6x95ieuGF9Gh7RKWuaG6Z8V4J0L74pqqMyEz8ITiQzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749180255; c=relaxed/simple;
	bh=/IpqQ+Ow1kccbL0+Z+gFbNQsziKo3MedaRJp2Nc6qtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AySwQZ2PVnRSowcbo6rWBm0ewpz94J0C8Ed8vWk9lx1T9jdhq7UFeRowSsM00DRqafonunFXLzDZLiz1Vm4o3HcLdupQixFajz3tcwodapzyJ1bcA1MPv7/tJamVOQ8EvpXVyamIvpHeCp6rZFLmHVBuSLBu/Q3ORBVk4IApqB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3cq+/TL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555Ichb1012774
	for <linux-usb@vger.kernel.org>; Fri, 6 Jun 2025 03:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9IVw/MWfe+mFDw1S6kr1e3B0
	NGmmucKduXwSOPAXI0E=; b=I3cq+/TLm24ScSbzqwu1r/+ieDhpkTXspPNb2ICX
	ihOSNyRZGxiDZ5V/ROf45H20kP+IpG5Jycasft8HKihhKU+N42fwQf2Cp70RTihi
	0YyZoCSS86PNpYXmsPBn9ip9yhwps6yP8PXISxi54nZnS8hHcfo4WPtzJpIPJtp6
	FZKjsKL08MSG145lJwh3cAeBr5XjbywgRnRTufCq4IjukjxFBv4K4MWXDyEyWSuh
	xty1IpaZLKy6oidPDwYuQod+T6xnZcBkN4QNIzKWXJFi6CaaJcX0QrJ30RxXokmI
	XLUyFgt3AErvoUOQc5OFSMGKNk+9bTKSqA2UGOuBYqqyiw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wgxvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 06 Jun 2025 03:24:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d15c975968so319467685a.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Jun 2025 20:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749180252; x=1749785052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IVw/MWfe+mFDw1S6kr1e3B0NGmmucKduXwSOPAXI0E=;
        b=xHFr5I1Ln9xnB5PhI+L6T0jz0CduV7wrdNoI7PeNY0vpCNIi2jb2kcR/oJD+FzQj5T
         5xidMc/uJ8/SuQ5mMalo8gzP7pAvXRQ78z+jhVxYtG+kDMnQpymqZNYqoFhpGzx35QVW
         qq+VZpquqEUlZx8UsqMb/Nh53vIhP0xfqvO7FlWwxfz/Rs6BUfuW/InbdF/YNxLGE5J9
         5XDr3wJOJDyLzTkIU4T9M9GvLB5nxuhlGzj+Fg4DVenX4U8yYG1wLQ2vJP8cgsaDfd7u
         Teu4R8nWxHL7bDNfKHcT1HI0WYge//YwYcGXmxqn0zPr5HMO/IWLa9aY/wSdlTOunYTY
         9OAQ==
X-Gm-Message-State: AOJu0Yyx2VRKoarp6m+Hh8jyB0ZauP0fGLe0QtJRZwgkQyjpEcyiVCUj
	QNkBU9v9IWq/x489jy2MYa+6jMc0dzf4rHbLSi1QTLASyy6xOXhvOesxUwM5vps84VAdfnz2gqs
	LFgHY9A4o9+Exya0p42dFbl/gwBxuZChlJ8WYBGI2nOGApJvgIcc01hJpAZ+sARA=
X-Gm-Gg: ASbGnctTyjqe/4rdFktpkUkiVjj+Rv9d3BLTGS3qhrUrQDVcoju7zlg2sVCzghSchn3
	FDUpIlVAOxRkoLWrl6ONwaQfu+sk+gqxGN/iWOjstX2odNawnWqeHyvlOHiz58hfy/U/adsdovE
	IcWmcRi3IL1+c4o1/emUqugJprOCApAHRn8BYWz+zhuG6c2H4Pt7prMdDmqY1eovC4TK74HNJC1
	tXt3/jQSuuH6WXQP8Cie0p0pmXVe5Zn1rJknRJ89MP98RhZKJ9tSFQa4xHBKkN5Cq+NzMhatAxh
	GnYbhF0qAy0TGx0+ICIatP4qJCcNI0O5YQ+ScCsoo3IoUWn8a+6A7y2A30ZFJiBZCD8jkJdg6/M
	5ksvQOUWYcw==
X-Received: by 2002:a05:620a:2784:b0:7c7:a736:b698 with SMTP id af79cd13be357-7d22990682amr333411485a.40.1749180252159;
        Thu, 05 Jun 2025 20:24:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfpG4PXHwSSqUZP1AEULWeMj/ZrnwhMM43dx8i/RFtIVj8XlsxEyfE7zxK3htfeQpy5KL5Rw==
X-Received: by 2002:a05:620a:2784:b0:7c7:a736:b698 with SMTP id af79cd13be357-7d22990682amr333409685a.40.1749180251796;
        Thu, 05 Jun 2025 20:24:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553677221b4sm74396e87.90.2025.06.05.20.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 20:24:09 -0700 (PDT)
Date: Fri, 6 Jun 2025 06:24:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pooja Katiyar <pooja.katiyar@intel.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH 3/3] usb: typec: ucsi: Add support for SET_PDOS command
Message-ID: <zimwy2vru7iouhc4zu7vckv6onr7agg4oljpgth7apnkhmkdtd@ka76nwq3q53a>
References: <cover.1749142912.git.pooja.katiyar@intel.com>
 <72f048b49e5b9375a57ff69e47151ae19a05169f.1749142912.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72f048b49e5b9375a57ff69e47151ae19a05169f.1749142912.git.pooja.katiyar@intel.com>
X-Proofpoint-ORIG-GUID: 8xp-xoPTB6lDmNOZdeJPrh0DlZtIrMrK
X-Proofpoint-GUID: 8xp-xoPTB6lDmNOZdeJPrh0DlZtIrMrK
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=68425f5c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=QyXUC8HyAAAA:8 a=MdewEYPw2Rly6nW91JQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAzMSBTYWx0ZWRfX+HR3HnGyda4X
 3NdQ3cLYMX2WtMktzwQb/Q8wKR4MQZ+C2fiugJjOQEwxc+YySSi6YLNXT9FPZaOhIz6EnwTwgRd
 Zee7Uc6ocGGPpNQ6ATYQ9uD01mAZGL00BDbQuxuaU+uVHEh2K8Vn+bDI/I8/5/Syoqx3qnX59j8
 MFkMcDLy5igiK8xX4yj9GWYuZk8WMyVopXmxWMqnMaKrrZOlnvvOzkN8Sw6Ydusi0VWMzFVv10M
 SOPv5Q1HV0if/5Gz/bT0hkIvyKaVwEHraDqHRdgF0uMSPtfluBJeX6lgQUH2Bbij1BxauR5c6i/
 YP+BnHX44u8CfPeHq7FOulPzxe8RnowzxnMK7PNz7vOZly97zriMQlYvVnIkcDmOXqIRoxQBbuP
 qMUTmYtK1YHJhbdupyAEIHlvPWkGnZDBZDsTVrTWy8vmo06RFtbaiXBv3yphiSZWN0CVB8UI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060031

On Thu, Jun 05, 2025 at 06:38:15PM -0700, Pooja Katiyar wrote:
> Add support for UCSI SET_PDOS command as per UCSI specification v2.1 and
> above to debugfs.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
> ---
>  drivers/usb/typec/ucsi/debugfs.c | 6 ++++++
>  drivers/usb/typec/ucsi/ucsi.h    | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
> index 004587ce3427..1c8003121d6e 100644
> --- a/drivers/usb/typec/ucsi/debugfs.c
> +++ b/drivers/usb/typec/ucsi/debugfs.c
> @@ -36,6 +36,12 @@ static int ucsi_cmd(void *data, u64 val)
>  	case UCSI_SET_NEW_CAM:
>  		ret = ucsi_send_command(ucsi, val, NULL, 0);
>  		break;
> +	case UCSI_SET_PDOS:
> +		ret = ucsi_send_message_out(ucsi, ucsi->debugfs->message_out,
> +					    UCSI_COMMAND_DATA_LEN(val));

I think this goes against current UCSI command support code. I'd suggest
you to:

- extend .sync_control to also include message_out fields
- return -EINVAL if the write_message_out() callback is not set
- make ucsi_send_command() accept message_out data.

> +		if (!ret)
> +			ret = ucsi_send_command(ucsi, val, NULL, 0);
> +		break;
>  	case UCSI_GET_CAPABILITY:
>  	case UCSI_GET_CONNECTOR_CAPABILITY:
>  	case UCSI_GET_ALTERNATE_MODES:

-- 
With best wishes
Dmitry

