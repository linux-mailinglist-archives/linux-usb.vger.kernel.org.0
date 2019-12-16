Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E99F5120F71
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2019 17:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfLPQ3b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Dec 2019 11:29:31 -0500
Received: from sonic309-14.consmr.mail.bf2.yahoo.com ([74.6.129.124]:34816
        "EHLO sonic309-14.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726180AbfLPQ3a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Dec 2019 11:29:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1576513769; bh=DOqWrmWu+W/KYtKDjlRQpFhjO+zjISRSE9Z3sCAfAt0=; h=Date:From:Reply-To:Subject:From:Subject; b=kJFg55Qx95MEwEWPU4ATmSTXZgE2safnYu+yG2a+iGr3rTp9gyxrGy7Re5APmEPkd98/sKlTjFXrBZgAeASBBkobsxks9bKUgtEJGSXYO3Pene5wZ0vNjqgHPYDtIg87hZJVMdiyIj3If4iEgbjsQgFN+lLTOYD92j/1BIoAkcRuJ9vsVOq79WGeSSZ/pTM41x7dFec1OmxG8U1wk0WQHgiLdshsLfVhAiMxqH29Ju5ezTtzStmkY+NsmUx/twiNLSFFqQS/8FF1gwN/oWbetqeeF0jKbd93GkSbjY/tdg4u7yWPbvL58BVnhwPpZAs/gacChtmwVM5PeMitvdO/8g==
X-YMail-OSG: qgDgOUEVM1kn.vuEHnOM0yGHIUZvoyvyLTmywVQUVT40nmsQr6cN_tM8Y05jFqx
 aytAvnfJH2MdqsdGV4yHql6XjlN9vn.3p5AdlROGavEyV2ZyOtA8KUKWsqvFWpaWRQA2JfzGkXQx
 dZ9yUyqPlU9gTxbuaubBzFS1rw8MCapPSloV1iZf.3Jj_mH322yTEL..yX5OVUd5OLUYBjxuOgBo
 RD5vQU.dva0koqlDUVOJArLjUQrrwmZkbXgzsiq0BU5IWownLxJgEj1u4tCoSZsgI7LJNvXxTLBa
 PEdGfZarLcz0Or.UgIYEiNVi7_VxUMh80MCCoDqwRryWQmD1IJp5UmGps5RFQDgKS5GpD9Rv.XyH
 IcU7yTX1_17B9rKp9kqTg2iFp_DjWa88g6_gn7DB6S.NEvNA3u6WfESue3Aovg.CKB.u0VeyGyVT
 IaZzE3oayj.YXnSg.VQTD3rNEhFVHyxk9Dvt7_V12PDu5qHZ8ufaG1.GatcYRI2_eZmtk6pN97l3
 iFgsAXNRD_ageNWTvEGfRF5JlbhF2zKKsRc7cTYdojfAkKHoncV8_mq9RKqJ1GHEC92AYKQ9ycpJ
 oYjEXZdGlvQ8ZUtp1bPcRG54IAgcSRqSStmINfBLXKpzYX3o3mwpTBhC2bHuNecosNMe8lUUzKh.
 Ll955QquLiOTTuWouMCgrTOx8gcNX3cfTZKNtai3.8OssJYhibzzyF5qCBT6n5nrSet9J4ck1PYI
 n9h8lKWwaDMyIH14yvq10hr5OlmqJfbg5zg8Tr4qRffU3r67E9w1oYkMOSumRAli8QDC6gAPZc9e
 BtCqJiCFCEgj28EXmhf4ENajc7s3uB9U3Ql5qsDrVIIuLfMpNfIogXbjzLndsLaY3sPdobBH4UX7
 Yhu.R4Auz.Pwcw.mQaNUVgpp0Ovv36ys78s_7OFCSKbia1RGfyligpfw7wwAjSmZ0YHVv63N81hi
 F5bmeOFzs.hAfeyil9odkxUhRJGuWSNpYTq1xXnGJQ07lTzhUHPAtVVY6gluCb_t4.kSK3WF8MyK
 xk1xaX3U.9bvSZSSeRnGa.i8WTot6383.OfqtBdm.G9UJUaaTCteRsAjNU5xAyOyvA5Ztp7LgCGz
 mIpgqWru3WDqM.bLjeF066GWS0sr8TwkzneGm2__x6uNmZLNhhcaHo0Ma61BPDuCbPQdsOTg_0pA
 z1QHc0Sv3jCFNfOJfnIdspNhAaFLpgh6bxd91Ig.SexKQ5EpHJpzv6iOx309SDXjNuneroZj_tAO
 CG7mC3o0S6BkHnx8U1C7.IOgq4_Zv9v_jthXo4tphH3qbgn2_l1U_bXshQ5Gy5vfNuTbmEgLIkKf
 mvFE-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.bf2.yahoo.com with HTTP; Mon, 16 Dec 2019 16:29:29 +0000
Date:   Mon, 16 Dec 2019 16:29:27 +0000 (UTC)
From:   United Nations <iespd54440135@gmail.com>
Reply-To: united.nation-finance@yandex.com
Message-ID: <1212247974.9310669.1576513767234@mail.yahoo.com>
Subject: Congratulation,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Attention!!! your E-mail was selected as a Lucky winner of =E2=82=AC1,700.0=
00.00 Euro Only. Under the Spanish Government. the European Union Throw Lot=
tery of the year 2019 and you won. That is why we contact you for you Claim=
. meanwhile your fund sum =E2=82=AC1,700.000.00 Euros will be Credit in ATM=
 Card and send to you the choice is yours. Congratulation!

Yours Faithfully.

Ant=C3=B3nio Manuel de Oliveira Guterres
UN Secretary General
