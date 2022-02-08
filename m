Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82444AE222
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 20:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353704AbiBHTUr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 14:20:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385988AbiBHTUo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 14:20:44 -0500
X-Greylist: delayed 303 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 11:20:43 PST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0DBC0613CB
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 11:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644348041;
        bh=NuaQaSL1iqJzKEdliOEi3PwkdG9bCekplrHPoUSaKHU=;
        h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References;
        b=XjX1EBuxnGY8WhmwfcQ+Ytlq3blxvtqhLTQN/1HbTku4VGwBS0IwAH5NYfVh9unkS
         7ao0ZnXPeklkTpyhLqUP5GyTxB186qp+b8PoD1fFef4F9L93f2CtxAiZTx3ahuLBws
         ly/2Z2QQVuUBjyStzmK1ufa/ZqJHnYVqBbgfoN88=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from felics-pocket.localdomain ([2.247.250.237]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MTiPv-1nlSsx1kVx-00U5sA for <linux-usb@vger.kernel.org>; Tue, 08 Feb 2022
 20:15:38 +0100
Received: from localhost.localdomain (localhost.localdomain [IPv6:::1])
        by felics-pocket.localdomain (Elektropostamt) with ESMTP id BF6B658FB99A
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 20:15:36 +0100 (CET)
Date:   Tue, 8 Feb 2022 20:15:36 +0100
From:   Felix Becker <linux.felixbecker2@gmx.de>
To:     linux-usb@vger.kernel.org
Subject: Re: [usbserial] device 0421:069a is supported, in fact.
Message-ID: <20220208201506.6c65834d@gmx.de>
In-Reply-To: <YgKKQSOuwBy1cQ6H@kroah.com>
References: <20220208125958.295e8a0b@gmx.de>
 <YgKKQSOuwBy1cQ6H@kroah.com>
X-Mailer: Claws Mail 3.18.0git303 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SuhfsifHLQPAOC5mhWagB6W";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:H+0/Kgbg8AhMJ96BUbhAOp+E/kyIdrJzIbIF7p9Wb7yzN2wrq0B
 dtFTDW8sqeO4QtcD/PZUIuoTJK0Oiyhj0Wqy8Ot3yuxrUa8ExSPsyVRBNnfDmykZT0Hnfjf
 TWjFiwFGwJTeOhSZRJ/IPyvkvoj4rfDczYcpDcqjrSggMQHNqQb6CpIu0Hm4OLTC/8v5Wvc
 uC1upSrNOgr3gYpE5KUPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S9RsAX1REGM=:rNXpsvHC+sKl6m1VG45ggT
 3ET9TEg0y6M8I6znuM4wZoZXiD7A3H0XUpySNpZV20KRPQUnnt7euatJgzoZAQUmfDO/TevzC
 KsXaAKI07RICQjLCLcYuIk14WJpRBRJtuVFJrbpxqMA8RcBTZDAfZSv/STIeWsIzAveqqTN+R
 aCK6uLeYGExgVQuj5B4bzKdi0rcyuLi5L4Ou8YCcGjypDuXlCxQ/znE9DnMIx/GlEBSWZlqaQ
 mTQbbWTBfjSXTKLakT0UNJ31eXKbZ/mkAJlUqXuNw2HjBxs1NXHVeuniq9mnNo0eoOzKQczJc
 0WWpnis2bhnLZ7eSNaQWUGO75+5dWh+3kZ+XJCcTwxCV4BUzl0p3jmmIqQmPknLi21fNiAAcK
 LLPGkqUoz9fYOUHLWeQKooUprrm0fpIZpvFwwknv4tPpTZlOJiHiSgpwx8OgTtE0UN1aKVL0K
 W00BCKURfoHP93mcpPQ9z88yP3k0XCs7ecIGgFzgsu9upAN3mq+o3+JXHDuag56abzF5oleFs
 zzF7z23+IAwxbM2+cOrSF5FNb9yPRy/m8QPxfjCmMZsmErtmA1Nqk+roVtGnFioiJik+gXMUq
 aXgt0jnYN0hj19LSYod89QKyHJsH159tkm3yxXHQc3DLFcHd7qhgSF0bChG+78utmTFHwlIiU
 2nyJXuy1eTutfuFsYSP/a66c0lfknZJNrnQpK/OizSM7TlMDWptTcGsn+hpCc8kINUQ5HnZxY
 wj3gm3goTyckjwg4pfC2M0UDQWKj/0r+kC/eOkGL49hFRJ01vxPc3A0w5kMihnbakR/u9hjWK
 at0JI71hVEmL6Pdbc+UKrzXXcnqYd26omTpTZqdxyGZZtem6nVWUdZCDratJNdKMJ0mdb0SqO
 EB1m7vAJmnGY1qkqyU3ONlpepp025xCHGKbbEaImx8zBo3oZaVR4K2vRbyXmBEJeSxtz/hW50
 cBkdAYbp1ScCQTq6blNG1as3trgzLSu4byCXTdWtaRpTkt0zDIR8B5b6sl+GlJscp6MhHvkt4
 a2IAMxC/oFUr074IUJN2qo/86nFkuOBQhMatWDpxioCtSnNiubTPdTE/R84kncbPlfIB0k8+X
 OLhxmkN3T5E7Eg=
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--Sig_/SuhfsifHLQPAOC5mhWagB6W
Content-Type: multipart/mixed; boundary="MP_/eyH.jK1FVHEyl_C+OOQmIJ/"

--MP_/eyH.jK1FVHEyl_C+OOQmIJ/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, 8 Feb 2022 16:20:33 +0100, Greg KH <gregkh@linuxfoundation.org>
wrote about "Re: [usbserial] device 0421:069a is supported, in fact.":

> Can you provide the output of `lsusb -v -d 0421:069a` for us?

Attached (without `usbserial` loaded to specifically drive this phone):
`lsusb_0421:069a.nodriver.log`




--=20
This email has been sent from a computer.

--MP_/eyH.jK1FVHEyl_C+OOQmIJ/
Content-Type: text/x-log
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="lsusb_0421:069a.nodriver.log"


Bus 001 Device 009: ID 0421:069a Nokia Mobile Phones 130 [RM-1035] (Chargin=
g only)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0=20
  bDeviceSubClass         0=20
  bDeviceProtocol         0=20
  bMaxPacketSize0         8
  idVendor           0x0421 Nokia Mobile Phones
  idProduct          0x069a 130 [RM-1035] (Charging only)
  bcdDevice            1.00
  iManufacturer           1 Nokia
  iProduct                2 Nokia 130 (RM-1035)
  iSerial                 0=20
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0037
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
Device Status:     0x0000
  (Bus Powered)

--MP_/eyH.jK1FVHEyl_C+OOQmIJ/--

--Sig_/SuhfsifHLQPAOC5mhWagB6W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEoQC1DtG8M9RevkfXW6j9HlIpTekFAmICwVgACgkQW6j9HlIp
TenNtg/3bLomzwaUxl9NgLqX+TQPrcaFb5zHQexXwvl/YOWkkVYfcQSbCdAVBy1x
AaXxxzmoGkcDxBq+/ojuS1xLHYGiUh190j79AexoK4TX+PlHdeWmgTAjHydJ3jc2
yqF5RyM2dVljuIr/nNirgMFPI3p50hmPE+1NVlbibzWuZ9dKz6pzBOVMoO031Mkl
ezuLKMfAF5y7gaeUjL3xKG5udzKohIpAFQS0RLr6WqBM7QvVx37nzU9yLP+rKtth
smq1ihsMKrePe1Ej40YNmVLZkwzh+r0TYOKuNjYarC3YBG9rqPYitYmdEzmxBOa5
qmow8PPLoP4YFNq1Qea5Oe7YPuxxgwNPDD6aADRpbPXP5YM1XmnKffCCoC6FtWJJ
Ta0ceZZKlSXvhFs5hy0Vw16aj6s+tZUaEJD2iJI5b9CXPr7k2VJ6uSfPzpkwrcRS
nYu032s4CeTzuSypv+yTgjkXT3WnccCQ0Sy4YQkSZNlJtqHJ7qL3WrZmoOBOdmo0
hiC03Xh3VBh365SNBFnID4AD97ll13NkP+ZRuBWea27nGUri1q8iSnwwe14y8buF
Pp9soQhVbSuAXNL6458p9iDr70bW0bW/Nb6wgBxZMyhGJUmSwlkbN+UToyTwXhsW
zxxD9V7Fo7OtNn+pnWK5vj6cgZGO5NCDeR95k4ppyA8V74CgTg==
=gIon
-----END PGP SIGNATURE-----

--Sig_/SuhfsifHLQPAOC5mhWagB6W--
