Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750C627BAFF
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 04:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbgI2Cku (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 22:40:50 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56615 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727529AbgI2Ckt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 22:40:49 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 6DA705C0124
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 22:40:48 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute6.internal (MEProxy); Mon, 28 Sep 2020 22:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:date:from:to:subject:content-type
        :content-transfer-encoding; s=fm2; bh=YCrmGVzvm+r0YBGCeeq97UJHVn
        MCypzpKlA4Jl9fcFs=; b=UQY2E6VAmr9mhahDy8MNhoyXKxYtXnU19fzJvmK9Dv
        IsnwUAHb/aerHAQYa6G+mWh7xPFN6oCErp994/yypdiziJ7VJgD2Ao41rfZw+BpL
        vVN2Dov0ROcBZ+tpJGc0RyCMBb/xPPp1rUOmIyRnezN3O1m7MfGP3S5kHHQRHdWm
        flU9aaXJ7zhFHKqdd+MQjLYxhSkNqjRf3cIAQw/5eax40AWy3HyWXWedHK+SS1dx
        ITCaQn6naRHzEVZP4QfhY/C/HykT4VyMOFeTmoOZ6M1aoMmspn6de00WbrbnSwVi
        EfLCAO5nFHSsOMcAftbLuwL+1mKR4v6qPlferFtAus2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YCrmGV
        zvm+r0YBGCeeq97UJHVnMCypzpKlA4Jl9fcFs=; b=abEpO/P54bHSSz42rD792F
        SLCEbbOWpdHD1oFrBl8nO4vxpMSYywgI+6adi2vQkgPMAPAwmMxvSD/7QEnD0CuG
        AIka/Nd41KdaIULL4ThzNp2Clm7wwEgLuxIZbAaBZW4wuK0+TxwGgi/oHxIobPxQ
        Z8DwGkOzLqhwqDqReCkVjqIISW1Y9zmGm/KEZWmOu9mnlNpcUJwn1zQ4GXDOmw6i
        LUBxkwG9uJE5rXWIJB1EtDD9kTaHTEp90z0+C6J8rhS5OOZcEHuU248TRvs+koDC
        vBslbur1q5WnN9XHQnydWyN2mGbxOkaX57fT/z1FF9oBCIgzfDMBOkAWvhju1tOA
        ==
X-ME-Sender: <xms:sJ5yXz15uI5knDDE6uYUai7K1kotPX5ndktRU63lCpoWG7gnCdWaAQ>
    <xme:sJ5yXyGJqnM-5JLSHfJ7swQ5OVuOB7MrvKodXUmWC5UGYo-jKwYPbUN5YEUWEosRf
    GOqpgqFtsxt96y9NbI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdejgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgfgsehtqhertd
    erreejnecuhfhrohhmpedfufhiugcuufhprhihfdcuoehsihgusegrvggrmhdruhhsqeen
    ucggtffrrghtthgvrhhnpeetvdffiedvgfejhfeiledtueefgfegteehtdelgeeiuedtfe
    ffjefgteehkedtteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:sJ5yXz5hnHZvUknwFt1CHsN6Q4n5AnHqAvlBw9UmbmoOKknrfQ-7sQ>
    <xmx:sJ5yX42H_q0tXskvcGE-xNSeGlJ6kfNlQONKWsx55nZJw0IiecXOgA>
    <xmx:sJ5yX2EpaDue5nLA1quf8rZadApoedoaEhuO3UaCbvcfA-N1zek1gA>
    <xmx:sJ5yX6TuNe709oZklLr1g2ekYTVWtFhPcVdomt452KAJJrYGc1_8hA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 1B2C9660069; Mon, 28 Sep 2020 22:40:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-355-g3ece53b-fm-20200922.004-g3ece53b9
Mime-Version: 1.0
Message-Id: <ce4fc6f6-726e-48b3-97bb-0de2b3801615@www.fastmail.com>
Date:   Mon, 28 Sep 2020 21:40:27 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     linux-usb@vger.kernel.org
Subject: ConfigFS: bcdUSB forced to 0x0210
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, I can't enable USB3 with e.g. f_ncm because bcdUSB is always reset t=
o 0x0210:

$ sudo sh -c 'echo "0x0300" > /sys/kernel/config/usb_gadget/g11/bcdUSB'
$ cat /sys/kernel/config/usb_gadget/g11/bcdUSB=20
0x0300
$ sudo sh -c 'echo "fe800000.usb" > /sys/kernel/config/usb_gadget/g11/UD=
C'
$ cat /sys/kernel/config/usb_gadget/g11/bcdUSB=20
0x0210
$ tree /sys/kernel/config/usb_gadget/g11
/sys/kernel/config/usb_gadget/g11
=E2=94=9C=E2=94=80=E2=94=80 bcdDevice
=E2=94=9C=E2=94=80=E2=94=80 bcdUSB
=E2=94=9C=E2=94=80=E2=94=80 bDeviceClass
=E2=94=9C=E2=94=80=E2=94=80 bDeviceProtocol
=E2=94=9C=E2=94=80=E2=94=80 bDeviceSubClass
=E2=94=9C=E2=94=80=E2=94=80 bMaxPacketSize0
=E2=94=9C=E2=94=80=E2=94=80 configs
=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 c.1
=E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 bmAttributes
=E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 MaxPower
=E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 ncm.0 -> ../../../=
../usb_gadget/g11/functions/ncm.0
=E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 strings
=E2=94=82=C2=A0=C2=A0         =E2=94=94=E2=94=80=E2=94=80 0x409
=E2=94=82=C2=A0=C2=A0             =E2=94=94=E2=94=80=E2=94=80 configurat=
ion
=E2=94=9C=E2=94=80=E2=94=80 functions
=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 ncm.0
=E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 dev_addr
=E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 host_addr
=E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 ifname
=E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 os_desc
=E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=
=80 interface.ncm
=E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=
=94=80 compatible_id
=E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=
=94=80 sub_compatible_id
=E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 qmult
=E2=94=9C=E2=94=80=E2=94=80 idProduct
=E2=94=9C=E2=94=80=E2=94=80 idVendor
=E2=94=9C=E2=94=80=E2=94=80 max_speed
=E2=94=9C=E2=94=80=E2=94=80 os_desc
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 b_vendor_code
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 qw_sign
=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 use
=E2=94=9C=E2=94=80=E2=94=80 strings
=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 0x409
=E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 manufacturer
=E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 product
=E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 serialnumber
=E2=94=94=E2=94=80=E2=94=80 UDC

Board is a RK3399 based RockPro64.
