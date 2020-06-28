Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE5D20C844
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jun 2020 15:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgF1NnY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Jun 2020 09:43:24 -0400
Received: from mout.web.de ([217.72.192.78]:58559 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726344AbgF1NnY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 28 Jun 2020 09:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1593351792;
        bh=0LadQBb13X/BzAtdiFvRhyr4dZfLGKtUESMf8u5ROZ0=;
        h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
        b=qpsbZ/oO/qptFmdyW3lNrHlcFQJHiOSnNH1C3Sc0XgaCrTQTTYMZZ6QJnf2fTfbZa
         r9vVHTl/2EXJh98ASoNIvGllvyE0hGof8XzU4G3cp7zXJdNwqp278SAdrI8vu0cUDV
         GAvvkcWk4eAF/we58bYr6Dp2zCkwJ19vPFj23JEA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.52.166]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lm4hJ-1jGTx313Mf-00Zh6A; Sun, 28
 Jun 2020 15:43:12 +0200
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] usb: gadget: function: printer: The device interface is
 reset and should return error code
To:     Zhang Qiang <qiang.zhang@windriver.com>, linux-usb@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <37bf94a0-92a0-ca4e-a4e4-5dd44aef2b88@web.de>
Date:   Sun, 28 Jun 2020 15:43:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LI5UJ+zbj0bYeixBvXbqedE20bBiAwlUnEyzNKfPU1yvFHAfqLj
 7JrwblEIs8X0biK/YJy6v+4aFboXlkLoIe1kwBwNuIMSUEdfELH2k9hiFsAxCwmhrkA1Cfi
 XFZ42fMdWPPJXOvpl6D0orgjYxDToNev2MmSqybmtlIZjFmNQyO787XuFSDwGrqKPx+0bIa
 n5yCibiPgTCR7ZzcTtAwA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gwTutKXcGzM=:bUsHMNV99XmAt5XnGKYPh5
 F3dMQoIQAR3Jle55l7tev8pR0A0H0v4stT46YitkO+cNMLTntIr8Kr4bcKEx1xZ/LTB0wdhaV
 MaDAoaQnxA7ig8P+IvZyY2SF1RSUtI5usmZvtxIX0q/qTv+LhyUEtDHr4X7ZF+gjkaP4F7+/J
 EU6Cc6mbCcJbgqViQw+uP88cuXrbcYr3JyoWdMs0T1hZ+6OzTd+cyKGp0X7/beKzHWf1NTAc0
 OjLXMCPYVsgtNAbvCOTmsXpLo2H45HZvPIsj1EXeLSsnRliCmuVzbP76S4hlJtiNl0xV+4a33
 eG2zbnhJmdwWXfHg0D5TarFNWRN0whArvlBOJJ6s2JmpnNutxlzbIoZ44hof8IyP2TpIW2oW6
 xKCQL8zCSmhOwTs6FESk/iq7dWwGZzyyfZ6MgKf4IDf70+uomGT3jalTWbZyqVoV77nkn0kTk
 oyI9ggxqpM+iqf5wOO0ZmlCl0EPgqHbt/JU0sOexzcUZUCbS4NA79/u4I5jm2A2TXlplfJWvu
 M+Ut6wtMw1HbK/Isqf6DMDIbPMNVz8pIjmR9DXJJxCaUF3eRLcdHSBexASRDyDtzhG3H3jXjO
 SJownnuXUKu8U5hSmFFXNIg9wQOWvkp7gDCRHOsjfoKCU/t/7wl3PyhG0BGCVjHlJslORfJYN
 SJjJ9dIcAR2pnApgwCjgtv30vVCgLimRb1ExMGGZCA+ehJev7bBF2fPPdvNBEnPCtL5krE+Am
 PqSW21/8VV24+FhyNZLF4NE9jUWAdn9QHJgjHcA8PLlm27TVZ8ngO+7CiE/UigsN42DTWe4qc
 FVR51ypSfZnt8y3zztaOfHnm0RoSlP7Uzo9v7Esn4piqp1q4WvljcfjPnkW4La8607n5610se
 bZrNT1XT6rmdpXr3uYfQKaLQF0rB4HAh34hJyI30sVaqrRmmbR/yCZFRuU3+8306crzPom5Cd
 qlrN1NclLRgzysNVsoVI5U8SzhrjZpA+3EA6uvHwNdtZzBNa1J77e4mn2TmYMlyPqE8RQ3Yal
 9NL4buHehzLfGGXn2opZJkl2MhPldI3ktSmtILpa7d1EV2JjaXQ8oOE1PIxenhbaHKVLgI4mA
 +eVrWQ4sS/ZC5qNU0DzwnGzsnsxaHxI78Vjzs+FbFW5H72NU6UxR4FXrLOYmOd1FyPV+60K0w
 T7eutt+bQJ4vrVQUJIHOUr87QAWu9FmQb4qSxhSBFIyguDmcr3Ssv/Bmcgh+4ds43gC0clNUI
 JkbYuxzY/eIo64kwt
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I suggest to choose a more succinct patch subject.


> After the device is disconnected from the host side, the interface of
> the device is reset. If the userspace operates the device again,
> an error code should be returned.

Please use an imperative wording for the commit message.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?id=3D719fdd32921fb7e3208db8832d=
32ae1c2d68900f#n151


> Signed-off-by: Zqiang <qiang.zhang@windriver.com>

Did you really specify your real name here?

Regards,
Markus
