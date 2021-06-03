Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC7339AD35
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jun 2021 23:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhFCVwH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 17:52:07 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:43597 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhFCVwH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Jun 2021 17:52:07 -0400
Received: by mail-pf1-f169.google.com with SMTP id t28so5920270pfg.10
        for <linux-usb@vger.kernel.org>; Thu, 03 Jun 2021 14:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4jcQZYmyqh/KUO4CjZnogaDVrPTgOgfMeEx3RyMtjEw=;
        b=WtIcYJJQpvHha5cG3dA5wNdbP0iAkwGb2l+nNKfZYulGaZsU4Nt1lKaF/ZQfKTjg+l
         uA3JU/X45cEvffF37JH0Vwze1llTXQnIIlM62aiU85VFlze4rzRlVvJ/WFATu9wKL5Yk
         33CgbcMemn+47tg/yi6xvX/RUkT+4+XKtmS/FxrxGHSIa1z7aljSdHoyaSMBm4yoasV7
         9S/qiBz46gNXAM53dECAhEohAUdV2DBMybRstLLZ5jS0gPcYV0yVX5zkmkz/FdPbAom8
         QmvGlx3unGtIUgOhWyDWICxGEwwEfFL/gseSZ74lzuWL0F+Dw1f8ubdFWqTcar1sdsz0
         qVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4jcQZYmyqh/KUO4CjZnogaDVrPTgOgfMeEx3RyMtjEw=;
        b=Lh2H6Ewv0CykCvi+5X4xPyV2NuwnVwNZcdkmgQlPM9ErXQfFOfuJE5131RQpfcWCB/
         KQ4a+q/Un/y6nLp4SJuEmP1g2OmzYHOPUyo51PcqD3ivkgWcHefhsXWqK3hjp63Fvy1i
         upkxIBHJyFijPY49ojpDj/+f2B+YWUulB86XEHL090OCwqhZKBwk4F7OxC9vtmN4GYpr
         zhAo3tpy+U2x5EIznyE3Qfq8/thr9X0qBRRAo0ZZJVtCXWaiHH1ZL5f2rRq663rxtigy
         sCrU+60HMnF3r+sRqp1abgtAeXvJd1i2KKKt8nRjAMBZ3MPtuBCwMMgZB5aL39fetl6R
         5YcA==
X-Gm-Message-State: AOAM532GH3x/dKCuLcEy1hcoRwOx/I9aySDUsPNNEXrSUws8xhtCfxIu
        +LHK25kzED1ZAigJU21348A03u0wtVR1EZJFkk2KAmJJKiM86g==
X-Google-Smtp-Source: ABdhPJyZ3fTxmjqOrPerhETEmumSzzNhhp0433xyNJhuM8XAC+lOgE08UCX4lfi+EfOVVoW2/iNsc8q2L/mJWtaV/O0=
X-Received: by 2002:a63:104a:: with SMTP id 10mr1558023pgq.66.1622756947503;
 Thu, 03 Jun 2021 14:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAAvkfd_vPHcd5CTLrA_BoVhg_aNWNzcp45yO-dCpJZhyabjjsg@mail.gmail.com>
 <YK4T+w+e8TtAUuEo@hovoldconsulting.com>
In-Reply-To: <YK4T+w+e8TtAUuEo@hovoldconsulting.com>
From:   David Frey <dpfrey@gmail.com>
Date:   Thu, 3 Jun 2021 14:48:44 -0700
Message-ID: <CAAvkfd91qr+aQQxXyQfk1e2Avifcdp6fCwgrk3c7=ex3pcqvPw@mail.gmail.com>
Subject: Re: CP210X: Failure while programming ESP32 dev board
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

I have added linux-usb@vger.kernel.org to the CC as requested.

> I just verified with a CP2102N here and everything appears to work as
> expected as it also does with some of your boards. Could the CP2102N in
> the board in question be configured differently in EEPROM?
I would be surprised if the EEPROM of the failing devices were
customized, but I'm not sure how to prove that there weren't modified.
The CP2102N seems to identify with the default VID/PID, so that's
evidence supporting the theory that it's not been modified.

Using kernel 5.11.7 (before the bug) I ran "echo module cp210x +p >
/sys/kernel/debug/dynamic_debug/control" and then plugged in the
CP2102N USB device and I see this in dmesg when I plug in the device:
[100761.713921] usb 1-1: new full-speed USB device number 8 using xhci_hcd
[100761.855667] usb 1-1: New USB device found, idVendor=3D10c4,
idProduct=3Dea60, bcdDevice=3D 1.00
[100761.855678] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[100761.855684] usb 1-1: Product: CP2102N USB to UART Bridge Controller
[100761.855688] usb 1-1: Manufacturer: Silicon Labs
[100761.855692] usb 1-1: SerialNumber: f06e721e74e1ea11bd9ddc2d9a583cc7
[100761.856771] cp210x 1-1:1.0: cp210x converter detected
[100761.858469] usb 1-1: cp210x converter now attached to ttyUSB0

5.11.7: Before trying to flash the ESP32 using the CP2102N:
$ stty -F /dev/ttyUSB0 -a
speed 9600 baud; rows 0; columns 0; line =3D 0;
intr =3D ^C; quit =3D ^\; erase =3D ^?; kill =3D ^U; eof =3D ^D; eol =3D <u=
ndef>;
eol2 =3D <undef>; swtch =3D <undef>; start =3D ^Q; stop =3D ^S; susp =3D ^Z=
;
rprnt =3D ^R; werase =3D ^W; lnext =3D ^V; discard =3D ^O; min =3D 1; time =
=3D 0;
-parenb -parodd -cmspar cs8 hupcl -cstopb cread clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl
ixon -ixoff -iuclc -ixany -imaxbel -iutf8
opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0=
 ff0
isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop
-echoprt echoctl echoke -flusho -extproc

5.11.7: Debug logs as a result of above stty command:
[101518.196637] cp210x ttyUSB0: cp210x_change_speed - setting baud rate to =
9600
[101518.197142] cp210x ttyUSB0: cp210x_set_flow_control -
ulControlHandshake=3D0x00000001, ulFlowReplace=3D0x00000040
[101518.197294] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0303
[101518.197981] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0300

5.11.7: Debug logs as a result of successful programming of the ESP32:
[101621.135572] cp210x ttyUSB0: cp210x_change_speed - setting baud rate to =
9600
[101621.136277] cp210x ttyUSB0: cp210x_set_flow_control -
ulControlHandshake=3D0x00000001, ulFlowReplace=3D0x00000040
[101621.136547] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0303
[101621.136782] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0101
[101621.136977] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0202
[101621.137115] cp210x ttyUSB0: cp210x_change_speed - setting baud
rate to 115384
[101621.137435] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0100
[101621.137504] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0202
[101621.137572] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0100
[101621.237841] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0101
[101621.238058] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0200
[101621.238253] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0101
[101621.288566] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0100
[101622.155907] cp210x ttyUSB0: cp210x_change_speed - setting baud
rate to 461538
[101635.468674] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0202
[101635.468876] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0100
[101635.569222] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0200
[101635.569446] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0100
[101635.569853] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0300

5.11.7: After successful programming:
$ stty -F /dev/ttyUSB0 -a
speed 460800 baud; rows 0; columns 0; line =3D 0;
intr =3D ^C; quit =3D ^\; erase =3D ^?; kill =3D ^U; eof =3D ^D; eol =3D <u=
ndef>;
eol2 =3D <undef>; swtch =3D <undef>; start =3D ^Q; stop =3D ^S; susp =3D ^Z=
;
rprnt =3D ^R; werase =3D ^W; lnext =3D ^V; discard =3D ^O; min =3D 0; time =
=3D 0;
-parenb -parodd -cmspar cs8 hupcl -cstopb cread clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr -icrnl
-ixon -ixoff -iuclc -ixany -imaxbel -iutf8
-opost -olcuc -ocrnl -onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0
bs0 vt0 ff0
-isig -icanon -iexten -echo -echoe -echok -echonl -noflsh -xcase
-tostop -echoprt -echoctl -echoke -flusho -extproc


Now I upgraded to kernel 5.12.8 (after the bug) and when I plug in the
device I get:
[  417.515228] usb 1-1: new full-speed USB device number 7 using xhci_hcd
[  417.657098] usb 1-1: New USB device found, idVendor=3D10c4,
idProduct=3Dea60, bcdDevice=3D 1.00
[  417.657109] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[  417.657115] usb 1-1: Product: CP2102N USB to UART Bridge Controller
[  417.657119] usb 1-1: Manufacturer: Silicon Labs
[  417.657122] usb 1-1: SerialNumber: f06e721e74e1ea11bd9ddc2d9a583cc7
[  417.658159] cp210x 1-1:1.0: cp210x converter detected
[  417.659943] usb 1-1: cp210x converter now attached to ttyUSB0

5.12.8: Before trying to flash the ESP32 using the CP2102N:
$ stty -F /dev/ttyUSB0 -a
speed 9600 baud; rows 0; columns 0; line =3D 0;
intr =3D ^C; quit =3D ^\; erase =3D ^?; kill =3D ^U; eof =3D ^D; eol =3D <u=
ndef>;
eol2 =3D <undef>; swtch =3D <undef>; start =3D ^Q; stop =3D ^S; susp =3D ^Z=
;
rprnt =3D ^R; werase =3D ^W; lnext =3D ^V; discard =3D ^O; min =3D 1; time =
=3D 0;
-parenb -parodd -cmspar cs8 hupcl -cstopb cread clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl
ixon -ixoff -iuclc -ixany -imaxbel -iutf8
opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0=
 ff0
isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop
-echoprt echoctl echoke -flusho -extproc

5.12.8: Debug logs as a result of above stty command:
[  507.773433] cp210x ttyUSB0: cp210x_change_speed - setting baud rate to 9=
600
[  507.774216] cp210x ttyUSB0: cp210x_set_flow_control - ctrl =3D 0x00,
flow =3D 0x01
[  507.774450] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0303
[  507.774673] cp210x ttyUSB0: failed set request 0x7 status: -32
[  507.775273] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0300
[  507.775454] cp210x ttyUSB0: failed set request 0x7 status: -32

5.12.8: Debugs logs as a result of FAILED programming of ESP32:
[ 1385.733008] cp210x ttyUSB0: cp210x_change_speed - setting baud rate to 9=
600
[ 1385.733899] cp210x ttyUSB0: cp210x_set_flow_control - ctrl =3D 0x00,
flow =3D 0x01
[ 1385.734165] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0303
[ 1385.734391] cp210x ttyUSB0: failed set request 0x7 status: -32
[ 1385.735014] cp210x ttyUSB0: cp210x_set_flow_control - ctrl =3D 0x01,
flow =3D 0x40
[ 1385.735187] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0101
[ 1385.735316] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0202
[ 1385.735558] cp210x ttyUSB0: failed set request 0x7 status: -32
[ 1385.735817] cp210x ttyUSB0: cp210x_tiocmset_port - control =3D 0x0300
[ 1385.736082] cp210x ttyUSB0: failed set request 0x7 status: -32

5.12.8: After failed programming:
$ stty -F /dev/ttyUSB0 -a
speed 9600 baud; rows 0; columns 0; line =3D 0;
intr =3D ^C; quit =3D ^\; erase =3D ^?; kill =3D ^U; eof =3D ^D; eol =3D <u=
ndef>;
eol2 =3D <undef>; swtch =3D <undef>; start =3D ^Q; stop =3D ^S; susp =3D ^Z=
;
rprnt =3D ^R; werase =3D ^W; lnext =3D ^V; discard =3D ^O; min =3D 0; time =
=3D 0;
-parenb -parodd -cmspar cs8 hupcl -cstopb cread clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr -icrnl
-ixon -ixoff -iuclc -ixany -imaxbel -iutf8
-opost -olcuc -ocrnl -onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0
bs0 vt0 ff0
-isig -icanon -iexten -echo -echoe -echok -echonl -noflsh -xcase
-tostop -echoprt -echoctl -echoke -flusho -extproc


It appears that in the 5.12.8 kernel, there is a failure every time
cp210x_tiocmset_port is called resulting from this:
ret =3D cp210x_write_u16_reg(port, CP210X_SET_MHS, control);

Let me know if any other information is required.

Thanks,
David


On Wed, May 26, 2021 at 2:25 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, May 25, 2021 at 12:15:54PM -0700, David Frey wrote:
> > Hi Johan,
> >
> > I have encountered a regression in my workflow involving the CP2102N.
> > I suspect the issue could be related to changes to the cp210x Linux
> > kernel driver and I noticed that you have made many of the recent
> > changes to that driver.  If It's not clear to you from the following
> > output what the problem is, I can try to dig deeper and get some
> > additional information.
> >
> > Background:
> > I am trying to program an Espressif ESP32 development board. I have an
> > ESP32 pico kit (https://docs.espressif.com/projects/esp-idf/en/latest/e=
sp32/hw-reference/esp32/get-started-pico-kit.html)
> > and two product boards for a product that I'm working on that aren't
> > publicly available yet.  I'm using Arch Linux and uname -r reports
> > "5.12.6-arch1-1". I am able to successfully program the pico kit from
> > Linux, but I am no longer able to program the internal development
> > boards from Linux, but I can still program them from Windows.  I
> > downgraded to kernel 5.11.7 and the problem went away.
> >
> > When I plug in the ESP32 product board:
> > [  922.211705] usb 1-1: new full-speed USB device number 7 using xhci_h=
cd
> > [  922.353758] usb 1-1: New USB device found, idVendor=3D10c4,
> > idProduct=3Dea60, bcdDevice=3D 1.00
> > [  922.353770] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> > [  922.353775] usb 1-1: Product: CP2102N USB to UART Bridge Controller
> > [  922.353779] usb 1-1: Manufacturer: Silicon Labs
> > [  922.353783] usb 1-1: SerialNumber: f06e721e74e1ea11bd9ddc2d9a583cc7
> > [  922.354750] cp210x 1-1:1.0: cp210x converter detected
> > [  922.356500] usb 1-1: cp210x converter now attached to ttyUSB0
> >
> > While trying to program the ESP32 product board:
> > [ 1299.951982] cp210x ttyUSB0: failed set request 0x7 status: -32
> > [ 1299.952917] cp210x ttyUSB0: failed set request 0x7 status: -32
> > [ 1299.953247] cp210x ttyUSB0: failed set request 0x7 status: -32
> >
> > When I plug in the ESP32 pico kit:
> > [ 1856.768077] usb 1-1: new full-speed USB device number 10 using xhci_=
hcd
> > [ 1856.910089] usb 1-1: New USB device found, idVendor=3D10c4,
> > idProduct=3Dea60, bcdDevice=3D 1.00
> > [ 1856.910101] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> > [ 1856.910106] usb 1-1: Product: CP2102N USB to UART Bridge Controller
> > [ 1856.910110] usb 1-1: Manufacturer: Silicon Labs
> > [ 1856.910114] usb 1-1: SerialNumber: 1017bfe99d98e8118ea47540c3e5cfbd
> > [ 1856.911284] cp210x 1-1:1.0: cp210x converter detected
> > [ 1856.913281] usb 1-1: cp210x converter now attached to ttyUSB0
> >
> > When I plug in a second ESP32 product board:
> > [ 2066.188022] usb 1-1: new full-speed USB device number 11 using xhci_=
hcd
> > [ 2066.329913] usb 1-1: New USB device found, idVendor=3D10c4,
> > idProduct=3Dea60, bcdDevice=3D 1.00
> > [ 2066.329924] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> > [ 2066.329930] usb 1-1: Product: CP2102N USB to UART Bridge Controller
> > [ 2066.329934] usb 1-1: Manufacturer: Silicon Labs
> > [ 2066.329938] usb 1-1: SerialNumber: 700c6f5cd0e1ea11b13ddc2d9a583cc7
> > [ 2066.331152] cp210x 1-1:1.0: cp210x converter detected
> > [ 2066.332981] usb 1-1: cp210x converter now attached to ttyUSB0
> >
> > This is the relevant part of the "make install" process that fails:
> > cd /home/dfrey/.leaf/esp-idf_4.2-0/esp-idf/components/esptool_py &&
> > /usr/bin/cmake -D IDF_PATH=3D"/ho...SensorHubBX3105/build" -P
> > /home/dfrey/.leaf/esp-idf_4.2-0/esp-idf/components/esptool_py/run_espto=
ol.cmake
> > esptool.py --chip esp32 -p /dev/ttyUSB0 -b 460800
> > --before=3Ddefault_reset --after=3Dhard_reset write_flash --flash_mode =
dio
> > --flash_freq 40m --flash_size 4MB 0x8000
> > partition_table/partition-table.bin 0x1000 bootloader/bootloader.bin
> > 0x10000 SensorHub.bin
> > esptool.py v3.0
> > Serial port /dev/ttyUSB0
> > Traceback (most recent call last):
> >   File "/home/dfrey/.leaf/esp-idf_4.2-0/esp-idf/components/esptool_py/e=
sptool/esptool.py",
> > line 3969, in <module>
> >     _main()
> >   File "/home/dfrey/.leaf/esp-idf_4.2-0/esp-idf/components/esptool_py/e=
sptool/esptool.py",
> > line 3962, in _main
> >     main()
> >   File "/home/dfrey/.leaf/esp-idf_4.2-0/esp-idf/components/esptool_py/e=
sptool/esptool.py",
> > line 3551, in main
> >     esp =3D chip_class(each_port, initial_baud, args.trace)
> >   File "/home/dfrey/.leaf/esp-idf_4.2-0/esp-idf/components/esptool_py/e=
sptool/esptool.py",
> > line 271, in __init__
> >     self._port =3D serial.serial_for_url(port)
> >   File "/project/leaf-data/SensorHub-signed-21.01-0.3.1/esp-idf/xtensa-=
esp32-elf/python_env/idf4.2_py3.8_env/lib/python3.8/site-packages/serial/__=
init__.py",
> > line 90, in serial_for_url
> >     instance.open()
> >   File "/project/leaf-data/SensorHub-signed-21.01-0.3.1/esp-idf/xtensa-=
esp32-elf/python_env/idf4.2_py3.8_env/lib/python3.8/site-packages/serial/se=
rialposix.py",
> > line 338, in open
> >     self._update_rts_state()
> >   File "/project/leaf-data/SensorHub-signed-21.01-0.3.1/esp-idf/xtensa-=
esp32-elf/python_env/idf4.2_py3.8_env/lib/python3.8/site-packages/serial/se=
rialposix.py",
> > line 706, in _update_rts_state
> >     fcntl.ioctl(self.fd, TIOCMBIS, TIOCM_RTS_str)
> > BrokenPipeError: [Errno 32] Broken pipe
> > CMake Error at run_cmd.cmake:14 (message):
> >   esptool.py failed
> > Call Stack (most recent call first):
> >   run_esptool.cmake:21 (include)
> >
> > The last line in the traceback that's part of the esptool (rather than
> > pyserial) is https://github.com/espressif/esptool/blob/4fa0bd7b0d1f69f5=
ff22b043adc07c5e562a8931/esptool.py#L271
> > In ESP32 boards, the RTS is typically connected to the reset of the
> > ESP32 and the DTR is connected to GPIO0 which is used for
> > pin-strapping when coming out of reset to decide whether to boot
> > normally or enter a bootloader based programming mode.  The relevant
> > code for that is here:
> > https://github.com/espressif/esptool/blob/4fa0bd7b0d1f69f5ff22b043adc07=
c5e562a8931/esptool.py#L470
> >
> >
> > Since the problem exists in v5.12.6 and not in v5.11.7, I suspect it
> > was introduced in one of these commits that touched cp210x.c between
> > those releases:
> > c5d1448fa3532 2021-02-08 06:31 Uwe Kleine-K=C3=B6nig   USB: serial: mak=
e
> > remove callback return void
> > e2f2dea34cf16 2021-01-25 05:48 Johan Hovold       USB: serial: cp210x:
> > clean up auto-RTS handling
> > cf00ead0bde8e 2021-01-25 05:48 Johan Hovold       USB: serial: cp210x:
> > fix RTS handling
> > 6b667274f41a0 2021-01-25 05:48 Johan Hovold       USB: serial: cp210x:
> > clean up printk zero padding
> > f191c63779a0d 2021-01-25 05:48 Johan Hovold       USB: serial: cp210x:
> > clean up flow-control debug message
> > 568400b15a514 2021-01-25 05:48 Johan Hovold       USB: serial: cp210x:
> > drop shift macros
> > 8cce3bbfb4cff 2021-01-25 05:48 Johan Hovold       USB: serial: cp210x:
> > fix modem-control handling
> > 5951b85088557 2021-01-25 05:48 Johan Hovold       USB: serial: cp210x:
> > suppress modem-control errors
> > 90fa41ee4a671 2021-01-18 03:13 Johan Hovold       USB: serial: cp210x:
> > add copyright notice
> > 4c0a84cb09045 2021-01-18 03:13 Johan Hovold       USB: serial: cp210x:
> > drop unused includes
> > dc5338fc64b23 2021-01-18 03:13 Johan Hovold       USB: serial: cp210x:
> > drop short control-transfer checks
> > 03f32d7cb51b6 2021-01-18 03:13 Johan Hovold       USB: serial: cp210x:
> > update control-characters on every ch..
> > f61309d9c96a3 2021-01-18 03:13 Johan Hovold       USB: serial: cp210x:
> > set IXOFF thresholds
> > 7748feffcd80f 2021-01-18 03:13 Wang Sheng Long    USB: serial: cp210x:
> > add support for software flow control
> >
> >
> > Within that range of commits, I noticed that there is already a commit
> > which mentions the same error that I'm seeing in the dmesg output and
> > I understand that it should be fixing this problem:
> > $ git log -n 1 5951b8508855799fbb2d6a9553ab3b7af595ea94
> > commit 5951b8508855799fbb2d6a9553ab3b7af595ea94
> > Author: Johan Hovold <johan@kernel.org>
> > Date:   Mon Jan 25 14:48:11 2021 +0100
> >
> >     USB: serial: cp210x: suppress modem-control errors
> >
> >     The CP210X_SET_MHS request cannot be used to control RTS when hardw=
are
> >     flow control (auto-RTS) is enabled and instead returns an error whi=
ch is
> >     currently logged as:
> >
> >             cp210x ttyUSB0: failed set request 0x7 status: -32
> >
> >     when opening and closing a port (and on TIOCMSET requests).
> >
> >     Add a crtscts flag to keep track of the hardware flow-control setti=
ng
> >     and use it to suppress any request to change RTS when auto-RTS is
> >     enabled.
> >
> >     Note that RTS is still deasserted when disabling the UART as part o=
f
> >     close.
> >
> >     Reported-by: Pho Tran <pho.tran@silabs.com>
> >     Signed-off-by: Johan Hovold <johan@kernel.org>
> >
> >
> > Sorry for the long rambling e-mail! I hope this is helpful.  If there
> > is anything else I can do to assist, please let me know.  Thanks for
> > all your work on the Linux kernel.
>
> Thanks for the detailed report.
>
> Do you mind if we keep linux-usb@vger.kernel.org on CC? I kept your
> entire mail above, so just add the usb list when responding if that's
> ok.
>
> The fact that your device now starts returning this error on
> modem-control requests is a bit puzzling. It would seem that auto-RTS is
> still enabled in the device for some reason, perhaps due to some
> setting not being allowed by the device.
>
> I just verified with a CP2102N here and everything appears to work as
> expected as it also does with some of your boards. Could the CP2102N in
> the board in question be configured differently in EEPROM?
>
> We should also determine which terminal settings you use.
>
> Could you enable debugging in the driver through debugfs:
>
>         echo module cp210x +p > /sys/kernel/debug/dynamic_debug/control
>
> or when loading the module:
>
>         modprobe cp210x dyndbg=3D=3Dp
>
> Then copy the relevant bits of the logs from when connecting the device
> and running the script.
>
> Please also include the output of "stty -F /dev/ttyUSB0 -a" after
> plugging the device in and before and after running the script.
>
> Johan
