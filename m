Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC5719CC18
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 22:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732218AbgDBUwA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 16:52:00 -0400
Received: from mout.gmx.net ([212.227.15.19]:49133 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727412AbgDBUwA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Apr 2020 16:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1585860719;
        bh=PltJBuT9YXwPSM9DZaspo6s/QtxrVMqr9IxbHCzDVcQ=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=KUcYszB8ravTBC5T1vLVC1jlAwc/9MVwQFPpVAUXoWBuCMW+KF/Iolz9Qa1tWxXdB
         R1tnT+7lJuwBZMgv4n2Rdw13jrVfHh208G0QDZRhfA1OGgo0661pKrlXtcgcDmggVA
         YUw5cRlzW0ZW3sOuHNvduoxkODkjZNSaHIIFA3N4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.5] ([90.186.115.236]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvbFs-1j0w4P0jji-00sfEw for
 <linux-usb@vger.kernel.org>; Thu, 02 Apr 2020 22:51:59 +0200
To:     linux-usb@vger.kernel.org
From:   Benjamin Sembel <benjamin.sembel@gmx.de>
Subject: Alcatel x602d driver
Message-ID: <6ae3dfed-fcc0-0933-23b1-ef30db89dda0@gmx.de>
Date:   Thu, 2 Apr 2020 22:51:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3xkDTjvCl3OjRYY1uBA/x4MCixlhtVcfJQETwy4bEZ+ZWOGrHtM
 l0jmDCdTlQFPeDZTm4mAsD6AkDRvGsFJ9y9FUBauRsnjVXu3FzoJtYv5X/FOVoBjF5B7XfG
 ZEGvoGK6TiYd6Unf+UC7c3cpcDhUh+5QBXtgTh5TexwohLtIK8Kw30nZMIEC3NInK1Y5aav
 97QKKltzQxKiQJ3tx83nA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qvyCH4asw7I=:RZosmAUb1d9RDX2x1GFNsl
 2Io62Tk640jkx+Zfo3Vcc/iutcg871ut/Cz02SFNzBPkQw/OXzuN3cDpXwt8T9dinA3UAy1Y6
 sCouMicpJ7d+e9a1TG0q55hPOwfPDvQ0qmj2GgtLLzdiXuOmjqxN9ar6B+ZdveV6NMdN0jITS
 +PJM6Xv1wTy2ELYZdbcomi/9BQCsW0tkVKk66GVtPyqCodVLXC54cfAReafbc8X2dwAW7zT1V
 DvT6FdWV991OzRnTbHMeypGY9MRVpl9fnlcxlJhAeFCKISM57vZOdZtGYm86+IeB8MNcd16Nt
 XX6qyz6/spRNPvTJ2FRx8VdW1WuT9XZco7lVVUR5t4dsD9Ebsst4WBFhAbJil4gWCwSoqXLag
 IZcMDi6LIhV7F/l2p96vA6It5LC+qeE9C+bSR44nPmL2LIuxsJukkv/HnaUWIB5vk9ofIcU3u
 kgN1FgFaRWGrMUAGmnk3uqjjYrQUPX/5Ka0tNJHXaVOeBf5PF1fltFy1oOtIfGQw7vDzIknC5
 Z6VdWVeX8cVbY1Bey4yp+mY61cM9vrg3xt2KFKQ9SWmptxrgV9uIQdMvt965mADsuPyqwZV67
 1+4PBpoSnu5iie4La5sH3EAHcTrH/tRLR+IdbBaUAMPaTUfiWM6HlamB21JkWB6nuHQUhupoH
 w0e4dY5wyjW09jQEJf/XwOfsj0qSeLWOgLSX+8vpeo+4EQB6TBRw5v8Kl15LClovt937zrZwK
 DVBRi+xt5lNvk9/hZZ5xXddQzF7u6LegJDjLYsLuStpWcA0xCoiSI7hPBiInkwCNVoGw7IC0a
 iBF/xP8WEUL4SQQh/eWAQ9+82ryLa8ZKW0e5XpHfxKkj1HO88yZOJ9TPu8UtjXmYwgUrAbL9k
 PWVc7u+mhBbOEyU0CiD+Ui4AJb8huyCFUTJ1Hu7sQijQw5OO2TLWAMRKnZ7LXZG0E+YDAooVv
 xf+r4m2VLHSr9ClozRdFyY4+oIYcyZVq6+d71hIbfZ8oc36VJo+ePtTdKM5PK2CEzOd4mYew1
 KYObVRhLWmtrOMM9jxuGDkk669VHgjoDr6M1nVKF8J6ucA5YLnngClUV8ySsZ1IQonjH2kjf6
 dT87UWfVfK/QX8Ydi/KHHuz+i6mX5NSrq9MTfFs1efJskaTX9pzt8lpiKlgodS6UFoy2pTKsJ
 PJOGgwJjY2otAVxah/TQ47Yoy8SymM34HofPmZmKCpVMBzB5ZXh/q4cxFVLJtsyKwYGebprpU
 GHz3sqNU45/ltIyNm
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I have an alcatel x602d umts stick with vendor id 1bbb and 022c. After
using usb_modeswitch to switch it to configuration 2 it has no driver
attached. I managed to get it working with "modprobe usbserial -v 1bbb
-b 022c" and wvdial with this configuration:


[Dialer Defaults]
Modem Type =3D Analog Modem
ISDN =3D 0
Baud =3D 9600
Carrier Check =3D yes
Stupid Mode =3D 1
Modem =3D /dev/ttyUSB1
Init1 =3D AT
Init2 =3D ATE0V1
Init3 =3D ATS0=3D0
Init4 =3D ATS7=3D60+DS=3D3,0;&K3
Init5 =3D AT+CGDCONT=3D1,"IP","internet.t-mobile"
Phone =3D *99#
Dial Command =3D ATD
Dial Attemps =3D 2
Username =3D none
Password =3D none


But i am loosing about half of the packets, and i found the message in
/var/log/messages that I should contact you to add a proper driver to my
device.

What should i do? I am relativly new to linux.


Kind regards, Benjamin

