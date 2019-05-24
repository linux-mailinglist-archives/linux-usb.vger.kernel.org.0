Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD76328F52
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2019 04:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387557AbfEXC5Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 22:57:16 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:59699 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387434AbfEXC5Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 May 2019 22:57:16 -0400
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 5CD4A440061;
        Fri, 24 May 2019 05:57:13 +0300 (IDT)
References: <1557311367-5863-1-git-send-email-jun.li@nxp.com> <20190523151520.pa4zkby24cktnvl6@tarshish> <30102591E157244384E984126FC3CB4F639FFEE3@us01wembx1.internal.synopsys.com>
User-agent: mu4e 1.0; emacs 26.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Jun Li <jun.li@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v2] usb: dwc3: move core validation to be after clks enable
In-reply-to: <30102591E157244384E984126FC3CB4F639FFEE3@us01wembx1.internal.synopsys.com>
Date:   Fri, 24 May 2019 05:57:12 +0300
Message-ID: <87lfyw36gn.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh,

On Fri, May 24 2019, Thinh Nguyen wrote:
> Baruch Siach wrote:
>> Hi Jun Li,
>>
>> On Wed, May 08, 2019 at 10:52:37AM +0000, Jun Li wrote:
>>> From: Jun Li <jun.li@nxp.com>
>>>
>>> Register access in core validation may hang before the bulk
>>> clks are enabled.
>> This patch fixes the hang issue for on my i.MX8MQ based system.
>>
>> Tested-by: Baruch Siach <baruch@tkos.co.il>
>>
>> However, commit b873e2d0ea1e is meant to move dwc3_core_is_valid() before 
>> dwc3_get_dr_mode(). With this patch dwc3_get_dr_mode() is called from 
>> dwc3_get_properties() before dwc3_core_is_valid().
>>
>> I guess we need a larger change in the initialization sequence.
>>
>> Thanks,
>> baruch
>
> Look again. dwc3_get_dr_mode() is not called from dwc3_get_properties().
>
> This patch is fine.

Your are right. The usb_get_dr_mode() call confused me.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
