Return-Path: <linux-usb+bounces-25839-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E953B05A52
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 14:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 138EB3A8F0E
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 12:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EADB2E03FC;
	Tue, 15 Jul 2025 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lfWhxNdR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D0F1EDA09
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 12:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752582825; cv=none; b=JLBjMzJXEMHDRzXdM3z/n03TIo2+h6wwu49Km8LWTt27YX5oyoU6BOZFLri6DFbtD8elCOCu3SU5QhNCReMYgbxrRS/1k0klrgLep3BASXexXMiPZ0shlme9VIz+/dD4LyWreJtUt0abw40JtObJX/zj14tkPFbTAgG41ANGOIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752582825; c=relaxed/simple;
	bh=SvRdOLMkLs4cCw3bsFKXQquDkb80tWBaQifsKF93g5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xg1lqdqVpdYIdbasTJRCwvSI25qOrxYL/BQ3CuKHKqHE/lutSFFq+uSvhQ6HVSi2auGp3lRHnwZBX87D99NgNOIHcMy8BemWFyqpghX5ewx5BCHE+lNCRoDnWXjVHhq/qXqBMyY0uZ+9Dda+1Z2ODObDWuvI84ZOSEr+1bC2n+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lfWhxNdR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F64sTc021925
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 12:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r0hBQb6sciCG3DtHt2ZpMDIA5njCpBLIV/1/jQJdBF4=; b=lfWhxNdRycvp8qll
	22KIf6toh/bL4ieF42SiP6abKv/+NBakS30300eihFhKc/Gwnuu7mqBfTXykPwXn
	lwR9S4ixtTTuGvqM29rxBt41JJHu+pvQJDjDzQaUVmyN+4/dlRVX/pEoOmFQxHNz
	+UblHVA22/z1atOJVqCbQD2rxHEvB0GVkkVem+mQ5iOPPBWctBbfDwLzMVlUyIl+
	5S652g0RzCxD/aMbrUaThN4uYQBzBRpLAn5fTyR8As3EAiceMmS0g4jzk3xHn0iB
	uualz/aZ8prVTKmPnnoiX1x1skAYYtRYQY/hTOpELnxuisD9F9JDtP3t53WMRZSJ
	g7dLrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpb1cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 12:33:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e2e8a90a90so310404385a.1
        for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 05:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752582822; x=1753187622;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0hBQb6sciCG3DtHt2ZpMDIA5njCpBLIV/1/jQJdBF4=;
        b=wT/s4LgZF3w8v2AAErWlhJxECaQR/jdMJL52C7KunHWG4vZBoXI3o4cFiQbYmSfBZq
         W8nJ00Hj/+zNlOjgmci70k3KjFoG5cyUdoy3Bxq9GW7PspgXDrnJl6rTys6TBGT7Wbkr
         CJkyh7dTlSgCIL0d78n54DMQ6Xdx+pKvXa0+umjLDDDHf0nZhxIxF+ORiNR8Ge9SlzFE
         HaxriBVewFE1uhPo5zTf9TFXhaOEOXl2dJ9Z8nBXG7ej72C4m4h9AIH24oINQy2jELhF
         hGb8K5xqMLi3/AqLu8ovCBnUDEE1Phkybqsy0nFVqDU4k48DRoOJHjJO0GoZ2Za9gmwv
         gefQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIVq1TaHflYKn8edyNtRKOnleFeFaMBDUz0f2ff0kE7amAPgKezyJOCQW5Hx+tIM9ELZ6CUc/c/G0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl0VJKLW4ceim3p3UNKoQF9/8nH5R5tAiQwN9fzA5OhxGhlcN9
	d/gPdfIuozoXDXH5G54Hdx+x5JkiK34mXKmEMba6oHZenHv9jk4xNsVgKsO60g9dmPRsvFp15l9
	E9ATE5MrJhO+/979RHxXWJwQNdKVpNbIbFjF9pmjXBL9mvXTSX/uECzO4Vp2B6QE=
X-Gm-Gg: ASbGncuo1eX1K38+bGcUCfq5DaPs1AjfnR93hPVOpz5IW50yPibVpHnJ/QNYPQxT5YE
	aHJImWwNOiWo0VxnovAxTo9QkcchFQWL7ShwhB9yFcirQvF1nlAOd1pdiWvpinADHdHXaigCvh1
	ZpRcL1bJlisipKAjpRukaPvnj3aGPQ7D3PkxqIV9EX036nMGdQbxvQaxyqaEsQdwv6Sx7aGEatj
	kZJr3TxgSxIfOvgDAxAIO8dLUexFSuheR3WwSC9uGCVOtb60w7zk+r7Kj7aWHghGPoKUr7A19sT
	TiZFy5vdlwe9xGMpSZJ9v16WXNcbssSRSdtlDa/5bWJNKXXQ8ANfvVOEphn7EpyeBKIa8Qvx6Cu
	R9J4IQi0un2hx7F8nMd4gqSRcyLXgB0B5B3F61qu7q7yTwLwb4N9i
X-Received: by 2002:a05:620a:448b:b0:7e0:bd35:fd23 with SMTP id af79cd13be357-7e0bd36022emr1552317885a.46.1752582821772;
        Tue, 15 Jul 2025 05:33:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+tmilO4Nd+RqSKmMZKxcxySJ8P1UmvMw9HGlsUGtDsxYECoRYArl2O/7yGvRFIAamtSOK+Q==
X-Received: by 2002:a05:620a:448b:b0:7e0:bd35:fd23 with SMTP id af79cd13be357-7e0bd36022emr1552313685a.46.1752582821106;
        Tue, 15 Jul 2025 05:33:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b73ab3sm2280779e87.214.2025.07.15.05.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 05:33:40 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:33:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Message-ID: <ntlgplc5pvps65c3szss5ozbnfgvq4rnk74yfeoxurinx6udho@z6crcjxmv7nh>
References: <20250715-eud_mode_manager_secure_access-v5-1-e769be308d4a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250715-eud_mode_manager_secure_access-v5-1-e769be308d4a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDExNCBTYWx0ZWRfXxYAnbM4JGPqL
 CojpeCg7wD17gIrZWUQsNGX8h306+txSagnj+wlRreZFdwIsA6ooDzP/HUQJ14/MZKR3p4b4Y09
 /tTRKCJtknr1RgGCbHSvP4dfdu2SXfOWle3dN4PaZKZYYQIgAUaFaXASBwCpk0kV7lJU/7Bdc2j
 SWEeeVEcdm/nkDBLEGiXcsj97r7DUa6KoyqwGp8DSBFUwVUnMzZRWNpuO9a5eOH17fyZwoeB8mF
 snt4lfLbC/KZ+qmsQ/NNLADdz+5fIEUJZ05am7rD8zMoxVGoROrt/I2PobyfU38OafeZpxj/vQg
 r7jrETOEunhm5x1qYTGnegodMnay4JDTYy8P1ExLHfwVFaYDwNcA/CgbMk7CXD5gtEfOgyd2fb2
 0J5M/iEjqhNSRVhHqFmUmX2sU8yLjctCH1iOVYuYUCd9tOGVlimlb5nTFXDQI5E9+K/+jET0
X-Proofpoint-GUID: SJvVNlqI7_VF8j063cUK9FeyfTtoV7TC
X-Proofpoint-ORIG-GUID: SJvVNlqI7_VF8j063cUK9FeyfTtoV7TC
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=68764aa7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=RmLs6JBGabPHpirJ8U4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150114

On Tue, Jul 15, 2025 at 05:15:27PM +0530, Komal Bajaj wrote:
> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> as read-only for HLOS, enforcing access restrictions that prohibit
> direct memory-mapped writes via writel().
> 
> Attempts to write to this region from HLOS can result in silent failures
> or memory access violations, particularly when toggling EUD (Embedded
> USB Debugger) state. To ensure secure register access, modify the driver
> to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
> Secure Channel Monitor (SCM). SCM has the necessary permissions to access
> protected memory regions, enabling reliable control over EUD state.
> 
> SC7280, the only user of EUD is also affected, indicating that this could
> never have worked on a properly fused device.
> 
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v5:
> * Changed select QCOM_SCM to depends on QCOM_SCM in Kconfig per Greg's review
> * Link to v4: https://lore.kernel.org/all/20250709065533.25724-1-komal.bajaj@oss.qualcomm.com/
> 
> Changes in v4:
> * Added error logging in disable_eud() for SCM write failures, per Konrad’s suggestion
> * Link to v3: https://lore.kernel.org/all/20250708085208.19089-1-komal.bajaj@oss.qualcomm.com/
> 
> Changes in v3:
> * Moved secure write before normal writes
> * Added error checking in disable_eud()
> * Use ENOMEM error code if platform_get_resource() fails
> * Select QCOM_SCM driver if USB_QCOM_EUD is enabled
> * Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.bajaj@oss.qualcomm.com/
> 
> Changes in v2:
> * Drop separate compatible to be added for secure eud
> * Use secure call to access EUD mode manager register
> * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/
> ---
>  drivers/usb/misc/Kconfig    |  1 +
>  drivers/usb/misc/qcom_eud.c | 27 +++++++++++++++++++++------
>  2 files changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> index 6497c4e81e951a14201ad965dadc29f9888f8254..73ebd3257625e4567f33636cdfd756344b9ed4e7 100644
> --- a/drivers/usb/misc/Kconfig
> +++ b/drivers/usb/misc/Kconfig
> @@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
>  config USB_QCOM_EUD
>  	tristate "QCOM Embedded USB Debugger(EUD) Driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on QCOM_SCM
>  	select USB_ROLE_SWITCH
>  	help
>  	  This module enables support for Qualcomm Technologies, Inc.
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 83079c414b4f281b2136d0d1eb39418c7f94ff8c..a58081f53db32935f09c685e4599985285133891 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -15,6 +15,7 @@
>  #include <linux/slab.h>
>  #include <linux/sysfs.h>
>  #include <linux/usb/role.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
>  
>  #define EUD_REG_INT1_EN_MASK	0x0024
>  #define EUD_REG_INT_STATUS_1	0x0044
> @@ -34,7 +35,7 @@ struct eud_chip {
>  	struct device			*dev;
>  	struct usb_role_switch		*role_sw;
>  	void __iomem			*base;
> -	void __iomem			*mode_mgr;
> +	phys_addr_t			mode_mgr;
>  	unsigned int			int_status;
>  	int				irq;
>  	bool				enabled;
> @@ -43,18 +44,30 @@ struct eud_chip {
>  
>  static int enable_eud(struct eud_chip *priv)
>  {
> +	int ret;
> +
> +	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
> +	if (ret)
> +		return ret;
> +
>  	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
>  	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
>  			priv->base + EUD_REG_INT1_EN_MASK);
> -	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
>  
>  	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
>  }
>  
>  static void disable_eud(struct eud_chip *priv)
>  {
> +	int ret;
> +
> +	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to disable eud\n");
> +		return;

Change this (and enable_store()) to propagate the error code.

> +	}
> +
>  	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
> -	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
>  }
>  
>  static ssize_t enable_show(struct device *dev,
> @@ -178,6 +191,7 @@ static void eud_role_switch_release(void *data)
>  static int eud_probe(struct platform_device *pdev)
>  {
>  	struct eud_chip *chip;
> +	struct resource *res;
>  	int ret;
>  
>  	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> @@ -200,9 +214,10 @@ static int eud_probe(struct platform_device *pdev)
>  	if (IS_ERR(chip->base))
>  		return PTR_ERR(chip->base);
>  
> -	chip->mode_mgr = devm_platform_ioremap_resource(pdev, 1);
> -	if (IS_ERR(chip->mode_mgr))
> -		return PTR_ERR(chip->mode_mgr);
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res)
> +		return -ENODEV;
> +	chip->mode_mgr = res->start;
>  
>  	chip->irq = platform_get_irq(pdev, 0);
>  	if (chip->irq < 0)
> 
> ---
> base-commit: 347e9f5043c89695b01e66b3ed111755afcf1911
> change-id: 20250715-eud_mode_manager_secure_access-6e57e3c71ec2
> 
> Best regards,
> -- 
> Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

