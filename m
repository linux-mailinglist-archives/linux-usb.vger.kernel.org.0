Return-Path: <linux-usb+bounces-25607-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0418AAFE2AC
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 10:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4873B5824BA
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 08:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D290275859;
	Wed,  9 Jul 2025 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1YWVPck"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D9E23C50D
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 08:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752049923; cv=none; b=OjSCk/Rdllp3eoBdn3knPHn78zxxSnyoDFjFKa+iSkFdasva156RhkFQoRuaqV+zT2lM+I+gYgA/oCPO/oKN3CwVgb8IE84MHC0q16GNLi6siLzDdkdjEU4TUeVhmGuZIIiCNOiu28M/BekmH/qYde8lIHtZCyEbzhlJ+M1G4KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752049923; c=relaxed/simple;
	bh=bvDbbRKoyDjxVaZBMlfvkXXUw0Rx9oajNH6sxggKwFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sX01Mfsrmc4D6Vug0D+m1lCdkuzZMo6nnoYEBpnj1n7sPxWTGyU8eFcgVFyLydxZwvunjkmlVd+JuwapQXqf7ijqc7wHcaS/YTbmwb+J26qeX3OXMEifHarCmEwqmnp9Yl7pYDdbO0sJNpxPDK4VYFdmToQNcY0pZiJ+nxs9SGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1YWVPck; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697h1Oq004694
	for <linux-usb@vger.kernel.org>; Wed, 9 Jul 2025 08:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7Ujx2kaKVzLyIA+H4UYprruc3V8KAQFqRIULOW/gg0=; b=c1YWVPckluN3hP9V
	+jWtQNEU+Ny9OsWuEuW3nuW1OMV9r6LWg5QOn4PXrfcUo3p9a22K8JVSC7Qcy+m5
	2nGWtl7TAPplcaoGKwb3YwqhJohJbnoJqqg3gGPVLUShXxb1KNGxdWiO2DOh1efr
	DKKXVPFFyB0et5vaTn4WVg5zP/GUSBXsEitCoUeBekClE6BqwiOZAlNsn6r/jBgq
	H7af65AZa2ja96j7ZoNLdrHlbc1RGjUEYFjy9/wbbVYFbjGaWr3q1w0eiOxF5/rw
	E3O6f7XZAcZLWu+GKSsaK4g5+86faOfC8Qa43xiM1eX+kd5zc8InULAQKzLO6smP
	5WKIiA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9dr4xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 08:32:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb3487d422so84859646d6.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 01:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752049920; x=1752654720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7Ujx2kaKVzLyIA+H4UYprruc3V8KAQFqRIULOW/gg0=;
        b=mwm57tL5weESeLwjyp6l51QMdqV+mcql0VKzgTZmG2SSr+4sE9PJK7UtZn3Imfijci
         ACbuQ/wqLmVA39r+Z+k9ok78T2TRcHZbzg/9AyK9sIQ8nQt4vdM1z9Fisp0DuNgUKCcN
         G4/w0mq4rxzOapX2i6wz8KgIxGK8I4d1JEFb8wtibV67ICY8FfHK+DsTE7bFSnXGH5pQ
         vh9alw7968RsEH5eGxu0/QBUz4vGRdzucKZewf9zzNisc0UNQmlLVxnEKX/omNQt3+ts
         k1typUYYax4r3LG8zBQ1VhBp+Nd6XpxQt+OIkJ6gXwWgYuMf/tQFfRkvf6RUb46gvLzC
         9lRg==
X-Forwarded-Encrypted: i=1; AJvYcCU5sPJWybLdidokcKlHYtramKaqPHS0bIyKQxOcpqvoJT7QyLhIQvIoagQ8BuIT/BEgPwp0DFRSHas=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeEOoIbd8n7HiXD1NsRRaTsGIr91x+09br4an9hpNwx6fS4U9E
	64nU6vi4kAiGQtUINKz8afhOpPTLCQ7zRz7GHX59DzgnZSH1rMxXMTXjdebfVo7cZzT8zwRnFVS
	URCA1oLQTW3OTUkbKrCcJKGNvgYcv+3wTIp75/KurcOjX0CZX7c+ySP5rleAs8jEaQWyB7eSxxw
	Q0FyzsmVITtb4BBLbTaopHGdGBfaw3X/9kshKTsw==
X-Gm-Gg: ASbGncuSM/5t0Ok4D3Hqt6QNznVBZPZHi4eo/zUaHIxpWoQZ0jJLPJN5X7a7m4SNMey
	zv9AOPXFwQOzJz0ybxKru2cmE8Wg8tGJcON2KApatRfot5Cj4il4OE/wAtovvUs4gPoTnury678
	6u9rwK
X-Received: by 2002:a05:6214:5888:b0:6fd:d91:ba28 with SMTP id 6a1803df08f44-7048ba304c1mr23085416d6.41.1752049920172;
        Wed, 09 Jul 2025 01:32:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzCrbEcZUfqFs/i1liWPqCseBPAUwivYFuLwrJ2dfMFo45jB86/Vep2siUv3SBlLcr2sYgF1HK8G0vU5P8N+M=
X-Received: by 2002:a05:6214:5888:b0:6fd:d91:ba28 with SMTP id
 6a1803df08f44-7048ba304c1mr23085136d6.41.1752049919665; Wed, 09 Jul 2025
 01:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709065208.25472-1-komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20250709065208.25472-1-komal.bajaj@oss.qualcomm.com>
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 14:01:48 +0530
X-Gm-Features: Ac12FXwVlwOSKH6M7Xb7lRtJAzGLw2oZX6LTk8jHLEoWJrUUTz17pJVTrb17mQk
Message-ID: <CAPHGfUODORLkOwd6T68fYOFMpcc_S+zDAJ0inj7Vu_Sbn-dxPQ@mail.gmail.com>
Subject: Re: [PATCH v3] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: TukVz3OPkepvMk1l-EV0aieCM4qxJcdY
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=686e2901 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=BjlrWRqCICg19y0UsegA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TukVz3OPkepvMk1l-EV0aieCM4qxJcdY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA3NSBTYWx0ZWRfXwBAEbwJjdKeP
 fpHwRXkZnraBdUUArnl4vN1DlYmttr4E/J5Q4v4snQJc4e9mK3IFmQKiNfow/mvQhHFzwmEDDE5
 prYkmO3iagcb0X9BeFz+fOrF51Ru+RP5BNRZ//T6fP58FG6eehzeRTWBTOLt3MckdmdnAEbIINX
 DhjxSjSiP/CdOXdFrqlzTNYoBfhxqVfn0w2LnG2GO4rjhCmgx/OxArX8g7Mcet5PMamEFYPNOTn
 2YifezeJpIEC+bQsAAa4BMiGlbz+KGAnMbu6iMktWv2vWTif6l0q0/UzHdmNSUDx8snx8AmvgAV
 wojHxBajtLBNclld/vCYxK7miFWpeZHkKYDcfggzfF1TCX+cRh+BU5SJcE+/8oPYkuXnvWH7HTU
 /IDvTtMOjwKxnb8ovJKHM4vYaWtVa/UuSeJ+56LMLFLkKD0CrRxS5RK9LR/H6nFIMGW/fcVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090075

Please ignore this email

On Wed, Jul 9, 2025 at 12:22=E2=80=AFPM Komal Bajaj
<komal.bajaj@oss.qualcomm.com> wrote:
>
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
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB=
 Debugger(EUD)")
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v3:
> * Moved secure write before normal writes
> * Added error checking in disable_eud function call
> * Use ENOMEM error code if platform_get_resource() fails
> * Select QCOM_SCM driver if USB_QCOM_EUD is enabled
> * Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.ba=
jaj@oss.qualcomm.com/
>
> Changes in v2:
> * Drop separate compatible to be added for secure eud
> * Use secure call to access EUD mode manager register
> * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_mo=
lvera@quicinc.com/
>
>  drivers/usb/misc/Kconfig    |  1 +
>  drivers/usb/misc/qcom_eud.c | 24 ++++++++++++++++++------
>  2 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> index 6497c4e81e95..f49d5ac0e957 100644
> --- a/drivers/usb/misc/Kconfig
> +++ b/drivers/usb/misc/Kconfig
> @@ -148,6 +148,7 @@ config USB_QCOM_EUD
>         tristate "QCOM Embedded USB Debugger(EUD) Driver"
>         depends on ARCH_QCOM || COMPILE_TEST
>         select USB_ROLE_SWITCH
> +       select QCOM_SCM
>         help
>           This module enables support for Qualcomm Technologies, Inc.
>           Embedded USB Debugger (EUD). The EUD is a control peripheral
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 83079c414b4f..156c4f75c3c9 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -15,6 +15,7 @@
>  #include <linux/slab.h>
>  #include <linux/sysfs.h>
>  #include <linux/usb/role.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
>
>  #define EUD_REG_INT1_EN_MASK   0x0024
>  #define EUD_REG_INT_STATUS_1   0x0044
> @@ -34,7 +35,7 @@ struct eud_chip {
>         struct device                   *dev;
>         struct usb_role_switch          *role_sw;
>         void __iomem                    *base;
> -       void __iomem                    *mode_mgr;
> +       phys_addr_t                     mode_mgr;
>         unsigned int                    int_status;
>         int                             irq;
>         bool                            enabled;
> @@ -43,18 +44,27 @@ struct eud_chip {
>
>  static int enable_eud(struct eud_chip *priv)
>  {
> +       int ret;
> +
> +       ret =3D qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
> +       if (ret)
> +               return ret;
> +
>         writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
>         writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
>                         priv->base + EUD_REG_INT1_EN_MASK);
> -       writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
>
>         return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
>  }
>
>  static void disable_eud(struct eud_chip *priv)
>  {
> +       int ret;
> +
> +       ret =3D qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
> +       if (ret)
> +               return;
>         writel(0, priv->base + EUD_REG_CSR_EUD_EN);
> -       writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
>  }
>
>  static ssize_t enable_show(struct device *dev,
> @@ -178,6 +188,7 @@ static void eud_role_switch_release(void *data)
>  static int eud_probe(struct platform_device *pdev)
>  {
>         struct eud_chip *chip;
> +       struct resource *res;
>         int ret;
>
>         chip =3D devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> @@ -200,9 +211,10 @@ static int eud_probe(struct platform_device *pdev)
>         if (IS_ERR(chip->base))
>                 return PTR_ERR(chip->base);
>
> -       chip->mode_mgr =3D devm_platform_ioremap_resource(pdev, 1);
> -       if (IS_ERR(chip->mode_mgr))
> -               return PTR_ERR(chip->mode_mgr);
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +       if (!res)
> +               return -ENODEV;
> +       chip->mode_mgr =3D res->start;
>
>         chip->irq =3D platform_get_irq(pdev, 0);
>         if (chip->irq < 0)
> --
> 2.48.1
>

