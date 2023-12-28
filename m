Return-Path: <linux-usb+bounces-4605-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F292E81F8D5
	for <lists+linux-usb@lfdr.de>; Thu, 28 Dec 2023 14:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A2CC1F228DD
	for <lists+linux-usb@lfdr.de>; Thu, 28 Dec 2023 13:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7641847A;
	Thu, 28 Dec 2023 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ko/OGn+J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19748468
	for <linux-usb@vger.kernel.org>; Thu, 28 Dec 2023 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1703770199; x=1704374999; i=wahrenst@gmx.net;
	bh=3hlh5QznRxG7hpVTEbLbc8p12wmqrpc9p52uMj2qzhg=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=ko/OGn+JpMndtVVcVWvv/Vmhb2a7n8qhTmMHSA68WBHQXBRfQ76ns4QWryNpD4a7
	 zxDHr8m0kWqWiqvNIbDKmzsD6DxB4d2Plf5tgjia8/kOdgNU/fhpAQcUK2YDnqa0c
	 JEBKT0QstGiDyAt7G5RtecGhyctxrtEDh/LmTc1ATfjO8Fqz8HXVo14ePC9kgC3v4
	 8OD/BB7XZTBj80iGA88aflwkIp/s3Lt34IUzcMhYkZ+yOrkrLPCXht7MgWdPs9TyT
	 Ohf1ZqbvxhXI/C7mnRL+rVGVyIu75i3EZ6Dupw+ltBt9jw4WK8KNOrN/3JGM474jo
	 T4k9fdGxAUP5EM46vA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.166] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2O6e-1rG5px09za-003x9f; Thu, 28
 Dec 2023 14:29:59 +0100
Message-ID: <f7988879-4822-48dd-aab2-954fb9cd819e@gmx.net>
Date: Thu, 28 Dec 2023 14:29:58 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] usb: chipidea: ci_hdrc_imx: add wakeup clock and
 keep it always on
To: Xu Yang <xu.yang_2@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 luca.ceresoli@bootlin.com, jun.li@nxp.com, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231228110753.1755756-1-xu.yang_2@nxp.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231228110753.1755756-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ir7W2JXEzSUp+aiTds6+dElE4Rews7s3TZM94spkV8nkCk/xdsR
 i5IC09beN76XrfqXcCKNMrsCs8m+e7ezx7XfSDUCvlM3iF5aXtOAjm0eQ+DzkTK20ko90mk
 0bh1c+5BCiBqUZHZVBC9zButTL4ea4HvpTsYhUgRXQ57xBlcXzYwlSLvdCKpWj0N/0t52RL
 vaShxS0cI/u+B62ZZJx+Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WPlARC6HIS0=;h6xEXtgyZdx+wDm49Scs5PkrcYe
 1Ht5QvB9DuWJp0QV0opnXe56L6Ic3N8wkEnwfeOO1GI0p5KX0196XaMczqrFNMLZia6Ka2Qfx
 XkFQecCgj3zoFyppGCN3hhHq7SkgTqHadG05HVIVQCw2ekDOrThsbehfCfDo6s0n8dQMDakLs
 72QknNer9iOtS6cb2cUL+ni4rtkuf27pDBGJeCKoR6yz9XrwcP/XBg6oEyxD4DOjLB8FoNonM
 UIKsjlDRmoSuNmeWU+XPD28qKXOCKjhuyxyShZs4OQo8AIz8SGgEPmapVuIqTrRD8aNMOwXKG
 8uryYMp68q7o4hho6Mx06cO2uWyTC9CtmLt6HjMxzrlre3V5+FMyOQtBKQMnYvrZOmlalEGvh
 VN+r2VFqjsycaMOigQmC4PuEp4pJfAIKWe/AE/ItSYHVR+mHm+iWv//+rSZn6zlAA7+BoBLnC
 cw5vK0JN+ejBTQ37lapF1o27eP9qGGqwSRkpeIZU9x9F7/E4GrdGitTrrdZgZuGOiE0WgXRsM
 GaO8lPJo9QwkWVHR/7kzNmetRC0zESdgG4m1009zouqrC1PHiSeYD1UPI12EL/1XLqEzoHA3m
 HDLzho37gjXLUFvjh68yuuyayuyRsSq3ceVCgf87kf3KxOvXnVS0J3GcRaqWVy5nwpS3AW6ag
 WibrSXyPXJaY8tttldc9xJVn/3ZdsjX2IGm0owYwBae+3n2FkI5Ei0B3g8ye5F+RDnY8/5WTJ
 QZnVMmYQTjhl1Q/VqBZPZsFWkj/8wH8Yh08qHfkZQcoj/7o0NwizT8u66mjB9pUPJfB9zEvho
 akgWzRjH4yziu1eAIgrbqBX4ttzzBJ0To1hqJZ2hrTkt7eap3iCBWLdKqYTTQ6dOn2hA03ghx
 iVd+uuYN66PTedjTINbpGpmMWsjjYx0mCZC7wUtOpt7qtu9UM0LRH3OSExtqGJ72gtew0icHU
 BnqVPxP9CYiXHTC4LCffvJLbK0DrfN3YRJ4904a7T5o5Bb15

Hi Xu,

Am 28.12.23 um 12:07 schrieb Xu Yang:
> Some platform using ChipIdea IP  may keep 32KHz wakeup clock always
> on without usb driver intervention. And some may need driver to handle
> this clock. For now only i.MX93 needs this wakeup clock. This patch will
> get wakeup clock and keep it always on to make controller work properly.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Acked-by: Peter Chen <peter.chen@kernel.org>
i've tested successfully the whole series on a custom i.MX28 board
(EVAcharge SE).

Tested-by: Stefan Wahren <wahrenst@gmx.net>

Looking deeper into this patch i'm a little bit confused. The commit
message suggests that this patch introduce USB support for i.MX93, but
ci-hdrc-usb2.yaml and imx93.dtsi doesn't contain the necessary parts.
After a quick search i noticed a separate pending series which contains
these parts.

https://lore.kernel.org/linux-arm-kernel/DB7PR04MB5146920CF37DBF212199C195=
8C95A@DB7PR04MB5146.eurprd04.prod.outlook.com/T/#u

Please keep in such a case: dt-bindings, driver and DTS changes in one
series. This makes reviewing much easier. Especially for a series
without any cover letter.

Best regards
>
> ---
> Changes in v2:
>   - modify commit msg to make it clear
> Changes in v3:
>   - use dev_err_probe as suggested by Stefan Wahren
> ---
>   drivers/usb/chipidea/ci_hdrc_imx.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/c=
i_hdrc_imx.c
> index e28bb2f2612d..ae9a6a17ec6e 100644
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
> @@ -208,6 +209,13 @@ static int imx_get_clks(struct device *dev)
>   				PTR_ERR(data->clk), PTR_ERR(data->clk_ipg));
>   			return ret;
>   		}
> +		/* Get wakeup clock. Not all of the platforms need to
> +		 * handle this clock. So make it optional.
> +		 */
> +		data->clk_wakeup =3D devm_clk_get_optional(dev, "usb_wakeup_clk");
> +		if (IS_ERR(data->clk_wakeup))
> +			ret =3D dev_err_probe(dev, PTR_ERR(data->clk_wakeup),
> +					"Failed to get wakeup clk\n");
>   		return ret;
>   	}
>
> @@ -423,6 +431,10 @@ static int ci_hdrc_imx_probe(struct platform_device=
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
> @@ -504,6 +516,8 @@ static int ci_hdrc_imx_probe(struct platform_device =
*pdev)
>   disable_device:
>   	ci_hdrc_remove_device(data->ci_pdev);
>   err_clk:
> +	clk_disable_unprepare(data->clk_wakeup);
> +err_wakeup_clk:
>   	imx_disable_unprepare_clks(dev);
>   disable_hsic_regulator:
>   	if (data->hsic_pad_regulator)
> @@ -530,6 +544,7 @@ static void ci_hdrc_imx_remove(struct platform_devic=
e *pdev)
>   		usb_phy_shutdown(data->phy);
>   	if (data->ci_pdev) {
>   		imx_disable_unprepare_clks(&pdev->dev);
> +		clk_disable_unprepare(data->clk_wakeup);
>   		if (data->plat_data->flags & CI_HDRC_PMQOS)
>   			cpu_latency_qos_remove_request(&data->pm_qos_req);
>   		if (data->hsic_pad_regulator)


