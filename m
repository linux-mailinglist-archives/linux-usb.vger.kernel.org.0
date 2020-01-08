Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8775134489
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 15:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbgAHOFT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 09:05:19 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:30435 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbgAHOFT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jan 2020 09:05:19 -0500
X-Greylist: delayed 18319 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 Jan 2020 09:05:18 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578492317;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=PLwn9kChIZmxx3YPMhZkYMPPrY48twinHvUHVfRgLOY=;
        b=Y/w0WngwBCp7SNcoc/kFsrCvkdO/MdNOjZmXUA83EHXccYqb9PowGFqbJIha2Xf/D0
        er8/bvkNAwrX/DMcpZ1AEqMkGB8gF+yP/Tt/ogaOu3NVI7Wwl5whvDaZs2jAqg7oW8Qn
        AM1D0NyAl7o6YdvsQYRN0GUf1tyIVLn3QnygSadC1OPJBFelwOQASuCF6D5Rwy+DprKk
        XBpfh7hHdU6IsLoQzCUsJ/puNk2lIhFnYTMeVfUs4O4geYWxDbIflYuAVID4/NK4ZBW/
        VAK7Gx7iwJDt5/U/mAFhRPCdDsWvchrAOiEqnNeVjdaPsiD9SM19DLWbC05M4PSuz6B0
        V0Fw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDleVXA0PuFc="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.3 DYNA|AUTH)
        with ESMTPSA id a09dafw08E2AfoE
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 8 Jan 2020 15:02:10 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [BUG]: usb: dwc3: gadget: broken on OMAP5432
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <7daf64ba-7efb-e2f1-a449-f5f3791a3c8e@synopsys.com>
Date:   Wed, 8 Jan 2020 15:02:09 +0100
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        "kernel@pyra-handheld.com" <kernel@pyra-handheld.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8E70227F-28DB-4C38-9EA4-FB5B0260C88F@goldelico.com>
References: <703DD239-8E3B-405C-A531-FF7DEEED38DC@goldelico.com> <7daf64ba-7efb-e2f1-a449-f5f3791a3c8e@synopsys.com>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

> Am 08.01.2020 um 10:06 schrieb Tejas Joglekar =
<Tejas.Joglekar@synopsys.com>:
>=20
> Hi,
> On 1/8/2020 2:29 PM, H. Nikolaus Schaller wrote:
>> Hi,
>> I noticed that the usb ethernet gadget driver is broken since =
v5.5-rc2
>> and 5.4.4, but only for our OMAP5 board. Our OMAP3 boards work with
>> the same tree, kernel binary and user-space (Debian Stretch).
>>=20
>> The symptom is that I can see the interface on the host PC being
>> enumerated and IP addresses etc. are set up. But a ping in either
>> direction fails/times out.
>>=20
>> After inspecting diffs I found some changes in dwc3:gadget
>> and indeed omap3/twl4030 uses musb and omap5 uses dwc3.
>>=20
>> Reverting
>>=20
>> a7f7e61270f1 ("usb: dwc3: gadget: Fix logical condition");
>>=20
>> on v5.5-rc makes it work again.
>>=20
>> BTW: v4.19.90 works although it includes this logical condition fix.
>> So the real difference between v4.19 and v5.5 may be elsewhere in
>> newer kernels and only be revealed by the patch.
>>=20
>> If important: my setup is running with USB2 cable and speed
>> only.
>>=20
>> So please check this and other recent dwc3 patches for introducing
>> a stall of communication.
>>=20
> Another gadget driver issue was reported by Thinh after my fix, and he =
has submitted a patch for the same. You can refer the discussion =
https://patchwork.kernel.org/patch/11292087/.
> Can you check if that patch works for you ?

Yes, it does!

So you can add my

Tested-By: H. Nikolaus Schaller <hns@goldelico.com>

if possible (I can't reply to the original discussion).

Would be nice if you can get it into 5.5-rc series and 5.4.y asap.
=20
BR and thanks for the quick response and solution,
Nikolaus Schaller

