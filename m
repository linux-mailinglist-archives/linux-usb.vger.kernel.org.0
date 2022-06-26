Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08CB55B3F1
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jun 2022 22:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbiFZUDD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Jun 2022 16:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbiFZUDC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Jun 2022 16:03:02 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AB1241
        for <linux-usb@vger.kernel.org>; Sun, 26 Jun 2022 13:03:00 -0700 (PDT)
Received: from [127.0.0.1] ([86.151.31.128]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.163]) with ESMTPA (Nemesis) id
 1M2OEw-1o4zyB1Diw-003yEi; Sun, 26 Jun 2022 22:02:49 +0200
From:   Darren Stevens <darren@stevens-zone.net>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
CC:     linuxppc-dev@lists.ozlabs.org, oss@buserror.net,
        chzigotzky@xenosoft.de, robh@kernel.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org, shawnguo@kernel.org, leoyang.li@nxp.com
Date:   Sun, 26 Jun 2022 20:49:11 +0100 (BST)
Message-ID: <53ac873c23e.3ae9df00@auth.smtp.1and1.co.uk>
In-Reply-To: <947e4583-fe0b-b8af-61b3-2d120357727c@gmail.com>
References: <20220625214151.547b3570@Cyrus.lan>
 <947e4583-fe0b-b8af-61b3-2d120357727c@gmail.com>
User-Agent: YAM/2.9p1 (AmigaOS4; PPC; rv:20140418r7798)
Subject: Re: drivers/usb/host/ehci-fsl: Fix interrupt setup in host mode.
MIME-Version: 1.0
Content-Type: text/plain
X-Provags-ID: V03:K1:SfjM5pV+pCrwIfqqWLt5BucTGFsV7UlQ9sOJsi9ctwNRtha6p6J
 jzxbYOU7vl8B+GSK6glrIIwUq3zjjXVSab/KFFYaOXKS2X6JyDR2WCFkygAguW6+ZE/EHxw
 Hb6lpr/xPB1M0B1X37T7YeSt7dSxZvoeMVaj5Pqku6YJfp7k+NJRL++sYrMV+Es5BnjKiV6
 NhmjV7uHikGIfOL43TjMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0HwNF0z0VZ0=:VXyehQB/rnX0e7HElsbuyk
 WRuGiGxVWf7JU0F9UjAU6whPCj0cC6NDWqUOBsOUZPRx3S7QE5bL9yWuVTYybzRfc2oICqDBW
 PWiJOU1xZcYxuDvbH3+7oMJQqnLhSUXAZ9BDFaVyXnG3ObfLQI+DjdoCecOhpuxBf9SglCyZs
 PmA0YQsBQrNgfZTh/ubxw5cOB+0J18aPPxW3qmy3pu1Vy/OZM3VO0EqSlCjKbksVMeSlBiNuW
 PluFD77fPAXp2dGHabqAXBzl0906B5fOTv9dnSO6KwbQ9XmXsBrWTCuUaqH+sQnt9hQqwaHRB
 dinM+Dg2ZxxXoHC2ui0wWHUFcdV4JsCjT6TU4ptOLkuIJFPhxp7vnpEiAghuHxsSMkFaPuXkF
 bVLoN3BJxrr+JDxT8Kd739ZgvgK7f+9rh+QSvg3JvpAEgc8GS4yfll7CDh2Q9TY+IoKxMOiCA
 4FSeZXX9kGZU35Ej29oT3CSjgRYlD2WPu2MsK5PF0z6oQz3oi2aJcWbmLEgyisK1Ta2smOJk3
 DMcsbTew8KD0QUdkRqn9CnAG68c+89z+BUNhgAjzqFb1w/glyQPyAQ+fs4978RgFaage8feIf
 fTEblJVAbL6esH0lY9XKOMAe6QFlXFQQVKqY2aTfgoEOF8BGvo+OS/Mpcn+81ejHZZQc9l+yS
 ioRxL/Jnfv2lRt727FGHMi8s6zi4X8mo7YHBhW9Q1KUFaJn30zu3zaIaWPhfiazrS9qWejFaT
 gX+ikblbHoBS8E8SZShQIN9t5plEg9oseWJDWTRH5W4dIOEJMfPtdO93tPk=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Sergei

On 26/06/2022, Sergei Shtylyov wrote:
> Hello!
>
> On 6/25/22 11:41 PM, Darren Stevens wrote:
>
>> In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
>> core) we stopped platform_get_resource() from returning the IRQ, as all
>
> In commit a1a2b7125e10 ("Drop static setup of IRQ resource from DT core")
>
>> drivers were supposed to have switched to platform_get_irq()
>> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
>> it. Also fix allocation of resources to work with current kernel.
>
>    The basic rule (especially for the fixes) is "do one thing per patch".

I thought I'd done that, this is the minimum amount of changes that fix what changed in the specified commit. 

> [...]
>> @@ -92,15 +89,18 @@ static int fsl_ehci_drv_probe(struct platform_device *pdev)
>>          goto err1;
>>      }
>>  
>> -    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -    hcd->regs = devm_ioremap_resource(&pdev->dev, res);
>> +    tmp = of_address_to_resource(dn, 0, &res);
>
>    Hm, why? What does this fix?

With baseline the mouse and keyboard on our machines don't work - dmesg reports no interrupt. Fixing the interrupt detection throws a 'invalid resoure' error instead (No idea why), which these lines fix. Both problems disappear if we revert the 'fixes' patch.

Hmmm, perhaps title shoud be 'fix resource detection in host mode'?

Regards
Darren

