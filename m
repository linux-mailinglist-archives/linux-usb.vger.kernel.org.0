Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3048D66F
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 16:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfHNOnA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 10:43:00 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38511 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfHNOnA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 10:43:00 -0400
Received: by mail-ot1-f67.google.com with SMTP id r20so33035233ota.5
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2019 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=+EJA0NIUguZeOmpLRItJGgE4dHVMq7hDYflzvDXL9fg=;
        b=vP9AaHJSlbYLVW60/wZH8mWN4hWuJKvuSqbW2KDTmmZy3oERKLq6JhYWVlJ3V1PhjI
         RRedt4xXnyo8silX5AEDodpDqc2drh+gZEnYCrKs2V6pPLXSa1OKU9HzwB75AHQFc2G+
         26j1odVzP51zm7/7QiVAInIkKlKNNcGUHMIjC85oke3vFRM5bKaoBp/kHqIGUj/i91Tn
         aDoQ14GtJ21eT2JSEK6ysdV2LvVOiTJCSy8viBIBKj592mrZq4UVSFF1yoeJioJWl3ew
         zzjIf5uV3nXErx2x8A7WNs76cD45MM0mmS48epIFascWVsNyGZwoZCxqrHBKQn6HeYAS
         4f/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=+EJA0NIUguZeOmpLRItJGgE4dHVMq7hDYflzvDXL9fg=;
        b=n8I1nJkxsu4iuWLFlUB+8hUVR3uGEeCxf0G04US2++sdq26YPdJwr3GOAOru05p6ei
         lO89ExKCtP1crbUt2UqQ58MmFUKFVTpYPvdn7XgML6/qLnQ9M8YCnhshlejzp/VCEwqb
         N3lT4U2knNOFYpRh/rn7FEBhLQde1J4EB4ogs6p6odp5XDyX5ZxcDWu87OZ6GF5YFL9f
         pOO4PzkXEZp37gp2gQQCgf8jcuwfz1j42zBZ2DIA/Oi2Q4cTspFDHvqqsAvIHaenoBXu
         ZCmBI6XxoLl/Hluc59omd/Yysphg5ebxVD1lG42Vs8uq2oaFdi5qVuzES8DdeRucK8WO
         YW1w==
X-Gm-Message-State: APjAAAUEhtGAs+2Tv6tybYxUY91PgJAebjAqQCMd5J4nEi/AsLH7KsTb
        gaUQ1L1OIPf4sZ88OCJinUnVClcWYliXX2RoBA53VIWs
X-Google-Smtp-Source: APXvYqylsXuFw6Z6TDn5QEhc5AaXpoEU1dzCqiua7gcRPBlzro2+ZmjdHsVMV134Dc1VArxHrApgrP/TATc8Slk4nGw=
X-Received: by 2002:a6b:8f0b:: with SMTP id r11mr296714iod.70.1565793778506;
 Wed, 14 Aug 2019 07:42:58 -0700 (PDT)
MIME-Version: 1.0
From:   Francisco Ferreiro <franco.ferreiro@gmail.com>
Date:   Wed, 14 Aug 2019 11:42:53 -0300
Message-ID: <CAE82-Hvq=Cj0WRZyJXw5mFuCYfL97DYjMGAKuLuKcjAqeXCPxw@mail.gmail.com>
Subject: TL-MR3420 with OpenWRT with a huawei E353 usb dongle
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi guys, this is me trying to setup a tp-link TL-MR3420 with OpenWRT
with a huawei E353 usb dongle

hopefully I will try to setup a multiwan  along with this two more
sources to get redundant access to internet
  - a cell phone (either tethering or if possible via USB (*))
  - a fiber based dsl service accesible via ethernet.

after flashing the OpenWRT and setting up a little bit I made the
dongle work manually (via ttyUSB0) (log below) but cant get it to
automatically start connected from boot up

help with this dongle and maybe with this (*) one too, would be highly
appreciated
have some logs below
and let me know if you need something else

thanks in advance for your help
best
Franco

[   25.113754] usb 1-1: new high-speed USB device number 3 using ehci-platform
[   25.327869] usbserial_generic 1-1:1.0: The "generic" usb-serial
driver is only for testing and one-off prototypes.
[   25.338456] usbserial_generic 1-1:1.0: Tell
linux-usb@vger.kernel.org to add your device to a proper driver.
[   25.348448] usbserial_generic 1-1:1.0: generic converter detected
[   25.354938] usb 1-1: generic converter now attached to ttyUSB0
[   25.361410] usbserial_generic 1-1:1.1: The "generic" usb-serial
driver is only for testing and one-off prototypes.
[   25.371975] usbserial_generic 1-1:1.1: Tell
linux-usb@vger.kernel.org to add your device to a proper driver.
[   25.381965] usbserial_generic 1-1:1.1: device has no bulk endpoints
[   25.388921] usbserial_generic 1-1:1.2: The "generic" usb-serial
driver is only for testing and one-off prototypes.
[   25.399477] usbserial_generic 1-1:1.2: Tell
linux-usb@vger.kernel.org to add your device to a proper driver.
[   25.409453] usbserial_generic 1-1:1.2: generic converter detected
[   25.415898] usb 1-1: generic converter now attached to ttyUSB1
[   25.422331] usbserial_generic 1-1:1.3: The "generic" usb-serial
driver is only for testing and one-off prototypes.
[   25.432887] usbserial_generic 1-1:1.3: Tell
linux-usb@vger.kernel.org to add your device to a proper driver.
[   25.442869] usbserial_generic 1-1:1.3: generic converter detected
[   25.449323] usb 1-1: generic converter now attached to ttyUSB2
[   25.455865] usb-storage 1-1:1.4: USB Mass Storage device detected
[   25.923729] scsi host0: usb-storage 1-1:1.4
[   25.928826] usb-storage 1-1:1.5: USB Mass Storage device detected
[   25.983950] scsi host1: usb-storage 1-1:1.5
[   26.986403] scsi 0:0:0:0: CD-ROM            HUAWEI   Mass Storage
  2.31 PQ: 0 ANSI: 2
[   27.074885] scsi 1:0:0:0: Direct-Access     HUAWEI   SD Storage
  2.31 PQ: 0 ANSI: 2
[   27.089310] sd 1:0:0:0: [sda] Attached SCSI removable disk


config interface 'HWE353'
option proto '3g'
option service 'umts'
option apn 'adslxxxx'
option username 'xxxx@adslxx'
option password 'xxxxxxx'
option dialnumber '*99#'
option delegate '0'
option keepalive '6 5'
option demand '0'
option maxwait '20'
option ipv6 'auto'
option device '/dev/ttyUSB0'



root@fsfbpinar:~# lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ohci-platform/1p, 12M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-platform/1p, 480M
    |__ Port 1: Dev 3, If 0, Class=Vendor Specific Class,
Driver=usbserial_generic, 480M
    |__ Port 1: Dev 3, If 1, Class=Vendor Specific Class, Driver=, 480M
    |__ Port 1: Dev 3, If 2, Class=Vendor Specific Class,
Driver=usbserial_generic, 480M
    |__ Port 1: Dev 3, If 3, Class=Vendor Specific Class,
Driver=usbserial_generic, 480M
    |__ Port 1: Dev 3, If 4, Class=Mass Storage, Driver=usb-storage, 480M
    |__ Port 1: Dev 3, If 5, Class=Mass Storage, Driver=usb-storage, 480M


Wed Jul 31 20:37:03 2019 daemon.info dnsmasq-dhcp[11398]: read
/etc/ethers - 0 addresses
Wed Jul 31 20:37:04 2019 daemon.warn odhcpd[1347]: DHCPV6 SOLICIT
IA_NA from 000100011cc45039c46e1f1ff20a on br-lan: ok
fd0a:d561:9ed::63b/128
Wed Jul 31 20:37:04 2019 daemon.notice netifd: HWE353 (23775): Trying
to set mode
Wed Jul 31 20:37:04 2019 daemon.notice pppd[23800]: pppd 2.4.7 started
by root, uid 0
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: abort on (BUSY)
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: abort on (NO CARRIER)
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: abort on (ERROR)
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: report (CONNECT)
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: timeout set to 10 seconds
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: send (AT&F^M)
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: expect (OK)
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: AT&F^M^M
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: OK
Wed Jul 31 20:37:05 2019 local2.info chat[23802]:  -- got it
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: send (ATE1^M)
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: expect (OK)
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: ^M
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: ATE1^M^M
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: OK
Wed Jul 31 20:37:05 2019 local2.info chat[23802]:  -- got it
Wed Jul 31 20:37:05 2019 local2.info chat[23802]: send
(AT+CGDCONT=1,"IP","adslmovil"^M)
Wed Jul 31 20:37:06 2019 daemon.warn odhcpd[1347]: DHCPV6 SOLICIT
IA_NA from 000100011cc45039c46e1f1ff20a on br-lan: ok
fd0a:d561:9ed::63b/128
Wed Jul 31 20:37:06 2019 local2.info chat[23802]: timeout set to 30 seconds
Wed Jul 31 20:37:06 2019 local2.info chat[23802]: expect (OK)
Wed Jul 31 20:37:06 2019 local2.info chat[23802]: ^M
Wed Jul 31 20:37:06 2019 local2.info chat[23802]:
AT+CGDCONT=1,"IP","adslmovil"^M^M
Wed Jul 31 20:37:06 2019 local2.info chat[23802]: OK
Wed Jul 31 20:37:06 2019 local2.info chat[23802]:  -- got it
Wed Jul 31 20:37:06 2019 local2.info chat[23802]: send (ATD*99#^M)
Wed Jul 31 20:37:06 2019 local2.info chat[23802]: expect (CONNECT)
Wed Jul 31 20:37:06 2019 local2.info chat[23802]: ^M
Wed Jul 31 20:37:06 2019 local2.info chat[23802]: ATD*99#^M^M
Wed Jul 31 20:37:06 2019 local2.info chat[23802]: CONNECT
Wed Jul 31 20:37:06 2019 local2.info chat[23802]:  -- got it
Wed Jul 31 20:37:06 2019 local2.info chat[23802]: send ( ^M)
Wed Jul 31 20:37:06 2019 daemon.info pppd[23800]: Serial connection established.
Wed Jul 31 20:37:06 2019 kern.info kernel: [ 2274.172148] 3g-HWE353:
renamed from ppp0
Wed Jul 31 20:37:06 2019 daemon.info dnsmasq-dhcp[11398]:
DHCPINFORM(br-lan) 192.168.28.119 d0:50:99:23:6d:78
Wed Jul 31 20:37:06 2019 daemon.info dnsmasq-dhcp[11398]:
DHCPACK(br-lan) 192.168.28.119 d0:50:99:23:6d:78 franco-PC
Wed Jul 31 20:37:06 2019 daemon.info pppd[23800]: Using interface 3g-HWE353
Wed Jul 31 20:37:06 2019 daemon.notice pppd[23800]: Connect: 3g-HWE353
<--> /dev/ttyUSB0
Wed Jul 31 20:37:07 2019 daemon.info pppd[23800]: CHAP authentication
succeeded: Welcome!!
Wed Jul 31 20:37:07 2019 daemon.notice pppd[23800]: CHAP
authentication succeeded
Wed Jul 31 20:37:10 2019 daemon.warn odhcpd[1347]: DHCPV6 SOLICIT
IA_NA from 000100011cc45039c46e1f1ff20a on br-lan: ok
fd0a:d561:9ed::63b/128
Wed Jul 31 20:37:10 2019 daemon.warn pppd[23800]: Could not determine
remote IP address: defaulting to 10.64.64.64
Wed Jul 31 20:37:10 2019 daemon.notice pppd[23800]: local  IP address
190.132.185.44
Wed Jul 31 20:37:10 2019 daemon.notice pppd[23800]: remote IP address
10.64.64.64
Wed Jul 31 20:37:10 2019 daemon.notice pppd[23800]: primary   DNS
address 200.40.30.245
Wed Jul 31 20:37:10 2019 daemon.notice pppd[23800]: secondary DNS
address 200.40.220.245
Wed Jul 31 20:37:10 2019 daemon.notice netifd: Network device
'3g-HWE353' link is up
Wed Jul 31 20:37:10 2019 daemon.notice netifd: Interface 'HWE353' is now up
Wed Jul 31 20:37:10 2019 daemon.info dnsmasq[11398]: reading
/tmp/resolv.conf.auto
Wed Jul 31 20:37:10 2019 daemon.info dnsmasq[11398]: using local
addresses only for domain test
Wed Jul 31 20:37:10 2019 daemon.info dnsmasq[11398]: using local
addresses only for domain onion
Wed Jul 31 20:37:10 2019 daemon.info dnsmasq[11398]: using local
addresses only for domain localhost
Wed Jul 31 20:37:10 2019 daemon.info dnsmasq[11398]: using local
addresses only for domain local
Wed Jul 31 20:37:10 2019 daemon.info dnsmasq[11398]: using local
addresses only for domain invalid
Wed Jul 31 20:37:10 2019 daemon.info dnsmasq[11398]: using local
addresses only for domain bind
Wed Jul 31 20:37:10 2019 daemon.info dnsmasq[11398]: using local
addresses only for domain lan
Wed Jul 31 20:37:10 2019 daemon.info dnsmasq[11398]: using nameserver
200.40.30.245#53
Wed Jul 31 20:37:10 2019 daemon.info dnsmasq[11398]: using nameserver
200.40.220.245#53
Thu Aug  1 18:22:31 2019 daemon.warn odhcpd[1347]: DHCPV6 SOLICIT
IA_NA from 000100011cc45039c46e1f1ff20a on br-lan: ok
fd0a:d561:9ed::63b/128
Thu Aug  1 18:22:32 2019 daemon.info pppd[23800]: System time change detected.
Thu Aug  1 18:22:35 2019 daemon.warn odhcpd[1347]: DHCPV6 REQUEST
IA_NA from 000100011cc45039c46e1f1ff20a on br-lan: ok
fd0a:d561:9ed::63b/128
Thu Aug  1 18:22:36 2019 daemon.info dnsmasq[11398]: read /etc/hosts -
4 addresses
Thu Aug  1 18:22:36 2019 daemon.info dnsmasq[11398]: read
/tmp/hosts/odhcpd - 1 addresses
Thu Aug  1 18:22:36 2019 daemon.info dnsmasq[11398]: read
/tmp/hosts/dhcp.cfg01411c - 2 addresses
Thu Aug  1 18:22:36 2019 daemon.info dnsmasq-dhcp[11398]: read
/etc/ethers - 0 addresses
