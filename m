Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 853791B2F89
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2020 20:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgDUStF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Apr 2020 14:49:05 -0400
Received: from sonic305-2.consmr.mail.bf2.yahoo.com ([74.6.133.41]:43056 "EHLO
        sonic305-2.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726112AbgDUStE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Apr 2020 14:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1587494943; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=e1smIH8ZX+hTfsqm/3OwtiM9i6zVcUAp1/BcsA7BAiXIGxnq0+ZxMIk8/F/htHrNARbvsHVbZ7mS9rZCdGNYtaNLEn+gXG/1DaFb1x2y+qd9mHbFpx99J1w0kTRNd0XraIdoDrftMA75nCi9F3w9BeeOg/sHR3b22Qi9ZSZF9uy6C7dp9YzPc5UmN7KJSHVIjozQoVQ4nPINOYeRvIwzrvFSzvIlUnOFDohO4w+DzgROJnj5fpZy2a25Sz21eDEw+eVadu+3eom/ZS+fcGI8d7UAjyU8riBjpCa9J/9SftTQO7EYdD16YcAWSFv/njHS/KwKSKVZpdBGDMdjOfz2Gg==
X-YMail-OSG: zTyVsasVM1m0W5Da6_I2G7wqLyIoS2msMDhnofDZ8lSBJR58C98rdZYVDzHcvWC
 DkddNtySdLnq6nN2pOQDVjuRQ0KX8RhYapJg.hecrpDgMhAUxqK7FIht_uAGvbWnowSblc7iktnV
 aS3xnM9SZvMW33ls71sMpfTuRHdir1c1sjvZFgBooKnTofkBrTSoSjWedc4YG17a_CV1kD3HhOaj
 9pR2YfGanJSsd7lYqHVSoG0oM4g5BSxJQVvN8RzC4xR7BXHpgaya5VDO9eIr_X5wm17xpS9YfCRT
 hG95utyPMi7V7UwKCu.5cVL4rYFqP4kfAZ9FsNrcYa0OPq4IxvFPmv4O3u6Yha7OACoO2V8hp26K
 1mB98GHbEg7n8Fe6OgtB9ZD.L9hxI5IS9zUretkHPsbct2pbbFbDnn_J7tMQt1_2Z5WRQlxPuBgi
 HcnZ_UKgfw9My8Bw8u7QgqEZ3WjB9wmp9ctGTgKxPnEIX6rgG1tK4f7jEzZDR_cqDWeNL7H2YKvf
 wwQsgb51pF6M7CkRUIlskGtd24and2BomAD3ivNVNa5gc3YxXczrHJa3UhqwQk8o2.tksHXl1Sms
 Ys.3fhBOK4nDsHyt_5tS98Ebf6TgHdH2hK5G2LJg9dp0em1GAUW8zcmONoJqymAce5ZxRiMmevZZ
 8rhavO3uhcs4hnf_xdsdVozxwm5Kpe8FDUw1J5oOxG3MQ1sT.siQwycqWFxgq491grYmY4wu9Qtz
 LKBVEnEYOaEbolfT.WKlYSF0NWKTY9vZkupstjL4xCWJyuDlRdDsTy92xIYEx7y098OuvcnoRuzr
 1DGzInyInhVHpp3GFc9lOytdlxrkALrDwzOmn8N9rfElA8dDVYWtUVbp3SfZHcMyYRoanwwt.2sc
 dzN3bhPlzmtFhF1YHB164hkYqjhk2Hknpq.H_xLXPj.1ThwQQjZMLhRhygCpfQqLRg2JbWwEmzyy
 pZ0575B4Lw314_WL1VVbsda0gwoNhOhp0Uceu7RZiR05k27p4H0ksHxF3WsdnPPqmN.QYG0V73wn
 jWuIZUxB2EmjwPtyZ4bDpEIdR3g_maNRu8Qip07m7oootcIDmQ5KwWm0VTJXj6V0b6UgZBCT12up
 YPqHHWjs9Rjlze07vQM62HAHwI4WjXJc75vgcL27.Oe3Z2Fq8np5Rbc0_TK78Uyl1Z8903kuhMvz
 xJYnj9uGjhLAYAAeyu56J892sdhXc_nsdqQUie.82La_OGoGi0ii4GKpCYXYFP3yvBs.sCAUPTd1
 O4CtBIz4QkyNXmjmyBrY8embb57PUhwfmUA0qVIXD2vtXV5JtoLhgXFR9s0Lbjx_6olEv7Msn.xT
 R5VleCCIf
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.bf2.yahoo.com with HTTP; Tue, 21 Apr 2020 18:49:03 +0000
Date:   Tue, 21 Apr 2020 18:48:59 +0000 (UTC)
From:   Ms lisa Hugh <lisahugh531@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1040277377.306035.1587494939161@mail.yahoo.com>
Subject: READ AND REPLY FROM MS LISA TRANSFER BUSINESS.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1040277377.306035.1587494939161.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15739 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dear Friend,

I am Ms Lisa hugh, work with the department of Audit and accounting manager here in the Bank(B.O.A).

Please i need your assistance for the transferring of thIs fund to your bank account for both of us benefit for life time investment, amount (US$4.5M DOLLARS).

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me for success.

Note/ 50% for you why 50% for me after success of the transfer to your bank account.

Below information is what i need from you so will can be reaching each other

1)Full name ...
2)Private telephone number...
3)Age...
4)Nationality...
5)Occupation ...


Thanks.

Ms Lisa hugh.
