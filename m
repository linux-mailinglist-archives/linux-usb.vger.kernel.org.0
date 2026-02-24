Return-Path: <linux-usb+bounces-33625-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLmzFY9YnWlzOgQAu9opvQ
	(envelope-from <linux-usb+bounces-33625-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 08:51:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A321834D5
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 08:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 700A3307F9B7
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 07:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6913644AD;
	Tue, 24 Feb 2026 07:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/INWWND";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cF/WC5j5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3AF13C918
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919422; cv=none; b=DWkfjmKWEHMqHdkNfaPI6wRK8x+UW+6pIeZXIqxKcSOqnX3yjz1k/BXgr3y7U//kBjLf9bwPWne5RJmQ2Dyf+v7HdK7Z4EuC9g+/pG11rK+eOheNg+lp39fNaXz0sjmtqgd9CXsrR1VpcdXMdtsJm0CDl39SRKQTMnXzCFG2oDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919422; c=relaxed/simple;
	bh=L4/CAGod2Paq4GdDad57ZWrHEEh9z6Z6f4vEPOPRFB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwMVZl7V6B9nBNYrhKaHTZ9VaXrIQolYcF8Pof/1EKKMJED4y+vVPRCT7K2lXpEiVGx2rOXXQai0hGaWzUdUAhpzn92kIyxoerOEPtWVkAHI6G2L5s3g/aCl8/2ftY5XUvwwyy6TPifmPX7gHjHwivyvCHZjlhiMHWzb31m/+DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/INWWND; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cF/WC5j5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LP7m693605
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 07:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1uOYVneysWyKMZ/gsnkyDckyDOKVjyt86PZxz/YcJHE=; b=L/INWWND3hvj6Ki8
	aCRchWJoPrjyIKSzjPTfRmzehPOqgiLPMtJJxmEF8RMee2lNRoibCnvtv7up1SJp
	VxPs1oZEtf8O6fEyYHoZ/yuwZR9/Ls5JlJZaHUDwA9ryrbjpRJyKxQBgWl5B9i4K
	ZJ/xwXI8S541WlCQxGCzyFlWC397/yucY3JO8svSPxfKaQVVDejFw2bu8MqN04lR
	jQ1q+lkKWN4qx14BBWtDQRBF+Wm2g5XNAGMg52FdtysEYybiBFiY9cQk3pi4ocmz
	pELseHKMBDSYmcPJXE94edyGRlH1snYs7WOeZPuHJ8sDxKzS9L9qzpIeHEgUmIuh
	Ba2FxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9t8pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 07:50:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c881d0c617so4463666385a.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 23:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771919420; x=1772524220; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1uOYVneysWyKMZ/gsnkyDckyDOKVjyt86PZxz/YcJHE=;
        b=cF/WC5j5Uq7SsNADHjyNfTpwtNupsHFdn+DaA+MLjjT5qn5xf8dt/amb/yt8TjO02N
         FFNK5PIfD3rS0lcckwQu+B8fieBZ2AZ/MABZo5saTvWVAzpSuUhGzjAii7REEXTt7yCi
         IBIezbAlgP8mAsHHtiyGJouODetyY27oIyznqbuKRO+52P9RGOvkkcoDx/WeV/mxDWNA
         EO8RRvdhxdHILhkciuaZZvKYqel0rPCI2HdIjEfWcrDatD/Fqe8q9U7zE80M4BKkw26O
         b2e3fpGo8RgG3EhJfR6h54ys4wuskeIm6Ld9wY8XWvfkbs06MZLFFYqmcjLR9eyreAOG
         2rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771919420; x=1772524220;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1uOYVneysWyKMZ/gsnkyDckyDOKVjyt86PZxz/YcJHE=;
        b=YTFBg/V1K4grLqACYVuoGuePZDOXr+/675EB1SEXbNhvaOQ4NzaSkZkMnlRSJxSKdj
         xkl42UlnC+2igXNLxLiXWMUzufIDAzQ1WaILKI8RUEoy0dZipEflWjmb9jP3wFqx/VuN
         jkkBhyAin/fbNP5Y/qXEQwIXI9TrFEVJXTN+cCOQBOjWRVFs5Sw72wP6XfuW6tzdLm8Q
         rhlhtxzsWfCIdEZDad9QZm/xVlEtsiOhQ4uQ3Z0qJlggcr/6zy5IcG/x9/oyEnpQjCJW
         pZqYe1Sf1M6PTqtA7XTJ5Ah0X1wPiO5ZDeDd5az+PhZJUr0SaGVQnajkE29Lcclx03zX
         NJ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqpsSySqcmwD6n79WU92uRlDNUAmfBoCKDU60DdcSwtMBGwVUh7q8slsfg51iHsM7+WqUFvwLO10w=@vger.kernel.org
X-Gm-Message-State: AOJu0YweunobrguXjvAWuE7gNHPd591HRqz04SjGhOgtzU8EijWIIRrI
	uWOz0Pnu9zxEIY95xbFhhzJFNrQf0ewjTdqH5VOef2Ia6fqcybQMtt3MJgwt2XefkPu4WIT7NDr
	iJVfasK92EFwukcSx3Ov1cqOz7AlLiWWot938x65VyuXz77BxzelIONkTIDAHEe0=
X-Gm-Gg: AZuq6aKZfwBV/qyZOCL/qIn3qK9vlSOQWC10TwnRRZvLanDr0ggMMHtGb5kY/CCwUM7
	UvmZBAAdKtoD1RjS0Ve09TaumF6d44blFGNvV0WMm8Jx35TaajBwGScLkqFxBbEcm40RcLTSwN6
	23+QIo6EKZM6faKkdAoL00pADk+h0tSSuzgmPG1sEW50SF2EEWDw7hlHsSD9f0coorwpz6ziRq0
	A/rTtCZW9PLjMMwoIMDWawcmS0WdfLQ7NU1fo/LdcmubGArACmr34VOJOq829XHIh3ISD9VioQ6
	jv28i4AgxBgsIUsEF837v6P94/z+T6Yp7KRF3Gp1EYbWJLucnODS2L7o+L8q17Soka1k8yOz4V5
	MqaKGOzgA8LwEhJsKYBMHrFUHNINZyFYkO8Ua+2usWDt9VE4JPDjASMjE+X/lH9glB5GZtd3We3
	3j3eDNMrc4FPWTwwArESj3h685aqtnV41ZJ78=
X-Received: by 2002:a05:620a:19a4:b0:8a3:cd9e:e404 with SMTP id af79cd13be357-8cb8ca8dc05mr1376656185a.68.1771919419516;
        Mon, 23 Feb 2026 23:50:19 -0800 (PST)
X-Received: by 2002:a05:620a:19a4:b0:8a3:cd9e:e404 with SMTP id af79cd13be357-8cb8ca8dc05mr1376653885a.68.1771919418924;
        Mon, 23 Feb 2026 23:50:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45938sm2000589e87.69.2026.02.23.23.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 23:50:18 -0800 (PST)
Date: Tue, 24 Feb 2026 09:50:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] usb: typec: hd3ss3220: Add wakeup support from
 system suspend
Message-ID: <xxu3265rn5ctt4n7jtegizwdoo6r2w4aia366ftzcubhsscdxl@3minhgdtcmtl>
References: <20260215183325.3836178-1-swati.agarwal@oss.qualcomm.com>
 <20260215183325.3836178-2-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260215183325.3836178-2-swati.agarwal@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699d583c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=YYzu-XlWP_f3crXEb8gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2NyBTYWx0ZWRfX5g5DiOj8iX2v
 pj56+CYwx3xZbHpbZR0uq5CJokrKtnd2VR4LNrEVCJyMWLYrR0QmIM1tie9zCDfPFSLEywnWdKZ
 lTEGthH3u3mjD1WhY7lkEmPdSqiUX9hL8h310i50KY750Euh4jzsD35Th5C1FAaPTDrLNuH3KxA
 zMrWsSxWGjsZBxodp2HXcZ9FWUM3EPUAH/7nyW/X7WhiN0GsfF3Sc02QSU0jQ46Wp8ufGBAgZmV
 tEB/n3Y+cWHjJVA2gxH7aCP2F6UDGYJQxuImUJOgJA2ecsoNUlOGpQ190LwgZpSK06DBuU0iZb/
 ZcfRnkLI8o0D7PL/NgD1llRQMiA+P35nsMA7iYW1zoa9nfvUV9fcW69V3ODrrYLnwBhA6M4bDHw
 EdcI6qMsvhD3mm7IvKZtz+jKr6nqHp2svXce9dkcl2uZrnS+ugmrAex3ULCwMM7597ksKoA6XPE
 FDxhBIgDMI5+4JdqM/w==
X-Proofpoint-ORIG-GUID: WwEHjdbg6DSI-pDOmVDVEmog9J2D9_0E
X-Proofpoint-GUID: WwEHjdbg6DSI-pDOmVDVEmog9J2D9_0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33625-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C1A321834D5
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 12:03:24AM +0530, Swati Agarwal wrote:
> The HD3SS3220's interrupt is disabled during system suspend, so a USB‑C
> cable connect/attach event cannot wake the system. This prevents resume
> from low‑power modes when the port controller is expected to act as a
> wakeup source.
> 
> Add wakeup support by:
> 
> - Initialize the device as wakeup‑capable.
> - Enable the HD3SS3220 IRQ as a wakeup interrupt.
> - Add suspend/resume callbacks to enable or disable the IRQ for wakeup
> depending on the device's wakeup configuration.
> 
> With this, USB‑C cable insertion correctly wakes the system from suspend.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  drivers/usb/typec/hd3ss3220.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 3e39b800e6b5..b56df9349f89 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -501,6 +501,11 @@ static int hd3ss3220_probe(struct i2c_client *client)
>  	if (hd3ss3220->poll)
>  		schedule_delayed_work(&hd3ss3220->output_poll_work, HZ);
>  
> +	if (client->irq && device_property_read_bool(hd3ss3220->dev, "wakeup-source")) {
> +		device_init_wakeup(&client->dev, true);
> +		enable_irq_wake(client->irq);

I think this call must be dropped.

> +	}
> +
>  	dev_info(&client->dev, "probed revision=0x%x\n", ret);
>  
>  	return 0;
> @@ -525,6 +530,35 @@ static void hd3ss3220_remove(struct i2c_client *client)
>  	usb_role_switch_put(hd3ss3220->role_sw);
>  }
>  
> +static int __maybe_unused hd3ss3220_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(client->irq);
> +	else
> +		disable_irq(client->irq);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused hd3ss3220_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(client->irq);
> +	else
> +		enable_irq(client->irq);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops hd3ss3220_pm_ops = {
> +	.suspend = hd3ss3220_suspend,
> +	.resume = hd3ss3220_resume,
> +};
> +
>  static const struct of_device_id dev_ids[] = {
>  	{ .compatible = "ti,hd3ss3220"},
>  	{}
> @@ -535,6 +569,7 @@ static struct i2c_driver hd3ss3220_driver = {
>  	.driver = {
>  		.name = "hd3ss3220",
>  		.of_match_table = dev_ids,
> +		.pm	= &hd3ss3220_pm_ops,
>  	},
>  	.probe = hd3ss3220_probe,
>  	.remove = hd3ss3220_remove,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

