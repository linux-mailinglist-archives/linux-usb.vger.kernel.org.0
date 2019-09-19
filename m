Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF05B7449
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 09:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbfISHiJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 03:38:09 -0400
Received: from canardo.mork.no ([148.122.252.1]:37307 "EHLO canardo.mork.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727843AbfISHiI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Sep 2019 03:38:08 -0400
Received: from miraculix.mork.no ([IPv6:2a02:2121:2cd:8241:9043:eeff:fe9f:3336])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id x8J7c5rl030797
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Thu, 19 Sep 2019 09:38:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1568878685; bh=ay4dYHMQO7sBCZiMhLQ5HkGOmId1xSrjVglA5pTZQZs=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=LqkOM+Ha/r/d3276YThq4Fi/BYgzaO548eCNXH/idnVQu1uPsg19+A0FOZDy4Migb
         CNnj02WLulnw4P/WfUNxCbeDc9TyLcDLWj16nV6Pr2RZ/uvPbzXvY6IYstwsrvR+CK
         og00k5SXloPxFeiUZBTfqAupLzYPdut3q/Y4GbYc=
Received: from bjorn by miraculix.mork.no with local (Exim 4.92)
        (envelope-from <bjorn@mork.no>)
        id 1iAr0p-0003li-QV; Thu, 19 Sep 2019 09:37:59 +0200
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     JH <jupiter.hce@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: Failed to connect to 4G modem
Organization: m
References: <CAA=hcWRF00syz8jB1+qdy1pFA7Wk_B=1Z_DT5vYuQrzFKhtZbw@mail.gmail.com>
        <20190917120258.GB489142@kroah.com>
        <CAA=hcWTD2zYD0gVTu6sDuRqUcTOnn42Gm0s1tOGvBQdQ40Q7LA@mail.gmail.com>
        <20190918054744.GA1830105@kroah.com>
Date:   Thu, 19 Sep 2019 09:37:59 +0200
In-Reply-To: <20190918054744.GA1830105@kroah.com> (Greg KH's message of "Wed,
        18 Sep 2019 07:47:44 +0200")
Message-ID: <8736gsivmw.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.101.4 at canardo
X-Virus-Status: Clean
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg KH <gregkh@linuxfoundation.org> writes:

>> >> [   44.059958] qmi_wwan 1-1:1.3 wwan0: unregister 'qmi_wwan' usb-ci_h=
drc.1-1, We
..
>> That was always my thought until I tried kernel 5.1 under the same
>> platform (nothing changed except the kernel version), the kernel 5.1
>> can connect to the 4G modem, I could not tell the hardware engineer if
>> it was hardware problem where kernel 5.1 can connect, kernel 4.19
>> could not, how would you explain it? Seems some differences between
>> kernel 5.1 and kernel 4.19, what I could be missing?
>>=20
>> I cannot use kernel 5, we need kernel LTS on product, too late to wait
>> for 5.4 LTS.
>
> Can you use 'git bisect' to find the commit that fixes the issue?  That
> way we can backport it to the 4.19.y tree for you.

Yes, please.

But if I were to guess based on the above info, then I'd start looking
at the chipidea changes. Commit 2c4593ecc920 ("usb: chipidea: host:
override ehci->hub_control") looks particularily interesting.


Bj=C3=B8rn
