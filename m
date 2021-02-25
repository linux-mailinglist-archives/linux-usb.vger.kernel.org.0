Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9187B3256E5
	for <lists+linux-usb@lfdr.de>; Thu, 25 Feb 2021 20:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234087AbhBYTmL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Feb 2021 14:42:11 -0500
Received: from xaiki.net ([108.166.209.89]:40930 "EHLO mail.xaiki.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234764AbhBYTkB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Feb 2021 14:40:01 -0500
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by mail.xaiki.net (Postfix) with ESMTPA id E658CECAD
        for <linux-usb@vger.kernel.org>; Thu, 25 Feb 2021 19:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btn.sh; s=dkim;
        t=1614281594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=qjpyDPu6ORPnPCz2neTrf4btUhLM7u9x18+/pNHqXtE=;
        b=WALKE2s4HphCl547MqTHoJ4txtb681iRIyC++fJHgtutWBATFMrJ7ClBY9VCfuDFuepR70
        5joNo15ZG27D3fyM+L9+ndrrDmidv00sl+L6esT+clADp05BfPVdVB1jZqBGcSjVBTFbNt
        6mrtqW2tUK8npWZeP5LwhuLeYyWLi9jaK6xMW8X1lCM5RWEYrgrizLEN9ST6Dr1lm4JNf7
        UHZRET3UZKINeqlQ++s4civTcWHgNjOi30NHbb4tME/JMdHD9K7KxeMOlQKLTjqYDXvWyZ
        PniuH6LA5Y9PAg4pyUKM56TSZ4RoRzWNOIzkhw+k3szhu5E9dpNehVRsqTpCfw==
MIME-Version: 1.0
Date:   Thu, 25 Feb 2021 19:33:14 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From:   x@btn.sh
Message-ID: <0562cd59f06031d676dd314dbada7371@btn.sh>
Subject: [PATCH] USB: serial: ch341: add new Product ID
To:     linux-usb@vger.kernel.org
Authentication-Results: mail.xaiki.net;
        auth=pass smtp.auth=x@btn.sh smtp.mailfrom=x@btn.sh
X-Spamd-Bar: /
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add PID for CH340 that's found on cheap programers. They are sometimes re=
fered to as ANU232MI like=0Ain this one:=0Ahttps://www.nordfield.com/down=
loads/anu232mi/ANU232MI-datasheet.pdf=0A=0AThe driver works flawlessly as=
 soon as the new PID (0x9986) is added to it.=0A=0ASigned-off-by: Niv Sar=
di <xaiki@evilgiggle.com>=0A---=0Adrivers/usb/serial/ch341.c | 1 +=0A1 fi=
le changed, 1 insertion(+)=0A=0Adiff --git a/drivers/usb/serial/ch341.c b=
/drivers/usb/serial/ch341.c=0Aindex 28deaaec581f..f26861246f65 100644=0A-=
-- a/drivers/usb/serial/ch341.c=0A+++ b/drivers/usb/serial/ch341.c=0A@@ -=
86,6 +86,7 @@ static const struct usb_device_id id_table[] =3D {=0A{ USB_=
DEVICE(0x1a86, 0x7522) },=0A{ USB_DEVICE(0x1a86, 0x7523) },=0A{ USB_DEVIC=
E(0x4348, 0x5523) },=0A+ { USB_DEVICE(0x9986, 0x7523) },=0A{ },=0A};=0AMO=
DULE_DEVICE_TABLE(usb, id_table);=0A-- =0A2.30.1
