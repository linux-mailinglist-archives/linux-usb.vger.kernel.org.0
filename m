Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8381C653A
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 02:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729594AbgEFAxR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 20:53:17 -0400
Received: from sonic313-14.consmr.mail.bf2.yahoo.com ([74.6.133.124]:33685
        "EHLO sonic313-14.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727989AbgEFAxR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 20:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1588726392; bh=DPYuw2gUpgtMJzJhlH/AVmRGu2wSKCY1C+f8nOCoxu0=; h=Date:From:Reply-To:Subject:References:From:Subject; b=BvPDlB60t1DIdugVTPxURrp0cnMw612SMLeKcao36zj5qrsaxrR96Ata7ddC+sKor8LqZQryOaqXFynVRGC8pVxteB5QPRxCmHNxhQY5K7Z5r45RfSwAvrORjaWhXU0U0Ecmg2qpSioqrsdRjwxRfxvtOraeaCsCmqwbE+3vy+pukRzSzq5/K9RjXXL9m6aOku3EyuJen3Ct+9vvv4C2IizHRJDE0gVgqs3qDSFelQaPFReY3P2+Uwn654scYBEUB9Zm7osrs43tirVs7GkncGDOcmmwRVVLDpGD0gjLGd7YxCOH7jS85gH2dZMQ35UJWxtYLmUUjrU3wIqE8uf8OQ==
X-YMail-OSG: Gtnjz44VM1m4VNYxbSdli3WTSGXw30M.j81VzinHPq4p4ezwHD2FI.5KoCj7sgk
 Hhie_SXRHO6kZCdoueLl1AfT1L2yOFbHH.fe3Mfw_tJ9EavqGX4dIQc1cEWwhC2XWxf1FqBBF264
 JE_mEkVFJaBzDfR9rh_yBMXcph3BLP_YN8iwDTbfFlSm4LsMPhQQ7aTdPMkCPB_T5KDFb7cU66Zg
 siK6sBRnnGsR3Xe37bCIIG6vGIZAixlAB_FQCwqLU5UQJ.Anmc83ZDtqZPyCEoSaNXd7vAlwDOve
 NSoct6TqGf096cru2xfr5KjxA.Uo47f5_u6qCI6IZ.kgM5L2jsvEhCwhw2u.nj0p3Uuf8tWeU3Zs
 pY7lCEXwfgPg6_hYkWE4lGMcApCcRZHQyWCa7n91oa6OYgM7y8a4WawsXnuktezb8rJ4kyLQRDXk
 l_trbmrv_owXkPWH9nwJ8uCAn4M5rsbnY94K078W.ovumg1n9_gr30sWuakONnCcuJL7Pb4e7nTM
 wyiAPt7z6LMZ8vFwVKmiXxIq.YvgEXYpQvZbpL_OUKah7nQLeXpHt_O6SL.C.vBrc3IRJnoyRMcJ
 0B4fCZD.5c_h1WWKAPsEeq6I3.X8GVjC095_tMBCZEq3Kz4FKfI65fZbQcSgN6Xims07gALQeAOX
 Dl4Ru5P_K977r3JKCgOlzhHNa2BYkThkm4j9YPDQ8yikBkpcuUTNqXCcaeiox7Nf1gDW1q7S7sRu
 AU1ci8Nm5wcQA8f09OMV.d2nbz2wEwyhduVoejoti936Obbz0AfFQDRIKG0PY3YdLD5CjejvqQZZ
 Hp8wnY2WszDKaFPZvPGUPoHZAjy9dpioFsMdKzgfYawPQ.JxNQgH0njf9jcmiqhIPlfZvNgjGjfb
 UMF8Oa5bBDEeAKNetDOUkmE8d.fq2rigsgtIvuqXU76MRzEUv1rB_UK72BUIjl4S4jgvS.rgggiG
 vxL7vqOVK9d.DjyWimjQngE3sUgIQTol.FvzQ_tpbIAgPY_5cdkQugZkXS0Sd2XPLsnAWVwr39k8
 lYRRFLT97GpA7Q_0NDNG9yUCZdjq83gYyxE8cLEsb66_0dWqr3PpJD63WPXCI2d0.BqXkYOjxd.D
 c7POb1ro8zviUPUr1nofVqQkWWGZqxCDp_udoATCu5KHsr9mW2iZENYhfrRhDjhSLS.1ZkXiaWhV
 0jOYZ5gBQZeOiCgh1LvyAQj8WVOdFjj5aAPzXvZ7HAehNmE_7YKKlSQ08EIYFpssDVzJCDVbgOKa
 nm19Mij.EPGnpjDrnIlU8hBeikG6ZNt_JyjNanwM30ryMAz9N55Aee892l7LC.lIHkAUAGS6kxw-
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.bf2.yahoo.com with HTTP; Wed, 6 May 2020 00:53:12 +0000
Date:   Wed, 6 May 2020 00:53:11 +0000 (UTC)
From:   " Mrs. Mina A. Brunel" <mrsminaabrunel2334@gmail.com>
Reply-To: bmrsminaa232@gmail.com
Message-ID: <1363280744.1300965.1588726391833@mail.yahoo.com>
Subject: My Dear in the lord
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1363280744.1300965.1588726391833.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15756 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



My Dear in the lord


My name is Mrs. Mina A. Brunel I am a Norway Citizen who is living in Burki=
na Faso, I am married to Mr. Brunel Patrice, a politicians who owns a small=
 gold company in Burkina Faso; He died of Leprosy and Radesyge, in year Feb=
ruary 2010, During his lifetime he deposited the sum of =E2=82=AC 8.5 Milli=
on Euro) Eight million, Five hundred thousand Euros in a bank in Ouagadougo=
u the capital city of of Burkina in West Africa. The money was from the sal=
e of his company and death benefits payment and entitlements of my deceased=
 husband by his company.

I am sending you this message with heavy tears in my eyes and great sorrow =
in my heart, and also praying that it will reach you in good health because=
 I am not in good health, I sleep every night without knowing if I may be a=
live to see the next day. I am suffering from long time cancer and presentl=
y I am partially suffering from Leprosy, which has become difficult for me =
to move around. I was married to my late husband for more than 6 years with=
out having a child and my doctor confided that I have less chance to live, =
having to know when the cup of death will come, I decided to contact you to=
 claim the fund since I don't have any relation I grew up from an orphanage=
 home.

I have decided to donate this money for the support of helping Motherless b=
abies/Less privileged/Widows and churches also to build the house of God be=
cause I am dying and diagnosed with cancer for about 3 years ago. I have de=
cided to donate from what I have inherited from my late husband to you for =
the good work of Almighty God; I will be going in for an operation surgery =
soon.

Now I want you to stand as my next of kin to claim the funds for charity pu=
rposes. Because of this money remains unclaimed after my death, the bank ex=
ecutives or the government will take the money as unclaimed fund and maybe =
use it for selfishness and worthless ventures, I need a very honest person =
who can claim this money and use it for Charity works, for orphanages, wido=
ws and also build schools and churches for less privilege that will be name=
d after my late husband and my name.

I need your urgent answer to know if you will be able to execute this proje=
ct, and I will give you more information on how the fund will be transferre=
d to your bank account or online banking.

Thanks
Mrs. Mina A. Brunel
