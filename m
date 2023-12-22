Return-Path: <linux-usb+bounces-4533-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F15AA81C9ED
	for <lists+linux-usb@lfdr.de>; Fri, 22 Dec 2023 13:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92C371F22C17
	for <lists+linux-usb@lfdr.de>; Fri, 22 Dec 2023 12:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DB31803A;
	Fri, 22 Dec 2023 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="bCAHUE3W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51F118AEF
	for <linux-usb@vger.kernel.org>; Fri, 22 Dec 2023 12:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1703247984; x=1703852784; i=wahrenst@gmx.net;
	bh=MBePScosI8RTAoW17ll+Ktup4kIzMrFWXjD53msLCMI=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=bCAHUE3WlXDK1SWtRfY1nF3A8SUfJCT3+chckDOqcoRCt/KPB39lRz8/Gg074Hbs
	 s007MVJhMBezGSzgi+XlehUu1ll/Gc+zhPdZZ9mppwZSMeZlbH17ve2AY2Ot7gs78
	 7vn3naqMtdoqxZ0sFqJDaBbmSWFFIBXIIN9/dlh8Z4Dfc+xDkfGyS7vxVTo1DgbRO
	 lBRrmnyDwCyqFxM2/9L5QQf0ZpsVi2nak1eWdCug1/c+YPQUz/JbAp8GqYMjnaHMB
	 QZWLDzJBvWeJqIcKF+q2HXkEVs/yHK2bg6GfF/PHpCOslFGApICMqQ2BrlHvSRjx/
	 CFgZP0NzjeR7GyXeVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHoNC-1rTMRS2UaM-00EuQI; Fri, 22
 Dec 2023 13:26:24 +0100
Message-ID: <568fce67-a9e2-4aa8-a165-f12efcf494b8@gmx.net>
Date: Fri, 22 Dec 2023 13:26:23 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] usb: chipidea: ci_hdrc_imx: add wakeup clock and
 keep it always on
Content-Language: en-US
To: Xu Yang <xu.yang_2@nxp.com>, peter.chen@kernel.org
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, luca.ceresoli@bootlin.com,
 jun.li@nxp.com, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231218061420.3460145-1-xu.yang_2@nxp.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231218061420.3460145-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R+S+BiZ7tkeziG+3Jfv/riD2GGprE79+1/5e4Y7YaRKu1KEjcNS
 Yg/fcnKaqFQXJr5YPGeLf0MEGHXqX/ga6coZqeTw4V6Tfbi1CyT+9WoT+riSxtGV8/RJoey
 vz6qVlks7LZetx1YvPu4x2lb4s9isHF9CLQ/qffmmH0QSE5Gvi1QNQJb40viHgOnfH2ykNR
 RewVBimEdiuLTvTT3ZS1A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Z39XA3J4Afk=;rsWPsAQlZNNgA+ObHfdR7Hwgt9S
 wn7UdF3doNe/pq6yeM0ti+M0zCRl28hziG9y7ni9f+WxC1bJcr0s9fGEx7WehriPfcyFVA+xq
 PDl0biwPXmZQLIYwe6V+h8fa3a39C4/MEBiEOKr5I/OVEy7Py0N0HoYM1OEkmlubuzdgebhQI
 nRK+zlhIvucJJ2BZukVvvZdentyRLhaP7/bDdmVyIWpp18PxCSg9+LsvTaGplerM7A4k7J433
 8TlBo+o/CAaDclFfUQDxFJBQZmRHz6ZnfDyVstc+60Zh7p03Vqta8BtjEsWH2kIp0wypSxQVj
 e/U6mx6wbYQikKwqWxnFSdDqJWt+KPJq15myetxgfXP1UIdLlCMUX3AdOCT+YN1DTl0JKB88B
 sDSfNZLy9BRUUB6ReUJ1qt9rjpZjdTJfSdAimVeq1kOoCINk0dkhYDxE/YJmxr+4DycS9oxm1
 /h0eQrfzY6tQZ8sIJtq817gF15cWTXi0HbEbTbfcBxmu5HyMesWypjYaJoK4ALwrIk6ClsvMi
 C8O9V1dZvQIFTCWmhwXsVky0KSzjKwye2NsV/uSovc4EqgVhw9g71Zto7kxUyyjQe+3wAKjv6
 ADudD6AftF85E1v4z3DuVzRp9haNV3WgcZd5I4X0I5F8ckeW2EBOHRkQxPa6+V2qXzBVoBuLB
 nmo6N3OM0d8bOzzjdpllxWDU9vjmu4YAd9TCrASvgaLvl2mT/kKvkfbEVl8LJyHVlbRSFcD1Z
 Co5NHnomPAm25r8i8DMVTJ6QH48Z8Mu96OEgasJB2KMDB8lEGx/t0VQY/hCUC0uj7dBoup7cc
 A3kynyvpvHOaBkkqb5QD8ZIfzDGDSn1Oh0xHnG7CmBSoCQLFUmpJgYOsDvnTTEsDZjebABzmi
 cf7lSHuDseRW4TOMQFPMIpY6nP+nAUekgTKIxM/MH5CZnxdwycGA7fvMftjPtBLm3CauDzIRH
 kgKweLy0Qe9FItkYX43iAQWRzNs=

Hi Xu,

Am 18.12.23 um 07:14 schrieb Xu Yang:
> Some platform using ChipIdea IP  may keep 32KHz wakeup clock always
> on without usb driver intervention. And some may need driver to handle
> this clock. For now only i.MX93 needs this wakeup clock. This patch will
> get wakeup clock and keep it always on to make controller work properly.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v2:
>   - modify commit msg to make it clear
> ---
>   drivers/usb/chipidea/ci_hdrc_imx.c | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/c=
i_hdrc_imx.c
> index e28bb2f2612d..4330be8240ff 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -96,6 +96,7 @@ struct ci_hdrc_imx_data {
>   	struct usb_phy *phy;
>   	struct platform_device *ci_pdev;
>   	struct clk *clk;
> +	struct clk *clk_wakeup;
>   	struct imx_usbmisc_data *usbmisc_data;
>   	bool supports_runtime_pm;
>   	bool override_phy_control;
> @@ -199,7 +200,7 @@ static int imx_get_clks(struct device *dev)
>
>   	data->clk_ipg =3D devm_clk_get(dev, "ipg");
>   	if (IS_ERR(data->clk_ipg)) {
> -		/* If the platform only needs one clocks */
> +		/* If the platform only needs one primary clock */
>   		data->clk =3D devm_clk_get(dev, NULL);
>   		if (IS_ERR(data->clk)) {
>   			ret =3D PTR_ERR(data->clk);
> @@ -208,6 +209,18 @@ static int imx_get_clks(struct device *dev)
>   				PTR_ERR(data->clk), PTR_ERR(data->clk_ipg));
>   			return ret;
>   		}
> +		/* Get wakeup clock. Not all of the platforms need to
> +		 * handle this clock. So make it optional.
> +		 */
> +		data->clk_wakeup =3D devm_clk_get_optional(dev,
> +							 "usb_wakeup_clk");
> +		if (IS_ERR(data->clk_wakeup)) {
> +			ret =3D PTR_ERR(data->clk_wakeup);
> +			dev_err(dev,
> +				"Failed to get wakeup clk, err=3D%ld\n",
> +				PTR_ERR(data->clk_wakeup));
> +			return ret;
this could be simplified to:

return dev_err_probe(dev, PTR_ERR(data->clk_wakeup), "Failed to get
wakeup clk\n");

AFAIK the error code is also printed out. Another benefit is that this
handles deferred probe of the clock and avoid spamming.
> +		}
>   		return ret;
>   	}
>
> @@ -423,6 +436,10 @@ static int ci_hdrc_imx_probe(struct platform_device=
 *pdev)
>   	if (ret)
>   		goto disable_hsic_regulator;
>
> +	ret =3D clk_prepare_enable(data->clk_wakeup);
> +	if (ret)
> +		goto err_wakeup_clk;
> +
>   	data->phy =3D devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
>   	if (IS_ERR(data->phy)) {
>   		ret =3D PTR_ERR(data->phy);
> @@ -504,6 +521,8 @@ static int ci_hdrc_imx_probe(struct platform_device =
*pdev)
>   disable_device:
>   	ci_hdrc_remove_device(data->ci_pdev);
>   err_clk:
> +	clk_disable_unprepare(data->clk_wakeup);
> +err_wakeup_clk:
>   	imx_disable_unprepare_clks(dev);
>   disable_hsic_regulator:
>   	if (data->hsic_pad_regulator)
> @@ -530,6 +549,7 @@ static void ci_hdrc_imx_remove(struct platform_devic=
e *pdev)
>   		usb_phy_shutdown(data->phy);
>   	if (data->ci_pdev) {
>   		imx_disable_unprepare_clks(&pdev->dev);
> +		clk_disable_unprepare(data->clk_wakeup);
>   		if (data->plat_data->flags & CI_HDRC_PMQOS)
>   			cpu_latency_qos_remove_request(&data->pm_qos_req);
>   		if (data->hsic_pad_regulator)


