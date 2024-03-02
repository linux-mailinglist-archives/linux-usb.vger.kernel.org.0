Return-Path: <linux-usb+bounces-7436-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C40886F1F2
	for <lists+linux-usb@lfdr.de>; Sat,  2 Mar 2024 19:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5F3F282AA8
	for <lists+linux-usb@lfdr.de>; Sat,  2 Mar 2024 18:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C1036AED;
	Sat,  2 Mar 2024 18:46:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0853512B80
	for <linux-usb@vger.kernel.org>; Sat,  2 Mar 2024 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.254.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709405193; cv=none; b=WGUXvraENP9Q0HZ19RGTBwzNWmtUisxloZQu9xom9kstQnwJ1EkhzgRQMiTH6wVYe7P1Zs+g1PhRGEMomyzKEZwlzlnczDqXPDGhAtI/cA+XuKhdsO1Fv8PWFB2NgyHTHVaYE0+R86EY92E7wdsDyBohrFOqb0VWIKTOOKmmtNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709405193; c=relaxed/simple;
	bh=ozjaB3jCmim+JTKyCZ/nHpMyry5eJz1C1R8Vij0hwZc=;
	h=To:From:Subject:Date:Message-ID:References:Mime-Version:
	 Content-Type:Cc:In-Reply-To:Cc; b=Woa/NJZWXWjFZka0yBGO071XYt2OGzgy8+WeW5bg6pVTchGV0QrorP2EvqJYN4Red1+g6AXrJa4AQab6E90IMHkUKl60+rK8VJlHqOjs621NPHH+FwlxI6Zrdy78Tw7oTHo6mtoF+TlSyKFI+l3UthI20w3V7/VexKoXO8kuXgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=m.gmane-mx.org; arc=none smtp.client-ip=116.202.254.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.gmane-mx.org
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <glug-linux-usb@m.gmane-mx.org>)
	id 1rgUIT-000AHJ-Sk
	for linux-usb@vger.kernel.org; Sat, 02 Mar 2024 19:41:21 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: linux-usb@vger.kernel.org
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v1 1/4] usb: ehci-exynos: Use devm_clk_get_enabled()
 helpers
Date: Sat, 2 Mar 2024 19:41:11 +0100
Message-ID: <b7eada8a-6faf-4840-a995-f5fce98bad47@wanadoo.fr>
References: <20240301193831.3346-1-linux.amoon@gmail.com>
 <20240301193831.3346-2-linux.amoon@gmail.com>
 <3d1c7682-d163-4bcf-bd41-d7db0c8f61d1@wanadoo.fr>
 <CANAwSgR0aQ7nt1y5xknvVjHSnfvTaC8JZMLWurb8z2D0Oxg6Rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla Thunderbird
Cc: linux-samsung-soc@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org
Content-Language: en-MW
In-Reply-To: <CANAwSgR0aQ7nt1y5xknvVjHSnfvTaC8JZMLWurb8z2D0Oxg6Rw@mail.gmail.com>
Cc: linux-usb@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org

Le 02/03/2024 à 17:35, Anand Moon a écrit :
> Hi Christophe,
> 
> On Sat, 2 Mar 2024 at 21:19, Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
>>
>> Le 01/03/2024 à 20:38, Anand Moon a écrit :
>>> The devm_clk_get_enabled() helpers:
>>>       - call devm_clk_get()
>>>       - call clk_prepare_enable() and register what is needed in order to
>>>        call clk_disable_unprepare() when needed, as a managed resource.
>>>
>>> This simplifies the code and avoids the calls to clk_disable_unprepare().
>>>
>>> While at it, use dev_err_probe consistently, and use its return value
>>> to return the error code.
>>>
>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>> ---
>>>    drivers/usb/host/ehci-exynos.c | 30 +++++-------------------------
>>>    1 file changed, 5 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
>>> index f644b131cc0b..05aa3d9c2a3b 100644
>>> --- a/drivers/usb/host/ehci-exynos.c
>>> +++ b/drivers/usb/host/ehci-exynos.c
>>> @@ -159,19 +159,12 @@ static int exynos_ehci_probe(struct platform_device *pdev)
>>>
>>>        err = exynos_ehci_get_phy(&pdev->dev, exynos_ehci);
>>>        if (err)
>>> -             goto fail_clk;
>>> -
>>> -     exynos_ehci->clk = devm_clk_get(&pdev->dev, "usbhost");
>>> -
>>> -     if (IS_ERR(exynos_ehci->clk)) {
>>> -             dev_err(&pdev->dev, "Failed to get usbhost clock\n");
>>> -             err = PTR_ERR(exynos_ehci->clk);
>>> -             goto fail_clk;
>>> -     }
>>> +             goto fail_io;
>>>
>>> -     err = clk_prepare_enable(exynos_ehci->clk);
>>> -     if (err)
>>> -             goto fail_clk;
>>> +     exynos_ehci->clk = devm_clk_get_enabled(&pdev->dev, "usbhost");
>>> +     if (IS_ERR(exynos_ehci->clk))
>>> +             return dev_err_probe(&pdev->dev, PTR_ERR(exynos_ehci->clk),
>>> +                               "Failed to get usbhost clock\n");
>>>
>>>        hcd->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>>>        if (IS_ERR(hcd->regs)) {
>>> @@ -223,8 +216,6 @@ static int exynos_ehci_probe(struct platform_device *pdev)
>>>        exynos_ehci_phy_disable(&pdev->dev);
>>>        pdev->dev.of_node = exynos_ehci->of_node;
>>>    fail_io:
>>> -     clk_disable_unprepare(exynos_ehci->clk);
>>> -fail_clk:
>>>        usb_put_hcd(hcd);
>>>        return err;
>>>    }
>>> @@ -240,8 +231,6 @@ static void exynos_ehci_remove(struct platform_device *pdev)
>>>
>>>        exynos_ehci_phy_disable(&pdev->dev);
>>>
>>> -     clk_disable_unprepare(exynos_ehci->clk);
>>> -
>>>        usb_put_hcd(hcd);
>>>    }
>>>
>>> @@ -249,7 +238,6 @@ static void exynos_ehci_remove(struct platform_device *pdev)
>>>    static int exynos_ehci_suspend(struct device *dev)
>>>    {
>>>        struct usb_hcd *hcd = dev_get_drvdata(dev);
>>> -     struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
>>>
>>>        bool do_wakeup = device_may_wakeup(dev);
>>>        int rc;
>>> @@ -260,25 +248,17 @@ static int exynos_ehci_suspend(struct device *dev)
>>>
>>>        exynos_ehci_phy_disable(dev);
>>>
>>> -     clk_disable_unprepare(exynos_ehci->clk);
>>
>> Hi,
>>
>> I don't think that removing clk_[en|dis]abble from the suspend and
>> resume function is correct.
>>
>> The goal is to stop some hardware when the system is suspended, in order
>> to save some power.
> Yes correct,
>>
>> Why did you removed it?
>>
> 
> devm_clk_get_enabled  function register callback for clk_prepare_enable
> and clk_disable_unprepare, so when the clock resource is not used it should get
> disabled.

Same explanation as in the other patch.

The registered function is called when the driver is *unloaded*, not 
when it magically knows that some things can be disabled or enabled.

CJ

> 
> [0] https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk-devres.c#L75
> 
> I have also tested with rtc suspend & resume and did not find any issue.
> 
>> CJ
> 
> Thanks
> -Anand
>>
>>> -
>>>        return rc;
>>>    }
>>>
>>>    static int exynos_ehci_resume(struct device *dev)
>>>    {
>>>        struct usb_hcd *hcd = dev_get_drvdata(dev);
>>> -     struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
>>>        int ret;
>>>
>>> -     ret = clk_prepare_enable(exynos_ehci->clk);
>>> -     if (ret)
>>> -             return ret;
>>> -
>>>        ret = exynos_ehci_phy_enable(dev);
>>>        if (ret) {
>>>                dev_err(dev, "Failed to enable USB phy\n");
>>> -             clk_disable_unprepare(exynos_ehci->clk);
>>>                return ret;
>>>        }
>>>
>>
> 
> 



