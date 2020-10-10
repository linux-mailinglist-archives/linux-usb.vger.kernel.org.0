Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E528C28A191
	for <lists+linux-usb@lfdr.de>; Sun, 11 Oct 2020 00:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgJJVnk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Oct 2020 17:43:40 -0400
Received: from sonic312-57.consmr.mail.ne1.yahoo.com ([66.163.191.238]:43155
        "EHLO sonic312-57.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729192AbgJJSnT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Oct 2020 14:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602355217; bh=ErQnYVlC2pefuSTpOMCm9/XUNMjj9rhfSqCUwkKhF70=; h=Date:From:Reply-To:Subject:References:From:Subject; b=pNY2/PWKCKratMnZkSXfRX2xfIyevA8oq8HzXbaZUdkES45VgNjtG9+1dapPlGC3K0jhuhNr6zIZs94vMWVDt8F6flTju/S9C4duUVT84SSggqbVSZjI0wtgbm0QfNHNwK8ohf9LhPHWZs2HRiTbnT39rBUUODGcaXAeuVEjlZSmgm9en709LYM1UG+niKjTRAiBStmbvJd3oh/qHffOasICXEYmjuBqmcwJGXyTwyIdudD0y11ObeP26Y7FiGjimpdk0pa0F++tYzu58m2dMkslbD02Urn4sYTLOb5us//meJUpoQt2zHo6Qdn4RO4GqwSgnhwOiiW8VXbRJ5wDgw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602355217; bh=c2mW0EZgyPHTy2sl0TU5lsHYiNgrgimBjlykRdbxPnK=; h=Date:From:Subject; b=OvHfRr5mdWeqNCNeEh2HtwewFQkYjAjTz4PkNTLMcRmChvXr1hmpSG238ujmHay7e5lHE+PP3kQHxgoT2a8y01LViCnyfmBWpY0sGyXNH/9JpOM+2UlWPJ1hH4PpEgo8n21yMbWLMBk7a2NZ7sTHoYB8vK0nA44BkH6cGoj+cIRGy/CjfOaecfT4JBxpoi3UekiaUSL9fza+pV3zKTY4+j2SJX3oidzAF+Kx4TRVE59sOgn+P6uACKfPhFhl5YqE1esk8rXhYIq8SkybC/Yj2aJt88D3WC+qiC1SoJO6fgR08Ga0klguMmFhzpFJ1LBhXEIRNCDfe/eJJkou/rv1vg==
X-YMail-OSG: sQAFx_gVM1nZVT7_JfMt0H8jmqRvRV1x_S3Z.ZlqD2pYtB6Q5__Ww6n6p.mQaVL
 iJCb.bf.oqVXVvOnypQpxSti8XbIOQanns4Ej1KtGiH_LTqt4jlznQLbIy8cgYJrWYl1.DtpONRv
 3HJZMYDZV21H5m.1BlJ6GuMUtMUVHcK4145TaqgcaLVbAVucZwyCPg5e8YEAqi5ffEUJ9TUCwOsc
 CPS0CqMX0EjH35HokjiZFeqb4tlUUS4u8C1haD0JIO8Ey7cjQyQuRMbSKe1cXdVLgMgzmr9YfMW2
 r5x5nYe7DW60Q5NErET33Q3RJxhyPS9.OS7YyQH5llNpVGiit0aa.6lZwVoYyIFsPwxR_hnCQtNN
 pRf0My.f_b_pfaOi61FzGDorBOpRx53X7cRn3aGq67FrBuFFNq9Ok_upVEXlAzvxflaSMbF61BP1
 yv74hSlsKqPFLtDUJzIl18.Kpv.PKo1Q7sHn7qQ10TiTnpNdL2gP5h7Q33SD4eK2TU6SDEItxejB
 mCc1tLzMBHwqUeSYDoC4gBa4IYt0lMC2Xz7PcfYeR_9ZIBO9hdW4JAXjeQD1nn3KRVIHX.tUULJt
 Xq5ObcYbLZv73VcqQsVN2_PUrOvuTBnyBcmerUfKe3Bk4F.Y2HZgD3h355pz6Fw4dg2HcOjXSh9g
 LAyL7RuRk7N305.Fx7LFedXnK3tZTqrb33WjtEH96hUTdSsTEQPaI2MZbSTHlIL1i_npe2UIu3FT
 drykBiV_AhvTtGrk64nkzVq8XPGP7Szo0xtpvzEYF3i5MeWfMsUIfSnCvqL2Nhj8Hjk8zQK7gTDW
 y9IZZGQSXGQyZtDB8YLG2T7A3HKpVzjq3XEK1Cn.Ge1rv7xRpKfbn799of5I6VqQt3IEkoUXghL5
 1qnbiSbt4JCEbGS5J.mgpN2W1ZpihddkifKtgdXaZRReXtPmMM8s166hV8Ykg6o6RwSTQsmxcBK3
 dVzbAhpcFxEKb88Roh1a_Sh_8C0Y2MQpJ3aLVhbVqVRlALmF6QJJYRA2qNPt8U0q9FqUtlNscgeb
 qYwrFwDDYm93cSysvItVHGP3oKyNRuRHpQmCZFUGfE0aonLY3VPH9oF479guGZ2oUo57628SAdth
 z_H57TJ3bcQ6BVJv6GsEycIgBb3SthhFRqyNwPAWQ3ZzscJrtz.FrSSGlY5nmF.ywBjj8vUiub.d
 e9BDElRgxBYSUmc3iA54mxj1drpFCDQuTsKhsVN3fv75VdM1URmnWPL1tXLT1teUmpy6uHmBqV3R
 c0qMZsA_O36LsI0Rc7cKAeuPyL5wVu97pACXFR3lx_rnUFUKz4H5Yr3ns6zYEtUwgZNsHFOQQFBW
 pbS_cqNPF6qzm5zWgcFCAF2_UM5wjvNBLsJOoUh7VNYqcwy.5nNDmrWfNiGPHBDJOXguyF1D3qjU
 xes8pttNi4vhF4a1Gaq8iDwKbg3F9pqCodp3vcrORWlYy0WJb.AdstHrKh9NV7M89PNjJRFOTpjL
 F8buUjg--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Sat, 10 Oct 2020 18:40:17 +0000
Date:   Sat, 10 Oct 2020 18:26:15 +0000 (UTC)
From:   MRS ALI FATIMA <webbox7@yckot.in>
Reply-To: samanta123@bsnl.in
Message-ID: <1403898890.133516.1602354375370@mail.yahoo.com>
Subject: PLEASE DEAR CAN I TRUST YOU?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1403898890.133516.1602354375370.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16795 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:81.0) Gecko/20100101 Firefox/81.0
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



From Mrs. Ali Melissa Fatima
Membership in Turkish Parliament Association
Tele: +905356520176
My Dearest One,


Greetings to you,

Let me start by introducing myself, My name is Mrs. Ali Fatima. I have been=
 suffering from Breast cancer disease and the doctor says that I have just =
a short time to live. For the past Twelve years, I have being dealing on Co=
al exportation, before falling ill due to the Cancer of the breast.

My late husband, Dr. Ali Bernard, a Retired diplomat and one time minister =
of mines and Power in the republic of Turkey made a lot of money from the s=
ales of Gold and cotton while he was a minister, but we had only one Adopte=
d Son Name Ali Mustafa, he is only 12-years.

later, my Husband realized through a powerful Man, that it was evil course =
instituted by his brother in other to inherit his wealth, but before then i=
t was too late, I and my husband agreed that he should Remarry another wife=
 but our Religion did not permit it, Before, my Husband died as a Result of=
 COVID 19 at the age of 89, he died in the month of April 2020.

Please I know this may come to you by surprise, because you did not know me=
, I needed your assistance that was why I write you through divine directio=
n, it is my desire of going into relationship with you. Before his death we=
 were both Muslim. Now that I am very sick and according to the doctor, wil=
l not survive the sickness.The worst of it all is that I do not have any fa=
mily members, expect my little Boy but he is too small to handle This.I am =
writing this letter now through the help of the computer beside My sick bed=
. . When my late husband was alive we deposited the sum of USD$30.5M (Thirt=
y Million Five Hundred Thousand U.S.Dollars) with Finance/Bank Presently, I=
am willing to instruct my Bank to transfer the said fund to you as my forei=
gn Trustee. Having known my condition I decided to donate this fund to chur=
ch or better still a Christian individual Or a Muslim that will utilize thi=
s money the way I am going to instruct here in. I want a person or church t=
hat will use this fund to churches, orphanages, research centers and widows=
 propagating the work of Charity and to ensure that the house of Orphanage =
is maintained.

As soon as I receive your reply I shall give you the contact of the Finance=
/Bank. I am offering you 20% of the principal sum which amounts to US$6,100=
.000.00 (Six million One Hundred Thousand United States Dollars Only) and 5=
% will be for any expenses that both of us may Insure in this transaction. =
And another 5% will go for Motherless babes home. However, you have to assu=
re me and also be ready to go into agreement with me that you will not elop=
e with my fund. If you agree to my terms, reply (mrsalifatima67@gmail.com}

My Regards to your Family,
Yours Faithfully,
Mrs Ali Fatima
