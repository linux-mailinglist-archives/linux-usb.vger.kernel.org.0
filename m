Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9A71A2F38
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2020 08:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgDIG2s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Apr 2020 02:28:48 -0400
Received: from mout.web.de ([212.227.15.14]:55213 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725985AbgDIG2s (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Apr 2020 02:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1586413710;
        bh=vzGyZmhu7KhiyRSWGHoXJeX2DvNFrulgcw8sIGUVe3A=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=BwyB2EC6pKZYEiNuK185wVh9bOnXEwKz1dy3Ns4AJkslIeZ8X831LdtiRPJ+3SqAH
         7JVdxxOAuDA3spb6AWiGfgIph2YyYO1QbwldVgifWeC8CTGbDTC8eGOC0j2E4A3vnt
         YVeD8NzVMOwMjh5A2vYH5qBmqnnLKJ7XshZbxbTk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.133.77.56]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MKrC4-1jMQfu104G-0006ua; Thu, 09
 Apr 2020 08:28:30 +0200
Subject: Re: usb: gadget: fsl_udc_core: Checking for a failed
 platform_get_irq() call in fsl_udc_probe()
To:     Li Yang <leoyang.li@nxp.com>, linux-usb@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <36341bb1-1e00-5eb1-d032-60dcc614ddaf@web.de>
 <CADRPPNRe=YxwjCOYbEjKg4LCOx2suK5WxZp17NJhTm76szdU0w@mail.gmail.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <8fdf250a-8a69-b875-db43-b228db202f98@web.de>
Date:   Thu, 9 Apr 2020 08:28:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CADRPPNRe=YxwjCOYbEjKg4LCOx2suK5WxZp17NJhTm76szdU0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NB1+uHo4faIPWK+eACXHr8PAw28+wETty0g/VeuSBjNava36gVW
 fLIh/OiujhlkhzpGvRJSlVf/ef6site6sNoBgAogb1+upevwIEYbYKCeea8Zef6lvKHfBm/
 PleSAWPpHXf4B4nkNC27laYktVgSHOosLiuDUr01quTJBKmy6bDIHodbAxJ+jD9S5clSR6j
 XbZH0rwjxgQZ9MDzq3ibw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cvMHAWQ4NE8=:EnF7h/03k2w/szNza6C9p1
 pT1K3CbPH2dzfx5uFFIlTk9tPcjkgABL3BwxXAc5p6CF/iq/E6QUInMOerwsBz27D/XfxThVz
 DgrssMkIal/yUMO+gZlHfdE/BBFOXNnUcGKJZMeySfNJOVaWAZOoEO/LcK2+I/dLDxLeXj1Gx
 Av29XUlC0HPfzaL+PtwdaSYivaPox6r697vBUZZqN/ATBjbxGIcRx6QAUB+FFEX+kFNkfukT+
 XB/9nKf6s5ohz89JMpt8I7JFpVSZXxIiqGm2nxnhDn0TqfIf3g7VSs4xwx6eMZZmQusiYtbET
 /0PWAnA150EAJhx0rU50ANNMkF+J4YsvSV3eeThU+v1Xfr51gfDUr2aNGdgRAPCBpyiimUST5
 1/wbqR/xkRUBCuxE5OkJL//UsbGVBjkb1IpSt7i5/XZpDHSFudAwL1hRDE1eNX3uE62LhOMdt
 dHT2ZviIW94qDqHcTLrt62SIUhjbd+9fB7MC672Cq2kVz1vhCNVz91l7XIL9hd+PlLb+MKgke
 oPFbws/EdAX/XnpiBT/RsgoiKXXDLPtrmpBG7NmKKqlLR1fgmaHO+A6ffBzkqTu6x30BURmvN
 9BVOqnzdTXhSyKNT7WFZEgVZ3GqBdkNzEsVDgXHw9QKvvNG1uS4Xh+MwA6Ggbe+sf8hDr94J4
 1smn/PY3TpCmSjTV5xOooEqPdxKzX7NPo0f86HAXPlL5Eq3NhDfNEBscKvGj6Dd/MBxEgsNKw
 L5JwwybvMdRkMnzfgN2HnMzk/deg+HcSk58qMEnpCd1R/0EcoXYDyqRxMS+6raeRNcQQjXvmO
 SaOv3lXLHpcPt/0+bmz1nq/ZSW0R+PD5m6uv7OD/bDkgQbBJe0IlitMY3e8oauky77Dxig21W
 QiWycMKULgCCLdJwcAZpiLCc3oHrlPKoUDUH7x2zdbVTZHoAJFEJgWF86JozXUJmgcHbp3VQa
 jQvv38o9bm8ATpQvOSIbiZ+kjU8mi4myRrhSNcPq9toX7Eas2JaQIyLaxCqJy+3eHhwB/QJ8j
 yvFVIoMWJp02VX6FBFSTZqPv+7jB0enuKnCzyGeUYxZEH8BElUq3nKu56kdSafqfagZRkU9DC
 tg55KnhHClm0u9gOyDvIDTDuthObE9f1aO7Dq72XnqwHKzgbzYS4QVUewuSZKmpb9V6KzFCEx
 BFtWtNss+iEFQcJZSE/Gb4j8xhk8AFjvwIcFQ71VkM7Y48QwKIv/2nGXeOh4IR3727dE6Jgih
 FaUBPH93J+BXQgpZ7
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>> Would you like to reconsider the shown condition check?
>
> Thanks for the finding.  This is truly a software issue that need to
> be fixed.

I was unsure if I noticed another programming mistake.


> Would you submit a patch for it

Do other contributors know the affected software module better than me?


> or you want us to fix it?

I would find it nice if another developer will convert the bug report
into corresponding improvements.

Regards,
Markus
