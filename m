Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0E0FAFD0
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2019 12:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbfKMLit (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Nov 2019 06:38:49 -0500
Received: from sonic307-53.consmr.mail.ir2.yahoo.com ([87.248.110.30]:35301
        "EHLO sonic307-53.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726086AbfKMLit (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Nov 2019 06:38:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1573645125; bh=F+7QXJPRuyxKv+5YqLXXhHJC5uuItS/uRvnxFMJ0nnQ=; h=Date:From:Reply-To:Subject:From:Subject; b=LDQ9YsliWwd4IXYTmDoAkY+f29BVyL3tBZ9BNvlFy2kQYjm3oB4VRFLSLKkRbYKFskf1FemC0X4Wk/lCuY3h8rPxsAX9zt6CQpbyqIygauyAaa19Ma4yC/t9uhydRH7mClJozXBHIf3RoKHsHG1YWFR5RR1zVGytn9LZ+zfU44c0qTCYmG9PTAM94ctQIJfw4Hmda02gZzKe23VQsRMJspuXubRby5m4eCZb0TIqfbaPwmZbyOZ8Bs7FeO6wjlwYS/gPc+hhXoZZw0NL1LEM8Vd40gSjvaebjAw/Y74IhvWPEzGMkvj1jI5AHNbjSNkw0LxCJi2TF0IrWbgyvwDkTA==
X-YMail-OSG: TwukZ8EVM1mdgCwGVSN1Y5mBaONyxf8M8pLLIjOP_IWRWtg78Q9B8DMfGQa9t2f
 yVS.nIBZvfPZDwvVdAbbfLSe.7BkDaJq2FnqOcBd.leEc85.GnmPNKIMVB0siYBddxQSiPvAqBEc
 lYyR7taOKXzhd7Ue9s3G8Loy8gWhWPjR5SnvupDxsx9M7CM3XiACme2wLs3e.GaorLDFJTMa4gw0
 9WPe_zLDq37.KEz80RV1xxZ3MXoFWjBENgMCRjRlvEPx7vnAh.ZFx8hKt0rUOBIMC4IEnGm7ANJG
 WpC8pXSwj4PPu6lRT1Uiw7GGVHMZQoRqPL92NXsXhPYHx3BN0ICGuJgwv3QQIf4J4LX3Irutf8_X
 y9MBRoZr_fVwi1fTPesDl18HGoJh1hQXm_Xw0tRuKx.vASni8dqvpk6K1EWDEAtQh_CYoS9GEi2S
 SlC.ybcyA2uUcUqDbEcBKYgi2CVhEVq0X0TWJc1njl0L5CWK9Ta2pn1TEe4F_T2P27CnKAkfhxTf
 ULBbU.OHVlPqMu7MJJO92GhKDF6LahU2kfeC2M2s8efxOZ2o5ymMGl2kbrSpilnr23KSF5H_NAUv
 DHlI8WmQ7PNjO3zcWr5SowqOxzMF.q1L2mn67Bbi649T1wqBmaUeDyUqizHClkQcjBYOkH4YpgFf
 bIzUpq9kVPxI7Exrz57gNUoM5mY7pgWGdKMvOuVzAD5ULFehX8y0A2nbo1asDX.Cr9gLFqbEW27h
 RGLkq4paksON3y3y4C0Y9W_gfq.qri5LhzLX4wIDLQglhrR1cCNGqZiLP_FK42534kkAyJko.L1E
 Tz6pNq_FfIyU_HDRm0ViaTMSzTnU9JSY_7bVxEo1eulGZ17Po82Cxg1MFOavQl8i_KtPJJO8nWOc
 hgbvryQVB.g7LALqHTuHWRlT80IecilMWRce1HvVeWjwSUrHw9PvPYLjAHMMVoYGp9lmDoZvOZWS
 3WpKTLJ567yRIc.RS9Or2pVYpXLuaDYe45r8JdbG8UeeETfmC1gMN1esazG1NG39ZrLeY_rfUew.
 Ry.HfmKeIY6y9WUJj4uZJUZ28SfNbGWTi0rMlLWD3XU2K8V3O8r106eo.9QMuYnUIifjqujZQBHx
 Ab20cnacZQzoPoBOS.JnGqpXsgwEn92bmvjVjOmhpHTQw8PI0AvpE9vhkgP6whB8db4Mc.UhZK_G
 7BEAKjpguEF7J0tApOLcVi5.n5ASWbV3dG8ZVmEARKU5Alqwz__2NtVsJ962kYoGjCJ.xR23U0Vq
 psWDu9gA6K.2U7mME0a5LE_BOTL_OsaEnaRhFXkiBW4IBhNNasep6JiXXGa_U1Xarj_2iw6.rHN4
 l
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Wed, 13 Nov 2019 11:38:45 +0000
Date:   Wed, 13 Nov 2019 11:38:42 +0000 (UTC)
From:   MR DAN KOURE <dankoure2@gmail.com>
Reply-To: dkoure73@gmail.com
Message-ID: <419854262.4679420.1573645122183@mail.yahoo.com>
Subject: BUSINESS CO-OPERATION BENEFIT.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dear Friend,

I am Mr Dan Koure work with the department of Audit and accounting manager here in the Bank,

Please i need your assistance for the transferring of this abandon (US$4.5M DOLLARS) to your bank account for both of us benefit.

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me after success.

Below information that is needed from you.

1)Private telephone number...
2)Age...
3)Nationality...
4)Occupation ...
5)Full Name....
Thanks.

Mr Dan Koure
