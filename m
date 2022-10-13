Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 628975FDC5F
	for <lists+linux-usb@lfdr.de>; Thu, 13 Oct 2022 16:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiJMO07 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Oct 2022 10:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiJMO05 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Oct 2022 10:26:57 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2391ACA887
        for <linux-usb@vger.kernel.org>; Thu, 13 Oct 2022 07:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1665671208;
        bh=XuTnL4CiYuLHU3WpcIdjlp2AMjeMx89XJlHV1a3blFU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=KqIh7iEwq8I0AE+Nd7OUgtmGioWinpHwbyAkveIi+KHQtAZG2+5dmjCZGwBHDR6kl
         gqlC7Ad2kbtxM6Os1PqWptkMBYNr1t0K9MlvbaNBdgcTJB+3pviB85lodDk0e8hh8/
         LlpMwxCk6Ktc69NBZiHPJaFwuIizmfEm4bAlcakg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from pianobar.pianonet ([176.145.30.241]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1Mof9F-1pTaWP2RQH-00p1a1; Thu, 13
 Oct 2022 16:26:48 +0200
From:   =?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@gmx.fr>
To:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@gmx.fr>
Subject: [PATCH] USB: serial: option: add Sierra Wireless EM9191
Date:   Thu, 13 Oct 2022 16:26:48 +0200
Message-Id: <fafbac7f1c5d85dc4e7049e72635a478a5aef67a.1665665539.git.benoit.monin@gmx.fr>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uH6dsRMp1+u8ePZ9q2S31xxWwV9VPHaw1JMlBy3Duq76V1rEyLF
 qATUzcwfwKbEDO1MM/6+p9iTXElFUaJvbGFhHB89cJuCrKZjq30uXTdaiAZubvZb9nvVz38
 JWSQ6CFcoaRyqmeHvONcvTGlC0WQUuCSXle/rnfJFEZA32PhDUdY/RYHcWTzfptfp7Qxqvj
 4J8ClbUmVO2op8w0h4TkQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rzmOYhW4tIo=:3SV8Wriq+wpHm0Z0hm0/D4
 dVnMoQNz3xToXf90gdYNcuRG9Hw1gYKhdmPgb/GsRdmkL7bHgPN5WcIQ6+53yl6nqi8C2lOA0
 ivgi838Gkb0G/RAN55HHsB4XnNzh3tShq80804uC7+ixw1/QujiEOkXvbCJvm8EKX9bxKynGU
 mswbmECH9ketGuOfDo5T5fPZ5pBYo8abdGWytsQAnC2Ab3m99eIcFOnHwwEpb1ma0BXtZ08Vs
 29sGytJuOJm6refg87tFUj3FpO7nw2XZvU8++6v7qqnZRvQB+mN2L12grKmyahUXdO4DjH1CB
 aOrlpFwG1i2pSnq6YGVBe6wYvDQWjUV8lB7an+bVglVbPKzR+ovnfN9/AZCu8z+zY+SqwEhvW
 2hevHV+GjMo+2YIZcdJwe5u1DrItpiIJRLzdtrjn6rIxKQ6stgwtvhi75BHYhyPVgo6WqpjGP
 7f5GlxFGv4LK04M9+1S2DgXn3o6Bc6nOpUCRi+PDKI/seXusF6+Fi4MoD0gKTpw4XAGCdsXPB
 ctkK39BktPv0dtsQE9+PTBRwsHEZEqGNDWbnGxoxbfHyGKEpku8Ceuu+Y9o03976zA3o3Amsy
 irj9zPvGMBFKRebQ0YlmnUOLtIwsQ3m530yCnV/JXDUVe5rBBJEiB3I5V64mNi6sSVU4JQOMZ
 FniRFukB0EyeC5y57wCU9uOo0VPP7szQ9qIysq0BNmp240gqIuH8A070N7eR9pUO0dJO5wEQ6
 cS14WRvF5pWYCn9DzfSD2M77JMKmSny7i1wgHRY1tEPX1fGTM1ccy13G9SejB9n5IyQibYcDf
 AqtKyS7YXzvied/X2pbc9wP9szA9k6yVjavT2oFiMwT9KXMEogohHmP7foAS0R4GbfOmq92UY
 vq92YcZPqskzRFyKGp4CUnUHjpOG3QEJimo15kklYoi9E2Ax1UTnP5ze6c1PleXiqvXgcBAYY
 u17t9Os0p7h7IsBkQcKEoGAEIwgo8qrysXULtAejkJuIM0cLoGgxzkBcvpOCsvEYKfE6kRhoT
 ndms42mtojy+U6K3tpJK2BldTu+YP4sbsLjO0ag+kzzx8Kx6+nVOgfc+H/oA50X/YjEUsbWvc
 F2ZdZcWvDQw/idrwl0GMzWXdIyJ9zA4bEriZPkboZfCw+InS7+8AaSztUrpJqpm1RqR+pkFEf
 gtRdtQMFyMSccpvRXq0bKbW70vtAN+LYNtUZFDyIKBDIdzoMEbfcndRkQqB1Ki74BcvJq3qpJ
 hqIBksAACCJGIXqiBy0eXRUpNYXGzDymT+qaktiT+/SNJEuHwJxbld+OuCzPJ+0xB8g+DoT5f
 SCOeCKJoIAYJ2Oax+bMGvovFfjjV8iMcl3NZzl5LfytZ8uTeHo/uNvsNg+iP0foy2sZ7itr8S
 VqyiI8lkqlNztR/D+nO7eZlgaP3LmAWEQ7jMplFiood6dOO3fp6ML2pfYgd17qL+y2R+7RgIS
 h10PrhuGDxJHql/w4/XA19AlCvSuNZfD62cnMiwmyt4wItHuuLxWP5/P6b/wn8BT8Ctxn0LnH
 plPk33TObjYUKs8UbQzyr/maY+BAjvMVqVnJJY9fqrGOG
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for the AT and diag ports, similar to other qualcomm SDX55
modems. In QDL mode, the modem uses a different device ID and support
is provided by qcserial in commit 11c52d250b34 ("USB: serial: qcserial:
add EM9191 QDL support").

T:  Bus=3D08 Lev=3D01 Prnt=3D01 Port=3D01 Cnt=3D01 Dev#=3D  3 Spd=3D5000 M=
xCh=3D 0
D:  Ver=3D 3.20 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D 9 #Cfgs=3D  1
P:  Vendor=3D1199 ProdID=3D90d3 Rev=3D00.06
S:  Manufacturer=3DSierra Wireless, Incorporated
S:  Product=3DSierra Wireless EM9191
S:  SerialNumber=3Dxxxxxxxxxxxxxxxx
C:  #Ifs=3D 4 Cfg#=3D 1 Atr=3Da0 MxPwr=3D896mA
I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D02(commc) Sub=3D0e Prot=3D00 Driver=
=3Dcdc_mbim
I:  If#=3D0x1 Alt=3D 1 #EPs=3D 2 Cls=3D0a(data ) Sub=3D00 Prot=3D02 Driver=
=3Dcdc_mbim
I:  If#=3D0x3 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3D(none)
I:  If#=3D0x4 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3Dff Prot=3D30 Driver=
=3D(none)

Signed-off-by: Beno=C3=AEt Monin <benoit.monin@gmx.fr>
=2D--
 drivers/usb/serial/option.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index a5e8374a8d71..d41f7a5ced49 100644
=2D-- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -580,6 +580,9 @@ static void option_instat_callback(struct urb *urb);
 #define OPPO_VENDOR_ID				0x22d9
 #define OPPO_PRODUCT_R11			0x276c

+/* Sierra Wireless products */
+#define SIERRA_VENDOR_ID			0x1199
+#define SIERRA_PRODUCT_EM9191			0x90d3

 /* Device flags */

@@ -2170,6 +2173,8 @@ static const struct usb_device_id option_ids[] =3D {
 	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1405, 0xff) },			/* GosunCn GM500=
 MBIM */
 	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1406, 0xff) },			/* GosunCn GM500=
 ECM/NCM */
 	{ USB_DEVICE_AND_INTERFACE_INFO(OPPO_VENDOR_ID, OPPO_PRODUCT_R11, 0xff, =
0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191,=
 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191,=
 0xff, 0, 0) },
 	{ } /* Terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, option_ids);
