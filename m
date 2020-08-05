Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4AC123C2A0
	for <lists+linux-usb@lfdr.de>; Wed,  5 Aug 2020 02:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgHEAfm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Aug 2020 20:35:42 -0400
Received: from sonic308-19.consmr.mail.ir2.yahoo.com ([77.238.178.147]:42098
        "EHLO sonic308-19.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725950AbgHEAfm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Aug 2020 20:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1596587740; bh=+NKq2YP/4c3bLm2HmGhxa/KCZOXr0NIUKHs/ECuC0yk=; h=Date:From:Reply-To:Subject:References:From:Subject; b=ltwSKq8oDViD0acvNF8NZgcxPUh0DQyfwqRqZwHlTCH8Qk3iPI4CYr14mivS9WhA8T7q8iAni4rwv3W+ZidLH8oTm0xwkDBCXVebh0bjt07tHf0sJQEjAp9+FKdmo3h7mMzp1B/u/eOUg4iGMHNg/1VwhuywzKPGyryNcxUWexrh/ndH0N+S7+oCqv3FPLLzIGia+Nt9uX6xhTPUvRsQGIAfVg4M+AD6uIxeHsCp4OLSL2m5tAU9ZaaDhuDyOhAyROnQ5KtAnRH0NmGYZr18XpX+xS4K0IaxUKq5PUT/c1y9PWikv6sDrxyG0hdGAnAIayd3Ok4s9exUtqctgP2JEg==
X-YMail-OSG: jzEbQ_4VM1nXjBmiW26r9K5hP5ZjnxUJgEQnEpICdfX0WNXlD4S5_IDo1TaNFYy
 xMrBNd_xlBzwwTrydnrErhbZYXpfVqBYCqZZLsCteGGuqvutMh99Is2LEbtL2GknzBMJgl7iwVth
 atZ8lO8WSZTy_lsfeAnggizm4xQ.Kic1I3._pNlyLpwbqmpDG1RwTQAn70oV4XDgm7amcjCIaOPt
 goREm3hF.V.VaPiLau_3Wrj.VTR4KrxN1QFD4PBHihA3Ri2QH12gIucKmqS4t9_DF.L2XcZd6maU
 cBOJ5P3J_UebXJ1ZKmbz9Bm1FOP94MoYnVZ0AQnp2dKBWikwkG1cqYAKYo__2MlDpu2U70rvlTqU
 IZNocOOw1EyaBcb.7pIIzXwoIv5.cxoqOy.3G2czJd.WddbeXea.9D.MF.9Wjalk1nrRHctfB8za
 gNO1vz1BnaBL6fDUvpwr._8eb3NukMAdgRVt_d5EX95awoJEPl9TYJHel0E5WU6e0y7JkmCd3s6v
 xRX9O64h0VUxdj9vg3wdOgC7r70KcVNbHI9XlOKFibj1APjDSx6OBoxMxoSnYl9b7zNLOg5A0Izo
 yDBn8e2T_zCOTdOmn06aN3M9F1L7XpiAUpNLanuchlW8uoq5VGA4pOq.TLiYElEZBXzDmP3yHBfh
 W1Fih92vy9uCQoEXEgdhviJ91Tt.CW8gQPkrXMJWMPJhA8O2Vkr2W.ylBa5H0wsDKxD1Fco.6vvG
 Jv0.Rn6OR8SJNzDhTp8s1N7T4abmscWrK0wLK6A7y3FdTdpO4kI1i_U.plNHNVllVIx00z2WIhHK
 tS4..fMkdpbi2tnFGUjW84VTCS6DeCny16QzwT2tgigjLcH1mWNb8mbR4P304gr6fEDB050.V3Y4
 NrnUrmXddemaCoPYdeB9ERFDwECEH5nl0PSevg63ZUvs.sRZ.yEe6OzSYo2CGwjENsYs6n8gEXqY
 MTwzzC3OKXt8galAzRVzdU0a_YUdRMeWYaSX39OUopkSxBgLygoR234zBSR0Jd92gTCZ2.Cu51Dr
 hl7kFim7O6gFvad.D0NC356KZjmg50S3HymUefsE7_HAQn9FZUeCjAzi0pqnJhvTQCCcryElH4AS
 bJWfWELIR8iYF88ekit4WeE_ZkNSjaLO2HMsJM_BLTZ.zNFNVTdCtwQRPMupvAZq0gTgywwm3zow
 s2d2YUq2D9XvMncmQKaOJGOh.TY5Z2nPFPsw3mpCclcejTrLl2cewMQt4Trpw8HKDrYI.HqEmwqa
 VzxcXnWIebixRHCP3y0i_Ynkx.3zFEY9xWCe9Bcs-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ir2.yahoo.com with HTTP; Wed, 5 Aug 2020 00:35:40 +0000
Date:   Wed, 5 Aug 2020 00:35:35 +0000 (UTC)
From:   "Mrs. Mina A. Brunel" <mrs.minaabrunel209@gmail.com>
Reply-To: mrsminaaaliyahbrunel1@gmail.com
Message-ID: <954743634.30352.1596587735110@mail.yahoo.com>
Subject: My Dear in the lord
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <954743634.30352.1596587735110.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16436 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101 Firefox/78.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



My Dear in the lord


My name is Mrs. Mina A. Brunel I am a Norway Citizen who is living in Burki=
na Faso, I am married to Mr. Brunel Patrice, a politician who owns a small =
gold company in Burkina Faso; He died of Leprosy and Radesyge, in the year =
February 2010, During his lifetime he deposited the sum of =E2=82=AC 8.5 Mi=
llion Euro) Eight million, Five hundred thousand Euros in a bank in Ouagado=
ugou the capital city of Burkina Faso in West Africa. The money was from th=
e sale of his company and death benefits payment and entitlements of my dec=
eased husband by his company.

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
